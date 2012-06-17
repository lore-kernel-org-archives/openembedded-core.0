Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8Nz-0008R9-Hr
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103301"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:39:55 -0700
Message-Id: <2aedc40d6e34511fc120292a5f52b88a180d84e2.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 11/23] zypper: Fix build on uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Jun 2012 05:50:55 -0000

From: Khem Raj <raj.khem@gmail.com>

uclibc does not have rpmatch() so we define
it if zypper is being compiled for uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/zypper/zypper/rpmatch.patch |   23 +++++++++++++++++++++
 meta/recipes-extended/zypper/zypper_git.bb        |    2 +
 2 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/zypper/zypper/rpmatch.patch

diff --git a/meta/recipes-extended/zypper/zypper/rpmatch.patch b/meta/recipes-extended/zypper/zypper/rpmatch.patch
new file mode 100644
index 0000000..a750a3b
--- /dev/null
+++ b/meta/recipes-extended/zypper/zypper/rpmatch.patch
@@ -0,0 +1,23 @@
+rpmatch() is missing in uclibc so we provide a local definition
+in form of a macro
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: git/src/utils/prompt.h
+===================================================================
+--- git.orig/src/utils/prompt.h	2012-06-06 15:51:00.899112775 -0700
++++ git/src/utils/prompt.h	2012-06-06 15:52:17.003116762 -0700
+@@ -172,4 +172,12 @@
+   return errstr;
+ }
+ 
++#ifdef __UCLIBC__
++#define rpmatch(line) \
++       ( (line == NULL)? -1 : \
++         (*line == 'y' || *line == 'Y')? 1 : \
++         (*line == 'n' || *line == 'N')? 0 : \
++         -1 )
++#endif /* __UCLIBC__ */
++
+ #endif /*ZYPPERPROMPT_H_*/
diff --git a/meta/recipes-extended/zypper/zypper_git.bb b/meta/recipes-extended/zypper/zypper_git.bb
index 0a1df5d..c5d7c61 100644
--- a/meta/recipes-extended/zypper/zypper_git.bb
+++ b/meta/recipes-extended/zypper/zypper_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/openSUSE/zypper.git;protocol=git \
            file://dso_linking_change_build_fix.patch \
            file://rpm5-flag.patch \
            file://gcc-scope.patch \
+           file://rpmatch.patch \
           "
 S = "${WORKDIR}/git"
 
@@ -25,3 +26,4 @@ RDEPENDS_${PN} = "rpm-libs"
 RRECOMMENDS_${PN} = "procps util-linux-uuidgen"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+OECMAKE_CXX_LINK_FLAGS_libc-uclibc += "-lintl"
-- 
1.7.7.6



