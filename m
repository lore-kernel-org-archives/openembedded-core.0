Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id C1EC67D537
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:31:50 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id a186so11602379itg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 11:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4CDk9mW7mRoUJLvgz3lbQblbpfJ7WMcxPend1lnLaIE=;
	b=IMRm324Ct1wrgZFnMUeIBaJtbMqnCqMv3EmOval9IpfSg7DN5UYYcmTYF6UjzPU0pX
	KI+ryQTjesdwfBZVBk00p0c+n1fqzRE2pXhCtaJigDNdZOpRbagNQTGBgb2iit4/E37h
	CEOEYpW2v9ostaJHnZumxmwYBiz7afsqJ6Bho/C9CXTT4vuFaOSB0QOnSyxEAwnoGRAn
	AjBrLmQ4Sd/Z73KvDhMw3ZcsseN2g/xlJe+wR2OzbcVHVAZurvy2vsCAxiPifKsg+8UW
	PAHVlnFsqSjMMObz7uFDM9n/e4t2zwqTp2VX6A1jyRDox4QPhUVo5dNKN4kVSfEJztj5
	cO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4CDk9mW7mRoUJLvgz3lbQblbpfJ7WMcxPend1lnLaIE=;
	b=RscwzhvHZoQDyMEP2g601dRmwko/L4b+ba8J2uTHcfku2jyJTlD/mo31Z3LmSFWeZK
	PrONlprIE84bj7eQVS4OZ+E4BGXKgxHNlA0nLdCELch2osrSdTK37uNGNCHsggb5+hmi
	tP0L+RQ4dBd3Kl12cLibASJ3fDS8rrdCGIgT6PmW0ho4A5cJ578eusVe7dWNxBRXV55x
	yZVURxjbW+R+gjXsFW/ccqYKRX5cl/5MXHZMiYr7TLAlMW1Gg8WeIUBFFTiB2DuF23Bs
	hmS39M4OqpXpGrGATsosb49A96Zs37iDx/BbZlzIfn44bEzYsa+fnkncK4HaAaCtmNjv
	huvA==
X-Gm-Message-State: APjAAAWoXpENnLeGh1mn/mNR8yDWPIxaHxH/9zS604C3wX7sQFDPPVMs
	/7F83DMJcMsLBWZFfRPBiS34oZU1
X-Google-Smtp-Source: APXvYqzpzvAF6ApfEYFdm3GFmri3y2uOo/4bJfJ56tLkJvWC0rGxlg62puwVovtTbicNQurtpEAmAg==
X-Received: by 2002:a24:1f04:: with SMTP id d4mr3914655itd.136.1559241111301; 
	Thu, 30 May 2019 11:31:51 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	i25sm1135255ioi.42.2019.05.30.11.31.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 May 2019 11:31:50 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 13:31:38 -0500
Message-Id: <20190530183138.1348-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] glibc-locale: DEPEND on virtual/libc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2019 18:31:50 -0000
Content-Transfer-Encoding: 8bit

The restriction against glibc-locale depending on virtual/libc is
removed now that libc-initial no longer exists.

Adding the DEPENDS on virtual/libc fixes a race (and reproducibility
issue) where the packages created by this recipe would have different
runtime dependencies depending on if libc had generated its packages yet
or not.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index a985d26c75d..f033635bd0d 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -12,9 +12,7 @@ BINUTILSDEP = "virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot"
 BINUTILSDEP_class-nativesdk = "virtual/${TARGET_PREFIX}binutils-crosssdk:do_populate_sysroot"
 do_package[depends] += "${BINUTILSDEP}"
 
-# localedef links with libc.so and glibc-collateral.inc inhibits all default deps
-# cannot add virtual/libc to DEPENDS, because it would conflict with libc-initial in RSS
-RDEPENDS_localedef += "glibc"
+DEPENDS += "virtual/libc"
 
 # Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
 # is set. The idea is to avoid running localedef on the target (at first boot)
-- 
2.21.0


