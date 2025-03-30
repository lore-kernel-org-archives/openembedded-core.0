Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A767C36008
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 02:36:50 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.24338.1743302200184887071
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 19:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B8dOz4ql;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3996af42857so2934421f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 19:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743302198; x=1743906998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2zlWjWRgaf47g9LwJ2eH9o7HR0+36oMCy6f2mU/fKI=;
        b=B8dOz4qldkndCTgG7LMTC4HzZsVUeE7orfxWSNKPlP7j2/XYSOQLiRggj9R0FgH5LA
         YoJOO9mby685uDwW/zpYUsBdGxV/9gUmn1rALHZt1jz0eZbdWVXr8oSSt4DtXkCwifel
         2IuXWjdAtXr8tBCXI3CJCzTQNjOaNx7bq+hAliihioehuLCt+cVUIh8JvsynobOvTK1n
         qZWruhgl3B/2IGy44V4rupo6ua7oh4Jj37meqK9/Jv00XmG31mo/ig+A+Mjej/ehzDlI
         GTxyvwJM4I2epWwFrlNzxZO53Ri78rnptk+7dnltQ6om6c3m8hrgWbI7SbY6wqH/dUOG
         Nflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743302198; x=1743906998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2zlWjWRgaf47g9LwJ2eH9o7HR0+36oMCy6f2mU/fKI=;
        b=j95EgjsRaMJ2tUmBRW1RzPWrYjjUXIT02oTfBUSGT7I790cOYHexgJLAl4THhWB6X8
         0YWFE3yhKdGpcOhzXJIqV4K4ZfF9fpBIbeGuaCJFUYdzQBvbiaYrMg0GMCvMikizOnPY
         eaWyLyZ/+XCqdCMNNz4tDi8mPLM8ihnBlvJpGj3iwC4fY8mAsiAtWyCU1kNGx591IEw4
         FgkBh037++6BQ15CaIyHy+oWqlLrgdd32aXsnCLEhIteFG0Wer7KoVRWTDZUAp0nPSmE
         24CoVp7sZP0yIFAdiWJAjEIWbVExuEcE4tzIfKnB7VyfYh8M1UHZhdRJUNzhHD+Oweyf
         rmBg==
X-Gm-Message-State: AOJu0YzKdCCXYzwiWC3aIQNLsXncTmi1fjYkFkYv2CRqT/QtFyPHkoQ7
	iqaWdaNp6Pbv1vuhQxgA5/bJJvUva//U4C/a/wUMrkltYXY7M7Wsbpciug==
X-Gm-Gg: ASbGncss1VQcVnz1x5dROm4DEY7WghX8tKNdpE/Yb9IrfRWBbQuFKMlSpaaQg7bHHKz
	s/ILF0/tUlkxiRK1QgJsoRTqYvgh88x5W9PAWcwmjnfR41VHGejmJE1kvRi7IMMCVaH9p1DsI8l
	sx2v+M8ZkpgKkvjtLPaRrlwHx9FLrRnOyl2q0AWUHIo2UccJvD5Kokw9DwJO5qsAmsHhEhxWeVs
	cdUZwps2UPkl3QNZfHrgQtuIDbgFCOeaOtcEBRFFqJKiuHo5vsjmqBa/VWNqTuUGBhYUJSy9zry
	2S4xgnqo0Ofn5/8YchO4ca5S1SbAPGZxCcVG81lpvfqbAqfOnAvzjevsVxqF5ckkVZ180cq5vv5
	c7K3f
X-Google-Smtp-Source: AGHT+IEesXJH4C/nY/O4namIsK2CGHtFmjCMFGHlv7Gf3ISJWE1Fo+FFeg5mv0e2sVcRzVEFJg7cug==
X-Received: by 2002:a05:6000:4023:b0:391:21e2:ec3b with SMTP id ffacd0b85a97d-39c11b7648amr3272023f8f.3.1743302198019;
        Sat, 29 Mar 2025 19:36:38 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663470sm7304692f8f.27.2025.03.29.19.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 19:36:36 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH v2 2/3] bluez5: add missing tools to noinst-tools package This change will prevent these tools from being installed if the image doesn't install bluez5-noinst-tools package.
Date: Sun, 30 Mar 2025 02:36:22 +0000
Message-ID: <20250330023624.58070-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250330023624.58070-1-gudni.m.g@gmail.com>
References: <20250330023624.58070-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 02:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213908

BlueZ 5.66: tools/mesh-tester
BlueZ 5.66: tools/ioctl-tester
BlueZ 5.65: tools/iso-tester
BlueZ 5.56: tools/btpclientctl
BlueZ 5.51: tools/bcmfw
BlueZ 5.49: tools/rtlfw
BlueZ 5.47: tools/btconfig (not a new tool, but it was moved from bin_PROGRAMS to noinst_PROGRAMS)

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.80.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.80.bb b/meta/recipes-connectivity/bluez5/bluez5_5.80.bb
index 6e5b621971..b7bca4f12d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.80.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.80.bb
@@ -32,6 +32,9 @@ NOINST_TOOLS_TESTING ?= " \
     tools/rfcomm-tester \
     tools/bnep-tester \
     tools/userchan-tester \
+    tools/iso-tester \
+    tools/mesh-tester \
+    tools/ioctl-tester \
 "
 
 # noinst programs in Makefile.tools that are conditional on TOOLS
@@ -45,6 +48,7 @@ NOINST_TOOLS_BT ?= " \
     tools/hcieventmask \
     tools/hcisecfilter \
     tools/btinfo \
+    tools/btconfig \
     tools/btsnoop \
     tools/btproxy \
     tools/btiotest \
@@ -55,6 +59,8 @@ NOINST_TOOLS_BT ?= " \
     tools/advtest \
     tools/seq2bseq \
     tools/nokfw \
+    tools/rtlfw \
+    tools/bcmfw \
     tools/create-image \
     tools/eddystone \
     tools/ibeacon \
@@ -64,5 +70,5 @@ NOINST_TOOLS_BT ?= " \
     tools/check-selftest \
     tools/gatt-service \
     profiles/iap/iapd \
-    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient tools/btpclientctl', '', d)} \
 "
-- 
2.43.0


