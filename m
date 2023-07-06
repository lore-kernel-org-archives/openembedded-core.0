Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15FCEB64DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:40 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.26524.1688656051921388130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MWI6M8mx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b89b75dc1cso14012495ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656051; x=1691248051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoHSecHF+BDh1Xdged6KLLWE1LomT7bEW0Q6GyslzfU=;
        b=MWI6M8mxPe42FemihScUPYu1qzesb/csyILbDRY+XlO/WA79xNegaaUV9szspq9Uj/
         tsCqeWM7xiQX6+W9DlffrG0X+T8I5JMp7mo4jEHBI9k/i4HPJYFZyatXiEZ6yv3FoHjK
         HFSf/6gerMTad+iDA+xPP0qAlHaYHpriOG7IfUbGcM/M2LohFHNpvFGYRYcXVXn6TQfj
         a5kgrTvpWytOPER9KZviK70UVFbV9pfO3546/g8bikwXHHD/ov42IdD2bxfWoNZKPVNf
         yO7WRtZB0tSJWE0BGOh5hYwWiNrTM+v+sQBQisRAHsJxRCOz+Fh1+oHPp4PKb3WlmyX4
         tIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656051; x=1691248051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoHSecHF+BDh1Xdged6KLLWE1LomT7bEW0Q6GyslzfU=;
        b=M+vB4t56EO7ajtUYV4MleKSt2RQ2kA6O6jyMwbbJ2TGIIRTfdRikoZ5LFVLEUMCt1W
         F7KdFmTqJxVSyRO7nYlHdXcE/6Q6aiCuhRAKTF5zdLuwA+3VIlSMZCt98ur5ay9bw8HG
         uM20sqf9jP9EWVkd7X3RU64K0/unVfeXnxotk61U99eo71mZx3UNZAE0Mx3zULZQhXel
         DeLqORJUvln2bIWm6tGzNKivcP91GCSnCedrswJnGQzCQOHnWZm95UBANduREhcuOwoe
         dVMliaifvxzJqSyMiWglv0OGzDW0ca9agNDvy4b6g01abJ+GYQastFeWYyLPGgPKgzfD
         k22A==
X-Gm-Message-State: ABy/qLaSuCbl8GB36ljcr6iaVdIPgNXqGLqK1PV+iIeltI77Tu5qGD54
	/nlsk2dY2mL+8Tjo6cjvYGE3WBAeT7w+wbgwOEM=
X-Google-Smtp-Source: APBJJlGwkIY7xJDSt+9/pgmirWhLPKxnZh7weT0Q/huxSntaJj9w1eHXRa0IxV0YQMammG3f/Vodkg==
X-Received: by 2002:a17:902:f682:b0:1b8:c8bc:c81b with SMTP id l2-20020a170902f68200b001b8c8bcc81bmr1110347plg.21.1688656050902;
        Thu, 06 Jul 2023 08:07:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/28] grub: submit determinism.patch upstream
Date: Thu,  6 Jul 2023 05:06:28 -1000
Message-Id: <846d8097fed9498fab7120ed61a962ff2c15746a.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183978

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61947762e410c685f667e0af6440fb8a33cd6777)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/files/determinism.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-bsp/grub/files/determinism.patch
index 2828e80975..852b95a856 100644
--- a/meta/recipes-bsp/grub/files/determinism.patch
+++ b/meta/recipes-bsp/grub/files/determinism.patch
@@ -14,7 +14,7 @@ missing sorting of the list used to generate it. Add such a sort.
 Also ensure the generated unidata.c file is deterministic by sorting the
 keys of the dict.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/grub-devel/2023-06/index.html]
 Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
 ---
-- 
2.34.1


