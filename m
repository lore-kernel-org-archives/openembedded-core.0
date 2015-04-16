Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 433 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Apr 2015 07:49:14 UTC
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 54DEB73D45
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 07:49:13 +0000 (UTC)
Received: from mail2.sbs.de (localhost [127.0.0.1])
	by gecko.sbs.de (8.14.3/8.14.3) with ESMTP id t3G7fv4D029821;
	Thu, 16 Apr 2015 09:41:57 +0200
Received: from DEFTHW99ERMMSX.ww902.siemens.net
	(defthw99ermmsx.ww902.siemens.net [139.22.70.142])
	by mail2.sbs.de (8.14.3/8.14.3) with ESMTP id t3G7fs7v003838
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Apr 2015 09:41:54 +0200
Received: from DEFTHW99ERTMSX.ww902.siemens.net (139.22.70.200) by
	DEFTHW99ERMMSX.ww902.siemens.net (139.22.70.142) with Microsoft SMTP
	Server (TLS) id 14.3.235.1; Thu, 16 Apr 2015 09:41:54 +0200
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.16]) by
	DEFTHW99ERTMSX.ww902.siemens.net ([139.22.70.200]) with mapi id
	14.03.0235.001; Thu, 16 Apr 2015 09:41:53 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Nikolay Dimitrov <picmaster@mail.bg>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Thread-Topic: [yocto] Move device tree generation from include file to bbclass
Thread-Index: AQHQd5cEbjf/yJkqmESlI0boWToIP51PQA3Q
Date: Thu, 16 Apr 2015 07:41:52 +0000
Message-ID: <355BE46A91031048906B695426A8D8E616B7C40A@DEFTHW99EH4MSX.ww902.siemens.net>
References: <355BE46A91031048906B695426A8D8E616B7BE37@DEFTHW99EH4MSX.ww902.siemens.net>
	<552E63F1.9090406@windriver.com>	<552E824C.5080603@mail.bg>
	<CADkTA4Puh7QLQemCSrewmMqcnrUJFw4x6bEJsmKu=SRk6C07-A@mail.gmail.com>
	<552E8DD9.6090202@mail.bg>
In-Reply-To: <552E8DD9.6090202@mail.bg>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.52]
MIME-Version: 1.0
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, Patches and
	discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Move device tree generation from include file to bbclass
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
X-List-Received-Date: Thu, 16 Apr 2015 07:49:14 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Bruce, Hi Nikolay

> >>>>
> >>>
> >>> Adding oe-core, since that's the right place to have a discussion
> >>> like this.

Thanks I'm never sure where to ask what :)
> >>>
> >>>> As ARM now also moved to device tree it look like in future we
> will
> >>>> have more kernels that are using device tree then ones that are
> >>>> not.
> >>>
> >>>
> >>> True, but it has been like this for quite some time now :)
> >>>
> >>>> As far as I understand currently the generation of device trees is
> >>>> controlled via KERNEL_DEVICETREE and is handled in via an include
> >>>> file recipes-kernel/linux/linux-dtb.inc.
> >>>>
> >>>> I was thinking about moving this include into a class so it
> becomes
> >>>> easier to use. Before I dive into implementing something I would
> >>>> like some feedback from the community.
> >>>
> >>>
> >>> The big trick with changing anything like this is compatibility
> with
> >>> existing recipes. Whatever we do, existing recipes and layers
> >>> shouldn't be broken .. or if they are broken, there should be a
> >>> compelling technical reason to do so.
> >>>
> >>>>
> >>>> I have the following variant in mind.
> >>>>
> >>>> Add the device tree generation to the current kernel.bbclass (or
> >>>> let kernel.bblcass inherit from a kernel-dtb.bbclass).
> >>>> This way all kernels would automatically be DT enabled. The class
> >>>> would check if KERNEL_DEVICETREE is set and generate device trees
> >>>> based on this information. For boards that don't have
> >>>> KERNEL_DEVICETREE set the class would do nothing and the behavior
> >>>> is like before. The advantage I see with this approach is that the
> >>>> only thing a user needs to do is to set KERNEL_DEVICETREE in the
> >>>> board and make sure the device trees are available in the kernel
> >>>> they like to build.
> >>>
> >>>
> >>> That's pretty much the experience that most users have now, since
> >>> there's nearly always a kernel recipe created, that recipe includes
> >>> linux-dtb.inc, and sets KERNEL_DEVICETREE.
> >>
> >>
> >> As far as I understood, Pascal's idea is to remove the need for user
> >> recipes to include linux-dtb.inc, and provide this functionality via
> >> inheritance.
> >
> > That is obvious. My questions are around "why". There's no big
> > technical advantage, and if you remove that existing file, you break
> > existing recipes. Which means you need to leave a stub in place.
> >
> > So without a technical advantage, it's churn for the sake of churn.
>=20
> Well, removing redundancy and simplifying users' recipes could be
> considered an advantage. Also, as the contents of linux-dtb.inc are
> going to be moved to bbclass, the file can be left empty, later
> maintainers remove the extra line from all users' recipes in following
> commits. I don't see breaking as an option.

I completely agree that it is not worth to breaking existing recipes becaus=
e of that.
But I think the option with an empty linux-dtb.inc is acceptable.

> >>> Everything else happens to build and package the device tree.
> >>>
> >>> Was there something specifically that was causing issues with the
> >>> current way of building them ?

There was no specific issue except that it feels like an unnecessary includ=
es.
And it seems a bit odd to me that most of the work of building the kernel i=
s done in bbclasses,=20
while just the dtb handling is done with an include. But of course it still=
 is more of a cosmetic=20
change than a real technical necessity.

Regards
Pascal


