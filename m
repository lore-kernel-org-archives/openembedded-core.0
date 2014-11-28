Return-Path: <mike.looijmans@topic.nl>
Received: from smtp07.online.nl (smtp07.online.nl [194.134.42.52])
	by mail.openembedded.org (Postfix) with ESMTP id 011147240E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 18:48:32 +0000 (UTC)
Received: from smtp07.online.nl (localhost [127.0.0.1])
	by smtp07.online.nl (Postfix) with ESMTP id 543A1980A3;
	Fri, 28 Nov 2014 19:48:29 +0100 (CET)
Received: from [192.168.1.7] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp07.online.nl (Postfix) with ESMTP;
	Fri, 28 Nov 2014 19:48:29 +0100 (CET)
Message-ID: <5478C37C.7010209@topic.nl>
Date: Fri, 28 Nov 2014 19:48:28 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <5476E26B.80003@topic.nl> <547712F1.9090209@mlbassoc.com>			
	<1417094262.15614.6.camel@linuxfoundation.org>	
	<547733B2.2010501@topic.nl>		
	<1417099280.15614.11.camel@linuxfoundation.org>	
	<547740A7.7000005@topic.nl>
	<1417105303.15614.16.camel@linuxfoundation.org>	
	<54781FA7.6000703@topic.nl>
	<1417169911.15614.22.camel@linuxfoundation.org>
In-Reply-To: <1417169911.15614.22.camel@linuxfoundation.org>
X-Online-Scanned: by Cloudmark authority (on smtp07.online.nl)
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
X-List-Received-Date: Fri, 28 Nov 2014 18:48:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/2014 11:18 AM, Richard Purdie wrote:
> On Fri, 2014-11-28 at 08:09 +0100, Mike Looijmans wrote:
...
>> What I'm really trying to do here is to create another "dimension".
>>
>> The board contains a combined ARM + FPGA. The ARM part is just like any other
>> machine, and it's the same on all boards.
>>
>> The FPGA part also needs things built in the OE environment, and it has its
>> own OS and "applications" in the form of a static bitstream to configure the
>> whole device, and partial bitstreams that are swapped in and out at runtime to
>> use it for various different functions. The build structure works much like a
>> normal CPU toolchain, in that it creates the full bitstream which provides the
>> "library" (Xilinx calls this a checkpoint) for the partials.
>> The FPGA can be of different types (currently we have xc7z015 and xc7z030
>> boards, but there are plans to create SOMs for various other types too), and
>> the bistreams are unique for each type, unlike CPU code, you cannot exchange
>> them. The FPGA recipes leave these checkpoints into the sysroot where other
>> FPGA recipes can pick them up and expand on them. Hence, I can't just make
>> separate recipes for different FPGA types, because they need the sysroot to be
>> specific to them.
>>
>> So what I did was define the MACHINE as a combination of SOM+carrier+FPGA. The
>> SOM+carrier part went into SOM_FAMILY and MACHINE_ARCH, and the FPGA part into
>> the "FPGA_FAMILY" (and an FPGA_FAMILY_ARCH). The FPGA recipes use PACKAGE_ARCH
>> = "${FPGA_FAMILY_ARCH}".
>>
>> This config file sets that up:
>> https://github.com/topic-embedded-products/meta-topic/blob/master/conf/machine/include/topic-miami.inc
>>
>> This has so far accomplished what I wanted to do, It makes all the ARM part
>> things (like kernel and bootloader) generic, because they don't depend on the
>> type of FPGA at all. And it makes the FPGA parts independent of the ARM side
>> too, drastically reducing build times (FPGA bitstreams typically take 1 to 4
>> hours to build, and that's for the smaller devices..) and heavily leaning on
>> shares sstate-cache so we can re-use a buildserver's nightly output all over
>> the place.
>>
>> Another approach would be to introduce a global variable (FPGA_FAMILY?) that
>> has the same level as MACHINE does, and require it to be set in local.conf or
>> environment.
>> By explicitly using FPGA_FAMILY in intermediate and output paths, I think I
>> can make it so that the sysroot can still hold the intermediate files for
>> various targets. And simply including FPGA_FAMILY in the rootfs image name
>> should solve the deployment issue.
>>
>> I think more machines will emerge that need this kind of setup. The kernel has
>> already gotten quite good at supporting hardware that can just grow itself a
>> network card or i2c controller when it needs one...
>
> At the risk of repeating myself, I still think what may work best is
> making the kernel and bootloader specific to their own specific arch,
> like meta-intel does. That way the machines will share the kernel and
> bootloader but still have the correct namespaces. You can do something
> similar for the FPGAs so they also have their own namespaces too.
>
> Changing the top level control (MACHINE), whilst initially appealing is
> problematic and whilst I can see more machines appearing like this, I
> cannot see us wanting to add a new top level control to cater for it as
> it will cause all kinds of problems. Even the naming is fraught with
> problems (FPGA is too specific, it may not be a SOC, etc). I went

Agree FPGA is a bad word in this context, there could be multiple of 
these devices, and they could be DSPs or even CPUs. I'm going to keep 
calling it FPGA here, just for lack of a generic term like "secundary 
system" or so (tertiary?).

> through this discussion with the Intel people and this is why meta-intel
> inserted the level it did. This wasn't their first choice either, but
> the alternatives don't make sense when you try and code them (and
> consider the implications for usage of the system, documentation and so
> on).
>
> On the other hand, inserting a new level under MACHINE is well supported
> and comparatively trivial. If this has issues, I believe we can fix them
> without disrupting as much of the system, we just need to understand
> what they are.
>
> So I guess I'd ask why the level under MACHINE doesn't work for you and
> what we can do to improve it?

I tried going that way. I came to the conclusion that I wanted EVERY 
package that said it was MACHINE_ARCH was to be moved to the lower 
level. So that would be the same as simply setting, for a MACHINE="x-1"
MACHINE_ARCH="x". That accomplished what I wanted - the "1" part no 
longer mattered for any package that did not know about the FPGA part 
explicitly. The packages for the FPGA end up with PACKAGE_ARCH="1" in 
this case, so they're compatible with any other machine that carries the 
same FPGA part.

What I did was basically the same as the intel layer, only the intel 
layer only lowered the MACHINE_ARCH for bootloader and kernel, while I 
just set the whitelist of package to move to "all".

We ARE quite used to having these sub-systems around. Think about the 
firmware for GPU and WIFI chips for example. These are generally just 
binary blobs that magically appear out of the hat of a vendor. Now 
imagine that these were open source too, and that you have the option to 
build the firmware for the wifi or GPU chip from source in the build 
environment. How would you do that? Maybe a "sub" openembedded tree that 
builds the crosscompiler for it? Could I call bitbake recursively?
That's basically the same thing that's going on here.

Currently I'm trying to do the FPGA builds as the OMAPs do for the DSP, 
to download the tools and build the DSP code using these tools installed 
in the sysroot for the machine. But these packages just mention they're 
machine specific, which is not quite correct, since they're intended for 
the DSP on it.

These subsystems are totally unrelated to the main cpu system, and are 
orthogonal. You could have a system with a cpu, gpu, wifi and fpga, and 
that'd make 4 dimensions. The machines with the same GPU can share the 
binary result of that, the ones with the same wifi chip can share that 
(if they have a compatible driver...), etcetera.

Reading back my post now, it looks as though "dimensions" are what I 
really need to make this work as I'd like. Something like "MACHINE" 
being an array of sub-components:

MACHINE=["topic-miami", "xc7z015", ...]

That would also open up a path to have click-on boards (like many EVM 
boards support, e.g. pmods and FMC boards) in that list. These addon 
boards can usually be added to various machines, and aren't limited to 
certain architectures, but the functionality they provide is the same, 
and also the tools and drivers they'll need to function properly.

-- 
Mike Looijmans

