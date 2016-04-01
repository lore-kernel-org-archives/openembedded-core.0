Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A1FE26057A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 16:26:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 01 Apr 2016 09:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,427,1455004800"; d="scan'208";a="949731272"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.90])
	by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2016 09:26:28 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Apr 2016 10:27:10 -0600
Message-Id: <1459528030-24681-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] opkg-utils: opkg-build exit when fail to list files.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2016 16:26:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We have an issue when ls segfaults in some cases [1] so it's
better to detect the failure at this level instead of continue
the build process.

[YOCTO #8926]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8926#c0

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../opkg-build-Exit-when-fail-to-list-files.patch  | 45 ++++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  4 +-
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/opkg-build-Exit-when-fail-to-list-files.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/opkg-build-Exit-when-fail-to-list-files.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/opkg-build-Exit-when-fail-to-list-files.patch
new file mode 100644
index 0000000..6c66902
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/opkg-build-Exit-when-fail-to-list-files.patch
@@ -0,0 +1,45 @@
+We have an issue when ls segfaults in some cases [1] so it's
+better to detect the failure at this level instead of continue
+the build process.
+
+[YOCTO #8926]
+
+Upstream-Status: Submitted [2]
+
+[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8926#c0
+[2] https://groups.google.com/forum/#!topic/opkg-devel/cmX02bgHZms
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+---
+ opkg-build | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/opkg-build b/opkg-build
+index 98008b6..a9ccad2 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -53,6 +53,10 @@ pkg_appears_sane() {
+ 		echo "*** Warning: The following files have names ending in '~'.
+ You probably want to remove them: " >&2
+ 		ls -ld $tilde_files
++		if [ $? -ne 0 ]; then
++			echo "*** Error: Fail to list files have names ending in '~'."
++			exit 1
++		fi
+ 		echo >&2
+ 	    else
+ 		echo "*** Removing the following files: $tilde_files"
+@@ -66,6 +70,10 @@ You probably want to remove them: " >&2
+ 		echo "*** Warning: The following files have a UID greater than 99.
+ You probably want to chown these to a system user: " >&2
+ 		ls -ld $large_uid_files
++		if [ $? -ne 0 ]; then
++			echo "*** Error: Fail to list files have a UID greater than 99."
++			exit 1
++		fi
+ 		echo >&2
+ 	fi
+ 	    
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 1bc561c..22f45a1 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -10,8 +10,8 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 SRCREV = "53274f087565fd45d8452c5367997ba6a682a37a"
 PV = "0.1.8+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/opkg-utils"
-
+SRC_URI = "git://git.yoctoproject.org/opkg-utils \
+           file://opkg-build-Exit-when-fail-to-list-files.patch"
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 
 S = "${WORKDIR}/git"
-- 
2.1.4


