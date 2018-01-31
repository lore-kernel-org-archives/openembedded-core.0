Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1D978066
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 08:56:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36420024"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jan 2018 16:56:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B6D8F49F19B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 16:56:34 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 31 Jan 2018 16:56:32 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jan 2018 16:56:34 +0800
Message-ID: <1517388994-2473-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: B6D8F49F19B7.AB985
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] tar: 1.29 -> 1.30
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
X-List-Received-Date: Wed, 31 Jan 2018 08:56:39 -0000
Content-Type: text/plain

1.Upgrade tar from 1.29 to 1.30.
2.Modify musl_dirent.patch, since the data has been changed.
3.Delete CVE-2016-6321.patch, since it is integrated upstream.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/tar/tar/CVE-2016-6321.patch  | 66 ----------------------
 meta/recipes-extended/tar/tar/musl_dirent.patch    |  4 +-
 .../tar/{tar_1.29.bb => tar_1.30.bb}               |  5 +-
 3 files changed, 4 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-extended/tar/tar/CVE-2016-6321.patch
 rename meta/recipes-extended/tar/{tar_1.29.bb => tar_1.30.bb} (67%)

diff --git a/meta/recipes-extended/tar/tar/CVE-2016-6321.patch b/meta/recipes-extended/tar/tar/CVE-2016-6321.patch
deleted file mode 100644
index 6d35bcc..0000000
--- a/meta/recipes-extended/tar/tar/CVE-2016-6321.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 7340f67b9860ea0531c1450e5aa261c50f67165d Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@Penguin.CS.UCLA.EDU>
-Date: Sat, 29 Oct 2016 21:04:40 -0700
-Subject: [PATCH] When extracting, skip ".." members
-
-* NEWS: Document this.
-* src/extract.c (extract_archive): Skip members whose names
-contain "..".
-
-CVE: CVE-2016-6321
-Upstream-Status: Backport
-
-Cherry picked from commit: 7340f67 When extracting, skip ".." members
-
-Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
----
- NEWS          | 8 +++++++-
- src/extract.c | 8 ++++++++
- 2 files changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/NEWS b/NEWS
-index 501164a..fc97cfc 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,6 +1,12 @@
--GNU tar NEWS - User visible changes. 2016-05-16
-+GNU tar NEWS - User visible changes. 2016-10-29
- Please send GNU tar bug reports to <bug-tar@gnu.org>
- 
-+* Member names containing '..' components are now skipped when extracting.
-+
-+This fixes tar's behavior to match its documentation, and is a bit
-+safer when extracting untrusted archives over old files (an unsafe
-+practice that the tar manual has long recommended against).
-+
- 
- version 1.29 - Sergey Poznyakoff, 2016-05-16
- 
-diff --git a/src/extract.c b/src/extract.c
-index f982433..7904148 100644
---- a/src/extract.c
-+++ b/src/extract.c
-@@ -1629,12 +1629,20 @@ extract_archive (void)
- {
-   char typeflag;
-   tar_extractor_t fun;
-+  bool skip_dotdot_name;
- 
-   fatal_exit_hook = extract_finish;
- 
-   set_next_block_after (current_header);
- 
-+  skip_dotdot_name = (!absolute_names_option
-+		      && contains_dot_dot (current_stat_info.orig_file_name));
-+  if (skip_dotdot_name)
-+    ERROR ((0, 0, _("%s: Member name contains '..'"),
-+	    quotearg_colon (current_stat_info.orig_file_name)));
-+
-   if (!current_stat_info.file_name[0]
-+      || skip_dotdot_name
-       || (interactive_option
- 	  && !confirm ("extract", current_stat_info.file_name)))
-     {
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/tar/tar/musl_dirent.patch b/meta/recipes-extended/tar/tar/musl_dirent.patch
index b0dc16c..2d98ed1 100644
--- a/meta/recipes-extended/tar/tar/musl_dirent.patch
+++ b/meta/recipes-extended/tar/tar/musl_dirent.patch
@@ -14,6 +14,6 @@ Index: tar-1.28/m4/d-ino.m4
 -              linux*-gnu*) gl_cv_struct_dirent_d_ino="guessing yes" ;;
 +              linux*-gnu*|linux*-musl*)
 +                           gl_cv_struct_dirent_d_ino="guessing yes" ;;
+                            # Guess no on native Windows.
+               mingw*)      gl_cv_struct_dirent_d_ino="guessing no" ;;
                             # If we don't know, assume the worst.
-               *)           gl_cv_struct_dirent_d_ino="guessing no" ;;
-             esac
diff --git a/meta/recipes-extended/tar/tar_1.29.bb b/meta/recipes-extended/tar/tar_1.30.bb
similarity index 67%
rename from meta/recipes-extended/tar/tar_1.29.bb
rename to meta/recipes-extended/tar/tar_1.30.bb
index f22d9c9..e743a6d 100644
--- a/meta/recipes-extended/tar/tar_1.29.bb
+++ b/meta/recipes-extended/tar/tar_1.30.bb
@@ -8,10 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI += "file://remove-gets.patch \
             file://musl_dirent.patch \
-            file://CVE-2016-6321.patch \
            "
-SRC_URI[md5sum] = "955cd533955acb1804b83fd70218da51"
-SRC_URI[sha256sum] = "236b11190c0a3a6885bdb8d61424f2b36a5872869aa3f7f695dea4b4843ae2f2"
+SRC_URI[md5sum] = "8404e4c1fc5a3000228ab2b8ad674a65"
+SRC_URI[sha256sum] = "87592b86cb037c554375f5868bdd3cc57748aef38d6cb741c81065f0beac63b7"
 
 do_install_append_libc-musl() {
 	rm -f ${D}${libdir}/charset.alias
-- 
2.7.4




