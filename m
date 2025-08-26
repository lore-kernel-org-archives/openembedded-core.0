Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CF0CA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:36 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.64606.1756215692189208789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=F3ZT6WUJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32326789e06so4495383a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215691; x=1756820491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2X7+FMAhGt5mI58+i57wiQ7+Zfy6AbpzSW1vY8Bs4NY=;
        b=F3ZT6WUJXNrNCzjFaivbXUYo5QnYJ/+oU5MegXn74y1Vw2oqcAWZdqqjrb5AI99o0D
         jLpJIT+sR4A+YeQ/Ji4Wj2sl94rOxLp0h6KpAFaa94X06byJrJKojeEQ8hvfSFCktlZR
         3yctwJ+duLmL3DwYuC5creWU/XNwcaoF30Y6BzO42u+nxikhiBWPO/3g54AI4blLQnZh
         Op/bpXgBEgrIN57ojqtWQqxlKCsvoBdZ33JB83O2Q2UF7FMfuvnnZYBJGLpgTL+SgNDY
         MXDnq2gQsW44JnfJs9k7FNSScb7vwM9hvI5ZvSEX8LoLbzIfcF87SRkjoT/dRfvtkKdp
         KylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215691; x=1756820491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2X7+FMAhGt5mI58+i57wiQ7+Zfy6AbpzSW1vY8Bs4NY=;
        b=ErYeQtmiXszdwBdNbrY4W4vKLbE7pNaVuOPyjYz64VIryD+8fijELErG6zRiDgk83b
         UJE0/a++gf3G3PWAqCpx8plUtosJ4bsZRNwiY5FjSSdwpCy1nm/FA+dNVfI1hF/eXwJd
         e3IU0p2/uTbChgAGxtBBKYZYDtJdSDOlcJawwFTtHAuYYFuJY8MGzYHmdgFSErB/0lLk
         K2bza3F3HnwEaLzSokvjyBS3sYXWMApJM7d3VaKk2yj5nYrzT0wCEhhKTvFKkSxejj4M
         zEsuFOBZc+F7qe/xIyfpfqObAJmXC+RzCBI9b/dGZCBY95uQyKJzGpUmRxZmlTHRg1pn
         zg3w==
X-Gm-Message-State: AOJu0Yz4c2tAI2fCyu+/fTbbeCBI42uQI6Sd2NBF0ctpbTtgv64dKEaK
	+4L2mmbMOxZ/apJkj1hlc2VJmjlNXh0isjFNypsOkcpVtRN+W2zkwaKlfRN884OFuJJgXEivCNq
	4IUG+
X-Gm-Gg: ASbGncvrvbZZOWl1snd1X170v6y87TDTZV3F48PypPfS5Vdb4ApBSP0EeST0xdTbyOa
	LZQJi2pWCHwUHGFodV9wqIwvWgTuaj+zVXa9/soii/gYKTa6Vp6cnV4avN0KG3r1TGyk1LCx4nr
	QNIXOpb2/yNZhJbBPmiR0oNmV5cN+PTECvhNYocWS2hOr3A7dEd2bpLGzxWQi8xAF7YntmZ3xSW
	XdmFrvIY81FYRYBdzAL1c6uYoPlEkYUg+nE09oM18aS3Z6mv7KZK4GaxC7o5gVeaE7Yy0R4BIdU
	dqoteuTFOeAZF+CqTcD1xcHbu6guA6mAPpmVwhtJrL0UBV9IrUGv3nIRj2rOvuNGrR5MmKRmH64
	neTbMd2gADvRrMA==
X-Google-Smtp-Source: AGHT+IGLykhol+Aq+5X9fRK5Vm5W3/9MDPaSN4fqE3hRbCM5gHaOmlEpDaWrTWpSecHE/KjjORGDlg==
X-Received: by 2002:a17:90b:3c47:b0:324:fbbe:a457 with SMTP id 98e67ed59e1d1-32517748ee5mr19087895a91.21.1756215691257;
        Tue, 26 Aug 2025 06:41:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 13/19] gstreamer1.0-plugins-ugly: upgrade 1.24.12 -> 1.24.13
Date: Tue, 26 Aug 2025 06:40:47 -0700
Message-ID: <fac2cdbd50d7e1e74910cc4c035471305372d5d7.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222453

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ins-ugly_1.24.12.bb => gstreamer1.0-plugins-ugly_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.12.bb => gstreamer1.0-plugins-ugly_1.24.13.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.13.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.13.bb
index 75f528216f..d45ccc8e8d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.13.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "19ed6eef4ea1a742234fb35e2cdb107168595a4dd409a9fac0b7a16543eee78b"
+SRC_URI[sha256sum] = "dc08bb11dce0a43453466fb9034e4fe06709fb5af68475bcf6d288693b661a5d"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.43.0


