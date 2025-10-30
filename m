Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EFBCCF9E3
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 15:17:27 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.20674.1761799637508911586
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 21:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CMAw53pu;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: nmjain23@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7833765433cso881273b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 21:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761799637; x=1762404437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9H0el2SK+vufcJNHQQtL4x4Eyh2QiJY3FXoO3ZLIKoE=;
        b=CMAw53puT0LJFATWwsbXr9AQ50RCuTRejq9pq/nKt0i9Q2T31G0wpuME99hKUcEn53
         D4DVyQ3saSLIlHNqcG4Ktve1qzDvf4OXdY/1rWaxTnfoNicsqsb+d91O6JKdTr+Odt+v
         UmcliLHK20Gtxl8CydtK/QLDjCvVH7ItyAzxX773g8VlGRb6A1qa3zDZQXUkGvV/U8JR
         yYaWoNhOHBHGvyGrLg3NrCB7RqqTCVbemBHxiVyt8MOisZqe9JfELYK6QUBOjIxaWUtI
         5ALf3aW82Z/pFXrszWVHe8rn/lP7vprLs3mrB9o4CN9rKfrnk3D6hFhLhrnFjynJa/LO
         cMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761799637; x=1762404437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9H0el2SK+vufcJNHQQtL4x4Eyh2QiJY3FXoO3ZLIKoE=;
        b=jw1Ek7j8QF3yG4SwmWPlbEY7fJ7934PdLFtFk2JYoOj+tX4Dc2EXE5myr7Orx4vc5d
         GqkeEiUx82w6FqdYwD4YhAIY8A79YCSTtVNbz24up2Zewesj3490LhCkzxPrhUrgEX32
         H+g+Rwer5/Ky7LnrGYiON/qZ/lq9l9ThYJXUJX0Mx2vYajDGmTNXMNeT0DnO0IgvjhTh
         zEgosaw52VXghPHr0Fbwt7D2z7bdnqyTtO5E/+vWsr9NWChT4Y62HTptpuaggPfzModT
         k8yk89IbC8AM0+F3mNb7HI/s4CodR9BIQOIa4m0cENZf0KEcRUWjfqVwrXYbzuB0KDXF
         cB6A==
X-Gm-Message-State: AOJu0YzzYnnN/7/v4JCV8Trp/IVcGZ64ZPGPFBottQQKIQtLdjmRZ155
	CtRODbRB014aAPEwhV9AAPE/RME2XGgpfWlaJgGuy77B3Dht67aOUMSYsZjfZQ==
X-Gm-Gg: ASbGncvwAKmsz6v35ufET9IQFRVmfVcmh82/OS8yIq/90Z26zBITLizWTgH3BFfwsBJ
	3ddtm3vEDi2rpE46k9XweFXjzalzuSImTkE+5M9p0qHWVy4bE/7SChLnTn4K5gDveOZZpvCT0OP
	ycP0N+5iX6HAmSWTk2BFSm/tgw6Xo1HvLI18JPyrUFmF+vjxlLtVlO3DQ1HbY49cX6vJlk4D6AR
	RAyx9hhcrCNblkXc+V+dSZvhxfwU0iET84GZjLJDThvgUEo19rI/o7BAP2XyOpep1Q1l0VBMD4X
	RFkgEWaGG84qg15Gc46UvdfVZG6idOyMz24p5VBKD/oRCCPAM/elB6W69ox5cVd9YqcsjLAaIsw
	s89bz2h7T00GYwKm7LluZyr4j7JpTbCwkqXpiUvlR5Hpf0R54ZXKeqkhreaBwnhgbPhVbWG+ARY
	mXdgDifhOuRksqf8DO
X-Google-Smtp-Source: AGHT+IHSSfjPsLgCJmUtOdTZGgH3PrJTTyRKQAnwkldaQ63oX7kLYE2Pd8MrKv0NvTTRfncLP/sIHQ==
X-Received: by 2002:a17:902:da82:b0:269:b30c:c9b8 with SMTP id d9443c01a7336-294deef6481mr65357015ad.56.1761799189905;
        Wed, 29 Oct 2025 21:39:49 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([2405:201:6807:1a2:beae:429:147d:8dc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d4254asm174094545ad.82.2025.10.29.21.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 21:39:49 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Virendra Thakur <virendra.thakur@kpit.com>
Subject: [meta][kirkstone][PATCH] socat: Update LICENSE field
Date: Thu, 30 Oct 2025 10:09:23 +0530
Message-Id: <20251030043923.604816-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 15:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225497

The below reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
Therefore, update the correct license. Also add LGPL-2.1-or-later as
socat uses it.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 meta/recipes-connectivity/socat/socat_1.7.4.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
index 86ca5879be..332b5f6ed9 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
@@ -5,9 +5,10 @@ HOMEPAGE = "http://www.dest-unreach.org/socat/"
 
 SECTION = "console/network"
 
-LICENSE = "GPL-2.0-with-OpenSSL-exception"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
+                    file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86 \
+                    file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://CVE-2024-54661.patch \
-- 
2.34.1


