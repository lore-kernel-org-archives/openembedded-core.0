Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C61E95A77
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:25:32 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.27926.1696717530464120337
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aQu5/XAE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c60778a3bfso27800705ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717529; x=1697322329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsG866K+TyCIbJw7d2+nbvLb5HBgob9Y9P4wzVYneyU=;
        b=aQu5/XAEXnjfWrEodrAAkTIaEpYA6zzJZn/JeCkEuacsmH/GYVMVoEzzUhI5vM6PGY
         jjUHy0qcn6sX26PIyUylz8sdAdof22dJfNDa3TTeh9iLSwMpvM8waWORkHf9tzCZESg9
         qfHjjoS5IyBqVxyIYv4WFDoBNfDowMQ9tzkM7E1z8L8KSFsxCLWdj/uokFt2oBK2gH97
         5CZcPcHLjO4wEnBjCPYiwsA3HqG3vIppCG4o8awWf47TvjnI80E5q+m0dqxYyhGQwPrB
         DilKhhS4o/yMecg4ATNNgfYKD9wcj9bGtV67cbLYvip5szSubhoHG1cp7wnN4DLaSJ4N
         vXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717529; x=1697322329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsG866K+TyCIbJw7d2+nbvLb5HBgob9Y9P4wzVYneyU=;
        b=EEt/97J72DQYA4d6dJhJhVmDq/3NDjGEKU9Sw/1ClmWN0F36p1+p7scSHrziVgFwaJ
         zv8Gary+GaBc7+h6m0xjUOi98HQ5qjLSaA2l9PxRIDtOPWJ6pWrznK2Vwbbxzfpy/zCI
         Lnw1/P+VcKSwsy21MplU4H7RNFkj9YMoJOnj5vs/Y3ZjJvIqpYgsp1ffVoo+cywJUrz0
         GaSmc3iexpw8Oj2JeAeAcmgB1n7ICM7v+HtPeqq1hl5RrL1EP0QwoHtTc5eope/3DV1w
         8RhyfBgs7vaG4RuLXkcvI+uQWU5LZzBYjMtNXGJxE+SVGRBGhuleLz2f+daH7RBfj0MK
         F3HA==
X-Gm-Message-State: AOJu0YwFhELf+CvjaLdCAzKCYqsx5TqugsyGpqLNshGZGJThB1XrmyVW
	WrWbWmCnS0fbJ/oSKWr4OOYBRQU8FrnFHMdnYuU=
X-Google-Smtp-Source: AGHT+IE0EbD2exJ+yL1HIg39PIMtEjPqehXgfiz++G0nIwvVTLqN+egN98G1sTpMK/P6I5d2s99j5A==
X-Received: by 2002:a17:903:248:b0:1c7:495c:87e0 with SMTP id j8-20020a170903024800b001c7495c87e0mr13970709plh.37.1696717529632;
        Sat, 07 Oct 2023 15:25:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/19] libconvert-asn1-perl: upgrade 0.33 -> 0.34
Date: Sat,  7 Oct 2023 12:25:00 -1000
Message-Id: <ebdb27debc87473c8262ee6697ae9958bb09b5da.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188805

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  * Fixes: #47 2nd - Debug output using print instead of printf
  * Fixes #47 Debug output using print instead of printf
  * ASN1.pod: fix minor typo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit db8c33b58baacd73781cf7184bfeac66c3801e0c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ibconvert-asn1-perl_0.33.bb => libconvert-asn1-perl_0.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.33.bb => libconvert-asn1-perl_0.34.bb} (91%)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
similarity index 91%
rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
index d82692c033..6e9f881773 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "1fdf004520c79e3a244cf9688616293516c11793d746c761f367496eb3d06076"
+SRC_URI[sha256sum] = "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7"
 
 S = "${WORKDIR}/Convert-ASN1-${PV}"
 
-- 
2.34.1


