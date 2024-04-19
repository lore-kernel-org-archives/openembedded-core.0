Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16336C10F16
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:02 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.19243.1713529194369173229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V0JVI72m;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-571d6d1943fso541917a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529193; x=1714133993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWOnP54oHWOpQ2IEpPofPFk7fnAn85aBjZ62tRuvBA8=;
        b=V0JVI72mNmQZNy7h5c0AApUc71sNuIRWC1NFwmdxbKNhJsrvRu9tQO/MJjtAlr1xRz
         NoixTK9GvDh3bmDW66j0Wp8FN6wQUvCN1N/Vy49JK/SQGTW6UxP1bvmmHRsKMjHRksw+
         aPlYOjbPco3FbUREYltn8DBv6wPqLkWLXzf48HMPuIMs3dz1IDNQ1JxA186S+eZaQ7wP
         XcE8IkP7aNrnORLUNPJa2cA7sZJ/BbNjARz5+FgPUcyUANni/aRGj1VJUZYhkMKzspfZ
         lkoZpI+axwVV4cO0sqUK+kHOhY+K5r9n7XtPHcJfc8c1kTXP1WCGMFtbRSZTwix4GoB4
         G5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529193; x=1714133993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWOnP54oHWOpQ2IEpPofPFk7fnAn85aBjZ62tRuvBA8=;
        b=htc9krHcb0Qj2HKwVv2kOJS7alw1St6dLNRoRaqyvT5DGaYRq0CZdL3ZeyfuX0jGVG
         +h8O8cGR+8BuonZbsJ90qlzKy47boJ0+pvlQLGU1hfBLsic5Pq2CZp3iq68z9CQik0ds
         /U8I6EZaFGVQQJpsCff8nTvtPXX7aDxSsBnheSVL+7Td1qHtMvOK3VgEE+EIIqgUheIp
         w4erutlE1qNituSBzaiscGw34wrZ1g1kRszwlqKHNFxRXiv3RSAs6RJhyXwCXJK4e1bX
         G5JVcFCfeAtxbfpxtPTh6eLMN6G0GGQ3hVz2kX6TJu0MvnMLBVRwzLCGoK83WRGqG0un
         uEXw==
X-Gm-Message-State: AOJu0YzoHFOFFzWeNmzL819Ab7SZA2WTMTqoQcfmSaesirmMGnUbc1Ph
	UuzHezEl5iD1lPE+7gZRqYXGLWiMO9s59ZCGnLzUAj3PNwwvTWhhNWEgWQ==
X-Google-Smtp-Source: AGHT+IFW1xwBOlQLvYnMiMcPVhNXeQiJMi0VlWeUf/nM782X5wS9VEqAjf7Ocxsa/pdYudzO0O5xIg==
X-Received: by 2002:a50:d658:0:b0:56e:34db:f5ef with SMTP id c24-20020a50d658000000b0056e34dbf5efmr1310856edj.28.1713529192603;
        Fri, 19 Apr 2024 05:19:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:19:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/19] kea: remove unnecessary reproducibility patch
Date: Fri, 19 Apr 2024 14:19:32 +0200
Message-Id: <20240419121945.1920944-6-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198534

Rather, adjust the sed invocation to do the correct thing directly.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-kea-fix-reproducible-build-failure.patch | 62 -------------------
 meta/recipes-connectivity/kea/kea_2.4.1.bb    |  3 +-
 2 files changed, 1 insertion(+), 64 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch b/meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch
deleted file mode 100644
index 8a5bd00302a..00000000000
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
index c3aa4dc8f06..9f8758f3791 100644
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
2.39.2


