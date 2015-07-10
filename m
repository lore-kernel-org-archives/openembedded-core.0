Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 68B586E5F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 09:09:38 +0000 (UTC)
Received: by widjy10 with SMTP id jy10so9858733wid.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 02:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=f8XUsLRRGReXNSBkP5B+beANItE5aVHnOckZQT6zDWw=;
	b=pdEcj+S77Y0v6OukS9eiR5GmFLHJIvfF4K6IuMkVDQbN4kmJHTAOhA3P23ko4yPcbF
	LcWMEhrz5BOFGpc2vZAAAQJpFUntVwyJIGsqRtfBuI5SvhWjSlujFd6IdhpYm/jk4M/N
	Zzzykfcjuva5vJWMPZpWCx7MtV/e8XK0YNNMdPTJU21fIAflNVsm6uOlvSd5b3QcGP+y
	44usiKFTAYTbhryMVOJoG6s19qeS1xAhb8uAUTcBTYuHUNyy/6j5gxSq+U7tppWXaPJK
	tN1siVHFn/0vErq4ADN9plKJmS9wBDx9SynZhJEq3LvriCI1J6e4O0a79L8qJsl2ujwH
	yhtA==
X-Received: by 10.180.37.133 with SMTP id y5mr4214416wij.7.1436519377996;
	Fri, 10 Jul 2015 02:09:37 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	e2sm12643203wjw.12.2015.07.10.02.09.36
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 10 Jul 2015 02:09:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1436518495-27392-1-git-send-email-rongqing.li@windriver.com>
Date: Fri, 10 Jul 2015 11:09:52 +0200
Message-Id: <8B7C6968-8868-4888-9E67-E6B131014CB3@gmail.com>
References: <1436518495-27392-1-git-send-email-rongqing.li@windriver.com>
To: rongqing.li@windriver.com
X-Mailer: Apple Mail (2.2102)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][resend] perl: fix build failure if building dir has the "blib" string
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jul 2015 09:09:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

When build dir includes contain blib, there is an error which should be =
solved first.

Can you please give an example where this condition is true?
And maybe refer where you reported it upstream?

Best regards,
Jens

> Am 10.07.2015 um 10:54 schrieb rongqing.li@windriver.com:
>=20
> From: Wenzong Fan <wenzong.fan@windriver.com>
>=20
> If build dir includes the string "blib", filter it out from @INC may =
empty
> the @INC and cause build errors like:
>=20
>  Can't locate ExtUtils/MakeMaker.pm in @INC \
>  (you may need to install the ExtUtils::MakeMaker module) \
>  (@INC contains: .) at Makefile.PL
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
> meta/recipes-devtools/perl/perl-native_5.22.0.bb   |  1 +
> ...-PathTools-don-t-filter-out-blib-from-INC.patch | 33 =
++++++++++++++++++++++
> meta/recipes-devtools/perl/perl_5.22.0.bb          |  1 +
> 3 files changed, 35 insertions(+)
> create mode 100644 =
meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-=
INC.patch
>=20
> diff --git a/meta/recipes-devtools/perl/perl-native_5.22.0.bb =
b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
> index dbcf2a6..a9a1cab 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.22.0.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
> @@ -8,6 +8,7 @@ SRC_URI +=3D "\
>            file://MM_Unix.pm.patch \
>            file://debian/errno_ver.diff \
>            file://dynaloaderhack.patch \
> +           file://perl-PathTools-don-t-filter-out-blib-from-INC.patch =
\
>           "
>=20
> SRC_URI[md5sum] =3D "ff0f09b17de426eff323426cb140ee79"
> diff --git =
a/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-fro=
m-INC.patch =
b/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-fro=
m-INC.patch
> new file mode 100644
> index 0000000..7dd9041
> --- /dev/null
> +++ =
b/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-fro=
m-INC.patch
> @@ -0,0 +1,33 @@
> +=46rom 90c252cecc38aed5d5faedb30485dd6eee2e54eb Mon Sep 17 00:00:00 =
2001
> +From: Wenzong Fan <wenzong.fan@windriver.com>
> +Date: Wed, 11 Feb 2015 15:14:40 +0800
> +Subject: [PATCH] perl / PathTools: don't filter out blib from @INC
> +
> +If $TOPDIR includes the string "blib", filter it out from @INC may =
empty
> +the @INC and cause build errors like:
> +
> +  Can't locate ExtUtils/MakeMaker.pm in @INC \
> +  (you may need to install the ExtUtils::MakeMaker module) \
> +  (@INC contains: .) at Makefile.PL
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> +---
> + dist/PathTools/Makefile.PL | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/dist/PathTools/Makefile.PL b/dist/PathTools/Makefile.PL
> +index 1b21de4..f562cb2 100644
> +--- a/dist/PathTools/Makefile.PL
> ++++ b/dist/PathTools/Makefile.PL
> +@@ -1,6 +1,3 @@
> +-
> +-BEGIN { @INC =3D grep {!/blib/} @INC }
> +-
> + require 5.005;
> + use ExtUtils::MakeMaker;
> + WriteMakefile
> +--=20
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb =
b/meta/recipes-devtools/perl/perl_5.22.0.bb
> index 050a98c..7f78998 100644
> --- a/meta/recipes-devtools/perl/perl_5.22.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
> @@ -61,6 +61,7 @@ SRC_URI +=3D " \
>         file://t-run-switches.t-perl5-perl.patch \
>         file://ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch =
\
>         =
file://ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch \
> +        file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
> "
>=20
> # Fix test case issues
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Jens Rehsack - rehsack@gmail.com


