Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tjf66-0003h6-V3
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 00:55:19 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so2446999pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Pajv4MBOjJifiGWp6UBiME/vMPp9WTDJm5/dul5PQC8=;
	b=x0JUk8G2hkoJbaf8UFXKiBuUDJQ4nGwNigoQkx9E3XVPVNkho1AajYwADHEJGPYIRZ
	68b8Mad/5UK5KDFqW+fsdKm24FxDrazvyhlvvp7D5tjWqlUmHsdPp4zIdjPpOLHHfbZu
	bi3PUu1BSp4au3W+iC24ha8WAaZ+ithlEs548x2fZvqyqfJpt2Ds5cCNWIQB2hAR3ph9
	PG5o1lc1oPWNnIe+UBak4UnHMLBWTEAh/P9sWtsvPeE9hmt9w3bZy6J5UDvebTCui45n
	rZWRal/07g63Rsyjyu6BBjbPddStqV0y3OnSyNyi+GPu+L9pI2lEml0ZGMRBUKTvvYvq
	MD/w==
Received: by 10.68.242.3 with SMTP id wm3mr20236217pbc.44.1355528441496;
	Fri, 14 Dec 2012 15:40:41 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id se4sm3676628pbb.13.2012.12.14.15.40.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 15:40:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 00:40:39 +0100
Message-Id: <010a1e0e991f283dac3ee1e768cedef3a94196cd.1355475937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
Subject: [PATCH 01/10] scripts/sstate-diff-machines.sh: add simple script to compare sstate checksums between MACHINEs
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
X-List-Received-Date: Fri, 14 Dec 2012 23:55:19 -0000

* takes tmpdir, machines and targets from command arguments or env variables

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-diff-machines.sh | 107 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100755 scripts/sstate-diff-machines.sh

diff --git a/scripts/sstate-diff-machines.sh b/scripts/sstate-diff-machines.sh
new file mode 100755
index 0000000..931f9d7
--- /dev/null
+++ b/scripts/sstate-diff-machines.sh
@@ -0,0 +1,107 @@
+#!/bin/sh
+
+# Used to compare sstate checksums between MACHINES
+# Execute script and compare generated list.M files
+
+# It's also usefull to keep older sstate checksums
+# to be able to find out why something is rebuilding
+# after updating metadata
+
+# $ diff \
+#     sstate-diff/1349348392/fake-cortexa8/list.M \
+#     sstate-diff/1349348392/fake-cortexa9/list.M \
+#     | wc -l
+# 538
+
+# Then to compare sigdata use something like:
+# $ ls sstate-diff/1349348392/*/armv7a-vfp-neon*/linux-libc-headers/*do_configure*sigdata*
+#   sstate-diff/1349348392/fake-cortexa8/armv7a-vfp-neon-oe-linux-gnueabi/linux-libc-headers/3.4.3-r0.do_configure.sigdata.cb73b3630a7b8191e72fc469c5137025
+#   sstate-diff/1349348392/fake-cortexa9/armv7a-vfp-neon-oe-linux-gnueabi/linux-libc-headers/3.4.3-r0.do_configure.sigdata.f37ada177bf99ce8af85914df22b5a0b
+# $ bitbake-diffsigs stamps.1349348392/*/armv7a-vfp-neon*/linux-libc-headers/*do_configure*sigdata*
+#   basehash changed from 8d0bd67bb1da6f68717760fc3ef43171 to e869fa61426e88e9c30726ba88a1216a
+#   Variable TUNE_CCARGS value changed from  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 to  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a9
+
+# Global vars
+tmpdir=
+machines=
+targets=
+default_machines="qemuarm qemux86 qemux86-64"
+default_targets="core-image-base"
+
+usage () {
+  cat << EOF
+Welcome to utility to compare sstate checksums between different MACHINEs.
+$0 <OPTION>
+
+Options:
+  -h, --help
+        Display this help and exit.
+
+  --tmpdir=<tmpdir>
+        Specify tmpdir, will use the environment variable TMPDIR if it is not specified.
+        Something like /OE/oe-core/tmp-eglibc (no / at the end).
+
+  --machines=<machines>
+        List of MACHINEs separated by space, will use the environment variable MACHINES if it is not specified.
+        Default value is "qemuarm qemux86 qemux86-64".
+
+  --targets=<targets>
+        List of targets separated by space, will use the environment variable TARGETS if it is not specified.
+        Default value is "core-image-base".
+EOF
+}
+
+# Print error information and exit.
+echo_error () {
+  echo "ERROR: $1" >&2
+  exit 1
+}
+
+while [ -n "$1" ]; do
+  case $1 in
+    --tmpdir=*)
+      tmpdir=`echo $1 | sed -e 's#^--tmpdir=##' | xargs readlink -e`
+      [ -d "$tmpdir" ] || echo_error "Invalid argument to --tmpdir"
+      shift
+        ;;
+    --machines=*)
+      machines=`echo $1 | sed -e 's#^--machines="*\([^"]*\)"*#\1#'`
+      shift
+        ;;
+    --targets=*)
+      targets=`echo $1 | sed -e 's#^--targets="*\([^"]*\)"*#\1#'`
+      shift
+        ;;
+    --help|-h)
+      usage
+      exit 0
+        ;;
+    *)
+      echo "Invalid arguments $*"
+      echo_error "Try '$0 -h' for more information."
+        ;;
+  esac
+done
+
+# tmpdir directory, use environment variable TMPDIR
+# if it was not specified, otherwise, error.
+[ -n "$tmpdir" ] || tmpdir=$TMPDIR
+[ -n "$tmpdir" ] || echo_error "No tmpdir found!"
+[ -d "$tmpdir" ] || echo_error "Invalid tmpdir \"$tmpdir\""
+[ -n "$machines" ] || machines=$MACHINES
+[ -n "$machines" ] || machines=$default_machines
+[ -n "$targets" ] || targets=$TARGETS
+[ -n "$targets" ] || targets=$default_targets
+
+OUTPUT=${tmpdir}/sstate-diff/`date "+%s"`
+
+for M in ${machines}; do
+  find ${tmpdir}/stamps/ -name \*sigdata\* | xargs rm -f
+  mkdir -p ${OUTPUT}/${M}
+  export MACHINE=${M}; bitbake -S ${targets} | tee -a ${OUTPUT}/${M}/log;
+  cp -ra ${tmpdir}/stamps/* ${OUTPUT}/${M}
+  find ${OUTPUT}/${M} -name \*sigdata\* | sed "s#${OUTPUT}/${M}/##g" | sort > ${OUTPUT}/${M}/list
+  M_UNDERSCORE=`echo ${M} | sed 's/-/_/g'`
+  sed "s/${M_UNDERSCORE}/MACHINE/g; s/${M}/MACHINE/g" ${OUTPUT}/${M}/list | sort > ${OUTPUT}/${M}/list.M
+  find ${tmpdir}/stamps/ -name \*sigdata\* | xargs rm -f
+done
-- 
1.8.0.2



