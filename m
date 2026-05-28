Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8464BCD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 22:18:06 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22279.1780006685529832926
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 15:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M9oceonE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso652478f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 15:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780006684; x=1780611484; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bvVYLUZmyZ7UDrGui3P5IvZeoj8m2kVpjmd5swYK2jo=;
        b=M9oceonEsMyFZdvuTCTldOnyblBUYRkqnv0wEQQHHT33fzO4MFlMwOqv4+o8QIpQXF
         iqzuiUi10oVJvwuoMXIrvptV7AxrFzLXCgSfkr0lBzvBUYeSKfHGYVTN4prQgfr3Jd5T
         iGt125bNgWvjy6e82K0T+OiaMJpGj84aeLBoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780006684; x=1780611484;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvVYLUZmyZ7UDrGui3P5IvZeoj8m2kVpjmd5swYK2jo=;
        b=hw39TwirAV0dlGxRzKY0H4Vfu+/WfRofe/lafS5ZyVHdLRCji3eOBJa+ABqLq/2vG+
         83c5fF9prs6lxQgGGlSj6ZjXMg3UNuEUpX6fpa+AxrwPaAwNLV/mOHRcus6WqkP6gx4c
         nkxgftbaxEHAFoxzVgIMHcYkjqhvRfHONS8zyw7IzmT8R+NY+PlC9lG7fz0I835bZ1R5
         gD325eCJx3qm+IWvqDWg0SH8G/5UUD5+QcoiVabUYh6euyb75jtUc+si5lsn36d91hkh
         Z5DBxRjQRSP30xk/shLKz7Np0wIhDAPVrCLAEBtNj3cXi0xcoZjks6We1eIt1nomIlac
         zHKw==
X-Forwarded-Encrypted: i=1; AFNElJ+l3RgB16yrsnZYk+OoriLJWPJu0fgff0U1lGE163f0FjQCPbWkvs9Q7KPS/jUGjOKFlwSm/PNuEs3Zp/IWx9G4hQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/CtgYrfRbD0rHoGT5nbzl90XT3u5SSDls0nHMu2XGmjz6Rbkd
	8GDzHQ43ToxXURw7QDyR8iiJ2tLzt4VThuYOCc+M24i4euWtTiR4Piz25phLu/plqNo=
X-Gm-Gg: Acq92OG8vGAHoFHxXE8oCjKpS+FxfUXO6/WLmg/A+0orJC0UPqIMNC+i5fkswTT0otG
	r4XqKEZk/ihEvK+9hrNS1U+5+zQMaW704Jgq3GCFl/QUXXIDvfaYH4oMnVdAdIZZqJu0sdAVntv
	HPyqTM3UlmKYuuEslMZ+cRx+2xccQP7sODo/NGtzhhDmi8JMFKdH2N/QBvHv1dzqWeRsDhkTM++
	ETXByWee6q6UJcaXQTak4WT+e4ZUQ0erfECyA32ZMiMZM2Yj2QTW6pAICGFgHdjn2VkKe1TntHW
	EIEFwhyT7Zmiy1uAn+R87P0amMuawuYVvs0IMevf/C88Mfh+Qs1ZgSR2dYIyFnEuR5MDHyJop/M
	rCvL7WIoVPu9D9KGeLaVvr7qs3mBZPLyFupdg8STvunP2DRJkxad2P/MMJVfbYfqUErRNCu2J88
	EoarkmyH4rU/PVeqkCXm1GmiGsTQwTXbGmKXRSL3c/rXFZDunp1lCrQ5olFW9IZXOMq+8SZp6LJ
	cJMPb3VkLt33DqxHzHmcqoWAws=
X-Received: by 2002:a05:6000:1866:b0:45e:eed3:ff2a with SMTP id ffacd0b85a97d-45ef1403becmr371976f8f.15.1780006683690;
        Thu, 28 May 2026 15:18:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d836:be25:77c4:6416? ([2001:8b0:aba:5f3c:d836:be25:77c4:6416])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a28casm24003738f8f.23.2026.05.28.15.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 15:18:03 -0700 (PDT)
Message-ID: <b4918234123fc36e2c7947d58a29791268d8ac76.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] packagegroup-core-buildessential: Add
 Rust-in-kernel dependency packages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Thu, 28 May 2026 23:18:02 +0100
In-Reply-To: <20260528172211.2652140-1-Harish.Sadineni@windriver.com>
References: <20260528172211.2652140-1-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 22:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237736

On Thu, 2026-05-28 at 10:22 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> Add Rust-in-kernel depedency packages to the target image when Rust kerne=
l
> support is enabled (KERNEL_FEATURES includes 'rust'). These packages are
> needed for self-hosted development of Rust kernel modules.
>=20
> The following packages are conditionally added when Rust-in-kernel
> support is enabled:
> =C2=A0 - bindgen-cli
> =C2=A0 - libclang
> =C2=A0 - rust
> =C2=A0 - rust-src-lib
> =C2=A0 - rust-tools-rustfmt
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0.../packagegroups/packagegroup-core-buildessential.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessen=
tial.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.=
bb
> index 2cd67ad05f..cdfe07a584 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
> @@ -27,5 +27,6 @@ RDEPENDS:packagegroup-core-buildessential =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 libstdc++-dev \
> =C2=A0=C2=A0=C2=A0=C2=A0 libtool \
> =C2=A0=C2=A0=C2=A0=C2=A0 pkgconfig \
> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'bind=
gen-cli libclang rust rust-src-lib rust-tools-rustfmt', '', d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0 "

I think we should define a new packagegroup-core-buildessetial-rust to
put these in?

These aren't really specific to kernel development so KERNEL_FEATURES
doesn't seem quite the right way to enable this?

Perhaps targets could just pull in packagegroup-core-buildessetial-rust
when wanted instead?

Cheers,

Richard

