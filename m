Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58544C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 09:01:54 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.9424.1708419712353292158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 01:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=azz0dNKJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so68945461fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 01:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708419710; x=1709024510; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GG2Y0pc31wuJnSMdU8ml3Cbfokj5sFlxdLNeADrBPWU=;
        b=azz0dNKJaqiUIMSu3pRn2gEtDv8I60f5OlSxT/ShBgfRngiKVJnMTT9shVQLrxdEx7
         CZE7S8XQNWrXkliFMZYkYGLqVDyLrD2OdqlmTS/jSTYxl9jUDIpwfcv2rHKS1HiRtQQA
         Nqkh0zrr7ZWP2xTi99hgNLdqfGP0gjYwUvHf8Lz/N3YVZhzEWutBzsFmXCQ8Lj4EJD1/
         XQXmdgW8GDDLjBnVGbv9+XMy1zPWCSgzPh052SLAkNOZyQnZ7Cj5dlXfokpLHsURJMXy
         pwFQYGcKcAutEsTYFHrVhiuQMwJKfB+zqen409n6hV+u+RLwhLnKXx2nJaw3ZOxJcHVC
         ws+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419710; x=1709024510;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GG2Y0pc31wuJnSMdU8ml3Cbfokj5sFlxdLNeADrBPWU=;
        b=xAi1B/BT/G59MNKclfP6YSjdCEaURNmhPTAsSqSYyRW3gIgdssad3d7dqhsB2Oj844
         qNFZ8xOUX/8k5HepZ1+J66X0G/8y2wOTs8QWJaTzzIJXZJUvhg1mTgpid/swfxrOyt3B
         OwphwLpn3iF0y1RClN4uLNvQrBpeSesDor/nnSgxxx8Naj1twYwJ7qVmzqOPrf0Gi2sF
         krp3J5trDbsEHnhXp0MAQME2xJQFZvp21kagiMoAuzhUyf1a2IowluvWww6Htdkrnjwn
         dF99hlIThuKP3hlQ+uGLhhElN2hdTktPS7D3HJIFfJilga/tX6COAT6+gKApz5xyYJh+
         5wSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm+VwLgBIDPWjS5CttzMBvyxMT7g4WKoUO6rGU6YLvt0sRBg94D/zz9YKaev0QI/+OHkX1+Yol8tVAlTV+B2yIBccW6qCriEvJse9IP/MvLCuvvqAzKgSZ
X-Gm-Message-State: AOJu0YxGL5vkCMTUCsEMsW/cIu5T0TwvSb4+mNPnOBdNdY/tOAPoZzln
	s6uwHvAaOeVEnQ6THdKAsIJmnQD0+/WMQzF5i3GGa1pM2ToG0YDFFFkKvpxZ
X-Google-Smtp-Source: AGHT+IFQIobdX3WVXX70Io7pejYgxntgIf4FTwwXYQrNPGtfAm10HVO5xPdXPOSl/jetRpw0vRaA5g==
X-Received: by 2002:ac2:4c0e:0:b0:512:bc93:8640 with SMTP id t14-20020ac24c0e000000b00512bc938640mr2461740lfq.24.1708419709989;
        Tue, 20 Feb 2024 01:01:49 -0800 (PST)
Received: from [192.168.113.175] ([178.197.195.255])
        by smtp.gmail.com with ESMTPSA id r2-20020a05600c35c200b004123b049f86sm14086905wmq.37.2024.02.20.01.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:01:49 -0800 (PST)
Message-ID: <4a89e1327bf1595361c98d200f15a36daefca0a6.camel@gmail.com>
Subject: Re: [PATCH v2 2/5] devtool: code: Add source mapping for debug
 source files
From: adrian.freihofer@gmail.com
To: Enguerrand de Ribaucourt
 <enguerrand.de-ribaucourt@savoirfairelinux.com>, 
 openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com, mohammed.raza@savoirfairelinux.com
Date: Tue, 20 Feb 2024 10:01:47 +0100
In-Reply-To: <20240219165525.714512-3-enguerrand.de-ribaucourt@savoirfairelinux.com>
References: 
	<20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
	 <20240219165525.714512-3-enguerrand.de-ribaucourt@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 09:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195906

On Mon, 2024-02-19 at 17:55 +0100, Enguerrand de Ribaucourt wrote:
> When launching the debug configuration, the source files from the
> debug
> rootfs were openened in the editor instead of the local workspace
> files.
> We add an exception to properly map them to the file being developed
> and
> compiled by the IDE integration. This also more closely matches what
> the
> user would expect compared to native development.
>=20
> This is also true for the devtool fallback mode.

This looks still wrong to me. If files from the rootfs are openend for
a recipe which is in the workspace, the SDK is broken and we need to
understand and fix that. This patch does not solve that, but will make
it much harder to find the right solution for this issue.

Adrian

>=20
> Signed-off-by: Enguerrand de Ribaucourt
> <enguerrand.de-ribaucourt@savoirfairelinux.com>
> ---
> =C2=A0scripts/lib/devtool/ide_plugins/ide_code.py | 1 +
> =C2=A0scripts/lib/devtool/ide_sdk.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A02 files changed, 2 insertions(+)
>=20
> diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py
> b/scripts/lib/devtool/ide_plugins/ide_code.py
> index b2193130d2e..c063b7d0590 100644
> --- a/scripts/lib/devtool/ide_plugins/ide_code.py
> +++ b/scripts/lib/devtool/ide_plugins/ide_code.py
> @@ -234,6 +234,7 @@ class IdeVSCode(IdeBase):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if gdb_cross_config.imag=
e_recipe.rootfs_dbg:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
launch_config['additionalSOLibSearchPath'] =3D
> modified_recipe.solib_search_path_str(
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 gdb_cross_config.image_recipe)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src_f=
ile_map[os.path.join("/usr/src/debug",
> modified_recipe.pn, modified_recipe.pv)] =3D "${workspaceFolder}"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
src_file_map["/usr/src/debug"] =3D os.path.join(
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 gdb_cross_config.image_recipe.rootfs_dbg, "usr",
> "src", "debug")
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> diff --git a/scripts/lib/devtool/ide_sdk.py
> b/scripts/lib/devtool/ide_sdk.py
> index 14679744807..f292edbe25c 100755
> --- a/scripts/lib/devtool/ide_sdk.py
> +++ b/scripts/lib/devtool/ide_sdk.py
> @@ -356,6 +356,7 @@ class RecipeModified:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
'PACKAGE_DEBUG_SPLIT_STYLE')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.path =3D recipe_d.g=
etVar('PATH')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.pn =3D recipe_d.get=
Var('PN')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.pv =3D recipe_d.getVar('=
PV')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.recipe_sysroot =3D =
os.path.realpath(
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
recipe_d.getVar('RECIPE_SYSROOT'))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.recipe_sysroot_nati=
ve =3D os.path.realpath(


