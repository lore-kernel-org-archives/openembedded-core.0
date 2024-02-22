Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B4FC48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 13:00:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.12048.1708606824257433727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 05:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T3vWNHDn;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4128e15d5e5so1055935e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 05:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708606823; x=1709211623; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzJWoY0HwIFblLvyUer2LC3LP4+kfI51es9YeWzx/t0=;
        b=T3vWNHDna38onQdCH9rf7YoysKZdmjSNjbWIW9RwZxe8VVI/8FHEsIBaBpRm0fVEjv
         JPgGS/rOrH/VC9KU4Zk/gWlsVVgPd/vqaylvMWPO0QzmtkJZCF+gVV9kIYG93xs1+NM+
         HxWhmzhgErH2TPNxfFJtooNE3W64M6LdBo2QvEwf8L/+4X1RtRpbIaoeOvGU8yZAab0w
         j3dRKYyweclxi6Hqw7vVvHhYSdofarYF29TI0U2JHgjiVxc+Cg81+0Y316Tft1F2LKp4
         FTc+4YES7ZR4QhzjsBblYjLZyK9/oOJSZwdr9SAvNGmBRqMpdsIPNSWJusQgAwytW97Y
         kj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708606823; x=1709211623;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YzJWoY0HwIFblLvyUer2LC3LP4+kfI51es9YeWzx/t0=;
        b=muJY5F57dctvCS9JF/Mp8P7P5RyV/4dpyZFo9kD4vtb0e3i8o5djFBqV9Y2HdDDYXP
         iYPy7K6Tl73VfdbeEZHfdaFr1MoOkEf2OOtpySMTWw9EWsBn8R90dgyEzke61HmJwMaE
         9r4xVScv1iPby256gRauln94y+nrYf6AWE1X97If0MB9ekhNICGqaaEaxwjMe9HBtfr5
         I1pcdzFtQVbGqhLFeSzbPrXty80vgFvPtCn0Yj+hE4QeEL2TpY8xjOF8TO8ss6LJwebb
         D5n2UcSU471VhLNmiwIDBFyGdMPyRlAYsTi6xMnAN/ECOyr999bQFIrIKVb1OJknuT7A
         3Qrw==
X-Forwarded-Encrypted: i=1; AJvYcCVr6qK/Ie6zhIlAN7CwrBuIxjvgXGt3r88rHLW/OcwobwD9x41+5qvJNOqvmmqJ8VAqjBlQNGeNaXtaP7XBM73AFIcIu3GJJsxdMWkBTXwZ5Sv7CEoV9ki0
X-Gm-Message-State: AOJu0YxrbN1YNjd5IKzojIfuv0g68n/gRTSPl3kz37SgxB0+zpD2fvdU
	5hp1gJirSEcE3RirRdN6BWHdS9zAXzA0ncar1Medl963TmTkOUVCBxl9uXrn
X-Google-Smtp-Source: AGHT+IHyNP80RBLzl2TjIdkuXq6NjlP2n1gLyy7sUarCBi8+Yq1MCvzdQORB1yLzy+hnrM9ebyywPQ==
X-Received: by 2002:a05:600c:4f04:b0:412:8816:fd5f with SMTP id l4-20020a05600c4f0400b004128816fd5fmr859912wmq.39.1708606822271;
        Thu, 22 Feb 2024 05:00:22 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id bi21-20020a05600c3d9500b004128808db91sm1871972wmb.23.2024.02.22.05.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 05:00:21 -0800 (PST)
Message-ID: <0eb9dfcfce7449a97b68e17d29c2e671b4dbc06d.camel@gmail.com>
Subject: Re: [PATCH v2 2/5] devtool: code: Add source mapping for debug
 source files
From: adrian.freihofer@gmail.com
To: Enguerrand de Ribaucourt
 <enguerrand.de-ribaucourt@savoirfairelinux.com>, 
 openembedded-core@lists.openembedded.org
Date: Thu, 22 Feb 2024 14:00:21 +0100
In-Reply-To: <fd2771f5-f50b-4da9-a90c-204e2356085d@savoirfairelinux.com>
References: 
	<20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
	 <20240219165525.714512-3-enguerrand.de-ribaucourt@savoirfairelinux.com>
	 <4a89e1327bf1595361c98d200f15a36daefca0a6.camel@gmail.com>
	 <ba386157-4ef6-4d83-a1a8-95aff41a92d4@savoirfairelinux.com>
	 <fd2771f5-f50b-4da9-a90c-204e2356085d@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 13:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196018

On Wed, 2024-02-21 at 15:56 +0100, Enguerrand de Ribaucourt wrote:
>=20
>=20
> On 21/02/2024 15:12, Enguerrand de Ribaucourt wrote:
> >=20
> >=20
> > On 20/02/2024 10:01, adrian.freihofer@gmail.com=C2=A0wrote:
> > > On Mon, 2024-02-19 at 17:55 +0100, Enguerrand de Ribaucourt
> > > wrote:
> > > > When launching the debug configuration, the source files from
> > > > the
> > > > debug
> > > > rootfs were openened in the editor instead of the local
> > > > workspace
> > > > files.
> > > > We add an exception to properly map them to the file being
> > > > developed
> > > > and
> > > > compiled by the IDE integration. This also more closely matches
> > > > what
> > > > the
> > > > user would expect compared to native development.
> > > >=20
> > > > This is also true for the devtool fallback mode.
> > >=20
> > > This looks still wrong to me. If files from the rootfs are
> > > openend for
> > > a recipe which is in the workspace, the SDK is broken and we need
> > > to
> > > understand and fix that. This patch does not solve that, but will
> > > make
> > > it much harder to find the right solution for this issue.
> > Hi Adrian,
> >=20
> > This is affecting essentially the devtool fallback mode. Since it's
> > compiled through devtool, it's using the bitbake packaging
> > information.
> >=20
> > Steps to reproduce:
> > =C2=A0=C2=A0- devtool modify powertop (autotools recipe, currently fall=
back)
> > =C2=A0=C2=A0- devtool ide-sdk powertop [args...]
> > =C2=A0=C2=A0- open the powertop sources workspace
> > =C2=A0=C2=A0- run the debug launch configuration
> > =C2=A0=C2=A0- initial breakpoint opens the rootfs-dbg main.cpp instead =
of the
> > current workspace
> >=20
> > This probably will get fixed for autotools with your specific class
> > support, but will remain for the fallback mode.
> >=20
> > Do we want to keep this source map, but only for the fallback mode?
> > Like=20
> > you say, it's kinda "cheating" the debug information, but since we
> > are=20
> > in fallback mode, the devtool packaging is supposed to be using the
> > sources from the workspace, so it's more like "hinting" at the
> > proper=20
> > source.
> It also affects more meson projects like lighttpd. The "hint" would=20
> still be valid given how it's built and deployed now. If you are
> still=20
> working on an alternative tinfoil deploy method, maybe it's not
> affected.

It looks like the devtool deploy-target step is missing. If you debug
packaged files this would behave like this. It's important to over
write the packaged files with the not packaged file from the image
folder. This is what the devtool deploy-target command does. It's
expected that this just happens, probably there is a bug in the
dependencies. Could you please try to run it explicit? Something like
this:

- devtool modify powertop (autotools recipe, currently fallback)
- devtool ide-sdk powertop [args...]

- devtool build powertop
- devtool deploy-target powertop

- open the powertop sources workspace
- run the debug launch configuration

I guess this would work as expected. The question is then: Why is the
deploy not executed?

Adrian


> > >=20
> > > Adrian
> > >=20
> > > >=20
> > > > Signed-off-by: Enguerrand de Ribaucourt
> > > > <enguerrand.de-ribaucourt@savoirfairelinux.com>
> > > > ---
> > > > =C2=A0=C2=A0scripts/lib/devtool/ide_plugins/ide_code.py | 1 +
> > > > =C2=A0=C2=A0scripts/lib/devtool/ide_sdk.py=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > > > =C2=A0=C2=A02 files changed, 2 insertions(+)
> > > >=20
> > > > diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py
> > > > b/scripts/lib/devtool/ide_plugins/ide_code.py
> > > > index b2193130d2e..c063b7d0590 100644
> > > > --- a/scripts/lib/devtool/ide_plugins/ide_code.py
> > > > +++ b/scripts/lib/devtool/ide_plugins/ide_code.py
> > > > @@ -234,6 +234,7 @@ class IdeVSCode(IdeBase):
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if gdb_cross=
_config.image_recipe.rootfs_dbg:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 launch_config['additionalSOLibSearchPath'] =3D
> > > > modified_recipe.solib_search_path_str(
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdb_cross_config.image_recipe)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 src_file_map[os.path.join("/usr/src/debug",
> > > > modified_recipe.pn, modified_recipe.pv)] =3D "${workspaceFolder}"
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 src_file_map["/usr/src/debug"] =3D os.path.join(
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdb_cross_config.image_recipe.rootfs_d=
bg,
> > > > "usr",
> > > > "src", "debug")
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> > > > diff --git a/scripts/lib/devtool/ide_sdk.py
> > > > b/scripts/lib/devtool/ide_sdk.py
> > > > index 14679744807..f292edbe25c 100755
> > > > --- a/scripts/lib/devtool/ide_sdk.py
> > > > +++ b/scripts/lib/devtool/ide_sdk.py
> > > > @@ -356,6 +356,7 @@ class RecipeModified:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 'PACKAGE_DEBUG_SPLIT_STYLE')
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.path =
=3D recipe_d.getVar('PATH')
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.pn =3D =
recipe_d.getVar('PN')
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.pv =3D recipe_d.ge=
tVar('PV')
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.recipe_=
sysroot =3D os.path.realpath(
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 recipe_d.getVar('RECIPE_SYSROOT'))
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.recipe_=
sysroot_native =3D os.path.realpath(
> > >=20
> > Enguerrand de Ribaucourt
> >=20
> Enguerrand de Ribaucourt


