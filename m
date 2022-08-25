Return-Path: <ghassanebb@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48C3C04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 07:25:47 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.21262.1661412342882712724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 00:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X8DjdDKa;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: ghassanebb@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id b5so19151530wrr.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 00:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=/HSOhCWQ8qacmpcqh4rIgQbMd2orOfnwcLXJNqXy0CQ=;
        b=X8DjdDKaui1vsFSJM3FhSNfibzBjs1PCgwvKSd655bsgx5dUbrFRBZAIJ3a6nfii2u
         +wb49FM+loODuycd49MvS3j8cV4cFZ+XQyptp1PpFeKLRMNWHINrMIXfruZ9mor12l48
         Dp70+HmrnV2cRlT7l2QyY07SYA7PdEi/zAN34wa5Rg8uWA02yaM5+tojC6CKIxnRIOHl
         Wxc4lYI3rNxc41s2/Z0vN46GKZ0gVx/tXF659aY0URzQcZ0PpxP/69CzPoqX3GzMXuLB
         F6c1KULUngGpUWt+3DY4RxX5azpUeG5j3JfeesUibQyms8PvqUMM1l0J2/ievyDn3Rq3
         SynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=/HSOhCWQ8qacmpcqh4rIgQbMd2orOfnwcLXJNqXy0CQ=;
        b=hgQC8AyKnAb4zJxjy5z4wtqhkChSX3IwYYbNTBF3+CUmL40ngWJ2eDZZh5cLCPSfto
         IZwGFkfW/GDKwW/t1W6NDW6NszFXEvWX/okzasCNaHRa97SKBpAF/637rWnJglai9DoE
         jwHK7MpJ8Iqb3IMk7hgQbHSxJvpYuWp4wA7M1RfSBwBBt2uym3l2l50/827n9trSeE4/
         FQ5d17gYwJb6TnZURgclgCaZ1ZNAPgaQ+nOqKiHO/ig/NcNp7ga7FFkIW9qKyqDSzYSU
         zHavYatG5eTyGGo3DG8hXrcJzygl3s4PlaHteAhuo67l0btmYz4LM/HA0p2JrrNy3Ld6
         IFCg==
X-Gm-Message-State: ACgBeo1sTA59x12obPuAjYL4bl7ZAZXWGIWn7J8nLsVviIVyJxiky8DT
	cl+ziGdbLv32BydwpsBActaufAcwMLJ9lQ==
X-Google-Smtp-Source: 
 AA6agR6a7x+yFpKKkkKbKOFF03Rr+J0/5b2uVzXBV7AdCZ5IriODk+tUCvnC+avxu3kNpQccwPGgkA==
X-Received: by 2002:adf:fc8b:0:b0:225:5a71:be1a with SMTP id
 g11-20020adffc8b000000b002255a71be1amr1366906wrr.651.1661412340871;
        Thu, 25 Aug 2022 00:25:40 -0700 (PDT)
Received: from ghassane-XPS-13-9370..
 ([2001:b07:6440:8e9c:c01a:536e:bf6e:da1d])
        by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm18763784wrv.66.2022.08.25.00.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 00:25:40 -0700 (PDT)
From: ghassaneben <ghassanebb@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ghassaneben <ghassaneb.aattar@huawei.com>
Subject: [kirkstone] [PATCH] sqlite: Increase the size of loop variables in
 the printf() implementation to avoid harmless compiler warnings.
Date: Thu, 25 Aug 2022 09:25:08 +0200
Message-Id: <20220825072507.6568-1-ghassanebb@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 07:25:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169835

From: ghassaneben <ghassaneb.aattar@huawei.com>

Increase the size of loop variables in the printf() implementation to avoid integer overflow on multi-gigabyte string arguments. CVE-2022-35737. This bug fix refers to: CVE-2022-35737 and it's a backport of a fix added in sqlite 3.39.2 (2022-07-21).
Original commit: https://www.sqlite.org/src/info/aab790a16e1bdff7.

Signed-off-by: Ghassane Ben El Aattar <ghassaneb.aattar@huawei.com>
---
 ...riables-in-the-printf-implementation.patch | 31 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  5 +++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch

diff --git a/meta/recipes-support/sqlite/sqlite/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch b/meta/recipes-support/sqlite/sqlite/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch
new file mode 100644
index 0000000000..998e93bc6c
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch
@@ -0,0 +1,31 @@
+From ec75530b8d8268cb07d8e476d79e1b0e59492fa2 Mon Sep 17 00:00:00 2001
+From: drh
+Date: Thu, 18 Aug 2022 15:10:46 +0200
+Subject: [PATCH] sqlite: Increase the size of loop variables in the printf() implementation to avoid harmless compiler warnings.
+
+Increase the size of loop variables in the printf() implementation to avoid integer overflow on multi-gigabyte string arguments. CVE-2022-35737. This bug fix refers to: CVE-2022-35737 and it's a backport of a fix added in sqlite 3.39.2 (2022-07-21). 
+Original commit: https://www.sqlite.org/src/info/aab790a16e1bdff7.
+
+Signed-off-by: Ghassane Ben El Aattar <ghassaneb.aattar@huawei.com>
+
+CVE: CVE-2022-35737
+
+Upstream-Status: Backport https://github.com/sqlite/sqlite/commit/6eb7354fabede50a3601f251caaec172556a3a82
+---
+ src/printf.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/printf.c b/src/printf.c
+index f867d62..490199a 100644
+--- a/src/printf.c
++++ b/src/printf.c
+@@ -542,7 +542,8 @@ static int vxprintf(
+       case etSQLESCAPE:
+       case etSQLESCAPE2:
+         {
+-          int i, j, n, c, isnull;
++          i64  i, j, n, c;
++          int isnull;
+           char *arg = va_arg(ap,char*);
+           isnull = arg==0;
+           if( isnull ) arg = (xtype==etSQLESCAPE2 ? "NULL" : "(NULL)");
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index d56a3a0209..7b62980e24 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -12,3 +12,8 @@ CVE_CHECK_IGNORE += "CVE-2019-19242"
 CVE_CHECK_IGNORE += "CVE-2015-3717"
 # Issue in an experimental extension we don't have/use. Fixed by https://sqlite.org/src/info/b1e0c22ec981cf5f
 CVE_CHECK_IGNORE += "CVE-2021-36690"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch"
+
-- 
2.34.1


