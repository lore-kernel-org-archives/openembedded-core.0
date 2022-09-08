Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2194AC6FA83
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 02:28:58 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.705.1662604129817677905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2Bwrn/Ly;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id z187so16463108pfb.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=HLIV2dM6rGBTSmHXzhtgQZCxVUUAk8JQzgNYwjvbsZ4=;
        b=2Bwrn/Ly0B4MQWoWvAmzUOe/JkxOrTRAS/Xre6AbwDhgQf1TZQsIfmysmsr7i7eKLI
         Ab9yecx4KJuyGFnXLMIS4ed1iW0GbsZM+p9sB6AIo/dQPBt8Z7a1H5Puz1D8/bNHt+2K
         aIEWCfXadliD9WW+6pa8oRXzJpvfxxSo4AMfkIyyHt4PsZQDxVZn+aOSIRwF6GWHesCW
         cCEqs3pqMXXVQMn4orLy8IQ2KS0x/m/ED1DeV36tmsIhxr/CGCGZGImtxSf/ZF3IEfaT
         pKJiE+oEeHcrEwfJJALl8n8mrU4HWOhwfaQLE/NnrNOJrFcgl1BIIcA9zsUMet3bNZGU
         eaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HLIV2dM6rGBTSmHXzhtgQZCxVUUAk8JQzgNYwjvbsZ4=;
        b=PxlQsRbxwmLiWPx7+vLFjJiIfhQqsK5yBZyMLNWaFSDDYX5NTUEvkWPAoX+WMlfx1G
         NxEKHUjqijsl3lzty0fgVROyku9P9+7kh1o6CqSnPQjSaOUzjcM69WNbQPVhnhaQQg3E
         c06jErH7syHNuIBG1VbJ/YmZPl4Qd+KIzZK9fk1cDIXmr3MbHYXy1vz/wXYZU53MIAbu
         x0PtHL9qAZHayvarcT10FalamKIr6/VT0tROjYmCy7lo8zTIKaQf4cqBJ/gU+h5YPEKA
         5vQqtU98U4F1BBQZTDOJlFkL7hb3+hgZTLzeNW/xACViumI2klpGaT1XD9zVb6UCH+Cu
         a6mQ==
X-Gm-Message-State: ACgBeo3fRFicjga0boVBwS7NMJ8aLvaqvIAVyhCGwlY3lSybqMUOVX1C
	wSxqUSe85KxEcCYWAnSWgqBZGVUOl1q96rBs
X-Google-Smtp-Source: 
 AA6agR5or/G6AGOWj7nUmcIqvQTp6G6PjQ8Jp51C81+xtgJ1hf5BWtH0G+ISDq5PtsutO5jWyd5gUQ==
X-Received: by 2002:aa7:93a4:0:b0:535:d714:c24c with SMTP id
 x4-20020aa793a4000000b00535d714c24cmr6630035pff.15.1662604128889;
        Wed, 07 Sep 2022 19:28:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 b11-20020a170902d50b00b0016c0c82e85csm1901398plg.75.2022.09.07.19.28.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 19:28:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/7] sqlite: CVE-2022-35737 assertion failure
Date: Wed,  7 Sep 2022 16:28:26 -1000
Message-Id: 
 <226f9458075061cb99d71bee737bafbe73469c22.1662603861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662603861.git.steve@sakoman.com>
References: <cover.1662603861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 02:28:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170440

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://www.sqlite.org/
MR: 120541
Type: Security Fix
Disposition: Backport from https://www.sqlite.org/src/info/aab790a16e1bdff7
ChangeID: cf6d0962be0d1f7d4a5019843da6349eb7f9acda
Description:
	 CVE-2022-35737 sqlite: assertion failure via query when compiled with -DSQLITE_ENABLE_STAT4.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2022-35737.patch         | 29 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2022-35737.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2022-35737.patch b/meta/recipes-support/sqlite/files/CVE-2022-35737.patch
new file mode 100644
index 0000000000..341e002913
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2022-35737.patch
@@ -0,0 +1,29 @@
+From 2bbf4c999dbb4b520561a57e0bafc19a15562093 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 2 Sep 2022 11:22:29 +0530
+Subject: [PATCH] CVE-2022-35737
+
+Upstream-Status: Backport [https://www.sqlite.org/src/info/aab790a16e1bdff7]
+CVE: CVE-2022-35737
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ sqlite3.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index f664217..33dfb78 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -28758,7 +28758,8 @@ SQLITE_API void sqlite3_str_vappendf(
+       case etSQLESCAPE:           /* %q: Escape ' characters */
+       case etSQLESCAPE2:          /* %Q: Escape ' and enclose in '...' */
+       case etSQLESCAPE3: {        /* %w: Escape " characters */
+-        int i, j, k, n, isnull;
++        i64  i, j, k, n;
++        int isnull;
+         int needQuote;
+         char ch;
+         char q = ((xtype==etSQLESCAPE3)?'"':'\'');   /* Quote character */
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index 877e80f5a3..3440bf4913 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2020-13630.patch \
            file://CVE-2020-13631.patch \
            file://CVE-2020-13632.patch \
+           file://CVE-2022-35737.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.25.1


