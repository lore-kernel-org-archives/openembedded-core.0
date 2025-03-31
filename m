Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213D3C36013
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 06:24:59 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.45688.1743402293927568852
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 23:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E29qBeDM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39ac56756f6so3500381f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 23:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743402292; x=1744007092; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kG/yZZ5aP7pR4A4+zI3pTsp8o1M2LYBSNksKta3wplY=;
        b=E29qBeDMAjSqUvdFC1/1p9/jJnJ3mIjoawFA95fw0bb5OFkr03FfpvQjXZy1xVtvHv
         2iASFmHrf01rIekKk6k8OMYOX+nqfxT/B0lcKtRfgXnJVxNjkZMLY5MrsD8iipg9NdtU
         QJ/pTMZ0Y2uzAseXgR5myT5QcnI8Phl91RTEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743402292; x=1744007092;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kG/yZZ5aP7pR4A4+zI3pTsp8o1M2LYBSNksKta3wplY=;
        b=JL0IvgQV6SyFIWJmbJCaeqE5mcBVMr2R4W5AuaSpH5mEthbGoczlzlAcM05edWm3Pf
         z6139SqoTYos0iuAydt8A4YDsILWW5ieKai7ys+kpJz03zJXKkC7Al4D2gazjL6sqsAt
         /tph/6FOaMpyBg77jFEFvT8kgWGu3OVqyPekXHj1nglki6t+OtMmb/F8thsoQayyuqVy
         yUypfX8teRZtk6wZfoWy+1aUCKHHrzlAVQWq2XvXFjBaENPtj2G9Wb6lQNp9WaFcuCzk
         tVI2pDkSeBi5V6XL3L12VfL04GpXI+9fgtFSRYsHB6iLT7jZXcsxp7jS1fFxBfnEjgnX
         f66A==
X-Forwarded-Encrypted: i=1; AJvYcCU45I68wBaqac0KE6pYGUVpemRjGowbcpELKFm1hUvVQNCaZ4Nwn3tPEqVLucLJRLZWsl90shlg96W3vxl5Vvfmqw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwN6wxN6BeFOACgZm+4rCy3lYtgZdy0svdRTsHj1PCbc763Frxe
	MkWlgzGYF/6NfbzOj6MDtFwqsI01bmML1ttwif5CKjFtMyYebJ+WG+zfF9kK9L4=
X-Gm-Gg: ASbGncsanHJVkAeVuwOucuLXZJsuGqKjXEDu5pxVWZZbx5RWr6bAn7T0fjgn6HFRpH6
	qZp+L4qpK99TdZiwijCiH1nOcxnxkXojcH0Sjp2MGFug1kBRxomkvV367cPsps1r/6j23+ThJb1
	HcXrVRqNy7DKzfzxElugZC9NuvmtCWAMtVQPwERCF0LSsBuxTBZ0KWSWutRhFaTFY01LKWVo0rq
	97BDexAkQ1Nv6Ww7iKiISg5QGz1i3H2L8TIFS9tGn4h2zSM5uGVJg6NW8MIw5w29Wi6yPxWwDXD
	/iE7sVQeJij4gCMmKxXDi9RHs1B4GlmsQXAAezPiObG32b3QOG13pAbpJ6X47osCqSyOzuGhNEf
	PGm1/1yZjoBOa9wirmOHI2D4oa4B7EQcrdw==
X-Google-Smtp-Source: AGHT+IGyZ1Zgp8j9DnC02P54RJyvoT75rDUO3iOE24dHDd+0taUPiIXVDyOk8bBrCAyU4L3R7ex0hA==
X-Received: by 2002:a5d:6d8b:0:b0:391:3049:d58d with SMTP id ffacd0b85a97d-39c1208ebcbmr5509739f8f.0.1743402292043;
        Sun, 30 Mar 2025 23:24:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2f01:de37:feeb:500c? ([2001:8b0:aba:5f3c:2f01:de37:feeb:500c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b658b5dsm10273981f8f.3.2025.03.30.23.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 23:24:50 -0700 (PDT)
Message-ID: <6a0be636d9c44b3166ac50e42c34aedf13a1be28.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/3] rust: Upgrade 1.84.1->1.85.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Mon, 31 Mar 2025 07:24:48 +0100
In-Reply-To: <20250331055424.1978243-2-Yash.Shinde@windriver.com>
References: <20250331055424.1978243-1-Yash.Shinde@windriver.com>
	 <20250331055424.1978243-2-Yash.Shinde@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 06:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213937

On Sun, 2025-03-30 at 22:54 -0700, Yash Shinde via
lists.openembedded.org wrote:
> From: Yash Shinde <Yash.Shinde@windriver.com>
>=20
> Rust stable version updated to 1.85.0
> https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
>=20
> Some of the major updates:
>=20
> - Update LIC_FILES_CHKSUM in libstd-rs and rust recipes.
> License-Update: Unicode license text is updated to Unicode-3.0
> License.
> https://github.com/rust-lang/rust/commit/6d2a3e9786ec43a0e0af20386e704632=
8296ac86

Thanks, this one step in the right direction but there is a
corresponding change missing. The recipe says:

LICENSE =3D "(MIT | Apache-2.0) & Unicode-TOU"

Does this not need to be updated to include Unicode-3.0?

That commit mentioned that the SPDX identifier exists:

https://spdx.org/licenses/Unicode-3.0.html

so I suspect it should at least be mentioned in LICENSE. I'm not if
other unicode licenses are present or not any more.

Cheers,

Richard


