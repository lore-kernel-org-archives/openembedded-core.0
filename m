Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9F4126AC3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 10:07:50 +0000 (UTC)
Received: by wiwl6 with SMTP id l6so42014524wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 03:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=enUfwEpWzmlIWR5BlU62A7Lie8w1L5L3nm0niyJ3Pm4=;
	b=xCtMnotGTWjwkm+C5cnDtYXegc0W7oJ0RxIEgSppe8Zz8R4bMoeAjnjQJMGmqRZL2P
	vJ9oJWHa8Booazqry/6FiCoIYbwgZMSk4QvSJsc8Klltk2uJvRKxNlbYdismH94vp93U
	9L5ecvgrW22xcP3BEcoLNdKkq3zxRwbnONuQBSFrOu+34eOzL8KYxLk3rPS9R4I/PcoG
	aBwBLI2jr8KZAb+BKppoMaqMfEliRptdFaf7RKO02EUzXAeemUXcSPNScPTxDkVE4mmr
	15GS/9OlV8tJOaplk3d9n/dqsNhH8J/cTPUJfVW/OWGalyta9JdGrBYrskcq7uqNuP7/
	+8Dw==
X-Received: by 10.194.8.40 with SMTP id o8mr39974927wja.100.1436522869699;
	Fri, 10 Jul 2015 03:07:49 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	q4sm12857791wja.24.2015.07.10.03.07.48
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 10 Jul 2015 03:07:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <559F9040.90106@windriver.com>
Date: Fri, 10 Jul 2015 12:08:04 +0200
Message-Id: <84FED104-7E9E-4E10-8398-D358985B28A1@gmail.com>
References: <1436518495-27392-1-git-send-email-rongqing.li@windriver.com>
	<8B7C6968-8868-4888-9E67-E6B131014CB3@gmail.com>
	<559F9040.90106@windriver.com>
To: Rongqing Li <rongqing.li@windriver.com>
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
X-List-Received-Date: Fri, 10 Jul 2015 10:07:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Am 10.07.2015 um 11:28 schrieb Rongqing Li =
<rongqing.li@windriver.com>:
>=20
>=20
>=20
> On 2015=E5=B9=B407=E6=9C=8810=E6=97=A5 17:09, Jens Rehsack wrote:
>> Hi,
>>=20
>> When build dir includes contain blib, there is an error which should =
be solved first.
>>=20
>> Can you please give an example where this condition is true?
>> And maybe refer where you reported it upstream?
>>=20
>=20
> the below commands can trigger this bug; under Poky repo:
>=20
> #source oe-init-build-env blib;
> #bitbake perl

Simply add a comment that blib as build-env name is not supported as =
long as no
comment from PathTools maintainers agree on the patch. I rate your patch =
as dangerous
for common perl module building...

I agree that PathTools should handle @INC parts containing blib =
somewhere, but
your patch results in any build environment of any MakeMaker base module =
might be
broken.

If you tell me the RT ticket number where you reported the issue =
upstream and
send your patch for review, I will join and argue for fixing the issue =
(even when
I think the patch needs review).

> or work on source code:
>=20
> #mkdir blib
> #cd blib
> #unxz perl-5.22.0.tar.xz
> #tar -xvf perl-5.22.0.tar
> #cd perl-5.22.0
> #./Configure -des -Dprefix=3D./
> #make

Don't do that - neither for PathTools nor for any other perl module.

Cheers,
Jens

> -Roy
>=20
>=20
>> Best regards,
>> Jens
>>=20
>>> Am 10.07.2015 um 10:54 schrieb rongqing.li@windriver.com:
>>>=20
>>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>>=20
>>> If build dir includes the string "blib", filter it out from @INC may =
empty
>>> the @INC and cause build errors like:
>>>=20
>>>  Can't locate ExtUtils/MakeMaker.pm in @INC \
>>>  (you may need to install the ExtUtils::MakeMaker module) \
>>>  (@INC contains: .) at Makefile.PL
>>>=20
>>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>>> ---
>>> meta/recipes-devtools/perl/perl-native_5.22.0.bb   |  1 +
>>> ...-PathTools-don-t-filter-out-blib-from-INC.patch | 33 =
++++++++++++++++++++++
>>> meta/recipes-devtools/perl/perl_5.22.0.bb          |  1 +
>>> 3 files changed, 35 insertions(+)
>>> create mode 100644 =
meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-=
INC.patch
>>>=20
>>> diff --git a/meta/recipes-devtools/perl/perl-native_5.22.0.bb =
b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
>>> index dbcf2a6..a9a1cab 100644
>>> --- a/meta/recipes-devtools/perl/perl-native_5.22.0.bb
>>> +++ b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
>>> @@ -8,6 +8,7 @@ SRC_URI +=3D "\
>>>            file://MM_Unix.pm.patch \
>>>            file://debian/errno_ver.diff \
>>>            file://dynaloaderhack.patch \
>>> +           =
file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
>>>           "
>>>=20
>>> SRC_URI[md5sum] =3D "ff0f09b17de426eff323426cb140ee79"
>>> diff --git =
a/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-fro=
m-INC.patch =
b/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-fro=
m-INC.patch
>>> new file mode 100644
>>> index 0000000..7dd9041
>>> --- /dev/null
>>> +++ =
b/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-fro=
m-INC.patch
>>> @@ -0,0 +1,33 @@
>>> +=46rom 90c252cecc38aed5d5faedb30485dd6eee2e54eb Mon Sep 17 00:00:00 =
2001
>>> +From: Wenzong Fan <wenzong.fan@windriver.com>
>>> +Date: Wed, 11 Feb 2015 15:14:40 +0800
>>> +Subject: [PATCH] perl / PathTools: don't filter out blib from @INC
>>> +
>>> +If $TOPDIR includes the string "blib", filter it out from @INC may =
empty
>>> +the @INC and cause build errors like:
>>> +
>>> +  Can't locate ExtUtils/MakeMaker.pm in @INC \
>>> +  (you may need to install the ExtUtils::MakeMaker module) \
>>> +  (@INC contains: .) at Makefile.PL
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>>> +---
>>> + dist/PathTools/Makefile.PL | 3 ---
>>> + 1 file changed, 3 deletions(-)
>>> +
>>> +diff --git a/dist/PathTools/Makefile.PL =
b/dist/PathTools/Makefile.PL
>>> +index 1b21de4..f562cb2 100644
>>> +--- a/dist/PathTools/Makefile.PL
>>> ++++ b/dist/PathTools/Makefile.PL
>>> +@@ -1,6 +1,3 @@
>>> +-
>>> +-BEGIN { @INC =3D grep {!/blib/} @INC }
>>> +-
>>> + require 5.005;
>>> + use ExtUtils::MakeMaker;
>>> + WriteMakefile
>>> +--
>>> +1.9.1
>>> +
>>> diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb =
b/meta/recipes-devtools/perl/perl_5.22.0.bb
>>> index 050a98c..7f78998 100644
>>> --- a/meta/recipes-devtools/perl/perl_5.22.0.bb
>>> +++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
>>> @@ -61,6 +61,7 @@ SRC_URI +=3D " \
>>>         file://t-run-switches.t-perl5-perl.patch \
>>>         =
file://ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch \
>>>         =
file://ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch \
>>> +        file://perl-PathTools-don-t-filter-out-blib-from-INC.patch =
\
>>> "
>>>=20
>>> # Fix test case issues
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>=20
> --=20
> Best Reagrds,
> Roy | RongQing Li

--=20
Jens Rehsack - rehsack@gmail.com


