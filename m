Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F182C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:10:43 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.49406.1710951039141374147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Wr65sPhn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e01c38f98cso24288695ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951038; x=1711555838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRWIAhmeDI6nyUEP/TCxZq1+gUOnJzmbtpHZ3n+PU9w=;
        b=Wr65sPhnW9R/XfL4xslDA9CA+hjuB9wu8HEvcVWP4qKalu+u+CTdnMjcArYy1hOgiW
         Hc4mQYQyua2uK8YE4J6qVf/hP7h2McfEhzb21Ar1gVgLkdGCeaHSeQmU2W99Vmy3uDbv
         teW/98aja7cJAzkXZyhbk4Kz1QRLkvQ4CBgGN2wkFEqQGabWV4+pInXMVZRicN95x22i
         iQWZtOKzfwC1k2z+nXproySnMkoIZGY/Tt0SGufVa2JZJPCjGernejVEeDjPmgiGqL7F
         H92GTObKF68D2zEOAsmPOQDyxmKSptBA473yrhkyRVZFC+aRVoryNEH3VF0Kyd/cw8Oz
         b2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951038; x=1711555838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRWIAhmeDI6nyUEP/TCxZq1+gUOnJzmbtpHZ3n+PU9w=;
        b=Nmj6g7g+QEGCvIs2URnItDkw9OHayR/Y3uSXI/HrWP3t2ByPZFcA9XgwZjhJ5YW+1s
         D6wgUxQO+3lpq2ZejOyncX1CNwZTuE2QI9VriESkLG+llUKxVSgcNt4sqOzm9/Ratb50
         B1R5Rtaf/ZeEgwp0bpJAECRChn/1PAT8j1AiiIcI1sqcMQVo1Ju82Rsf1I1j4WT2CLRC
         NwKWVxAUwmh+CYul/74YS3IBiOCJhiVRWEnc0O2RyebQAVljBHyILn2Q91csIuR+vNGq
         dTiEadALuZ5B0Bzdi2O4xltVYpSsSi1QAtW0EXNU/sR0OgvCS52jiLs+36wg0V3BpaBW
         U3gA==
X-Gm-Message-State: AOJu0YyNWIXQdWC0S6C3MlWQ3q1KgJDEXH7/ErssQ9jdUefYcrnZ2TtQ
	SaUjxRUwJEoUoxQ/q28xgY3gNo6UsNdnnPQAbuG/UDTXCYn/lPS7miI+xN/AVHnACP5+nCDeJXP
	e5uY=
X-Google-Smtp-Source: AGHT+IHnkDCrdlSu0Bh3+32aMC3iD8awmEH9MtnyqYXN9cG0bzvHL+P3aNHxbelKfo4FEGRJ4VZbSw==
X-Received: by 2002:a17:902:e802:b0:1dd:9984:29d3 with SMTP id u2-20020a170902e80200b001dd998429d3mr21471829plg.32.1710951038298;
        Wed, 20 Mar 2024 09:10:38 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.10.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:10:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/15] wireless-regdb: Upgrade 2023.09.01 -> 2024.01.23
Date: Wed, 20 Mar 2024 06:09:49 -1000
Message-Id: <11c9c6eec5ff45cd1fd4858bc28f38693c5d0fde.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197382

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


