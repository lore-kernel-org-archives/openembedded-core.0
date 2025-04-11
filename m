Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1816DC36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 10:01:50 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.22193.1744365704984096079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 03:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=D3ptY0dZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3A9142E76;
	Fri, 11 Apr 2025 10:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744365703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x3T5oahsTd60ZBZWKC/FOHo4wZygpbDZqUKNkWMTbu8=;
	b=D3ptY0dZ0RGe/+AYjF5NcvnhDi8KVlywphpA+OqRfnS+2D+aSQ5FnD/H0FmJShOvstHPKW
	TaqqyZcOxdXDu3dQBLQPU1zx01OViDOjUs5YLIXAOD+RMyYhwFSXCbVozRBrt9TBqpFEwP
	HPLGA6/87Y9v/eKrwhgSy2BjcLbvDMUq90ZrmEsxIM1S/MR7sLJC0YYRG3mkzNo8chgsUW
	aKTL3V5qkMwcT6N7X20OifqRTfDntfAcJFRZhLVdKfd9gPZkkBxBcn9hLtW5RPZ3RA1WAC
	EuIEGsUoNBFXMGm3EyXkZj5FhWamUDfOb1ZTglfINKIp7d3LylSJOf6jCGVGeg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 12:01:42 +0200
Message-Id: <D93Q190DVIDH.11RMD6PSZ8Y5D@bootlin.com>
Subject: Re: [OE-core] [PATCH v5 4/5] oeqa/sdk/meson: improve test to
 validate host/build target assignments
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <tom.hochstein@oss.nxp.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
 <20250407211806.1782316-4-tom.hochstein@oss.nxp.com>
 <D91AQNC6UKX5.394WLWGGFWT4O@bootlin.com>
 <183460753CA35884.31078@lists.openembedded.org>
 <1834F816ACB44615.7383@lists.openembedded.org>
 <1834FEA34534143E.27206@lists.openembedded.org>
 <cdae0d74-ade9-4b2b-a0ab-45788cd8044f@oss.nxp.com>
In-Reply-To: <cdae0d74-ade9-4b2b-a0ab-45788cd8044f@oss.nxp.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhomhdrhhhotghhshhtvghinhesohhsshdrnhigphdrtghomhdprhgtphhtthhop
 ehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 10:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214725

On Thu Apr 10, 2025 at 8:58 PM CEST, Tom Hochstein via lists.openembedded.o=
rg wrote:
> On 4/10/2025 10:28 AM, Tom Hochstein via lists.openembedded.org wrote:
>> On 4/10/2025 8:28 AM, Tom Hochstein via lists.openembedded.org wrote:
>>> On 4/8/2025 10:10 AM, Tom Hochstein via lists.openembedded.org wrote:
>>>> On 4/8/2025 8:37 AM, Mathieu Dubois-Briand wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> Thanks for the new version, but we have a new error now:
>>>>>
>>>>> Traceback (most recent call last):
>>>>> =C2=A0=C2=A0 File=20
>>>>> "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/sdk/cases/me=
son.py", line 47, in test_epoxy
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 self.assertNotEqual(data["build"]["c"]["exel=
ist"],=20
>>>>> data["host"]["c"]["exelist"])
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ~~~~~~~~~~~~~^^^^^
>>>>> KeyError: 'c'
>>>>
>>>> Thanks, Mathieu.
>>>>
>>>> Ross, can you have a look?
>>>
>>> An update: I thought this was working for me, but I realize now that I=
=20
>>> may not be running the modified test. This is what I ended up running=
=20
>>> after looking around using oe-selftest list commands, as it was the=20
>>> only thing that looked close to an SDK meson test:
>>>
>>> `oe-selftest -r=20
>>> devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_code_meson`
>>>
>>> How do I run the modified test?
>>>
>>=20
>> Never mind, I figured it out and successfully ran `bitbake -c testsdk=20
>> core-image-minimal` with no failures, including the modified test.
>>=20
>> RESULTS - meson.MesonTest.test_epoxy: PASSED (19.43s)
>>=20
>> Trying now with core-image-sato as is done on the autobuilder.
>
> Unfortunately, I still cannot reproduce the issue. Another variance was
> that I had used the default machine qemux86-64, while the autobuilder
> test failed using qemux86. I updated the machine, but still cannot
> reproduce the error.
>

Hi,

Ok, I managed to reproduce the error withe the following process:

git clone git://web.git.yoctoproject.org/poky-ci-archive -b autobuilder.yoc=
toproject.org/valkyrie/a-full-1363
cd poky-ci-archive=20
. oe-init-build-env

Adding following in my local.conf:
IMAGE_CLASSES +=3D "testimage"
MACHINE =3D "qemux86"
DISTRO =3D "poky"
SDKMACHINE =3D "i686"
PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
INHERIT +=3D 'image-buildinfo'

bitbake core-image-sato -c populate_sdk
bitbake core-image-sato -c testsdk

And I got this error:

Traceback (most recent call last):
  File "/home/mdubois-briand/swat/oe-sefltest/poky-contrib/meta/lib/oeqa/sd=
k/cases/meson.py", line 47, in test_epoxy
    self.assertNotEqual(data["build"]["c"]["exelist"], data["host"]["c"]["e=
xelist"])
                        ~~~~~~~~~~~~~^^^^^
KeyError: 'c'

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


