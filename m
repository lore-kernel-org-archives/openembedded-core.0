Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D17C6FA8F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:48:12 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.5615.1692931691447137972
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Goq0AZqA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-686be3cbea0so1108671b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931690; x=1693536490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8veCNzfEdAMZXSEAEyKJnBWdnYf4VCXHT2SL1s7qXgE=;
        b=Goq0AZqAvMqNWY3gycPNJmo5C29H+0R8qDxAR3wlqWmDkX7YhIIN+jk/alzWSV4VcN
         1S8QliKuEisWIOuiumT00wQzuz4ACHV5DugRIEYAOYlLTzTAeqrZpcDZH50LbCm8T406
         k59R5DMfzau4PN3omFxniFk2dUD4BNCLT++xBdworq8LbF2FQGYNtblz0de/w6iYne5O
         QVV17cu56129VeC4sDEMw/NWRBJe55CB+PJtHEteZKarKli5UaKOIb51ODSmv5su4foL
         BCu7qr1BuD2eXnXR2QlwRKWgmIlKNFhwiK9P9ON4P2rueXQjxQojXwPencTc/T/rPA+Y
         2ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931690; x=1693536490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8veCNzfEdAMZXSEAEyKJnBWdnYf4VCXHT2SL1s7qXgE=;
        b=Y/bHaHuuZITp3zpcAIxNBjpqEYupIuPdUlC5Vrrj0tamyppXxSARX8e+le8IvoTqrM
         V8ZAMnyy1879oSbp9YPwolcMxvQxPjOxbUXokcKLl4/N/uvz0fuZQDioSdBaUddY1Wdy
         RPTVxPCCvPgs1Er98miGsS3rp2k8IRwdwWvbR/2V/8XdLtBCV0JNhZaMUz07ove0ceEC
         SLBlo6Kl1px7EeY0WtEv+RHRTQ4PzavaQox6snyYE8qGELV/sVXOwRsrj4MwvOzjibVF
         IbZlgsOtXVRQdKhxq3F+3SQe5c3FSahdgSCC94uNd+uxSaxRqXG+9rxZd/RDiCMKdq1h
         +f8g==
X-Gm-Message-State: AOJu0YwnaGq09BFkZ3l9Uyu14z5Bi9CGtq4u3hetdiVsckaO4CWCeOAY
	PlYTrNKFWnyJSbVH/VH8Br+eOn2l78gSnAn2mt8=
X-Google-Smtp-Source: AGHT+IHVuJONxsGS5nXS1tugRrQLSIMpD4whC1tc6aePZDKOxZqazOEvH76Y5lbh3g6h4+CKN0c9iQ==
X-Received: by 2002:a05:6a20:1456:b0:13f:c159:63ec with SMTP id a22-20020a056a20145600b0013fc15963ecmr25335727pzi.24.1692931690517;
        Thu, 24 Aug 2023 19:48:10 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.48.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:48:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/14] grub2.inc: remove '-O2' from CFLAGS
Date: Thu, 24 Aug 2023 16:47:38 -1000
Message-Id: <4598237dec610584d1eb031a0710c23dd497ade5.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692931546.git.steve@sakoman.com>
References: <cover.1692931546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186687

From: Kai Kang <kai.kang@windriver.com>

It fails to boot grub after upgrade grub to 2.06. According to
description in

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14367

it is introduced by a commit to fix CVE. So remove option '-O2' from
CFLAGS rather than revert the commit to avoid the failure.

[YOCTO #14367]

CC: Tony Battersby <tonyb@cybernetics.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69805629b8f47fd46a37b7c5cc435982e2ac3d1d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 5a6e213936..bfcda76c24 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -128,6 +128,8 @@ GRUBPLATFORM ??= "pc"
 
 inherit autotools gettext texinfo pkgconfig
 
+CFLAGS_remove = "-O2"
+
 EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} \
                 --disable-grub-mkfont \
                 --program-prefix="" \
-- 
2.34.1


