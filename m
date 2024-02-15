Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCAFC48BF1
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.17937.1708013912617678159
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qiu16UcJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1da0cd9c0e5so16342385ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013912; x=1708618712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zCy3Ixg15+bFjO0HfA2RyS2oiZkV6GqB92/Hu+/8X4=;
        b=qiu16UcJVF/MSFas6m5gwNSPE+j3u0bh5j91roXxjuISqKh+Cj9b+sPfOhA0KeZ9PY
         YHYorV2kaHnQtg8sYEVRuGDNIS69trRg8w0xdToHf0JLEhUJCouWPUMlUtToFNvVqEFd
         DgxFj0VLTSMw+tAdusJbRxtbrT80Pu6QyhQKhNpPDbRB85vIbv7GodRSXvzks8HI7i1H
         66GGZJSMefC1VEqz1AN3rVYFw0K393XNM1vJU5WCpoUX1BljQvMVEHJxb5RKfV9Me3Ms
         z6e9P60wBPlKmYtqYKOw7Rd13RlxBSKd3Md3gLSQ/9Ir6d2nqfbQCoWwkeorduX0OJS3
         hGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013912; x=1708618712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zCy3Ixg15+bFjO0HfA2RyS2oiZkV6GqB92/Hu+/8X4=;
        b=DjOA04UJX42BIPRh7uLDga9qBbwHA3kfqrEmzKiKzyjVYpSi00d5W6+WkieVMY96QS
         FzmcPduPzBvp7oIpl23qvUiphkqcm+phEddSwCBt4p+TAS/sdVeJLBVPzLzj2RwQjkRG
         hg6igPfDoVEoNCnPqpXGdRqxVyWvs0T8Fv9ix6H5tk+h/+2j1f9tVpGZKBehBp2fOMOW
         l6LaAADEvubdH7vGfW3nP1qHLK3x7kz3kGkb0lxzTEWUe66MPhmijEJO3LwJKT8rjja8
         mphtt5XjyARhpc7PA4Xu9CX6/t39StT7jw917M4ZzjID26swZ1714NJtiHfiLgbyYyL0
         9fLg==
X-Gm-Message-State: AOJu0YyEIZg+tJ4y4sJCM4hkQk5OhlhOHsyxsCp6bs7+4Dje3XK/id48
	WgEVS9cukd20wK2uRGkvJHhoBtGza4hXOz8Wn2X0FojYBI5pAWSTmhA4M8489A1l6tRH85msTJ8
	/Nmk=
X-Google-Smtp-Source: AGHT+IGNfC8ueCJ0ZJppC4WCCh2IWyg1JzWaSKWQQxt6+YZcG9facMsnAudKdB/RXYI02MpWzy416g==
X-Received: by 2002:a17:902:ce8e:b0:1da:1fe7:cacf with SMTP id f14-20020a170902ce8e00b001da1fe7cacfmr3788748plg.25.1708013911998;
        Thu, 15 Feb 2024 08:18:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 11/21] xserver-xorg: 21.1.9 -> 21.1.11
Date: Thu, 15 Feb 2024 06:17:54 -1000
Message-Id: <e06a10763ee8ed99c9dd8122b49227e7085fd964.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195531

From: Kai Kang <kai.kang@windriver.com>

Update xserver-xorg from 21.1.9 to 21.1.11.

Release Notes of 21.1.11 [1]:

This release contains fixes for the issues reported in today's security
advisory: https://lists.x.org/archives/xorg/2024-January/061525.html

* CVE-2023-6816
* CVE-2024-0229
* CVE-2024-21885
* CVE-2024-21886
* CVE-2024-0408
* CVE-2024-0409

Additionally, it also contains a fix for XRandR to allow for multiple virtual
monitors on a physical display.

Release Notes of 21.1.10 [2]:

This release contains fixes for CVE-2023-6377 and CVE-2023-6478 as
reported in today's security advisory:
https://lists.x.org/archives/xorg-announce/2023-December/003435.html

[1]: https://lists.x.org/archives/xorg/2024-January/061526.html
[2]: https://lists.x.org/archives/xorg/2023-December/061518.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fc9da07bd181ee6f7ae51a5b6db40af0b94cd046)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.9.bb => xserver-xorg_21.1.11.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.9.bb => xserver-xorg_21.1.11.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb
index 43c06181e3..6506d775ca 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "ff697be2011b4c4966b7806929e51b7a08e9d33800d505305d26d9ccde4b533a"
+SRC_URI[sha256sum] = "1d3dadbd57fb86b16a018e9f5f957aeeadf744f56c0553f55737628d06d326ef"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.34.1


