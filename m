Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CAFC5B567
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 19:22:21 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36674.1786385968655978877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 11:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=KrOOYMuo;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93695893ac1so58459885a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 11:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786385967; x=1786990767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gI1xm2zaiRedyB2OxWb0lz3xhuyMpH/4kZBC4xvi6jQ=;
        b=KrOOYMuolb+BCLtjKb7EBJpbs5JMGsO/0EGL1iiYKp0zkMtgszcCNWbO0kbAPJLhAl
         P+RE2pGkgBK05Hv8yGULaI9KPLhezlV76F8uPV8/TCNOd6mFMH6Y3f9/fwmynHuu6zPn
         YQ0lswaqkn0eQIQbxYseo9YTXu+BC85J85IALdG0SJN2Ks9Q8Eq3vsvyTo+Zqekqmyce
         HDU1HWghX267fTvy6AJ6AQpKPYFpbhZeKqd7mdyCDvttTW0CP8O1H376cRBxlSVWu8r+
         ach/0m30AsB5Vf30fDBBVsVaME0gpAAs6QGbrNjXXVG4XgrZHLAHgRU1+BpKC0MGqcbm
         jhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385967; x=1786990767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gI1xm2zaiRedyB2OxWb0lz3xhuyMpH/4kZBC4xvi6jQ=;
        b=DmcEVVKDaz4UtbeDSq0zMYccueE3MPVKFWVBn5ycx75nd/HVrkO2hzM1jSbK9W3Kyy
         CF3tqTpn7hkwPO2b6tczV2rIDe9kWlOj45uzHdogIarGPF0nKVI6eKVud4Bk4JVWl1JB
         yde/D/eanbhqnqIDrOU9u62uxoqq8Sx7v4jSjzfizNKAdwQF9ZYQWG1/kR0B+ryWD6GB
         VfgdRAwsTVtWEOaee5CjXzswdNQ5mtdp/Ji0a761EoxR9u2kUnzOlcuzyLrI+18mq4eL
         mBfFq/LGbnWcZ3w1RwyTa09mmHKAyISxKNLA0wvrthC3SvmhJ/dBOcFbpL4sAkprKnkP
         IOdQ==
X-Gm-Message-State: AOJu0Yx47w2CzA6JtEdTzd6WwuC3Ge7IeZV1H1NGanAT/TZi2E8ym/RS
	E1NnfuuifAbeRSqpT9mnOZSDJyVG9kqyUN7jPhcB373/329lg1y2Q2XfUQptPm3AdcPnwvGyorl
	ounlFGEw=
X-Gm-Gg: AR+sD13p419CPCcQxXeZxL8nNBdOE/vOakYguGTI8jEGKcMByWoLmPv0TJc+cz5/32i
	7Fim7awswRMvTAd8qDvWyZgWNrIy/winMPIIAgCOx1kvzILhCIonKgpo6SwGjR69FbMfpvr2ZZo
	jgtSaYglts1CXCYvwsLW41w/jBYZ6CXM7paeaxeLFtpmyiuH8sPWGHSPv+CibAz7dsxo4QTLML4
	NdnHRafNgEqLCL/3Q6gtCcoaS2wLW3Vbzoy5+ggF1TQzGZ8QUSEqvSk8Wr/i41VkFDpWtkvVSMT
	mCac3u+FUiFz0gBf6LX9/0mnvkva1mE4/PMp4XTAJRNB65U1lzxkvU7crlvohjSdgAIQKpeLhEp
	vVnrrM/jUGcuRFtiFAWEQyagpzF5y8590VHp4cZuEe4E0kmKiubF9R0cY35BVMUKzlVb4MZleGo
	pcvbjBfttXbGJdle2un8crS2DdLV719SuhKO25JNSjx8Y+VsZ/q02bS1VMU82FyP/C
X-Received: by 2002:a05:620a:72ab:b0:92a:bbf6:717e with SMTP id af79cd13be357-9369d0dedd4mr342581085a.34.1786385967012;
        Mon, 10 Aug 2026 11:19:27 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e03aeadsm841427585a.3.2026.08.10.11.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:19:25 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: pratik.farkase@est.tech
Subject: [OE-core][PATCH] libpng: skip pngimage-full test on riscv64
Date: Mon, 10 Aug 2026 14:19:23 -0400
Message-ID: <20260810181923.3091327-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 19:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243146

The libpng ptest suite fails intermittently on the Autobuilder. This
seems to be tied to the pngimage-full test, which is the last one to run
and differs from pngimage-quick by using an --exhaustive flag to
indicate that a very wide variety of feature/configuration combos for
the libpng library should be tested. Disable the suite by patching
Makefile.am to exclude it, then conditionally include the patch for
riscv64 systems with a SRC_URI override.

For comparison, here's what the test suite output looks like with the
patch applied (note the last handful of results before the summary):

|PASS: tests/pngunknown-discard
|PASS: tests/pngunknown-if-safe
|PASS: tests/pngunknown-sAPI
|PASS: tests/pngunknown-sTER
|PASS: tests/pngunknown-save
|PASS: tests/pngunknown-vpAg
|PASS: tests/pngimage-quick
|============================================================================
|Testsuite summary for libpng 1.6.58
|============================================================================
|# TOTAL: 35
|# PASS:  35
|# SKIP:  0
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0
|============================================================================
|make[1]: Leaving directory '/usr/lib/libpng/ptest/src'
|DURATION: 464
|END: /usr/lib/libpng/ptest
|2026-08-10T18:09
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemuriscv64:~#

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ile.am-drop-pngimage-full-from-TESTS.patch | 32 +++++++++++++++++++
 .../libpng/libpng_1.6.58.bb                   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/0001-Makefile.am-drop-pngimage-full-from-TESTS.patch

diff --git a/meta/recipes-multimedia/libpng/files/0001-Makefile.am-drop-pngimage-full-from-TESTS.patch b/meta/recipes-multimedia/libpng/files/0001-Makefile.am-drop-pngimage-full-from-TESTS.patch
new file mode 100644
index 0000000000..61349abdaf
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/0001-Makefile.am-drop-pngimage-full-from-TESTS.patch
@@ -0,0 +1,32 @@
+From 4e02adfe6fb14d4a9e78699a313981bd7c9f69f3 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Mon, 10 Aug 2026 13:58:35 -0400
+Subject: [PATCH] Makefile.am: drop pngimage-full from TESTS
+
+This test is prone to failure on riscv64. Remove it from the TESTS list so it
+doesn't get included in the test images.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index eb7078158..59051c2c7 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -109,8 +109,7 @@ TESTS =\
+    tests/pngunknown-sTER\
+    tests/pngunknown-save\
+    tests/pngunknown-vpAg\
+-   tests/pngimage-quick\
+-   tests/pngimage-full
++   tests/pngimage-quick
+ endif
+ 
+ # man pages
+-- 
+2.55.0
+
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
index 6e4e5e9f38..02832640cc 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
@@ -13,6 +13,7 @@ LIBV = "16"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
+SRC_URI:append:riscv64 = " file://0001-Makefile.am-drop-pngimage-full-from-TESTS.patch"
 
 SRC_URI[sha256sum] = "28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775"
 
-- 
2.55.0


