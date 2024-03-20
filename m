Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C12CD11BF
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:44:44 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.50472.1710953075465054540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1k2jeCE5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e6b54a28d0so91119b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710953075; x=1711557875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ye/qgBPVqy3UhemdehR89gJrLXH4Xqh7Ft8kyqknKVU=;
        b=1k2jeCE5wneiTbA6vVaZTXvN2NEv1agtNODPcSOC/zSQW0kqCxHpRvF5ZkxXSEhPTo
         d1qfr64jwoFKv5fcUG4waNZvm83ztyzvIU++wX+3czj0MHO1qNsWgClr/57zE+HXJ/N9
         D9tCx5hkO3EFfkz+huwCqDtLZS98N4RUx5C8EEFh9UXgMb1XwArWoRKjL066bCyphJ5z
         zlHdt3BWi6xx/qHaPEz/kb0LjA2YaB3XBPoGF4WoOECT0/qkoUUSbKH6ucVpoxNL13Yj
         688GNtqiYMD3Idm+4v8f5GA1tyYAv97S0Ap2CUPZ1YN3w+7Hi8eVLJQcV7dCNJAgS2+m
         0xRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710953075; x=1711557875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ye/qgBPVqy3UhemdehR89gJrLXH4Xqh7Ft8kyqknKVU=;
        b=PXmGZ4s3bUkI2nZappTwEGxCsgLNGPNKuJ63kQx8b9taY/hRdT/TSgYR8Pq3bOKlZG
         OVQsdIJmbSEFKMoeuEmNJBMYRD8Rbgo2rUpHEAWP6FaEPmf7y+mn8I5znqYXXKL12ncw
         ee4Z/ay7nDSUUoPKsHN2FERIXz1aaa9+pmvNA/RljOQ5KD61MNwS/E8ZCmit2GVA+lhd
         JIOMyL0gKNjSygtFnm3rP5dqnLmw46Q7yXu8MgfWeXUD2Meii8hVzY9yQ9AYk1vmTlBF
         ukhJLNtGXywR/lPhh5fi8W6qKYqCwTSFvdc+QvMhveUrMEtEampiJ0Xl23gB/IWfYbyT
         DPOA==
X-Gm-Message-State: AOJu0YxuDP4UJ9rn/CCFuNZgTZCiFK5K54JOlMlkrADocyC6NsZZU9nP
	/4ZOhIoE5Yq85dBVA5O2f3zybP4iFRhNn+zz4VGwSeShl9OAsbvNl0xIjjt5qsqMPib3ydJnhRm
	avmE=
X-Google-Smtp-Source: AGHT+IFjbrQmdTGKX1WQ59tf7pNJwwHuV+w97K7gyrtnfoDv8PPWNu9KD41SZZI3ju5/CLGhaHqaXg==
X-Received: by 2002:a05:6a00:3a1f:b0:6ea:2501:d600 with SMTP id fj31-20020a056a003a1f00b006ea2501d600mr496533pfb.33.1710953074723;
        Wed, 20 Mar 2024 09:44:34 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a3-20020a62d403000000b006e6bfff6085sm12725437pfh.143.2024.03.20.09.44.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:44:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/12] wireless-regdb: Upgrade 2023.09.01 -> 2024.01.23
Date: Wed, 20 Mar 2024 06:44:03 -1000
Message-Id: <2f178a685137887f58271b84597409b6e0c395c6.1710952928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710952928.git.steve@sakoman.com>
References: <cover.1710952928.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197396

From: Alex Kiernan <alex.kiernan@gmail.com>

Upstream maintainer has changed to Chen-Yu Tsai <wens@kernel.org>:

https://lore.kernel.org/all/CAGb2v657baNMPKU3QADijx7hZa=GUcSv2LEDdn6N=QQaFX8r-g@mail.gmail.com/

Note that fb768d3b13ff ("wifi: cfg80211: Add my certificate") and
3c2a8ebe3fe6 ("wifi: cfg80211: fix certs build to not depend on file
order") are required if you are using kernel signature verification.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit abf169fbbf8bab13224adf4c8bfa2e26607f360c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...eless-regdb_2023.09.01.bb => wireless-regdb_2024.01.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.09.01.bb => wireless-regdb_2024.01.23.bb} (88%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
similarity index 88%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
index 9187d257ca..6489bc90d9 100644
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
2.34.1


