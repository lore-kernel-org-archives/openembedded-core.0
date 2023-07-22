Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9FEEB64DA
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 12:45:38 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.4418.1690029935041245788
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 05:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FnUovwHG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73E06FF802;
	Sat, 22 Jul 2023 12:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690029933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VZh/P5nQ9kYA2yLYw8ST3pFuBtGKhzx4gz4pj01KuMI=;
	b=FnUovwHGXdOhoC4b3LUlrh7DiZNpkqqno6o1ulBx/xJsJhhjbE9Y1jaCNNwUAp8oiBmIw4
	JQBZAGgRn+yzmXIJxQynjLrHhzWTyb6/5xVVJGgfb0+3uHOhE/Wz9TiufQOwZV/eXzf0dw
	H6Y8y7K1i2U0U6nxGILmiC13GPAP97EV7q6OP5lfMT0mmEYkf5SldZoMczACR9u9UkWz+I
	xrjsa33BpdDdEMOf9usYIg3DSSgOLH9tL3hvM5LacMXoTvDsKOrnmgmBQ/+h2YdHoYuAtg
	D06EkaTQjybcM83QA1ZJWEfPa6i7Q5dTsgnlRDcD85aaZBjcPF0/Xzn4Fb9vyg==
Date: Sat, 22 Jul 2023 14:45:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piotr =?utf-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: ODP: ODP: [OE-Core][PATCH v7][master-next 1/5]
 package_ipk.bbclass: add support for ACLs and xattr
Message-ID: <202307221245328c8261d2@mail.local>
References: <20230721120723.4006443-1-p.lobacz@welotec.com>
 <20230721220126165c5136@mail.local>
 <VI1PR04MB5373A2654B4B36C498CEC43B913FA@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230722101959f26ff2ab@mail.local>
 <VI1PR04MB5373082EF3B9EB1759C9D154913CA@VI1PR04MB5373.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB5373082EF3B9EB1759C9D154913CA@VI1PR04MB5373.eurprd04.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 12:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184720

On 22/07/2023 11:42:39+0000, Piotr Łobacz wrote:
> OK, finally discovered why in my case removing of acl from DISTRO_FEATURES didn't work for me. We have our own DISTRO_FEATURES:append in which acl is being appended and I just removed it from there.
> 
> Unfortunately, there is this file:
> yocto/openembedded-core/meta/conf/distro/include/default-distrovars.inc:19:DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp"
> which I was not aware of....
> 

Note that the failing packages are nativesdk- so I suspect
DISTRO_FEATURES_FILTER_NATIVESDK may have something to do with this.

> I will fix that today finally...
> 
> BR
> Piotr
> ________________________________
> Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Wysłane: sobota, 22 lipca 2023 12:19
> Do: Piotr Łobacz <p.lobacz@welotec.com>
> DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Temat: Re: ODP: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass: add support for ACLs and xattr
> 
> On 21/07/2023 23:33:02+0000, Piotr Łobacz wrote:
> > Alexandre, Is it possible for you to create a docker file or some image etc. with all commands from autobuilder which will re-create the failure and pass it to me?
> >
> 
> I don't have that but really, those are just bare installation of the
> distro with just what is necessary to start an OE build.
> 
> How did you try to reproduce?
> 
> The log says that you are trying to execute this:
> 
> opkg-build -Z xz -a "--memlimit=5% --threads=8" "" "" nativesdk-glibc-binary-localedata-zu-za /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/i686-nativesdk-oesdk-linux/nativesdk-glibc-locale/2.37-r1/deploy-ipks/i686-nativesdk'
> 
> The error is there, in the logs since I tested v4:
> 
> Usage: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/i686-nativesdk-oesdk-linux/nativesdk-glibc-locale/2.37-r1/recipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-o owner] [-g group] <pkg_directory> [<destination_directory>]
> 
> It is because you changed OPKGBUILDCMD to be:
> 
> OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}"'
> 
> Can you see the extra double quotes that create two extra string
> arguments?
> 
> Did you test without acl and xattr in DISTRO_FEATURES?
> 
> > Because can grope, find nothing and waste our time...
> >
> 
> Now, I've spent part of my week-end looking at that, this is time I will
> never get back while you just had to read the errors I reported to you
> on v4 and v5.
> You are demanding this is urgently processed but your patch series is
> not ready.
> 
> Also, you HAVE to fix the reproducibility issues, else this will not go
> in.
> 
> > Cheers,
> > Piotr
> >
> > ________________________________
> > Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Wysłane: sobota, 22 lipca 2023 00:01
> > Do: Piotr Łobacz <p.lobacz@welotec.com>
> > DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> > Temat: Re: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass: add support for ACLs and xattr
> >
> > I confirm this still fails on the autobuilders:
> >
> > This is a-full:
> > https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F83%2Fbuilds%2F5631&data=05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=xRBC3fnrtzeYVHWF3NXuYNEUcItaUgthfNbsESw0Uf8%3D&reserved=0<https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F83%2Fbuilds%2F5631&data=05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=xRBC3fnrtzeYVHWF3NXuYNEUcItaUgthfNbsESw0Uf8%3D&reserved=0><https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5631>
> >
> > On 21/07/2023 14:07:19+0200, Piotr Łobacz wrote:
> > > Extend OPKGBUILDCMD variable, with additional parameters, depending
> > > on target distro features, in order to support ACLs and xattr.
> > >
> > > With fix pushed to the opkg-devel:
> > > https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&data=05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=tHNWv1KiC%2F23ieV1MDFHeDal56N68koKsSejPRw5xd4%3D&reserved=0<https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&data=05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=tHNWv1KiC%2F23ieV1MDFHeDal56N68koKsSejPRw5xd4%3D&reserved=0><https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8>
> > > opkg-build is able to create tar archives with ACLs and xattr.
> > >
> > > Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
> > > ---
> > >  meta/classes-global/package_ipk.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
> > > index b4b7bc9ac2..5e151be3cd 100644
> > > --- a/meta/classes-global/package_ipk.bbclass
> > > +++ b/meta/classes-global/package_ipk.bbclass
> > > @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET = "${WORKDIR}/opkg-sdk-target.conf"
> > >  PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
> > >
> > >  # Program to be used to build opkg packages
> > > -OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> > > +OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}"'
> > >
> > >  OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
> > >  OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
> > > --
> > > 2.34.1
> > >
> >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#184688): https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184688&data=05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=VZTQIYFoSzjRHY42jZwFRCNC6EDE30tqMshNiIUcl6M%3D&reserved=0<https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184688&data=05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=VZTQIYFoSzjRHY42jZwFRCNC6EDE30tqMshNiIUcl6M%3D&reserved=0><https://lists.openembedded.org/g/openembedded-core/message/184688>
> > > Mute This Topic: https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.openembedded.org%2Fmt%2F100275318%2F3617179&data=05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=b09R4UtKy%2FMdb%2Bo3H9c9FfG9yitoxo3ACuVSwiBxK7E%3D&reserved=0<https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.openembedded.org%2Fmt%2F100275318%2F3617179&data=05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=b09R4UtKy%2FMdb%2Bo3H9c9FfG9yitoxo3ACuVSwiBxK7E%3D&reserved=0><https://lists.openembedded.org/mt/100275318/3617179>
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=ZWc%2FB6UBqT6hbR5bIxvtbdV41ibuKna%2Bk06Cnj9uq%2BY%3D&reserved=0<https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=ZWc%2FB6UBqT6hbR5bIxvtbdV41ibuKna%2Bk06Cnj9uq%2BY%3D&reserved=0><https://lists.openembedded.org/g/openembedded-core/unsub> [alexandre.belloni@bootlin.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.com%2F&data=05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=XMC3vugVsU3kWlvJ7Ru%2FFh2RMc8v2NBhSD6vMk9hWlI%3D&reserved=0<https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.com%2F&data=05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=XMC3vugVsU3kWlvJ7Ru%2FFh2RMc8v2NBhSD6vMk9hWlI%3D&reserved=0><https://bootlin.com/>
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.com%2F&data=05%7C01%7Cp.lobacz%40welotec.com%7C144d5e10c57041bc852d08db8a9d349c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256180025031560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=XMC3vugVsU3kWlvJ7Ru%2FFh2RMc8v2NBhSD6vMk9hWlI%3D&reserved=0<https://bootlin.com/>

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

