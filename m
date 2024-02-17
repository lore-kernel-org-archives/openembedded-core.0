Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E7AC48BC4
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 23:10:18 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.8426.1708211416735945755
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Feb 2024 15:10:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2Fh0oOh6;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.171, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcdb210cb6aso3495913276.2
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 15:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708211416; x=1708816216; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1g8bpI4nMlqZioAzoF7EmJmTh8Fq9w1yGtuZO44vsY=;
        b=2Fh0oOh6yXvKfCDTtmLePSNXVOE3kSCYblFCdIC4yw7oh2xoRRezfPaz17fbteYggi
         cGL6D+suc3rgesr12TTKPeJvyAo2Lyzm5Ot72qSDh10PTUCJtPUHG2xeqzvOUueFTBjN
         CKLwA4AhZslDbuvNYIK7m3rYfQJ2q7zZeO48zVYUymKG1bZ7atW/1SYgJN45G6rWWy1j
         WQYjSu+0gxiixu27MeEtQySTtbCeE0gc1pqrrBOl6PnXaO3kKkcFKdKy6KbawdJ3e2oW
         Tfbd+ZMgvACgdYWUa+hn0AZDcgcA0ukJYlSAJM725eZZFn2z2DxPXT4y2laEODHLp7As
         f8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708211416; x=1708816216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1g8bpI4nMlqZioAzoF7EmJmTh8Fq9w1yGtuZO44vsY=;
        b=CVmLLzseZV3fudufazuYbZMKtZsevnkSJcuqOngYIUOn8fAUuqBSMrxc4sRT9uELia
         LLnNtXCu7HzjDMuUBUoXwlY8Slg/6zE3QAoq2giWwTDW76k5DIHnW8ctqBt1KBfzB4Xv
         sA9prPIEeg3Kw02CeoykR1bX9E3bWMi/dy5K2lbdM7XrtwRz+OzjupoVfotm5c9Dg2xW
         y6E0ptrYv8WJwYaqXryoLagVKdt4dL+kgvSepW5lpqK0uZdQbpMm+FYBqM3G0b3Zlwpz
         AS2XnkTBYrRrgpgCtPKy4rbXpHYbRs1O4uLnW/WCo75jw4xUOUnoYUuV/WiZhgdm/GfS
         9kcQ==
X-Gm-Message-State: AOJu0YwLBjayhb+jEQZtq2337XuAlEOt2GnwjO/n6aPnPJVbWuSnPwA0
	b9lYPKzZWyYMxQccKQRJXabZnpZLDSXP3wzWGlSg+WrdXZXMZbnZ/VpgVhqPcpPVjWK1UCSNciq
	Fhk8vnkFStyDwTdYlfvVr57//r9bMWqt68RMuDg==
X-Google-Smtp-Source: AGHT+IF0uNBlL8dJw1AfXhnWGTAd7fQIFVy1Pw/hVJpUA7wFtU2GMJInqeoMFSIv81VMDfBrZ3oE+Cx8FtSsrT3dI3M=
X-Received: by 2002:a05:6902:1ac2:b0:dcd:8a5:d5b8 with SMTP id
 db2-20020a0569021ac200b00dcd08a5d5b8mr9347999ybb.49.1708211415784; Sat, 17
 Feb 2024 15:10:15 -0800 (PST)
MIME-Version: 1.0
References: <20240215221711.332614-1-adrian.freihofer@siemens.com> <20240215221711.332614-7-adrian.freihofer@siemens.com>
In-Reply-To: <20240215221711.332614-7-adrian.freihofer@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 17 Feb 2024 13:10:04 -1000
Message-ID: <CAOSpxdY7bLGFDm3iGK+58s9=CBeC3NksbW2Ose9JgSbwaapU7g@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 06/12] oeqa/selftest/recipetool: fix
 for python 3.12
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 23:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195818

I'm getting oe-selftest errors on all distros that seem to be related
to this patch.

Here are a couple of representative logs:

https://errors.yoctoproject.org/Errors/Details/753468/
https://errors.yoctoproject.org/Errors/Details/753470/

Thanks,

Steve

On Thu, Feb 15, 2024 at 12:17=E2=80=AFPM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> From: Adrian Freihofer <adrian.freihofer@gmail.com>
>
> test_recipetool_create_github and test_recipetool_create_github_tarball
> fail because the old meson version used by these tests cases does not
> run on Python 3.12. The issue is in the dependencies.py which comes with
> meson:
> ERROR: build/tmp/work/recipetool-3z4osyl7/source/git/mesonbuild/
>        dependencies.py:777: SyntaxWarning: invalid escape sequence '\.'
>
> Use meson 1.3.1 (what is currently also used on master) as a reference
> for these tests.
>
> With this version of meson, recipetool creates recipes named
> meson_git.bb or meson_1.3.1.bb. Since this looks more reasonable than
> e.g. python3-meson_git.bb the test gets adapted.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Backported from master: 7374a8a2810a6cf027bfefefe87691a3529123ff
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/lib/oeqa/selftest/cases/recipetool.py | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/s=
elftest/cases/recipetool.py
> index db8790b57b..db21325155 100644
> --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> @@ -444,13 +444,13 @@ class RecipetoolCreateTests(RecipetoolBase):
>          temprecipe =3D os.path.join(self.tempdir, 'recipe')
>          os.makedirs(temprecipe)
>          recipefile =3D os.path.join(temprecipe, 'meson_git.bb')
> -        srcuri =3D 'https://github.com/mesonbuild/meson;rev=3D0.32.0'
> +        srcuri =3D 'https://github.com/mesonbuild/meson;rev=3D1.3.1'
>          result =3D runCmd(['recipetool', 'create', '-o', temprecipe, src=
uri])
>          self.assertTrue(os.path.isfile(recipefile))
>          checkvars =3D {}
> -        checkvars['LICENSE'] =3D set(['Apache-2.0'])
> -        checkvars['SRC_URI'] =3D 'git://github.com/mesonbuild/meson;prot=
ocol=3Dhttps;branch=3Dmaster'
> -        inherits =3D ['setuptools3']
> +        checkvars['LICENSE'] =3D set(['Apache-2.0', 'Proprietary', 'Unkn=
own'])
> +        checkvars['SRC_URI'] =3D 'git://github.com/mesonbuild/meson;prot=
ocol=3Dhttps;branch=3D1.3'
> +        inherits =3D ['python_setuptools_build_meta']
>          self._test_recipe_contents(recipefile, checkvars, inherits)
>
>      def test_recipetool_create_python3_setuptools(self):
> @@ -476,15 +476,15 @@ class RecipetoolCreateTests(RecipetoolBase):
>          # Basic test to ensure github URL mangling doesn't apply to rele=
ase tarballs
>          temprecipe =3D os.path.join(self.tempdir, 'recipe')
>          os.makedirs(temprecipe)
> -        pv =3D '0.32.0'
> +        pv =3D '1.3.1'
>          recipefile =3D os.path.join(temprecipe, 'meson_%s.bb' % pv)
>          srcuri =3D 'https://github.com/mesonbuild/meson/releases/downloa=
d/%s/meson-%s.tar.gz' % (pv, pv)
>          result =3D runCmd('recipetool create -o %s %s' % (temprecipe, sr=
curi))
>          self.assertTrue(os.path.isfile(recipefile))
>          checkvars =3D {}
> -        checkvars['LICENSE'] =3D set(['Apache-2.0'])
> +        checkvars['LICENSE'] =3D set(['Apache-2.0', 'Proprietary', 'Unkn=
own'])
>          checkvars['SRC_URI'] =3D 'https://github.com/mesonbuild/meson/re=
leases/download/${PV}/meson-${PV}.tar.gz'
> -        inherits =3D ['setuptools3']
> +        inherits =3D ['python_setuptools_build_meta']
>          self._test_recipe_contents(recipefile, checkvars, inherits)
>
>      def _test_recipetool_create_git(self, srcuri, branch=3DNone):
> --
> 2.43.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195717): https://lists.openembedded.org/g/openembedde=
d-core/message/195717
> Mute This Topic: https://lists.openembedded.org/mt/104382812/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

