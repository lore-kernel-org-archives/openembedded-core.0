Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.11478.1607008142288889390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vZrrKZ88;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id p6so1296230plo.6
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3Yjj/HTdP0ZVzQXyDmbMLqVvCMUqkG1K4abBsgAu8s8=;
        b=vZrrKZ88AuAarBeFMsndqXM2o7I5zj0loP/4y1z8OH1zdtBhC4ovkW6zdaj2y+ubqL
         zDKykO6Pia6NhDZOTKFDpu387MhfMxqvGgUtkgWKCrRUAHRq2yGJddLx3mBFq4D067dY
         TE6zBUVzqoYw+RLkmS/Pyf4IBitsSeLm3hQgzLlAfuyB7N9os42+xVlGrdvC17mw5BqG
         xFj38ATibGV7T3OBbKNj/4J2ia7yt6IAOgT3+UpyZFxFAZFwDcjaOZ3xIcqybKl+JyOv
         VeFoiZdhu2bn8r2XI2h6SLGDW8TM84puuA7Ht5R0eCsScNLqH4yNUS8X8Qz7it7W9Spj
         0lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3Yjj/HTdP0ZVzQXyDmbMLqVvCMUqkG1K4abBsgAu8s8=;
        b=berPcaNMN+WZWncdMfNSexq+ma5pLZ0W1Kiy36jeISPzMn3gyy4osF0M2OupMbEsNR
         3manx4dsBnQZtSoZY4ghMYgtm5NuQ4PWFIaVVzqsfquF8J/WT4g4r0e17pOr/k1l36uP
         S1XFlIWIa8JFreuJnebr3bEV2/JRScmFIKgobwf6A0EjwdmxE/QwiVmAmDOhCJXrg8Ll
         6EGw2BucobrXh3ikMdOlTnkCp7WRy14FcPaFD0DG/sWb8to5iAitqo/pPBEb3qEOkCL6
         nrjjR9NtZAQf6x4rh35Ru7OGBKu0EatOSewGkSf0T+qNMBgpr+Xa1lab64LMNeRtfl0h
         zUJw==
X-Gm-Message-State: AOAM533ONd2NlgQxHdaZanNouWhn1aRuRVZ6f3MmqEnFx84Ib0RA4Bm8
	hCErIrgs8T2oSiLLF3UER31G9buoBb+NZBxI
X-Google-Smtp-Source: ABdhPJz5mEz3bbDE9MCzjDb1yXtcqWMA3B3PdMbg6rQP6/nmU6ofKUfFMhLo7J9KGH26CD4r4+GMLw==
X-Received: by 2002:a17:90a:940c:: with SMTP id r12mr3435110pjo.107.1607008141402;
        Thu, 03 Dec 2020 07:09:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.08.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/28] pseudo: Fix xattr segfault
Date: Thu,  3 Dec 2020 05:07:59 -1000
Message-Id: <48c770afc64b42af8386d9002ba9d3ce02acef41.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix a NULL pointer dereference exposed by the path ignore code in
xattr handling.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 929a27bf6cbca94d1141d2094ae0c915d93bd3f4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pseudo/files/xattr_fix.patch              | 40 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/xattr_fix.patch

diff --git a/meta/recipes-devtools/pseudo/files/xattr_fix.patch b/meta/recipes-devtools/pseudo/files/xattr_fix.patch
new file mode 100644
index 0000000000..61d0030b10
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/xattr_fix.patch
@@ -0,0 +1,40 @@
+
+In the xattr handling functions, if result is NULL, which it can be 
+with the path ignore code, there is a NULL pointer dereference and 
+segfault. Everywhere else checks result first, this appears to just 
+be an omission.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/ports/linux/xattr/pseudo_wrappers.c
+===================================================================
+--- git.orig/ports/linux/xattr/pseudo_wrappers.c
++++ git/ports/linux/xattr/pseudo_wrappers.c
+@@ -134,7 +134,7 @@ static ssize_t shared_getxattr(const cha
+ 	pseudo_debug(PDBGF_XATTR, "getxattr(%s [fd %d], %s)\n",
+ 		path ? path : "<no path>", fd, name);
+ 	pseudo_msg_t *result = pseudo_client_op(OP_GET_XATTR, 0, fd, -1, path, &buf, name);
+-	if (result->result != RESULT_SUCCEED) {
++	if (!result || result->result != RESULT_SUCCEED) {
+ 		errno = ENOATTR;
+ 		return -1;
+ 	}
+@@ -254,7 +254,7 @@ static int shared_setxattr(const char *p
+ static ssize_t shared_listxattr(const char *path, int fd, char *list, size_t size) {
+ 	RC_AND_BUF
+ 	pseudo_msg_t *result = pseudo_client_op(OP_LIST_XATTR, 0, fd, -1, path, &buf);
+-	if (result->result != RESULT_SUCCEED) {
++	if (!result || result->result != RESULT_SUCCEED) {
+ 		pseudo_debug(PDBGF_XATTR, "listxattr: no success.\n");
+ 		errno = ENOATTR;
+ 		return -1;
+@@ -276,7 +276,7 @@ static int shared_removexattr(const char
+ 	RC_AND_BUF
+ 	pseudo_msg_t *result = pseudo_client_op(OP_REMOVE_XATTR, 0, fd, -1, path, &buf, name);
+ 
+-	if (result->result != RESULT_SUCCEED) {
++	if (!result || result->result != RESULT_SUCCEED) {
+ 		/* docs say ENOATTR, but I don't have one */
+ 		errno = ENOENT;
+ 		return -1;
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index a5e79ec9a5..7857b4f1b1 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://add_ignore_paths.patch \
            file://abort_on_mismatch.patch \
            file://track_link_fds.patch \
+           file://xattr_fix.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.17.1

