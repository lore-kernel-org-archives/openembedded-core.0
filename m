Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0952C5CFC1
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 09:45:49 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5943.1786787140012400556
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 02:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tqe6GYhI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso22458465e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786787138; x=1787391938; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8sUsvBt6N6PcVJPW5dVfsXO3YHO11GeAqflNAgue6vo=;
        b=Tqe6GYhIl3HsOcvovAc8I/8rFzpa4ac2cYSzurIYZ0CH78s8qxDklxRolE7Q7XDNpK
         b1EA/mTsieqfoG1PUSXT+1Sj8yi+3SX8eg+7nRGKTWfL13nQipTFLSnjkSWlRPkfj8nT
         mpUdBM/ETUJlSdNzMRGJULeVrA+i5/3Xzd7Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786787138; x=1787391938;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sUsvBt6N6PcVJPW5dVfsXO3YHO11GeAqflNAgue6vo=;
        b=PE8bAdiVeBCRQ8gdzoATlt+sC3qTWU6jgHdNDAVR4mMXAiOMkyoHI9BtHctDhjYiks
         64yPpS80j9kLhwgMmBTwrjEdAQwJufms2+gxvnwp9NldZkPQQmh15ZpcOPRNBpJNFZQr
         /jLIfGeBRWDs7wrMqhY/Wiu28pUS9VuP0jPbqep+f1K4c+qKUKe4jA0e+vDVHf6bLDD9
         qG64vz69k75lvRkppFKsXBPZYbxZre9MQ/TekA1vgq16iLgS3jWaGriZDoMkxiHXoTOn
         AyVvMn1onSHnJWFN15oOb97eyRtWACsexsA/kKjhWq5BLAS/65in0IChmzwrQEVxxMIa
         gssQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrOy1YAvgL1LG/ZwLLSHnldpiR/7SsKIJddZ0x7DCbh83slaVxNpfqWXoJrQwG16BbHUBy3HbAUFZqZpDWHNS60Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw2KbeEtada4bh0XLSbaE0VD/yTGN5LOVAQJoEeO9JFOhSIr8HR
	qycn/3+okvdUAKWkzO+7GRDPf8KDBNW/92Q87YvuMAhdOgQojdbdPUQPNqAANtkTtA4=
X-Gm-Gg: AR+sD11Lh/p9qka3im4Q2sABfSffxlvoGKeT5CP4ZwU+515Epgq1j11NTkZ4hujjGdH
	bQjXBydsrmG0oMFsY+OR+RonnaGjgzENqFU4akpUrJgZXxROoDja/iaIc+Z2bLlapOH8QKMyrDI
	aAmoCTUowlLU/9Otw3I/9TMlxhDEcbiaJ/M6RTefwKNUPbSk7sw2YQxd4QwBTkglkOJjeTVdkPm
	zhW5sGsiMdk/cEFwkMGOyDbzQWfBWpUT2kjXQjbEL0RPmZBtEP810kCHFlZy6J10HXsHWmhBQvV
	PGRz1GLjpkQ9eBBd4aHsb159/PnWNS0ivdL2Vf9bntWV4615+o4nl80ZJD+inGK6IFcokQUuy2O
	OH4Di0n5ifeZl2WbW84cdC6CqbPy2rUBMjS/cHUmeIF7jSPBAi1SFhpkRUSORlPqXucrgf3txG2
	X90VwsDMtlT7OQL+17sdXCbltQMO9t1spngaVBYnecBALAHge8pemTxYXpiYm1jWBeVDZB7POFh
	tsJohpnjv7nytuaIFkT0AYGJiknwwaSgS9Ox+M4rElHE91dleLXAkhwALBQYw==
X-Received: by 2002:a05:600c:1546:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-49987974700mr155365095e9.14.1786787138229;
        Sat, 15 Aug 2026 02:45:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:76a9:d146:8f01:f2e? ([2001:8b0:aba:5f3c:76a9:d146:8f01:f2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5ad0sm102782275e9.4.2026.08.15.02.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 02:45:37 -0700 (PDT)
Message-ID: <e74690c49e74e845426781e4bcaf2d78da537d69.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/5] meta: fix trailing whitespace across
 classes, conf and recipes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mathieu.dubois-briand@bootlin.com, Jaipaul Cheernam
	 <jaipaul.cheernam@est.tech>, openembedded-core@lists.openembedded.org
Date: Sat, 15 Aug 2026 10:45:36 +0100
In-Reply-To: <DKPBS41I2VXL.13RDKB81EOENQ@bootlin.com>
References: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
	 <DKPBS41I2VXL.13RDKB81EOENQ@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 09:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243478

On Sat, 2026-08-15 at 09:05 +0200, Mathieu Dubois-Briand via lists.openembe=
dded.org wrote:
> On Thu Aug 13, 2026 at 9:16 PM CEST, Jaipaul Cheernam wrote:
> > Fix all trailing whitespace warnings reported by bitbake during parsing=
.
> > These were flagged on the Yocto autobuilder:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4405
> >=20
> > 53 files fixed across 5 patches, split by category:
> > - classes-global (7 files)
> > - classes-recipe (11 files)
> > - classes (2 files)
> > - conf (2 files)
> > - recipes (31 files)
>=20
> It looks like you missed some of these:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4480/s=
teps/22/logs/warnings
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/4402/st=
eps/14/logs/warnings

I merged the whitespace tweaks and went ahead and fixed the above too.

Cheers,

Richard

