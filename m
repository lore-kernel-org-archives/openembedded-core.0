Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AD0CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 20:54:36 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.1341.1757710469698158546
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 13:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=gP9zeH3v;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CKsOt5682397;
	Fri, 12 Sep 2025 15:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757710464;
	bh=TYWzSljXG8+VhA/GMa+qn7G5KUr/FypdTpa9r2RggWQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gP9zeH3vRfi7EUpcmtX2Lc15T4n/aE1JU/rt9+7D3DLskWRkKpDQt7RSDGWemLyMZ
	 BZzykpuXudXF37jEDUBqWNKtYvx0ZeYMRHRfmbUGnrLRAWQyCuwLjCJSnb+WGZ+q+v
	 bzFdlXnFAsSo5Q/hBG8Rx0NmsGrFtDH+h3QyDaVg=
Received: from DFLE203.ent.ti.com (dfle203.ent.ti.com [10.64.6.61])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CKsOKX3036374
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Sep 2025 15:54:24 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Sep
 2025 15:54:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 15:54:24 -0500
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CKsOwK281513;
	Fri, 12 Sep 2025 15:54:24 -0500
Message-ID: <03616756-05e8-41d5-a85b-06f2d046bea6@ti.com>
Date: Fri, 12 Sep 2025 15:54:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [master][PATCH v2] libsdl2: Add tests package and
 ptest support
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: <openembedded-core@lists.openembedded.org>, <alex@linutronix.de>
References: <20250904000724.1575300-1-a-christidis@ti.com>
 <CANNYZj-e1eYKD4Se3mHOWO-K5kA1BL0rSc25MPTNcuupa_hykw@mail.gmail.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <CANNYZj-e1eYKD4Se3mHOWO-K5kA1BL0rSc25MPTNcuupa_hykw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 58CKsOt5682397
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 20:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223336

Dear Alexander,


I ran the tests using the gnome-desktop-testing-runner. Here is what I=20
found:

libsdl2 has 70 tests. Currently, following the gnome standard and being=20
packaged under /usr/libexec/installed-tests .

18 out of the 70 tests are executed with the=20
gnome-desktop-testing-runner. The standard only covers tests that run=20
for a finite amount of time, not infinitely, and requires ".test" files=20
under /usr/share.

However, when running the 18 tests on qemux86-64 qemuarm, the following=20
tests fail:

testaudioinfo

testautomation

testlocale

testsurround

Most of the test failures are due to the audio stack, which I do not=20
have experience with in order to debug.

Here's my questions, what should I do here ?

It is acceptable to create a oe-core only patch for libsdl2, that would=20
block the generation of the ".test" files for the above tests, ".test"=20
files are what dictate which tests are run?

Or, I can take a look into updating the version of gnome-desktop-testing=20
? More recent versions of the software, have a CLI option to exclude=20
tests. The current packages version within oe-core does not.

I'm leaning on the 2nd option, but want to get your opinion on this=20
since you have more experience on ptest and related topics.

Kind Regards,

Antonios

On 9/4/25 6:27 AM, Alexander Kanavin wrote:
> On Thu, 4 Sept 2025 at 02:=E2=80=8A07, <a-christidis@=E2=80=8Ati.=E2=80=
=8Acom> wrote: >=20
> +test_array=3D"testdraw2 testgeometry testsprite2 testgles2=20
> testoffscreen" > +test_path=3D"/usr/libexec/installed-tests/SDL2/" > + =
>=20
> +for test in ${test_array} > +do
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczhAu0BQaazEF=
n6sssEtcdxUhEvtTan3pBnTy9YsgLjvWwOA7YJejpfF1TdW-I8bxkDedD2ZVkPZUvwfaMUJ9S=
DMz1bIjJfXyt52mx6YGg_dzNkYWXvJTDg$>=20
>
> ZjQcmQRYFpfptBannerEnd
> On Thu, 4 Sept 2025 at 02:07, <a-christidis@ti.com> wrote:
> > +test_array=3D"testdraw2 testgeometry testsprite2 testgles2 testoffsc=
reen"
> > +test_path=3D"/usr/libexec/installed-tests/SDL2/"
> > +
> > +for test in ${test_array}
> > +do
> > +    timeout --preserve-status 10 "$test_path""$test"
> > +    if [ $? -eq 0 ]; then
> > +        echo "PASS: $test"
> > +    else
> > +        echo "FAIL: $test"
> > +    fi
> > +done
>
> Hardcoding a list of tests is prone to regressions and incomplete cover=
age.
>
> I applied the patch and checked what actually gets installed. SDL
> conforms to gnome's installed tests spec, which means you can inherit
> ptest-gnome, and run-ptest should be as simple as:
>
> #! /bin/sh
>
> gnome-desktop-testing-runner SDL2
>
> There are examples in oe-core if you need them for reference.
> Obviously you should run it too and check that it passes.
>
> meta-oe has a recipe for libsdl3, whether you want to forward-port the
> test support to that recipe is at your discretion, but at some point
> libsdl2 will be obsoleted and replaced by that in core.
>
> Alex

