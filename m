Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DD6C021A3
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 22:07:14 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.1181.1738966030252355015
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 14:07:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=isRp1xtW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f5268cf50so17908745ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 14:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738966029; x=1739570829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfmUKioHreqv6Tp7CvFBLJN1Q1QLiNRX6Orx3ZJ3os0=;
        b=isRp1xtWKmALE35lTEPxzyRSNatiGyufwpdJe3fcl6cPNxRKFx/k9jYsfuHN13TdFG
         jCJvAm+nIbnPUNUEBdacd8EEa5tVwLSSecPLvqfOTmF1POW4lsOA/qIX5qHdNlHGdVrC
         wORQEPiFdDKhU0KTqtGsShi91/fqnfwSMQXMbQCX0OlHioJA3yvqRoIl2ZPytwl3s6ao
         GPZa2Flfaf6aqOIpjsoCug6kv3UbaQD2l4spoV/AF0chd/4JIt7Y75buU/2qOAhP6qhR
         mYmf7i5HW38BaihIB3rWFAvE/KYrtuKK4xR2ohf694OULcW3gLdl4dhQp87qwZSEqQru
         VB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738966029; x=1739570829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfmUKioHreqv6Tp7CvFBLJN1Q1QLiNRX6Orx3ZJ3os0=;
        b=W9y0qrADHywzi0X9z/1zXSWX8eXuBzbfQcqCaZ/KHHDS5dYQe7+jO3dVguFd6pgw3y
         DR6XXeX4ph0cMsgDBFY12HtAvZ+5R834grMw+2bZSiR3/LN6Obuxwkk7VA2tX31wkGi+
         oyY/azqk3aH5Ehq7Rd9vNRN1DFnoqMj5xlmoGfuDyR4MQ9s3p1lZTD7B48vS3DT0bO6g
         YCbYIMMzp/RfrGY8bQo2PZjf6Ne3C/eSkPcM4a2UewwUCiMWbTdEsx9YxlyO3xFe0KWF
         Y02WVSOW3GHbCczBwKJ3yl1zBTdcuKdC8bGaRMRZIlT8caP0aDUMzQtLaK0qjdYHm2Os
         OtrQ==
X-Gm-Message-State: AOJu0Yz0wKWQFXMFLQ7b5t0kMEFJTq7lsAbN14tV8NSVfMnNWPhe2aZP
	E0esgldZjwxLGTwEiu8Eumo7hVoUqcJYUofbC47G1/ow4FzKqWzPPDLWs3i7h9rkgLbmJj91LZ2
	p
X-Gm-Gg: ASbGncs9BZwtsFEtKvPDqMSXpwIw9XmmvluQ7Vd///yZhZvWNw/q8EGCX9fplFgSgvy
	KzlLM5KrMR5qN1aJb6v/ViTs5z9mwcDc8d6sldamtZXfduc0o16fc8GCrN696bvNVJlTAVx1mFf
	Ro5+tFtZXz5QHGByS4H+jmosToVFJ9K/5EP2a55pDw9ptgd01NfDkKAIa5UuNxuLDE1dvhw63PE
	6JshCRmZF1delX/0EcSBkbLct+ito9kO0sbFnGtQOb2UnhxWcVF6szvo/sATRr2uSo9O8Y1ohL9
	BlLw
X-Google-Smtp-Source: AGHT+IEh6TVF4Y2KItyO1PYswCmYh2nYszDDuoLPKqH3CaE3EfzeRGFAjjeob4OVLl6PrLlzqTUQPQ==
X-Received: by 2002:a05:6a21:6d8b:b0:1e1:f281:8d07 with SMTP id adf61e73a8af0-1ee03a3a88fmr7060843637.10.1738966029522;
        Fri, 07 Feb 2025 14:07:09 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af65a31sm3586737a12.53.2025.02.07.14.07.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:07:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 09/12] enchant2: correct SRC_URI and other uris
Date: Fri,  7 Feb 2025 14:06:50 -0800
Message-ID: <30a372dc457fb69d1d4f2be5994fd18d766116a6.1738965898.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738965898.git.steve@sakoman.com>
References: <cover.1738965898.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 22:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211008

From: Alexander Kanavin <alex@linutronix.de>

https://github.com/AbiWord/enchant confirms
the correct locations.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7733aae9c4d3fbaa7d4a3c69dcea3da8e54771e3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/enchant/enchant2_2.8.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.2.bb b/meta/recipes-support/enchant/enchant2_2.8.2.bb
index f0da896e59..e26fb640f4 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.2.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.2.bb
@@ -2,8 +2,8 @@ SUMMARY = "Enchant Spell checker API Library"
 DESCRIPTION = "A library (and command-line program) that wraps a number of \
 different spelling libraries and programs with a consistent interface."
 SECTION = "libs"
-HOMEPAGE = "https://abiword.github.io/enchant/"
-BUGTRACKER = "https://github.com/AbiWord/enchant/issues/"
+HOMEPAGE = "https://rrthomas.github.io/enchant/"
+BUGTRACKER = "https://github.com/rrthomas/enchant/issues"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
@@ -14,7 +14,7 @@ inherit autotools pkgconfig github-releases
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
 SRC_URI[sha256sum] = "8f19535adb5577b83b00e02f330fe9b9eb40dd21f19e2899636fc4d3a7696375"
 
-GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
+GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
 S = "${WORKDIR}/enchant-${PV}"
 
-- 
2.43.0


