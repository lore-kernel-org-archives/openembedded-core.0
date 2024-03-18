Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A99C54E68
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:21 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.34077.1710728540546556090
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OFiMrLhO;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.51, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5a4859178f1so1278532eaf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728540; x=1711333340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRWIAhmeDI6nyUEP/TCxZq1+gUOnJzmbtpHZ3n+PU9w=;
        b=OFiMrLhOKG6jYKnKEtPff1/3iihq+aiAubGyHuYNxT1dhiSDks9KJ9/xMClb/au98r
         5JNK3ma7qypLvD8Ht1NuBEl94EJLY1OYzCJknTkZzcxbznmEVsdWuZ5lcXckWwubtD7j
         GXFawJVYgvHEfrHM1SH0Ez/OKBT11Be3juD4FlRZ0hWBpwVGbq4g6qiTnjvPI2ZKWla9
         5jUxVul6B1VzfAqPgPWUNM73bqRBXdzXBD+hd6aADMFZeISfj3QA6zvm6Yj0iNuXRhNr
         YJAV0vQQJwKYpfWOyD+ErgTmQ9DXd/vs9Jy6Nx4EswmJ/twUeZLOG0BTWo3updS/AVNF
         6URg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728540; x=1711333340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRWIAhmeDI6nyUEP/TCxZq1+gUOnJzmbtpHZ3n+PU9w=;
        b=tufOBK+UuXTAlXE/1VsHOgQC7XX2WjHZxkqFiA23zW2NpFL2nMXu7AH0wLPfTo33EU
         A+NH7W8tAMX8p7C9RxqfwdnAJ109JGqoByd+cpAFJ+ADE2JnokVpYFg2l0jdP2eBD/GS
         Cdc6G1EYNCOq+yEBiUDcoX/dhkqWZMEiTUd6KEafZgdD3iNFFgfkdTRICrt1yGi5stQy
         xIZ7uLjJQFViIutlSKoC6McQIwaU7bMgMUMoWaz9/meNBYstRVhZ7/F/uXjpLsn5TwDa
         z1tFQ3L7r8qbrEJnFYAxCXuqx2qIKgH0I8eEh10/FI98YiQw3cflZNS92/7SW3aBeT5Y
         s4Ag==
X-Gm-Message-State: AOJu0Yxy9g3CNzG9ifs+BRS3Ki1iKjSIjFGD/UhsXWxvia8vptHL5721
	CRqIziDApM3A7pPsslhYhSn9/2xxhxH06qbAoGeDlQkKb1Bg+VP7FXv8hjkQ5375i86DRJZESqV
	4i+Ggxg==
X-Google-Smtp-Source: AGHT+IElNOenvGwq++ctwd4M0fC0yR7QJ6kKzqBn1dvqT3fO6qZMDDRH6E3lneMQ2u/5TbOoasFxcg==
X-Received: by 2002:a05:6358:789:b0:17e:f370:5308 with SMTP id n9-20020a056358078900b0017ef3705308mr1434630rwj.29.1710728539755;
        Sun, 17 Mar 2024 19:22:19 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 10/14] wireless-regdb: Upgrade 2023.09.01 -> 2024.01.23
Date: Sun, 17 Mar 2024 16:21:54 -1000
Message-Id: <a9a799a6ab27947071f76211901d5bde160e5894.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710728384.git.steve@sakoman.com>
References: <cover.1710728384.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197285

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
index c09600ecbe..8fde236ab4 100644
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


