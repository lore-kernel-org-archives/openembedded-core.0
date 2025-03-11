Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D76C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 22:06:44 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.23548.1741730798953226880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 15:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DN4H7+F2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913fdd003bso142503f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 15:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741730797; x=1742335597; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dykhecrjMaODRFtOp5LTMrdTt5qH717Al0XaeTPWzxE=;
        b=DN4H7+F2tkqnM8kYlyF8xkJI5VCs3WZ+TPYEGK6weLuVWdw4v7gQi1QuUbzE7YQscT
         P13iKDhSAhnUP24Atio93VFoCP+z5goFfqyPf9l709qO+9lYp1mIpfYAd7Kv+BjkahlW
         9we6waB6xG1zn30BhrBEYAHYyw+K2IWVs2vkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741730797; x=1742335597;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dykhecrjMaODRFtOp5LTMrdTt5qH717Al0XaeTPWzxE=;
        b=JpyJINSMYpLNgFsGORUGHW3Kj/b9FSt+armBBh7fzCWsSE3SoUl3VoriuZz6nH+jxP
         sARkqmj/7h/iSb3Ot2pjypAhTxJyQuVUJh/h3yjXmDizJPk7iW/3I/b5PQU9O1ouSqJx
         kxOFqWoMx3DbWL+XpCYaSyu+Eizg2QH2ckvXsRBHhkQ0097QSf/+jFvqqEMi0c7WJA3K
         5nCqU2fBzX+bS9UlSdyEIbTufo3fReweo20WqmpWtVjzHeyDiZhKLt4xUu3zI4IrhmLr
         BUr350DxbFYwieUaMzY9Wdj6iSrp7c22utak4pDGu/BLQYNhhCtZ7sP9QMTnnNQoQOOJ
         WF6w==
X-Forwarded-Encrypted: i=1; AJvYcCVd8QFkkIrw7I9/pwO5sb4hqmfxips2ljdQEC3l1wPGAQ65VYAajWMAjMwEjBgb34kxmEK1DI694EmfqFfbzTFYyQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwOrP9iwWYoeSqWvsarq/EyMsDG792EyCROmWvnt9jaFnB+LjpS
	m3Gfq30I0tSzA/NiCsaf3H2em/ZuXyOGO2jTwri6ZWHmo4NKQmIvot/BBbiAvUI=
X-Gm-Gg: ASbGncsqT1+JRmRdPmqsmDHuXoAs91MW7Whm/3NxQw84AwqdVU8tqc+3YLRw73DoSQF
	Kv+qQ3fsDsORxFbOsxM7n7qkCwrGdEm/ZG4IKRSF7SIqe8UmE/ZRSHNbxRrpb7JkXM4amhbTcqJ
	o+/EL54zWT9NFmAxRK5L/2KA5goVTEtAS423Kia0RMkDt1KucZAFzamSYpc5AtAgw3iwXQfNpxJ
	vbnuIkuzmlCuiXLWeiRxQMzYWBi9Hivkzkp1HDu2aweCsJdA1fk/z0r6Cqu++xM6/tZ2zWy9vw5
	PM6fu3A8r3BEEJGy9PAwBxJDr23jN0wU+1jocAK+mUKuRH627PgAWkqxsNoj/MWGDocmT+ziJGX
	o45TPnWaRMQ56QMLOTf8975FQILb/1OSkIA==
X-Google-Smtp-Source: AGHT+IGG6RlvXe1Vu4LUz1kb7QcttuxdwLOddmym4iAsGalWwOWvHh4gzzQyXyDZ4f2XR3KQZzgzwg==
X-Received: by 2002:a5d:6c65:0:b0:391:98b:e5b3 with SMTP id ffacd0b85a97d-3926cb6442fmr5676369f8f.14.1741730797375;
        Tue, 11 Mar 2025 15:06:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e4fd:52e8:cce8:770c? ([2001:8b0:aba:5f3c:e4fd:52e8:cce8:770c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e4065sm19507965f8f.62.2025.03.11.15.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 15:06:35 -0700 (PDT)
Message-ID: <80b8b5920dfaa00bee739b5df19c5314e10edc3f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] tcmode-default: eliminate needless
 binutils defaults
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: randy.macleod@windriver.com, openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, mathieu.dubois-briand@bootlin.com
Date: Tue, 11 Mar 2025 22:06:34 +0000
In-Reply-To: <20250311162532.1676284-2-Randy.MacLeod@windriver.com>
References: <20250311162532.1676284-1-Randy.MacLeod@windriver.com>
	 <20250311162532.1676284-2-Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 22:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212635

On Tue, 2025-03-11 at 12:25 -0400, Randy MacLeod via lists.openembedded.org=
 wrote:
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>=20
> Manually setting preferred version/provider is not required so remove
> that for binutils.
>=20
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
> =C2=A0meta/conf/distro/include/tcmode-default.inc | 10 ----------
> =C2=A01 file changed, 10 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 5cc93405f1..2a3c16e2bd 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -2,16 +2,11 @@
> =C2=A0# Default toolchain configuration
> =C2=A0#
> =C2=A0
> -PREFERRED_PROVIDER_virtual/cross-binutils =3D "${MLPREFIX}binutils-cross=
-${TARGET_ARCH}"
> -PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk ?=3D "binutils=
-crosssdk-${SDK_SYS}"
> -PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?=3D "binutils-cross=
sdk-${SDK_SYS}"
> -
> =C2=A0#

I suspect we need to keep this bit since these are not direct mappings.
It was the version preference which I think we may be able to drop as
there is only one version.

Cheers,

Richard


