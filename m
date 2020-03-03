Return-Path: <herve.jourdain@neuf.fr>
X-Greylist: delayed 553 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 03 Mar 2020 13:15:09 UTC
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.199])
	by mail.openembedded.org (Postfix) with ESMTP id 860B461994
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:15:09 +0000 (UTC)
X-mail-filterd: 0.4.0
X-sfr-spamrating: 36
X-sfr-spam: not-spam
Received: from NBHJOROG (unknown [70.88.250.17])
	by msfrf2616.sfr.fr (SMTP Server) with ESMTP id 1AC351C00081E;
	Tue,  3 Mar 2020 14:05:56 +0100 (CET)
X-sfr-mailing: LEGIT
Received: from NBHJOROG (unknown [70.88.250.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2616.sfr.fr (SMTP Server) with ESMTPSA;
	Tue,  3 Mar 2020 14:05:31 +0100 (CET)
Authentication-Results: sfr.fr;
	auth=pass (LOGIN) smtp.auth=herve.jourdain@neuf.fr
From: "Herve Jourdain" <herve.jourdain@neuf.fr>
To: "'Peter Kjellerstedt'" <peter.kjellerstedt@axis.com>,
	"'Junling Zheng'" <zhengjunling@huawei.com>,
	"'Khem Raj'" <raj.khem@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20200302171153.28030-1-zhengjunling@huawei.com>	<666b3145-0e57-cf3c-f1f4-22d6fd0521e5@gmail.com>	<9d41cd5d-7355-175d-391c-35231c9a7e92@huawei.com>
	<41b7391039564f10a0c8b4f63eeb4274@XBOX03.axis.com>
In-Reply-To: <41b7391039564f10a0c8b4f63eeb4274@XBOX03.axis.com>
Date: Tue, 3 Mar 2020 14:05:19 +0100
Message-ID: <000501d5f15c$6e210280$4a630780$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJZLh6+6J6aD4UN4j3kBxY5vvc7VQJe5rbRAoBJTT4C72ATKabx6AJw
Cc: wangnan0@huawei.com
Subject: Re: [PATCH] arch-arm64.inc: Do not append aarch64 in MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 03 Mar 2020 13:15:09 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-gb

Hi,

Just my 2 cents about this.
armv8-a is the architecture of the arm core, while aarch64/aarch32 is the
execution mode on said architecture.
So I believe that we should have overrides for BOTH the architecture and the
execution mode, as you can have armv8-a executing in 32 bits mode - and btw,
the instruction set in 32 bits mode is not exactly the same as armv7-ve, so
in terms of optimization it does help to know you're running on an armv8-a
architecture, even if it's in 32 bits mode.
There was no such problem before armv8-a architecture, since all previous
architectures were running in 32 bits mode only. Armv8-a changes that as
it's a "hybrid", with support for both aarch64 and aarch32.
I expect later arch to support only aarch64.

There is also an additional thing to consider, there is not just one armv8-a
profiles, there already are several, and they shall all be taken into
account.
I believe that at this time, the valid ones are armv8.0-a, armv8.1-a,
armv8.2-a, armv8.3-a  and armv8.4-a.

And let me answer before someone asks, yes the gcc compiler DOES provide
compiler options for all those architectures, with those exact names -
except armv8.0-a is just named armv8-a (-march=armv8-a or
-march=armv8.[1,2,3,4]-a).
So it just makes sense to support them all.

So overall, I believe we should support all those arm v8 architectures, and
add the corresponding override to the cpu definition files (for instance, as
Peter mentioned, cortex-a53 is an armv8.0-a. But a cortex-a55 or cortex-a75
would be an armv8.2-a).

Finally, the arm architecture is slightly more complex than just armv8.x-a,
since the support for "features" is optional. So at least "crc" and "crypto"
features should be added, in order to have a "comprehensive" view of the
armv8 architecture. And yes, the "features" are also supported by the gcc
compiler.
So the arm architecture would really be fully defined by
armv8.x-a+[no]crc+[no]crypto, depending on the underlying SoC and what they
implemented or not as optional features. And this is probably what should
end up going into the tune-cortexa53.inc and others (and should be
override-able, since again not all cortexa53 are created the same).

Cheers,
Herve

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org
<openembedded-core-bounces@lists.openembedded.org> On Behalf Of Peter
Kjellerstedt
Sent: 03 March 2020 13:00
To: Junling Zheng <zhengjunling@huawei.com>; Khem Raj <raj.khem@gmail.com>;
openembedded-core@lists.openembedded.org
Cc: wangnan0@huawei.com
Subject: Re: [OE-core] [PATCH] arch-arm64.inc: Do not append aarch64 in
MACHINEOVERRIDES

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org 
> <openembedded-core- bounces@lists.openembedded.org> On Behalf Of 
> Junling Zheng
> Sent: den 3 mars 2020 04:11
> To: Khem Raj <raj.khem@gmail.com>; openembedded- 
> core@lists.openembedded.org
> Cc: wangnan0@huawei.com
> Subject: Re: [OE-core] [PATCH] arch-arm64.inc: Do not append aarch64 
> in MACHINEOVERRIDES
> 
> On 2020/3/3 2:29, Khem Raj wrote:
> >
> >
> > On 3/2/20 9:11 AM, Junling Zheng wrote:
> >> Currently, for arch-arm64, poky will append the MACHINEOVERRIDES 
> >> with "aarch64:", which has the higher priority than
TRANSLATED_TARGET_ARCH.
> >> So, for aarch64 big endian, the variable '<foo>_aarch64' will 
> >> override not only '<foo>', but also '<foo>_aarch64-be', thus we 
> >> will get an incorrect variable.
> >>
> >> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
> >> ---
> >>   meta/conf/machine/include/arm/arch-arm64.inc | 2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc
> b/meta/conf/machine/include/arm/arch-arm64.inc
> >> index 53f4566815..32294bd218 100644
> >> --- a/meta/conf/machine/include/arm/arch-arm64.inc
> >> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
> >> @@ -4,8 +4,6 @@ require conf/machine/include/arm/arch-armv7ve.inc
> >>     TUNEVALID[aarch64] = "Enable instructions for aarch64"
> >>   -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES',
'aarch64', 'aarch64:', '' ,d)}"
> >> -
> >
> > if its removed here, where is it being added for other machines,
> question is, should we treat aarch64 as LE equivalent of aarch64_be
> > or should be treated as common aarch64 and a new define like 
> > aarch64_le
> defined.
> >
> 
> Currently, for arm64, we have aarch64_be to represent big endian, but 
> no overrides to represent little endian only.
> 
> So, IMO, we should treat aarch64 as little enaian only, like arm and 
> armeb.
> 
> >>   # Little Endian base configs
> >>   AVAILTUNES += "aarch64 aarch64_be"
> >>   ARMPKGARCH_tune-aarch64 ?= "aarch64"

Please, before removing "aarch64" from MACHINEOVERRIDES, add "armv8a" or
similar. This is how it is done for the armv7* based chips. E.g., I would
expect to see tune-cortexa53.inc have:

MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53',
'armv8a:', '' ,d)}"

Which corresponds to how it is done for armv7*.

At least we currently rely on being able to do, e.g.:

COMPATIBLE_MACHINE = "aarch64|armv7a|armv7ve"

and if you remove "aarch64" from MACHINEOVERRIDES, we need a suitable
substitute.

//Peter

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core


