Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD720C3DA40
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:58 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.836.1689374036030043575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xVxT6cIJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-557790487feso1900746a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374035; x=1691966035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DreXiBkVRlkuXllBo4N/hunFLvKQnqvdSY7h2X3fKI=;
        b=xVxT6cIJhmPv2JQSYP9VnLgYDwtr5a2yBu5UEHOE5pI2+V21EFmmw4gYKVmVAZYxN5
         V1iBWy1Dcf8EhwnqsyYrMZaq+s3rrb2p0JsNdAxjDGjGFFN5zRPXhDyi82AOQYVVxdJz
         F0lQgnaB518np6bFXqgGwdhPhe6xl7kvjvVNQMGYM6uYFbBLnI0iXVTsLHxqy7ytUQqm
         l0MaPioRUkLXLTks0+Uyqmdor3gGm+ya927+pJAo4FHfC/6CN2YBjxqFY1ugp1uHowfS
         DuaQ28GaZWX4zdkpYiIkxlJA39O5R3j4YxXim3M0paGG7lQ0DSBfivxdIAfMpkhDDoNJ
         8u5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374035; x=1691966035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DreXiBkVRlkuXllBo4N/hunFLvKQnqvdSY7h2X3fKI=;
        b=KElRFeoCGfpOWHkfnmkrRXJT0s49Kx8PFgNJmrsMozVF0Wcm+zoDcrrkDTYbHwyqYD
         4lcFv48JTW3yLmXMECTVpWdkCVrMW63Sf1Z0kC6rHdqdu0/BKAEr4GnsvgHVYyMMAcar
         dNlt9HVhayZ7Mk4CJsFemNPVsvx9Yq5BFPYhy1LY+309+oju0YXGgvyCtTUS3Vnis4vE
         Z4x8GiGU2wQ9xzyIr1o15arm8suBb9s+5vguBCJLeMuzxxnvBc1aWLFAyv6YNtHAF69M
         7J6FjqbyyNzFqu+m/4NCFBP67Pigb4PMzOdH0r3tA1Hq6x4LAkZ8R+3trfdE2Xw1B1BG
         Aqhg==
X-Gm-Message-State: ABy/qLbIXrT0F0P4slnUqsDYNpW6fpNSPIHVHA19zGdTP3905BWXAW5X
	DK7ODxE3NQ3G4PJzAajk0kZ/GhDBCo2osbV/hnA=
X-Google-Smtp-Source: APBJJlGK7ZRKPGmGE/hMTACcgAVIQzLvswFlrVdbh6SrMofwyUDnNp5AY8R3lLWFWz4o1wCB03VwfA==
X-Received: by 2002:a17:902:ea02:b0:1b5:2fdf:5bd8 with SMTP id s2-20020a170902ea0200b001b52fdf5bd8mr6786787plg.8.1689374035082;
        Fri, 14 Jul 2023 15:33:55 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/26] kernel: config modules directories are handled by kernel-module-split
Date: Fri, 14 Jul 2023 12:32:54 -1000
Message-Id: <e5b478fb435c96f6d6e8c2a93d6c54df996957e1.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184302

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 38dc75c0e5eb7427ffcf201113fb45e0d5dad453)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 1e97de5696..3190feddf4 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -477,8 +477,6 @@ kernel_do_install() {
 	install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION}
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
-	install -d ${D}${sysconfdir}/modules-load.d
-	install -d ${D}${sysconfdir}/modprobe.d
 }
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
-- 
2.34.1


