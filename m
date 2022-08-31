Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAE5ECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:21 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.26650.1661956820982057740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=fAb4SUfA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id f24so11569074plr.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=vKJKfo1D22xoa3qxygad3hGum7IKQNFWGrlabwQDn78=;
        b=fAb4SUfAdbOh0LGk+ghRopqSH1rkxtEEYpm57TMf1/A4aU/mSK/YYWtjejnnov24od
         oWQ7TvDiCkeqSWWW6cupMy3wKXX2To2sxfgCm/ypTiuc2c0jbxuQkRHpZgklcE+Qycwr
         48oZ0KZc/Z/9p7k/SSzOQ6bHCtW5z17uyHpW+TxSJQ1wDaDd9sr41WHEFl5xCn4AcVfH
         F/hJkUlfnS8/Q6tLEbIJfgbmOsVABdIqieunMekf7fJiV922BVAHpjuU9SDDTSHtE8gg
         KaZVNWVPA+Il/cLyKwIwAy30qt7SXMseNwZ/LTuhXqOYOFEDJ450j537hSIsl4x0qCbq
         MJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=vKJKfo1D22xoa3qxygad3hGum7IKQNFWGrlabwQDn78=;
        b=to0kP1c2yqyLH61g0mbvfBI7QtkljVV2K5PYmSHHDsFk993cj4/aOPpJzBVX0N74BV
         8S0sMI9dd3sGSagHVbv1/XjP0YncAiB3mLoAXlsuuBQSEd7Ao7mAoF0lJVH7CBQ0q7dh
         FO5rd6lzyvy3jpJz9XZIB6XQzCSECmdb+S7eFCv/J4o8tOdFDsda+hYpc5dm3Zviz5Bk
         Eksg2BifcCBMMPEzJqkjxFxgCUX83yeL4dQeFjGqDUM4bjmJPWJhJm6pTB0rA1sKnqTJ
         +CH1hZzQZgn1CZSoXzf1kImVV+XWchyP9nfge94d4pofNDZS4bGatB/KOXA6aD+l0Rgy
         0uLQ==
X-Gm-Message-State: ACgBeo16kd/SYJdpidEny1naeKqCBg1QIT52rm/ktB4RUvnQZpuRooOO
	+zbGoLxsUj1HnWGYeR9rCHUkG4H2WIGuE6A8
X-Google-Smtp-Source: 
 AA6agR5gyiBvuf+M4WSx2/+wnokwFlFjszSxZSmVaS1nepWIWjGOPXCOwZa/qvl/f4FjwY6GS5tNqA==
X-Received: by 2002:a17:90a:cf8c:b0:1fd:7783:c340 with SMTP id
 i12-20020a17090acf8c00b001fd7783c340mr3607867pju.16.1661956819973;
        Wed, 31 Aug 2022 07:40:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.40.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:40:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/19] libxml2: wrap xmllint to use the correct
 XML catalogues
Date: Wed, 31 Aug 2022 04:39:33 -1000
Message-Id: 
 <feb6eb9bd2a193ede55339e5f45bb7851df64bcd.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170124

From: Ross Burton <ross.burton@arm.com>

Install a wrapper around xmllint in native builds to set
XML_CATALOG_FILES to the correct location of the XML catalogues, so that
the callers of this script (like xmlto) don't need to do the same.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8159b47e7ddddaca57ade2ecf24d8ff9a0abf26a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxml/libxml2_2.9.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index e58298d3b0..d803db8672 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -109,6 +109,8 @@ do_install_ptest () {
 do_install:append:class-native () {
 	# Docs are not needed in the native case
 	rm ${D}${datadir}/gtk-doc -rf
+
+	create_wrapper ${D}${bindir}/xmllint XML_CATALOG_FILES=${sysconfdir}/xml/catalog
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


