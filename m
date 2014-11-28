Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4C831723BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 10:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sASAIBF1023496; Fri, 28 Nov 2014 10:18:11 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id s7BpgpsIwULb; Fri, 28 Nov 2014 10:18:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sASAHtCT023492
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 28 Nov 2014 10:18:07 GMT
Message-ID: <1417169911.15614.22.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Fri, 28 Nov 2014 10:18:31 +0000
In-Reply-To: <54781FA7.6000703@topic.nl>
References: <5476E26B.80003@topic.nl> <547712F1.9090209@mlbassoc.com>
	<1417094262.15614.6.camel@linuxfoundation.org>
	<547733B2.2010501@topic.nl>
	<1417099280.15614.11.camel@linuxfoundation.org>
	<547740A7.7000005@topic.nl>
	<1417105303.15614.16.camel@linuxfoundation.org>
	<54781FA7.6000703@topic.nl>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 28 Nov 2014 10:18:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2014-11-28 at 08:09 +0100, Mike Looijmans wrote:
> ﻿On 11/27/2014 05:21 PM, Richard Purdie wrote:
> > I suspect the intel boards you mention do suffer from the issue you
> > mention in a related way and the fix may be to s/MACHINE/PACKAGE_ARCH/
> > in DEPLOY_DIR_IMAGE as previously mentioned. The difference is I suspect
> > they deploy for the first machine built and then not for any other.
> > Nitin/Darren may be interested in checking into that.
> 
> Yes.
> 
> But if I set DEPOY_DIR_IMAGE to use MACHINE_ARCH, I get the opposite problem 
> of two MACHINEs overwriting eachothers root filesystem. Though the $MACHINE in 
> most of the filenames (which is typically removed for the links) might help 
> separate those.

Ok, I hadn't realised the rootfs was different in these cases (although
it makes sense).

> >> Please realize that the example is just an example. The actual problem
> >> I'm experiencing is with the kernel and bootloader!
> >
> > Right, the allarch behaviour is an illustration but not the underlying
> > problem you need to resolve (although its related).
> 
> Well, I thought I had it all sorted out, but I'm back to square one now.
> 
> What I'm really trying to do here is to create another "dimension".
>
> The board contains a combined ARM + FPGA. The ARM part is just like any other 
> machine, and it's the same on all boards.
> 
> The FPGA part also needs things built in the OE environment, and it has its 
> own OS and "applications" in the form of a static bitstream to configure the 
> whole device, and partial bitstreams that are swapped in and out at runtime to 
> use it for various different functions. The build structure works much like a 
> normal CPU toolchain, in that it creates the full bitstream which provides the 
> "library" (Xilinx calls this a checkpoint) for the partials.
> The FPGA can be of different types (currently we have xc7z015 and xc7z030 
> boards, but there are plans to create SOMs for various other types too), and 
> the bistreams are unique for each type, unlike CPU code, you cannot exchange 
> them. The FPGA recipes leave these checkpoints into the sysroot where other 
> FPGA recipes can pick them up and expand on them. Hence, I can't just make 
> separate recipes for different FPGA types, because they need the sysroot to be 
> specific to them.
> 
> So what I did was define the MACHINE as a combination of SOM+carrier+FPGA. The 
> SOM+carrier part went into SOM_FAMILY and MACHINE_ARCH, and the FPGA part into 
> the "FPGA_FAMILY" (and an FPGA_FAMILY_ARCH). The FPGA recipes use PACKAGE_ARCH 
> = "${FPGA_FAMILY_ARCH}".
> 
> This config file sets that up:
> https://github.com/topic-embedded-products/meta-topic/blob/master/conf/machine/include/topic-miami.inc
> 
> This has so far accomplished what I wanted to do, It makes all the ARM part 
> things (like kernel and bootloader) generic, because they don't depend on the 
> type of FPGA at all. And it makes the FPGA parts independent of the ARM side 
> too, drastically reducing build times (FPGA bitstreams typically take 1 to 4 
> hours to build, and that's for the smaller devices..) and heavily leaning on 
> shares sstate-cache so we can re-use a buildserver's nightly output all over 
> the place.
> 
> Another approach would be to introduce a global variable (FPGA_FAMILY?) that 
> has the same level as MACHINE does, and require it to be set in local.conf or 
> environment.
> By explicitly using FPGA_FAMILY in intermediate and output paths, I think I 
> can make it so that the sysroot can still hold the intermediate files for 
> various targets. And simply including FPGA_FAMILY in the rootfs image name 
> should solve the deployment issue.
> 
> I think more machines will emerge that need this kind of setup. The kernel has 
> already gotten quite good at supporting hardware that can just grow itself a 
> network card or i2c controller when it needs one...

At the risk of repeating myself, I still think what may work best is
making the kernel and bootloader specific to their own specific arch,
like meta-intel does. That way the machines will share the kernel and
bootloader but still have the correct namespaces. You can do something
similar for the FPGAs so they also have their own namespaces too.

Changing the top level control (MACHINE), whilst initially appealing is
problematic and whilst I can see more machines appearing like this, I
cannot see us wanting to add a new top level control to cater for it as
it will cause all kinds of problems. Even the naming is fraught with
problems (FPGA is too specific, it may not be a SOC, etc). I went
through this discussion with the Intel people and this is why meta-intel
inserted the level it did. This wasn't their first choice either, but
the alternatives don't make sense when you try and code them (and
consider the implications for usage of the system, documentation and so
on).

On the other hand, inserting a new level under MACHINE is well supported
and comparatively trivial. If this has issues, I believe we can fix them
without disrupting as much of the system, we just need to understand
what they are.

So I guess I'd ask why the level under MACHINE doesn't work for you and
what we can do to improve it?

Cheers,

Richard



