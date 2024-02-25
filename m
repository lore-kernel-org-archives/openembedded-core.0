Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14ACC47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 20:52:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.6069.1708894362393169708
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 12:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BwMHh2+x;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-412a6022050so200525e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 12:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708894361; x=1709499161; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZEDCKeMf7yhwbFC3NDjwB+6en5zk1Vm83iWgDYSy+I=;
        b=BwMHh2+x3BSQfpsmt601Bt+CDb8KCil564kpQOgOwji4+rtbbS+OKTh2OrhuW41Oak
         FYbKQp585181bal17cQcKBSubFdBV+MWGYu5r/D3XQ2vYpWzUmr1QH3V5Bkvm4ZO9FRC
         gtSSYvnXHSKTFCEWRiyTx+LDjHV0tx9cdpFaX89RxXcr0xntGpZyZtGgr6H23h19H3fO
         JuYlIH0G+XRQe4tMN2lgzQ+y+AVE8rLm+i1A1W2uDq6Z+OAyx3dpnwIkXsiwXzODZiPY
         dJiwPfQeUSHzpaNqmIIPNHhqCJiPKxCMjLGaUNtJhTabQbaUKUGOYNbg7xUU1kimxnEC
         Licw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708894361; x=1709499161;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ZEDCKeMf7yhwbFC3NDjwB+6en5zk1Vm83iWgDYSy+I=;
        b=v9mRsnWd/RO9PaVSRHZMgbKKjwc3NWFU4AwBIrq+6s4RbzF0qGpEnJHPSwShOcPh6P
         rQl1roTpNEqrxhQJto2hhYUMGMI5Qxo/gPkjRrXjs0f3SX3aZnjPSau4bxTyIautt0AN
         bZR9NzMROwF64pT5ZuyQVneOVDXueERQl575gTwfoQCzSVYgwtLlOAeiw6AcztD9EST8
         oknQylkoHWbsUfF94nbgwFDdOq5yq+C7dIqevPMz03nj8X9+xaX/wxW4O/FSI+jkkhSx
         zl7ZyJy7nHaqdTDNVbfShimQZdpMZoGLXseE/rLDoyL4jcMb9vIPS9jY26d2C/Hs9pDO
         U1pA==
X-Forwarded-Encrypted: i=1; AJvYcCXKFS1rr9yUaXyWrjaEFkANk89Rb8+N5xWKQuNRkbuwPAiLdq80begtZIEyMJdTK4gMywIOFfGtzKe20hULR2XJdWQiZMw8W4ghinxfN2URBgRvQCe6yBPo
X-Gm-Message-State: AOJu0Yx4dhAcCtD5H2ylog5RyCgZtS4Wrqj7ZKPMzcxw458WsUWT0hRj
	oWQOYYoiKpVvbFejujlpg+zxrWNcZXHoO/v5pDDow8ewKl9XySzl0CMZyrBb
X-Google-Smtp-Source: AGHT+IHwNSH6xbPmkjhgy2oVCcOj4aUJBgUhEyETHrOHMHqcgwgNsFhnN5Uat11xwkgo0Jjyru9KQg==
X-Received: by 2002:a05:600c:5109:b0:412:610f:c2e7 with SMTP id o9-20020a05600c510900b00412610fc2e7mr4330187wms.41.1708894360525;
        Sun, 25 Feb 2024 12:52:40 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c230700b00412886cbc44sm9765906wmo.24.2024.02.25.12.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:52:39 -0800 (PST)
Message-ID: <78d46783054810d0f7bcc0566867c4d44e1bdc03.camel@gmail.com>
Subject: Re: [PATCH v2 2/5] devtool: code: Add source mapping for debug
 source files
From: adrian.freihofer@gmail.com
To: Enguerrand de Ribaucourt
 <enguerrand.de-ribaucourt@savoirfairelinux.com>, 
 openembedded-core@lists.openembedded.org
Date: Sun, 25 Feb 2024 21:52:39 +0100
In-Reply-To: <63b2d3cf-e269-48df-b9b0-a2c6e154dfff@savoirfairelinux.com>
References: 
	<20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
	 <20240219165525.714512-3-enguerrand.de-ribaucourt@savoirfairelinux.com>
	 <4a89e1327bf1595361c98d200f15a36daefca0a6.camel@gmail.com>
	 <ba386157-4ef6-4d83-a1a8-95aff41a92d4@savoirfairelinux.com>
	 <fd2771f5-f50b-4da9-a90c-204e2356085d@savoirfairelinux.com>
	 <0eb9dfcfce7449a97b68e17d29c2e671b4dbc06d.camel@gmail.com>
	 <63b2d3cf-e269-48df-b9b0-a2c6e154dfff@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 20:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196151

On Thu, 2024-02-22 at 16:51 +0100, Enguerrand de Ribaucourt wrote:
>=20
>=20
> On 22/02/2024 14:00, adrian.freihofer@gmail.com=C2=A0wrote:
> > On Wed, 2024-02-21 at 15:56 +0100, Enguerrand de Ribaucourt wrote:
> > >=20
> > >=20
> > > On 21/02/2024 15:12, Enguerrand de Ribaucourt wrote:
> > > >=20
> > > >=20
> > > > On 20/02/2024 10:01, adrian.freihofer@gmail.com=C2=A0wrote:
> > > > > On Mon, 2024-02-19 at 17:55 +0100, Enguerrand de Ribaucourt
> > > > > wrote:
> > > > > > When launching the debug configuration, the source files
> > > > > > from
> > > > > > the
> > > > > > debug
> > > > > > rootfs were openened in the editor instead of the local
> > > > > > workspace
> > > > > > files.
> > > > > > We add an exception to properly map them to the file being
> > > > > > developed
> > > > > > and
> > > > > > compiled by the IDE integration. This also more closely
> > > > > > matches
> > > > > > what
> > > > > > the
> > > > > > user would expect compared to native development.
> > > > > >=20
> > > > > > This is also true for the devtool fallback mode.
> > > > >=20
> > > > > This looks still wrong to me. If files from the rootfs are
> > > > > openend for
> > > > > a recipe which is in the workspace, the SDK is broken and we
> > > > > need
> > > > > to
> > > > > understand and fix that. This patch does not solve that, but
> > > > > will
> > > > > make
> > > > > it much harder to find the right solution for this issue.
> > > > Hi Adrian,
> > > >=20
> > > > This is affecting essentially the devtool fallback mode. Since
> > > > it's
> > > > compiled through devtool, it's using the bitbake packaging
> > > > information.
> > > >=20
> > > > Steps to reproduce:
> > > > =C2=A0=C2=A0=C2=A0- devtool modify powertop (autotools recipe, curr=
ently
> > > > fallback)
> > > > =C2=A0=C2=A0=C2=A0- devtool ide-sdk powertop [args...]
> > > > =C2=A0=C2=A0=C2=A0- open the powertop sources workspace
> > > > =C2=A0=C2=A0=C2=A0- run the debug launch configuration
> > > > =C2=A0=C2=A0=C2=A0- initial breakpoint opens the rootfs-dbg main.cp=
p instead
> > > > of the
> > > > current workspace
> > > >=20
> > > > This probably will get fixed for autotools with your specific
> > > > class
> > > > support, but will remain for the fallback mode.
> > > >=20
> > > > Do we want to keep this source map, but only for the fallback
> > > > mode?
> > > > Like
> > > > you say, it's kinda "cheating" the debug information, but since
> > > > we
> > > > are
> > > > in fallback mode, the devtool packaging is supposed to be using
> > > > the
> > > > sources from the workspace, so it's more like "hinting" at the
> > > > proper
> > > > source.
> > > It also affects more meson projects like lighttpd. The "hint"
> > > would
> > > still be valid given how it's built and deployed now. If you are
> > > still
> > > working on an alternative tinfoil deploy method, maybe it's not
> > > affected.
> >=20
> > It looks like the devtool deploy-target step is missing. If you
> > debug
> > packaged files this would behave like this. It's important to over
> > write the packaged files with the not packaged file from the image
> > folder. This is what the devtool deploy-target command does. It's
> > expected that this just happens, probably there is a bug in the
> > dependencies. Could you please try to run it explicit? Something
> > like
> > this:
> >=20
> > - devtool modify powertop (autotools recipe, currently fallback)
> > - devtool ide-sdk powertop [args...]
> >=20
> > - devtool build powertop
> > - devtool deploy-target powertop
> >=20
> > - open the powertop sources workspace
> > - run the debug launch configuration
> >=20
> > I guess this would work as expected. The question is then: Why is
> > the
> > deploy not executed?
> The deploy-target is actually executed automatically through the
> launch=20
> configuration. I also get the same result if I deploy manually. I=20
> believe that the problem is rather how "devtool build" compiles and=20
> packages the binary.

You are right. We need this additional source mapping. I found some
time to look into the details. I propose to go with these 4 patches
(including your patch as well):
https://lists.openembedded.org/g/openembedded-core/message/196146

Adrian

> >=20
> > Adrian
> >=20
> >=20
> > > > >=20
> > > > > Adrian
> > > > >=20
> > > > > >=20
> > > > > > Signed-off-by: Enguerrand de Ribaucourt
> > > > > > <enguerrand.de-ribaucourt@savoirfairelinux.com>
> > > > > > ---
> > > > > > =C2=A0=C2=A0=C2=A0scripts/lib/devtool/ide_plugins/ide_code.py |=
 1 +
> > > > > > =C2=A0=C2=A0=C2=A0scripts/lib/devtool/ide_sdk.py=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > > > > > =C2=A0=C2=A0=C2=A02 files changed, 2 insertions(+)
> > > > > >=20
> > > > > > diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py
> > > > > > b/scripts/lib/devtool/ide_plugins/ide_code.py
> > > > > > index b2193130d2e..c063b7d0590 100644
> > > > > > --- a/scripts/lib/devtool/ide_plugins/ide_code.py
> > > > > > +++ b/scripts/lib/devtool/ide_plugins/ide_code.py
> > > > > > @@ -234,6 +234,7 @@ class IdeVSCode(IdeBase):
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 gdb_cross_config.image_recipe.rootfs_dbg:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 launch_config['additionalSOLibSearchPath'] =3D
> > > > > > modified_recipe.solib_search_path_str(
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdb_cross_config.image_recipe=
)
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 src_file_map[os.path.join("/usr/src/debug",
> > > > > > modified_recipe.pn, modified_recipe.pv)] =3D
> > > > > > "${workspaceFolder}"
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 src_file_map["/usr/src/debug"] =3D
> > > > > > os.path.join(
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > > gdb_cross_config.image_recipe.rootfs_dbg,
> > > > > > "usr",
> > > > > > "src", "debug")
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 el=
se:
> > > > > > diff --git a/scripts/lib/devtool/ide_sdk.py
> > > > > > b/scripts/lib/devtool/ide_sdk.py
> > > > > > index 14679744807..f292edbe25c 100755
> > > > > > --- a/scripts/lib/devtool/ide_sdk.py
> > > > > > +++ b/scripts/lib/devtool/ide_sdk.py
> > > > > > @@ -356,6 +356,7 @@ class RecipeModified:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 'PACKAGE_DEBUG_SPLIT_STYLE')
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 se=
lf.path =3D recipe_d.getVar('PATH')
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 se=
lf.pn =3D recipe_d.getVar('PN')
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.pv =3D recipe_=
d.getVar('PV')
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 se=
lf.recipe_sysroot =3D os.path.realpath(
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 recipe_d.getVar('RECIPE_SYSROOT'))
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 se=
lf.recipe_sysroot_native =3D os.path.realpath(
> > > > >=20
> > > > Enguerrand de Ribaucourt
> > > >=20
> > > Enguerrand de Ribaucourt
> >=20
>=20
> Enguerrand de Ribaucourt


