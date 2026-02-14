Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B34FEF48D4
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 15:30:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7834.1771083053351474704
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Feb 2026 07:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a8kEx6be;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-481188b7760so15571175e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Feb 2026 07:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771083051; x=1771687851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVO5y/BYN65wfgXTY/o6CCaz5STUlRewCV/8+iATttM=;
        b=a8kEx6beNSdij6dTyjZIvgNvQfvxb9xaCpvNK8AgGGO+0C4nJ0315w2EUliwDgP2e/
         3FeDFhNmWw5M3KWIKS3Izo8ZmScyK1h1lq8NKjr1jicVKenPJMYeQKGxQiZwhPrBzzhu
         wIQX1+vrNf7m1Mpi39F50b6Adx7PrwhjGQe+eCso6DyoyD9/prjrGzFiVfq2c47uoMsw
         Ow8U8vwblQUnKqPh/kEoPcWudOkbPTAMoo8hCB6++cpDfK/x0TZiuerQE15C5OxEkQir
         yMwj86m37DOcs2wArUeteUzJVYTVlprBPbH6U3bfxw/TvinvcrWAAM0aAaAGhC11IhfA
         wU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771083051; x=1771687851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVO5y/BYN65wfgXTY/o6CCaz5STUlRewCV/8+iATttM=;
        b=J9vn0Da0qO/kglGzgHJtDWV0mBVBMMRI3bHIlPB9m+odRpl1inaX0NEQAh/RNG758T
         MeUSkeEEuxf3rkkUZJLO7k45FtNJQvJdvvEAGAfjQ2Y5R6g//xYx+pqf0u5KhcufFDVy
         wyqkLbsEteLXIrsy/dfdBkAkszkCzq8JNtX2Hu/sL0TCgjELwxaaRU1iRsJ2JvB8/fJ4
         6JUvdC461MYNJF51yt5L5m3/PMEkOzUk6F8pe7beRh42wtSug6fuEyfsn77zCeWDWsyI
         PwrIuzuiKmWs4jUJMifPR5xocbQZD8/z4Iu78nimOQ1zBSEv0wuO7WEsNUlQRv+2REM7
         Bkmg==
X-Gm-Message-State: AOJu0YwhggzuAOvypfA6g1cehgIarBGhy2cGFAxc1LWTU/6yFAudScG3
	q61uIgwfTMDX3hVzDWa4UnZwQitsHVe2R0Sug8/WQDfNA0MAAhw3dsiY/pHa+A==
X-Gm-Gg: AZuq6aILuOBK0rXF2RG/xB+xA3D4gP9npn9Hs7y+2h7/NKV/twodr4gBZvmj1UlofKc
	X1pMxpeHF4GoX/mDNFJhU+BhIIJlS+9oK9VrWNP6036ciWsXayIeAhWQ+wpC7x6MsrWzBLSSTiy
	kNToPR/Y6vq9pqAxrf71Og855VB8cMyydovdUvdL7zTczlb2oZB3P78INNKp39z6C0jCvdaToHt
	EkORl1h7+8EymxHvkO9clTqfmOy71dJaTib0oi77d3j8id0tDvpfVvFtf7xk7Rw/NPhxOxMQaFw
	lLHVLbQKpCHYYSs9UJxLtb6GnRSHpDh7KXIB8I/nyorqF+mdWMVXNPBMYAGPR9dHUvgH2M5BiRX
	OHkAf9bnh5mmfxgrS0WzxRtzBpGQmwJ73GnswJ99iK3fTIOq/ybR9+E+ppbrfRG2kRTuZ8OFIf0
	5d5QJQzFvkMcqq0B7P5AtzgQ8biFAq+jHYHuwVy/GS8/7Ik8s=
X-Received: by 2002:a05:600c:4e4d:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-48373a37b73mr87389715e9.20.1771083051175;
        Sat, 14 Feb 2026 07:30:51 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a29982sm40196515e9.15.2026.02.14.07.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 07:30:50 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: upgrade 5.85 -> 5.86
Date: Sat, 14 Feb 2026 15:30:39 +0000
Message-ID: <20260214153039.2022198-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Feb 2026 15:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231147

Changelog:

- Fix issue with number of retries on authentication failures.
- Fix issue with G.722 @ 16 kHz codec ID value reported by transport.
- Add support for Telephony interface.
- Add support for Ranging profile.
- Add support for GMAP service.
- Add support for TMAP service.

Full changelog:
https://github.com/bluez/bluez/compare/5.85...5.86

Changes relevant for the build:
- mcaptest tool has been removed
- sap and health profiles have been removed from the code base

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc               | 8 ++++++--
 .../bluez5/{bluez5_5.85.bb => bluez5_5.86.bb}             | 3 +--
 2 files changed, 7 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.85.bb => bluez5_5.86.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 24a41f92df..dd20583015 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -22,6 +22,9 @@ PACKAGECONFIG ??= "obex-profiles \
     vcp-profiles \
     micp-profiles \
     csip-profiles \
+    tmap-profiles \
+    gmap-profiles \
+    hfp-profiles \
     asha-profiles \
     network-profiles \
     hid-profiles \
@@ -37,13 +40,11 @@ PACKAGECONFIG[midi] = "--enable-midi,--disable-midi,alsa-lib"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,,cups"
 PACKAGECONFIG[nfc] = "--enable-nfc,--disable-nfc"
-PACKAGECONFIG[sap-profiles] = "--enable-sap,--disable-sap"
 PACKAGECONFIG[a2dp-profiles] = "--enable-a2dp,--disable-a2dp"
 PACKAGECONFIG[avrcp-profiles] = "--enable-avrcp,--disable-avrcp"
 PACKAGECONFIG[network-profiles] = "--enable-network,--disable-network"
 PACKAGECONFIG[hid-profiles] = "--enable-hid,--disable-hid"
 PACKAGECONFIG[hog-profiles] = "--enable-hog,--disable-hog"
-PACKAGECONFIG[health-profiles] = "--enable-health,--disable-health"
 PACKAGECONFIG[bap-profiles] = "--enable-bap,--disable-bap"
 PACKAGECONFIG[bass-profiles] = "--enable-bass,--disable-bass"
 PACKAGECONFIG[mcp-profiles] = "--enable-mcp,--disable-mcp"
@@ -51,6 +52,9 @@ PACKAGECONFIG[ccp-profiles] = "--enable-ccp,--disable-ccp"
 PACKAGECONFIG[vcp-profiles] = "--enable-vcp,--disable-vcp"
 PACKAGECONFIG[micp-profiles] = "--enable-micp,--disable-micp"
 PACKAGECONFIG[csip-profiles] = "--enable-csip,--disable-csip"
+PACKAGECONFIG[tmap-profiles] = "--enable-tmap,--disable-tmap"
+PACKAGECONFIG[gmap-profiles] = "--enable-gmap,--disable-gmap"
+PACKAGECONFIG[hfp-profiles] = "--enable-hfp,--disable-hfp"
 PACKAGECONFIG[asha-profiles] = "--enable-asha,--disable-asha"
 PACKAGECONFIG[sixaxis] = "--enable-sixaxis,--disable-sixaxis"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.85.bb b/meta/recipes-connectivity/bluez5/bluez5_5.86.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.85.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.86.bb
index d8965fef4b..7f9972f59e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.85.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.86.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "ad028e49254bc4551a13f08fe7904c63d02ba650d77be8ae15bb3b0a0ad94a6f"
+SRC_URI[sha256sum] = "99f144540c6070591e4c53bcb977eb42664c62b7b36cb35a29cf72ded339621d"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
@@ -54,7 +54,6 @@ NOINST_TOOLS_BT ?= " \
     tools/btproxy \
     tools/btiotest \
     tools/bneptest \
-    tools/mcaptest \
     tools/cltest \
     tools/oobtest \
     tools/advtest \
-- 
2.43.0


