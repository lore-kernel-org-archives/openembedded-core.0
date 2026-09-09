Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5681EC79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 20:33:43 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.726.1788986022527849996
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 13:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bwtbhHez;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-395cf2535acso275558a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788986022; x=1789590822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiLFfrXugFGsEWf+HNZrb5SmmTbMQzo6uva9teoLdIQ=;
        b=bwtbhHez/asf5E+DEYuqDvWHZnS5MG2RpNGBDZTmrPwFANT+L0WD3CGd2WqJ/XTpdz
         Ls6Vxnmktd4aCoMkQAlgxMZOP/MQRWdycIY78xdDb/7sTObuBC40ubEw2zMSQGadNIv7
         woYUbK3L9FlbGgIkmyQKw2h8A3zr5xbOpOP7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986022; x=1789590822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PiLFfrXugFGsEWf+HNZrb5SmmTbMQzo6uva9teoLdIQ=;
        b=e2NyGkiDCNQ7sLa+b/BNoHVbNk2/cl4cWnfIAD/47m7kuvscqWK4TpWEYQDvh70JXs
         SN7iFsvMb/2n8AgzoU8M80Ngc74z/LDysri1B95Y1HooDMN1S5cfJ6aphJfquO0NdFIo
         0r8KngFcnnfbvDAFFiLY09MELYKEbsLWUM2it1OcEgOc/c/kLknhcQZW0sWFr3vqVdqo
         MXvV+SnNhS8K4pErpJYSnirDcO/RTH9a9Ghtn+nICGoGz5nbeFBSVc/JMFIpSVjaNiVx
         IinIkrTpxTa7c0bKEyHwbbpUeSIHPlJTZ/LOvqmoeXLozyYxSMzum0d89D7Gc4TyGTtI
         72ww==
X-Gm-Message-State: AFuF++k6es2gZUNE6y5INm9+GD6kJO6SrzXRgiWKMxdsKqPk/WdsDb/d
	4O0Q6qnzr5tZvRGXoEuvbuxC+2en+kpmte3YDrbEeRf9fUZnXRv51K9tDEO58sWLyvjYI/BrsYA
	ty7j/
X-Gm-Gg: AYBFou05C4yaboKmWTpZPpodvn4f0UtrAzuAa/gT8/UNC7lj7qvifsgZRis+ZR9Uy4E
	hjP2smlyME+oDB4PO5W+f0HO+MLlHIATGfmnppcmcwIXk6FA6h9IwtK94z/1Ql8n67jP2YmxrU0
	IFEsoWMhmYQGSthzhHjE+ABuB41Fv2YQk1S8g0ZhQEMhbob4vl9pLBIZPKLeJHNcHpdIyBM16CQ
	kmAU1GS/m5+VOmgyWEwtZvKov8iXE1yPvxkMixP19IeIjRs+jATvl0EyQRCR0KPCi++d2t/+hfH
	QwucBt2PVLwJ6yPurWFje2m/FxPDDPWWfeTkGdBr5REY+zvU2P1TqtNi8etK7mCkKdvzrcopfDE
	OgrpjE59wfY2Nos5c1ZoQJqZJGHcfJIsmLcJasRMgrXThGheAnMyG1HpW8kWUm0b1YgnrIEM/Dp
	UuTTmbUDN92XgSL8tesSKPeozn8XS+gqgzb3SqEH0J0Q+sPJoWaEg4+dRPQOI4Ni35KxOW1X9tR
	AXNdSsw2wFOiDPYVQ==
X-Received: by 2002:a17:90b:4486:b0:398:9beb:a2b7 with SMTP id 98e67ed59e1d1-39d77b7dc9amr1080100a91.25.1788986021826;
        Wed, 09 Sep 2026 13:33:41 -0700 (PDT)
Received: from MVIN00030.mvista.com ([117.254.227.91])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm14163385c88.7.2026.09.09.13.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:33:41 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCH 4/6] curl: Security Fix for CVE-2026-80255
Date: Thu, 10 Sep 2026 02:03:22 +0530
Message-Id: <20260909203324.765094-4-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909203324.765094-1-sdoshi@mvista.com>
References: <20260909203324.765094-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 20:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245497

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

[1] https://curl.se/docs/CVE-2026-80255.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-80255

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../curl/curl/CVE-2026-80255.patch            | 106 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-80255.patch b/meta/recipes-support/curl/curl/CVE-2026-80255.patch
new file mode 100644
index 0000000000..964193bcbd
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-80255.patch
@@ -0,0 +1,106 @@
+From 4f6aa41a0145e930e766775dbe860883d350aa0a Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 27 Aug 2026 08:33:30 +0200
+Subject: [PATCH] cookie: improve TAB handling
+
+For entries with a leading tab. Verified in test 2885.
+
+Reported-by: Stanislav Fort
+Closes #22699
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/4f6aa41a0145e930e766775dbe860883d350aa0a]
+CVE: CVE-2026-80255
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ lib/cookie.c           |  2 +-
+ tests/data/Makefile.am |  1 +
+ tests/data/test2885    | 52 ++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 54 insertions(+), 1 deletion(-)
+ create mode 100644 tests/data/test2885
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 4d53cc4..30ec890 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -453,7 +453,7 @@ parse_cookie_header(struct Curl_easy *data,
+     struct Curl_str val;
+ 
+     /* we have a <name>=<value> pair or a stand-alone word here */
+-    if(!curlx_str_cspn(&ptr, &name, ";\t\r\n=")) {
++    if(!curlx_str_cspn(&ptr, &name, ";\r\n=")) {
+       bool sep = FALSE;
+       curlx_str_trimblanks(&name);
+ 
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index f9d20a9..8bf374f 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -272,6 +272,7 @@ test2600 test2601 test2602 test2603 test2604 test2605 \
+ test2700 test2701 test2702 test2703 test2704 test2705 test2706 test2707 \
+ test2708 test2709 test2710 test2711 test2712 test2713 test2714 test2715 \
+ test2716 test2717 test2718 test2719 test2720 test2721 test2722 test2723 \
++test2885 \
+ \
+ test3000 test3001 test3002 test3003 test3004 test3005 test3006 test3007 \
+ test3008 test3009 test3010 test3011 test3012 test3013 test3014 test3015 \
+diff --git a/tests/data/test2885 b/tests/data/test2885
+new file mode 100644
+index 0000000..456224f
+--- /dev/null
++++ b/tests/data/test2885
+@@ -0,0 +1,52 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++cookies
++</keywords>
++</info>
++
++<reply>
++<data crlf="headers">
++HTTP/1.1 200 OK
++Content-Length: 0
++Set-Cookie: thisis=SECRET;%TABSecure
++Set-Cookie: also=notab; Secure
++
++</data>
++</reply>
++
++<client>
++<features>
++cookies
++</features>
++<server>
++https
++</server>
++<name>
++Cookies with TAB before 'secure'
++</name>
++<command>
++https://cookie.example:%HTTPSPORT/%TESTNUMBER -c %LOGDIR/cookies.txt --resolve cookie.example:%HTTPSPORT:%HOSTIP --insecure
++</command>
++</client>
++
++<verify>
++<protocol crlf="headers">
++GET /%TESTNUMBER HTTP/1.1
++Host: cookie.example:%HTTPSPORT
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++<file name="%LOGDIR/cookies.txt" mode="text">
++# Netscape HTTP Cookie File
++# https://curl.se/docs/http-cookies.html
++# This file was generated by libcurl! Edit at your own risk.
++
++cookie.example%TABFALSE%TAB/%TABTRUE%TAB0%TABalso%TABnotab
++cookie.example%TABFALSE%TAB/%TABTRUE%TAB0%TABthisis%TABSECRET
++</file>
++</verify>
++</testcase>
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index a55cea4e31..a5606c5eb1 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -30,6 +30,7 @@ SRC_URI = " \
     file://CVE-2026-13608.patch \
     file://CVE-2026-18924.patch \
     file://CVE-2026-80229.patch \
+    file://CVE-2026-80255.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


