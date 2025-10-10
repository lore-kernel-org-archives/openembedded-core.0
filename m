Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5CACCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 15:42:37 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.12146.1760110951927350820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 08:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PIUvxSNV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so1426901f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 08:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760110950; x=1760715750; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bC7LOhlKSoqh8VFZFijDBXoKiVKVGtQAwT9n2OuJLKI=;
        b=PIUvxSNVphFd8fgKKME54ghIjpdAWPMnDfasBmpoF+biPALvcqR5Rnq2gfCSjSJKZI
         37xMC30lp1AiFqSVZ0MAhM9AyqpacSCmis010R4lfrP9hHoWHCaMitIwTQRryTsbmDtK
         D+P6J+TxbwCHt4OWmDH3fi4mjCdpu3OVq1aBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760110950; x=1760715750;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bC7LOhlKSoqh8VFZFijDBXoKiVKVGtQAwT9n2OuJLKI=;
        b=AN3IPpUH+nkKR4BBTpE0jE6d4ww9eVfpHOp5+9NUHNqs/hL9UVjoIZ1EsKfkl3Ot8t
         59div69heUtR5eFrvKsL9bUFGe82HtJKk0WfO3Arz1lfS64pplx2DUz9eDFGXg7LLHrI
         jaJD3LHZQH2NGOyp3HAMwpKNCrlDFt83gHdcvCe0ngfi34u9ipybS3gDQsrd4WD5jzF1
         pCLfYvEXx4XA9KBBfmmFqDdc8lCfsN6BnKFNe5ifP2XIvNDyvO/yvF3hnXFsacm0OslK
         rCm/UTLAKOPg46uNwvWy6wztVmHCRGLEQxCmMV9f/jLJcHLDtAZ2VyxiiU8yr/Tb0/U9
         D1aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyCfmyawHTA1i+U8SyjOSJckm5OWzsUwSGpRDzFA+hj1tg2Z3Zh59oz9OCQPpPfA63ioW1Prj4OJnntIK2Pjzrsg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxExhib6Y/wrf0z4xTIS58p21cB54OmVK399EAIGII1WCXIE0KM
	hdJ7Oj2qvQEX48rRKA23IyFV0OQy6xAEBMROgGM6Y49BKL5/RbhokZtmCzaySMhEdTqS6k7CvP7
	XEQVi
X-Gm-Gg: ASbGnctYdnEoFeZ7xnksyviHrK5x76S4YuiPqFQzMiHfn2elTra+A6zC9A/Vj69BreO
	YBqddY8CihNS9vWnun4GzUC1l6W+RClh1zvpiJaREBEwEplAeVM3YvSoxgEIO9IIDGK+WaMcex1
	7DlPDo3WYXVPxebLA8c2vvZUZOFkD+T58PqSfKyK6Y4B/0xn3FgRERzaWsKdq+GiWJIijAB4vbt
	GQQT8bNfbP84SwvMMj8CFdxPG5JbO2CFpv6NniwFghQGOGVkId7P0FxbIhJRYqkGWy/gf1owwom
	hjcvcjeyA0dCV3YJwRZk1aM3AhxDGVBAXpEtI6GQY3K4WvqliXjZKDEzXNBVnwKrbMitCYVQ+Zj
	gzQ1rSTMAJpxY2uzjQdSVK9jqKsUKFrPCcvd9Fo2e40hWTW5/3bSB4iXn1JJFX0A/bMbtFFcIh0
	T7XlD/dqaX3GjXVqNl2TD2I1fWr+rMPg==
X-Google-Smtp-Source: AGHT+IEsKLjFz4WJu+EsGwcZqJ70V+3Gr4yOXGzDucddoLPTNeSgsf09t1QC2s8/Xn9dfNZnQt8fdA==
X-Received: by 2002:a05:6000:2013:b0:411:3c14:3ac9 with SMTP id ffacd0b85a97d-4266e8e6e66mr7999518f8f.59.1760110950261;
        Fri, 10 Oct 2025 08:42:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3d6b:fc42:c556:a557? ([2001:8b0:aba:5f3c:3d6b:fc42:c556:a557])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57ccb1sm4801850f8f.8.2025.10.10.08.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:42:29 -0700 (PDT)
Message-ID: <c413c47186075616e27fde37b51984487e69ad71.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/5] mesa: add opencl -> clang build dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Date: Fri, 10 Oct 2025 16:42:28 +0100
In-Reply-To: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 15:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224696

On Fri, 2025-10-10 at 14:59 +0300, Dmitry Baryshkov via lists.openembedded.=
org wrote:
> With the commits 448f4a84cb22 ("llvm: add recipe for just the LLVM
> libraries") and d76dc362c8e1 ("clang: use llvm recipe") the 'llvm'
> dependency inside mesa.inc does no longer pull in the clang libraries,
> failing RustiCL build as it can not find Clang libaries.
>=20
> Add direct dependency on the clang in order to fulfill build-time deps.
>=20
> Fixes: d76dc362c8e1 ("clang: use llvm recipe")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>=20
> Note, this fixes the build issue, so it would be nice to pick this up
> even if there are review comments for other patches in the series.
>=20
> BTW: would it be possible to enable OpenCL in one of autobuilder
> configurations to spot out such issues? Or would it make sense to enable
> the 'opencl' DISTRO_FEATURE for poky?

I'm not against the idea but it isn't quite that simple due to the
meta-oe dependency...

Cheers,

Richard

