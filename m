Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F55CCD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:15:49 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10034.1781680536127165424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dvnzFTDR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bef47b1ac01so806645666b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781680534; x=1782285334; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gQITHdCs3wTviKT88ph5GP55WCHfyqvbERXrsVBcisA=;
        b=dvnzFTDRJM+mDl9LKnV7VSnZeZuGAURK6ukTVXolVcE+KfPSFx4nDRO5L+VtNsM0hn
         8llmaMYHE+50qHMsh+Y789aOb8pEIhDLVTkxt1VYWzPi4GbDBgXLA4IfasaaITZOhd5m
         o2X7IveldxQDfOxNLKTI2AB0SHlYAH5qHFn4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680534; x=1782285334;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQITHdCs3wTviKT88ph5GP55WCHfyqvbERXrsVBcisA=;
        b=CfkPKnoNOfiONMmQaZfM5wahhaiqP+H2fUUQ/6mB3cv3USOHBBh1VR5cQQVVQuKsUD
         OtCvuBnTj4zuujNOgqQNxht2MJkLX6Z+10J1GispoJzPjyVyUlENtIVLG20DN/33BQUS
         SYyj+Gfz8RUl02rb54LhF5AJN/RbVleZ2QZv+LEKF+yHBRMOKILW1ezl64YphTmM4s0Z
         83dAQ5r2JDflQHT5h1oudY0UMuGONgBqt7lXVOEZvW70B4pGWu4EZ5iZhDLs/hby0WNa
         j9AILv72yvYaiCNYLKeN78jpYhJQZ5VUgJqcMC1r69OO2KfFA7L6VUHTqnEpqoTwjhr0
         gr0A==
X-Forwarded-Encrypted: i=1; AFNElJ/iRCA0XJXXtJ2aHp7dwL+Yt077EYow6JweTnMX9kQFK8ay4+vcF7kVMtb83MhYR00JkOh3Fj2A+fBqf6sXD/+J4A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxS/bqJA2yH/YLV4GvOlIjhEPHhIVqYyFUKafdkG25+RGWn4WDd
	I1hqiKNffzTmfmPmfZelKi5X1eNz2H9fo1kfbpWmEay6RxfLVa/zkiMZvk6uTqTJ7hXJgTyZ2XU
	bqFd4
X-Gm-Gg: Acq92OE+ggqjtL7cFYc55yXmBzqsOAFsYIM1W21+J4kiXZyAlD8x8ZlxFh56opsLEt1
	LY6T5+YsjXqoU43EdDiXwuYWi8oKtlyfWMysgcIItiKTlWPkSQDvk8KxbTrlhNhXgCWoAuBjWGw
	ZKR/2MkSKKIEALEnCjxducgS6PPoYmE97QCmctLAsfbz5ATa/BmptqZEur38DomjWjH896M7bYM
	lKV2IC/hAg/WwnPngbWXYSEEOhSFiOvg1VNovhnYEXzVmzf9CQcbErjU9FVZMW5DwkPB8gV9Ofg
	aB/L4JFObugkAh/o3pEyJosPjwq3cC5GGUkfLfHBuEt4+7TvPZkwilGEkhOCBPXfEoIRlfUMpQD
	TaaqNQ4Ec/7Sa9olp6dyXqE/w4ij0+yzuU9ParcVKJFqMnJLgLQ1QjsLas+wpjV7u9OELDYwOJa
	o4vMuHGwoy4YWXGuQyI0jwtZHhW1G5N9vXtmkFfXZwN8qTKXy3OGqUchDjJAzs70vbRouSdtiZa
	jbP9A==
X-Received: by 2002:a17:907:c1d:b0:c05:8527:87a8 with SMTP id a640c23a62f3a-c05a85a86f4mr185783666b.34.1781680534192;
        Wed, 17 Jun 2026 00:15:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1e34:81e7:2ec0:d3d5? ([2001:8b0:aba:5f3c:1e34:81e7:2ec0:d3d5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6dbbcsm768088766b.32.2026.06.17.00.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:15:33 -0700 (PDT)
Message-ID: <31dce542911b3516d49f423f53d48f94be8bbd94.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: Upgrade GCC to 15.3 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Wed, 17 Jun 2026 08:15:32 +0100
In-Reply-To: <20260617054716.1343535-1-Hemanth.KumarMD@windriver.com>
References: <20260617054716.1343535-1-Hemanth.KumarMD@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238981

On Tue, 2026-06-16 at 22:47 -0700, Hemanth Kumar M D via lists.openembedded=
.org wrote:
> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>=20
> - Added support for AVR32EB14/20/28/32, AVR16LA14/20/28/32, and
> =C2=A0 AVR32LA14/20/28/32 devices
> - Added IEEE double functions sincos and sincosl support
>=20
> * Drop backports available in this release.
>=20
> Release notes: https://gcc.gnu.org/gcc-15/changes.html
> Docs: https://gcc.gnu.org/onlinedocs/15.3.0/
> Bug fixes: https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED=
&list_id=3D522382&resolution=3DFIXED&target_milestone=3D15.3
>=20
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---
> =C2=A0meta/conf/distro/include/maintainers.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0.../gcc/{gcc-15.2.inc =3D> gcc-15.3.inc}=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++--=
-----
> =C2=A0...ss-canadian_15.2.bb =3D> gcc-cross-canadian_15.3.bb} |=C2=A0 0
> =C2=A0.../gcc/{gcc-cross_15.2.bb =3D> gcc-cross_15.3.bb}=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 0
> =C2=A0.../{gcc-crosssdk_15.2.bb =3D> gcc-crosssdk_15.3.bb}=C2=A0=C2=A0=C2=
=A0 |=C2=A0 0
> =C2=A0.../gcc/{gcc-runtime_15.2.bb =3D> gcc-runtime_15.3.bb}=C2=A0 |=C2=
=A0 0
> =C2=A0...{gcc-sanitizers_15.2.bb =3D> gcc-sanitizers_15.3.bb} |=C2=A0 0
> =C2=A0.../gcc/{gcc-source_15.2.bb =3D> gcc-source_15.3.bb}=C2=A0=C2=A0=C2=
=A0 |=C2=A0 0
> =C2=A0.../recipes-devtools/gcc/{gcc_15.2.bb =3D> gcc_15.3.bb} |=C2=A0 0
> =C2=A0...{libgcc-initial_15.2.bb =3D> libgcc-initial_15.3.bb} |=C2=A0 0
> =C2=A0.../gcc/{libgcc_15.2.bb =3D> libgcc_15.3.bb}=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 0
> =C2=A0.../gcc/{libgfortran_15.2.bb =3D> libgfortran_15.3.bb}=C2=A0 |=C2=
=A0 0
> =C2=A012 files changed, 5 insertions(+), 8 deletions(-)
> =C2=A0rename meta/recipes-devtools/gcc/{gcc-15.2.inc =3D> gcc-15.3.inc} (=
92%)
> =C2=A0rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb =3D> g=
cc-cross-canadian_15.3.bb} (100%)
> =C2=A0rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb =3D> gcc-cross_=
15.3.bb} (100%)
> =C2=A0rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb =3D> gcc-cro=
sssdk_15.3.bb} (100%)
> =C2=A0rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb =3D> gcc-runt=
ime_15.3.bb} (100%)
> =C2=A0rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb =3D> gcc-s=
anitizers_15.3.bb} (100%)
> =C2=A0rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb =3D> gcc-sourc=
e_15.3.bb} (100%)
> =C2=A0rename meta/recipes-devtools/gcc/{gcc_15.2.bb =3D> gcc_15.3.bb} (10=
0%)
> =C2=A0rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb =3D> libgc=
c-initial_15.3.bb} (100%)
> =C2=A0rename meta/recipes-devtools/gcc/{libgcc_15.2.bb =3D> libgcc_15.3.b=
b} (100%)
> =C2=A0rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb =3D> libgfort=
ran_15.3.bb} (100%)

Thanks for the patch! Shouldn't there be some patches being deleted
here since they're no longer used?

Cheers,

Richard

