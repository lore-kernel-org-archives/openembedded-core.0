Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16B8FF8865
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 20:27:55 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27117.1777235264507422849
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 13:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qQOBWgey;
 spf=pass (domain: smile.fr, ip: 209.85.218.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b936331786dso1241637566b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 13:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777235263; x=1777840063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4b5XqtdErjCVhmvQSLB6x0XS2braMGxJDVVV5jjJgA=;
        b=qQOBWgeyEKbJJAlyoZYEdVjmhVDMz3iZxDX9s0/SbBDy5tj2Ma7YXSKHs5jSQTUjKg
         Ngz8ZLA7V44X+vrCwODLW+f31DUrf1CZ9FUSdv3HzcqsMLd/NlbIipu4dnCb4qTDdD8h
         rkon66bbWMYgClHTdt0X59v5C+e0j6ZNsO7jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777235263; x=1777840063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y4b5XqtdErjCVhmvQSLB6x0XS2braMGxJDVVV5jjJgA=;
        b=cvekWsrrOF5hMe/nFoksHyOCK3Si1FWSbWpEWZDzkLxuwk02Yfy8pq3/x70ZeZrj40
         +KZaNFYYNkWYwD388Zj31sJ6uJ96/Cwb6tg+YzBzAxm63ZEiS2hNcXpI4ywf4//vYj/s
         XYfKr0ZDJS+X7rw5WoqaxL7ecThkoj82jiok2IGS7vQXk1E5wVNfUNkclUlgh9IbiT7+
         YhFbdYotivnJq8aIA3wpGUlcpV0TlMj56UMtUUcfFsyDvcfsLRszsdn0/xHOsHCVuvbg
         QFSzDqNVN77kahuwTUu/ApS32zFzJsFjZiUdlzeSQBOyYtUNiAlZVtbKUdIB4OzRFOTl
         RXqQ==
X-Gm-Message-State: AOJu0Yx620BSbjpiQuxh8W4TeSyxrY3WLTQjNLkOuOZ39ni4zsJhelIN
	wdMdLYDIL1h9PqYrihjroZILmnOn9KAUfaxZwJC8R9IzYUwAD/sjuwOQDb8zbkjVxiXX8kO/fgN
	grdveoIU=
X-Gm-Gg: AeBDieumAHoyXhALEY+v2EyV+yYIMnf7DLNKF1I6WjFTK9LxaquEsDKc8Rz8iCbz6r0
	GGdFjDPPnMPB063Ti7dY6NoxxhgA/WCzAlhE4WU78zL7aatYLIxwQ92jfz+VDyCMwHwRgRiNSv5
	5g48NUY5jf8EDIAVx0YSkFuAIHGmWrHR/VeOns07pSOUZGV7Ix02YAbZEyZ2LMYSqVMeit0nv8Q
	aCn0X2AW63wS7nt2nmR3nEn0jT5Q5K3MUjmw10yquzRyLChQi9QUYCK8tmPs9J2ptnDtQMK6DOG
	OQtdgTWB5F3fCdH1/UDCjmQRUUf7X6ZJfOqlspCnwL6NEbo4u0gWNKicv+rXnvoTz3/eNBKl/QU
	zxTZslzOr9lvqcED+4yHoOigetJvVK1ItQrc+VQDcXOObtYrwJ++UcGs1xFPQQW6ck9UieTKqNS
	5ARQAkgqbwcQ64c3pP4hwG6chFsoNIcvfX/7OBxpFWjxQMIFEGjHBUEMVgttpDk4V5QlLaCfBf/
	WRvbgeaq1UISuN0P2Gzx2xQNPZ9dreWNLnWlKde
X-Received: by 2002:a17:907:7248:b0:ba8:2e6f:a436 with SMTP id a640c23a62f3a-ba82e6fa4cfmr1481904666b.31.1777235261655;
        Sun, 26 Apr 2026 13:27:41 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-d50d-f478-16e1-e33f-42a0-4b51.rev.sfr.net. [2a02:8440:d50d:f478:16e1:e33f:42a0:4b51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455533b79sm1026817166b.54.2026.04.26.13.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 13:27:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for scarthgap on Sun Apr 26 21:31:16 2026
Date: Sun, 26 Apr 2026 22:27:18 +0200
Message-ID: <20260426202720.270300-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260426202720.270300-1-yoann.congal@smile.fr>
References: <20260426202720.270300-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 20:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235972

Branch: scarthgap

New this week: 122 CVEs
CVE-2026-1584 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1584 *
CVE-2026-2100 (CVSS3: N/A): p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2100 *
CVE-2026-23315 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23315 *
CVE-2026-23317 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23317 *
CVE-2026-23318 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23318 *
CVE-2026-23319 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23319 *
CVE-2026-23321 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23321 *
CVE-2026-23324 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23324 *
CVE-2026-23325 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23325 *
CVE-2026-23327 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23327 *
CVE-2026-23330 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23330 *
CVE-2026-23334 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23334 *
CVE-2026-23335 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23335 *
CVE-2026-23336 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23336 *
CVE-2026-23339 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23339 *
CVE-2026-23340 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23340 *
CVE-2026-23343 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23343 *
CVE-2026-23346 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23346 *
CVE-2026-23347 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23347 *
CVE-2026-23348 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23348 *
CVE-2026-23351 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23351 *
CVE-2026-23352 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23352 *
CVE-2026-23356 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23356 *
CVE-2026-23357 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23357 *
CVE-2026-23359 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23359 *
CVE-2026-23360 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23360 *
CVE-2026-23361 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23361 *
CVE-2026-23362 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23362 *
CVE-2026-23364 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23364 *
CVE-2026-23365 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23365 *
CVE-2026-23367 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23367 *
CVE-2026-23368 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23368 *
CVE-2026-23370 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23370 *
CVE-2026-23371 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23371 *
CVE-2026-23372 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23372 *
CVE-2026-23374 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23374 *
CVE-2026-23377 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23377 *
CVE-2026-23378 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23378 *
CVE-2026-23379 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23379 *
CVE-2026-23381 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23381 *
CVE-2026-23382 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23382 *
CVE-2026-23383 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23383 *
CVE-2026-23386 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23386 *
CVE-2026-23387 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23387 *
CVE-2026-23388 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23388 *
CVE-2026-23389 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23389 *
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
CVE-2026-23414 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23414 *
CVE-2026-23419 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23419 *
CVE-2026-23420 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23420 *
CVE-2026-23426 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23426 *
CVE-2026-23427 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23427 *
CVE-2026-23428 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23428 *
CVE-2026-23434 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23434 *
CVE-2026-23438 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23438 *
CVE-2026-23439 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23439 *
CVE-2026-23440 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23440 *
CVE-2026-23441 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23441 *
CVE-2026-23442 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23442 *
CVE-2026-23444 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23444 *
CVE-2026-23446 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23446 *
CVE-2026-23447 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23447 *
CVE-2026-2436 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2436 *
CVE-2026-25679 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25679 *
CVE-2026-27139 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27139 *
CVE-2026-27142 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27142 *
CVE-2026-27447 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27447 *
CVE-2026-27456 (CVSS3: N/A): util-linux:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27456 *
CVE-2026-28387 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28387 *
CVE-2026-28388 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28388 *
CVE-2026-28389 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28389 *
CVE-2026-28390 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28390 *
CVE-2026-30997 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30997 *
CVE-2026-30998 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30998 *
CVE-2026-30999 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30999 *
CVE-2026-31788 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31788 *
CVE-2026-31789 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31789 *
CVE-2026-31790 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31790 *
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

Removed this week: 0 CVEs

Full list:  Found 764 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-39176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39176 *
CVE-2023-39179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39179 *
CVE-2023-39180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39180 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52485 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52485 *
CVE-2023-52585 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52585 *
CVE-2023-52586 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52586 *
CVE-2023-52590 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52590 *
CVE-2023-52624 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52624 *
CVE-2023-52625 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52625 *
CVE-2023-52634 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52634 *
CVE-2023-52904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-52920 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52920 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-23848 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23848 *
CVE-2024-24859 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24859 *
CVE-2024-24864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24864 *
CVE-2024-25739 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25739 *
CVE-2024-25740 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25740 *
CVE-2024-25741 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25741 *
CVE-2024-26596 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26596 *
CVE-2024-26672 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26672 *
CVE-2024-26686 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26686 *
CVE-2024-26699 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26699 *
CVE-2024-26756 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26756 *
CVE-2024-26757 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26757 *
CVE-2024-26758 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26758 *
CVE-2024-26785 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26785 *
CVE-2024-26811 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26811 *
CVE-2024-26900 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26900 *
CVE-2024-26944 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26944 *
CVE-2024-26945 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26945 *
CVE-2024-26948 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26948 *
CVE-2024-26949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26949 *
CVE-2024-26954 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26954 *
CVE-2024-26962 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26962 *
CVE-2024-27010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27010 *
CVE-2024-27011 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27011 *
CVE-2024-27012 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27012 *
CVE-2024-27017 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27017 *
CVE-2024-27079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27079 *
CVE-2024-35794 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35794 *
CVE-2024-35808 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35808 *
CVE-2024-35843 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35843 *
CVE-2024-35931 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35931 *
CVE-2024-35968 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35968 *
CVE-2024-36024 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-36024 *
CVE-2024-36288 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-36288 *
CVE-2024-36478 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-36478 *
CVE-2024-38595 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38595 *
CVE-2024-38608 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38608 *
CVE-2024-39472 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-39472 *
CVE-2024-40965 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-40965 *
CVE-2024-40979 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-40979 *
CVE-2024-40999 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-40999 *
CVE-2024-41008 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41008 *
CVE-2024-41023 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41023 *
CVE-2024-41045 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41045 *
CVE-2024-41067 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41067 *
CVE-2024-41080 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41080 *
CVE-2024-41082 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41082 *
CVE-2024-41085 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41085 *
CVE-2024-41932 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41932 *
CVE-2024-42064 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42064 *
CVE-2024-42065 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42065 *
CVE-2024-42066 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42066 *
CVE-2024-42071 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42071 *
CVE-2024-42075 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42075 *
CVE-2024-42078 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42078 *
CVE-2024-42081 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42081 *
CVE-2024-42083 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42083 *
CVE-2024-42107 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42107 *
CVE-2024-42118 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42118 *
CVE-2024-42122 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42122 *
CVE-2024-42123 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42123 *
CVE-2024-42134 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42134 *
CVE-2024-42139 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42139 *
CVE-2024-42151 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42151 *
CVE-2024-42155 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42155 *
CVE-2024-42156 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42156 *
CVE-2024-42158 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42158 *
CVE-2024-42162 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42162 *
CVE-2024-42227 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42227 *
CVE-2024-42252 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42252 *
CVE-2024-42317 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42317 *
CVE-2024-43819 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43819 *
CVE-2024-43824 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43824 *
CVE-2024-43826 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43826 *
CVE-2024-43835 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43835 *
CVE-2024-43840 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43840 *
CVE-2024-43857 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43857 *
CVE-2024-43872 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43872 *
CVE-2024-43884 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43884 *
CVE-2024-43886 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43886 *
CVE-2024-43899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43899 *
CVE-2024-43901 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43901 *
CVE-2024-43904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43904 *
CVE-2024-43911 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43911 *
CVE-2024-43913 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43913 *
CVE-2024-44950 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-44950 *
CVE-2024-44951 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-44951 *
CVE-2024-44956 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-44956 *
CVE-2024-44963 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-44963 *
CVE-2024-46681 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46681 *
CVE-2024-46698 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46698 *
CVE-2024-46701 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46701 *
CVE-2024-46705 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46705 *
CVE-2024-46710 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46710 *
CVE-2024-46727 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46727 *
CVE-2024-46729 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46729 *
CVE-2024-46730 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46730 *
CVE-2024-46751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46751 *
CVE-2024-46754 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46754 *
CVE-2024-46772 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46772 *
CVE-2024-46774 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46774 *
CVE-2024-46775 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46775 *
CVE-2024-46778 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46778 *
CVE-2024-46808 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46808 *
CVE-2024-46813 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46813 *
CVE-2024-46823 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46823 *
CVE-2024-46833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46833 *
CVE-2024-46834 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46834 *
CVE-2024-46841 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46841 *
CVE-2024-46842 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46842 *
CVE-2024-46870 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46870 *
CVE-2024-47661 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47661 *
CVE-2024-47662 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47662 *
CVE-2024-47702 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47702 *
CVE-2024-47703 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47703 *
CVE-2024-47726 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47726 *
CVE-2024-47736 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47736 *
CVE-2024-47794 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47794 *
CVE-2024-49885 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49885 *
CVE-2024-49888 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49888 *
CVE-2024-49891 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49891 *
CVE-2024-49893 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49893 *
CVE-2024-49897 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49897 *
CVE-2024-49898 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49898 *
CVE-2024-49899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49899 *
CVE-2024-49904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49904 *
CVE-2024-49906 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49906 *
CVE-2024-49908 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49908 *
CVE-2024-49909 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49909 *
CVE-2024-49910 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49910 *
CVE-2024-49911 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49911 *
CVE-2024-49914 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49914 *
CVE-2024-49915 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49915 *
CVE-2024-49916 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49916 *
CVE-2024-49917 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49917 *
CVE-2024-49918 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49918 *
CVE-2024-49919 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49919 *
CVE-2024-49920 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49920 *
CVE-2024-49921 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49921 *
CVE-2024-49922 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49922 *
CVE-2024-49923 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49923 *
CVE-2024-49926 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49926 *
CVE-2024-49928 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49928 *
CVE-2024-49932 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49932 *
CVE-2024-49934 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49934 *
CVE-2024-49940 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49940 *
CVE-2024-49945 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49945 *
CVE-2024-49968 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49968 *
CVE-2024-49970 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49970 *
CVE-2024-49971 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49971 *
CVE-2024-49972 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49972 *
CVE-2024-49974 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49974 *
CVE-2024-49990 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49990 *
CVE-2024-49994 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49994 *
CVE-2024-49998 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-49998 *
CVE-2024-50004 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50004 *
CVE-2024-50009 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50009 *
CVE-2024-50010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50010 *
CVE-2024-50014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50014 *
CVE-2024-50017 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50017 *
CVE-2024-50027 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50027 *
CVE-2024-50028 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50028 *
CVE-2024-50067 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50067 *
CVE-2024-50090 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50090 *
CVE-2024-50091 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50091 *
CVE-2024-50102 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50102 *
CVE-2024-50106 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50106 *
CVE-2024-50137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50137 *
CVE-2024-50138 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50138 *
CVE-2024-50146 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50146 *
CVE-2024-50157 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50157 *
CVE-2024-50177 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50177 *
CVE-2024-50178 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50178 *
CVE-2024-50217 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50217 *
CVE-2024-50221 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50221 *
CVE-2024-50225 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50225 *
CVE-2024-50277 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50277 *
CVE-2024-50289 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50289 *
CVE-2024-50304 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50304 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-52559 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-52559 *
CVE-2024-52560 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-52560 *
CVE-2024-53050 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53050 *
CVE-2024-53051 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53051 *
CVE-2024-53056 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53056 *
CVE-2024-53084 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53084 *
CVE-2024-53085 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53085 *
CVE-2024-53089 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53089 *
CVE-2024-53090 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53090 *
CVE-2024-53098 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53098 *
CVE-2024-53114 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53114 *
CVE-2024-53124 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53124 *
CVE-2024-53128 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53128 *
CVE-2024-53133 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53133 *
CVE-2024-53147 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53147 *
CVE-2024-53170 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53170 *
CVE-2024-53187 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53187 *
CVE-2024-53201 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53201 *
CVE-2024-53203 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53203 *
CVE-2024-53204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53204 *
CVE-2024-53205 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53205 *
CVE-2024-53209 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53209 *
CVE-2024-53219 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53219 *
CVE-2024-53221 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53221 *
CVE-2024-53222 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-53222 *
CVE-2024-56544 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56544 *
CVE-2024-56549 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56549 *
CVE-2024-56588 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56588 *
CVE-2024-56591 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56591 *
CVE-2024-56599 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56599 *
CVE-2024-56608 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56608 *
CVE-2024-56620 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56620 *
CVE-2024-56647 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56647 *
CVE-2024-56702 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56702 *
CVE-2024-56712 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56712 *
CVE-2024-56742 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56742 *
CVE-2024-56757 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56757 *
CVE-2024-56758 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56758 *
CVE-2024-56759 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56759 *
CVE-2024-56761 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56761 *
CVE-2024-56775 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56775 *
CVE-2024-56782 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56782 *
CVE-2024-56784 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56784 *
CVE-2024-57795 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57795 *
CVE-2024-57804 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57804 *
CVE-2024-57809 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57809 *
CVE-2024-57857 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57857 *
CVE-2024-57872 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57872 *
CVE-2024-57875 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57875 *
CVE-2024-57898 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57898 *
CVE-2024-57950 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57950 *
CVE-2024-57974 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57974 *
CVE-2024-57975 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57975 *
CVE-2024-57976 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57976 *
CVE-2024-57977 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57977 *
CVE-2024-57982 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57982 *
CVE-2024-57994 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57994 *
CVE-2024-57999 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57999 *
CVE-2024-58006 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58006 *
CVE-2024-58012 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58012 *
CVE-2024-58015 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58015 *
CVE-2024-58089 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58089 *
CVE-2024-58093 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58093 *
CVE-2024-58094 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58094 *
CVE-2024-58095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58095 *
CVE-2024-58096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58096 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-58241 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58241 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-12781 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12781 *
CVE-2025-12801 (CVSS3: N/A): nfs-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12801 *
CVE-2025-21634 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21634 *
CVE-2025-21635 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21635 *
CVE-2025-21649 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21649 *
CVE-2025-21650 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21650 *
CVE-2025-21651 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21651 *
CVE-2025-21672 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21672 *
CVE-2025-21682 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21682 *
CVE-2025-21693 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21693 *
CVE-2025-21696 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21696 *
CVE-2025-21714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21714 *
CVE-2025-21722 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21722 *
CVE-2025-21723 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21723 *
CVE-2025-21729 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21729 *
CVE-2025-21732 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21732 *
CVE-2025-21739 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21739 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21768 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21768 *
CVE-2025-21786 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21786 *
CVE-2025-21801 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21801 *
CVE-2025-21825 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21825 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21861 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21861 *
CVE-2025-21868 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21868 *
CVE-2025-21870 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21870 *
CVE-2025-21885 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21885 *
CVE-2025-21888 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21888 *
CVE-2025-21892 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21892 *
CVE-2025-21907 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21907 *
CVE-2025-21927 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21927 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-21961 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21961 *
CVE-2025-21972 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21972 *
CVE-2025-21976 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21976 *
CVE-2025-21985 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21985 *
CVE-2025-22022 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22022 *
CVE-2025-22026 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22026 *
CVE-2025-22037 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22037 *
CVE-2025-22039 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22039 *
CVE-2025-22062 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22062 *
CVE-2025-22070 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22070 *
CVE-2025-22101 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22101 *
CVE-2025-22103 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22103 *
CVE-2025-22104 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22104 *
CVE-2025-22105 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22105 *
CVE-2025-22107 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22107 *
CVE-2025-22108 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22108 *
CVE-2025-22109 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22109 *
CVE-2025-22111 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22111 *
CVE-2025-22113 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22113 *
CVE-2025-22115 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22115 *
CVE-2025-22121 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22121 *
CVE-2025-22124 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22124 *
CVE-2025-22125 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22125 *
CVE-2025-22127 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22127 *
CVE-2025-22873 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22873 *
CVE-2025-23129 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23129 *
CVE-2025-23130 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23130 *
CVE-2025-23131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23131 *
CVE-2025-23132 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23132 *
CVE-2025-23133 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23133 *
CVE-2025-23135 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23135 *
CVE-2025-23155 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23155 *
CVE-2025-37743 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37743 *
CVE-2025-37745 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37745 *
CVE-2025-37747 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37747 *
CVE-2025-37750 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37750 *
CVE-2025-37759 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37759 *
CVE-2025-37802 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37802 *
CVE-2025-37806 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37806 *
CVE-2025-37807 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37807 *
CVE-2025-37822 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37822 *
CVE-2025-37826 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37826 *
CVE-2025-37833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37833 *
CVE-2025-37834 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37834 *
CVE-2025-37856 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37856 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37861 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37861 *
CVE-2025-37870 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37870 *
CVE-2025-37877 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37877 *
CVE-2025-37880 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37880 *
CVE-2025-37882 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37882 *
CVE-2025-37899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37899 *
CVE-2025-37907 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37907 *
CVE-2025-37920 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37920 *
CVE-2025-37926 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37926 *
CVE-2025-37945 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37945 *
CVE-2025-37977 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37977 *
CVE-2025-38011 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38011 *
CVE-2025-38022 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38022 *
CVE-2025-38029 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38029 *
CVE-2025-38038 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38038 *
CVE-2025-38041 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38041 *
CVE-2025-38042 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38042 *
CVE-2025-38057 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38057 *
CVE-2025-38060 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38060 *
CVE-2025-38064 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38064 *
CVE-2025-38069 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38069 *
CVE-2025-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38096 *
CVE-2025-38099 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38099 *
CVE-2025-38104 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38104 *
CVE-2025-38125 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38125 *
CVE-2025-38129 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38129 *
CVE-2025-38132 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38132 *
CVE-2025-38140 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38140 *
CVE-2025-38162 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38162 *
CVE-2025-38164 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38164 *
CVE-2025-38189 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38189 *
CVE-2025-38199 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38199 *
CVE-2025-38201 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38201 *
CVE-2025-38203 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38203 *
CVE-2025-38204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38204 *
CVE-2025-38206 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38206 *
CVE-2025-38207 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38207 *
CVE-2025-38232 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38232 *
CVE-2025-38234 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38234 *
CVE-2025-38237 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38237 *
CVE-2025-38248 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38248 *
CVE-2025-38261 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38261 *
CVE-2025-38264 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38264 *
CVE-2025-38269 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38269 *
CVE-2025-38272 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38272 *
CVE-2025-38279 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38279 *
CVE-2025-38292 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38292 *
CVE-2025-38303 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38303 *
CVE-2025-38311 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38311 *
CVE-2025-38333 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38333 *
CVE-2025-38359 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38359 *
CVE-2025-38361 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38361 *
CVE-2025-38408 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38408 *
CVE-2025-38414 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38414 *
CVE-2025-38426 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38426 *
CVE-2025-38438 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38438 *
CVE-2025-38507 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38507 *
CVE-2025-38531 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38531 *
CVE-2025-38556 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38556 *
CVE-2025-38582 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38582 *
CVE-2025-38584 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38584 *
CVE-2025-38585 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38585 *
CVE-2025-38591 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38591 *
CVE-2025-38595 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38595 *
CVE-2025-38597 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38597 *
CVE-2025-38605 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38605 *
CVE-2025-38627 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38627 *
CVE-2025-38636 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38636 *
CVE-2025-38656 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38656 *
CVE-2025-38660 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38660 *
CVE-2025-38704 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38704 *
CVE-2025-38705 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38705 *
CVE-2025-38710 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38710 *
CVE-2025-38717 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38717 *
CVE-2025-38722 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-38722 *
CVE-2025-39677 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39677 *
CVE-2025-39705 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39705 *
CVE-2025-39707 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39707 *
CVE-2025-39732 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39732 *
CVE-2025-39745 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39745 *
CVE-2025-39746 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39746 *
CVE-2025-39747 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39747 *
CVE-2025-39748 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39748 *
CVE-2025-39754 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39754 *
CVE-2025-39762 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39762 *
CVE-2025-39764 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39764 *
CVE-2025-39779 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39779 *
CVE-2025-39789 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39789 *
CVE-2025-39805 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39805 *
CVE-2025-39810 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39810 *
CVE-2025-39829 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39829 *
CVE-2025-39833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39833 *
CVE-2025-39850 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39850 *
CVE-2025-39851 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39851 *
CVE-2025-39859 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39859 *
CVE-2025-39862 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39862 *
CVE-2025-39901 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39901 *
CVE-2025-39905 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39905 *
CVE-2025-39910 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39910 *
CVE-2025-39925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39925 *
CVE-2025-39927 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39927 *
CVE-2025-39932 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39932 *
CVE-2025-39933 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39933 *
CVE-2025-39940 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39940 *
CVE-2025-39948 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39948 *
CVE-2025-39958 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-39958 *
CVE-2025-40005 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40005 *
CVE-2025-40082 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40082 *
CVE-2025-40325 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40325 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-4674 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4674 *
CVE-2025-47906 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47906 *
CVE-2025-47907 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47907 *
CVE-2025-47912 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47912 *
CVE-2025-50182 (CVSS3: N/A): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-50182 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-58185 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58185 *
CVE-2025-58187 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58187 *
CVE-2025-58188 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58188 *
CVE-2025-58189 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58189 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-61723 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61723 *
CVE-2025-61724 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61724 *
CVE-2025-61726 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61726 *
CVE-2025-61727 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61727 *
CVE-2025-61728 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61728 *
CVE-2025-61729 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61729 *
CVE-2025-61730 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61730 *
CVE-2025-61731 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61731 *
CVE-2025-61732 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61732 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *
CVE-2025-68119 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68119 *
CVE-2025-68121 (CVSS3: N/A): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68121 *
CVE-2025-68358 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68358 *
CVE-2025-68823 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68823 *
CVE-2025-68972 (CVSS3: N/A): gnupg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68972 *
CVE-2025-69644 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69644 *
CVE-2025-69647 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69647 *
CVE-2025-69648 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69648 *
CVE-2025-69649 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69649 *
CVE-2025-69650 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69650 *
CVE-2025-69651 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69651 *
CVE-2025-69652 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69652 *
CVE-2025-69720 (CVSS3: N/A): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69720 *
CVE-2025-70873 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-70873 *
CVE-2025-71072 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71072 *
CVE-2025-71073 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71073 *
CVE-2025-71074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71074 *
CVE-2025-71109 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71109 *
CVE-2025-71152 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71152 *
CVE-2025-71161 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71161 *
CVE-2025-71184 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71184 *
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
CVE-2025-71232 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71232 *
CVE-2025-71233 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71233 *
CVE-2025-71235 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71235 *
CVE-2025-71236 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71236 *
CVE-2025-71237 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71237 *
CVE-2025-71238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71238 *
CVE-2026-1467 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1467 *
CVE-2026-1536 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1536 *
CVE-2026-1539 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1539 *
CVE-2026-1584 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1584 *
CVE-2026-1801 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1801 *
CVE-2026-1965 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1965 *
CVE-2026-2100 (CVSS3: N/A): p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2100 *
CVE-2026-22996 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22996 *
CVE-2026-23000 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23000 *
CVE-2026-23004 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23004 *
CVE-2026-23066 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23066 *
CVE-2026-23100 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23100 *
CVE-2026-23111 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23111 *
CVE-2026-23112 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23112 *
CVE-2026-23118 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23118 *
CVE-2026-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23137 *
CVE-2026-23138 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23138 *
CVE-2026-23154 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23154 *
CVE-2026-23157 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23157 *
CVE-2026-23169 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23169 *
CVE-2026-23171 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23171 *
CVE-2026-23187 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23187 *
CVE-2026-23190 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23190 *
CVE-2026-23191 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23191 *
CVE-2026-23193 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23193 *
CVE-2026-23198 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23198 *
CVE-2026-23200 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23200 *
CVE-2026-23202 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23202 *
CVE-2026-23204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23204 *
CVE-2026-23205 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23205 *
CVE-2026-23206 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23206 *
CVE-2026-23207 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23207 *
CVE-2026-23208 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23208 *
CVE-2026-23209 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23209 *
CVE-2026-23213 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23213 *
CVE-2026-23214 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23214 *
CVE-2026-23216 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23216 *
CVE-2026-23220 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23220 *
CVE-2026-23221 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23221 *
CVE-2026-23222 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23222 *
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
CVE-2026-23317 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23317 *
CVE-2026-23318 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23318 *
CVE-2026-23319 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23319 *
CVE-2026-23321 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23321 *
CVE-2026-23324 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23324 *
CVE-2026-23325 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23325 *
CVE-2026-23327 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23327 *
CVE-2026-23330 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23330 *
CVE-2026-23334 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23334 *
CVE-2026-23335 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23335 *
CVE-2026-23336 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23336 *
CVE-2026-23339 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23339 *
CVE-2026-23340 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23340 *
CVE-2026-23343 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23343 *
CVE-2026-23346 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23346 *
CVE-2026-23347 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23347 *
CVE-2026-23348 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23348 *
CVE-2026-23351 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23351 *
CVE-2026-23352 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23352 *
CVE-2026-23356 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23356 *
CVE-2026-23357 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23357 *
CVE-2026-23359 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23359 *
CVE-2026-23360 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23360 *
CVE-2026-23361 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23361 *
CVE-2026-23362 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23362 *
CVE-2026-23364 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23364 *
CVE-2026-23365 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23365 *
CVE-2026-23367 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23367 *
CVE-2026-23368 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23368 *
CVE-2026-23370 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23370 *
CVE-2026-23371 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23371 *
CVE-2026-23372 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23372 *
CVE-2026-23374 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23374 *
CVE-2026-23377 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23377 *
CVE-2026-23378 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23378 *
CVE-2026-23379 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23379 *
CVE-2026-23381 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23381 *
CVE-2026-23382 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23382 *
CVE-2026-23383 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23383 *
CVE-2026-23386 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23386 *
CVE-2026-23387 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23387 *
CVE-2026-23388 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23388 *
CVE-2026-23389 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23389 *
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
CVE-2026-23414 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23414 *
CVE-2026-23419 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23419 *
CVE-2026-23420 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23420 *
CVE-2026-23426 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23426 *
CVE-2026-23427 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23427 *
CVE-2026-23428 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23428 *
CVE-2026-23434 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23434 *
CVE-2026-23438 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23438 *
CVE-2026-23439 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23439 *
CVE-2026-23440 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23440 *
CVE-2026-23441 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23441 *
CVE-2026-23442 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23442 *
CVE-2026-23444 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23444 *
CVE-2026-23446 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23446 *
CVE-2026-23447 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23447 *
CVE-2026-2436 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2436 *
CVE-2026-2443 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2443 *
CVE-2026-25645 (CVSS3: N/A): python3-requests https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25645 *
CVE-2026-25679 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25679 *
CVE-2026-25749 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25749 *
CVE-2026-26269 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-26269 *
CVE-2026-27135 (CVSS3: N/A): nghttp2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27135 *
CVE-2026-27139 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27139 *
CVE-2026-27140 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27140 *
CVE-2026-27142 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27142 *
CVE-2026-27143 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27143 *
CVE-2026-27144 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27144 *
CVE-2026-27447 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27447 *
CVE-2026-27456 (CVSS3: N/A): util-linux:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27456 *
CVE-2026-28387 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28387 *
CVE-2026-28388 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28388 *
CVE-2026-28389 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28389 *
CVE-2026-28390 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28390 *
CVE-2026-28417 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28417 *
CVE-2026-28418 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28418 *
CVE-2026-28419 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28419 *
CVE-2026-28420 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28420 *
CVE-2026-28421 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28421 *
CVE-2026-28422 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28422 *
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
CVE-2026-3099 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3099 *
CVE-2026-30997 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30997 *
CVE-2026-30998 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30998 *
CVE-2026-30999 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30999 *
CVE-2026-31788 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31788 *
CVE-2026-31789 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31789 *
CVE-2026-31790 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31790 *
CVE-2026-32280 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32280 *
CVE-2026-32281 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32281 *
CVE-2026-32282 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32282 *
CVE-2026-32283 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32283 *
CVE-2026-32288 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32288 *
CVE-2026-32289 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32289 *
CVE-2026-32775 (CVSS3: N/A): libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32775 *
CVE-2026-32776 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32776 *
CVE-2026-32777 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32777 *
CVE-2026-32778 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32778 *
CVE-2026-33412 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33412 *
CVE-2026-33416 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33416 *
CVE-2026-33636 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33636 *
CVE-2026-34085 (CVSS3: N/A): fontconfig:fontconfig-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34085 *
CVE-2026-3441 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3441 *
CVE-2026-3442 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3442 *
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
CVE-2026-3632 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3632 *
CVE-2026-3633 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3633 *
CVE-2026-3634 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3634 *
CVE-2026-3783 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3783 *
CVE-2026-3784 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3784 *
CVE-2026-39314 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39314 *
CVE-2026-39316 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39316 *
CVE-2026-39837 (CVSS3: N/A): cargo:cargo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39837 *
CVE-2026-39839 (CVSS3: N/A): cargo:cargo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39839 *
CVE-2026-39840 (CVSS3: N/A): cargo:cargo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39840 *
CVE-2026-39841 (CVSS3: N/A): cargo:cargo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39841 *
CVE-2026-39881 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39881 *
CVE-2026-40385 (CVSS3: N/A): libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40385 *
CVE-2026-40386 (CVSS3: N/A): libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40386 *
CVE-2026-4046 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4046 *
CVE-2026-40962 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40962 *
CVE-2026-41080 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41080 *
CVE-2026-4176 (CVSS3: N/A): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4176 *
CVE-2026-4271 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4271 *
CVE-2026-4437 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4437 *
CVE-2026-4438 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4438 *
CVE-2026-4519 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4519 *
CVE-2026-4647 (CVSS3: N/A): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4647 *
CVE-2026-4775 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4775 *
CVE-2026-5119 (CVSS3: N/A): libsoup:libsoup-2.4 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5119 *
CVE-2026-5121 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5121 *
CVE-2026-5450 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5450 *
CVE-2026-5704 (CVSS3: N/A): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5704 *
CVE-2026-5928 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5928 *

Summary of CVE counts by recipe:
  linux-yocto: 609
  go-binary-native: 19
  coreutils:coreutils-native: 13
  go:go-binary-native:go-cross-core2-64:go-runtime: 13
  vim: 13
  libsoup:libsoup-2.4: 12
  binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native: 10
  gstreamer1.0: 10
  cups: 7
  openssl:openssl-native: 6
  expat:expat-native: 5
  glibc: 5
  cargo:cargo-native: 4
  ffmpeg: 4
  curl:curl-native: 3
  libexif: 3
  avahi: 2
  libinput: 2
  libpng:libpng-native: 2
  libsndfile1: 2
  python3:python3-native: 2
  fontconfig:fontconfig-native: 1
  gnupg: 1
  gnutls:gnutls-native: 1
  libarchive:libarchive-native: 1
  ncurses:ncurses-native: 1
  nfs-utils: 1
  nghttp2: 1
  openssh: 1
  p11-kit: 1
  perl:perl-native: 1
  python3-requests: 1
  python3-urllib3: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1
  tar: 1
  tiff: 1
  util-linux:util-linux-native: 1
  xz:xz-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

