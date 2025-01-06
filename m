Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA51EE77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 09:53:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.56357.1736157216563080367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 01:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UJhhN4HL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43624b2d453so146438525e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 01:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736157215; x=1736762015; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4Md5h/xDw9R/zM7kpc25sWxYANpW66QU3DJDtNFiWQ=;
        b=UJhhN4HLZAaWn3hJjAQqwgUc89vBR2KZONj6PEGRLaf5oVzJlbycR3OcAYMNW7JJAi
         kp7vXDPIBxPjMYEwnemI1dqoOJUte15q7gKY89nYH2xQmj+WkfYXuIvgjbzcYnboDNRf
         nl7Q6dWPjTrVyhnZWTY1XA29kU1urVeLI1YQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736157215; x=1736762015;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X4Md5h/xDw9R/zM7kpc25sWxYANpW66QU3DJDtNFiWQ=;
        b=pTqc5rHSBJtWnp3C9zeJrJLHfUV154KiTojsTqrPwzAwcAfS2E9FsUoeXBywT61Bhs
         yP3i3SQe6HETEi/ky6FJNUXrgabt/5BXaz9qgmdCP2fQgxKUHdrmiPWZCbI1r8S4+99i
         rjiV/IB+e5s9RgoBuM0AaGtZJB0MAL50KbM/CZWzZt4zHEj0HTMQR2+YujBAff1p2DrX
         jvBngjXqsqUEQBLuvxB5K0vUpdknv3UqmjaE4Vz/Ay/P8LVGed1kRwVBQ5xOyT9cyRCl
         wvJhwUtIcvGGbQtlvZ2HxJMLjHOzYrgd676j/+BDi8JManNJduRvmW84h3CXH+CHmMzT
         HmIg==
X-Forwarded-Encrypted: i=1; AJvYcCWL7K2lmcpOcHHgXXKto7EDCe6Ph0xULdY38cMXqJI4BYV0piKDbtWZQOu3sRmqYgs6coB2e1X5prdrM/xDWzaRlg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw6jRQ8nksJVDAM5+GGx98Y6VL8pO9w7+tDq1qm+DBbOvnq/qhB
	ZQOZn5OFoGfdmr6zJMciM/guYJCx+lEGh7rEz+ENs2pxuLmkaAAHisbdp59YOXo=
X-Gm-Gg: ASbGncuygWiIuXgIJowOqdK9P5s5buuBxmP2ATvW1jGS5CGCYgw8E+kZB0KVyC2sogL
	cl8KvNJvq0eFXYUAyCDRCrgNBe672LXm8EVjfMnFLBUy67iNWdlbY+IDWW38/XyNIg6hN+oTJH+
	U5Y+7JcUXJDffvVChFGjGKJLpib5qBpM9A5mQ0IiFzubPZR5bmmBlfeRJpfJYOnbc31m73FwkHd
	+A5cA/CG+Tsf38nva3TOB4m6Shu4tB6ymjUPdMMc4aeXc+onuz4Ljb2XuqMTA6dy8rSUwrzN7dD
	6jtf7xqOAy8qCyJg2XNpD6aZ8vXoC2Z9fK94wugNrxwU0w==
X-Google-Smtp-Source: AGHT+IFywbgWLX4YCEdVsKpoEYMdxZQ9QY0fSpHiMnOjlf3QZKJMv8q+44Ap77BOQllHV0iooOZDRA==
X-Received: by 2002:a05:600c:1d10:b0:434:ff45:cbbe with SMTP id 5b1f17b1804b1-4366864414amr534560175e9.18.1736157214843;
        Mon, 06 Jan 2025 01:53:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3607:7267:e27a:36e4? ([2001:8b0:aba:5f3c:3607:7267:e27a:36e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364a379d69sm538940045e9.0.2025.01.06.01.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:53:34 -0800 (PST)
Message-ID: <9670a5482d8839b026fc00ad2b77b16e07cf0197.camel@linuxfoundation.org>
Subject: Re: [OE-core] [kirkstone] [PATCH] create-spdx.bbclass: fix patch
 error for recipes that inherit dos2unix
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liu.ming50@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 06 Jan 2025 09:53:33 +0000
In-Reply-To: <20250105114716.7188-1-liu.ming50@gmail.com>
References: <20250105114716.7188-1-liu.ming50@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 09:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209423

On Sun, 2025-01-05 at 12:47 +0100, Ming Liu via lists.openembedded.org wrot=
e:
> For the recipes inheriting dos2unix, do_patch will fail if
> do_convert_crlf_to_lf not run before it.
>=20
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
> =C2=A0meta/classes/create-spdx.bbclass | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.=
bbclass
> index 349ecfe6ab..26d586744e 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -810,6 +810,8 @@ def spdx_get_src(d):
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Make sure gcc and kern=
el sources are patched only once
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not (d.getVar('SRC_UR=
I') =3D=3D "" or is_work_shared_spdx(d)):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if bb=
.data.inherits_class('dos2unix', d):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 bb.build.exec_func('do_convert_crlf_to_lf', d)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bb.build.exec_func('do_patch', d)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Some userland has no s=
ource.
>=20

This is not in master so shouldn't be applied to kirkstone or other branche=
s yet.

I'm also not convinced this is the right fix. We may want to convert
do_convert_crlf_to_lf from a separate task to a postfunc for do_unpack
or a prefunc for do_patch if it is required it always run at that
point.

Cheers,

Richard

