Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24694CA1000
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 06:07:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.44336.1756706853072383413
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Aug 2025 23:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ttgGc9cj;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 38716C6B388
	for <openembedded-core@lists.openembedded.org>; Mon,  1 Sep 2025 06:07:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E022560699;
	Mon,  1 Sep 2025 06:07:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D0A21C229E3E;
	Mon,  1 Sep 2025 08:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756706850; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GgMakJYw6lD7OcaFIVGKRKj7UM+J4p7kLnCs/djaY34=;
	b=ttgGc9cjVatAIpGhPqB7p915pZo0dQvnS39Bt/pBkDmXl34zgdjRF4s355SAYRRCGZEGa3
	sFfjA7yWqadfCnQWSNwB8cpGcbs+ZwJhpEiQW+f+iivf6jxo+uP3KsgKKd7VqxQ/nGCI66
	B/K3ETMd6uxT0fTt4GTEasuilBZXOk67LmT13TNXYqffqH7FnIW30Y5mEnnjg1N0gk3z2R
	/8NFAixolm184Ryu83+S92KTO4OoTH3gv/xHb47VsubOuyaVrg3B+eGbQKqm5jxiM5//Xs
	BMxD4VrWF8majz7DwKS7UuaYkCTgsjNmqXvqxkIdP1VcqLgszB2Rc3OHiowJ8g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Sep 2025 08:07:22 +0200
Message-Id: <DCH8LQDR3JGJ.2MH1CYU3GQDRM@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] apt: upgrade 2.6.1 -> 3.0.3
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250828190032.1681715-1-skandigraun@gmail.com>
In-Reply-To: <20250828190032.1681715-1-skandigraun@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 06:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222639

On Thu Aug 28, 2025 at 9:00 PM CEST, Gyorgy Sarvari via lists.openembedded.=
org wrote:
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
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---

Hi Gyorgy,

Thanks for your patch.

It looks like this is breaking a selftest:

2025-08-29 15:00:24,710 - oe-selftest - INFO - runtime_test.TestImage.test_=
testimage_apt (subunit.RemotedTestCase)
2025-08-29 15:00:24,711 - oe-selftest - INFO -  ... FAIL
...
Traceback (most recent call last):
...
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/runtime/cases/apt.py", line 76, in test_apt_install_from_repo
    self.pkg('update')
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/runtime/cases/apt.py", line 19, in pkg
    self.assertEqual(status, expected, message)
AssertionError: 100 !=3D 0 : apt-get update
Ign:1 http://192.168.7.1:37141/all ./ InRelease
Ign:2 http://192.168.7.1:37141/cortexa57 ./ InRelease
Ign:3 http://192.168.7.1:37141/qemuarm64 ./ InRelease
Get:4 http://192.168.7.1:37141/all ./ Release [1215 B]
Get:5 http://192.168.7.1:37141/cortexa57 ./ Release [1221 B]
Get:6 http://192.168.7.1:37141/qemuarm64 ./ Release [1221 B]
Get:7 http://192.168.7.1:37141/all ./ Release.gpg [520 B]
Get:8 http://192.168.7.1:37141/cortexa57 ./ Release.gpg [520 B]
Get:9 http://192.168.7.1:37141/qemuarm64 ./ Release.gpg [520 B]
Ign:7 http://192.168.7.1:37141/all ./ Release.gpg
Ign:8 http://192.168.7.1:37141/cortexa57 ./ Release.gpg
Ign:9 http://192.168.7.1:37141/qemuarm64 ./ Release.gpg
Reading package lists...
W: OpenPGP signature verification failed: http://192.168.7.1:37141/all ./ R=
elease: The following signatures couldn't be verified because the public ke=
y is not available: NO_PUBKEY 7B31316B5D64AD52
E: The repository 'http://192.168.7.1:37141/all ./ Release' is not signed.
W: OpenPGP signature verification failed: http://192.168.7.1:37141/cortexa5=
7 ./ Release: The following signatures couldn't be verified because the pub=
lic key is not available: NO_PUBKEY 7B31316B5D64AD52
E: The repository 'http://192.168.7.1:37141/cortexa57 ./ Release' is not si=
gned.
W: OpenPGP signature verification failed: http://192.168.7.1:37141/qemuarm6=
4 ./ Release: The following signatures couldn't be verified because the pub=
lic key is not available: NO_PUBKEY 7B31316B5D64AD52
E: The repository 'http://192.168.7.1:37141/qemuarm64 ./ Release' is not si=
gned.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2384
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2234
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2167

Can you have a look at the issue please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


