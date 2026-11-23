Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52341.1795435709955903057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 04:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=W1Z8aIFQ;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: joerg.vehlow@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1795435707;
	bh=Pg7USrhcz/oDfNRxDDJQQCG/eCRykAp+H5/nQoolA2A=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=W1Z8aIFQM/iZVq8eOixVmqQG8Bt/yoBEawSZxCIz0FK5gWog5tj3yqObcp4h24WRq
	 zSIpVTW1B01FCzioSbrZdIQ0XhLsD4Od+caeJznHkfNJUpe22Pl5ecBbFPHqinUw4W
	 U47lMP6l2tiKb0I+ElVfMhJJJ1486TB/V+Y+RtJzF4E7uMuGCNYUypGjeUoFsb8gmk
	 ZQ9gkU83fSh4KsPthogkaGJkYo8R7Qz9qhdvbaE2WZHWIEJmS3Qk9cxU14M43eqUCO
	 YJ9qC3lGovEhBCFBx8K8t8LkgQg8QEHJzwXn4NviHjrT5zXIyevoa1ESogE+gAw3eG
	 1LoWg/TP5w4gg==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 7C1345F7AC;
	Mon, 23 Nov 2026 13:08:27 +0100 (CET)
Message-ID: <75f4cab0-7f18-4a44-8ea6-3ec4bffbc38f@emlix.com>
Date: Mon, 23 Nov 2026 13:08:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] staging: allow special handling of
 initial-recipes also for native
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20261119055929.3286725-1-joerg.vehlow@emlix.com>
 <a16193f4de16a23bd5f89ec3ece8ee96de8a8ffa.camel@linuxfoundation.org>
 <dc59b7a4-34c2-43e8-a22a-21737b3eade4@emlix.com>
 <31494e4081f6b926ca92176156c33d1ac36f62b0.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=B6rg_Vehlow?= <joerg.vehlow@emlix.com>
In-Reply-To: <31494e4081f6b926ca92176156c33d1ac36f62b0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 1.4.6 at mx1.emlix.com
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 12:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250908



On 23.11.2026 12:52, Richard Purdie wrote:
> On Mon, 2026-11-23 at 12:46 +0100, J=C3=B6rg Vehlow wrote:
>> On 23.11.2026 12:39, Richard Purdie wrote:
>>> On Thu, 2026-11-19 at 06:59 +0100, Joerg Vehlow via openembedded-core=
 wrote:
>>>> Sometimes a native recipe also needs bootstrapping (e.g. for ada,
>>>> rust or go)
>>>> -inital-native recipes are already handled different in bitbake.conf
>>>> (both suffixes are stripped).
>>>> During staging for the esdk these packages should also not be staged
>>>> in the sysroot as they might conflict like libgcc-initial does.
>>>
>>> initial recipes are target/nativesdk only as far as I know. Where are
>>> you seeing these -initial-native recipes? Our rust build process
>>> doesn't have them, nor does go as far as I can tell?
>>
>> You are right, there is no recipe that currently produces initial-nati=
ve
>> packages. But we implemented ada and gprbuild support, which is a bit
>> tricky, because like go and rust it uses ada and gprbuild to bootstrap=
.
>> Ada is even more tricky, because it is not possible (at least not
>> simple) to build a cross gcc with ada support using a different gcc
>> version as the host compiler.
>> For that reason we have a recipe, that fetches a prebuilt gcc with ada
>> support (from alire) and uses that to build gcc-cross. By definition t=
he
>> recipe that fetches the prebuilt gcc is a native package, but also an
>> inital package, hence initial-native.
>> Fro gprbuild something similar applies, an initial version is build
>> using the prebuilt gcc and that initial version then build the real
>> gprbuild used for cross compilation. So we also have a
>> gprbuild-initial-native recipe.
>>
>> For the esdk these native packages are not required and shouldn't be
>> staged, just like other initial-packages.
>>
>> I hope that clarifies the use case, even if it does not apply to what
>> openembedded is currently delivering.
>=20
> Can you fix the commit message please and perhaps put more of this
> detail in there?
>=20
> It is a bit of a red flag when the commit message doesn't really match
> what the code does, it also can cause problems in the future when
> people look back at why something was done.
I totally agree with you here, but fail to see where the mismatch is.
The commit message states that the special handling for initial is also=20
applied to initial-native. (ok maybe the verb allow is not the right one)

>=20
> The other question this leads to, is whether this is a complete fix or
> are there other changes needed to make "initial" support work better?
This is the only fix that was required to oe-core that was required to=20
make bitbake exclude these initial packages from the esdk.>
> I really want to see the complete picture of how this is working before
> we commit to supporting it.
I get that, but currently I cannot provide the recipes, they are loosely=20
based in meta-adacore, but instead of using a prebuilt gprbuild they=20
build gprbuild in a two step process. Maybe that is what we can focus on=20
and I could try to upload a version of meta-adacore with these recipes=20
for you if you'd like to understand the use case.

But essentially: gprbuild is built in a two step process, first it is=20
build using gnat only (gprbuild-initial-native) and then it is built=20
again using the first version as the build tool. Since gprbuild is a=20
build tool (comparable to cmake), it must be a native recipe. The=20
nativesdk variant and the target variant can then be built from the=20
"normal" gprbuild-native.
But gprbuild-initial-native is never needed in the esdk and it uses the=20
same paths as gprbuild-native (just for simplicity) and so it has=20
collisions, if both are installed at the same time.
Similar collisions would happen, if libgcc-initial and libgcc were=20
installed at the same time - I guess that is the reason why the initial=20
recipes were excluded from the esdk.
Since the mechanism already exists and is simply not applied for=20
initial-native, I figured this is a "bug" in oe, that could be fixed=20
without too much background or explaining:

Currently target and nativesdk packages, that end in -initial are not=20
installed into the esdk, but native packages are, that feels like an=20
inconsistency, that is fixed by this patch. There is not really a lot=20
more to it.


>=20
> Cheers,
>=20
> Richard

--=20
emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
Office M=C3=BCnchen: Am Knie 16, 81241 M=C3=BCnchen, Germany
http://www.emlix.com

emlix - your embedded Linux partner

