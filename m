Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF174C001E0
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:30 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.26519.1688656043453069043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=iID0Ab+K;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b8b2886364so5192085ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656042; x=1691248042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQeZHlitNyzVvD+ecqpdQU6oacdHdd9zUFd56FxMct0=;
        b=iID0Ab+KvSSmtvJ8BJkkTlO5Wv7oFcMltoF7BryokYETOQIKwaPWdNwzb5VFbSUcij
         /rYSSzwoemxVOLI5zGASLFfHXko4LceFqCG7OVI3spRP/bsgBw/ZbKt01a+iL8IE69hm
         HGFo21dvvAt+0cs4cHu1QI2DYcmdjXr9kE11Vxl8DZooXfoTDOoKJoAPJwTZB8gs5d/a
         YiIpVkf4mkJ0FaGBurPhI26ZkOHD/4ozwRktwqDmgTBLnPfJRjhhItJ+9xGb4VPH+Dc6
         nXCTKaVzDasBJDg4VaCNBHzK6n5ITW+eWjxkIqnSatrxId0TfTzLL5UyipOTHMuyubSk
         ua3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656042; x=1691248042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQeZHlitNyzVvD+ecqpdQU6oacdHdd9zUFd56FxMct0=;
        b=NUG3926GPjdBeQBmu7N4Urjmtg+GhEezIJKJAYU4XmGhQ5L4sW79EAqmmPhpr8Sr8U
         4d4piy4Bl90cAmB5cPfJF1lsKjkuwfw5cqlxusb5/MRebV/v4lhxxonctZ+MJeVJdmSq
         Zv+EypIYBdyvnu0JKMILOUTlBOJ7Lkwq1ZpW2T2R0uHg2VG2BK3Cfh3LtQ/IKR975IkV
         tJF1umBdZoE6e/oFCV1anvcuNGd1KaBthSx69lUhsF9HCCnKOXgrxxOncxyzIpYg9dK5
         8eySm6BVk2NdI+G9xy+6EFULwe58UvdBkrtwOFTcyLF3KQa9cRUzHIU/++2y8yylgfTV
         o28Q==
X-Gm-Message-State: ABy/qLZT8n/rzmlGYfpaTuSFQHrVwGgGHKP/MPj2g9RPmy+NmpDcZMU1
	ScCWTtknU245v0q2zOP4b7NrwjxLXTvyu7OWA4E=
X-Google-Smtp-Source: APBJJlFbHFaY70e5WSgEIqONaF9pJzkSekSOXakBP2jI3y+UvdktzIrLAn9vX4m5fiq5KEN1cnRg4g==
X-Received: by 2002:a17:902:d504:b0:1b8:9b74:636b with SMTP id b4-20020a170902d50400b001b89b74636bmr1467634plg.68.1688656042526;
        Thu, 06 Jul 2023 08:07:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/28] maintainers.inc: unassign Ricardo Neri from ovmf
Date: Thu,  6 Jul 2023 05:06:24 -1000
Message-Id: <8d2e96c3a611aba63aa9a51f6b350ea8c9654e06.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183974

From: Alexander Kanavin <alex.kanavin@gmail.com>

We were not able to get a response about availability over email, and so the recipe
has to be unassigned.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 56f1af6d5b3019dccbc27bb0a9692a5f1a32f87b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 65db1d039a..1d5e070223 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -550,8 +550,8 @@ RECIPE_MAINTAINER:pn-opkg-keyrings = "Alex Stewart <alex.stewart@ni.com>"
 RECIPE_MAINTAINER:pn-opkg-utils = "Alex Stewart <alex.stewart@ni.com>"
 RECIPE_MAINTAINER:pn-orc = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-os-release = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-ovmf = "Ricardo Neri <ricardo.neri-calderon@linux.intel.com>"
-RECIPE_MAINTAINER:pn-ovmf-shell-image = "Ricardo Neri <ricardo.neri-calderon@linux.intel.com>"
+RECIPE_MAINTAINER:pn-ovmf = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-ovmf-shell-image = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-p11-kit = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-package-index = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pango = "Ross Burton <ross.burton@arm.com>"
-- 
2.34.1


