Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20243C2BB41
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 08:15:17 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.13363.1660637709441303077
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 01:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p3R5EonI;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so3348209wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 01:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=/mqJ9rJu0tH31/NNJloxm19EmQmAXS/F3gad6grcVQM=;
        b=p3R5EonIHUjS3KDLwO4PafuqcD/My9K/OBR+taegw/Okyn11cX+cfZGxdypVaoiADZ
         lt9UHkxP/bLevG/iF4lmjfqtraKW5XeV7FP6AgDEfn50zX6xaTR0wWMpNmP889gVdGns
         RRnPMcBZZlCbohFdZt8V8w5U6gGDtGAFrrqZ1s0xElp0xJCsCxeeHrUHj0tvUClGkLWx
         46UGFtwu9E0aDIH+HqIdz8YqPdzvojennwNlsUZ/4Yr9LSSZZhEpCnhJhm820uy+Xh0n
         TEkNjRDm5orL83zpIxrgpqltnxAbqz9sP+Nk1nxASDWDZzmxkcl6dXJqtH0XEdQxYo3N
         +Lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=/mqJ9rJu0tH31/NNJloxm19EmQmAXS/F3gad6grcVQM=;
        b=eObiMKkf8y4x0fKVrGUDrRuoScILngxNRgUkqEf9lBU03rv3gOprqsUlzXgv6Gs66O
         GBTCLegL9bv4MFExWYA7o1iJ/pP0/IGCu/8TXUaKXYhRzTpDb/dZW1BtrfZf6El5jfBQ
         q7TbnhBcDerwBebA9RhxkhvzCFxM658/iY48k9nj0oEsYywjrR7GPAKSEbqlpTdmKXPz
         tZYjDJN/FHd6bbwCEeG/R3FetDxp1LDCP9JTVXe93tsXfIdC8+ZysWLrthQvn6sZoEYK
         dxsSrrhzv7/RxnsybWLTUeecptL+bryXwmJJwFxPoK4xN2kUOaez2wjNCRcDIm2opagi
         6aOA==
X-Gm-Message-State: ACgBeo35/SyhEOZdVm7gPW1lI4aSEt14HCmiaGiA2bTrdeOpKw5um+R+
	Phu4R1k4jS720MaIeOB/kpgEcRYF6V4=
X-Google-Smtp-Source: 
 AA6agR6fPjlrMbNftyuH2226uxUxUcmtUDGqllYhNHeGWm6LI+CDwU0hXWXdkbU5srxPFxQ0w5imMA==
X-Received: by 2002:a05:600c:4caa:b0:3a5:4a14:854a with SMTP id
 g42-20020a05600c4caa00b003a54a14854amr12641981wmp.107.1660637707461;
        Tue, 16 Aug 2022 01:15:07 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 i1-20020a1c5401000000b003a32167b8d4sm12143390wmb.13.2022.08.16.01.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 01:15:06 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] shaderc: upgrade 2022.1 -> 2022.2
Date: Tue, 16 Aug 2022 09:14:57 +0100
Message-Id: <20220816081457.4850-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 08:15:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169429

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../shaderc/{shaderc_2022.1.bb => shaderc_2022.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2022.1.bb => shaderc_2022.2.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2022.1.bb b/meta/recipes-graphics/shaderc/shaderc_2022.2.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2022.1.bb
rename to meta/recipes-graphics/shaderc/shaderc_2022.2.bb
index fe9d94094c..df0fe8e6c8 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2022.1.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2022.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "e4722b0ad49ee60c143d43baae8390f75ba27d2d"
+SRCREV = "3f1635df7774a90f691773e0093bc6ad8005de5a"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.37.2


