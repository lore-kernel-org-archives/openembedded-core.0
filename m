Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30F5E6ADC3
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:27:08 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.35411.1732310824857100379
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kzxftMKx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21270d64faeso17261925ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310824; x=1732915624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncn9TxYFGAZMD/iCV3ZNcaYuq9YHmBSzS4e22wiX23s=;
        b=kzxftMKxRZogmAR3vhvrNzOWrR8b24uDYUj9zU2p/ISMoiRE5p1KtzeW/iVmHxcjsL
         ojwyhtDPc1uRoW/cIqGsaZxZDhg8ttLOFnoxpN+7UFuUh2obXPPPTRUNzqhAp5aeNnTd
         tiRViV5UE27xMQeFbMZmUM3qrEjuo+DD82c0Kp5cDVDVCGEBOciuwITa1BYXwF+B4plu
         VNPLUqixqxZIkElNsHwHoiTB2b+AzvaPwSlJ48z9Sv/i2WVwD/Zl951VL9jGsxzLS1YI
         P/emsw9F73tnNbK2DDOi9+JQ2HldBF09/qB07Mre2rQMabIV782Ecu40UO7sfSHBiInI
         5NlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310824; x=1732915624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncn9TxYFGAZMD/iCV3ZNcaYuq9YHmBSzS4e22wiX23s=;
        b=rFUoU52/RDuPKXT+w3/4tbKgelxFIvG6GBh4Q5XFyBgakeH1D26pZT2FGRj563ksJI
         q2SAz1W01qnJdglIFSEpDT0hNk1Ck/a2iriIPyPWD6neHyl5z0bHZttRaONyBHCz/Bde
         WIMxPcRCZNeAODCTPPqUb12Q/YDvBRhI3ky5/5NawPCvM4K0wuzkxAq081rwWEtCKgQP
         y8E5OykQm5hm549AlyEfPC6a9eH0AQye4NDxOq4nyBxRJzKEtVr/RBx0uAEKmH1Otj9c
         88cqUyu1fxvBcCKDedxBYQjZXFe5yEJiFGUZr7X4HpyxTw8IrzaoNWci8yZGJydxpCy6
         T/lg==
X-Gm-Message-State: AOJu0YwMTxmn22Rn9T5OYdiA8UU0fE2laHSmMmV4/YGPb708jB4XdbcU
	lM3y4Igl3lSGEUgnD6d/TwKM/hpt9AGU6uLZFAU34sdCXCvaFBJZbOZ+MRuUBRqibkphPoSX2vo
	Y
X-Gm-Gg: ASbGncsbJdAMHzs+/1jDeXENxis1uT0TnyVMJgs0A4gwR0rQE/CKuP3hac8lItqok2C
	RTPSHM7JXrHitnCHClVD6RlExvToyCtmRn+7IMLk+aPCedRkaW+/pfydFjQhXjlXk6i2VJuDlb9
	zyLKlpeTVW26o1SH/8nduGlJKqNzTEWZiPlmP3A6ZLsB3u2JTBZZ7Rg0zPMpK+Ip+L8s/E0csMG
	VeFqGtL212D66SQH3Cgwk/yHR+r5wt3tVQKmsg=
X-Google-Smtp-Source: AGHT+IFXTGjx8rRB1o4/LMDujoxXVM355ZBoFnPdufxnkmmMyw4tIrrBSbVg1UNlo02e3zQt5nPdFA==
X-Received: by 2002:a17:902:c941:b0:20b:5231:cd61 with SMTP id d9443c01a7336-2129f69b854mr66034375ad.24.1732310824160;
        Fri, 22 Nov 2024 13:27:04 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.27.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:27:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/19] wireless-regdb: upgrade 2024.07.04 -> 2024.10.07
Date: Fri, 22 Nov 2024 13:26:30 -0800
Message-Id: <566fc928ddbbacb59fcd62448315afa3e4de7147.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207660

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f124bb09a798d94eca5e93387bc361b147ce53f9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2024.07.04.bb => wireless-regdb_2024.10.07.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.07.04.bb => wireless-regdb_2024.10.07.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
index daf5e6dfcd..0e4100fba7 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "9832a14e1be24abff7be30dee3c9a1afb5fdfcf475a0d91aafef039f8d85f5eb"
+SRC_URI[sha256sum] = "f76f2bd79a653e9f9dd50548d99d03a4a4eb157da056dfd5892f403ec28fb3d5"
 
 inherit bin_package allarch
 
-- 
2.34.1


