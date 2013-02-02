Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1U1RIo-0006is-EQ
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Feb 2013 01:50:05 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Feb 2013 16:34:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,588,1355126400"; d="scan'208";a="251682301"
Received: from unknown (HELO localhost) ([10.255.12.85])
	by azsmga001.ch.intel.com with ESMTP; 01 Feb 2013 16:34:07 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2013 18:34:06 -0600
Message-Id: <ca2f510bbb4652ed5e161c7c201f8f77f19c8355.1359764964.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1359764964.git.tom.zanussi@linux.intel.com>
References: <cover.1359764964.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] systemtap: make session copy constructor pick up kernel builddir
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
X-List-Received-Date: Sat, 02 Feb 2013 00:50:07 -0000
X-List-Received-Date: Sat, 02 Feb 2013 00:50:07 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

When using the stap -r option with a full path to a kernel build tree
(i.e. one starting with /) along with --remote to execute the script
on a remote system, the build tree that I passed in was ignored and it
used some default locally-constructed location instead:

Checking "/lib/modules/3.4.24-yocto-standard/build/.config" failed
with error: No such file or directory

I traced it down to the s->clone() call in the path
ssh_remote->connect()->set_child_fds(), which unconditionally invokes
the following in the systemtap_session copy constructor:

   kernel_build_tree = "/lib/modules/" + kernel_release + "/build";

That doesn't seem correct - it seems to me it should be preserving the
value from the passed-in session object, which is what this does.

Fixes [YOCTO #3756]

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 .../systemtap/systemtap/copy-constructor-builddir.patch | 17 +++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb          |  2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc         |  1 +
 3 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/copy-constructor-builddir.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/copy-constructor-builddir.patch b/meta/recipes-kernel/systemtap/systemtap/copy-constructor-builddir.patch
new file mode 100644
index 0000000..27a569b
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/copy-constructor-builddir.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Pending
+
+Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
+
+Index: git/session.cxx
+===================================================================
+--- git.orig/session.cxx
++++ git/session.cxx
+@@ -254,7 +254,7 @@ systemtap_session::systemtap_session (co
+   last_token (0)
+ {
+   release = kernel_release = kern;
+-  kernel_build_tree = "/lib/modules/" + kernel_release + "/build";
++  kernel_build_tree = other.kernel_build_tree;
+   architecture = machine = normalize_machine(arch);
+   setup_kernel_release(kern.c_str());
+   native_build = false; // assumed; XXX: could be computed as in check_options()
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index a490a2e..7fc92c8 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "elfutils sqlite3 systemtap-native"
 DEPENDS_class-native = "elfutils-native sqlite3-native gettext-native"
 DEPENDS_class-nativesdk = "nativesdk-elfutils nativesdk-sqlite3 nativesdk-gettext"
 
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
             --without-nss --without-avahi \
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 3e7bc7b..731b755 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -6,6 +6,7 @@ PV = "1.8+git${SRCPV}"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git;protocol=git \
            file://docproc-build-fix.patch \
+           file://copy-constructor-builddir.patch \
           "
 
 FILESPATH = "${FILE_DIRNAME}/systemtap"
-- 
1.7.11.4



