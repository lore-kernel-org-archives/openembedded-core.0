Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD19CAC5B8
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 13:23:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.10383.1759670598002117108
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 06:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=z617nHX0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 15CEF4E40EB5;
	Sun,  5 Oct 2025 13:23:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CEAD7606C7;
	Sun,  5 Oct 2025 13:23:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43F31102F1D16;
	Sun,  5 Oct 2025 15:23:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759670595; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2qCS8dGOU8W+KJJNMTTesdp8EtgxmVE/ikX/rFkBDU4=;
	b=z617nHX07ypC1W/B/1BhjaTPRSbyZ/jYu/qpdUq0grEbj6D1DBM111d3oMnhvukYa2zEm4
	6rORMt8B6bFiWiQgB/9kI/VRCGFwkjaCDFdnLZ3Q6kIlS1W6BddQxSe+ApZ/LaLuEn7ny3
	YYIwk749v+SBut3JfUI11v4ZSaclH/ui+Xw97MOuc5f4NGx+eOoBC6HSENa9gAKYY353xK
	mWL3SUvdtD4fEbFWAriPQKXiPjrW+Q/bPVycp9EN0iRExbptPZuUeKb217d53EBgQXhuXr
	cBxkQwJdwjxdu0/pXb3OcZnPKikZk9BlVEFI5Eh5yAA/YPVCtzBDJncITKlBGA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Oct 2025 15:23:13 +0200
Message-Id: <DDAF5YSSFJS8.2RCPLOVKYH00N@bootlin.com>
Cc: "Tom Geelen" <t.f.g.geelen@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH] cargo_common.bbclass: use source
 replacement instead of dependency patching
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251003213000.2256939-1-skandigraun@gmail.com>
In-Reply-To: <20251003213000.2256939-1-skandigraun@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 13:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224438

On Fri Oct 3, 2025 at 11:30 PM CEST, Gyorgy Sarvari via lists.openembedded.=
org wrote:
> Cargo.toml files usually contain a list of dependencies in one of two for=
ms:
> either a crate name that can be fetched from some registry (like crates.i=
o), or
> as a source crate, which is most often fetched from a git repository.
>
> Normally cargo handles fetching the crates from both the registry and fro=
m git,
> however with Yocto this task is taken over by Bitbake.
>
> After fetching these crates, they are made available to cargo by adding t=
he location
> to $CARGO_HOME/config.toml. The source crates are of interest here: each =
git repository
> that can be found in the SRC_URI is added as one source crate.
>
> This works most of the time, as long as the repository really contains on=
e crate only.
>
> However in case the repository is a cargo workspace, it contains multiple=
 crates in
> different subfolders, and in order to allow cargo to process them, they n=
eed to be
> listed separately. This is not happening with the current implementation =
of cargo_common.
>
> This change introduces the following:
> - instead of patching the dependencies, use source replacement (the prima=
ry motivation for
>   this was that maturin seems to ignore source crate patches from config.=
toml)
> - the above also allows to keep the original Cargo.lock untouched (the or=
iginal implementation
>   deleted git repository lines from it)
> - it adds a new folder, currently ${UNPACKDIR}/yocto-vendored-source-crat=
es. During processing
>   the separate crate folders are copied into this folder, and it is used =
as the central
>   vendoring folder. This is needed for source replacements: the folder th=
at is used for
>   vendoring needs to contain the crates separately, one crate in one fold=
er. Each folder
>   has the name of the crate that it contains. Workspaces are not included=
 here (unless the
>   given manifest is a workspace AND a package at once)
> - previuosly the SRC_URI had to contain a "name" and a "destsuffix" param=
eter to be considered
>   to be a rust crate. The name is not derived from the Cargo.toml file, n=
ot from the SRC_URI.
>   Having destsuffix is still mandatory though.
>
> The change does not handle nested workspaces, only the top level Cargo.to=
ml is processed.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> Cc: Tom Geelen <t.f.g.geelen@gmail.com>
>
> ---

Hi Gyorgy,

I know this is just an RFC, but I still took it for a run on the
autobuilder. It looks like id does break rust build:

ERROR: rust-native-1.90.0-r0 do_configure: Error executing a python functio=
n in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was=
:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:cargo_common_do_patch_paths(d)
     0003:
File: '/srv/pokybuild/yocto-worker/genericx86-64/build/meta/classes-recipe/=
cargo_common.bbclass', lineno: 182, function: cargo_common_do_patch_paths
     0178:    lockfile =3D d.getVar("CARGO_LOCK_PATH")
     0179:    if not os.path.exists(lockfile):
     0180:        bb.fatal(f"{lockfile} file doesn't exist")
     0181:
 *** 0182:    lockfile =3D load_toml_file(lockfile)
     0183:
     0184:    # key is the repo url, value is a boolean, which is used late=
r
     0185:    # to indicate if there is a matching repository in SRC_URI al=
so
     0186:    lockfile_git_repos =3D {}
File: '/srv/pokybuild/yocto-worker/genericx86-64/build/meta/classes-recipe/=
cargo_common.bbclass', lineno: 137, function: load_toml_file
     0133:        cargo_toml_path =3D os.path.join(path, 'Cargo.toml')
     0134:        return os.path.exists(cargo_toml_path)
     0135:
     0136:    def load_toml_file(toml_path):
 *** 0137:        import tomllib
     0138:        with open(toml_path, 'rb') as f:
     0139:            toml =3D tomllib.load(f)
     0140:        return toml
     0141:
Exception: ModuleNotFoundError: No module named 'tomllib'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2528
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2505
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2543
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2497

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


