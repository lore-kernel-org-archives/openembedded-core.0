Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D114AC001DB
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:24 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.3832.1688092157281044405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=te3GymF7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-55b1238a024so1086035a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092156; x=1690684156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqCklztAs/Wn4V7FB+9ZYGZFzJdWMRDKfaVlAdc34pk=;
        b=te3GymF7FN/gobr0tBItPg6S5pPpmidoOGUnt/OODQpH4W+JLG3Ktv+E84wIOVWNqy
         HxBlfl605H2Bk1ah9HTTYtSPevVh6q8/HEi0VzdL8p18LVo8qWRAJ6U0ekT+Ml1a8Ioz
         Dfgvw+aljvvUrI20Wu5bhRw3eAL7dss7o69t/H7mjFRnjPDdmc15q0yGKxI3d43dNL7k
         i2N6D+pGS9T/TfB4EeWH+gdcCTBwybQim297ru/O5IrI3wwyJpGaDNTXQ3oJ8PuLbvW1
         t55c9sWM92Uy7P1BJrZijWj0+MU4pVefxExFMnPrQGau7Ib85OWKI/XRKL/HK9qWgLGv
         bsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092156; x=1690684156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqCklztAs/Wn4V7FB+9ZYGZFzJdWMRDKfaVlAdc34pk=;
        b=lF0pw0BKFbSX6IDnUe7x48qE/KiRj8duUWnFTq7AX92wjv9GgPtyZjS3XzlCy+FpWs
         nSWG7b3HnX4k70A7spjIVe+LiIyauk4fojtiizjLvAlaDmLC2tAb+4fBw1qZfgShIqYb
         2RwyYB9uY4/PLyvp2kJT6Fzi/L6TDGwaveklN4cOUjurdf7BcGRxZBB7sNiNJ/wnUo++
         mbbsRLIQNRhv/E2aUqe8m8sM1Ldij4C6U+phcKyAqj2VmTAHQQkovxSpQBTVVFOFI5RV
         f4flB7moFsL07XlSfH+Jlg5cC3/VBWZF+esdtL+EDq399+Xv2G65Tgy//W0iWUtTUXxc
         yP/w==
X-Gm-Message-State: ABy/qLZLflqZ3FsSkKpi9SM8yq5gNI8mjuFtZIBiQ8zBLiU5z0PE64ld
	+ZTXP6k51Kx3JFYLyR0PhJaWIxi3xZLxcHoGnMYuxg==
X-Google-Smtp-Source: APBJJlHZ/0/mWjeWjIGNpBlzDDEgDRA54px1i2jfjWzG7k6/ArS9Knk50eitp+ZjROVWub+LJq3e8A==
X-Received: by 2002:a05:6a20:1584:b0:12c:763b:f099 with SMTP id h4-20020a056a20158400b0012c763bf099mr1738047pzj.58.1688092156301;
        Thu, 29 Jun 2023 19:29:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/30] libxml2: upgrade 2.10.3 -> 2.10.4
Date: Thu, 29 Jun 2023 16:28:38 -1000
Message-Id: <5514070805c7c0f63fe8199832269b7857d5b8e4.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183642

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
### Security

- [CVE-2023-29469] Hashing of empty dict strings isn't deterministic
- [CVE-2023-28484] Fix null deref in xmlSchemaFixupComplexType
- schemas: Fix null-pointer-deref in xmlSchemaCheckCOSSTDerivedOK

### Regressions

- SAX2: Ignore namespaces in HTML documents
- io: Fix "buffer full" error with certain buffer sizes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 9ddbbf2f86f046784c3baa58de5606a73e9e24f4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/{libxml2_2.10.3.bb => libxml2_2.10.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.10.3.bb => libxml2_2.10.4.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.10.3.bb b/meta/recipes-core/libxml/libxml2_2.10.4.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.10.3.bb
rename to meta/recipes-core/libxml/libxml2_2.10.4.bb
index 0ccd48964f..288631504c 100644
--- a/meta/recipes-core/libxml/libxml2_2.10.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.10.4.bb
@@ -21,7 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://libxml-m4-use-pkgconfig.patch \
            "
 
-SRC_URI[archive.sha256sum] = "5d2cc3d78bec3dbe212a9d7fa629ada25a7da928af432c93060ff5c17ee28a9c"
+SRC_URI[archive.sha256sum] = "ed0c91c5845008f1936739e4eee2035531c1c94742c6541f44ee66d885948d45"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.34.1


