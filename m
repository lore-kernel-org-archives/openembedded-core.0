Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A871C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 09:52:56 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.9402.1717572412594084739
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 00:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=zJQk4AjO;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.128.41, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4212b4eea2eso46705995e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 00:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1717572411; x=1718177211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rRstDlM95Ho2y52tFXqKhVjf8Cy970BOkApGcycuYCo=;
        b=zJQk4AjOVDneLPjyVjrYsvHX83K2cBW/8Tfc0U/x2gJvc5TWEvQ33wHzeC2RKFGWOM
         57vVexXijwyjaIv6SuuiQF2RIlJ6LqfqD1htpy9eM9IanmGfzkviLU+QMGFeWvpPsNx9
         tZMriD7u6JFjVsxF4DDiUTO4NPlZK5mqFFdxxBcFsaVmiZZkDrbiKvIVffnXLWK2Pgc7
         thF//GKeiAbnePhwwpQGt/ByR2o8BBNqTR+kIGcgEj+SyzEsiXMkt6gl+w+ELUzZ+JQE
         P4rm140oYos5i8Rz8RfMSbzbb8uRTKwfWN5YzuPVtvhhXbuFg1UodAWEhlBPa/k2OyKS
         C9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717572411; x=1718177211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRstDlM95Ho2y52tFXqKhVjf8Cy970BOkApGcycuYCo=;
        b=iHqOjPLTuaR25mQpbIUnlEm+z4WxNv3zllI+j8B5aXtOw7/YmMwxub//Ouxp537aDZ
         iyLewRQDnGkOtPBBar9Rn4yLvK6bBQTujDAkcw6nyuiD6BlztQY97P7xSHBNpiqbD9TX
         Say8dUCcrSlC7gZ/Xy13Ev9OmbrAGINgsYWBayaBijC+CybP/QmltMuIUAXGnL5Kx8bk
         VhcKY3lZZRx13IAwtLe1w6lvwHobJ2ox1pdTLbuR6s4EI5pDjbfEimErfUG9d41ZFYYs
         Yy0rNvhK8PvQNYzfhdrbsqJUbCa/ZC8ic4qNcBmATfwhAPF1qF1vbwXn0MMA8x1s6Uqk
         yEdA==
X-Gm-Message-State: AOJu0YwIqMToFAO5OgDfINHLxzFC9GVnmPZ7LRPPvDnynT2pGWRO9xz1
	HueuH34nnj9tF/v7sXL0dY8aIgA6wH35M99KRjS9xFIXKoJsD+hMHxt03KUgTt+jQk2m8AAipAX
	2+FAIzOrq7JsJKkRj3xBgfWcdO3S5c9ozQek/9dN3dONPA6wpbrKHSJe1nvfwn0RvyUP8kcxn60
	b0uwv7jiZT
X-Google-Smtp-Source: AGHT+IExlNMUHRCbEOStIO8+sjVd5kQW8LkFwKTgIje+XQK9rYes21Wg3donasd70d6m9Xq0iCnQ5A==
X-Received: by 2002:a05:600c:1391:b0:421:925:6655 with SMTP id 5b1f17b1804b1-421562df25dmr11729435e9.1.1717572410878;
        Wed, 05 Jun 2024 00:26:50 -0700 (PDT)
Received: from localhost (dslb-002-205-022-096.002.205.pools.vodafone-ip.de. [2.205.22.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215813c9c3sm9910425e9.43.2024.06.05.00.26.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:26:50 -0700 (PDT)
From: "Jonas Gorski" <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linuxloader: add -armhf on arm only for TARGET_FPU 'hard'
Date: Wed,  5 Jun 2024 09:26:29 +0200
Message-ID: <20240605072629.115812-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 09:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200359

There are two types of soft FPU options for arm, soft and softfp, and if
using the latter the wrong dynamic loader will be used.

E.g. go will link against ld-linux-armhf.so.3, but libc6 will only ship
a ld-linux.so.3, so go programs will fail to start.

Fix this by instead checking for TARGET_FPU being 'hard' and then
applying the suffix.

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---

I stumbled upon this on kirkstone after the Go linker changes were
backported to 4.0.19. Suddenly docker wasn't working anymore, being
linked against a non-existing ld-linux.

This is only tested on kirkstone since we are still on kirkstone and
going to master (or garthgap) is non-trivial (though planned).

 meta/classes-recipe/linuxloader.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/linuxloader.bbclass b/meta/classes-recipe/=
linuxloader.bbclass
index 2ea1b62254c9..a2e8f9837bd4 100644
--- a/meta/classes-recipe/linuxloader.bbclass
+++ b/meta/classes-recipe/linuxloader.bbclass
@@ -57,7 +57,7 @@ def get_glibc_loader(d):
     elif re.search("i.86", targetarch):
         dynamic_loader =3D "${base_libdir}/ld-linux.so.2"
     elif targetarch =3D=3D "arm":
-        dynamic_loader =3D "${base_libdir}/ld-linux${@['-armhf', ''][d.get=
Var('TARGET_FPU') =3D=3D 'soft']}.so.3"
+        dynamic_loader =3D "${base_libdir}/ld-linux${@['', '-armhf'][d.get=
Var('TARGET_FPU') =3D=3D 'hard']}.so.3"
     elif targetarch.startswith("aarch64"):
         dynamic_loader =3D "${base_libdir}/ld-linux-aarch64${ARMPKGSFX_END=
IAN_64}.so.1"
     elif targetarch.startswith("riscv64"):
--=20
2.45.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


