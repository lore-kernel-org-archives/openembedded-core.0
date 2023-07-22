Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E950EB64DA
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 10:20:07 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.2868.1690021201585264932
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 03:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kvGWNWY6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 593A2240003;
	Sat, 22 Jul 2023 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690021199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BLCw8m16nx99eDxb372fYjndq25ulJ8KWRvhhz4Yoaw=;
	b=kvGWNWY6zHHszHq5xHaVCOgaJIKQZJvGD9da19lLiQRDJbULOxkdcfRuEC8ny4g5+zPotL
	thDuBzbvLXoOlD+W1P9Nw4Tl0W2sCEY3eiDVhb+zo2V+M9hKWhcOCakCbUMQJdEcaX3FVN
	3Rfg/b5bP/nE8gQdS5LcNXW54UIOoef1maDCUs8751tFMRhEhbcrfTZVOKuQvqgqWoMlJi
	nRRDTLRhjsCVqf/fF1qe4T1ReD4Rn1lsNdSmPb2vp8GAchye9+R1kbLBQX06aH4mTDrhrL
	2Gon9FR4Y02u3c0xepXo+/qrEIpWbFA5nfwP8DOzMAUFAYjdS0rKKEt2YK9RPA==
Date: Sat, 22 Jul 2023 12:19:59 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piotr =?utf-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: ODP: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Message-ID: <20230722101959f26ff2ab@mail.local>
References: <20230721120723.4006443-1-p.lobacz@welotec.com>
 <20230721220126165c5136@mail.local>
 <VI1PR04MB5373A2654B4B36C498CEC43B913FA@VI1PR04MB5373.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB5373A2654B4B36C498CEC43B913FA@VI1PR04MB5373.eurprd04.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 10:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184717

On 21/07/2023 23:33:02+0000, Piotr Łobacz wrote:
> Alexandre, Is it possible for you to create a docker file or some image etc. with all commands from autobuilder which will re-create the failure and pass it to me?
> 

I don't have that but really, those are just bare installation of the
distro with just what is necessary to start an OE build.

How did you try to reproduce?

The log says that you are trying to execute this:

opkg-build -Z xz -a "--memlimit=5% --threads=8" "" "" nativesdk-glibc-binary-localedata-zu-za /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/i686-nativesdk-oesdk-linux/nativesdk-glibc-locale/2.37-r1/deploy-ipks/i686-nativesdk'

The error is there, in the logs since I tested v4:

Usage: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/i686-nativesdk-oesdk-linux/nativesdk-glibc-locale/2.37-r1/recipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-o owner] [-g group] <pkg_directory> [<destination_directory>]

It is because you changed OPKGBUILDCMD to be:

OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}"'

Can you see the extra double quotes that create two extra string
arguments?

Did you test without acl and xattr in DISTRO_FEATURES?

> Because can grope, find nothing and waste our time...
> 

Now, I've spent part of my week-end looking at that, this is time I will
never get back while you just had to read the errors I reported to you
on v4 and v5.
You are demanding this is urgently processed but your patch series is
not ready.

Also, you HAVE to fix the reproducibility issues, else this will not go
in.

> Cheers,
> Piotr
> 
> ________________________________
> Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Wysłane: sobota, 22 lipca 2023 00:01
> Do: Piotr Łobacz <p.lobacz@welotec.com>
> DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Temat: Re: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass: add support for ACLs and xattr
> 
> I confirm this still fails on the autobuilders:
> 
> This is a-full:
> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F83%2Fbuilds%2F5631&data=05%7C01%7Cp.lobacz%40welotec.com%7C308b241fa77c483b937808db8a360827%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=YHOXoiEiIYhWMLP%2FvytWKdXpcSpTDfKzwf8MEyGzWQ0%3D&reserved=0<https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5631>
> 
> On 21/07/2023 14:07:19+0200, Piotr Łobacz wrote:
> > Extend OPKGBUILDCMD variable, with additional parameters, depending
> > on target distro features, in order to support ACLs and xattr.
> >
> > With fix pushed to the opkg-devel:
> > https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&data=05%7C01%7Cp.lobacz%40welotec.com%7C308b241fa77c483b937808db8a360827%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=Hhix8F4A6m9r0tFljzmTUXwQdBUPeV6X8g4c0Nm%2Favw%3D&reserved=0<https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8>
> > opkg-build is able to create tar archives with ACLs and xattr.
> >
> > Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
> > ---
> >  meta/classes-global/package_ipk.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
> > index b4b7bc9ac2..5e151be3cd 100644
> > --- a/meta/classes-global/package_ipk.bbclass
> > +++ b/meta/classes-global/package_ipk.bbclass
> > @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET = "${WORKDIR}/opkg-sdk-target.conf"
> >  PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
> >
> >  # Program to be used to build opkg packages
> > -OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> > +OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}"'
> >
> >  OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
> >  OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
> > --
> > 2.34.1
> >
> 
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184688): https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184688&data=05%7C01%7Cp.lobacz%40welotec.com%7C308b241fa77c483b937808db8a360827%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=ZwVNo7xrr50em37GziHwBnWym4C%2FiPec1ds13X5vY1g%3D&reserved=0<https://lists.openembedded.org/g/openembedded-core/message/184688>
> > Mute This Topic: https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.openembedded.org%2Fmt%2F100275318%2F3617179&data=05%7C01%7Cp.lobacz%40welotec.com%7C308b241fa77c483b937808db8a360827%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=9xI%2FOyNZLgQHu3DxDlNrRlvGnw78R1r%2FMUDsMax2Ols%3D&reserved=0<https://lists.openembedded.org/mt/100275318/3617179>
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=05%7C01%7Cp.lobacz%40welotec.com%7C308b241fa77c483b937808db8a360827%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=xsWva7UZC%2B%2BRVwZFqazqHnRFG2deHmovxTk%2BiamdwBs%3D&reserved=0<https://lists.openembedded.org/g/openembedded-core/unsub> [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.com%2F&data=05%7C01%7Cp.lobacz%40welotec.com%7C308b241fa77c483b937808db8a360827%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=qcJ5Tbo%2BeuKHZTpYlA5WJWQUekULrpnkHDmNnRAvEqo%3D&reserved=0<https://bootlin.com/>

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

