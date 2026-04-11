Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E215CF44842
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 07:28:16 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.183101.1775892492983762510
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Apr 2026 00:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S9zI3FLx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cf8fe9c2aso1812670f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775892491; x=1776497291; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bE44W/BKzw+UhjIDEi06bgJoZmDk7ZD8N87IVhxPSmw=;
        b=S9zI3FLxZBcWommDz1ZXD7qIzv47GkWdQMd6uLa2Fe+Z/Z8Q4VAakiDpk1cJAvptr9
         +tAL0611JmURCQoUCW64MWGMpBlGvW9H/TZ4BMr/VGCAn2slsd8jAJRnb5fQ6IcdSGjb
         DqkRTkYS47zHcWQnUl+qM3sEHR1/CZnibh8gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775892491; x=1776497291;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bE44W/BKzw+UhjIDEi06bgJoZmDk7ZD8N87IVhxPSmw=;
        b=H5qlD10QO13V/AtIkriVvSHvVNgM3Tv4iECA6nPyN/zZS7k6b+Gyee48ZM3WS8ib0c
         wId4mOkF5dZDFdUBWNpzjMxYNk25w9v7wrWOJKhmQ79CGdLr2zTYdvPC9C3q5J3dhLWH
         1ymyLsxJbknDMAFrA8V4Ccf6YHrP/h6HdYtR6QeMl194lahdjF/7i3+KNoJIDH7pYBbX
         nDUm3gvDn6x5t2xRSiD6yfzVQzzqpkG64GKeU8X6z7gcmqAi5g0TG7FBuVN63be+Ko9f
         8EjGiGAC1fYnkSwq873PlB78uOmnNK/3xBf0MU1MkoF3Pcb0+3N7ZV/hSalLq7tU1U0u
         o7kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVc7j+Gr8kiMoxhcKAnKhsrpo56pH2W5Zg5Ap6dZbjhgkwYJY3VqStmr7vLEA11IG3ApXZ+ozXxvlLOnUJRxFfDg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzCDjpvjHaXZnTh7COf2mzbSxrXblr171NUfieNbl9kj0W4zTB4
	YmbyN/4eMc5hhN2lsYuV2Y80evRqQZIyijOGdNe9d8+XCGkdzbhsRLZyZpmUPluv3wc=
X-Gm-Gg: AeBDietf+S1PNEEimDwJFkpgjRMvh6tTDnPW+A0RTlyeWNs+v05khqqnZJS9KeBPUqe
	mmx+3h0EI/oCWq6yCcCsI3/IKVnIx8axbcwKRA67aqIcZenihl2o12HQgLcr/4dFxVmKjBR2cW/
	pyieh6H2UHzv/qEevJJLIXTCpgjdrkRcY6Yu4SvV3nTFI60OyXeWRjnwojg9zu5ctuSzvZcijga
	S6yHGkeYoicucyCZ+77zbfZxorns/kSF0UFuHOiFsStGRf1MW5p5MF0+jcV6bwSaiuL3Bps3NZj
	vc8P5CYp8WsYH1//Kh80L7Xu13Kkhu8yMhH5vDlr/mSeFAFLM6DXZ1iYkZMGtXC+YViYeVA7QJq
	p23/jZsHwe75sFl7wpCF5PZpvfQkGs1OJ1BYcLeZAFwuE7+zb6QHEUArKoZGjApk2McBJ4eHrl2
	TmtLcLsMgxWhelSws5mT7CbG2lfFkPE0cYGMKx1GhwlFX8/yUaeGkkdhVZbj3DEDHCsgpzjLXQG
	6HlUs0wD6V6BflG
X-Received: by 2002:a05:6000:24c6:b0:439:b619:33b2 with SMTP id ffacd0b85a97d-43d642c8894mr8985462f8f.43.1775892491325;
        Sat, 11 Apr 2026 00:28:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:99d1:9089:a726:87e6? ([2001:8b0:aba:5f3c:99d1:9089:a726:87e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5d85fsm12748056f8f.36.2026.04.11.00.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 00:28:10 -0700 (PDT)
Message-ID: <f3daae4a20bccd2286f85b492b11bbae866b78d5.camel@linuxfoundation.org>
Subject: Re: [OE-core][kirkstone 1/1] oeqa/selftest/git-submodule-test:
 Default to https git protocol for YP/OE repos
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Date: Sat, 11 Apr 2026 08:28:09 +0100
In-Reply-To: <b507de6d469890f14d153c0eb48361d97d24a71e.1775823919.git.yoann.congal@smile.fr>
References: <cover.1775823919.git.yoann.congal@smile.fr>
	 <b507de6d469890f14d153c0eb48361d97d24a71e.1775823919.git.yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 07:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235044

On Fri, 2026-04-10 at 14:27 +0200, Yoann Congal via lists.openembedded.org =
wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>=20
> Following up on commit 139102a73d41 ("recipes: Default to https git proto=
col where possible"),
> > The recommendation from server maintainers is that the https protocol
> > is both faster and more reliable than the dedicated git protocol at thi=
s point.
> > Switch to it where possible.
>=20
> Use ";protocol=3Dhttps" for the parent git submodule and, also, update th=
e
> SRCREV to point to a commit where submodules are reference through a
> https:// URL instead of a git:// one.
>=20
> Update the expected output of the archiver test.
>=20
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> =C2=A0.../recipes-test/git-submodule-test/git-submodule-test.bb=C2=A0=C2=
=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0meta/lib/oeqa/selftest/cases/archiver.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A02 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-=
test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.=
bb
> index fa3041b7d8f..3f66cf6919d 100644
> --- a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
> +++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md=
5=3D0835ade698e0bcf8506ecda
> =C2=A0
> =C2=A0INHIBIT_DEFAULT_DEPS =3D "1"
> =C2=A0
> -SRC_URI =3D "gitsm://git.yoctoproject.org/git-submodule-test;branch=3Dma=
ster"
> -SRCREV =3D "a2885dd7d25380d23627e7544b7bbb55014b16ee"
> +SRC_URI =3D "gitsm://git.yoctoproject.org/git-submodule-test;branch=3Dma=
ster;protocol=3Dhttps"
> +SRCREV =3D "f280847494763cdcf71197557a81ba7d8a6bce42"
> =C2=A0
> =C2=A0S =3D "${WORKDIR}/git"
> =C2=A0
> diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/sel=
ftest/cases/archiver.py
> index 75195241b79..ad2dd2dda65 100644
> --- a/meta/lib/oeqa/selftest/cases/archiver.py
> +++ b/meta/lib/oeqa/selftest/cases/archiver.py
> @@ -301,8 +301,8 @@ class Archiver(OESelftestTestCase):
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb_vars =3D get_bb_vars(=
['DEPLOY_DIR_SRC'])
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for target_file_name in =
[
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'gits=
mshallow_git.yoctoproject.org.git-submodule-test_a2885dd-1_master.tar.gz',
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'gits=
mshallow_git.yoctoproject.org.bitbake-gitsm-test1_bare_120f4c7-1.tar.gz',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'gits=
mshallow_git.yoctoproject.org.git-submodule-test_f280847-1_master.tar.gz',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'gits=
mshallow_git.yoctoproject.org.bitbake-gitsm-test1_bare_79a0efa-1.tar.gz',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test2_bare_f66699e-1.tar.g=
z',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
'gitsmshallow_git.openembedded.org.bitbake_bare_52a144a-1.tar.gz',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
'gitsmshallow_git.openembedded.org.bitbake_bare_c39b997-1.tar.gz'

Does master need that? At a quick look it probably should...

I'm wondering if this should be using an isolated downloads directory
for the test and it is seeing files from previous builds?

Cheers,

Richard

