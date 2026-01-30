Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6948D6B091
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 07:03:47 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5521.1769756624276218369
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 23:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tekj7MFZ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2CB35C22F59;
	Fri, 30 Jan 2026 07:03:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1D376075A;
	Fri, 30 Jan 2026 07:03:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50FC1119A8850;
	Fri, 30 Jan 2026 08:03:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769756621; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I/aPGM4SC45xQvvu2UAMObIzVGmOeEaRI3pUoYX1b+U=;
	b=tekj7MFZ1RCnyNT6YknbprIWbP9aLotDAY9MPFmC/mjZ4Fl7uHhfx6dCX+PEYNvlslWHrL
	dQqDn5kgG62KykqW8OTsFAlk9hA/s51ZfYz3ak8NIX3eiAl009umyAOuciKQjHVgum553W
	WFvP+4Y5IGzTJirjbD/QPdwxQWGf2v6r/LwBPj7v60dHil8KbEdy/K1+X23n04hOakLVwB
	c1bucoWWWDhlWqK97pqFChbSW4RmkZ3R/tvEo12yrw82JWR8gEzpKxao/UlkmTk8D2U4bm
	zfR87xoY1crH9nmNoYYxlQb0mhQWHStvRXUtR1pCsfgtMZ4Y5SkpXOR9+ycC+w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 08:03:38 +0100
Message-Id: <DG1QD2UPJMSH.2VRUB1QKCB6VG@bootlin.com>
Subject: Re: [OE-core][PATCH 4/4] mdadm: upgrade 4.4 -> 4.5
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260126102747.1077552-1-ankur.tyagi85@gmail.com>
 <20260126102747.1077552-4-ankur.tyagi85@gmail.com>
In-Reply-To: <20260126102747.1077552-4-ankur.tyagi85@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 07:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230179

On Mon Jan 26, 2026 at 11:27 AM CET, Ankur Tyagi via lists.openembedded.org=
 wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Changelog:
> https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/tree/CHANGELOG.md?h=
=3Dmdadm-4.5
>
> Replaced 0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
> with 0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch as
> partial changes from first patch are part of the upstream version[1].
>
> Dropped xmalloc.patch which is part of upstream version[2].
>
> Also refreshed other patches.
>
> [1] https://github.com/md-raid-utilities/mdadm/commit/787cc1b60130b8031be=
59e49d54463c58cd8cf74
> [2] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/raid6chec=
k.c?h=3Dmdadm-4.5&id=3De0df6c4c984d564e9e40913727e916a6cd8f466e
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---

Hi Ankur,

Thanks for your patch.

> --- a/meta/recipes-extended/mdadm/mdadm_4.4.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.5.bb
> @@ -13,12 +13,11 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/utils/mdadm=
/mdadm.git;protocol=3Dhttps;bra
>             file://0001-Fix-the-path-of-corosync-and-dlm-header-files-che=
ck.patch \
>             file://mdadm.init \
>             file://0001-Makefile-install-mdcheck.patch \
> -           file://0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largef=
ile.patch \
>             file://0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZER=
O_R.patch \
> -           file://xmalloc.patch \
> +           file://0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-b=
oth.patch \
>             "

You should also remove the two unused patches from git.


Also, we have a second issue: I suspect this upgrade is responsible of
some intermittent reproducibility issue. I already had it twice on my
branch:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/mdadm_4.5-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/mdadm_4.5-r0_x86-64-v3.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/mdadm-4.5-r0.x86_64_v3.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3278
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3274

Corresponding diffoscope output can be found here:

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260129-v__phvnk/=
packages/diff-html/
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260129-5hbi93fk/=
packages/diff-html/

It looks like the difference is some path that is sometimes appearing as
"BINDIR/mdadm" and sometimes as "/sbin/mdadm".

I know these reproducibility issues are not the easiest ones to debug,
but I would appreciate if you could have a look for obvious failure
reasons.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


