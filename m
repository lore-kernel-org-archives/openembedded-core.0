Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F796C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 20:48:06 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.444.1634158083807410668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 13:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=rX5sen9+;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 993E183598;
	Wed, 13 Oct 2021 22:48:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1634158081;
	bh=r9pCrsQdfdDa6QVA7Ex56qB64WjIZOy0qAk1BDwuRxc=;
	h=Date:From:To:Cc:Subject:From;
	b=rX5sen9+cmNY76aOjD4mW+l5P07rFP3h8QlfCxfw4pypFN8P/v5AKaWuhmB+1xVEO
	 M5Sm7MH+nXsOgnqwcb3y539i9lMttla/T7a50mE3Ba6IxaDA3qnXCzijkrPJDk/QCe
	 0//bcfVwOTA4gqvigfkSt6z87At8dqSHIzoT3EhSYwPUbuds1/0p4pPjwulDrlBGk1
	 UzSlyTL/fSIIInM8t/L38ooR2WEYGhE680JumJ0a7cKTJVtqxUEv/2y1hHCiHu/rs2
	 c8JWScgQ0VEEqXuT+QucyhwX7pP3z9/8SHhNl9dZFYpeyxoO7r/zhopSNtIKA86iBU
	 Pd29X2kcDV5yA==
Date: Wed, 13 Oct 2021 22:47:53 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Carlos O'Donell via Libc-alpha <libc-alpha@sourceware.org>
Cc: libc-alpha <libc-alpha@sourceware.org>, Florian Weimer
 <fweimer@redhat.com>, Patches and  discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: Problem with glibc-locale recipe in yocto after the generic C.UTF-8
 locale were introduced in glibc
Message-ID: <20211013224753.3e2fc0f1@ktm>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/16FIepoD+yuqDWpg9qlk+Xz"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 20:48:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156924

--Sig_/16FIepoD+yuqDWpg9qlk+Xz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Carlos,

I would like to report that the commit:
https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D466f2be6c08070e911=
3ae2fdc7acd5d8828cba50
"Add generic C.UTF-8 locale (Bug 17318)"

causes some issues with Yocto/OE build environment, when glibc-locale
are build.

PATH=3D"/home/lukma/work/yocto/y2038/build/tmp/sysroots-uninative/x86_64-li=
nux/usr/bin:/home/lukma/work/yocto/y2038/poky/scripts:/home/lukma/work/yoct=
o/y2038/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/glibc-locale/2.3=
4-r0/recipe-sys$
/home/lukma/work/yocto/y2038/build/tmp/work/armv7vet2hf-neon-poky-linux-gnu=
eabi/glibc-locale/2.34-r0/locale-tree//usr/share/i18n/locales/C:60:
LC_COLLATE: syntax error
/home/lukma/work/yocto/y2038/build/tmp/work/armv7vet2hf-neon-poky-linux-gnu=
eabi/glibc-locale/2.34-r0/locale-tree//usr/share/i18n/locales/C:61:
LC_COLLATE: empty category description not allowed [error] too many
errors; giving up


=46rom the patch description I've deduced that this change requires some
"ground" work/support for C.UTF-8 locales in the downstream distros.

Apparently poky from newest master (SHA1:
1e2e9a84d6dd81d7f6dd69c0d119d0149d10ade1) doesn't provide necessary
tools/code.

Carlos, do you have any idea what may be missing to make the OE/Yocto
build the glibc-locale again?

Thanks in advance.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/16FIepoD+yuqDWpg9qlk+Xz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmFnRfkACgkQAR8vZIA0
zr3oLggA39FB0T3t2Gnbp68/AY+OlCfHceYn5y9l/tXGEWyfljAWH6C1H1YPiKls
1WK0b+hZPkunnywkxCCmOJ2AhKrCvLF6kVHiw4u4bCWtHAiMg5PptLHRIbkx+Y0K
73E43lpdzv0TM3WNunG8xXGgW0oKwdz3XAFnAYdAK5SYcNEDlnFZniDJ5oZTibEN
zHEIfdp+uhbYDtHh3zeHn1eGL98NWKFJS68qEh0de/zndSfwWs6Lf2dCnewY0PE8
hFHvm5UIMXwL+2NSAyGv1UVZ/zpE2/wJDwpcqt8UK96oTrKwxtPAOqsUt0yt3Cak
3RJ6gd/5JDuJehAQvJvGlUHhQOwCrQ==
=yGj3
-----END PGP SIGNATURE-----

--Sig_/16FIepoD+yuqDWpg9qlk+Xz--

