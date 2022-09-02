Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92083C38145
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 11:17:59 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.5300.1662117472217155574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 04:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VCiD02Ms;
 spf=pass (domain: mvista.com, ip: 209.85.214.174,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id c2so1563600plo.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 04:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=GqX96Dq5laK5lXBtWFpHXpn/1dHjn8wJl4K+0azcnUk=;
        b=VCiD02MsSD4JpMgpCXebQfdZp7kRLLKVGlvDGixRfPSCdifRDWUXjJ23IWI2ib9uBF
         IRiTBnm40ObgszqyVln+poZuVQqm8vzTTV5fUyLRHpqMyz/+iH+uJvTwKQPahQE0yaTU
         EbdFLdGp1piL4dle9bjzIUJTjvEwNy3/W3lOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=GqX96Dq5laK5lXBtWFpHXpn/1dHjn8wJl4K+0azcnUk=;
        b=QlQ0cyHOXautKUhGXYT0jO3n5CHKXNtrWZZzTOndSmj4KbGcEepuHKzVAoCc20LhI5
         QiWXDDn7NEAKVdyiWAQzHwfEe0F+lmcT2hZHoXivWwE7qamZzKPDGUuiYrtwmswZVRWs
         RZ4LBoB0qaj7I1E/V2vsRfN8yTjSTocgwvWtSfti/Ps48auNrMGNHIfMajYT/75WxQJ9
         Q6Xh81Vd8th9CJfXMHm5dKKonCqgHXu6/2OfFe7H/h04Z65MqizSL/A2x5nMrsuSL3EM
         h2vpr/ylL3AtWZPCIBMmhRMTA2Dk5diwrLzj5d2GLdqnv2ZN9qNV0ph8d7LJ59fOtAJk
         mj0g==
X-Gm-Message-State: ACgBeo0hIbfqcaMcYvLIXlnkZuxnj/ciMVfm7v4eQvjqSwdsPzlAhs0q
	63eSj9phxGpJXYmFDjooD/un1kA9fkQA0w==
X-Google-Smtp-Source: 
 AA6agR6aYhLLr0io7Rh2hLWPu9vnpopumC53ZRvAYHS/r4V/d1idCx/8Gj4G8NuxaxKHMe4Mk0OrNw==
X-Received: by 2002:a17:90b:1d0b:b0:1f5:72f:652c with SMTP id
 on11-20020a17090b1d0b00b001f5072f652cmr4345001pjb.38.1662117471335;
        Fri, 02 Sep 2022 04:17:51 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.187])
        by smtp.gmail.com with ESMTPSA id
 m9-20020a17090a4d8900b001f8c532b93dsm1248243pjh.15.2022.09.02.04.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 04:17:50 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Fri, 02 Sep 2022 16:47:45 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] sqlite: CVE-2022-35737 assertion failure
Date: Fri,  2 Sep 2022 16:47:44 +0530
Message-Id: <20220902111744.10595-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 11:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170243

Source: https://www.sqlite.org/
MR: 120541
Type: Security Fix
Disposition: Backport from https://www.sqlite.org/src/info/aab790a16e1bdff7
ChangeID: cf6d0962be0d1f7d4a5019843da6349eb7f9acda
Description:
	 CVE-2022-35737 sqlite: assertion failure via query when compiled with -DSQLITE_ENABLE_STAT4.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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


