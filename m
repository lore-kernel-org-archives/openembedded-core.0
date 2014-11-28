Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0FE723BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 07:09:51 +0000 (UTC)
Received: from amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.58])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 85A9740112;
	Fri, 28 Nov 2014 08:09:50 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Fri, 28 Nov 2014 08:09:49 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS;
	Fri, 28 Nov 2014 08:09:27 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Fri, 28 Nov 2014 08:09:42 +0100
Message-ID: <54781FA7.6000703@topic.nl>
Date: Fri, 28 Nov 2014 08:09:27 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <5476E26B.80003@topic.nl> <547712F1.9090209@mlbassoc.com>		
	<1417094262.15614.6.camel@linuxfoundation.org>
	<547733B2.2010501@topic.nl>	
	<1417099280.15614.11.camel@linuxfoundation.org>
	<547740A7.7000005@topic.nl>
	<1417105303.15614.16.camel@linuxfoundation.org>
In-Reply-To: <1417105303.15614.16.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org, "Hart,
	Darren" <darren.hart@intel.com>
Subject: Re: Deployment for machine X will remove its results from machine Y's deploy dir
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
X-List-Received-Date: Fri, 28 Nov 2014 07:09:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 11/27/2014 05:21 PM, Richard Purdie wrote:
> On Thu, 2014-11-27 at 16:17 +0100, Mike Looijmans wrote:
>> If I understand correctly, having two "MACHINE" share the same
>> MACHINE_ARCH (which is the case for several intel boards too), is not
>> actually allowed?
>>
>> Because you get the same kernel/bootloader for different machines then.
>> That's what I wanted, and that triggered me finding this issue.
>
> Its a very good question. As things stand today, there is a one to one
> mapping between MACHINE_ARCH and MACHINE, the difference being the
> removal of invalid characters for the package namespace. That implies
> that no, its not allowed.

Okay... So I have to revert that, even through it worked remarkably well so=
=20
far (until I found this issue - compared to the situation before that, this=
 is=20
still a vast improvement).

> The intel boards you mention do something a little different, they
> inject a new "arch" into the hierarchy and then several machines share
> that common "arch".

Yeah. I did basically the opposite, I expanded the MACHINE with an extra=20
suffix and then stripped the suffix away when composing the MACHINE_ARCH.

> I suspect the intel boards you mention do suffer from the issue you
> mention in a related way and the fix may be to s/MACHINE/PACKAGE_ARCH/
> in DEPLOY_DIR_IMAGE as previously mentioned. The difference is I suspect
> they deploy for the first machine built and then not for any other.
> Nitin/Darren may be interested in checking into that.

Yes.

But if I set DEPOY_DIR_IMAGE to use MACHINE_ARCH, I get the opposite proble=
m=20
of two MACHINEs overwriting eachothers root filesystem. Though the $MACHINE=
 in=20
most of the filenames (which is typically removed for the links) might help=
=20
separate those.

>> Please realize that the example is just an example. The actual problem
>> I'm experiencing is with the kernel and bootloader!
>
> Right, the allarch behaviour is an illustration but not the underlying
> problem you need to resolve (although its related).

Well, I thought I had it all sorted out, but I'm back to square one now.

What I'm really trying to do here is to create another "dimension".

The board contains a combined ARM + FPGA. The ARM part is just like any oth=
er=20
machine, and it's the same on all boards.

The FPGA part also needs things built in the OE environment, and it has its=
=20
own OS and "applications" in the form of a static bitstream to configure th=
e=20
whole device, and partial bitstreams that are swapped in and out at runtime=
 to=20
use it for various different functions. The build structure works much like=
 a=20
normal CPU toolchain, in that it creates the full bitstream which provides =
the=20
"library" (Xilinx calls this a checkpoint) for the partials.
The FPGA can be of different types (currently we have xc7z015 and xc7z030=20
boards, but there are plans to create SOMs for various other types too), an=
d=20
the bistreams are unique for each type, unlike CPU code, you cannot exchang=
e=20
them. The FPGA recipes leave these checkpoints into the sysroot where other=
=20
FPGA recipes can pick them up and expand on them. Hence, I can't just make=
=20
separate recipes for different FPGA types, because they need the sysroot to=
 be=20
specific to them.

So what I did was define the MACHINE as a combination of SOM+carrier+FPGA. =
The=20
SOM+carrier part went into SOM_FAMILY and MACHINE_ARCH, and the FPGA part i=
nto=20
the "FPGA_FAMILY" (and an FPGA_FAMILY_ARCH). The FPGA recipes use PACKAGE_A=
RCH=20
=3D "${FPGA_FAMILY_ARCH}".

This config file sets that up:
https://github.com/topic-embedded-products/meta-topic/blob/master/conf/mach=
ine/include/topic-miami.inc

This has so far accomplished what I wanted to do, It makes all the ARM part=
=20
things (like kernel and bootloader) generic, because they don't depend on t=
he=20
type of FPGA at all. And it makes the FPGA parts independent of the ARM sid=
e=20
too, drastically reducing build times (FPGA bitstreams typically take 1 to =
4=20
hours to build, and that's for the smaller devices..) and heavily leaning o=
n=20
shares sstate-cache so we can re-use a buildserver's nightly output all ove=
r=20
the place.

Another approach would be to introduce a global variable (FPGA_FAMILY?) tha=
t=20
has the same level as MACHINE does, and require it to be set in local.conf =
or=20
environment.
By explicitly using FPGA_FAMILY in intermediate and output paths, I think I=
=20
can make it so that the sysroot can still hold the intermediate files for=20
various targets. And simply including FPGA_FAMILY in the rootfs image name=
=20
should solve the deployment issue.

I think more machines will emerge that need this kind of setup. The kernel =
has=20
already gotten quite good at supporting hardware that can just grow itself =
a=20
network card or i2c controller when it needs one...


Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


