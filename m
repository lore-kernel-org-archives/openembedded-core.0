Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685C5C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:14:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.27788.1719411288076712623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=DhTrFx6x;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.128.54, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4248e28de9eso30599525e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 07:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1719411286; x=1720016086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oaP44oGTtXVcWhgEIy+d1W1dYVcbIlhaemFgpznlt5E=;
        b=DhTrFx6x9fpl1ZnnSCEJAiBs0ipLYLvgVk+2eA01JJw3dAaKEVmNcbXPP2jiltx3RD
         TDvzeFHt6Nz6MHElwiQaPrNIvPjOshJth4CdKqbDCkW+rHy19qQmVF1pUKWauW0QkxBO
         EVyF6baTuapOEvVR2+zcShpuKqrOZ/3p7rOwj6H95TH1xL/vXWXarcJAnf1W4u6pvDqY
         3TBIwkmS0rwcjgZknOyNzCQ7z3HcKClCuOUBV4lwEBUrcXKkXUx60Hj+I5CViHIZDKQG
         Woqfrzt4VGlJNnBHIOUsiEhKSe9X2HLvlRlnS3CLVPhQocT3d4SdYtrr/BuRQKTq5gq2
         C2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719411286; x=1720016086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaP44oGTtXVcWhgEIy+d1W1dYVcbIlhaemFgpznlt5E=;
        b=prKhWYbmCNfjxsq3u9huLqYKfc3KrxYc4fXG4jpwDgW4t/Q0dT+Ih6jQobkRiD6F5c
         Qjherz68Qlocb4Tg+wJUMjp7RYBBhzEdthEyd2/J+z2ELZEXRkdg0aGG5amLLgM/3P+3
         9l5ip8iTiwqRgJRGuXSQs6nKKH03lSt0Kb/CKFsWff2CmpYl77JLWzVRLfD/Y5lgUupY
         Jo+4uDceua20SOIai4mX9TIMFgEB+8E66ZAi8tAUFhYoJHuEY2uksZljQE5WtGORdo4C
         QZhlwvsKHnBGb7KIXOWIlamgaWjXVjT5fa7fOhOGbqHZPeif+Y9UtOC2InK6T/jvFO6H
         ighg==
X-Gm-Message-State: AOJu0YwcnZENUotG5UHdo8Z0qKEg/zScdcH9vovjNm+/ocNWCfWMbl3u
	K0fHTncMf3BEvpLFnv31jqHSXihTgbImkGf9bPClwteWzswwaJw0mwWrh+CuRcIoa8n/dphfOOI
	A65mf24w8zwiAwAfzJfb/EhFE7DkvJUxma0mvFYoqA0Phb1gOGJgnBXji0zQ295QBPf/zcUtjqA
	3DRkRa2zRV
X-Google-Smtp-Source: AGHT+IE9kVco/9E9j2YaAJsCrZBFp0lOZTQCJcraobtDgkDQnJ4Pl7X149jbwzBmhHS1xl/W1e4tlQ==
X-Received: by 2002:a05:600c:35d2:b0:421:eecc:2404 with SMTP id 5b1f17b1804b1-4248cc34aeemr68676675e9.24.1719411285939;
        Wed, 26 Jun 2024 07:14:45 -0700 (PDT)
Received: from localhost (dslb-002-205-022-096.002.205.pools.vodafone-ip.de. [2.205.22.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8380a05sm26793695e9.41.2024.06.26.07.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:14:45 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] linuxloader: add -armhf on arm only for TARGET_FPU 'hard'
Date: Wed, 26 Jun 2024 16:14:34 +0200
Message-ID: <20240626141434.84216-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 14:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201169

There are two types of soft FPU options for arm, soft and softfp, and if
using the latter the wrong dynamic loader will be used.

E.g. go will link against ld-linux-armhf.so.3, but libc6 will only ship
a ld-linux.so.3, so go programs will fail to start.

Fix this by instead checking for TARGET_FPU being 'hard' and then
applying the suffix.

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07b4c7a2bd23f8645810e13439e814caaaf9cd94)
---
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


