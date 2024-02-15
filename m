Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA03C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 23:21:16 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.6726.1708039271986567441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 15:21:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LzZtvJao;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33b401fd72bso130980f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 15:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708039270; x=1708644070; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaL2pZrznx1qs4WV4KDvsj7B78gESua/nKOXRQndI0A=;
        b=LzZtvJaotpsXZZO1qCsd9OjczZS/+KLtEJ9HktstjSBzZ+AKB5CCSDq+0Z/k6CsR70
         VLeQa+loWgNmaUVskM+mRXLRRSn6Hr8/67y3G47A9Uu0KE2On+cAOs01chnpDNIcHB0c
         xgk6Pay+Pj/efhDyjoUG99h541YInmSWlDnSDWgM2RprKlsUVYdIX7DJiIaC61WYOIJd
         MML5Lg46IX3KNyfK5cL+irWho+TJ3S1QTA43ptxjtdcrboGHKQYMqPrkZws9sQedUo6h
         W4XLFlLkezGazA8dvcdXryVIcUBA8P/BKMD6Xug2icrGJCrcCX/mS+GNkL7k0enrjbdK
         osEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708039270; x=1708644070;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yaL2pZrznx1qs4WV4KDvsj7B78gESua/nKOXRQndI0A=;
        b=RYyKS/Px+9ONxRHzYf2KDJjH7sPRDaexGjMnHM0ogfP+L2TzbyqRt9PX46NqLS/jCw
         7iJKB3WLROW8B3i5Cx/CbXayiOWss++xBD8Ry0KH8UyTU+K0pQW5cOslNd9EZBpeGWHc
         6KsGESHcvL02C0/qMxJXTDedQfFcOxYQBNRqMMwBLI8tXEXF3jopy5uZpyS2CEPbQSYB
         W2VBOVu7a7mxWJcZdGOGoqqM8NddX8z4Cx+EIoWhQgWE3yCIinHE2eG81cj+rjfTkT57
         lijnz1PpA1cM4lTBXaMX8PHXtB8kH6tOCRl74fmRMWvH2mL+73VDRwPWsiC+exyGLJX6
         fqwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4m/VT1vRxyuAE4kcTyHbewMYhioh9owu4l18PBgMFTULfw4/h3bbwU4chfPfIiern/10V31QlDteUvi8GXTF+mJHAqMt3CwyqT7o+oJRLtcV54dQ5uIA4
X-Gm-Message-State: AOJu0YzpIxAUI1zF+VOSNShGve1i6JF34B/qs3b7T0H2PooTJRGORn+e
	wPr4BvL+m3GRiSpIv64naKuvmRbxNI5fcwa4jEQZ5SP4jIf4c+2F4+odo3opY9s=
X-Google-Smtp-Source: AGHT+IFwgBjOuJG24eEpvXkp8+wKFj4ST6SEga9bC2O6cBqFHgyl1+nedJEk5LTF3eknq0OdECIDxg==
X-Received: by 2002:a5d:4a11:0:b0:33a:eb25:31a2 with SMTP id m17-20020a5d4a11000000b0033aeb2531a2mr1855354wrq.67.1708039270339;
        Thu, 15 Feb 2024 15:21:10 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id e5-20020adffd05000000b0033cf0f5a01fsm457072wrr.33.2024.02.15.15.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 15:21:09 -0800 (PST)
Message-ID: <0238d631c170a7fb72457dec62405c882551cfd6.camel@gmail.com>
Subject: Re: [PATCH 3/6] devtool: code: Add source mapping for debug source
 files
From: adrian.freihofer@gmail.com
To: Enguerrand de Ribaucourt
 <enguerrand.de-ribaucourt@savoirfairelinux.com>, 
 openembedded-core@lists.openembedded.org
Date: Fri, 16 Feb 2024 00:21:09 +0100
In-Reply-To: <20240215170422.659073-4-enguerrand.de-ribaucourt@savoirfairelinux.com>
References: 
	<20240215170422.659073-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
	 <20240215170422.659073-4-enguerrand.de-ribaucourt@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 23:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195730

On Thu, 2024-02-15 at 18:04 +0100, Enguerrand de Ribaucourt wrote:
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

This sounds a little bit unexpected to me. With devtool deploy-target
the binaries which are copied to the target device have still the
absolute rpath from the real build host. The are not packaged.

I would expect something like this when a packaged binary would be
debugged. But I'm not sure if that would make sense and should be
supported.

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
> index a82ab572998..1e36f2b2093 100755
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


