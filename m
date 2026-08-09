Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE5CC5AD4E
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 20:29:43 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15689.1786307381457438375
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 13:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bQUij1M2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fd4531020so637028f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 13:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786307380; x=1786912180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=icMWBJ/ey0lzsoXsMo9kZY4Sbgg2mrM1/wb+1RIeztQ=;
        b=bQUij1M2HBXutO2sPbYZRM8cAuWcB8OKU0GabGOyySdZZJ68Ybx8d6jxdwny21UYAP
         t5kvAFcGdBvpmHeZ2HNIIY/2XM4zXZwHMt57hX59qiTvKT1QHEI8QSRZ7rpcTPXZPOUt
         xceYTy/oT8OrHOwgBcuqUkgvE+7k+yvEiho+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307380; x=1786912180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=icMWBJ/ey0lzsoXsMo9kZY4Sbgg2mrM1/wb+1RIeztQ=;
        b=cEYNKxF6xFRpIOKDUoi/QT/2B4T0OYQB8uM0M5oKDnhScv1VmCL3N9fhOI1GTkWUBM
         3RgSPPBEMYqT5GoRsVQFpN1/j1FJSSCWZcCmkeiZr2X6jmZCJ78H+rUPQSlP0z5RGurF
         tVr46+ox2BGLRYfgTurNal7btpsDFZqMwXIgquUAiXyWz/J2IFs5q2tLpFZorAoFDcC5
         IHUP8DqQ5A4aoyufEEMjYcvP1xGmLiab71shzfYkiRFDBlMd7k1RhVlttMQZ7J95Wcjb
         p8W+Kk7x6r3hr8mGwpb720dMpkXIqO4qWqtR0rfTQj/rhGln5CHRcuOMc86BRew/B6pG
         CUtw==
X-Gm-Message-State: AOJu0Yz01hGuwhbxXyy337CTBukuQEYKfX2R78oPs6TTuVA6auIPE9PV
	G9zVsUa+fLaazpxph064FuyljKfcJfiJ+JjsEco+8U34ihnc12tFNDiVVuWa+RUMjZBStV7klaR
	d2XvGt0U=
X-Gm-Gg: AR+sD10LEP8+QV/et+qOvATGRfXxmAkcdh6cGd7poxc15oE6Gdtmepf+dJFrO2FqY/6
	JrDo7mNz1x4IuZpPDEkRe/E9WyFrIf3kvwPVgGWWHhT7jaKktR9BrzQEh8alLmpjt1KDjcfyEtU
	eJ3B3s3N78mgjrfyWvCPhL3o8eYcl8b1E+jH/CgZXgPpPQ5QRDo6/BMjdfjNeKDv773SN41CB41
	tSA9o/C4bywYp0hW9UTqhA8Dnf/c1IOYl3yvDvhzdF7fXlR47bsV/5BBtoML3kiaTzW+aICiVP4
	92drfUGxHIQ9Gtr8PuJQwhpUHTs5GIn3jVb1OR8QXj+pan3llINTSBf9KTwL4njgpiljPqJEZkQ
	6GqVLaHXPfjBZaZppMxOrnL91944CxyTLYE5y4xd+Yv0ImBi5/BlCXCp/mdenPqUleu+ycngYtB
	meIpIdt2zYZ1r/t++cgDGrEq8kU5vpldup+5zRX/e85TAEyz0UK3mBC3ND4ZkzeSoATpU4deI7/
	pxiowJdMEehhLPkNw==
X-Received: by 2002:a05:6000:310c:b0:47f:f828:9f32 with SMTP id ffacd0b85a97d-47ff828a374mr40404805f8f.27.1786307379565;
        Sun, 09 Aug 2026 13:29:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:50cd:e139:7482:bd41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f8b9bsm31267873f8f.25.2026.08.09.13.29.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:29:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] libmicrohttpd: upgrade 1.0.9 -> 1.0.10
Date: Sun,  9 Aug 2026 21:29:33 +0100
Message-ID: <20260809202935.1904858-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809202935.1904858-1-richard.purdie@linuxfoundation.org>
References: <20260809202935.1904858-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 20:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243076

Source: ChangeLog

Fri Aug  7 10:15:01 PM CEST 2026
    Fix race in thread-per-connection mode on wake-up signal
    between daemon and thread that could result in lost wake-ups
    and thus connections that did not finish processing.
    Fix rare assertion failure in relation to suspend-and-resume
    processing (harmless if assertions were turned off).
    Releasing GNU libmicrohttpd 1.0.10. -CG

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libmicrohttpd_1.0.9.bb => libmicrohttpd_1.0.10.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_1.0.9.bb => libmicrohttpd_1.0.10.bb} (91%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb
similarity index 91%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb
index 4ce99da52ab..ba8969d6498 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "6e9adc446b08083ec03d40317fb66ca6f2e03e4f6170aef33a6e59bb08db2012"
+SRC_URI[sha256sum] = "04bfe8ef75db7d629a33de767599765cecadc56274a39822d5d081030d577685"
 
 inherit autotools lib_package pkgconfig gettext
 

