Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1T7ZDj-0002aI-FX
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 23:57:44 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 31 Aug 2012 14:45:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,349,1344236400"; d="scan'208";a="140306123"
Received: from unknown (HELO localhost) ([10.255.13.47])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Aug 2012 14:45:24 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, sgw@linux.intel.com
Date: Fri, 31 Aug 2012 16:45:22 -0500
Message-Id: <eccc83b0b5516e68bee07c7c376bf21e40fb0b9c.1346448608.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1346448608.git.tom.zanussi@intel.com>
References: <cover.1346448608.git.tom.zanussi@intel.com>
Subject: [PATCH 1/1] crosstap: new script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2012 21:57:44 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This script makes it easy to run a systemtap script on a remote target
from a build host.

The script itself contains documentation on basic setup and usage -
see that for details.  In a nutshell, if you have a systemtap script
on the build host, this script allows that systemtap script to be
compiled and run on the target host and for the output appear on the
host terminal.

The crosstap script requires to an sdk build of the target (or a build
with 'tools-profile' added to EXTRA_IMAGE_FEATURES) because it needs
to be able to run the native systemtap built by the systemtap recipe,
which in turn needs access to the kernel built for the target in order
to build the kernel modules that implement the systemtap probe
specified by the systemtap script and which ultimately get shipped to
the target and insmod'ed there.

The crosstap script also needs to be able to ssh to the target host in
order insert the modules on the target, so the target system needs to
support incoming ssh connections.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 scripts/crosstap | 148 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100755 scripts/crosstap

diff --git a/scripts/crosstap b/scripts/crosstap
new file mode 100755
index 0000000..783bf2f
--- /dev/null
+++ b/scripts/crosstap
@@ -0,0 +1,148 @@
+#!/bin/bash
+#
+# Run a systemtap script on remote target
+#
+# Examples (run on build host, target is 192.168.1.xxx):
+#   $ source oe-init-build-env"
+#   $ cd ~/my/systemtap/scripts"
+#
+#   $ crosstap root@192.168.1.xxx myscript.stp"
+#   $ crosstap root@192.168.1.xxx myscript-with-args.stp 99 ninetynine"
+#
+# Copyright (c) 2012, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+# See the GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+function usage() {
+    echo "Usage: $0 <user@hostname> <sytemtap-script> [additional systemtap-script args]"
+}
+
+function setup_usage() {
+    echo ""
+    echo "'crosstap' requires a local sdk build of the target system"
+    echo "(or a build that includes 'tools-profile') in order to build"
+    echo "kernel modules that can probe the target system."
+    echo ""
+    echo "Practically speaking, that means you need to do the following:"
+    echo "  - If you're running a pre-built image, download the release"
+    echo "    and/or BSP tarballs used to build the image."
+    echo "  - If you're working from git sources, just clone the metadata"
+    echo "    and BSP layers needed to build the image you'll be booting."
+    echo "  - Make sure you're properly set up to build a new image (see"
+    echo "    the BSP README and/or the widely available basic documentation"
+    echo "    that discusses how to build images)."
+    echo "  - Build an -sdk version of the image e.g.:"
+    echo "      $ bitbake core-image-sato-sdk"
+    echo "  OR"
+    echo "  - Build a non-sdk image but include the profiling tools:"
+    echo "      [ edit local.conf and add 'tools-profile' to the end of"
+    echo "        the EXTRA_IMAGE_FEATURES variable ]"
+    echo "      $ bitbake core-image-sato"
+    echo ""
+    echo "  [ NOTE that 'crosstap' needs to be able to ssh into the target"
+    echo "    system, which isn't enabled by default in -minimal images. ]"
+    echo ""
+    echo "Once you've build the image on the host system, you're ready to"
+    echo "boot it (or the equivalent pre-built image) and use 'crosstap'"
+    echo "to probe it (you need to source the environment as usual first):"
+    echo ""
+    echo "    $ source oe-init-build-env"
+    echo "    $ cd ~/my/systemtap/scripts"
+    echo "    $ crosstap root@192.168.1.xxx myscript.stp"
+    echo ""
+}
+
+function systemtap_target_arch() {
+    SYSTEMTAP_TARGET_ARCH=$1
+    case $SYSTEMTAP_TARGET_ARCH in
+        i?86)
+            SYSTEMTAP_TARGET_ARCH="i386"
+            ;;
+        x86_64*)
+            SYSTEMTAP_TARGET_ARCH="x86_64"
+            ;;
+        arm*)
+            SYSTEMTAP_TARGET_ARCH="arm"
+            ;;
+        powerpc*)
+            SYSTEMTAP_TARGET_ARCH="powerpc"
+            ;;
+        *)
+            ;;
+    esac
+}
+
+if [ $# -lt 2 ]; then
+	usage
+	exit 1
+fi
+
+if [ -z "$BUILDDIR" ]; then
+    echo "Error: Unable to find the BUILDDIR environment variable."
+    echo "Did you forget to source your build system environment setup script?"
+    exit 1
+fi
+
+pushd $PWD
+cd $BUILDDIR
+BITBAKE_VARS=`bitbake -e virtual/kernel`
+popd
+
+STAGING_BINDIR_TOOLCHAIN=$(echo "$BITBAKE_VARS" | grep ^STAGING_BINDIR_TOOLCHAIN \
+  | cut -d '=' -f2 | cut -d '"' -f2)
+STAGING_BINDIR_TOOLPREFIX=$(echo "$BITBAKE_VARS" | grep ^TARGET_PREFIX \
+  | cut -d '=' -f2 | cut -d '"' -f2)
+SYSTEMTAP_HOST_INSTALLDIR=$(echo "$BITBAKE_VARS" | grep ^STAGING_DIR_NATIVE \
+  | cut -d '=' -f2 | cut -d '"' -f2)
+TARGET_ARCH=$(echo "$BITBAKE_VARS" | grep ^TRANSLATED_TARGET_ARCH \
+  | cut -d '=' -f2 | cut -d '"' -f2)
+TARGET_KERNEL_BUILDDIR=$(echo "$BITBAKE_VARS" | grep ^B= \
+  | cut -d '=' -f2 | cut -d '"' -f2)
+
+systemtap_target_arch "$TARGET_ARCH"
+
+if [ ! -d $TARGET_KERNEL_BUILDDIR ] ||
+   [ ! -f $TARGET_KERNEL_BUILDDIR/vmlinux ]; then
+    echo -e "\nError: No target kernel build found."
+    echo -e "Did you forget to create a local build of your image?"
+    setup_usage
+    exit 1
+fi
+
+if [ ! -f $SYSTEMTAP_HOST_INSTALLDIR/usr/bin/stap ]; then
+    echo -e "\nError: Native (host) systemtap not found."
+    echo -e "Did you accidentally build a local non-sdk image? (or forget to"
+    echo -e "add 'tools-profile' to EXTRA_IMAGE_FEATURES in your local.conf)?"
+    setup_usage
+    exit 1
+fi
+
+target_user_hostname="$1"
+full_script_name="$2"
+script_name=$(basename "$2")
+script_base=${script_name%.*}
+shift 2
+
+${SYSTEMTAP_HOST_INSTALLDIR}/usr/bin/stap \
+  -a ${SYSTEMTAP_TARGET_ARCH} \
+  -B CROSS_COMPILE="${STAGING_BINDIR_TOOLCHAIN}/${STAGING_BINDIR_TOOLPREFIX}" \
+  -r ${TARGET_KERNEL_BUILDDIR} \
+  -I ${SYSTEMTAP_HOST_INSTALLDIR}/usr/share/systemtap/tapset \
+  -R ${SYSTEMTAP_HOST_INSTALLDIR}/usr/share/systemtap/runtime \
+  --remote=$target_user_hostname \
+  -m $script_base \
+   $full_script_name "$@"
+
+exit 0
-- 
1.7.11.4



