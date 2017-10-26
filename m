Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 413806E688
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 12:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3FFCC20A4B;
	Thu, 26 Oct 2017 12:25:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sK9pCyrGnujG; Thu, 26 Oct 2017 12:25:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 099E42087C;
	Thu, 26 Oct 2017 12:25:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 84BFA162705; Thu, 26 Oct 2017 08:25:00 -0400 (EDT)
Date: Thu, 26 Oct 2017 08:25:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Lee, Yong" <Yong.Lee@johnsonoutdoors.com>
Message-ID: <20171026122500.GT9221@denix.org>
References: <SN1PR13MB027295287B467702CA7967E692470@SN1PR13MB0272.namprd13.prod.outlook.com>
	<CAMKF1sokNFnWVOuOTu31VJQ=Y-cjNON_cO9Ch1Ca8YfeVrNSiw@mail.gmail.com>
	<SN1PR13MB02720FA5FB44DB41FCBD8EE792470@SN1PR13MB0272.namprd13.prod.outlook.com>
	<CAMKF1soogaY_w=yHc722fN7CtXJ3bSzb0kh_3S1ej5h_aUybbA@mail.gmail.com>
	<SN1PR13MB02724610FD9D9566559C56CA92470@SN1PR13MB0272.namprd13.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SN1PR13MB02724610FD9D9566559C56CA92470@SN1PR13MB0272.namprd13.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC 4.9 and Morty
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
X-List-Received-Date: Thu, 26 Oct 2017 12:25:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Oct 24, 2017 at 06:37:17PM +0000, Lee, Yong wrote:
> Thank you.
> I switched to internal toolchain and building GCC 5.4 (included in meta) is 
> complete and is onto glibc.
> 
> In summary, TI SDK appears to be broken as the none-default GCC version 
> included in their package (ie. Linaro 4.9 and Linaro 5.2) fails to build.

There's nothing wrong with TI SDK - the issue is often with the Linaro 
prebuilt toolchain changing little things from version to version and breaking 
corresponding recipes. Unfortunately, external toolchain is required, hence I 
only support 1 specific Linaro toolchain version per release - 7.x in rocko, 
6.x in morty, 5.x in krogoth, 4.9 in fido, etc. So, if you need a different 
Linaro toolchain version, either switch to a corresponding release setup, or 
try porting those recipes.
Alternatively, you can always switch to internal toolchain by simply passing 
TOOLCHAIN_TYPE=internal to TI SDK build. It's not the default and doesn't get 
tested very much against TI SDK, but I try to ensure nothing is broken in each 
relesae. Though, gcc7 is still work in progress.

-- 
Denys


> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com] 
> Sent: Tuesday, October 24, 2017 1:46 PM
> To: Lee, Yong <Yong.Lee@johnsonoutdoors.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] GCC 4.9 and Morty
> 
> On Tue, Oct 24, 2017 at 10:33 AM, Lee, Yong <Yong.Lee@johnsonoutdoors.com> wrote:
> > Thanks Raj for the input. Attached the logs. Please take a look.
> > The .diff file is based on the toolchain-linaro.inc file shipped with TI's SDK [1].
> >
> 
> Your changes look fine.
> 
> > I will try to configure the SDK to use the internal toolchain and see if I can decouple myself from the external toolchain to simplify things.
> >
> 
> you might have to bug your SDK provider for gcc 4.9 build issue
> 
> 
> > Adam
> >
> > [1] 
> > http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-dis
> > tro/conf/distro/include/toolchain-linaro.inc;h=20a65174f269c1e1a5984c5
> > 476a2ab4e5dfc42b5;hb=refs/heads/morty
> >
> > -----Original Message-----
> > From: Khem Raj [mailto:raj.khem@gmail.com]
> > Sent: Tuesday, October 24, 2017 12:26 PM
> > To: Lee, Yong <Yong.Lee@johnsonoutdoors.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] GCC 4.9 and Morty
> >
> > *EXTERNAL EMAIL*
> >
> >
> > On Tue, Oct 24, 2017 at 6:56 AM, Lee, Yong <Yong.Lee@johnsonoutdoors.com> wrote:
> >> I have a bunch of apps that require an old version of GCC (4.9 or less).
> >>
> >> There are a few versions of GCC available in my Morty based SDK.
> >>
> >>
> >>
> >> build@6e35408e8fa5:~/tisdk/build$ bitbake-layers show-recipes gcc
> >>
> >> WARNING: No recipes available for:
> >>
> >>
> >> /home/build/tisdk/sources/meta-openamp/recipes-bsp/device-tree/device
> >> -
> >> tree-generation_%.bbappend
> >>
> >> Parsing recipes..done.
> >>
> >> === Matching recipes: ===
> >>
> >> gcc:
> >>
> >>   meta-linaro-toolchain linaro-4.9
> >>
> >>   meta-linaro-toolchain linaro-6.2
> >>
> >>   meta                 6.2.0
> >>
> >>   meta                 5.4.0
> >>
> >>   meta-linaro-toolchain linaro-5.3
> >>
> >>   meta-linaro-toolchain linaro-5.2
> >>
> >>
> >>
> >> Immediately I have set the PREFERRED_VERSION of gcc to 4.9 but 
> >> bitbake does not go beyond configuration.
> >>
> >>
> >
> > Please post the error and change you did to enable 4.9
> >
> >>
> >> I believe 4.9 + morty combination has not been tested at all. I 
> >> understand my apps need to get updated, but that’s not my call.
> >
> > OE-core and yocto releases by default do not test toolchains coming 
> > from other layers so essentially 6.2 is whats the default compiler 
> > with morty and thats what is most tested however, others might have 
> > tested the other combinations with morty,
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

