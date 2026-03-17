Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D53F33810
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 08:22:28 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71099.1773735736848230083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 01:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O/Gr5JNF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso5388978f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 01:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773735735; x=1774340535; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfeT7NIwnUxaxoNo5kuRwiTrif6kNJyB/dRCU8YaiUQ=;
        b=O/Gr5JNF/Y5S8bAWlzCJvYizPxS7Bo3Knyniwp1ZEnKiAJ0hWF4cFfRMXS6WXuV7Ls
         7QtBYl0AM5fkNydUUisbzF9Dy7XvNKAbd0DmRXtX0IRpM0zL5hSMcOHEhiZjeoPvDwNz
         7BeAaw6E3Q2ajcKKn4hqRM9Sx4YjqQeqMy4aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773735735; x=1774340535;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kfeT7NIwnUxaxoNo5kuRwiTrif6kNJyB/dRCU8YaiUQ=;
        b=FbtXDwYQErIEoAHWiYD4fEBr3auljR1creFQqqCPNOCaEiMdw8VHq9VJ3HTi7NisGF
         Gu0P7oD3t2V02NmAFu+63IDxjPjFntc2HPNW+qsV3LeERv9g/ReHR3MVII/pBEyjpAQh
         xAMw5D8ha5caffbjUW2QetoiuoHZ3CDFzv+YtUPvJjnYUXOO6zZzNxjwZ8n6wX7Olmnj
         gjQOv6tq9bvBcu3oFihm2fZSt/KrGHg1SH7A3VuYmcsv3t4pEi9FG0zfvbWbIlZqFjMM
         4pEQ8fCBd19kaEF13sj4lNzCouM/P8oF/ocGlLbC9YxvJTjs6tbvp6bjW40RTKt1an9Y
         nEqg==
X-Forwarded-Encrypted: i=1; AJvYcCV2SggVTWJGO0pelaiX8VTU1FRpauSUWe/prgtblUsxtQxJhC7mBR0EkqtVVRAVFsrboQ6LdTLN9KQtyqXnojjV6w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwCRA5VX5xDq6mE7oLSZfq16OmSTL4CzI5EPIbGrcH/8UpnNOiB
	YXKUbH0T/8FaZp1qp6AszhfaSp8ROY/5dQV/QYK2/CpJijoTdqBaccJqLubVa5TeWMc=
X-Gm-Gg: ATEYQzx3qINGWEY1xe4KXZGeZduvco1p9dK0ZbUItUlFP/x00yCUQPBb67NPbyr8NOk
	FB5b3QZ9QpRHs5jVTA1nrJh9w6X+r/KUIpXHVrYm524hWcFc8OEc5yaxV8A9Q0KjRCTYpNIJXiP
	Nrsy36kfNfZvZsQvUIsUioDdTwqIuhXaF8UyjLwI+J8cvpNB549TwIN9NhWpal2S5n1VJAyA8K6
	+L2DZ6mFR7XPMso6SqcS84q+DwlWWNvBMNPaFalRc+gQkE9VPwZvGS3UuHIdIFtBJPfPUY+yfrG
	LoIUa4bsnx8V87uAPhQLmXF6NqX1AW/o9e8lLlITY7KyPy6yPfdas1EudhD3fQizzm4aUp0/tmb
	IyaZf5J8OqB0ZCVDC+7OdAyiwlUTAAVKg7g5kabLqsmDvDXxf00LUIAczVC9IcDP8ONMl65FAan
	PCKnaR3mjBTe1+opvzOkra1S4YIFPu8bamiI0QMx9WGswuygqgoGyGbx2tHIpV93xf3WlgXIolg
	m02y5lvhhsycZs=
X-Received: by 2002:a05:6000:2509:b0:439:b3c5:ea1f with SMTP id ffacd0b85a97d-43a04d86416mr28789601f8f.16.1773735734954;
        Tue, 17 Mar 2026 01:22:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:183c:b889:ee72:b492? ([2001:8b0:aba:5f3c:183c:b889:ee72:b492])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a72cdsm53358869f8f.9.2026.03.17.01.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 01:22:14 -0700 (PDT)
Message-ID: <e69ed8a6abe51f1bca2779f24edfa9d9e4d23d01.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate/sstatesig: Abstract dummy package
 architectures into layer.conf settings
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Mar 2026 08:22:13 +0000
In-Reply-To: <DB5PR02MB102139B16A3C8B755F94EFCD8EF40A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260314102702.3942139-1-richard.purdie@linuxfoundation.org>
		 <DB5PR02MB10213C75B95E2CBE99D91221DEF40A@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <3f73b46c12aff52292d488f48d11572c66991b70.camel@linuxfoundation.org>
	 <DB5PR02MB102139B16A3C8B755F94EFCD8EF40A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 08:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233303

On Mon, 2026-03-16 at 13:03 +0000, Peter Kjellerstedt wrote:
> > > Wouldn't it be more appropriate to use +=3D for these two?
> > > Otherwise one will have to use :append to add to them in other
> > > layers.
> >=20
> > That depends on whether your layer is included after core or not.
> > I'd have thought including before core would be potentially
> > problematic anyway...
>=20
> Sure, but with +=3D the order does not matter.
>=20
> We have "meta" as the last layer in BBLAYERS in our setup. E.g.,=20
> these are the external layers I have in one of our configurations:
>=20
> BBLAYERS ?=3D " \
> =C2=A0 ...
> =C2=A0 .../meta-virtualization \
> =C2=A0 .../meta-webserver \
> =C2=A0 .../meta-multimedia \
> =C2=A0 .../meta-filesystems \
> =C2=A0 .../meta-networking \
> =C2=A0 .../meta-python \
> =C2=A0 .../meta-oe \
> =C2=A0 .../meta-poky \
> =C2=A0 .../meta \
> "
>=20
> We have them configured like this to as best as possible match the=20
> layer priorities. It is not perfect (e.g., meta-poky prepends to=20
> BBPATH instead of appending like all the other layers do), but it=20
> has resulted in the least surprises regarding things that are based=20
> on BBPATH and things that are based on layer priorities.

We need to rewrite how this all works and remove some of the options as
it is all too complex and everyone is putting it together differently
and hoping for the best :(.

Trying to "support" the number of possible combinations that people
might put things together is problematic. The ask is that everything
works regardless of how you configure it and nobody even
understands/agrees on the basic rules.

If you don't understand my concern, think about how you'd recreate that
setup just starting from core and using bitbake-layers add-layer. I
don't think you can.

It is too late to do anything about it right now and I've put off
trying to improve things as I know the shear amount of complaints I'll
get but there is a problem here.

Cheers,

Richard

