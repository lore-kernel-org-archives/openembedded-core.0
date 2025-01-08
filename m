Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E29AE7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 12:27:11 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.17742.1736339228977940625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 04:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tnncltf4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43675b1155bso160865385e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 04:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736339227; x=1736944027; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYVZ1DZQg0gU5L08mxc+UdDCrt0G85b8FmVlPh6mQSU=;
        b=Tnncltf4KTO3Kuyc9Xs55TakW18hGjYSHk5lTgUzk71ZgIskOOu2y4npSlnAoPuPD2
         xL1dZqyxibpqBX8QpMSfs+FygS6yveWHm7dKXPNr1jgg4PSSpy0UK4hqG8qv823oVrlF
         /p/KPRL8MpZk+teap6OZxG9aqSWfEOTD5Wfw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736339227; x=1736944027;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aYVZ1DZQg0gU5L08mxc+UdDCrt0G85b8FmVlPh6mQSU=;
        b=iJr+qtGHgngIO+MDfziWQsbs+U5Fw+Fwj7v6BuEr1ZrVGaKXDDSyGWFdsjc7is1p2c
         sRHWbr0UbDzg1uAKrgiGng5nnxza20S+znoNv3cVlaABIGDxy6muWPOLNMJDHKLqVQ/p
         JBmw9+smRskYNS5/D34ba3YuNa6jVk8Y4UUI2QYVU73H1XDKC3MLgPAII+pKkoUjGqB5
         pUIl/rBQ+6xQZVcqUerYLAocabM5VGkvBCt79nLX2chhS8UQnmxhVhVRhY1AB+6ZEC7I
         v5NQ15/hZIjSaOoFjOPIl35ptzhp9Q1RgIyDnP3oZIefw/UVpWZLNtLcGnlUMmaKz4zp
         WoDg==
X-Forwarded-Encrypted: i=1; AJvYcCVnIeCtcsX3D+FkGgRdap6mmgD/PCuJgDUaqif7UO49tccadp4mXlYNRDpoMGplVtcXdrD9O+zijIzps6sOJuujUQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz34eLuC8zWwQpCrnJycifB5ejjp43O3gkmcZiWfGXhEczTOwt6
	0sO1xdAi0NvAgGe6mCG+qR/G0briQgTo71uv2qKrsaef/O3ZfokLYz4ZJDxm1fQ=
X-Gm-Gg: ASbGncubM2oFkvF4W9Y2viFG7Ou3Lhvh+0UY/XnB5Qbj9h/Ys1oCYJHL3IfuUCbkade
	8WFvl2Lryh3ppjc8TM0kIky/AhsaHcuiwyxLBhHgkDoh7CtXZuGAypnhbdIfUaQGgavoiuU8w/w
	6PtmSGy7kH3N1i3TEFl/XAI8znYbH4JnCZjnS9CApDN/G0fJaejnfkeGQXgCdGL4d7g0grqwj2w
	eNSche0ybSu/ldk0T/62fWdgbkyGjSfckfL4hfrWn0rZ7KLEbz0PCdlCtsFl7mSEZRYEvaUTHHV
	2cdt9bbMs0bWkpCh4r5PW0nj6PhCAX/XOL3vMe0Co9aMcA==
X-Google-Smtp-Source: AGHT+IFX6ZzIJIOzOf0nBgLlp3N7DvLPjpSFp94ee7ytOZNy5F3oexsuda9vpDOHB1qxz3IWjLjehg==
X-Received: by 2002:a05:600c:3c9f:b0:432:cbe5:4f09 with SMTP id 5b1f17b1804b1-436e2686716mr21039425e9.4.1736339227282;
        Wed, 08 Jan 2025 04:27:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:906a:f5af:b180:de5a? ([2001:8b0:aba:5f3c:906a:f5af:b180:de5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e92dc4sm19074535e9.39.2025.01.08.04.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:27:06 -0800 (PST)
Message-ID: <c3c7237601561b49e3c6ff3894848e5d42c0da1f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] icecc: allow icecc in kernel-arch recipes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: nick.owens@eero.com, openembedded-core@lists.openembedded.org
Date: Wed, 08 Jan 2025 12:27:05 +0000
In-Reply-To: <20241219180130.396868-1-nick.owens@eero.com>
References: <20241219180130.396868-1-nick.owens@eero.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 12:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209556

On Thu, 2024-12-19 at 10:01 -0800, Nick Owens via
lists.openembedded.org wrote:
> to take advantage of icecc in out of tree modules which may not
> inherit
> kernel, but do inherit kernel-arch via module -> module-base, change
> the
> inherit check for icecc_is_kernel to check for kernel-arch class
> instead
> of kernel clas.
>=20
> Signed-off-by: Nick Owens <nick.owens@eero.com>
> ---
> =C2=A0meta/classes/icecc.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index 8a48f2ad63..adb51baf99 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -181,7 +181,7 @@ def icecc_is_allarch(bb, d):
> =C2=A0
> =C2=A0def icecc_is_kernel(bb, d):
> =C2=A0=C2=A0=C2=A0=C2=A0 return \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.data.inherits_class("kerne=
l", d);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.data.inherits_class("kerne=
l-arch", d);
> =C2=A0
> =C2=A0def icecc_is_native(bb, d):
> =C2=A0=C2=A0=C2=A0=C2=A0 return \

Unfortunately there are places kernel-arch is used which are not the
kernel. In particular, linux-libc-headers, u-boot, barebox, perf and
probably more in other layers.

Cheers,

Richard

