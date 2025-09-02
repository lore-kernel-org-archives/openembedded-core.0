Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DECCA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 10:04:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.73458.1756807459793844008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 03:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Q1ZiFWD8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF41C1A09AA;
	Tue,  2 Sep 2025 10:04:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2EDB60695;
	Tue,  2 Sep 2025 10:04:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 319A61C229FC3;
	Tue,  2 Sep 2025 12:04:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756807456; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NaJu1bqSUkKDRP5rgJKcMFIy+0EnCt8TrEM87ldA6eY=;
	b=Q1ZiFWD8Erx/qAwrJspFVJqbk3FABny9K//T5Eef62VBypbxhOcZvFsSIzyvpS+x3OXQfk
	+l4yCBQUq1ASVGsjN8PoXF1eA/3CBVyUA+OxxRNquAFtALWwyJxUxkJ6Lp6NeucGk4l5YS
	XNPowVjB2cx9B0a9dKjxK3peAHC7fNvICfWqLpiigEwuV0zK3HndCL7s9kRDtQJEMu4zlI
	aoggwupepVwrc4XYRVkyd69KbwXti+M1tzmyEqZCACWpNZnx0z5EobXBCxKs14Vk/aCMlz
	JpQ2l+fM6DHtRSNzQsuPapMlusAapbHXjk8K9TSrC8Gpgv2/JdGuBYmu2aAYhg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Sep 2025 12:04:08 +0200
Message-Id: <DCI89KAUZ6YS.3A65NFQ8FGKFJ@bootlin.com>
Subject: Re: [OE-core] [PATCH v4] apt: upgrade 2.6.1 -> 3.0.3
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250901151529.294450-1-skandigraun@gmail.com>
In-Reply-To: <20250901151529.294450-1-skandigraun@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 10:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222722

On Mon Sep 1, 2025 at 5:15 PM CEST, Gyorgy Sarvari via lists.openembedded.o=
rg wrote:
> Changelog:
> https://metadata.ftp-master.debian.org/changelogs/main/a/apt/apt_3.0.3_ch=
angelog
>
> Dropped patches which are included in this release, or became obsolete:
> 0001-Fix-compilation-error-with-clang-libc-18.patch - included in this re=
lease
> 0001-Fix-musl-build.patch - included in this release
> 0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch - include=
d in this release
> 0001-Remove-using-std-binary_function.patch - became obsolete, fixed upst=
ream
> 0001-aptwebserver.cc-Include-array.patch - became obsolete, fixed upstrea=
m
> 0001-strutl-Add-missing-include-cstdint-gcc-15.patch - included in this r=
elease
>
> Added a new patch to avoid compilation error with musl:
> error: 'basename' was not declared in this scope; did you mean 'rename'?
>
> Adapted DEPENDS list - gnutls and gcrypt dependencies were dropped in fav=
or of openssl
> in version 2.9.19.
>
> Added a new PACKAGECONFIG, 'usrmerge', which displays a gentle warning if=
 the system
> isn't a usrmerge system during package installation.
>
> Added new COMMON_ARCH CMake argument - if it is not defined, CMake is try=
ing to
> determine the value of this variable by running dpkg, which is usually a =
futile
> endeavour. It is used in config creation, and to print some system info.
>
> Also adapt a self test: the apt-key command has been deprecated since a w=
hile,
> and in this release it was completely removed. Instead sources.list file
> contains the signature data, on a per-repository basis.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---

Hi Gyorgy,

Thanks for the new version, but we still have a similar issue:

AssertionError: 100 !=3D 0 : apt-get update
...
W: http://192.168.7.1:32987/all/./Release.gpg: The key(s) in the keyring /e=
tc/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-poky-whinlatter are ignored as t=
he file has an unsupported filetype.
W: OpenPGP signature verification failed: http://192.168.7.1:32987/all ./ R=
elease: The following signatures couldn't be verified because the public ke=
y is not available: NO_PUBKEY 7B31316B5D64AD52
E: The repository 'http://192.168.7.1:32987/all ./ Release' is not signed.
W: http://192.168.7.1:32987/x86-64-v3/./Release.gpg: The key(s) in the keyr=
ing /etc/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-poky-whinlatter are ignore=
d as the file has an unsupported filetype.
W: OpenPGP signature verification failed: http://192.168.7.1:32987/x86-64-v=
3 ./ Release: The following signatures couldn't be verified because the pub=
lic key is not available: NO_PUBKEY 7B31316B5D64AD52
E: The repository 'http://192.168.7.1:32987/x86-64-v3 ./ Release' is not si=
gned.
W: http://192.168.7.1:32987/qemux86_64/./Release.gpg: The key(s) in the key=
ring /etc/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-poky-whinlatter are ignor=
ed as the file has an unsupported filetype.
W: OpenPGP signature verification failed: http://192.168.7.1:32987/qemux86_=
64 ./ Release: The following signatures couldn't be verified because the pu=
blic key is not available: NO_PUBKEY 7B31316B5D64AD52
E: The repository 'http://192.168.7.1:32987/qemux86_64 ./ Release' is not s=
igned.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2182
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2253
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2398

Can you have a look at the issue please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


