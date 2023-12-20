Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A23C46CD3
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 02:18:13 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.13002.1703038690154582890
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 18:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R/qbCtIf;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.43, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-593efe46fc2so642338eaf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703038689; x=1703643489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trNk0h2FZTwUYw/ygvKUTVoI+8zyDVt+gPKzRha7WII=;
        b=R/qbCtIfilQIIrOp4OuatoLTNB4x76DrB3J3vkPM5+zWruun0/znODKUiarcwJSp8A
         12axe++AHZ/HSxmp8BHb9IfRN/PfoxBlkm8qA5VCXQB56ZXHtgH70udRk7h2XiGe2BdF
         wOHGMx6jPYkjHlf2PYvCiuo+GWsediKs4IB66EAucNq/9kiep9SGAt9s7P4VGabE5qut
         wHKk8pSWFrTSIVqIwMEw9h6KO9j7w2bLeBm70onT6yRxw+lyKrB1ioE5MxGnwijZBFLw
         it55+kHSsgQUPpqUJn1PFV4w39LAU4fM6aUPIZaP16+UwBvudchWXY4FMRw0MRuymWmz
         lPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703038689; x=1703643489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trNk0h2FZTwUYw/ygvKUTVoI+8zyDVt+gPKzRha7WII=;
        b=wcpwwSRRxyV20WhxoNMyZAFOINwJ7HpGG7JscBHKWagpxgFSG1IKEheWvDD0Ygw5EX
         2419KPKSR9gmcqIa38409w35XpukoTCEd/vas3QSWdinHPBTyk6MdI9GuCRAlOf2Wd4J
         t8gbNKKebFoWLjaaGM+gAS4bYGcMSRBOvh+wekAJhd9jEwP54XIbwm7gLLh/GfeBwyYE
         frxyw2OgFPqpbHQJBn2ILCybNshM36H05GPoDWSeb/0r4u0Cp8+/uB8CuHtjQbku1q8M
         Z8CBuJlmSNgm5CNo0soqY/hfqQgB7x7r0bQ8dsHbuxHYWqyqjWgXZeViZC3OJ9SeKKEx
         C/hQ==
X-Gm-Message-State: AOJu0Yxdmf+HozHoHgy63QOpS1SfAq6NiGLk1GUlEm9mBSoYqBWYik3h
	4n2+duDVX2PUk8lBq3F5DkhlcZJy3tXAnWlYhXVnGA==
X-Google-Smtp-Source: AGHT+IHqRpEZOM+tNy89gdcFBi4kunNlvmK+Z3PXPaC+C7704VESdWyF0hhE5Htjdh6N/QDE6+fNfw==
X-Received: by 2002:a05:6358:42aa:b0:173:530:3d65 with SMTP id s42-20020a05635842aa00b0017305303d65mr643761rwc.60.1703038688530;
        Tue, 19 Dec 2023 18:18:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78146000000b006d945660076sm367103pfn.59.2023.12.19.18.18.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 18:18:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 1/9] avahi: add CVE-2023-38473.patch to SRC_URL
Date: Tue, 19 Dec 2023 16:17:51 -1000
Message-Id: <c9abf1f8395692080576d0fe9b2f28ea2240741b.1703038443.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703038443.git.steve@sakoman.com>
References: <cover.1703038443.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 02:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192760

From: Lee Chee Yang <chee.yang.lee@intel.com>

patch file added since Oe-Core rev a9203c46cd64c3ec5e5b00e381bbac85733f85df but not part of SRC_URI.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index aa395beaf9..bfd945c7ae 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -34,6 +34,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2023-38471-1.patch \
            file://CVE-2023-38471-2.patch \
            file://CVE-2023-38472.patch \
+           file://CVE-2023-38473.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/lathiat/avahi/releases/"
-- 
2.34.1


