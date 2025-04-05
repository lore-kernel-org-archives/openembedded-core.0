Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727C3C36010
	for <webhook@archiver.kernel.org>; Sat,  5 Apr 2025 14:00:44 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.6548.1743861636031197982
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Apr 2025 07:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uh+1FvkE;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so15177015e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Apr 2025 07:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743861634; x=1744466434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m1lqLpkgJ02ZqBaHsI63JJYjNyBed6BJDHZvieDD3LA=;
        b=Uh+1FvkE6MKUTYt/9nrG6nWWORuNhM/fMfQdqWIPeaqXUyEI3TJ4gygbCHMmtaaLGN
         31w2x/G11Q24uVQxg7mqwSsWt4BVo0YAiaJRN+uEOrtAS5divxXS40sbXIyCo0hlB61J
         hv5wyzxIpYLiId4+1vvjeee6n6SzJgtZOYPDBNuYhtebizHh5FJi6y0dIOcHUQ9P7UZf
         Vz/1cQsbXaYxvrdcJHyvW2OQEE0u4anRZa5VCv77uT+QoixOaPYKKOtrX9lP+mgNO3ko
         kEATMXAtid8HL5T2/QHv2zZl9+V5n15Fen/do/nxIaqzjXxoK+ThqenceBHRBgWnuLMc
         A1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743861634; x=1744466434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1lqLpkgJ02ZqBaHsI63JJYjNyBed6BJDHZvieDD3LA=;
        b=AwqrWCmQxrqoQJVAm3FVw1edsKQqwNV+laKa2mm+XU22l42d1XUXqvSS57WZfqsuFH
         EHxdd7zp38T+479MFQXN0/yH8btQtpng6B1xQzSXcRB2Q+TatsDcdclrlYLeP5obS8Lo
         +1iiiaq258n99Qpy9Yoqizn59hiJvAnNPEh1YCKHCS6RLzKSASTggLecDPkkpY7LHYlg
         B4Z3g2kUbErOqEM5Ffn1qP12UyUr9gpBPger8wQQAXgeF+PUSXSrOY6E+dihM3fm4K7g
         BZ39NEKMtD0ctG6mV4uPUmnS73ZjMVyxV/XSfl6zzRSrL+WYCduvYbPhoy1dDl8HwCVy
         pMzA==
X-Gm-Message-State: AOJu0YynTPTucZAC9vPPDerbL4C2WWQDSY6eYEOn6OWdn18VbVSFi+xC
	zFTwPLlPDL73ED+86s+HfG6uQ5ZB7cbTjnMFVQB0heHzxBxtO8L2yG5yxQ==
X-Gm-Gg: ASbGncuyXWf/9YxX9sCfS5MWvCZT87k2hbKicbZFRvghtwvXgjyyn0KukYbfcQ56ZdS
	MuiLY7kuQwBQJ5Xx8XgTFmnIA7OZb+kfiDh3EovXIxhIH619vm/DRDb9lCKbndhlOzSamxs/6xg
	VFzLe0e5IiFHvoIEx2Yxfvl9CpWmeYTArARHKT0JtvJdJZJy9xdlRGPFO1RrOPWCSTdcl1kdBvH
	m7lsxURGs0c1oXWMCMcFqjzuGC7XgN4hB9j/q7tRPO0bgfgTTWV/owFoHI9L+Ex/py5QA867NeL
	HGqpxDJCdTPhZaUxe8UJ7gU6+212ydlvYnsqR7+dvitiixDgFuIpXwg8JrTVAlABiz3Gzg==
X-Google-Smtp-Source: AGHT+IHEjaBKMl3FxixGeHZ/FTVI2aDo8GlCOMUvD1WzIGzT+P4aY7VV5Ze2BV15FXKhsfb/qzo8/w==
X-Received: by 2002:a05:600c:1e13:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-43ecf8e72d6mr67854175e9.18.1743861633717;
        Sat, 05 Apr 2025 07:00:33 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm77447335e9.23.2025.04.05.07.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:00:33 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: remove obsolete patch for test-gatt
Date: Sat,  5 Apr 2025 14:00:22 +0000
Message-ID: <20250405140022.34070-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Apr 2025 14:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214373

The issue is no longer present. Tested BlueZ 5.80 and 5.82
The issue has likely been gone for quite a while.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 -
 .../0001-test-gatt-Fix-hung-issue.patch       | 40 -------------------
 2 files changed, 41 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index bc913cb7cf..7bae968094 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -67,7 +67,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://init \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
-           file://0001-test-gatt-Fix-hung-issue.patch \
            file://0001-bluez5-disable-aics-tests.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
deleted file mode 100644
index 90c5ebdcc6..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 0787e67bebbf8492b6c5f03ed816cf881edbea64 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Fri, 24 Aug 2018 12:04:03 +0800
-Subject: [PATCH] test-gatt: Fix hung issue
-
-The below test hangs infinitely
-$ unit/test-gatt -p  /robustness/unkown-request -d
-/robustness/unkown-request - init
-/robustness/unkown-request - setup
-/robustness/unkown-request - setup complete
-/robustness/unkown-request - run
-  GATT: < 02 17 00                                         ...
-  bt_gatt_server:MTU exchange complete, with MTU: 23
-  GATT: > 03 00 02                                         ...
-  PDU: = 03 00 02                                         ...
-  GATT: < bf 00
-
-Actually, the /robustness/unkown-request test does
-no action.
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-bluetooth&m=153508881804635&w=2]
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- unit/test-gatt.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/unit/test-gatt.c b/unit/test-gatt.c
-index 1613fbc..25dd614 100644
---- a/unit/test-gatt.c
-+++ b/unit/test-gatt.c
-@@ -4547,7 +4547,7 @@ int main(int argc, char *argv[])
- 			test_server, service_db_1, NULL,
- 			raw_pdu(0x03, 0x00, 0x02),
- 			raw_pdu(0xbf, 0x00),
--			raw_pdu(0x01, 0xbf, 0x00, 0x00, 0x06));
-+			raw_pdu());
- 
- 	define_test_server("/robustness/unkown-command",
- 			test_server, service_db_1, NULL,
-- 
2.43.0


