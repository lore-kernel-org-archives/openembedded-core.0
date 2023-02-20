Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C367C05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 12:45:30 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.11753.1676897123252437192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 04:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WSGQQ6Ha;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id p26so833836wmc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 04:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjqffOGh5aedcldOlDjDKxF+Uh0MGK+sgGewC+6LFbA=;
        b=WSGQQ6Ham5PFBZY5PaSzSf11iHT6SpXOFq+BcKJodfJvt4qrg/NoiyF5g9yGyqyKaE
         EuuFZsSRpPcNeU/khS3WkV2grJBJqrF9wxPMf1W5eRbve7U6ABEu7HniuA87VoJbde66
         O7LsLXRSofT5Zai9dF++Rj+xdi9YXr1GTwtz8QdbrdKyOWFtx9igbeIn6+V5WqK6NFmx
         gstufgxT+Lpk+NFxzydsTECgdGn1/Ir4DCrHXHvTOq8yVnJukAy1HnBOOphWyZ+Y+8b+
         t1172b6AhuPRxjFErAonILz5CmtE475trx+zcQkfaWTv4RA9pyn070WM1zTWbWfkLIsy
         qxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjqffOGh5aedcldOlDjDKxF+Uh0MGK+sgGewC+6LFbA=;
        b=3zgoJGMTQetKEyrLXSyh4rbz/r5I3YFDCsZ4Hu9YsZVduqopXQf3oREWxieBDe+xwK
         Fe0wEfHJg74RNAABd3fVGEP+Lwyb8E+8+q8UqkcKs8naZl1t/Pm1QRgsVyVtNQpU05vc
         6wd6geuovOlYzgJQHJx50xuq9r7dzKoMzcNxZK5z8QjlGadLoK9QyWI0RMHoSuFStmEw
         urlGa+EFMxHNd1widtDBeJ/15tJr06W8mUIs6kkPKnVA/xvjXk7R7ZgUzAD5+6dU1bxA
         tHJK+oIZHoMeMaJkD/xQAK+8aAE3BxMg7w6OJuNL6Zzp7MXADAntlrlXnIkiKcO1jiOc
         wvvA==
X-Gm-Message-State: AO0yUKUQego4aAmL1ywUf9eqzM40/ZvlrpdzDSTf0kuv9YU6NIsm3Wvm
	BELnJS/K8TqcyIJ5vguZSIpZrXMLXiBO7A==
X-Google-Smtp-Source: AK7set9/mGtkariPi1C/BTcvwNDRAVjKnyCG/IFO4gqhRUIFlwgnsyRPY32jpqqr3pD3x7TVceu+6Q==
X-Received: by 2002:a05:600c:1714:b0:3dc:2b62:ee9f with SMTP id c20-20020a05600c171400b003dc2b62ee9fmr6251086wmn.3.1676897121379;
        Mon, 20 Feb 2023 04:45:21 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003dfe8c4c497sm9447316wmc.39.2023.02.20.04.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 04:45:21 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] bluez5: refresh patches with devtool
Date: Mon, 20 Feb 2023 12:45:01 +0000
Message-Id: <20230220124501.2357600-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 12:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177400

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch  | 10 ++++------
 ...dd-a-target-for-building-tests-without-runnin.patch | 10 ++++------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index e90b6a546f..06ebf1cde6 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From 61e741654cc2eb167bca212a3bb2ba8f3ba280c1 Mon Sep 17 00:00:00 2001
+From 7dcc5f46a31ac4eaa67c0ab3aaae38005db7458f Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 24 Aug 2018 12:04:03 +0800
 Subject: [PATCH] test-gatt: Fix hung issue
@@ -21,15 +21,16 @@ no action.
 Upstream-Status: Submitted [https://marc.info/?l=linux-bluetooth&m=153508881804635&w=2]
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+
 ---
  unit/test-gatt.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unit/test-gatt.c b/unit/test-gatt.c
-index c7e28f8..b57373b 100644
+index f92d860..a5f7117 100644
 --- a/unit/test-gatt.c
 +++ b/unit/test-gatt.c
-@@ -4463,7 +4463,7 @@ int main(int argc, char *argv[])
+@@ -4479,7 +4479,7 @@ int main(int argc, char *argv[])
  			test_server, service_db_1, NULL,
  			raw_pdu(0x03, 0x00, 0x02),
  			raw_pdu(0xbf, 0x00),
@@ -38,6 +39,3 @@ index c7e28f8..b57373b 100644
  
  	define_test_server("/robustness/unkown-command",
  			test_server, service_db_1, NULL,
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index 24ddae6b63..7c47cc1a1e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,19 +1,20 @@
-From 4bdf0f96dcaa945fd29f26d56e5b36d8c23e4c8b Mon Sep 17 00:00:00 2001
+From a657fddd13a2e756b0af315301f1c44081e2f668 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
 
 Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile.am | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 1a48a71..ba3b92f 100644
+index 7041f8e..25966cd 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -425,6 +425,9 @@ endif
+@@ -594,6 +594,9 @@ endif
  TESTS = $(unit_tests)
  AM_TESTS_ENVIRONMENT = MALLOC_CHECK_=3 MALLOC_PERTURB_=69
  
@@ -23,6 +24,3 @@ index 1a48a71..ba3b92f 100644
  if DBUS_RUN_SESSION
  AM_TESTS_ENVIRONMENT += dbus-run-session --
  endif
--- 
-2.8.0.rc3
-
-- 
2.34.1


