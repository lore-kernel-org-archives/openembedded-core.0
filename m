Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76928FF8850
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 20:27:55 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26823.1777235265375909339
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 13:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d2kiAByx;
 spf=pass (domain: smile.fr, ip: 209.85.218.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9358dd7f79so527955766b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 13:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777235263; x=1777840063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DByxBp3QKmO3PL52cSxh3Fh0+fa8rfQek680ifZ5Ao8=;
        b=d2kiAByxmwiXzBYZE1C8DyzqFpSI0oKBDwBeqj/ZRIsXTjWTmhtTCKa/hsMD4i6KMt
         Ff9Qnt08xhsIBNXBt3oNjj1S8yvfYYCclRWFUWQR7RJqRzjGt54xMvuWrUtevpFQVj/8
         V1X1tzScbMKNK4j6b2rT1ywiTQYX3jnfpTb8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777235263; x=1777840063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DByxBp3QKmO3PL52cSxh3Fh0+fa8rfQek680ifZ5Ao8=;
        b=iRX6W62JvSepDQrkCTRbw7/e//79+aTM/YyRBKkFZHN5PvOPjG4n8GFrekhwX3RuuU
         4UgfJcoyvDDGWST9PMz8SzhY5sWJkje3wK9ZbnTZ3I16AZAgV2tIZkCtCN2siVap0ln0
         omM08t7cYZow61iH8IBEhkKZLCT21YEYIvdgkCvpRQRvNmaITvkvtP3XvAs1GhnAovdo
         e4jf080b3vyIPUgzy0tFy8y0cqAc+I7XPStMMIG302PN9KRccvbtdA21jikV2LYi1vBP
         zqNl8a8bRPrAhV2W8aGdy3ED4yRsnLQ9mPkhY2k4NyBNPjqItWyxmWQV0yyFXKtrGqnU
         ggYg==
X-Gm-Message-State: AOJu0YyfczZGExURuYIn5rhFdUP0Bxr3MkOFTY8ch5zF4cofCZDuZElb
	wz+0Vd2bslJAF54JHHFPuPJS+NuKVEc8C+wYYoLcQSe7yp2UZMML+4a0e8GzNOJGNzS+LnP7mEN
	VevK5u3A=
X-Gm-Gg: AeBDieseXtM/y/gYCU9hHoe5OWpkbA1GEy/avKWKtbi6bSBm5+EVAOjldaCTJmFipqr
	v+FLvuh1HMyfm5WvnBKWiJlM5ll3z2evfH9v8g3M3GihuZKL2EhJxJxR4JAslYRr/rH1Sn11Oyy
	qdHbGVXZOJ0KyiGDcks46CSdYn8yd6eDyIAiRcsXq72K9XCOCMQqQa8L2l0a2H4fca8mos+gUDG
	fz737p0nRbZ500qPtHPP0gwEryaOylKrKC38yEBX5SX70CIjnrCQzbo/YAvHK/RC034DSf2Sh7H
	xUhR+5giLVnr1Bb9fA99yevxQm8OUAoUM2MyNM1KHQ3Fr2egFt0cFtD//mQk9ChybFdraX8XO2H
	Qvef/VS3nESlliH1Y6rN7pT3uja441p2YzAsu7zYDn1LnuISZBNbE2jScvi47AhBIiXb+3N0ADb
	inOQEW8wTycjY8VayDG9OYPM3IZzqlux6cEB3TaXY0G3QzAz1aZDv7fsfNkx16j6XuyQZ/2GEru
	NdpAAdIbW0Eczz97NjEX+SiLAjylibu16ku7edmDptfPQxxJlM=
X-Received: by 2002:a17:907:7fa3:b0:bab:c3b2:8635 with SMTP id a640c23a62f3a-babc3b2885cmr939042466b.41.1777235262859;
        Sun, 26 Apr 2026 13:27:42 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-d50d-f478-16e1-e33f-42a0-4b51.rev.sfr.net. [2a02:8440:d50d:f478:16e1:e33f:42a0:4b51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455533b79sm1026817166b.54.2026.04.26.13.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 13:27:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for whinlatter on Sun Apr 26 21:33:11 2026
Date: Sun, 26 Apr 2026 22:27:19 +0200
Message-ID: <20260426202720.270300-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260426202720.270300-1-yoann.congal@smile.fr>
References: <20260426202720.270300-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 20:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235973

Branch: whinlatter

New this week: 138 CVEs
CVE-2026-1584 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1584 *
CVE-2026-2100 (CVSS3: N/A): p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2100 *
CVE-2026-23315 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23315 *
CVE-2026-23316 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23316 *
CVE-2026-23317 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23317 *
CVE-2026-23318 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23318 *
CVE-2026-23319 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23319 *
CVE-2026-23321 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23321 *
CVE-2026-23324 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23324 *
CVE-2026-23325 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23325 *
CVE-2026-23326 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23326 *
CVE-2026-23327 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23327 *
CVE-2026-23328 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23328 *
CVE-2026-23330 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23330 *
CVE-2026-23331 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23331 *
CVE-2026-23332 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23332 *
CVE-2026-23334 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23334 *
CVE-2026-23335 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23335 *
CVE-2026-23336 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23336 *
CVE-2026-23338 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23338 *
CVE-2026-23339 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23339 *
CVE-2026-23340 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23340 *
CVE-2026-23343 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23343 *
CVE-2026-23345 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23345 *
CVE-2026-23346 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23346 *
CVE-2026-23347 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23347 *
CVE-2026-23348 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23348 *
CVE-2026-23351 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23351 *
CVE-2026-23352 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23352 *
CVE-2026-23354 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23354 *
CVE-2026-23356 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23356 *
CVE-2026-23357 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23357 *
CVE-2026-23358 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23358 *
CVE-2026-23359 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23359 *
CVE-2026-23361 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23361 *
CVE-2026-23362 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23362 *
CVE-2026-23363 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23363 *
CVE-2026-23364 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23364 *
CVE-2026-23365 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23365 *
CVE-2026-23366 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23366 *
CVE-2026-23367 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23367 *
CVE-2026-23368 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23368 *
CVE-2026-23369 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23369 *
CVE-2026-23370 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23370 *
CVE-2026-23371 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23371 *
CVE-2026-23372 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23372 *
CVE-2026-23373 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23373 *
CVE-2026-23374 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23374 *
CVE-2026-23375 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23375 *
CVE-2026-23377 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23377 *
CVE-2026-23378 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23378 *
CVE-2026-23379 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23379 *
CVE-2026-23380 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23380 *
CVE-2026-23381 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23381 *
CVE-2026-23382 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23382 *
CVE-2026-23383 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23383 *
CVE-2026-23385 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23385 *
CVE-2026-23386 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23386 *
CVE-2026-23388 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23388 *
CVE-2026-23389 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23389 *
CVE-2026-23390 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23390 *
CVE-2026-23391 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23391 *
CVE-2026-23392 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23392 *
CVE-2026-23393 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23393 *
CVE-2026-23394 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23394 *
CVE-2026-23395 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23395 *
CVE-2026-23396 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23396 *
CVE-2026-23397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23397 *
CVE-2026-23398 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23398 *
CVE-2026-23399 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23399 *
CVE-2026-23401 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23401 *
CVE-2026-23402 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23402 *
CVE-2026-23403 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23403 *
CVE-2026-23404 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23404 *
CVE-2026-23405 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23405 *
CVE-2026-23406 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23406 *
CVE-2026-23407 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23407 *
CVE-2026-23408 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23408 *
CVE-2026-23409 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23409 *
CVE-2026-23410 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23410 *
CVE-2026-23411 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23411 *
CVE-2026-23412 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23412 *
CVE-2026-23413 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23413 *
CVE-2026-23415 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23415 *
CVE-2026-23417 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23417 *
CVE-2026-23418 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23418 *
CVE-2026-23419 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23419 *
CVE-2026-23420 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23420 *
CVE-2026-23423 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23423 *
CVE-2026-23424 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23424 *
CVE-2026-23425 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23425 *
CVE-2026-23426 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23426 *
CVE-2026-23427 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23427 *
CVE-2026-23428 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23428 *
CVE-2026-23430 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23430 *
CVE-2026-23434 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23434 *
CVE-2026-23436 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23436 *
CVE-2026-23437 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23437 *
CVE-2026-23438 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23438 *
CVE-2026-23439 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23439 *
CVE-2026-23440 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23440 *
CVE-2026-23441 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23441 *
CVE-2026-23442 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23442 *
CVE-2026-23444 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23444 *
CVE-2026-23445 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23445 *
CVE-2026-23446 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23446 *
CVE-2026-23447 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23447 *
CVE-2026-2436 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2436 *
CVE-2026-27447 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27447 *
CVE-2026-27456 (CVSS3: N/A): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27456 *
CVE-2026-30997 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30997 *
CVE-2026-30998 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30998 *
CVE-2026-30999 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30999 *
CVE-2026-31788 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31788 *
CVE-2026-32775 (CVSS3: N/A): libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32775 *
CVE-2026-34982 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34982 *
CVE-2026-35177 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35177 *
CVE-2026-35341 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35341 *
CVE-2026-35348 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35348 *
CVE-2026-35350 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35350 *
CVE-2026-35352 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35352 *
CVE-2026-35354 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35354 *
CVE-2026-35357 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35357 *
CVE-2026-35359 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35359 *
CVE-2026-35360 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35360 *
CVE-2026-35363 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35363 *
CVE-2026-35364 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35364 *
CVE-2026-35367 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35367 *
CVE-2026-35368 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35368 *
CVE-2026-35377 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35377 *
CVE-2026-39881 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39881 *
CVE-2026-40962 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40962 *
CVE-2026-41080 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41080 *
CVE-2026-4176 (CVSS3: N/A): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4176 *
CVE-2026-4775 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4775 *
CVE-2026-5450 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5450 *
CVE-2026-5704 (CVSS3: N/A): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5704 *
CVE-2026-5928 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5928 *

Removed this week: 25 CVEs
CVE-2025-12801 (CVSS3: N/A): nfs-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12801 *
CVE-2025-69644 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69644 *
CVE-2025-69647 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69647 *
CVE-2025-69648 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69648 *
CVE-2025-69649 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69649 *
CVE-2025-69650 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69650 *
CVE-2025-69651 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69651 *
CVE-2025-69652 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69652 *
CVE-2025-70873 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-70873 *
CVE-2026-27140 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27140 *
CVE-2026-27143 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27143 *
CVE-2026-27144 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27144 *
CVE-2026-28418 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28418 *
CVE-2026-28419 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28419 *
CVE-2026-32280 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32280 *
CVE-2026-32281 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32281 *
CVE-2026-32282 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32282 *
CVE-2026-32283 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32283 *
CVE-2026-32288 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32288 *
CVE-2026-32289 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32289 *
CVE-2026-33412 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33412 *
CVE-2026-33416 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33416 *
CVE-2026-33636 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33636 *
CVE-2026-4437 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4437 *
CVE-2026-4438 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4438 *

Full list:  Found 521 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-40039 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40039 *
CVE-2025-40040 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40040 *
CVE-2025-40082 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40082 *
CVE-2025-40149 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40149 *
CVE-2025-40164 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40164 *
CVE-2025-40251 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40251 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-68211 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68211 *
CVE-2025-68214 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68214 *
CVE-2025-68223 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68223 *
CVE-2025-68333 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68333 *
CVE-2025-68340 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68340 *
CVE-2025-68351 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68351 *
CVE-2025-68358 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68358 *
CVE-2025-68365 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68365 *
CVE-2025-68725 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68725 *
CVE-2025-68749 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68749 *
CVE-2025-68817 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68817 *
CVE-2025-68823 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68823 *
CVE-2025-69693 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69693 *
CVE-2025-71071 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71071 *
CVE-2025-71072 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71072 *
CVE-2025-71073 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71073 *
CVE-2025-71074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71074 *
CVE-2025-71075 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71075 *
CVE-2025-71076 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71076 *
CVE-2025-71077 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71077 *
CVE-2025-71078 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71078 *
CVE-2025-71079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71079 *
CVE-2025-71080 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71080 *
CVE-2025-71081 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71081 *
CVE-2025-71082 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71082 *
CVE-2025-71083 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71083 *
CVE-2025-71084 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71084 *
CVE-2025-71085 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71085 *
CVE-2025-71086 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71086 *
CVE-2025-71087 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71087 *
CVE-2025-71088 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71088 *
CVE-2025-71089 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71089 *
CVE-2025-71091 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71091 *
CVE-2025-71093 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71093 *
CVE-2025-71094 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71094 *
CVE-2025-71095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71095 *
CVE-2025-71096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71096 *
CVE-2025-71097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71097 *
CVE-2025-71098 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71098 *
CVE-2025-71099 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71099 *
CVE-2025-71100 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71100 *
CVE-2025-71101 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71101 *
CVE-2025-71102 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71102 *
CVE-2025-71104 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71104 *
CVE-2025-71105 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71105 *
CVE-2025-71107 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71107 *
CVE-2025-71108 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71108 *
CVE-2025-71109 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71109 *
CVE-2025-71111 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71111 *
CVE-2025-71112 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71112 *
CVE-2025-71113 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71113 *
CVE-2025-71114 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71114 *
CVE-2025-71115 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71115 *
CVE-2025-71116 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71116 *
CVE-2025-71117 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71117 *
CVE-2025-71118 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71118 *
CVE-2025-71119 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71119 *
CVE-2025-71120 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71120 *
CVE-2025-71121 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71121 *
CVE-2025-71122 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71122 *
CVE-2025-71124 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71124 *
CVE-2025-71125 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71125 *
CVE-2025-71126 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71126 *
CVE-2025-71127 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71127 *
CVE-2025-71128 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71128 *
CVE-2025-71129 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71129 *
CVE-2025-71130 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71130 *
CVE-2025-71131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71131 *
CVE-2025-71132 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71132 *
CVE-2025-71133 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71133 *
CVE-2025-71134 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71134 *
CVE-2025-71135 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71135 *
CVE-2025-71136 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71136 *
CVE-2025-71137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71137 *
CVE-2025-71138 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71138 *
CVE-2025-71141 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71141 *
CVE-2025-71142 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71142 *
CVE-2025-71143 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71143 *
CVE-2025-71147 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71147 *
CVE-2025-71148 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71148 *
CVE-2025-71149 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71149 *
CVE-2025-71150 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71150 *
CVE-2025-71151 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71151 *
CVE-2025-71152 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71152 *
CVE-2025-71153 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71153 *
CVE-2025-71154 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71154 *
CVE-2025-71156 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71156 *
CVE-2025-71157 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71157 *
CVE-2025-71158 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71158 *
CVE-2025-71160 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71160 *
CVE-2025-71161 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71161 *
CVE-2025-71162 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71162 *
CVE-2025-71163 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71163 *
CVE-2025-71180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71180 *
CVE-2025-71182 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71182 *
CVE-2025-71183 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71183 *
CVE-2025-71184 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71184 *
CVE-2025-71185 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71185 *
CVE-2025-71186 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71186 *
CVE-2025-71187 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71187 *
CVE-2025-71188 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71188 *
CVE-2025-71189 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71189 *
CVE-2025-71190 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71190 *
CVE-2025-71191 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71191 *
CVE-2025-71200 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71200 *
CVE-2025-71201 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71201 *
CVE-2025-71202 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71202 *
CVE-2025-71203 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71203 *
CVE-2025-71204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71204 *
CVE-2025-71220 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71220 *
CVE-2025-71221 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71221 *
CVE-2025-71222 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71222 *
CVE-2025-71223 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71223 *
CVE-2025-71225 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71225 *
CVE-2025-71227 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71227 *
CVE-2025-71229 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71229 *
CVE-2025-71230 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71230 *
CVE-2025-71231 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71231 *
CVE-2025-71232 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71232 *
CVE-2025-71233 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71233 *
CVE-2025-71234 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71234 *
CVE-2025-71235 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71235 *
CVE-2025-71236 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71236 *
CVE-2025-71237 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71237 *
CVE-2025-71238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71238 *
CVE-2026-1467 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1467 *
CVE-2026-1536 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1536 *
CVE-2026-1539 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1539 *
CVE-2026-1584 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1584 *
CVE-2026-1801 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1801 *
CVE-2026-2100 (CVSS3: N/A): p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2100 *
CVE-2026-22976 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22976 *
CVE-2026-22977 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22977 *
CVE-2026-22978 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22978 *
CVE-2026-22979 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22979 *
CVE-2026-22980 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22980 *
CVE-2026-22981 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22981 *
CVE-2026-22982 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22982 *
CVE-2026-22984 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22984 *
CVE-2026-22985 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22985 *
CVE-2026-22986 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22986 *
CVE-2026-22989 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22989 *
CVE-2026-22990 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22990 *
CVE-2026-22991 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22991 *
CVE-2026-22992 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22992 *
CVE-2026-22993 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22993 *
CVE-2026-22994 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22994 *
CVE-2026-22996 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22996 *
CVE-2026-22997 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22997 *
CVE-2026-22998 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22998 *
CVE-2026-22999 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22999 *
CVE-2026-23000 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23000 *
CVE-2026-23001 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23001 *
CVE-2026-23002 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23002 *
CVE-2026-23003 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23003 *
CVE-2026-23005 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23005 *
CVE-2026-23006 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23006 *
CVE-2026-23007 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23007 *
CVE-2026-23008 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23008 *
CVE-2026-23009 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23009 *
CVE-2026-23010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23010 *
CVE-2026-23011 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23011 *
CVE-2026-23013 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23013 *
CVE-2026-23015 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23015 *
CVE-2026-23017 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23017 *
CVE-2026-23018 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23018 *
CVE-2026-23019 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23019 *
CVE-2026-23020 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23020 *
CVE-2026-23021 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23021 *
CVE-2026-23023 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23023 *
CVE-2026-23025 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23025 *
CVE-2026-23026 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23026 *
CVE-2026-23060 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23060 *
CVE-2026-23061 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23061 *
CVE-2026-23062 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23062 *
CVE-2026-23063 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23063 *
CVE-2026-23064 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23064 *
CVE-2026-23065 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23065 *
CVE-2026-23066 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23066 *
CVE-2026-23067 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23067 *
CVE-2026-23068 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23068 *
CVE-2026-23069 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23069 *
CVE-2026-23070 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23070 *
CVE-2026-23071 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23071 *
CVE-2026-23072 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23072 *
CVE-2026-23073 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23073 *
CVE-2026-23074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23074 *
CVE-2026-23075 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23075 *
CVE-2026-23076 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23076 *
CVE-2026-23077 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23077 *
CVE-2026-23078 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23078 *
CVE-2026-23080 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23080 *
CVE-2026-23081 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23081 *
CVE-2026-23083 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23083 *
CVE-2026-23084 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23084 *
CVE-2026-23085 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23085 *
CVE-2026-23086 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23086 *
CVE-2026-23087 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23087 *
CVE-2026-23088 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23088 *
CVE-2026-23089 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23089 *
CVE-2026-23090 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23090 *
CVE-2026-23091 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23091 *
CVE-2026-23092 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23092 *
CVE-2026-23093 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23093 *
CVE-2026-23094 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23094 *
CVE-2026-23095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23095 *
CVE-2026-23096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23096 *
CVE-2026-23097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23097 *
CVE-2026-23098 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23098 *
CVE-2026-23099 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23099 *
CVE-2026-23100 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23100 *
CVE-2026-23101 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23101 *
CVE-2026-23102 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23102 *
CVE-2026-23103 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23103 *
CVE-2026-23104 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23104 *
CVE-2026-23105 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23105 *
CVE-2026-23107 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23107 *
CVE-2026-23108 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23108 *
CVE-2026-23109 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23109 *
CVE-2026-23110 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23110 *
CVE-2026-23111 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23111 *
CVE-2026-23112 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23112 *
CVE-2026-23113 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23113 *
CVE-2026-23114 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23114 *
CVE-2026-23115 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23115 *
CVE-2026-23116 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23116 *
CVE-2026-23118 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23118 *
CVE-2026-23119 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23119 *
CVE-2026-23120 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23120 *
CVE-2026-23121 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23121 *
CVE-2026-23122 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23122 *
CVE-2026-23123 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23123 *
CVE-2026-23124 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23124 *
CVE-2026-23125 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23125 *
CVE-2026-23126 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23126 *
CVE-2026-23128 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23128 *
CVE-2026-23129 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23129 *
CVE-2026-23130 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23130 *
CVE-2026-23131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23131 *
CVE-2026-23133 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23133 *
CVE-2026-23135 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23135 *
CVE-2026-23136 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23136 *
CVE-2026-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23137 *
CVE-2026-23138 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23138 *
CVE-2026-23139 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23139 *
CVE-2026-23140 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23140 *
CVE-2026-23141 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23141 *
CVE-2026-23142 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23142 *
CVE-2026-23143 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23143 *
CVE-2026-23144 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23144 *
CVE-2026-23146 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23146 *
CVE-2026-23147 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23147 *
CVE-2026-23148 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23148 *
CVE-2026-23150 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23150 *
CVE-2026-23151 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23151 *
CVE-2026-23152 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23152 *
CVE-2026-23154 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23154 *
CVE-2026-23156 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23156 *
CVE-2026-23157 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23157 *
CVE-2026-23158 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23158 *
CVE-2026-23160 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23160 *
CVE-2026-23161 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23161 *
CVE-2026-23163 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23163 *
CVE-2026-23164 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23164 *
CVE-2026-23166 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23166 *
CVE-2026-23167 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23167 *
CVE-2026-23168 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23168 *
CVE-2026-23169 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23169 *
CVE-2026-23170 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23170 *
CVE-2026-23171 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23171 *
CVE-2026-23172 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23172 *
CVE-2026-23173 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23173 *
CVE-2026-23186 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23186 *
CVE-2026-23187 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23187 *
CVE-2026-23188 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23188 *
CVE-2026-23190 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23190 *
CVE-2026-23191 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23191 *
CVE-2026-23192 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23192 *
CVE-2026-23193 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23193 *
CVE-2026-23195 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23195 *
CVE-2026-23196 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23196 *
CVE-2026-23197 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23197 *
CVE-2026-23198 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23198 *
CVE-2026-23199 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23199 *
CVE-2026-23201 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23201 *
CVE-2026-23204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23204 *
CVE-2026-23205 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23205 *
CVE-2026-23206 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23206 *
CVE-2026-23208 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23208 *
CVE-2026-23209 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23209 *
CVE-2026-23210 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23210 *
CVE-2026-23212 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23212 *
CVE-2026-23213 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23213 *
CVE-2026-23214 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23214 *
CVE-2026-23215 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23215 *
CVE-2026-23216 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23216 *
CVE-2026-23217 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23217 *
CVE-2026-23219 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23219 *
CVE-2026-23220 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23220 *
CVE-2026-23221 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23221 *
CVE-2026-23222 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23222 *
CVE-2026-23223 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23223 *
CVE-2026-23224 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23224 *
CVE-2026-23226 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23226 *
CVE-2026-23227 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23227 *
CVE-2026-23228 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23228 *
CVE-2026-23229 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23229 *
CVE-2026-23230 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23230 *
CVE-2026-23231 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23231 *
CVE-2026-23233 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23233 *
CVE-2026-23234 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23234 *
CVE-2026-23235 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23235 *
CVE-2026-23236 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23236 *
CVE-2026-23237 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23237 *
CVE-2026-23238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23238 *
CVE-2026-23315 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23315 *
CVE-2026-23316 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23316 *
CVE-2026-23317 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23317 *
CVE-2026-23318 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23318 *
CVE-2026-23319 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23319 *
CVE-2026-23321 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23321 *
CVE-2026-23324 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23324 *
CVE-2026-23325 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23325 *
CVE-2026-23326 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23326 *
CVE-2026-23327 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23327 *
CVE-2026-23328 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23328 *
CVE-2026-23330 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23330 *
CVE-2026-23331 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23331 *
CVE-2026-23332 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23332 *
CVE-2026-23334 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23334 *
CVE-2026-23335 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23335 *
CVE-2026-23336 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23336 *
CVE-2026-23338 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23338 *
CVE-2026-23339 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23339 *
CVE-2026-23340 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23340 *
CVE-2026-23343 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23343 *
CVE-2026-23345 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23345 *
CVE-2026-23346 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23346 *
CVE-2026-23347 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23347 *
CVE-2026-23348 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23348 *
CVE-2026-23351 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23351 *
CVE-2026-23352 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23352 *
CVE-2026-23354 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23354 *
CVE-2026-23356 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23356 *
CVE-2026-23357 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23357 *
CVE-2026-23358 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23358 *
CVE-2026-23359 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23359 *
CVE-2026-23361 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23361 *
CVE-2026-23362 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23362 *
CVE-2026-23363 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23363 *
CVE-2026-23364 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23364 *
CVE-2026-23365 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23365 *
CVE-2026-23366 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23366 *
CVE-2026-23367 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23367 *
CVE-2026-23368 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23368 *
CVE-2026-23369 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23369 *
CVE-2026-23370 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23370 *
CVE-2026-23371 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23371 *
CVE-2026-23372 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23372 *
CVE-2026-23373 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23373 *
CVE-2026-23374 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23374 *
CVE-2026-23375 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23375 *
CVE-2026-23377 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23377 *
CVE-2026-23378 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23378 *
CVE-2026-23379 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23379 *
CVE-2026-23380 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23380 *
CVE-2026-23381 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23381 *
CVE-2026-23382 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23382 *
CVE-2026-23383 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23383 *
CVE-2026-23385 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23385 *
CVE-2026-23386 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23386 *
CVE-2026-23388 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23388 *
CVE-2026-23389 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23389 *
CVE-2026-23390 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23390 *
CVE-2026-23391 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23391 *
CVE-2026-23392 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23392 *
CVE-2026-23393 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23393 *
CVE-2026-23394 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23394 *
CVE-2026-23395 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23395 *
CVE-2026-23396 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23396 *
CVE-2026-23397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23397 *
CVE-2026-23398 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23398 *
CVE-2026-23399 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23399 *
CVE-2026-23401 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23401 *
CVE-2026-23402 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23402 *
CVE-2026-23403 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23403 *
CVE-2026-23404 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23404 *
CVE-2026-23405 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23405 *
CVE-2026-23406 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23406 *
CVE-2026-23407 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23407 *
CVE-2026-23408 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23408 *
CVE-2026-23409 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23409 *
CVE-2026-23410 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23410 *
CVE-2026-23411 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23411 *
CVE-2026-23412 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23412 *
CVE-2026-23413 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23413 *
CVE-2026-23415 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23415 *
CVE-2026-23417 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23417 *
CVE-2026-23418 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23418 *
CVE-2026-23419 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23419 *
CVE-2026-23420 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23420 *
CVE-2026-23423 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23423 *
CVE-2026-23424 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23424 *
CVE-2026-23425 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23425 *
CVE-2026-23426 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23426 *
CVE-2026-23427 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23427 *
CVE-2026-23428 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23428 *
CVE-2026-23430 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23430 *
CVE-2026-23434 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23434 *
CVE-2026-23436 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23436 *
CVE-2026-23437 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23437 *
CVE-2026-23438 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23438 *
CVE-2026-23439 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23439 *
CVE-2026-23440 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23440 *
CVE-2026-23441 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23441 *
CVE-2026-23442 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23442 *
CVE-2026-23444 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23444 *
CVE-2026-23445 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23445 *
CVE-2026-23446 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23446 *
CVE-2026-23447 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23447 *
CVE-2026-2436 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2436 *
CVE-2026-2443 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2443 *
CVE-2026-25645 (CVSS3: N/A): python3-requests:python3-requests-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25645 *
CVE-2026-27135 (CVSS3: N/A): nghttp2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27135 *
CVE-2026-27447 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27447 *
CVE-2026-27456 (CVSS3: N/A): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27456 *
CVE-2026-28417 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28417 *
CVE-2026-28420 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28420 *
CVE-2026-28421 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28421 *
CVE-2026-28422 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28422 *
CVE-2026-29111 (CVSS3: N/A): systemd-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-29111 *
CVE-2026-2920 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2920 *
CVE-2026-2921 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2921 *
CVE-2026-2922 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2922 *
CVE-2026-2923 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2923 *
CVE-2026-3081 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3081 *
CVE-2026-3082 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3082 *
CVE-2026-3083 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3083 *
CVE-2026-3084 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3084 *
CVE-2026-3085 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3085 *
CVE-2026-3086 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3086 *
CVE-2026-3099 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3099 *
CVE-2026-30997 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30997 *
CVE-2026-30998 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30998 *
CVE-2026-30999 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30999 *
CVE-2026-31788 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31788 *
CVE-2026-32775 (CVSS3: N/A): libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32775 *
CVE-2026-3441 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3441 *
CVE-2026-3442 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3442 *
CVE-2026-34714 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34714 *
CVE-2026-34743 (CVSS3: N/A): xz:xz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34743 *
CVE-2026-34933 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34933 *
CVE-2026-34978 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34978 *
CVE-2026-34979 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34979 *
CVE-2026-34980 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34980 *
CVE-2026-34982 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34982 *
CVE-2026-34990 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34990 *
CVE-2026-35093 (CVSS3: N/A): libinput https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35093 *
CVE-2026-35094 (CVSS3: N/A): libinput https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35094 *
CVE-2026-35177 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35177 *
CVE-2026-35341 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35341 *
CVE-2026-35348 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35348 *
CVE-2026-35350 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35350 *
CVE-2026-35352 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35352 *
CVE-2026-35354 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35354 *
CVE-2026-35357 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35357 *
CVE-2026-35359 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35359 *
CVE-2026-35360 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35360 *
CVE-2026-35363 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35363 *
CVE-2026-35364 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35364 *
CVE-2026-35367 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35367 *
CVE-2026-35368 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35368 *
CVE-2026-35377 (CVSS3: N/A): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35377 *
CVE-2026-35414 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35414 *
CVE-2026-3632 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3632 *
CVE-2026-3633 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3633 *
CVE-2026-3634 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3634 *
CVE-2026-39314 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39314 *
CVE-2026-39316 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39316 *
CVE-2026-39837 (CVSS3: N/A): cargo:cargo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39837 *
CVE-2026-39839 (CVSS3: N/A): cargo:cargo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39839 *
CVE-2026-39840 (CVSS3: N/A): cargo:cargo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39840 *
CVE-2026-39841 (CVSS3: N/A): cargo:cargo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39841 *
CVE-2026-39881 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39881 *
CVE-2026-40226 (CVSS3: N/A): systemd-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40226 *
CVE-2026-40385 (CVSS3: N/A): libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40385 *
CVE-2026-40386 (CVSS3: N/A): libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40386 *
CVE-2026-4046 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4046 *
CVE-2026-40962 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40962 *
CVE-2026-41080 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41080 *
CVE-2026-4176 (CVSS3: N/A): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4176 *
CVE-2026-4271 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4271 *
CVE-2026-4519 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4519 *
CVE-2026-4647 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4647 *
CVE-2026-4775 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4775 *
CVE-2026-5119 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5119 *
CVE-2026-5121 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5121 *
CVE-2026-5450 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5450 *
CVE-2026-5704 (CVSS3: N/A): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5704 *
CVE-2026-5928 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5928 *

Summary of CVE counts by recipe:
  linux-yocto: 431
  coreutils:coreutils-native: 13
  libsoup: 12
  gstreamer1.0: 10
  vim: 8
  cups: 7
  ffmpeg: 5
  cargo:cargo-native: 4
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 3
  glibc: 3
  libexif: 3
  avahi: 2
  libinput: 2
  libsndfile1: 2
  systemd-boot: 2
  expat:expat-native: 1
  gnutls:gnutls-native: 1
  libarchive:libarchive-native: 1
  nghttp2: 1
  openssh: 1
  p11-kit: 1
  perl:perl-native: 1
  python3:python3-native: 1
  python3-requests:python3-requests-native: 1
  qemu:qemu-native:qemu-system-native: 1
  tar: 1
  tiff: 1
  util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native: 1
  xz:xz-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

