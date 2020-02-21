Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 87E6861627
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 08:17:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,467,1574092800"; d="scan'208";a="83685058"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Feb 2020 16:17:36 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id BAB6B406AB15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 16:07:53 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 21 Feb 2020 16:17:32 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 21 Feb 2020 16:17:33 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Feb 2020 07:24:50 -0800
Message-ID: <1582298690-25947-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: BAB6B406AB15.A58E7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] shadow: upgrade 4.8 -> 4.8.1
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
X-List-Received-Date: Fri, 21 Feb 2020 08:17:36 -0000
Content-Type: text/plain

0001-Do-not-check-for-validity-of-shell-executable.patch
CVE-2019-19882.patch
Removed since they are included in 4.8.1.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...eck-for-validity-of-shell-executable.patch | 29 ----------
 .../shadow/files/CVE-2019-19882.patch         | 55 -------------------
 meta/recipes-extended/shadow/shadow.inc       |  6 +-
 .../shadow/{shadow_4.8.bb => shadow_4.8.1.bb} |  0
 4 files changed, 2 insertions(+), 88 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Do-not-check-for-validity-of-shell-executable.patch
 delete mode 100644 meta/recipes-extended/shadow/files/CVE-2019-19882.patch
 rename meta/recipes-extended/shadow/{shadow_4.8.bb => shadow_4.8.1.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/0001-Do-not-check-for-validity-of-shell-executable.patch b/meta/recipes-extended/shadow/files/0001-Do-not-check-for-validity-of-shell-executable.patch
deleted file mode 100644
index 2d15ff0673..0000000000
--- a/meta/recipes-extended/shadow/files/0001-Do-not-check-for-validity-of-shell-executable.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0d0aded7307a9f4ee0d299951512acd18b3e029e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 4 Dec 2019 19:28:48 +0100
-Subject: [PATCH] Do not check for validity of shell executable.
-
-This kind of check fails when building a rootfs.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/useradd.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/src/useradd.c b/src/useradd.c
-index 4af0f7c..898fe02 100644
---- a/src/useradd.c
-+++ b/src/useradd.c
-@@ -1328,10 +1328,7 @@ static void process_flags (int argc, char **argv)
- 				if (   ( !VALID (optarg) )
- 				    || (   ('\0' != optarg[0])
- 				        && ('/'  != optarg[0])
--				        && ('*'  != optarg[0]) )
--				    || (stat(optarg, &st) != 0)
--				    || (S_ISDIR(st.st_mode))
--				    || (access(optarg, X_OK) != 0)) {
-+				        && ('*'  != optarg[0]) )) {
- 					fprintf (stderr,
- 					         _("%s: invalid shell '%s'\n"),
- 					         Prog, optarg);
diff --git a/meta/recipes-extended/shadow/files/CVE-2019-19882.patch b/meta/recipes-extended/shadow/files/CVE-2019-19882.patch
deleted file mode 100644
index 894d867680..0000000000
--- a/meta/recipes-extended/shadow/files/CVE-2019-19882.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 66b7bc0dcfda12d7f58eba993bd02872cae1d713 Mon Sep 17 00:00:00 2001
-From: Dave Reisner <dreisner@archlinux.org>
-Date: Mon, 16 Dec 2019 14:11:23 -0500
-Subject: [PATCH] Don't auto-enable ACCT_TOOLS_SETUID if PAM is detected
-
-Here's a sad story:
-
-* 70971457 is merged into shadow, allowing newgidmap/newuidmap to be
-installed with file caps rather than setuid.
-* https://bugs.archlinux.org/task/63248 is filed to take advantage of
-this.
-* The arch maintainer of the 'shadow' package notices that this doesn't
-work, and submits a pull request to fix this in shadow.
-* edf7547ad5 is merged, fixing the post install hooks.
-
-The problem here is that distros have been building shadow with PAM for
-O(years), but the install hooks have silently failed due to the
-combination of the directory mismatch (suidubins vs suidsbins) and later
-success with setuid'ing newgidmap/newuidmap.
-
-With the install hooks fixed, those of us (Arch[1] and Gentoo[2] so far)
-who never built shadow explicitly with --enable-account-tools-setuid are
-now getting setuid account tools, and don't have PAM configuration
-suitable for use with setuid account management tools.
-
-It's entirely unclear to me why you'd want this, but I assume there's
-some reason out there for it existing. Regardless, setuid binaries are
-dangerous and shouldn't be enabled by default without good reason.
-
-[1] https://bugs.archlinux.org/task/64836
-[2] https://bugs.gentoo.org/702252
-
-Upstream-Status: Backport
-CVE: CVE-2019-19882
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e3ed3b43..d6e2bfbd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -226,7 +226,7 @@ AC_ARG_ENABLE(account-tools-setuid,
- 	   *) AC_MSG_ERROR(bad value ${enableval} for --enable-account-tools-setuid)
- 	   ;;
- 	 esac],
--	[enable_acct_tools_setuid="maybe"]
-+	[enable_acct_tools_setuid="no"]
- )
- 
- AC_ARG_ENABLE(utmpx,
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 3bfa39e6ff..f86e5e03c0 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -13,7 +13,6 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.
            file://shadow-4.1.3-dots-in-usernames.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://shadow-relaxed-usernames.patch \
-           file://CVE-2019-19882.patch \
            "
 
 SRC_URI_append_class-target = " \
@@ -25,14 +24,13 @@ SRC_URI_append_class-native = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            file://0002-Allow-for-setting-password-in-clear-text.patch \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
-           file://0001-Do-not-check-for-validity-of-shell-executable.patch \
            "
 SRC_URI_append_class-nativesdk = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            "
 
-SRC_URI[md5sum] = "017ac773ba370bc28e157cee30dad71a"
-SRC_URI[sha256sum] = "82016d65317555fc8ce9e669eb187984d8d4b1f8ecda0769f4bc5412aed326e4"
+SRC_URI[md5sum] = "3d97f11e66bfb0b14702b115fa8be480"
+SRC_URI[sha256sum] = "3ee3081fbbcbcfea5c8916419e46bc724807bab271072104f23e7a29e9668f3a"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-extended/shadow/shadow_4.8.bb b/meta/recipes-extended/shadow/shadow_4.8.1.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.8.bb
rename to meta/recipes-extended/shadow/shadow_4.8.1.bb
-- 
2.17.1




