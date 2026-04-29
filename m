Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCA6FF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 08:57:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7012.1777453020852933146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 01:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PPyHkTBF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b150559bso96412255e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 01:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777453019; x=1778057819; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jwOrVAJR5TWVMcLjD5MKCeZ2qBaGnreOCXTMDwp3FLU=;
        b=PPyHkTBFUMBqOaARdjlnd+PAHG3IEwvA5tFz5ETDdyM+dldtMIhZgPdYX7TQnd7ZW7
         3DMqjbWR7yNlcDi4U5EYQvLGPbi7d64sdh4tbEqvdIzskYInL0n4UQHlxzlLGvUfDGAk
         9ICbOYOUOwb5Ft8lXp9TDJL25ozxuVklXFIj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453019; x=1778057819;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jwOrVAJR5TWVMcLjD5MKCeZ2qBaGnreOCXTMDwp3FLU=;
        b=L+QcpFBM3nJ2snnKHF2cFWjZu9aIn+2+8u511uGoauEKQPSNhzlw0HvRLDx0Z2Iknx
         SZ09kNsoKRAOpqZgdgtOeFBBUyZZb381Ti2pwvTynfrWHO1kDhOBnl155P7X8OWgMIoy
         2rzUNN7CDUOfWu0+abGxoooMONMG/2ORugPJ3+U/wCnoqXsqe5IC5jErs3rRawdInEMs
         dM1Bd7c4e5W0LB/8ZIxysvW+AZ2Bghj4kMV2KLFoplVZv8I91zIXuPo+O63jHrcfU0nx
         exDheouT4m+Um5pcIv8DrOg6IKBgngi+dLu3LAFLyAcs8anwX2wZqiGFY1bCiCCwYe9s
         JYcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jhCni9LKN8e+5toQGfq3J4KMk6Zxqci7zZKlu4ij+ZqwMceUsYWgc2fw9xtAajgGuJwaeipDHz77cAS3iyGA6IA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzbidxEWZDYtY6OCyZuEy8KAhDuZIeV0yYpNh7lkFALwwH3cuZh
	Sl42UOEs9SDMyVwWrPecwYJLuK9KHCye+F7gtT/UcXivl/LqunBeArJQDshJ9ODv6bA=
X-Gm-Gg: AeBDievDyjyHob29UMbbZh/4D8gsUuS6gGRaIP6QQq9+RJKK/526rJsA/wGVbyAU6no
	MdD9CP890vDb54+qA9yDSpsxb6AWsh/PpTBkKnieoXlmBdp0ZJl75lDOXcNWVvs3SmNU5f7uR2S
	uED2mwfVWjWkOKPdAljRt5z/3sj1+HtrphNF/RvHx7vKQqrPCpyZK38tVOyO0VBsGtjQ3RbKeOK
	ko8i0glIx4P38SW/BmzsjXETT1+MRoAVupcAnQJ7es7L4I9o9jjx+8zl35KGgRle6soodHk08gm
	4ios3FYSr2nzX90jGNFWm+8ZgP53fWkKGoQkvFsNBIGA9y2J9Ec3DzzZ+swizfEFD8dqrdYKOtH
	36CWI9QT66lsmjtNZO1uc8o18CNGpFym1iAzhyeBrkaHDl2oVNpnjQwSIQY6jCjmhE4tZVpfhu6
	1EuMFy/UqYSSgFoyrvakIJ3XxA3SsNXX2LQOE4u9Y6ps5JADiC3ch2qp4PaoN0AnD2a25kEFJNC
	NP78F9OzR5lc3FF9JTeBCIYjT8=
X-Received: by 2002:a05:600c:8208:b0:489:1c1f:35f1 with SMTP id 5b1f17b1804b1-48a77ad5f64mr100797085e9.4.1777453019143;
        Wed, 29 Apr 2026 01:56:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9fbc:9565:c749:f838? ([2001:8b0:aba:5f3c:9fbc:9565:c749:f838])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b92adefsm21291765e9.3.2026.04.29.01.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:56:58 -0700 (PDT)
Message-ID: <88c70e057ecc5e570253905c61d7d69dac4d2364.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] u-boot: Fix u-boot-tools-native build after
 DTC update
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marek.vasut@mailbox.org>, festevam@gmail.com, 
	openembedded-core@lists.openembedded.org
Cc: khem.raj@oss.qualcomm.com
Date: Wed, 29 Apr 2026 09:56:56 +0100
In-Reply-To: <70662038-11e3-46d4-b2cb-ff603ab3858f@mailbox.org>
References: <20260429001811.2723886-1-festevam@gmail.com>
	 <516fab60f06521e2335185dc20d8b8c1d1330730.camel@linuxfoundation.org>
	 <70662038-11e3-46d4-b2cb-ff603ab3858f@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 08:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236088

On Wed, 2026-04-29 at 10:36 +0200, Marek Vasut wrote:
> On 4/29/26 10:03 AM, Richard Purdie wrote:
> > On Tue, 2026-04-28 at 21:18 -0300, Fabio Estevam via lists.openembedded=
.org wrote:
> > > From: Marek Vasut <marek.vasut@mailbox.org>
> > >=20
> > > Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
> > > build will surely not find host /usr/include/yaml.h file and
> > > will disable yamltree build. For details, see U-Boot commit
> > > 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot").
> > >=20
> > > Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > ---
> > > =C2=A0=C2=A0meta/recipes-bsp/u-boot/u-boot-tools.inc | 7 ++++++-
> > > =C2=A0=C2=A01 file changed, 6 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-=
bsp/u-boot/u-boot-tools.inc
> > > index a055409c2cb0..071746b64e24 100644
> > > --- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
> > > +++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
> > > @@ -1,5 +1,5 @@
> > > =C2=A0=C2=A0SUMMARY =3D "U-Boot bootloader tools"
> > > -DEPENDS +=3D "gnutls openssl util-linux swig-native libyaml-native"
> > > +DEPENDS +=3D "gnutls openssl util-linux swig-native"
> > > =C2=A0=20
> > > =C2=A0=C2=A0inherit python3native
> > > =C2=A0=C2=A0export STAGING_INCDIR =3D "${STAGING_INCDIR_NATIVE}"
> > > @@ -88,3 +88,8 @@ RDEPENDS:${PN}:class-native =3D ""
> > > =C2=A0=20
> > > =C2=A0=C2=A0BBCLASSEXTEND =3D "native nativesdk"
> > > =C2=A0=20
> > > +# Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
> > > +# build will surely not find host /usr/include/yaml.h file and
> > > +# will disable yamltree build. For details, see U-Boot commit
> > > +# 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot"=
)
> > > +PKG_CONFIG_SYSROOT_DIR:prepend =3D "/invalid/"
> >=20
> > This feels a bit like a hack. Is there not a config option we can pass
> > to u-boot to make this deterministic, i.e. always disable libyaml?
> Currently there is not, but Linux did drop the whole yamltree part in
> ef8795f3f1ce ("dt-bindings: kbuild: Use DTB files for validation") and=
=20
> U-Boot should do the same. This path change is the minimum invasive=20
> change to achieve disabled yamltree with current U-Boot, until this is=
=20
> fixed upstream the same way Linux fixed it.

Lets just explicitly patch the code out then or something, I'm not sure
we need to be minimally invasive here.

I really don't like hacks which people may copy/propagate and which can
have interesting unintended side effects.

Cheers,

Richard

