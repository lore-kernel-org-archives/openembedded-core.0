Return-Path: <simit.ghane@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00DCC2BBCA
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 05:07:23 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web10.10322.1719551229037761382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 22:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: simit.ghane@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.52 with ESMTP; 28 Jun 2024 14:07:07 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: simit.ghane@lge.com
Received: from unknown (HELO si-rd23-bld64.lge.net) (10.221.31.64)
	by 156.147.1.151 with ESMTP; 28 Jun 2024 14:07:06 +0900
X-Original-SENDERIP: 10.221.31.64
X-Original-MAILFROM: simit.ghane@lge.com
From: "simit.ghane" <simit.ghane@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: "simit.ghane" <simit.ghane@lge.com>
Subject: [PATCHv4] libgcrypt: Fix building error with '-O2' in sysroot path
Date: Fri, 28 Jun 2024 10:37:00 +0530
Message-Id: <20240628050700.3845701-1-simit.ghane@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 05:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201218

Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
respectively when compiling cipher and random in the filesystem
paths as well if they happen to contain '-O2' or '-Ofast

If we are cross compiling libgcrypt and sysroot contains such
characters, we would
get compile errors because the sysroot path has been modified.

Fix this by adding blank spaces and tabs before the original matching
pattern in the sed command.

It is difficult to control -O1 for cipher and -O0 for random
at the same time in OE environment along with patch file.
So, keeping same change as it is.

Signed-off-by: simit.ghane <simit.ghane@lge.com>
---
v3: No change
v4: Addressed comments related to /g and revered change for sed command

 ...ilding-error-with-O2-in-sysroot-path.patch | 63 ++++++++++++++-----
 1 file changed, 47 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
index cf9ebfb3e6..ea5bba8891 100644
--- a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
+++ b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
@@ -1,31 +1,49 @@
-From 0f66e796a8522e1043dda03b88d5f6feae839d16 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 16 Aug 2017 10:44:41 +0800
-Subject: [PATCH] libgcrypt: fix building error with '-O2' in sysroot path
+From 7d9817ca935a35fe6c8e2c2c7615825fa08a3a19 Mon Sep 17 00:00:00 2001
+From: "simit.ghane" <simit.ghane@lge.com>
+Date: Tue, 7 May 2024 14:09:03 +0530
+Subject: [PATCHV2] Fix building error with '-O2' in sysroot path
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=7d9817ca935a35fe6c8e2c2c7615825fa08a3a19 
+https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=e96df0c82e086bf348753d2d0fa37fa6191b4b14
+https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=5afadba008918d651afefb842ae123cc18454c74]
+
+* cipher/Makefile.am (o_flag_munging): Tweak the sed script.
+* random/Makefile.am (o_flag_munging): Ditto.
+--
+
+Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
+respectively when compiling cipher and random in the filesystem
+paths as well if they happen to contain '-O2' or '-Ofast
 
-Characters like '-O2' or '-Ofast' will be replaced by '-O1' when
-compiling cipher.
 If we are cross compiling libgcrypt and sysroot contains such
 characters, we would
 get compile errors because the sysroot path has been modified.
 
-Fix this by adding blank spaces before and after the original matching
-pattern in the
-sed command.
+Fix this by adding blank spaces and tabs before the original matching
+pattern in the sed command.
+
+Signed-off-by: simit.ghane <simit.ghane@lge.com>
+
+ChangeLog entries added by wk
+
+Note that there is also the configure option --disable-O-flag-munging;
+see the README.
 
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+random:cipher: handle substitution in sed command
 
-Rebase to 1.8.0
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+* cipher/Makefile.am (o_flag_munging): Add 'g' flag for first sed
+expression.
+* random/Makefile.am (o_flag_munging): Likewise.
 
+[jk: add changelog to commit message]
+Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
 ---
  cipher/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ random/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/cipher/Makefile.am b/cipher/Makefile.am
-index c3d642b..88c883a 100644
+index c3d642b2ac..f1c3971c40 100644
 --- a/cipher/Makefile.am
 +++ b/cipher/Makefile.am
 @@ -153,7 +153,7 @@ gost-s-box: gost-s-box.c
@@ -33,7 +51,20 @@ index c3d642b..88c883a 100644
  
  if ENABLE_O_FLAG_MUNGING
 -o_flag_munging = sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast/-O1/g'
-+o_flag_munging = sed -e 's/ -O\([2-9sgz][2-9sgz]*\) / -O1 /' -e 's/ -Ofast / -O1 /g'
++o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O1 /g' -e 's/[[:blank:]]-Ofast/ -O1 /g'
+ else
+ o_flag_munging = cat
+ endif
+diff --git a/random/Makefile.am b/random/Makefile.am
+index 0c935a0595..340df38a79 100644
+--- a/random/Makefile.am
++++ b/random/Makefile.am
+@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-base-user.h
+ 
+ # The rndjent module needs to be compiled without optimization.  */
+ if ENABLE_O_FLAG_MUNGING
+-o_flag_munging = sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-Ofast/-O0/g'
++o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /g' -e 's/[[:blank:]]-Ofast/ -O0 /g'
  else
  o_flag_munging = cat
  endif

