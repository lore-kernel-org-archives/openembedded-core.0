Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD995C87FCF
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 14:44:41 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.7609.1754750676843562904
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 07:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=M0B9pmNE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b34a8f69862so2261765a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 07:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754750676; x=1755355476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKiQoYXdDQTwxMLQLNJmniwkAgJSJ2uFpTOWMlPCDIY=;
        b=M0B9pmNEenBUNlFsq0bjbqM8hnrGZSk3sKpE9ueQOJPlZiqkKe16NsCGuee89A1/vC
         vbgR5D7OGsgZ5Tm0wrLWwsXZfJ68MVQkTCemI1JHlrJ2/bubWIG+kf05Ub+ATm8FpHRJ
         yMt9cwQgbUr3+MmC4Ebbi9EJv+jdNn1iHUF19Bit40o4g4uPDtapt8LrlSXtOOw6ZP24
         X1tEJkVilaczjhJugj2l67q8jD5uJCmy5Jg8sgyAyAvuY2NG3K2CcQAMKl6Qk+FoHHTg
         ZFlkAWznPk6Bjfrj8jPjXOnzhfIG31whFq8s4+u7miQZl2QkTJM4sXfFhtdDzzMKjVn+
         BlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754750676; x=1755355476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKiQoYXdDQTwxMLQLNJmniwkAgJSJ2uFpTOWMlPCDIY=;
        b=nRSKuBJBRi2A2CJhzyTFz3sFXBvCYoBXUrLq/d2HRh9sb//OcyUVbK3zYufOW6k8It
         mSUluhJsYwDzk8MNrVmvCF1tg/133JtOrO4UKsVMflewzh4ZKOqyeALoaR2CknL0n6+G
         ETNkrXs9GQCZThkU1lxVU8R7br6Y5w9494d/EoK3v0Wksr+bj+7SnxyO/DGXG+p/vLoa
         U2ItecseeUX1jjToeT3Bl1YaGdB0an+KHA1hJXncoKcJcyd4J+9ExcLoo3fp1Eos81vC
         VMPusd8g3gW25MW2JeNPQaJnfYrGSwZyz4jBsHu61fdRp7JmNIhVKyP/UkzzBz3/cAdO
         Bavg==
X-Gm-Message-State: AOJu0YwUS1/K2O2dfL3T+P5TuwBIrBJUk3sdq81Uc9uimAsPVXpn0cOV
	9DFglqHF/DXFUFwo/rLTAjI36aXwLT+QM9Y8Dxz7hrukx90U1mkZxSstykKHsZugB03le8hFNHV
	+PcEI
X-Gm-Gg: ASbGncuELgIA1ui6emyIEUaHhRb3zhXR+9fITiuTPrBjNAPMhJ2Nsb9nazeCmyhyJ3W
	7wt0vS06G+zeouNHiKfTVg/BJXNREphxv8EEwzErNH0/hPSLPVlH+5mLMMDKmUrR4xBT+1tQ+hq
	Hb7j+VGBcKCCiADTK0CaG6WDm9ZSx2qe1jdE+6ol+T+k+vjOXcMFb52n4PMJr74FlEiqxE9k1Zc
	sTdlNtolEOYG4tT6DyPCSM5a3nGLEApeISwP8VznrQ2ybohPRi52BmB7SrsfP6nQHxsRw7R4b0r
	DIwXmVVxROLi/w88gUS2ZP809C4wBl6//UXPTzuxpCrsnxDNTAicp/fit1QZRN3+pbOFD+W2Bjz
	7YIt1rDWyYCg4tg==
X-Google-Smtp-Source: AGHT+IG2WaDUyy9qdz6GEUTCEtmyjen/T8u+pseR65ZxjqAs19rGN02VQ7mf+bf/A3aYV4uteL67tA==
X-Received: by 2002:a17:902:ccd2:b0:242:d4a4:bba1 with SMTP id d9443c01a7336-242d4a4bcc3mr28557835ad.30.1754750675907;
        Sat, 09 Aug 2025 07:44:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e40b:779f:346e:b2b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b428f4c8639sm5736428a12.43.2025.08.09.07.44.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 07:44:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 6/6] ca-certificates: correct the SRC_URI
Date: Sat,  9 Aug 2025 07:44:22 -0700
Message-ID: <69090e41eb0a8b92e0684d391966f9627bfe5195.1754750560.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754750560.git.steve@sakoman.com>
References: <cover.1754750560.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 14:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221681

From: Jiaying Song <jiaying.song.cn@windriver.com>

The original tarball URL is no longer valid, as it has been moved to an archive
location. This update points to the new location.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-support/ca-certificates/ca-certificates_20241223.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
index bbdc7dd68d..7977e3ae5c 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
@@ -15,7 +15,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
 SRC_URI[sha256sum] = "dd8286d0a9dd35c756fea5f1df3fed1510fb891f376903891b003cd9b1ad7e03"
-SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
+SRC_URI = "https://snapshot.debian.org/archive/debian/20241223T143500Z/pool/main/c/${BPN}/${BPN}_${PV}.tar.xz \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://default-sysroot.patch \
-- 
2.43.0


