Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533F2C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:47:21 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7988.1787734030660466983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U4HjhXLH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fecbb7000so280235f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 01:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787734028; x=1788338828; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zIoTToLAsvDKmHbLLZmBbkIVPCIyxUtzRGj/fl0vIT0=;
        b=U4HjhXLH2535cAS9RUB8UociGKwmEyeIWeCdxef3CQa4tUTKEmquQmF2QsZBMrziLd
         IBCR0FgUfs0DqPPbfXNQNINXFvPN1TGA5zEW7Fnqv5RhkdfzkcxMYm18CLB+VjuuYCBT
         qzlCQKN3zB1B+eRaRgMaszD8nhV8duZQpGEQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734028; x=1788338828;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIoTToLAsvDKmHbLLZmBbkIVPCIyxUtzRGj/fl0vIT0=;
        b=a7EmcEmv6/6wCo4bU3D8mAfXPMov700IwlAPwd9sL0BqSH2WknSpp8BvbdSE4BEYK7
         xfofSz4s7dYPWxuxuFf/utESJuADybwobBEhL2Ca2In3+Rff6CD1QRXDowIKBnJPZXcY
         4+iUjD+nmrgX/g5bxjlAth2+nckC3lEZBPQpTi8j+XZoPsdyqV+k2ckDBrgukrqhV61I
         H6t++ESL3jGr/4+pQOYfKablt/qZwKSbLthdvGBxE5IQNDvecd2f4HLllWnE0qRGWG20
         D8ZGrxxXphTPtWWKjGbVPW61KToLtxlDbrliR2dZOCXmFan9qOnOEBP8E6ySa2IwWEqR
         e9FQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8eT/hVQeMWdldwm+paSb6VOvev4Gj2uZkkUmxsNhg4fBgMaPkhMoWJMTOQfi7BT6ig3r5kOj/QqLrYcRIy3nZlg==@lists.openembedded.org
X-Gm-Message-State: AFuF++n7DWzXrTDmPcreDP6pMretWsK9hFVS9AzTfNGuhpuwZCGKQGRN
	HScL98RRxhMBBSCq/94Q7CE+gWLbcrZKDgGYDwD9I9XkbKqkd9OrpCbfvL+szh8dryA=
X-Gm-Gg: AR+sD11EnYIIxb3OkWZ7j/OL3oIXwApsw7/2gzvqULhN4LajTkPD+lCWlCSjDFfNSSe
	nNgnWS08KMKJFkxByYtapw2feU7evs+Y8XloelQ9QjNTKDCmTeaPpziAb02uYdZ5PLH0iGCZijL
	rJHou2hpk+grBLhh8GwZfjjdAZ0iBO5nqXGyKUL6gfdiE7HZcJEa4dXGgOceCuWSHYwEJf2LAEZ
	Zgj6U033rOveAqvv+orFT/R0GF0MEcBB0x6ls/Taxt3qT4+OLQI8g44p1aTtooAmNSZecUDEsOe
	VBksjPKayFp3cZ7hWB0+K5NHQNKemMg/vDtGeWPYZ9ZbNYLYbJqyooWwQJAlanvzqsLuzwsqgQy
	YDxcff/hmmZg8oTCq1jmSXF2RuoJeJf4KAprj3bfXEdwdHQt+WdwvFswc4VDyjOHfxXQ88tVdHs
	RIUfI5hk5h2YzDpqnUlQWKZq9FuPIQh1lAkjeo3XOZWrqc2W9y0/b7FXPK0emGJ9EBNiitR6ZVZ
	mI6ICp3z95lNa/dJt72uHOhVWISV0rXLfiQBdr1+TvmJNt1uuFZ7w==
X-Received: by 2002:a05:600c:3b13:b0:499:a760:722f with SMTP id 5b1f17b1804b1-499dc72515fmr41183175e9.13.1787734028400;
        Wed, 26 Aug 2026 01:47:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e581:1e52:aeaa:4925? ([2001:8b0:aba:5f3c:e581:1e52:aeaa:4925])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5b3958sm8759425e9.0.2026.08.26.01.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:47:07 -0700 (PDT)
Message-ID: <0d45bdfd177049f5e36dd8563dc32688c2c1e53e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] busybox: Remove CONFIG_SHA1_SMALL and
 CONFIG_SHA*_HWACCEL from sha*sum.cfg
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2026 09:47:06 +0100
In-Reply-To: <20260825191708.3014535-2-pkj@axis.com>
References: <20260825191708.3014535-1-pkj@axis.com>
	 <20260825191708.3014535-2-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244379

On Tue, 2026-08-25 at 21:17 +0200, Peter Kjellerstedt via lists.openembedde=
d.org wrote:
> The options CONFIG_SHA1_SMALL, CONFIG_SHA1_HWACCEL and
> CONFIG_SHA256_HWACCEL affect the common implementations of SHA-1 and
> SHA-256. These are used regardless of if the sha1sum and/or sha256sum
> applets are enabled. Thus it does not make sense to configure them in
> the sha*sum.cfg files. Additionally, their values in the .cfg files
> match the values in the defconfig file.

Something in this series seems to be causing:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4483

stdio: ERROR: busybox-1.38.0-r0 do_package_qa: QA Issue: busybox: ELF binar=
y /bin/busybox.nosuid has relocations in .text [textrel]
stdio: ERROR: busybox-1.38.0-r0 do_package_qa: Fatal QA errors were found, =
failing task.

:(

Cheers,

Richard

