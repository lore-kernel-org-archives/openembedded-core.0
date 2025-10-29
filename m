Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E194ACCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 20:12:20 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.13458.1761768739675799587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 13:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=M4haP50x;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so319485b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 13:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761768739; x=1762373539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDpLhWTVl5qAHTYMD5mvDz5/Ga6fWD7fgWJpzc/OwQo=;
        b=M4haP50xcKLFcA/aEmXSHfqeatUhZ1afLKpFNEYW8z1eBQ/RTij9pCAylipB+o3YVE
         P1lJMtj/7VejHLJTOol0kOfZCI3jCKmGzujY75frsDodSasiLRez1rM4UPwmdq01yppD
         SIpMXgnVXyZmy5v/BlmBUCCmJ3tSvvJmMRKjz2ivSDo8Ds0pk/hlR83AkHiMj3UuT6FI
         eLLimLs5mReJz3N7L48hESkh/tPBNuVXTxk63MNN8zJAyPTSdv4A+aNf9couVNSOlDHl
         l0TEXse4AaP82Nft9aOwaE/Zoup6G+DlXkJAPusWD79mQsb4r2zqf35b/ebSzWABM4oF
         VwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761768739; x=1762373539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDpLhWTVl5qAHTYMD5mvDz5/Ga6fWD7fgWJpzc/OwQo=;
        b=mruwBzdQRrgCMr25lzdmbUdUwYsr61SkW0bNa2tIL1V2qWsEkH7fv/2oDqAV18GHGK
         zwg5sLF3F09zIHdcGA9/MQAvvG8mnoTAvBQSBochHSaVsCUAuYA6SSEa27r+nBKvJps/
         vLfdKt7u/nhzqQ8efSGLHNdXp6NXnCcaiGYQJY3LsRwOD+wYMYPsHNikximfHymgRxSJ
         IwInoXhATpGC1ugjLUeAQIagjjeOM3vCB1vh9AO8Mn5IQOxqDy53TqOb7mfbQNw1PDNo
         /z7QjTaMza/HyoM2VX+efpQ82n6/ZHPU89xfBQt5XybZUD0UtLFk2GE1gIC/p7yV30CT
         eCoA==
X-Gm-Message-State: AOJu0Yw+0h9Z1Ge/CLJv29kKKEsKJwkDz5Q9u4Z7fNpoNz/WYCT5HGib
	yAzgtZ6d9ZExUoViWUQvsSAChNl5RwJddH8/QfJEMh32TKdLqAmh0m53WPPh36tuOVoN2jEs6Iu
	HSeoQi6A=
X-Gm-Gg: ASbGnctifunbwaIODJaWybUDVMzdJzZU+hiKdd4jIAccr3/VLRYTVpOrqeUIg8DOZaC
	PqXVwC7xo/vix98S0a9Vi2Kx8H6SZTeXkABTYHeYjoG7COvfuQHNu5177dWjyAG4Vwa1GHeNOKG
	JXiq6TlR0FAP+KRYLEQK/kUJ8IQ9VargepgiFw4/AUkw30qaJhXB2leTdwCrqgnxprrayFs7OP2
	hkZM5NhDvvcu+2zpUg5AFMQ/MY3LaR5S0zI9j89p10hZ2tuoXEEVYsIpagoENhp4+8d0T33BNSi
	jPDL0ZAJuUGYIEINlfpN9kHMPoM+fwyjuml8CJvYlA9it5AIphNuYFgvKWSLj7ZutAbwcUit6LU
	0oqea12+4hDjJ/ALHBqLL1NDJLwsc+v0VUR9y3BBh8G56RCSqaG6/mvqt9NXHrl9mXdQ=
X-Google-Smtp-Source: AGHT+IGqGeL+83Am6buZI/w4B2LY4GQrj2gDGT/f4BK2S4Gz0xhzceKyAXd2wQvvQcKjtyI3Dc3R3Q==
X-Received: by 2002:a05:6a20:9149:b0:32a:745f:beed with SMTP id adf61e73a8af0-3477c7dd4c3mr954828637.26.1761768738889;
        Wed, 29 Oct 2025 13:12:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414087d2asm16522100b3a.63.2025.10.29.13.12.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 13:12:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/6] bind: upgrade 9.18.33 -> 9.18.41
Date: Wed, 29 Oct 2025 13:11:55 -0700
Message-ID: <4cb834388759540ea5bf7265389b9f1b2e15333a.1761768602.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761768602.git.steve@sakoman.com>
References: <cover.1761768602.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 20:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225470

From: Praveen Kumar <praveen.kumar@windriver.com>

This upgrade fixes
CVE-2025-8677,CVE-2025-40778 and CVE-2025-40780.

Changelog
==========
https://downloads.isc.org/isc/bind9/9.18.41/doc/arm/html/changelog.html

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.18.33.bb => bind_9.18.41.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.33.bb => bind_9.18.41.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.33.bb b/meta/recipes-connectivity/bind/bind_9.18.41.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.33.bb
rename to meta/recipes-connectivity/bind/bind_9.18.41.bb
index 2554a7bb5f..a83ec29bb4 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.33.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.41.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "fb373fac5ebbc41c645160afd5a9fb451918f6c0e69ab1d9474154e2b515de40"
+SRC_URI[sha256sum] = "6ddc1d981511c4da0b203b0513af131e5d15e5f1c261145736fe1f35dd1fe79d"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


