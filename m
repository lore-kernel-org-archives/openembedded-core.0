Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E890C28B23
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 17:02:51 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.16378.1741366963220789346
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 09:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QmQqwT1i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391211ea598so1371086f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 09:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741366961; x=1741971761; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RZu8aAyvER0wyzeBUG0YM/Y8/fK9PD8XVgQPVDkA/aw=;
        b=QmQqwT1iW/nDqXsjbk4R+Uka5q9Kz4DnrZKjh17bgdd29nUbRzimqTgpK8YAlxKSnz
         L26K8pmkA+d1tOf8K1VZDe2035NoZkih+Xn+Q+8pnB0M59W3a9a2SXSIdEI5gNlajWgp
         sJmPdwbhiRCYL/iRFmQfoStgMDdlQJxaZvx18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741366961; x=1741971761;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZu8aAyvER0wyzeBUG0YM/Y8/fK9PD8XVgQPVDkA/aw=;
        b=f+uaFH/uGwV9JQ+cJJesEqCoIhTidXGD7IMIFTtVDJWpUqdmnVun1nC2JtIbCzr4ML
         0EL5BWl+xfEYq2AMNZaeycwndybHFx+VCY9OjyiCkG79ghoIvun9TsHAgAW3D3bKpLCE
         8qguIGzk8C8gOMOjfUlIf+bhULN+WCUO2/rUiH7z4omJ5j/YefC3DzdLQi1l+nsajYSf
         BwGw9xs8u3KuKb6nID+k+Ru7bWWxvspLrJjyfRMzqT6MEmsO65NuFZil6z6t1bofEl2d
         I61eyojUUsMxrA/1pwjAMKLJj/K7W8YGB2QeW5QCW2NA6c2fHjvhwEvLogQ/7V7ptEzM
         qvcw==
X-Gm-Message-State: AOJu0YwS1RivygZP8Lb4wr3uRYii+kdKkJpdPSIxC64Y62tH8IclLYhn
	0CHksnZWCZeNTJ0LCkxNmf07RmMJkDYVvc8Et1wSUdxOpp0kOU2L7ddSB+LeUAc=
X-Gm-Gg: ASbGncvLXhH38Rz++Jjb+1vjHcmwIOVhLN/loWM3xUq4Gi3/CDoa5G3felJ9t5FdAxS
	9iMAzkwxGQDwDSW9SocKEKKpKBYNRuiSWlMswiVVWbfCNRb9dMfoGq5U1Fz0qeAGCRruv1wfFIs
	NRkVq1wZf9a6qdKsRliyjUsx8DZKnroLKwmXF63hvmWdRGeh6vhb2j2SFV0F3oHXExoc31wYW7+
	GtxBTU92CQJQa7OC/pG/LZy2l5Ex3wy/iHjBsqAXaIyd1hmVEIGlpGGhIZYzj7raPoKMFfZavQm
	7FASWm0cmypUSIVBICvDgbzGQ23QnlQuGuuaEDxCX+h5wSWmxd/QUdH1THuFZGyGTzdTvei3ms4
	3DZkEjEd17DmNO6Dfm8MdbjdekdfsmW2yxg==
X-Google-Smtp-Source: AGHT+IEziNBYaMK1/4aXEE2sbLQzDZw/l9pf0TvRghb1hFqt0MMs8U97pk+rySxw4zKi0y00a1Uixw==
X-Received: by 2002:a5d:47c1:0:b0:390:fe8b:f442 with SMTP id ffacd0b85a97d-39132dc35b2mr2930486f8f.54.1741366961131;
        Fri, 07 Mar 2025 09:02:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4ef:561a:51ad:c651? ([2001:8b0:aba:5f3c:f4ef:561a:51ad:c651])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c102b62sm5791565f8f.84.2025.03.07.09.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 09:02:40 -0800 (PST)
Message-ID: <15d653a7b5cf4f8eda3ff2e5e510489b99c1bb3a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] tcmode-default: eliminate needless gdb,
 qemu defaults
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com, Mark
 Hatle <mark.hatle@kernel.crashing.org>, Ross Burton <ross.burton@arm.com>
Date: Fri, 07 Mar 2025 17:02:39 +0000
In-Reply-To: <CAMKF1srSJWbHYB9ZvNCLt0PFrHeua6C47Op9tU01Mc8_PZNJOQ@mail.gmail.com>
References: <20250306185551.1758417-1-Randy.MacLeod@windriver.com>
	 <CAMKF1sp=ovCd8xsQ=LLcYpENio=rP7sgecnUBrhjYKc3gRqYCg@mail.gmail.com>
	 <b2c632c7-30ca-486a-ba14-46c0f404f9e6@windriver.com>
	 <CAMKF1srSJWbHYB9ZvNCLt0PFrHeua6C47Op9tU01Mc8_PZNJOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 17:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212459

On Fri, 2025-03-07 at 08:48 -0800, Khem Raj via lists.openembedded.org wrot=
e:
> On Thu, Mar 6, 2025 at 5:40=E2=80=AFPM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
> >=20
> > On 2025-03-06 6:24 p.m., Khem Raj wrote:
> >=20
> > Are we sure that we don=E2=80=99t have external toolchains feeding gdb =
these days
> >=20
> >=20
> > I'm not sure. That's why I cc'ed you.=C2=A0 :-)
> >=20
> > How would I check or who would we ask?
> >=20
> > Let's start with Mark and Ross.
> > It's easy enough to revert if we find that someone, somehow needs this
> > but I plan to remove the rust and binutils bits next and if that goes w=
ell,
> > drop the rest of the file at the start of 5.3 if not sooner.
> >=20
>=20
> In general I am ok with this it does make core policies a bit tighter,
> and I do not have usecase for external toolchains myself
> but we have tried to accommodate other providers of external
> toolchains in past but there is
> PREFERRED_PROVIDER way of hooking the overriding toolchains as well
> e.g. in meta-go-binary layer
> this is the way it is used.

I think the way people use the project has changed and these are more
of a holdover from the past now. If a layer does need them they can
certainly add and set them but we probably don't need to in core any
more...

Cheers,

Richard

