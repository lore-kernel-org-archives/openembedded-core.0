Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE82C36008
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 02:41:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.24387.1743302480068844777
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 19:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ki7DhuSx;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-399744f74e9so2278894f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 19:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743302478; x=1743907278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLpnB9H4pZd6/8asaGRfp7PAwUjUvQwK7tPTJbtIZwc=;
        b=ki7DhuSxza8WDZBUJiw0NY4IY8xF2VZiKgS1JNl+nTm9hQ8+UmIXzzDJ9LN+WQ5HZj
         0ifvBWETySs32i78UqGkI9nTcIODKpeSY9JaCK5usTqA7TI1zWZEyU0u5eGBLPr+e6Fe
         kkicqaGNq35hejLCKi9DojiKMacZlFMRhCFqzxg6J/qyxMmr+KQvCveXamo2I+0Zr4KI
         kzYFe51XZ7JhCFvaAQIdpr3P/rr/pvyESkEBoe2ahWjLpAPeIh466mSS/agE3BG541ef
         rcj/tSZY90hAilzLqFoc70jyxOJrWEIyGGD+sGS7PKn4O2ttcKkaD/3IqYLKfTmDx4c7
         vOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743302478; x=1743907278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLpnB9H4pZd6/8asaGRfp7PAwUjUvQwK7tPTJbtIZwc=;
        b=gf0zTnRyahQ6fgVqyBTNQ3aCvhZ5X03NDI3C6e49gkMJUm812dU+tIbA8jE5DPWub6
         g2X6zM+j1wODivP7C763xBXqijeYplbup3DNfJHNPfscxrJNiQ0BmtnTuMGsFW5n2k7c
         ShGuRn8+eyKle6mgW28WRr9/hbZcG8IeD1hZ/ELrdHm8Yv1+HrLZICtvos/2YQ07Yplo
         31VLn2U7SE7c0BGVxJmE4/ZAoJxHON6EHpgv6KoM9J3aSWdrPoY2h+Vgd5FdXpu+UvFV
         dkj3aGWtC2npc4CT+y44UnwSR2L434yVyvNHTiPUd5ORiApWp2xvCVr75ceq0W2pVMcH
         weBw==
X-Gm-Message-State: AOJu0YzXIj2lQOPaveXL+CWneggeuGfFJYPea00UKUx8O4XM67ZU99Xu
	bftqu72xZC9ibYQF8MlOZN846cSlMcMEz3RtSBSxcumpwAM6wAuEVCGJdQ==
X-Gm-Gg: ASbGncsrzjKRlTaEe9xLdUTgnwN1xGxFPwkzDxik4auN6/QxRgFJjxS+Thr/0HwisI9
	7cAH1OlcsiyH494cpKQbsoBbj+YtjnEheP93lrL4BLZMmiCtletJ8owK3dsRwt4dg9wC80BNayr
	NcIW+N4iNwdIU5poK10nRbICW7AxgqlZXafh4eSEkganOkYUkm6p/M+IF6PDuBpWXeRSKrCIIaP
	Sc0fpKk9WQargyy47MRJHzjAbG8J0De/KVct9O1hGaR5vQeXLKoGJwDOjQyWwzNiS8gFYbz3dZK
	GEdOMhRFWesiXELdGL7fOC9cWONyrj+t/dSJ4kC3W0AXepjy8zYejKZB6Nz/ay75wYvHpQ==
X-Google-Smtp-Source: AGHT+IGLkeMQVi0APKRRpju3j0K6AaUMahijA50fvYYzZf8o0Vbj6jwcuChhDdsvs7rH7eSC+wVM7w==
X-Received: by 2002:a05:6000:4202:b0:38f:3a89:fdb5 with SMTP id ffacd0b85a97d-39c120c7d6fmr2962801f8f.11.1743302477885;
        Sat, 29 Mar 2025 19:41:17 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0dcc66a4sm6328999f8f.42.2025.03.29.19.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 19:41:16 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH v3 3/3] bluez5: disable aics tests
Date: Sun, 30 Mar 2025 02:41:02 +0000
Message-ID: <20250330024103.64558-3-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250330024103.64558-1-gudni.m.g@gmail.com>
References: <20250330024103.64558-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 02:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213913

Temporarily disable aics tests as they can fail
depending on how the tests are executed. Sometimes they pass,
sometimes they fail. The issue has been observed since BlueZ 5.72 to 5.80

Starting with BlueZ 5.80, the tests began failing when using the
ptest-runner script. This is not a new issue in BlueZ 5.80 which is
why the test is disabled with this commit until a solution is found.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../0001-bluez5-disable-aics-tests.patch      | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a81f317a37..f240743a05 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -69,6 +69,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+           file://0001-bluez5-disable-aics-tests.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch
new file mode 100644
index 0000000000..e5ece59cec
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch
@@ -0,0 +1,40 @@
+From 9958e88edf74509faf759099896b37477625913f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
+Date: Sun, 30 Mar 2025 02:20:24 +0000
+Subject: [PATCH] bluez5: disable aics tests
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Temporarily disable aics tests as they can fail
+depending on how the tests are executed. Sometimes they pass,
+sometimes they fail. The issue has been observed since BlueZ 5.72 to 5.80
+
+Starting with BlueZ 5.80, the tests began failing when using the
+ptest-runner script. This is not a new issue in BlueZ 5.80 which is
+why the test is disabled with this commit until a solution is found.
+
+See discussion on Github:
+https://github.com/bluez/bluez/issues/726
+https://github.com/bluez/bluez/issues/683
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
+---
+ unit/test-vcp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/unit/test-vcp.c b/unit/test-vcp.c
+index 6a61ea2..04b92e4 100644
+--- a/unit/test-vcp.c
++++ b/unit/test-vcp.c
+@@ -2754,7 +2754,7 @@ int main(int argc, char *argv[])
+ 	tester_init(&argc, &argv);
+ 
+ 	test_vocs_unit_testcases();
+-	test_aics_unit_testcases();
++	//test_aics_unit_testcases();
+ 
+ 	return tester_run();
+ }
-- 
2.43.0


