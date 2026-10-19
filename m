Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F22CCF2E7
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 05:07:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27995.1792386470399830739
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 22:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TzUvGayY;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso18576665e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 22:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792386469; x=1792991269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iW1mTFEMmp7QUi8KESArPBscfvdeGAaACHFhbSd4eBg=;
        b=TzUvGayYJ2anezgloyK+7s/IzGBncTOU6e2DjekRaCEmB2f/nz1R0BN/9WboFq3QQs
         pQRO5MvVGyyRMDnKWWaWjeA8ZmW99jbuyCyylLxZy2E32T/5ozB9nZ5+s8FQiSu+LA7F
         tSoy3qg64p0oOxErxM+X/0DPzmJnuMzb5xFaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386469; x=1792991269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iW1mTFEMmp7QUi8KESArPBscfvdeGAaACHFhbSd4eBg=;
        b=mf9Qgj/03fi50KjmQRw62C2yn3VAGB+FOw5zeRn4GeIii7YiijSJ8wXnPN3zN0XzDr
         IpH07a6WJtOHle6R2mbAVzaebu6xOCZCU1BRGiQtTwGpFyl+xqFalbXhZPFWk9YU/TUG
         zfScT4rPTYG8w0fqDo3lkG9lI8uPqSimUOlWuak/JuSKZO+Yjp2gPmA3TzyYsNGqLU5v
         JnGXFs5NuDQvhZiuHbKeZsz8hKbBGzaLhDXXIbJ2cQLSE4zSgPTu3oPc2nUh5n9LcupZ
         E32JorvDDGk1zrAC1xxZDQdSuaMZS1TGKEdMVsLUT0EzQlvjv3bBsM/a18IMLnSQGV5a
         oOfQ==
X-Gm-Message-State: AFq9FYIYTrWiW/v+2tFcO5Xs5U/4F0qAdwJjOiNDVs0hID2Vvgm187iu
	vp47JNcc8F2do3ck1mzY/p96a3czQ+HHWcZ4SH7Bh+MInFwtC5DD3jbO5dO/DTlabttjcVlhe+u
	WEziZIkk=
X-Gm-Gg: AYBFou3QpnFt46CinCgjpUNiLLXfFdP4NjBNpmNPt85qQGl9UIW9PGFSCSLwLHosU6n
	pNxTiXlM5omLA7+ILM3PKL2wfTE3RRrn0a/vbFWNa2ycfhNRrq53HBMEHRfACTae99yaS53/aZT
	gixMTdDZIn3P6kuRIbe1bh7raGNBA/BBdHmQZ1u9mUqYfDIPmBWj2Fdy8sPbFuqKpr1t7m4HiU8
	sX3YXtc5M1eceRgOyWeWN5BQJYudbku1cYTJHoSAziCNBYfd1Shbvt4/6E9Z+jEEV1/I4qMIX/k
	wdvISszT3BRlpAjYn5k534b01EQ6FM1itpSbDjPuDkFXliatwbP7hyiqQSTGB2iQs2SoQzvo26j
	FLV+yhEllU5mUiAxxoZhlug6NpWFHpUuZPJc1dpdZqC1CI2qMUEfG/8kv6YAigkhy80MF8INtBM
	4eSyIkFGFK410yJpmDDK1/lDCeyF7QloYxxzVd2XxR4HPBwtDQ3+S/Jt3pYDqk1RJnhn342mykr
	6GOB0qDgXtdBlEkjxpf9cX3OJIcQkSNrJRkz0cGqBjN3nWgjXgeb6LxTRA9N15YMIoNwvGUCIy0
	cdQAWtHYEGzs6CebLYgTZK4k5SbJViuchKzC81jnp7Sf
X-Received: by 2002:a05:600c:34d2:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4a1d760d2camr122994255e9.21.1792386467796;
        Sun, 18 Oct 2026 22:07:47 -0700 (PDT)
Received: from runner-sindu79iq-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de7230sm240158465e9.14.2026.10.18.22.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 22:07:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Mon Oct 19 03:04:31 2026
Date: Mon, 19 Oct 2026 05:07:43 +0000
Message-ID: <20261019050745.24-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019050745.24-1-yoann.congal@smile.fr>
References: <20261019050745.24-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 05:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248118

Branch: master

New this week: 435 CVEs
CVE-2024-3220 (CVSSv4: 2.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2024-3220 *
CVE-2026-53613 (CVSSv3: 7.0): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://nvd.nist.gov/vuln/detail/CVE-2026-53613 *
CVE-2026-92392 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92392 *
CVE-2026-98385 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98385 *
CVE-2026-98432 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98432 *
CVE-2026-98440 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98440 *
CVE-2026-98441 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98441 *
CVE-2026-98442 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98442 *
CVE-2026-98443 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98443 *
CVE-2026-98444 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98444 *
CVE-2026-98445 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98445 *
CVE-2026-98446 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98446 *
CVE-2026-98447 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98447 *
CVE-2026-98448 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98448 *
CVE-2026-98449 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98449 *
CVE-2026-98450 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98450 *
CVE-2026-98451 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98451 *
CVE-2026-98452 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98452 *
CVE-2026-98453 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98453 *
CVE-2026-98454 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98454 *
CVE-2026-98455 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98455 *
CVE-2026-98456 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98456 *
CVE-2026-98457 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98457 *
CVE-2026-98458 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98458 *
CVE-2026-98459 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98459 *
CVE-2026-98460 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98460 *
CVE-2026-98461 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98461 *
CVE-2026-98462 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98462 *
CVE-2026-98463 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98463 *
CVE-2026-98464 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98464 *
CVE-2026-98465 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98465 *
CVE-2026-98466 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98466 *
CVE-2026-98467 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98467 *
CVE-2026-98468 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98468 *
CVE-2026-98469 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98469 *
CVE-2026-98470 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98470 *
CVE-2026-98471 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98471 *
CVE-2026-98472 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98472 *
CVE-2026-98473 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98473 *
CVE-2026-98474 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98474 *
CVE-2026-98475 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98475 *
CVE-2026-98476 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98476 *
CVE-2026-98477 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98477 *
CVE-2026-98478 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98478 *
CVE-2026-98479 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98479 *
CVE-2026-98480 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98480 *
CVE-2026-98481 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98481 *
CVE-2026-98482 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98482 *
CVE-2026-98483 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98483 *
CVE-2026-98484 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98484 *
CVE-2026-98485 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98485 *
CVE-2026-98486 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98486 *
CVE-2026-98487 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98487 *
CVE-2026-98488 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98488 *
CVE-2026-98489 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98489 *
CVE-2026-98490 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98490 *
CVE-2026-98491 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98491 *
CVE-2026-98492 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98492 *
CVE-2026-98493 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98493 *
CVE-2026-98494 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98494 *
CVE-2026-98495 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98495 *
CVE-2026-98496 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98496 *
CVE-2026-98497 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98497 *
CVE-2026-98498 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98498 *
CVE-2026-98499 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98499 *
CVE-2026-98500 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98500 *
CVE-2026-98501 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98501 *
CVE-2026-98502 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98502 *
CVE-2026-98503 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98503 *
CVE-2026-98504 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98504 *
CVE-2026-98505 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98505 *
CVE-2026-98506 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98506 *
CVE-2026-98507 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98507 *
CVE-2026-98508 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98508 *
CVE-2026-98509 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98509 *
CVE-2026-98510 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98510 *
CVE-2026-98511 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98511 *
CVE-2026-98512 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98512 *
CVE-2026-98513 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98513 *
CVE-2026-98514 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98514 *
CVE-2026-98515 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98515 *
CVE-2026-98516 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98516 *
CVE-2026-98517 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98517 *
CVE-2026-98518 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98518 *
CVE-2026-98519 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98519 *
CVE-2026-98520 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98520 *
CVE-2026-98521 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98521 *
CVE-2026-98522 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98522 *
CVE-2026-98523 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98523 *
CVE-2026-98524 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98524 *
CVE-2026-98525 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98525 *
CVE-2026-98526 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98526 *
CVE-2026-98527 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98527 *
CVE-2026-98528 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98528 *
CVE-2026-98529 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98529 *
CVE-2026-98530 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98530 *
CVE-2026-98531 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98531 *
CVE-2026-98532 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98532 *
CVE-2026-98533 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98533 *
CVE-2026-98534 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98534 *
CVE-2026-98535 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98535 *
CVE-2026-98536 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98536 *
CVE-2026-98537 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98537 *
CVE-2026-98538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98538 *
CVE-2026-98539 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98539 *
CVE-2026-98540 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98540 *
CVE-2026-98541 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98541 *
CVE-2026-98542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98542 *
CVE-2026-98543 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98543 *
CVE-2026-98544 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98544 *
CVE-2026-98545 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98545 *
CVE-2026-98546 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98546 *
CVE-2026-98547 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98547 *
CVE-2026-98548 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98548 *
CVE-2026-98549 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98549 *
CVE-2026-98550 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98550 *
CVE-2026-98551 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98551 *
CVE-2026-98552 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98552 *
CVE-2026-98553 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98553 *
CVE-2026-98554 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98554 *
CVE-2026-98555 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98555 *
CVE-2026-98556 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98556 *
CVE-2026-98557 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98557 *
CVE-2026-98558 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98558 *
CVE-2026-98559 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98559 *
CVE-2026-98560 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98560 *
CVE-2026-98561 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98561 *
CVE-2026-98562 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98562 *
CVE-2026-98563 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98563 *
CVE-2026-98564 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98564 *
CVE-2026-98565 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98565 *
CVE-2026-98566 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98566 *
CVE-2026-98567 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98567 *
CVE-2026-98568 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98568 *
CVE-2026-98569 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98569 *
CVE-2026-98570 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98570 *
CVE-2026-98571 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98571 *
CVE-2026-98572 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98572 *
CVE-2026-98573 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98573 *
CVE-2026-98574 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98574 *
CVE-2026-98575 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98575 *
CVE-2026-98576 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98576 *
CVE-2026-98577 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98577 *
CVE-2026-98578 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98578 *
CVE-2026-98579 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98579 *
CVE-2026-98580 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98580 *
CVE-2026-98581 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98581 *
CVE-2026-98582 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98582 *
CVE-2026-98583 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98583 *
CVE-2026-98584 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98584 *
CVE-2026-98585 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98585 *
CVE-2026-98586 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98586 *
CVE-2026-98587 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98587 *
CVE-2026-98588 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98588 *
CVE-2026-98589 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98589 *
CVE-2026-98590 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98590 *
CVE-2026-98591 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98591 *
CVE-2026-98592 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98592 *
CVE-2026-98593 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98593 *
CVE-2026-98594 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98594 *
CVE-2026-98595 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98595 *
CVE-2026-98596 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98596 *
CVE-2026-98597 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98597 *
CVE-2026-98598 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98598 *
CVE-2026-98599 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98599 *
CVE-2026-98600 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98600 *
CVE-2026-98601 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98601 *
CVE-2026-98602 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98602 *
CVE-2026-98603 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98603 *
CVE-2026-98604 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98604 *
CVE-2026-98605 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98605 *
CVE-2026-98606 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98606 *
CVE-2026-98607 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98607 *
CVE-2026-98608 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98608 *
CVE-2026-98609 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98609 *
CVE-2026-98610 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98610 *
CVE-2026-98611 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98611 *
CVE-2026-98612 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98612 *
CVE-2026-98613 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98613 *
CVE-2026-98614 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98614 *
CVE-2026-98615 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98615 *
CVE-2026-98616 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98616 *
CVE-2026-98617 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98617 *
CVE-2026-98618 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98618 *
CVE-2026-98619 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98619 *
CVE-2026-98620 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98620 *
CVE-2026-98621 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98621 *
CVE-2026-98622 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98622 *
CVE-2026-98623 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98623 *
CVE-2026-98624 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98624 *
CVE-2026-98625 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98625 *
CVE-2026-98626 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98626 *
CVE-2026-98627 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98627 *
CVE-2026-98628 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98628 *
CVE-2026-98629 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98629 *
CVE-2026-98630 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98630 *
CVE-2026-98631 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98631 *
CVE-2026-98632 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98632 *
CVE-2026-98633 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98633 *
CVE-2026-98634 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98634 *
CVE-2026-98635 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98635 *
CVE-2026-98636 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98636 *
CVE-2026-98637 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98637 *
CVE-2026-98638 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98638 *
CVE-2026-98639 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98639 *
CVE-2026-98640 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98640 *
CVE-2026-98641 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98641 *
CVE-2026-98642 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98642 *
CVE-2026-98643 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98643 *
CVE-2026-98644 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98644 *
CVE-2026-98645 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98645 *
CVE-2026-98646 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98646 *
CVE-2026-98647 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98647 *
CVE-2026-98648 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98648 *
CVE-2026-98649 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98649 *
CVE-2026-98650 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98650 *
CVE-2026-98651 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98651 *
CVE-2026-98652 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98652 *
CVE-2026-98653 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98653 *
CVE-2026-98655 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98655 *
CVE-2026-98656 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98656 *
CVE-2026-98657 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98657 *
CVE-2026-98658 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98658 *
CVE-2026-98659 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98659 *
CVE-2026-98660 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98660 *
CVE-2026-98661 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98661 *
CVE-2026-98662 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98662 *
CVE-2026-98663 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98663 *
CVE-2026-98664 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98664 *
CVE-2026-98665 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98665 *
CVE-2026-98666 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98666 *
CVE-2026-98667 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98667 *
CVE-2026-98668 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98668 *
CVE-2026-98669 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98669 *
CVE-2026-98670 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98670 *
CVE-2026-98671 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98671 *
CVE-2026-98672 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98672 *
CVE-2026-98673 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98673 *
CVE-2026-98674 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98674 *
CVE-2026-98675 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98675 *
CVE-2026-98676 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98676 *
CVE-2026-98677 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98677 *
CVE-2026-98678 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98678 *
CVE-2026-98679 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98679 *
CVE-2026-98680 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98680 *
CVE-2026-98681 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98681 *
CVE-2026-98682 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98682 *
CVE-2026-98683 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98683 *
CVE-2026-98684 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98684 *
CVE-2026-98685 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98685 *
CVE-2026-98686 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98686 *
CVE-2026-98687 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98687 *
CVE-2026-98688 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98688 *
CVE-2026-98689 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98689 *
CVE-2026-98690 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98690 *
CVE-2026-98691 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98691 *
CVE-2026-98692 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98692 *
CVE-2026-98693 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98693 *
CVE-2026-98694 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98694 *
CVE-2026-98695 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98695 *
CVE-2026-98696 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98696 *
CVE-2026-98697 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98697 *
CVE-2026-98698 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98698 *
CVE-2026-98699 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98699 *
CVE-2026-98700 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98700 *
CVE-2026-98701 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98701 *
CVE-2026-98702 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98702 *
CVE-2026-98703 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98703 *
CVE-2026-98704 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98704 *
CVE-2026-98705 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98705 *
CVE-2026-98706 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98706 *
CVE-2026-98707 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98707 *
CVE-2026-98708 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98708 *
CVE-2026-98709 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98709 *
CVE-2026-98710 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98710 *
CVE-2026-98711 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98711 *
CVE-2026-98712 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98712 *
CVE-2026-98713 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98713 *
CVE-2026-98714 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98714 *
CVE-2026-98715 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98715 *
CVE-2026-98716 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98716 *
CVE-2026-98717 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98717 *
CVE-2026-98720 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98720 *
CVE-2026-98721 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98721 *
CVE-2026-98722 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98722 *
CVE-2026-98723 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98723 *
CVE-2026-98724 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98724 *
CVE-2026-98725 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98725 *
CVE-2026-98726 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98726 *
CVE-2026-98727 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98727 *
CVE-2026-98728 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98728 *
CVE-2026-98729 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98729 *
CVE-2026-98730 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98730 *
CVE-2026-98731 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98731 *
CVE-2026-98732 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98732 *
CVE-2026-98733 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98733 *
CVE-2026-98734 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98734 *
CVE-2026-98735 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98735 *
CVE-2026-98736 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98736 *
CVE-2026-98737 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98737 *
CVE-2026-98738 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98738 *
CVE-2026-98739 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98739 *
CVE-2026-98740 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98740 *
CVE-2026-98741 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98741 *
CVE-2026-98742 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98742 *
CVE-2026-98743 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98743 *
CVE-2026-98744 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98744 *
CVE-2026-98745 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98745 *
CVE-2026-98746 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98746 *
CVE-2026-98747 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98747 *
CVE-2026-98748 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98748 *
CVE-2026-98749 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98749 *
CVE-2026-98750 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98750 *
CVE-2026-98751 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98751 *
CVE-2026-98752 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98752 *
CVE-2026-98753 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98753 *
CVE-2026-98754 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98754 *
CVE-2026-98755 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98755 *
CVE-2026-98756 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98756 *
CVE-2026-98757 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98757 *
CVE-2026-98758 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98758 *
CVE-2026-98759 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98759 *
CVE-2026-98760 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98760 *
CVE-2026-98761 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98761 *
CVE-2026-98762 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98762 *
CVE-2026-98763 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98763 *
CVE-2026-98764 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98764 *
CVE-2026-98765 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98765 *
CVE-2026-98766 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98766 *
CVE-2026-98767 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98767 *
CVE-2026-98768 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98768 *
CVE-2026-98769 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98769 *
CVE-2026-98770 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98770 *
CVE-2026-98771 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98771 *
CVE-2026-98772 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98772 *
CVE-2026-98773 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98773 *
CVE-2026-98774 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98774 *
CVE-2026-98775 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98775 *
CVE-2026-98776 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98776 *
CVE-2026-98777 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98777 *
CVE-2026-98778 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98778 *
CVE-2026-98779 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98779 *
CVE-2026-98780 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98780 *
CVE-2026-98781 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98781 *
CVE-2026-98782 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98782 *
CVE-2026-98783 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98783 *
CVE-2026-98784 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98784 *
CVE-2026-98785 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98785 *
CVE-2026-98786 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98786 *
CVE-2026-98787 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98787 *
CVE-2026-98788 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98788 *
CVE-2026-98789 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98789 *
CVE-2026-98790 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98790 *
CVE-2026-98791 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98791 *
CVE-2026-98792 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98792 *
CVE-2026-98793 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98793 *
CVE-2026-98794 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98794 *
CVE-2026-98795 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98795 *
CVE-2026-98796 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98796 *
CVE-2026-98797 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98797 *
CVE-2026-98798 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98798 *
CVE-2026-98799 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98799 *
CVE-2026-98800 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98800 *
CVE-2026-98801 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98801 *
CVE-2026-98802 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98802 *
CVE-2026-98803 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98803 *
CVE-2026-98804 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98804 *
CVE-2026-98805 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98805 *
CVE-2026-98806 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98806 *
CVE-2026-98807 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98807 *
CVE-2026-98808 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98808 *
CVE-2026-98809 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98809 *
CVE-2026-98810 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98810 *
CVE-2026-98811 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98811 *
CVE-2026-98812 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98812 *
CVE-2026-98813 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98813 *
CVE-2026-98814 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98814 *
CVE-2026-98815 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98815 *
CVE-2026-98816 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98816 *
CVE-2026-98817 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98817 *
CVE-2026-98818 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98818 *
CVE-2026-98819 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98819 *
CVE-2026-98820 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98820 *
CVE-2026-98821 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98821 *
CVE-2026-98822 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98822 *
CVE-2026-98823 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98823 *
CVE-2026-98824 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98824 *
CVE-2026-98825 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98825 *
CVE-2026-98826 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98826 *
CVE-2026-98827 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98827 *
CVE-2026-98828 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98828 *
CVE-2026-98829 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98829 *
CVE-2026-98830 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98830 *
CVE-2026-98831 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98831 *
CVE-2026-98832 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98832 *
CVE-2026-98833 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98833 *
CVE-2026-98834 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98834 *
CVE-2026-98835 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98835 *
CVE-2026-98836 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98836 *
CVE-2026-98837 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98837 *
CVE-2026-98838 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98838 *
CVE-2026-98839 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98839 *
CVE-2026-98840 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98840 *
CVE-2026-98841 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98841 *
CVE-2026-98842 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98842 *
CVE-2026-98843 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98843 *
CVE-2026-98844 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98844 *
CVE-2026-98845 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98845 *
CVE-2026-98846 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98846 *
CVE-2026-98847 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98847 *
CVE-2026-98848 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98848 *
CVE-2026-98849 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98849 *
CVE-2026-98850 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98850 *
CVE-2026-98851 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98851 *
CVE-2026-98852 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98852 *
CVE-2026-98853 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98853 *
CVE-2026-98854 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98854 *
CVE-2026-98855 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98855 *
CVE-2026-98856 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98856 *
CVE-2026-98857 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98857 *
CVE-2026-98858 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98858 *
CVE-2026-98859 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98859 *
CVE-2026-98860 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98860 *
CVE-2026-98861 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98861 *
CVE-2026-98862 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98862 *
CVE-2026-98863 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98863 *
CVE-2026-98864 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98864 *
CVE-2026-98865 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98865 *
CVE-2026-98866 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98866 *
CVE-2026-98867 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98867 *
CVE-2026-98868 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98868 *
CVE-2026-99999 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99999 *
CVE-2026-103658 (CVSSv3: 5.9): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-103658 *
CVE-2026-109828 (CVSSv2: 5.0, CVSSv3: 4.3, CVSSv4: 5.3): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2026-109828 *
CVE-2026-111269 (CVSSv3: 6.1, CVSSv4: 6.9): libical:libical-native https://nvd.nist.gov/vuln/detail/CVE-2026-111269 *

Removed this week: 19 CVEs
CVE-2026-8674 (CVSSv3: 5.3): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-8674 *
CVE-2026-18374 (CVSSv3: 4.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-18374 *
CVE-2026-19499 (CVSSv3: 7.7): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-19499 *
CVE-2026-56857 (CVSSv3: 9.8): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-56857 *
CVE-2026-56866 (CVSSv3: 7.5): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-56866 *
CVE-2026-77117 (CVSSv3: 5.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-77117 *
CVE-2026-78667 (CVSSv3: 7.5): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-78667 *
CVE-2026-80489 (CVSSv3: 5.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-80489 *
CVE-2026-86805 (CVSSv3: 6.3): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-86805 *
CVE-2026-89092 (CVSSv3: 4.2): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-89092 *
CVE-2026-94439 (CVSSv3: 7.5): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-94439 *
CVE-2026-94440 (CVSSv3: 7.5): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-94440 *
CVE-2026-94444 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-94444 *
CVE-2026-94447 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-94447 *
CVE-2026-94448 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-94448 *
CVE-2026-95818 (CVSSv3: 3.6): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-95818 *
CVE-2026-97030 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97030 *
CVE-2026-97031 (CVSSv3: 7.5): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97031 *
CVE-2026-97399 (CVSSv3: 3.7): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-97399 *

Full list: Found 540 unpatched CVEs
CVE-2019-14899 (CVSSv2: 4.9, CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-14899 *
CVE-2020-10774 (CVSSv2: 2.1, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-10774 *
CVE-2020-27748 (CVSSv2: 4.3, CVSSv3: 6.5): xdg-utils https://nvd.nist.gov/vuln/detail/CVE-2020-27748 *
CVE-2021-3714 (CVSSv3: 5.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3714 *
CVE-2021-3864 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3864 *
CVE-2022-4543 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4543 *
CVE-2023-3397 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3397 *
CVE-2023-3640 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3640 *
CVE-2023-6238 (CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6238 *
CVE-2023-6240 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6240 *
CVE-2024-2236 (CVSSv3: 5.9): libgcrypt:libgcrypt-native https://nvd.nist.gov/vuln/detail/CVE-2024-2236 *
CVE-2024-3220 (CVSSv4: 2.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2024-3220 *
CVE-2024-47850 (CVSSv3: 7.5): cups https://nvd.nist.gov/vuln/detail/CVE-2024-47850 *
CVE-2024-50613 (CVSSv3: 6.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2024-50613 *
CVE-2025-15367 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15367 *
CVE-2025-52194 (CVSSv3: 7.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2025-52194 *
CVE-2026-3099 (CVSSv3: 7.3): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3099 *
CVE-2026-3632 (CVSSv3: 5.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3632 *
CVE-2026-3633 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3633 *
CVE-2026-3634 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3634 *
CVE-2026-5673 (CVSSv3: 7.1): libtheora https://nvd.nist.gov/vuln/detail/CVE-2026-5673 *
CVE-2026-6844 (CVSSv3: 5.5): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6844 *
CVE-2026-6845 (CVSSv3: 5.0): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6845 *
CVE-2026-12548 (CVSSv3: 4.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12548 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-15310 (CVSSv4: 2.1): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15310 *
CVE-2026-15534 (CVSSv3: 5.7): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-15534 *
CVE-2026-15806 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15806 *
CVE-2026-17025 (CVSSv3: 6.4): graphene https://nvd.nist.gov/vuln/detail/CVE-2026-17025 *
CVE-2026-17084 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-17084 *
CVE-2026-18477 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18477 *
CVE-2026-18487 (CVSSv3: 5.4): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-18487 *
CVE-2026-18508 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18508 *
CVE-2026-18839 (CVSSv3: 2.2): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18839 *
CVE-2026-19445 (CVSSv4: 9.2): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19445 *
CVE-2026-19547 (CVSSv4: 7.0): ghostscript https://nvd.nist.gov/vuln/detail/CVE-2026-19547 *
CVE-2026-19553 (CVSSv4: 7.6): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19553 *
CVE-2026-19672 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19672 *
CVE-2026-28529 (CVSSv3: 7.8, CVSSv4: 8.5): cryptodev-linux https://nvd.nist.gov/vuln/detail/CVE-2026-28529 *
CVE-2026-38752 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38752 *
CVE-2026-38753 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38753 *
CVE-2026-38755 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38755 *
CVE-2026-39919 (CVSSv3: 9.8, CVSSv4: 9.3): ghostscript https://nvd.nist.gov/vuln/detail/CVE-2026-39919 *
CVE-2026-53613 (CVSSv3: 7.0): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://nvd.nist.gov/vuln/detail/CVE-2026-53613 *
CVE-2026-56390 (CVSSv3: 6.3, CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-66337 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66337 *
CVE-2026-66338 (CVSSv3: 7.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66338 *
CVE-2026-66339 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66339 *
CVE-2026-68086 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68086 *
CVE-2026-75818 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75818 *
CVE-2026-75819 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75819 *
CVE-2026-75820 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75820 *
CVE-2026-76844 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-76844 *
CVE-2026-78376 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-78376 *
CVE-2026-82474 (CVSSv3: 7.8, CVSSv4: 8.5): sudo https://nvd.nist.gov/vuln/detail/CVE-2026-82474 *
CVE-2026-82560 (CVSSv3: 7.5): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-82560 *
CVE-2026-83596 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-83596 *
CVE-2026-85091 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-85091 *
CVE-2026-88806 (CVSSv3: 7.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-88806 *
CVE-2026-88807 (CVSSv4: 8.9): libxrender:libxrender-native https://nvd.nist.gov/vuln/detail/CVE-2026-88807 *
CVE-2026-90801 (CVSSv2: 4.3, CVSSv3: 6.6, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90801 *
CVE-2026-90802 (CVSSv2: 3.2, CVSSv3: 4.4, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90802 *
CVE-2026-90803 (CVSSv2: 4.3, CVSSv3: 6.8, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90803 *
CVE-2026-90804 (CVSSv2: 4.3, CVSSv3: 6.1, CVSSv4: 2.4): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90804 *
CVE-2026-90828 (CVSSv2: 4.3, CVSSv3: 6.6, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90828 *
CVE-2026-90829 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90829 *
CVE-2026-90830 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90830 *
CVE-2026-90831 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90831 *
CVE-2026-91779 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91779 *
CVE-2026-91780 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91780 *
CVE-2026-91781 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91781 *
CVE-2026-91782 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91782 *
CVE-2026-92392 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92392 *
CVE-2026-93284 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93284 *
CVE-2026-93541 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93541 *
CVE-2026-93542 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93542 *
CVE-2026-93543 (CVSSv3: 7.4): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93543 *
CVE-2026-93544 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93544 *
CVE-2026-93545 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93545 *
CVE-2026-94281 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-94281 *
CVE-2026-94282 (CVSSv3: 5.6): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-94282 *
CVE-2026-94283 (CVSSv3: 6.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94283 *
CVE-2026-94284 (CVSSv3: 5.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94284 *
CVE-2026-94285 (CVSSv3: 5.1): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94285 *
CVE-2026-94286 (CVSSv3: 7.1): libxtst:libxtst-native https://nvd.nist.gov/vuln/detail/CVE-2026-94286 *
CVE-2026-96674 (CVSSv3: 4.4, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-96674 *
CVE-2026-96675 (CVSSv3: 3.3, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-96675 *
CVE-2026-97876 (CVSSv3: 6.4): grub:grub-efi:grub-native https://nvd.nist.gov/vuln/detail/CVE-2026-97876 *
CVE-2026-98373 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98373 *
CVE-2026-98374 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98374 *
CVE-2026-98375 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98375 *
CVE-2026-98377 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98377 *
CVE-2026-98378 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98378 *
CVE-2026-98379 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98379 *
CVE-2026-98380 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98380 *
CVE-2026-98381 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98381 *
CVE-2026-98382 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98382 *
CVE-2026-98383 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98383 *
CVE-2026-98384 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98384 *
CVE-2026-98385 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98385 *
CVE-2026-98432 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98432 *
CVE-2026-98440 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98440 *
CVE-2026-98441 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98441 *
CVE-2026-98442 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98442 *
CVE-2026-98443 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98443 *
CVE-2026-98444 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98444 *
CVE-2026-98445 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98445 *
CVE-2026-98446 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98446 *
CVE-2026-98447 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98447 *
CVE-2026-98448 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98448 *
CVE-2026-98449 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98449 *
CVE-2026-98450 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98450 *
CVE-2026-98451 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98451 *
CVE-2026-98452 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98452 *
CVE-2026-98453 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98453 *
CVE-2026-98454 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98454 *
CVE-2026-98455 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98455 *
CVE-2026-98456 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98456 *
CVE-2026-98457 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98457 *
CVE-2026-98458 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98458 *
CVE-2026-98459 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98459 *
CVE-2026-98460 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98460 *
CVE-2026-98461 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98461 *
CVE-2026-98462 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98462 *
CVE-2026-98463 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98463 *
CVE-2026-98464 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98464 *
CVE-2026-98465 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98465 *
CVE-2026-98466 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98466 *
CVE-2026-98467 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98467 *
CVE-2026-98468 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98468 *
CVE-2026-98469 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98469 *
CVE-2026-98470 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98470 *
CVE-2026-98471 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98471 *
CVE-2026-98472 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98472 *
CVE-2026-98473 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98473 *
CVE-2026-98474 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98474 *
CVE-2026-98475 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98475 *
CVE-2026-98476 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98476 *
CVE-2026-98477 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98477 *
CVE-2026-98478 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98478 *
CVE-2026-98479 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98479 *
CVE-2026-98480 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98480 *
CVE-2026-98481 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98481 *
CVE-2026-98482 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98482 *
CVE-2026-98483 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98483 *
CVE-2026-98484 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98484 *
CVE-2026-98485 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98485 *
CVE-2026-98486 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98486 *
CVE-2026-98487 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98487 *
CVE-2026-98488 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98488 *
CVE-2026-98489 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98489 *
CVE-2026-98490 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98490 *
CVE-2026-98491 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98491 *
CVE-2026-98492 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98492 *
CVE-2026-98493 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98493 *
CVE-2026-98494 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98494 *
CVE-2026-98495 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98495 *
CVE-2026-98496 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98496 *
CVE-2026-98497 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98497 *
CVE-2026-98498 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98498 *
CVE-2026-98499 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98499 *
CVE-2026-98500 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98500 *
CVE-2026-98501 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98501 *
CVE-2026-98502 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98502 *
CVE-2026-98503 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98503 *
CVE-2026-98504 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98504 *
CVE-2026-98505 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98505 *
CVE-2026-98506 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98506 *
CVE-2026-98507 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98507 *
CVE-2026-98508 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98508 *
CVE-2026-98509 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98509 *
CVE-2026-98510 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98510 *
CVE-2026-98511 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98511 *
CVE-2026-98512 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98512 *
CVE-2026-98513 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98513 *
CVE-2026-98514 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98514 *
CVE-2026-98515 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98515 *
CVE-2026-98516 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98516 *
CVE-2026-98517 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98517 *
CVE-2026-98518 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98518 *
CVE-2026-98519 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98519 *
CVE-2026-98520 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98520 *
CVE-2026-98521 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98521 *
CVE-2026-98522 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98522 *
CVE-2026-98523 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98523 *
CVE-2026-98524 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98524 *
CVE-2026-98525 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98525 *
CVE-2026-98526 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98526 *
CVE-2026-98527 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98527 *
CVE-2026-98528 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98528 *
CVE-2026-98529 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98529 *
CVE-2026-98530 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98530 *
CVE-2026-98531 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98531 *
CVE-2026-98532 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98532 *
CVE-2026-98533 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98533 *
CVE-2026-98534 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98534 *
CVE-2026-98535 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98535 *
CVE-2026-98536 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98536 *
CVE-2026-98537 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98537 *
CVE-2026-98538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98538 *
CVE-2026-98539 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98539 *
CVE-2026-98540 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98540 *
CVE-2026-98541 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98541 *
CVE-2026-98542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98542 *
CVE-2026-98543 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98543 *
CVE-2026-98544 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98544 *
CVE-2026-98545 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98545 *
CVE-2026-98546 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98546 *
CVE-2026-98547 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98547 *
CVE-2026-98548 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98548 *
CVE-2026-98549 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98549 *
CVE-2026-98550 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98550 *
CVE-2026-98551 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98551 *
CVE-2026-98552 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98552 *
CVE-2026-98553 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98553 *
CVE-2026-98554 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98554 *
CVE-2026-98555 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98555 *
CVE-2026-98556 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98556 *
CVE-2026-98557 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98557 *
CVE-2026-98558 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98558 *
CVE-2026-98559 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98559 *
CVE-2026-98560 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98560 *
CVE-2026-98561 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98561 *
CVE-2026-98562 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98562 *
CVE-2026-98563 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98563 *
CVE-2026-98564 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98564 *
CVE-2026-98565 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98565 *
CVE-2026-98566 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98566 *
CVE-2026-98567 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98567 *
CVE-2026-98568 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98568 *
CVE-2026-98569 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98569 *
CVE-2026-98570 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98570 *
CVE-2026-98571 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98571 *
CVE-2026-98572 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98572 *
CVE-2026-98573 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98573 *
CVE-2026-98574 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98574 *
CVE-2026-98575 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98575 *
CVE-2026-98576 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98576 *
CVE-2026-98577 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98577 *
CVE-2026-98578 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98578 *
CVE-2026-98579 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98579 *
CVE-2026-98580 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98580 *
CVE-2026-98581 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98581 *
CVE-2026-98582 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98582 *
CVE-2026-98583 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98583 *
CVE-2026-98584 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98584 *
CVE-2026-98585 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98585 *
CVE-2026-98586 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98586 *
CVE-2026-98587 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98587 *
CVE-2026-98588 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98588 *
CVE-2026-98589 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98589 *
CVE-2026-98590 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98590 *
CVE-2026-98591 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98591 *
CVE-2026-98592 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98592 *
CVE-2026-98593 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98593 *
CVE-2026-98594 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98594 *
CVE-2026-98595 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98595 *
CVE-2026-98596 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98596 *
CVE-2026-98597 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98597 *
CVE-2026-98598 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98598 *
CVE-2026-98599 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98599 *
CVE-2026-98600 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98600 *
CVE-2026-98601 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98601 *
CVE-2026-98602 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98602 *
CVE-2026-98603 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98603 *
CVE-2026-98604 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98604 *
CVE-2026-98605 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98605 *
CVE-2026-98606 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98606 *
CVE-2026-98607 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98607 *
CVE-2026-98608 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98608 *
CVE-2026-98609 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98609 *
CVE-2026-98610 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98610 *
CVE-2026-98611 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98611 *
CVE-2026-98612 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98612 *
CVE-2026-98613 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98613 *
CVE-2026-98614 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98614 *
CVE-2026-98615 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98615 *
CVE-2026-98616 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98616 *
CVE-2026-98617 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98617 *
CVE-2026-98618 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98618 *
CVE-2026-98619 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98619 *
CVE-2026-98620 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98620 *
CVE-2026-98621 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98621 *
CVE-2026-98622 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98622 *
CVE-2026-98623 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98623 *
CVE-2026-98624 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98624 *
CVE-2026-98625 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98625 *
CVE-2026-98626 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98626 *
CVE-2026-98627 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98627 *
CVE-2026-98628 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98628 *
CVE-2026-98629 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98629 *
CVE-2026-98630 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98630 *
CVE-2026-98631 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98631 *
CVE-2026-98632 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98632 *
CVE-2026-98633 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98633 *
CVE-2026-98634 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98634 *
CVE-2026-98635 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98635 *
CVE-2026-98636 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98636 *
CVE-2026-98637 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98637 *
CVE-2026-98638 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98638 *
CVE-2026-98639 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98639 *
CVE-2026-98640 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98640 *
CVE-2026-98641 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98641 *
CVE-2026-98642 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98642 *
CVE-2026-98643 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98643 *
CVE-2026-98644 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98644 *
CVE-2026-98645 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98645 *
CVE-2026-98646 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98646 *
CVE-2026-98647 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98647 *
CVE-2026-98648 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98648 *
CVE-2026-98649 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98649 *
CVE-2026-98650 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98650 *
CVE-2026-98651 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98651 *
CVE-2026-98652 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98652 *
CVE-2026-98653 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98653 *
CVE-2026-98655 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98655 *
CVE-2026-98656 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98656 *
CVE-2026-98657 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98657 *
CVE-2026-98658 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98658 *
CVE-2026-98659 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98659 *
CVE-2026-98660 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98660 *
CVE-2026-98661 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98661 *
CVE-2026-98662 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98662 *
CVE-2026-98663 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98663 *
CVE-2026-98664 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98664 *
CVE-2026-98665 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98665 *
CVE-2026-98666 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98666 *
CVE-2026-98667 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98667 *
CVE-2026-98668 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98668 *
CVE-2026-98669 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98669 *
CVE-2026-98670 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98670 *
CVE-2026-98671 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98671 *
CVE-2026-98672 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98672 *
CVE-2026-98673 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98673 *
CVE-2026-98674 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98674 *
CVE-2026-98675 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98675 *
CVE-2026-98676 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98676 *
CVE-2026-98677 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98677 *
CVE-2026-98678 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98678 *
CVE-2026-98679 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98679 *
CVE-2026-98680 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98680 *
CVE-2026-98681 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98681 *
CVE-2026-98682 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98682 *
CVE-2026-98683 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98683 *
CVE-2026-98684 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98684 *
CVE-2026-98685 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98685 *
CVE-2026-98686 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98686 *
CVE-2026-98687 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98687 *
CVE-2026-98688 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98688 *
CVE-2026-98689 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98689 *
CVE-2026-98690 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98690 *
CVE-2026-98691 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98691 *
CVE-2026-98692 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98692 *
CVE-2026-98693 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98693 *
CVE-2026-98694 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98694 *
CVE-2026-98695 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98695 *
CVE-2026-98696 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98696 *
CVE-2026-98697 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98697 *
CVE-2026-98698 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98698 *
CVE-2026-98699 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98699 *
CVE-2026-98700 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98700 *
CVE-2026-98701 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98701 *
CVE-2026-98702 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98702 *
CVE-2026-98703 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98703 *
CVE-2026-98704 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98704 *
CVE-2026-98705 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98705 *
CVE-2026-98706 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98706 *
CVE-2026-98707 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98707 *
CVE-2026-98708 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98708 *
CVE-2026-98709 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98709 *
CVE-2026-98710 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98710 *
CVE-2026-98711 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98711 *
CVE-2026-98712 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98712 *
CVE-2026-98713 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98713 *
CVE-2026-98714 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98714 *
CVE-2026-98715 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98715 *
CVE-2026-98716 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98716 *
CVE-2026-98717 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98717 *
CVE-2026-98720 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98720 *
CVE-2026-98721 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98721 *
CVE-2026-98722 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98722 *
CVE-2026-98723 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98723 *
CVE-2026-98724 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98724 *
CVE-2026-98725 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98725 *
CVE-2026-98726 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98726 *
CVE-2026-98727 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98727 *
CVE-2026-98728 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98728 *
CVE-2026-98729 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98729 *
CVE-2026-98730 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98730 *
CVE-2026-98731 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98731 *
CVE-2026-98732 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98732 *
CVE-2026-98733 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98733 *
CVE-2026-98734 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98734 *
CVE-2026-98735 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98735 *
CVE-2026-98736 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98736 *
CVE-2026-98737 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98737 *
CVE-2026-98738 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98738 *
CVE-2026-98739 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98739 *
CVE-2026-98740 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98740 *
CVE-2026-98741 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98741 *
CVE-2026-98742 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98742 *
CVE-2026-98743 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98743 *
CVE-2026-98744 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98744 *
CVE-2026-98745 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98745 *
CVE-2026-98746 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98746 *
CVE-2026-98747 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98747 *
CVE-2026-98748 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98748 *
CVE-2026-98749 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98749 *
CVE-2026-98750 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98750 *
CVE-2026-98751 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98751 *
CVE-2026-98752 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98752 *
CVE-2026-98753 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98753 *
CVE-2026-98754 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98754 *
CVE-2026-98755 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98755 *
CVE-2026-98756 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98756 *
CVE-2026-98757 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98757 *
CVE-2026-98758 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98758 *
CVE-2026-98759 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98759 *
CVE-2026-98760 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98760 *
CVE-2026-98761 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98761 *
CVE-2026-98762 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98762 *
CVE-2026-98763 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98763 *
CVE-2026-98764 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98764 *
CVE-2026-98765 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98765 *
CVE-2026-98766 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98766 *
CVE-2026-98767 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98767 *
CVE-2026-98768 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98768 *
CVE-2026-98769 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98769 *
CVE-2026-98770 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98770 *
CVE-2026-98771 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98771 *
CVE-2026-98772 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98772 *
CVE-2026-98773 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98773 *
CVE-2026-98774 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98774 *
CVE-2026-98775 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98775 *
CVE-2026-98776 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98776 *
CVE-2026-98777 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98777 *
CVE-2026-98778 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98778 *
CVE-2026-98779 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98779 *
CVE-2026-98780 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98780 *
CVE-2026-98781 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98781 *
CVE-2026-98782 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98782 *
CVE-2026-98783 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98783 *
CVE-2026-98784 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98784 *
CVE-2026-98785 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98785 *
CVE-2026-98786 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98786 *
CVE-2026-98787 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98787 *
CVE-2026-98788 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98788 *
CVE-2026-98789 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98789 *
CVE-2026-98790 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98790 *
CVE-2026-98791 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98791 *
CVE-2026-98792 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98792 *
CVE-2026-98793 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98793 *
CVE-2026-98794 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98794 *
CVE-2026-98795 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98795 *
CVE-2026-98796 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98796 *
CVE-2026-98797 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98797 *
CVE-2026-98798 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98798 *
CVE-2026-98799 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98799 *
CVE-2026-98800 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98800 *
CVE-2026-98801 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98801 *
CVE-2026-98802 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98802 *
CVE-2026-98803 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98803 *
CVE-2026-98804 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98804 *
CVE-2026-98805 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98805 *
CVE-2026-98806 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98806 *
CVE-2026-98807 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98807 *
CVE-2026-98808 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98808 *
CVE-2026-98809 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98809 *
CVE-2026-98810 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98810 *
CVE-2026-98811 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98811 *
CVE-2026-98812 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98812 *
CVE-2026-98813 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98813 *
CVE-2026-98814 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98814 *
CVE-2026-98815 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98815 *
CVE-2026-98816 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98816 *
CVE-2026-98817 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98817 *
CVE-2026-98818 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98818 *
CVE-2026-98819 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98819 *
CVE-2026-98820 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98820 *
CVE-2026-98821 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98821 *
CVE-2026-98822 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98822 *
CVE-2026-98823 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98823 *
CVE-2026-98824 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98824 *
CVE-2026-98825 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98825 *
CVE-2026-98826 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98826 *
CVE-2026-98827 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98827 *
CVE-2026-98828 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98828 *
CVE-2026-98829 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98829 *
CVE-2026-98830 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98830 *
CVE-2026-98831 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98831 *
CVE-2026-98832 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98832 *
CVE-2026-98833 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98833 *
CVE-2026-98834 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98834 *
CVE-2026-98835 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98835 *
CVE-2026-98836 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98836 *
CVE-2026-98837 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98837 *
CVE-2026-98838 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98838 *
CVE-2026-98839 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98839 *
CVE-2026-98840 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98840 *
CVE-2026-98841 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98841 *
CVE-2026-98842 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98842 *
CVE-2026-98843 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98843 *
CVE-2026-98844 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98844 *
CVE-2026-98845 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98845 *
CVE-2026-98846 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98846 *
CVE-2026-98847 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98847 *
CVE-2026-98848 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98848 *
CVE-2026-98849 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98849 *
CVE-2026-98850 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98850 *
CVE-2026-98851 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98851 *
CVE-2026-98852 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98852 *
CVE-2026-98853 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98853 *
CVE-2026-98854 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98854 *
CVE-2026-98855 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98855 *
CVE-2026-98856 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98856 *
CVE-2026-98857 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98857 *
CVE-2026-98858 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98858 *
CVE-2026-98859 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98859 *
CVE-2026-98860 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98860 *
CVE-2026-98861 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98861 *
CVE-2026-98862 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98862 *
CVE-2026-98863 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98863 *
CVE-2026-98864 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98864 *
CVE-2026-98865 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98865 *
CVE-2026-98866 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98866 *
CVE-2026-98867 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98867 *
CVE-2026-98868 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98868 *
CVE-2026-99999 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99999 *
CVE-2026-103658 (CVSSv3: 5.9): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-103658 *
CVE-2026-105840 (CVSSv3: 7.5, CVSSv4: 7.7): lrzsz https://nvd.nist.gov/vuln/detail/CVE-2026-105840 *
CVE-2026-105841 (CVSSv3: 7.5, CVSSv4: 7.7): lrzsz https://nvd.nist.gov/vuln/detail/CVE-2026-105841 *
CVE-2026-105842 (CVSSv3: 6.4, CVSSv4: 6.1): lrzsz https://nvd.nist.gov/vuln/detail/CVE-2026-105842 *
CVE-2026-107675 (CVSSv3: 5.9, CVSSv4: 6.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107675 *
CVE-2026-107676 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107676 *
CVE-2026-107677 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107677 *
CVE-2026-107678 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107678 *
CVE-2026-107696 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107696 *
CVE-2026-107885 (CVSSv3: 3.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107885 *
CVE-2026-109828 (CVSSv2: 5.0, CVSSv3: 4.3, CVSSv4: 5.3): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2026-109828 *
CVE-2026-111269 (CVSSv3: 6.1, CVSSv4: 6.9): libical:libical-native https://nvd.nist.gov/vuln/detail/CVE-2026-111269 *

Summary of CVE counts by recipe:
  linux-yocto: 451
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 14
  libsoup: 9
  python3:python3-native: 8
  libxi:libxi-native: 7
  ffmpeg: 5
  aspell: 4
  libx11:libx11-native: 4
  libsndfile1: 3
  busybox: 3
  lrzsz: 3
  cups: 2
  perl:perl-native: 2
  tar: 2
  ghostscript: 2
  zlib:zlib-native: 2
  webkitgtk: 2
  alsa-lib:alsa-lib-native: 2
  xdg-utils: 1
  libgcrypt:libgcrypt-native: 1
  libtheora: 1
  graphene: 1
  epiphany: 1
  popt:popt-native: 1
  cryptodev-linux: 1
  util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native: 1
  bison:bison-native: 1
  sudo: 1
  libxrender:libxrender-native: 1
  curl:curl-native: 1
  libxtst:libxtst-native: 1
  grub:grub-efi:grub-native: 1
  libical:libical-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

