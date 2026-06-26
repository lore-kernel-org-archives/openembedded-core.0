Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87377CDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 11:20:24 +0000 (UTC)
Received: from mail-244118.protonmail.ch (mail-244118.protonmail.ch [109.224.244.118])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33205.1782472816800328336
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 04:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail3 header.b=vWzxLZvu;
 spf=pass (domain: geanix.com, ip: 109.224.244.118, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1782472814; x=1782732014;
	bh=SidadyCfv4RvFF0u4R2nZWZQn4mPZdjnR16mhxqsGB4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=vWzxLZvumjLjpESdkpYUhRHWWBogi9D4M5fUhZcM4MtY/JQ45ddh0FEBLsCFrkcJC
	 +6BHH2k4HN14ITiEuAXKUgVCBUiaxfCqWjUF6P/aI8sUzzi4C2I7k1/egKR+ypgRrP
	 3LGqxRXvbBMYsV0/OAMcuCfXbeP4L6jSf7Yl5tOa4oL5QXv5ZJ0eEfXauUjyrj+jP4
	 ZQpHMO/6mQ+xmXJ1Yn3ykEH29Am619BTA22sLPaRwFrOD9bpo/x1g/hq5JXE1Fu/9v
	 qgYNFVsdQ4YLP7KUs/ljxQKQSXyua8TIfJT0lpcuhiQ6UvRr+iPkGdZ+DK7FCSD2/D
	 Tr5sYfMh/vtqA==
Date: Fri, 26 Jun 2026 11:20:10 +0000
To: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org
From: =?utf-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: Re: [OE-core] [PATCH v2] sanity.bbclass: warn on cargo config files outside the build tree
Message-ID: <22e6d6813c9c58269482eb3f3031fc7ba38af8aa.camel@geanix.com>
In-Reply-To: <20260625065213.2634586-1-Hemanth.KumarMD@windriver.com>
References: <20260625065213.2634586-1-Hemanth.KumarMD@windriver.com>
Feedback-ID: 134068524:user:proton
X-Pm-Message-ID: 0d0aa5804537ccb9131f344f020de0ec6a58906f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 11:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239625

Hi Hemanth,

On Wed, 2026-06-24 at 23:52 -0700, Hemanth Kumar M D via
lists.openembedded.org wrote:
> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>=20
> Cargo walks from CWD up to the filesystem root merging every
> .cargo/config[.toml] it finds. Any such file above BASE_WORKDIR is
> silently picked up and can override Yocto's linker, registry or
> compiler settings, leading to build failures.
>=20
> Until cargo provides a proper fix upstream, add a warning so users
> get a clear diagnostic instead of a build error.
>=20
> Upstream meta-issue: https://github.com/rust-lang/cargo/issues/9769
>=20
> [YOCTO #15637]
>=20
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---
> =C2=A0meta/classes-global/sanity.bbclass | 33
> ++++++++++++++++++++++++++++++
> =C2=A01 file changed, 33 insertions(+)
>=20
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-
> global/sanity.bbclass
> index bdfa7f059d..5c5cf311da 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -854,6 +854,38 @@ def sanity_check_locale(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 except locale.Error:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise_sanity_error("Your=
 system needs to support the
> en_US.UTF-8 locale.", d)
>=20
> +def check_cargo_config(d):
> +=C2=A0=C2=A0=C2=A0 # Cargo merges .cargo/config[.toml] from every direct=
ory between
> CWD and
> +=C2=A0=C2=A0=C2=A0 # the filesystem root. Warn for anything found in anc=
estor
> directories
> +=C2=A0=C2=A0=C2=A0 # above BASE_WORKDIR that Cargo would pick up silentl=
y.
> +=C2=A0=C2=A0=C2=A0 import os
> +
> +=C2=A0=C2=A0=C2=A0 base_workdir =3D d.getVar('BASE_WORKDIR')
> +=C2=A0=C2=A0=C2=A0 ancestor =3D os.path.dirname(base_workdir)
> +=C2=A0=C2=A0=C2=A0 found =3D []
> +=C2=A0=C2=A0=C2=A0 last_ancestor =3D None
> +=C2=A0=C2=A0=C2=A0 while True:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for name in ('config', 'confi=
g.toml'):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cfg =
=3D os.path.join(ancestor, '.cargo', name)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if os=
.path.exists(cfg):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 found.append(cfg)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 last_ancestor =3D ancestor
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 break
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parent =3D os.path.dirname(an=
cestor)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if parent =3D=3D ancestor:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ancestor =3D parent

This can easier be implemented using pathlib.Path:

  from pathlib import Path

  base_workdir =3D Path(d.getVar('BASE_WORKDIR'))

  for path in base_workdir.parents:
      for config in (".cargo/config", ".cargo/config.toml"):
          if path.joinpath(config).exists():
              found.append(path / config)

// Martin

> +
> +=C2=A0=C2=A0=C2=A0 if found:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn("Cargo config file(s)=
 found at %s which is/are
> outside the build "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "directory. Cargo will silently apply their settings
> during the "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "rust/cargo build and can override Yocto's settings
> like linker, "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "registry or compiler settings causing build
> failures. You can "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "either remove these file(s) or move your build
> directory outside "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "of %s to fix this. "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "See
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15637=C2=A0for more
> details."
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 % (', '.join(found), last_ancestor))
> +
> =C2=A0def check_sanity_everybuild(status, d):
> =C2=A0=C2=A0=C2=A0=C2=A0 import os, stat
> =C2=A0=C2=A0=C2=A0=C2=A0 # Sanity tests which test the users environment =
so need to run
> at each build (or are so cheap
> @@ -873,6 +905,7 @@ def check_sanity_everybuild(status, d):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status.addresult('Bitbak=
e version %s is required and version
> %s was found\n' % (minversion, bb.__version__))
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 sanity_check_locale(d)
> +=C2=A0=C2=A0=C2=A0 check_cargo_config(d)
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 paths =3D d.getVar('PATH').split(":")
> =C2=A0=C2=A0=C2=A0=C2=A0 if "." in paths or "./" in paths or "" in paths:
> --
> 2.49.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239544):
> https://lists.openembedded.org/g/openembedded-core/message/239544
> Mute This Topic: https://lists.openembedded.org/mt/119970000/3618414
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> martin@geanix.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


