Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA76C677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:39:00 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.96543.1749584333271668620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rsZRWBrq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af51596da56so4135938a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584332; x=1750189132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k352XmtB3s9BOBQ6BWI4rjNRV6i5QhbMdTM0Ly6mS74=;
        b=rsZRWBrqfXHNU8icCS21GCtZfwU9Md2hoQ65gyz5F9pKV6a/GxUqRS4o9+tAdcYQQ3
         qoV7LEgYehiG7qdVavxHpcdSwajhtVz/1io5NyIHdeZe41RKUABeBz4hWcyvzgRgQsSb
         JotNnh3H1Bkx3iRMZYL61OIMhJaop/2xVN4FRXGa7BgZI0L6aCiRvpQdRifRKWT4/ztS
         Y/YfzSzrlRzpVl/M2u4nZTyaHesK2Llq7l5mbdd1YZ/FPU/yKuSaGkTSkEQ7Gq442MHH
         OQlG5IMLh/+/f91Fw8IxcNJhTKiDI1fiXaAWFwvMCuXtogx0/4Tq0NxpGU6IU2gLZmrM
         IyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584332; x=1750189132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k352XmtB3s9BOBQ6BWI4rjNRV6i5QhbMdTM0Ly6mS74=;
        b=uoLBw8pu7AdRy5/Gva+p0nsKgScfegS+jBEFr6d90flj5nsxvBlhhJmTDliLFg6kx2
         NqtzqD0FF2qTqaGklgJbXmuqmzoDfYTLuZffQYjk5O0sqXQ9xK6O35eYYnIiJF8naELu
         eatsYkFpHGHqxDF6XuuEE/Mc9HiSpqB31QQ+T3CP1QPNsFygXucTQa86k6YQHGlgRuEe
         e4l+CAiDOJpX7/701QD5/CUmpfAbkgQRhpv7CIRB22C3mQ9VcIT5qKHU/lQ5Y2X8+kAy
         KeyCLBOaMNTE3MSh4LPygtoPHnAffHGRHtfHHMlfEddJcLT2Z1Q9FMN5yx5iS3ljdERo
         JA7Q==
X-Gm-Message-State: AOJu0Ywe8GbiRBZVXQNmf4DDLCbqe6fxNgmFmwSq5ltv6nPsY2dMbdvW
	JzFINQ2N/nLYc++GDGgGh8h1BeWsLmZMy+ZloN41ghrBGXsEB4u2AxiInS4AuualRZK9jdUerGl
	sPx5H
X-Gm-Gg: ASbGncsF4ni9pmMpZVXILcqEOFvgPFn1VEGl/feRuPzJQ19lsayPAUehlZjUDO2609q
	FrSfpYO8VtjIbwQSq7RhOyt5C1a8JhKNyCFVPGfKh0EkcFAfaVXa/WPghT9y/gdWQ7XO28qLQSi
	cv7FxAIzLHtjnvXD/bQl/2dBH84hzIhVl5kYIXLtQZ0vmQmYA1TXcVu4sB9kdjhCOp6ajMAnsAR
	Z7rX6E74eBp5yfJ1Tcdz4uK/Wo34y54KsKHLbjgMfQMPioEch0H59yRl0lxGEtobe5dmYjKk3w5
	NL0sd3RDiaHaHc4gDxaBw7comdR626QI2WceQ9CAnfqK3mB1KodIUuphgpHF52AH
X-Google-Smtp-Source: AGHT+IG6xgjG0nMJj6CP1Z15NZuRKlGiT7a4PgiaaJwVZYLjK+up6bGegRpKfKw6GSODERiBU36wqQ==
X-Received: by 2002:a05:6a20:938e:b0:21a:de8e:44b4 with SMTP id adf61e73a8af0-21f865fa9b4mr1000411637.16.1749584332364;
        Tue, 10 Jun 2025 12:38:52 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/15] kernel.bbclass: add original package name to RPROVIDES for -image and -base
Date: Tue, 10 Jun 2025 12:38:21 -0700
Message-ID: <350513959f6800eef6579153c2ae95960ca24ea7.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218436

From: Martin Jansa <martin.jansa@gmail.com>

* -image and -base change PKG to:
  PKG:${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name(d.getVar(KERNEL_VERSION))}"
  PKG:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name(d.getVar(KERNEL_VERSION))}"

* but only when debian.bbclass is inheritted they add the original package name into RPROVIDES by:
  https://git.openembedded.org/openembedded-core/commit/?id=3409c4379559afbb1d1d29045582995147a33bbc

* fixes the build if some packagegroup or something RDEPENDS on kernel-image or kernel-base
  and the DISTRO doesn't inherit debian.bbclass

* as shown in pkgdata:
  linux-raspberrypi $ egrep "^(PKG:)|(RPRO)" 6.6.36+git-*/pkgdata/runtime/kernel-image
  6.6.36+git-debian/pkgdata/runtime/kernel-image:RPROVIDES:kernel-image:  kernel-image (=6.6.36+git@PRSERV_PV_AUTOINC@+733366844f_769634f344)
  6.6.36+git-debian/pkgdata/runtime/kernel-image:PKG:kernel-image: kernel-image-6.6.36-v8
  6.6.36+git-without-debian/pkgdata/runtime/kernel-image:PKG:kernel-image: kernel-image-6.6.36-v8

  linux-raspberrypi $ egrep "^(PKG:)|(RPRO)" 6.6.36+git-*/pkgdata/runtime/kernel-image-image
  6.6.36+git-debian/pkgdata/runtime/kernel-image-image:RPROVIDES:kernel-image-image:  kernel-image-image (=6.6.36+git@PRSERV_PV_AUTOINC@+733366844f_769634f344)
  6.6.36+git-debian/pkgdata/runtime/kernel-image-image:PKG:kernel-image-image: kernel-image-image-6.6.36-v8
  6.6.36+git-without-debian/pkgdata/runtime/kernel-image-image:PKG:kernel-image-image: kernel-image-image-6.6.36-v8

(From OE-Core rev: 05498781657a3f8b38b000f91594ecd78850ce47)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9cb954884bc3905defa1ff533e668dea13e17cba)
Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 988a489396..54fbba5b2e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -706,9 +706,10 @@ RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (= ${EXTENDPKGV})
 # not wanted in images as standard
 RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image (= ${EXTENDPKGV})"
 PKG:${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
+RPROVIDES:${KERNEL_PACKAGE_NAME}-image += "${KERNEL_PACKAGE_NAME}-image"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-image += "${@oe.utils.conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux (= ${EXTENDPKGV})', '', d)}"
 PKG:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
-RPROVIDES:${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
+RPROVIDES:${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION} ${KERNEL_PACKAGE_NAME}-base"
 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} = "1"
 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base = "1"
 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image = "1"
-- 
2.43.0


