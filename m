Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B77C27C6E
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:03 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.9689.1718288459945154380
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=N9Owj/46;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70423e8e6c9so954737b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288459; x=1718893259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bLWmShWVJr64L2H8yKGT+UjuMfPEHcf6m2JktNjr+0=;
        b=N9Owj/4682HSIp3dEm05Wm7tqbKrU9oCJtnvD5a6kawKQ3P/4VZS97U+kYKRfpi4/a
         9AqSqkvB/UMPdOBUnPjvkJYr3Tb/wevdDsj+af9PW4dEKdXusCXwwV0ysD9NFD8w/Nj2
         oPZwb78KeuGDOGG0+M6UmCHyraLI5jWWuHOqPQ1HY3xKBqnYYgJNEaIVVCHhpqD4S/Ty
         +v+LtKHlPwY/Dw67q2Pocw/5I6LuMXuGXEsPwVvcwMd/sRHCwzu4BiELUS67pMy3fOqy
         NGEm+yrSIyfQO7ksTRvKsqliG143hhQ14+dH3VTgyxpqGUCeK1EDEQK6wQAYwnb4FT38
         2TJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288459; x=1718893259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bLWmShWVJr64L2H8yKGT+UjuMfPEHcf6m2JktNjr+0=;
        b=NdnERfTz42PmV+E58oo3vNbwOLqBkPQBJ9qb3QZLY6oY8MR0bSabdv7OauQHyFYkT7
         HVevOvum2MJJeyek7jpZY7Z1yM8EJ8HkOa4/d0voE3Xy0Uf7I+B88/CVKbxhmzqaeOgD
         mkQW24lH5A1H25aVe//jo5FLgRxmsDZFb4Kq85/xm3734jUjAL8pOpfHrLbA0NwBtiaK
         nsm0Ne9SZcTRvRbNKIf/ADzRz928oiqgLoHq4pLdIebYZsHF5anRdnFjW9mzjWRpTYXB
         2qYV+iEkFU4q1dQRtXKio1uE0mN1WAjmYEWelTYGRQ5CQpKAFHJl3LvenO3gD8zCX7w0
         Su+A==
X-Gm-Message-State: AOJu0Yzat28yf0YB42LOvsVPJUKHXIXMXdiNOi0s1DuChkn88F2mt1oD
	Pox6YEmN2PAQkMiFdV3T36unZJn5qm8DTNh/7FDxG++c5v3vWOO1AYBJbw8LWsjuso/D6Fgg+VR
	V
X-Google-Smtp-Source: AGHT+IG9yGWSAZOIm0J/uvVy4mE628IPaboEFV8DAm+VpdXsjjOuGFN+TZdza9Xe0kkjgXZPy1qFIQ==
X-Received: by 2002:a05:6a21:998a:b0:1b5:cf26:ed09 with SMTP id adf61e73a8af0-1b8a9b6cc37mr5789163637.7.1718288459203;
        Thu, 13 Jun 2024 07:20:59 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/29] kea: remove unnecessary reproducibility patch
Date: Thu, 13 Jun 2024 07:20:19 -0700
Message-Id: <a57f48c3bb37d5154ea2ef821525aa8706f9cb37.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200617

From: Alexander Kanavin <alex.kanavin@gmail.com>

Rather, adjust the sed invocation to do the correct thing directly.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 804afb2eb9cc2b5650faa80816f377fa5b72fb38)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-kea-fix-reproducible-build-failure.patch | 62 -------------------
 meta/recipes-connectivity/kea/kea_2.4.1.bb    |  3 +-
 2 files changed, 1 insertion(+), 64 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch b/meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch
deleted file mode 100644
index 8a5bd00302..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From f9bcfed5a1d44d9211c5f6eba403a9898c8c9057 Mon Sep 17 00:00:00 2001
-From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
-Date: Tue, 8 Aug 2023 19:03:13 +0100
-Subject: [PATCH] kea: fix reproducible build failure
-
-New version of Kea has started using path of build-dir instead of
-src-dir which results in reproducible builds failure.
-Use src-dir as is used in v2.2.0
-
-Upstream-Status: Pending
-https://gitlab.isc.org/isc-projects/kea/-/issues/3007
-
-Upstream has confirmed the patch will not be accepted but discussions
-with upstream is still going on, we might have a proper solution later.
-
-Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
----
- src/bin/admin/kea-admin.in | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/bin/admin/kea-admin.in b/src/bin/admin/kea-admin.in
-index 034a0ee..8ab11ab 100644
---- a/src/bin/admin/kea-admin.in
-+++ b/src/bin/admin/kea-admin.in
-@@ -51,14 +51,14 @@ dump_qry=""
- if test -f "@datarootdir@/@PACKAGE_NAME@/scripts/admin-utils.sh"; then
-     . "@datarootdir@/@PACKAGE_NAME@/scripts/admin-utils.sh"
- else
--    . "@abs_top_builddir@/src/bin/admin/admin-utils.sh"
-+    . "@abs_top_srcdir@/src/bin/admin/admin-utils.sh"
- fi
- 
- # Find the installed kea-lfc if available. Fallback to sources otherwise.
- if test -x "@sbindir@/kea-lfc"; then
-     kea_lfc="@sbindir@/kea-lfc"
- else
--    kea_lfc="@abs_top_builddir@/src/bin/lfc/kea-lfc"
-+    kea_lfc="@abs_top_srcdir@/src/bin/lfc/kea-lfc"
- fi
- 
- # Prints out usage version.
-@@ -355,7 +355,7 @@ mysql_upgrade() {
-     # Check if there are any files in it
-     num_files=$(find "${upgrade_scripts_dir}" -name 'upgrade*.sh' -type f | wc -l)
-     if [ "$num_files" -eq 0 ]; then
--        upgrade_scripts_dir=@abs_top_builddir@/src/share/database/scripts/mysql
-+        upgrade_scripts_dir=@abs_top_srcdir@/src/share/database/scripts/mysql
- 
-         # Check if the scripts directory exists at all.
-         if [ ! -d ${upgrade_scripts_dir} ]; then
-@@ -405,7 +405,7 @@ pgsql_upgrade() {
-     # Check if there are any files in it
-     num_files=$(find "${upgrade_scripts_dir}" -name 'upgrade*.sh' -type f | wc -l)
-     if [ "$num_files" -eq 0 ]; then
--        upgrade_scripts_dir=@abs_top_builddir@/src/share/database/scripts/pgsql
-+        upgrade_scripts_dir=@abs_top_srcdir@/src/share/database/scripts/pgsql
- 
-         # Check if the scripts directory exists at all.
-         if [ ! -d ${upgrade_scripts_dir} ]; then
--- 
-2.39.2
-
diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.4.1.bb
index c3aa4dc8f0..9f8758f379 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.4.1.bb
@@ -17,7 +17,6 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix-multilib-conflict.patch \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
-           file://0001-kea-fix-reproducible-build-failure.patch \
            "
 SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
 
@@ -47,7 +46,7 @@ do_configure:prepend() {
     # replace abs_top_builddir to avoid introducing the build path
     # don't expand the abs_top_builddir on the target as the abs_top_builddir is meanlingless on the target
     find ${S} -type f -name *.sh.in | xargs sed -i  "s:@abs_top_builddir@:@abs_top_builddir_placeholder@:g"
-    sed -i "s:@abs_top_srcdir@:@abs_top_srcdir_placeholder@:g" ${S}/src/bin/admin/kea-admin.in
+    sed -i "s:@abs_top_builddir@:@abs_top_builddir_placeholder@:g" ${S}/src/bin/admin/kea-admin.in
 }
 
 # patch out build host paths for reproducibility
-- 
2.34.1


