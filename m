Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B6AC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:12 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.33385.1743020951577609690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WiW8iUBE;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3014678689aso343143a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020950; x=1743625750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVF8QhyM0zab4bH3HxFRFK9N4mnNDJYO2ORHlc+Z22Y=;
        b=WiW8iUBEoqY/3E6nkoVZw53+q0ThIN6BFZ2BiAwKSOp601AJHwDKOGEuf4e9eWlC0D
         7JSf3L9m0nPkwshAEux7HJ8XciNJwLdmkS6SmmoFcbwOsjJtLkOP3vtk4asngaSG6onW
         +4+t9QWeBbIEKdOIQisT+MZ1QVLjxlEAf99waU9QHUcGcwYpuJ7WmdWqu78gyMZyUoDv
         q96bwv9sxRiY6OOQ+GPTsJRuVrnG46GZfOrWn5syaLyMzUVYkMQc7VdtWn34cz2tfXO+
         BJVsIE572aZ5MY/CS+vfww+W9LdgLa2Mnq5w1xffBEytZPM8KZSnqJh0dVyK8DY1s9eC
         cUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020950; x=1743625750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVF8QhyM0zab4bH3HxFRFK9N4mnNDJYO2ORHlc+Z22Y=;
        b=aF1Kk0O936+zLFIUmsu+mljzgjT9+Pl1kcDd3fBZ3u6bwMpIB9NIP2ydXbj5yCwGfg
         1vykcjGzp4bNXXdbqwsz8tyoSFBLHTSF5C2Pso0pPGs/OKciM90Fb0mWGfxfpyh5Jm30
         fKbPjbvQoh/4bQidfMelys86rMp24TAaDnhNqHmqrIgSAKcAtqTt8RCsLUu/A+sJVdWf
         fI+oLzZKSqcpP/yhaYalwI1rK9Ot4fvxdKWITenAohStFrg/HOQOPh62mqQF4Og8JxQp
         s7l5KJT1Nn0+a+Q6/vCIDy1NQgOoza7zIzaZ6Pvf5HVB3LF/k7r5uZj/FHbicXRzkgu+
         QXLg==
X-Gm-Message-State: AOJu0YxbP0H4czl9KaMMwV7F+suY/IsV2R0Y8j2Vi1WAC/4hnyn8VXcs
	SJyhjaBvnh3QOR4uf8eTE7r59gGK88JrmF5iJHBOu9s8tfccsS41N5MnpvV7
X-Gm-Gg: ASbGnctxPiY6QCBJtz9gH34KxFl5kZIJd2OJx+g38KvyRLPw42Xal8x3KyD8qGa7vwT
	fH6SCi7bcdxSV8+W3nJkHjLmENsx3QEHDERa+H1Ra9ymipYvIu0eF43whYTO7zVlFelD+id35rO
	1ELT2XZCS7M9lqjaEJijwrm9SbUwJvIz+dyD56Q8P7/nwSbO+LrlWqbWKDraQgg2duX4HvoA612
	ZZBBRlxJy2f47RT14iudBJziSg5NzDplUtnvA+Uv6KGXff7ogV9gMimWWZgB91NyCta7dHnO4Fu
	D2uF1iZOC6WGdc2mS8vxxH2OxJs3qz0NPa/2HXuI8v++GLA/dTD4KWfmmEY45USgFBQ=
X-Google-Smtp-Source: AGHT+IFMsN8pocx8SD8sog7yIIzau6CIdlkRot6L12jDKS8jlDxy2UlRgwXJ7xEZ17quO/T+i1s9Ow==
X-Received: by 2002:a17:90a:da8d:b0:2ff:62f3:5b19 with SMTP id 98e67ed59e1d1-303a7d72f4emr1333118a91.13.1743020950231;
        Wed, 26 Mar 2025 13:29:10 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:09 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vivek Puar <quic_vpuar@quicinc.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [styhead][PATCH v2 02/31] linux-firmware: add new fw file to ${PN}-qcom-adreno-a660
Date: Wed, 26 Mar 2025 17:27:48 -0300
Message-Id: <20250326202817.64437-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213662

From: Vivek Puar <quic_vpuar@quicinc.com>

Extend the linux-firmware-qcom-adreno-a660 package
with gpu firmware file for qcom QCM6490 variant

Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6026fdda90215752688e560320b6c6b5d62354bc)
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index f40723cbcaaa..d18e7414dbc6 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -1482,7 +1482,7 @@ FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw*"
 FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
-FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
+FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/a660_zap.mbn*"
 FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
 FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
 FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
-- 
2.39.5


