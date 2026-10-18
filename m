Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FCCCCF2CF
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 22:37:04 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23098.1792363022841016558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 15:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R09Hun88;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso990173a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 15:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792363022; x=1792967822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XA4Yvp5dnacGYIL5ySdjfBfiVSd9RvQ/yptcAoqJ8ys=;
        b=R09Hun88Jw47HON/avBUNMVFrb6g3AS8My5ZUVvtb0G4G1raEECMYCnUhb53s6iQ8E
         hqsrq9c0XA1ln4GZvJReGWN+MH61kWFzSX33WwiOKyTLP/OGRSH1j4MxsGfdRBGWB3hU
         zv7Z2OWHaGjpdozBcA+398NN5MbZeVOGh2QsaIkIDqxR/3wxRe5knac1FCtJEe1T/vQY
         nM18iCl9zDAeq3/MNfJIAgkIn+wG9ORNYR0IcS8eNHBoggpR2XqU+y20qKvBuN/4rm2h
         MsK6qPIsKXEnz1z+Nduc61Szqoox/pmy5xdp8BRe7us35qYv6EQU24TGu15V4/fN/k2k
         DM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792363022; x=1792967822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XA4Yvp5dnacGYIL5ySdjfBfiVSd9RvQ/yptcAoqJ8ys=;
        b=2YYzYPYSk56IzVwtmFUmpy+s7X/UPo+vxwtzDXjynJgv/w0MIfYFujYIaDaek9S5iS
         ql02QEwjJpFdWIpHTNr0N1eZA/FWUBhrseM1+DoVybWY32cqbVU3uDcSlNims07ZJFG2
         /BRBj9wlwG27idDd9clqKfyvKUjFOE6IEbMd4h5/oWasEYBcMeUU9QeYhLJrMxdDSCRH
         MYrJhAbr26KKJkwg1hZYTFs9UuJp8xRUCkRal7oCRZCD2oemjHm5ze+uC760Sx7I4Ul4
         qbShMUdR0nytKrYc2QFv7Ii71jYLaNhUycFSohJgC4YlZzFiVw1/iS0hhNAyqjzOJacF
         fSwA==
X-Gm-Message-State: AFq9FYIDW4QNwkVfrgrLbp/SSxlYhdSdQ3/7eK9BHhCNiCel3+HYPuZe
	fubsLy3SRI6M9knIPkJFLrKALmI9sxJUNdv+mMX2LnuFQNJvyAsDcrhhruX2qg==
X-Gm-Gg: AYBFou3xEkgwB5S4bIqOeRkqVoDY8TJ+K95wUB/H/2LjJ+R2ioZnMbpmN8bsCfi3ZpN
	RCsx/S8rZ0LYATJuFFqEoWm6v46dYKrJH15Vqn8XCQOL4ujg/WHtGSgwtv6LPxYE/XNZQOJ07s2
	yxwNI4ZCZCfAuVKwHeeciFKnv0nu4uaF66MsLp9ggrRLjcnqRll246ySSmV5noqFHB/8YsrGe6v
	gx4OPF8ppqBMwXm/k1gk2Nhp8PF98nFZZkXBR07QpDWm6Wza9xjSgqS6ukB/SjOF+bHui+G6oZc
	cQdzuS5m+qW5ke2WpwuJ4rPtrig3LIb8fJ1ciV9zcPSXJIIP3OsGn2idUtvi67KXW437h+ausPV
	B04l8twnfCQRTo66sNwaCD2fH2GL6/AI3RTe8FCiR3FWe4SaoSJhyl/6lwV+Bt7MbSodI4QMvtG
	1snh7KhsTIpFeVcf1em14yIqBiNEKf8K86skhXYs2OwnuXuKgvG3HIsoAgD/9o2EDDPG3O5F5yB
	ZLADsZscpZG8L8LPNhg9sFMJ/kjF1DlIPHEObDoFmFMR2LXRA==
X-Received: by 2002:a17:90b:28d0:b0:3ab:189b:6981 with SMTP id 98e67ed59e1d1-3acef51e8e7mr5088411a91.48.1792363022146;
        Sun, 18 Oct 2026 15:37:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm17875989a91.0.2026.10.18.15.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:37:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [PATCH] librepo: upgrade 1.21.1 -> 1.21.2
Date: Mon, 19 Oct 2026 11:36:44 +1300
Message-ID: <20261018223644.291257-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018223644.291257-1-ankur.tyagi85@gmail.com>
References: <20261018223644.291257-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 22:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248115

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/rpm-software-management/librepo/releases/tag/1.21.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../librepo/{librepo_1.21.1.bb => librepo_1.21.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.21.1.bb => librepo_1.21.2.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.21.1.bb b/meta/recipes-devtools/librepo/librepo_1.21.2.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.21.1.bb
rename to meta/recipes-devtools/librepo/librepo_1.21.2.bb
index 9cefbfd48e..ab60e76b6e 100644
--- a/meta/recipes-devtools/librepo/librepo_1.21.1.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.21.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            "
 
-SRCREV = "86ed082e25bbd1901d21d75924297c7697b33307"
+SRCREV = "f892f216a8f7934f32846712f56a27f997b300a3"
 
 DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 

