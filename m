Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC31FCC05E
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 18:46:17 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1985.1772822770782156162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 10:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wtbvJJKP;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso89466115e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 10:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772822769; x=1773427569; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4zJPAO9bfIGCcLEqGKjOkJPp6l7mZw1KjTIYS1EhXM=;
        b=wtbvJJKPh1sGaAb2ZNFWKb4c2hyCFprMgYEVzu3k2iIcug7vC5AWLmLfXyS2XODYQs
         6UDn4l6Z4laGxqYoVMjlmchzY1b5U4Bmba7q+WBH8HQR2T/kjE4h2fik43OmfRr66dxx
         sMrhJCo9uMjnydTOofbrbre/s7yFeEsI16wEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822769; x=1773427569;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y4zJPAO9bfIGCcLEqGKjOkJPp6l7mZw1KjTIYS1EhXM=;
        b=mhVq7vNOrFHLYMiWyQlm4it59zzflCS2a8os9dN4+/jduaOosc2AfAiYO40BkWKWvx
         ZWqq+SUD7+w8537Y96XCX5YchwwXPqJB8miccxDx3DYMEynAozpOf4eyrEiOkx8fN8cC
         XKcwRtSUNUzR29Qxd7V8eUm7vrYZ/efQfwaujqzrIy4mZpW1ap7oC+L3dvHebpTsFKcy
         MojWM2km1qT5HRuaBQcSADmwPdRhTJy4ZLs4z8YaytAgkl1GlkrytE/wZUMCMQ3cheJs
         BT0dRrJuFNp9uY0eemLyX2SZGAK9NL472Ti9Vk3FHAiBjRUguVrDR5BhXvn0+d2t5v4g
         EBKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZbFTWI5fW7ojFKNtMLCw7yhHDrG4PQMirnq48p/PSR4OAyKCjA9dFSGr5h1dqQi8yGCGFW9RLsl/rkfMIBg6Eow==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxGK7bfXj4q9r8/WGQw36y1ZXwuxcNk4Ld4A3PEFl9m76uvMjrB
	iJzMAmY8hNIk0Fz4pWe3JpGw4bDFi8Wr19ApbhCOPoxkVPnYqlWj+UH8Mu+3GtKSJdc=
X-Gm-Gg: ATEYQzz7GKtdG6TcGknZgWu/CYEu4NYTGvorsSP0LqIizCEoQrAq/7IV+N9LOduinz+
	b7spRpDJI3Qj8qN1DsUk665RuSRUOrSzYokA/eOPWuUhRKVT1k7VGdDha2aOvlN4dNtiQ6STX04
	KroGPCZQM8WfElg4bzl606GU4pRlqz1JNRtWjmT2y3E75fIjIl7TNyqkZGMVXFBbWMSd//71t7O
	SbAHNGQCfDaFQmMep88475/qVNydWnWQI9Oo32Q88rvCXi+Td3+1CuV9wM5bZjU6Q2gR8KZkUCR
	xSVxiVBOfz125Rx9/v78ANqD7OczJmYHjo+xd0gAl05gFhn48ojtnv5/k6V4XFtUWoU8NmdaIVR
	pky6T1dtukPatLtjIcMRIkhAYbAahYrAz7V0XuWPnJbHnEVrNufhxGcyk3E5UkX5FvZaHRBA1bQ
	Yr5jndilxbkycbnFfM1WYtPrY=
X-Received: by 2002:a05:600c:34c3:b0:483:7631:befa with SMTP id 5b1f17b1804b1-48526917258mr56240785e9.5.1772822769041;
        Fri, 06 Mar 2026 10:46:09 -0800 (PST)
Received: from localhost ([212.133.41.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852470c258sm20655255e9.30.2026.03.06.10.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 10:46:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 19:46:06 +0100
Message-Id: <DGVX7ZSLVK51.7DOWVSF56DX7@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <pratik.farkase@ericsson.com>
To: <pratik.farkase@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][whinlatter][PATCH v1] libarchive: backport libarchive
 ptest to whinlatter
X-Mailer: aerc 0.20.0
References: <20260224150348.57934-1-pratik.farkase@est.tech>
In-Reply-To: <20260224150348.57934-1-pratik.farkase@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 18:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232585

On Tue Feb 24, 2026 at 4:03 PM CET, Pratik Farkase via lists.openembedded.o=
rg wrote:
> Backport ptest implementation from master branch to enable comprehensive
> testing of libarchive functionality in the whinlatter release.
>
> The implementation builds and installs five test suites:
> libarchive_test, bsdtar_test, bsdcpio_test, bsdcat_test, and
> bsdunzip_test, along with their test data files.
>
> Test executables for bsdtar, bsdcpio, bsdcat, and bsdunzip are
> provided via symlinks to the installed binaries.
>
> All tests on qemux86-64 pass:
>   libarchive_test: 689 tests
>   bsdtar_test: 76 tests
>   bsdcpio_test: 49 tests
>   bsdcat_test: 18 tests
>   bsdunzip_test: 8 tests
>
> This backport ensures the whinlatter branch has the same comprehensive
> test coverage as master, improving quality assurance and catching
> regressions early.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

Hello,

I'm sorry but we decided that standalone tests like this one are not
acceptable for stable inclusion.

For more detail, see "Clarification on ptest/selftest backports for stable =
branches"
https://lore.kernel.org/openembedded-core/DGVX4XQ6VLWT.1HOMXA78ZXLBG@smile.=
fr/T/#u

Regards,
--=20
Yoann Congal
Smile ECS


