Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75923C36005
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 21:51:52 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.8302.1742939504550560069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 14:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WZ0Wmc8p;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227aaa82fafso70253085ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 14:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742939504; x=1743544304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/+VSF14Zy0C4O27JW83BZKa36SrKGy5QIYIhonbgKQA=;
        b=WZ0Wmc8p59qFDxHsfTitRaMtYH/uzQTkW+9b6ivivN+1NWuUF+AVWXZLAxprabWzgs
         k7xpTxV28o3sUYI7SLPWTQeqSU4MwufcBMBBdQJcoLRKhlJO4QAjF8VwcUhgd7hxEJrq
         PMZT65YmgsyjQIiJJxq4zMrOiKYcAnCNiuZRe2j1iyB83pX1zyKbd7psg7vowm2QoQ50
         tgjS70JFKcTeCOPsrFp+A2TCkPZ730R3cftcBgW91PXUbOIpWQpEqQAEGeM66IihcyS5
         SjKdEGUnPptkfQkQL3SaZHnMiClEs+i7NCfIkGnpE6YtmizYHUeO8EtF/dOJB2EiMkYT
         IZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742939504; x=1743544304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+VSF14Zy0C4O27JW83BZKa36SrKGy5QIYIhonbgKQA=;
        b=Ynz2D3kh/j+ax0iuwitdU4rx+rnjqruEAdlzBSPtvplYl3BnfNiZXIsZ5exMk5JeXj
         0u1xmKlHLpftK/0X8IqSacQUmsUEHAl0Mmlf1U6Nl/TPisKzd87ccxs9+LdfdvnfLpwo
         QdZqhvyFXql1ZeP7c75XVczO0G+zrAGdkiWgPXcISQEZBRteU3J0/FFmcIt28XzmVYph
         1YSxdJT3SVMAEP1uy/vQmpa/GGF6+zOvfcmYqRpBk9D53j4Lo73ltEdvYiJk67DfVdv6
         /5kW6G2HKNVcrcvUQtt8q0f/wicvq5GTMKS23M0eB2lKJaypcfDmtE8BoH9EHZSJOdQ6
         /UJg==
X-Gm-Message-State: AOJu0YzJP3j4mLFWp5whY0l+ZUzLixseULwEf6Lr6HreiCXLCFiT3aoW
	mJExv49q1kdVPoF7LpP3wrnWa4EeqGmsNC7KzW4liR+SHrVBX3HuJ+X32w==
X-Gm-Gg: ASbGncuq0tJIFODe5oZ9xTMgVw+tvM6XSBJD4czKJXfXoYabHppHDInvE8gDVMVEowA
	z6ZM7ORebKsNeOsAPvrph5lmNbKZgjJ9Z4kDv71SMVktMg4A7esNJZDgJDsZf24JeQ3O3dZAtX3
	VaByR4GU2Vyel4YV2ayGpIScWra9DGqIkK5d+TMY87y3TOkTwrwbpZ1c/j5k0lR7zBGUcb8DeE5
	otwcxtvZmdJuBeCmfD5ZWsyvMBq08NQBYJe4kt9dFH7ETRUpgpgT//Jw+rILc6pLItf2RPlEDaX
	zQ/BNHuhK4aBiMTpmrbDcKCo9JXq56iRrhDY/0qWikV+KOm3s9Z3we140izs
X-Google-Smtp-Source: AGHT+IGph5TllIEDBXYfmFqUUpBEIfmWoPL8PEN2vUUae0NMMrk/d4xGUCRMSI/QEALMEY6mbNLXdw==
X-Received: by 2002:a17:903:244f:b0:21f:5cd8:c67 with SMTP id d9443c01a7336-22780dae04dmr282881365ad.31.1742939503430;
        Tue, 25 Mar 2025 14:51:43 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c1:da40:79cd:9ebb:d848:99b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811c1b8fsm95438395ad.154.2025.03.25.14.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 14:51:42 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [styhead][PATCH] linux-firmware: upgrade 20240909 -> 20250311
Date: Tue, 25 Mar 2025 18:51:15 -0300
Message-Id: <20250325215115.10430-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 21:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213621

From: Hiago De Franco <hiago.franco@toradex.com>

Update the linux-firmware recipe to the most recent upstream tag.

Since commit 515022675f81 ("make: separate installation and
de-duplication targets") in linux-firmware, 'install-nodedup' no longer
exists. Adapt the do_install function to accommodate these changes, as
done in the oe-core master branch.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 ...20240909.bb => linux-firmware_20250311.bb} | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240909.bb => linux-firmware_20250311.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
index 4bcda67c8f04..69d081ccefa3 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
@@ -158,7 +158,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "6ae5ffd807c84809977286ad0b37acdb"
+WHENCE_CHKSUM  = "886924eb733c4efcec21dff980795771"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -247,23 +247,35 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "943fbd19883cf8eadf89e0b22422549db056557b1ecd30a56400615971369671"
+SRC_URI[sha256sum] = "b1083a36f19aea46f661dcfd4cd462d13933dcb4e7f0dc809525552dd5c3541d"
 
 inherit allarch
 
 CLEANBROKEN = "1"
 
-# Use PACKAGECONFIG_CONFARGS to set the Makefile target
 PACKAGECONFIG ??= ""
-# Enabling dedup will turn duplicate firmware files into links
-PACKAGECONFIG[deduplicate] = "install,install-nodedup,rdfind-native"
+PACKAGECONFIG[deduplicate] = ",,rdfind-native"
+
+# Possible values are "xz" and "zst".
+FIRMWARE_COMPRESSION ?= ""
+
+def fw_compr_suffix(d):
+    compr = d.getVar('FIRMWARE_COMPRESSION')
+    if compr == '':
+        return ''
+    return '-' + compr
 
 do_compile() {
 	:
 }
 
 do_install() {
-        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' ${PACKAGECONFIG_CONFARGS}
+        sed -i 's:^./check_whence.py:#./check_whence.py:' ${S}/copy-firmware.sh
+
+        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install${@fw_compr_suffix(d)}
+        if [ "${@bb.utils.contains('PACKAGECONFIG', 'deduplicate', '1', '0', d)}" = "1" ]; then
+                oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' dedup
+        fi
         cp LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
         cp wfx/LICEN[CS]E.* ${D}${nonarch_base_libdir}/firmware/wfx/
 }
-- 
2.39.5


