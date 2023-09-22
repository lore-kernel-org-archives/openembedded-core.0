Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E721CCD4F22
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:51 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.16349.1695367486592162610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NhO7qC8X;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c00c0f11b2so28526491fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367485; x=1695972285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AD+KAi0LtnyrG8PL3/GEz+Roxgx/paZU33W2oCHE4RA=;
        b=NhO7qC8XeRyxRcp5/HAzDKwM+x6GCbVnMOXpK1JT+YIzoCWu2xp8+hMmXgXaxZ/t8N
         w3DAq0EoPgQFtleiCuLxV2g28i8R/jNWn0FAI0ss1FMdL6/iUJ3ONykhHn3lMCGS1RR5
         AKS2U8ZGm1uWEDKto2N//qHrqxe99rzh2WUlVe6WQuNzNmRypcgG8kDCGrIpvpwXbf8F
         CdYFuOE75ipVkE51iORKKTPII5y0jOfSvqPxWiWLj53gpKBzULZ7N5LUnxLhNdLCKuFA
         DUDZb4TgjPJyvjP+NONWypDpv3EJVHaeSkK0GiBls5WN3pofk/ewhu8fUtjh/T2EpwDc
         wN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367485; x=1695972285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AD+KAi0LtnyrG8PL3/GEz+Roxgx/paZU33W2oCHE4RA=;
        b=QS3ic8DK2vwhU+KTyjKlmSl1gk4yBiF5ak/jLSFKEnKF85y7pyuB78rfOGNXfT74ZM
         SYukuEWFeUH+oCtsfCtUK4cThEO4lwtBGvodOsgiGmW2CS/7LXmpf6+t2PlRile7YKSn
         GoZRUI3+kxkOzHt1djgJ8fTZV/VhOsoxhLs6l1bpnTKC8tA+pchrbCXqwxQj13DfnEzz
         x09+7w82Qsu1XRs0kKPFUuwsJG5bWyrVDVdhbl6G/jUg0ae8xz2ATerrG6AW0X5jmszC
         bboeZdu3JDqwdnFBCpGYaxJvwh+/+in3ZABOwkaH9SgKLPouDwC2CfmQ2tbaooIWSvIM
         uNzA==
X-Gm-Message-State: AOJu0YyEfGaglJM+7THUzF9dG/gKUlhnIyppIFELxWVAo4mdbk7IPMYR
	9HvcCgm2VjUmlM2RosNAGHtJ/VFjhss=
X-Google-Smtp-Source: AGHT+IGGbK4ehIsyggXkhZ4Bx047lVCnK2gjOoZ9IkLpgeIwnI0g+sjGCOL5u2fFhmyLL3j3pXnaAQ==
X-Received: by 2002:a2e:3003:0:b0:2bc:d993:bdaa with SMTP id w3-20020a2e3003000000b002bcd993bdaamr7051095ljw.18.1695367484765;
        Fri, 22 Sep 2023 00:24:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/40] freetype: upgrade 2.13.1 -> 2.13.2
Date: Fri, 22 Sep 2023 09:24:07 +0200
Message-Id: <20230922072431.1481743-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188059

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../freetype/{freetype_2.13.1.bb => freetype_2.13.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/freetype/{freetype_2.13.1.bb => freetype_2.13.2.bb} (95%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.13.1.bb b/meta/recipes-graphics/freetype/freetype_2.13.2.bb
similarity index 95%
rename from meta/recipes-graphics/freetype/freetype_2.13.1.bb
rename to meta/recipes-graphics/freetype/freetype_2.13.2.bb
index 5b1c520944f..4e7a0ad160b 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.2.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=843b6efc16f6b1652ec97f89d5a516c0 \
                     "
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "ea67e3b019b1104d1667aa274f5dc307d8cbd606b399bc32df308a77f1a564bf"
+SRC_URI[sha256sum] = "12991c4e55c506dd7f9b765933e62fd2be2e06d421505d7950a132e4f1bb484d"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.30.2


