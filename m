Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEE1C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 16:52:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.2574.1707324718736821185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 08:51:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UL/qLAug;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-410177e41a8so5571615e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 08:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707324717; x=1707929517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgaKZT2CTxJT7PQPs2p8UVY6a16ylknVUQOyaP9uvtg=;
        b=UL/qLAugyLLqbxAy7pl+kTIs02qKHOXtSGHq//eA2q9mFYe5SpEUrDdQC9DKl3fsd8
         bThZd5c4F35CGOusB2Nq6fpb4m+65Le/FQVZUuc3AIqvlVHE1Z6ypzIjNCebcgF1BkNy
         RVioRfkpHv0FhYAkoigVwQIGAij99SiAChbEajZyGpwjYMUsVpgPEBcRbyQUNGxNlhYa
         iHk+Ysl8aTqoWqWxb73iuY3WWGnT9cEJKdMmrhhNqb8nzgmjYyWVH0iTqlfPV3t9Ia1U
         8jNzI/pWRltyh+SKgMwf2P5h014D5UGpuKNZzwS1uuMgZbTR5wIb7E9aljrdi4wtcxxW
         BeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707324717; x=1707929517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgaKZT2CTxJT7PQPs2p8UVY6a16ylknVUQOyaP9uvtg=;
        b=RtFXNk2IyHMcnd82/lEloK2YG303886nFhcnqrU2MsXJ32hmGAFNPDagAgVt7FNy0j
         HuNYDpG0+A7adcicuTqMFAAj/SUPUVAjUG2aIQ7zVft7nyP5Q42AxITzmRpzV2ohnAVK
         mpS/aELdN/Zhs3W4II6auFOsBFFLcOGDrQI7TFmlXBUCa8fhSIRWNIElv0eSjLgyfrea
         IVhs/5KFtS4FRmgp05xI4lYo/9rzqtBWpnfi0iku3J+CWvzsATusdqROGjzJnt6uiP36
         N4biUqiWwaMc9BdpoUMHWPCrW3SGi/kwI9rutWg0hbowglDfzsmgR/dyQcHMsf4DiPu0
         g4zw==
X-Gm-Message-State: AOJu0YzDdQH6Pma5wntJjmuBo0v5nq0KsUlKILjbGpQGjC8g6gV8wob9
	guZIW78GP1XyyIKMfNDgMlB68yeEFc2H0v0Y3p7FBs3IBjg4Bhy6rd8ThdJl
X-Google-Smtp-Source: AGHT+IHJ1r/SDZQWUi0aEduh3viZciIulzhw8efL3Sovi+lG4ji7eMiZxw9v3AoD3oZeBtVVc0pH/Q==
X-Received: by 2002:a05:600c:1ca4:b0:40e:e025:8d4e with SMTP id k36-20020a05600c1ca400b0040ee0258d4emr4726642wms.27.1707324716655;
        Wed, 07 Feb 2024 08:51:56 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id i9-20020a05600c354900b0040fc76ed923sm5911173wmq.6.2024.02.07.08.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 08:51:56 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] wireless-regdb: Upgrade 2023.09.01 -> 2024.01.23
Date: Wed,  7 Feb 2024 16:51:54 +0000
Message-Id: <20240207165154.26609-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 16:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195072

Upstream maintainer has changed to Chen-Yu Tsai <wens@kernel.org>:

https://lore.kernel.org/all/CAGb2v657baNMPKU3QADijx7hZa=GUcSv2LEDdn6N=QQaFX8r-g@mail.gmail.com/

Note that fb768d3b13ff ("wifi: cfg80211: Add my certificate") and
3c2a8ebe3fe6 ("wifi: cfg80211: fix certs build to not depend on file
order") are required if you are using kernel signature verification.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...eless-regdb_2023.09.01.bb => wireless-regdb_2024.01.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.09.01.bb => wireless-regdb_2024.01.23.bb} (88%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
similarity index 88%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
index c09600ecbe80..8fde236ab434 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "26d4c2a727cc59239b84735aad856b7c7d0b04e30aa5c235c4f7f47f5f053491"
+SRC_URI[sha256sum] = "c8a61c9acf76fa7eb4239e89f640dee3e87098d9f69b4d3518c9c60fc6d20c55"
 
 inherit bin_package allarch
 
@@ -13,7 +13,7 @@ do_install() {
     install -d -m0755 ${D}${nonarch_libdir}/crda
     install -d -m0755 ${D}${sysconfdir}/wireless-regdb/pubkeys
     install -m 0644 regulatory.bin ${D}${nonarch_libdir}/crda/regulatory.bin
-    install -m 0644 sforshee.key.pub.pem ${D}${sysconfdir}/wireless-regdb/pubkeys/sforshee.key.pub.pem
+    install -m 0644 wens.key.pub.pem ${D}${sysconfdir}/wireless-regdb/pubkeys/wens.key.pub.pem
 
     install -m 0644 -D regulatory.db ${D}${nonarch_base_libdir}/firmware/regulatory.db
     install -m 0644 regulatory.db.p7s ${D}${nonarch_base_libdir}/firmware/regulatory.db.p7s
-- 
2.39.0


