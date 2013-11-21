Return-Path: <ulf@emagii.com>
Received: from smtprelay-b22.telenor.se (smtprelay-b22.telenor.se
	[195.54.99.213])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3626DB81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:15:11 +0000 (UTC)
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id C8082CB21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 08:15:09 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgEYABOyjVJT4zlmPGdsb2JhbAANTIM/vkSBMwMBAQEBOIJaAQEBAQM4QRALGAklDwIyFAYNAQUCAQGIAgiuYZITjhUbAQGBBjMHhDIDmBKBMJQJgXA
X-IronPort-AV: E=Sophos;i="4.93,742,1378850400"; d="scan'208";a="358501558"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.236]) ([83.227.57.102])
	by ipb4.telenor.se with ESMTP; 21 Nov 2013 08:15:09 +0100
Message-ID: <528DB2FC.90205@emagii.com>
Date: Thu, 21 Nov 2013 08:15:08 +0100
From: Ulf Samuelsson <ulf@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <528D2429.7040705@emagii.com> <1384982956.16887.94.camel@ted>
	<528D3B01.8060700@emagii.com> <20131121001922.GW3708@jama>
In-Reply-To: <20131121001922.GW3708@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Improving Build Speed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ulf@emagii.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Nov 2013 07:15:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2013-11-21 01:19, Martin Jansa skrev:
> On Wed, Nov 20, 2013 at 11:43:13PM +0100, Ulf Samuelsson wrote:
>> 2013-11-20 22:29, Richard Purdie skrev:
>> Another idea:
>>
>> I suspect that there is a lot of unpacking and patching of recipes
>> for the target when the native stuff is built.
>> Does it make sense to have multiple threads reading the disk, for
>> the target recipes during the native build or will we just lose out
>> due to seek time?
>>
>> Having multiple threads accessing the disk, might force the disk to spend
>> most of its time seeking.
>> Found an application which measures seek time performance,
>> and my WD Black will do 83 seeks per second, and my SAS disk will do
>> twice that.
>> The RAID of two SAS disks will provide close to SSD throughput (380 MB/s)
>> but seek time is no better than a single SAS disk.
>>
>> Since there is "empty time" at the end of the native build, does it make
>> sense
>> to minimize unpack/patch of target stuff when we reach that point, and
>> then we let loose?
> In my benchmarks increasing PARALLEL_MAKE till number of cores was
> significantly improving build time, but BB_NUMBER_THREADS had minimal
> influence somewhere above 6 or 8 (tested on various systems, even only 4 was
> optimum on my older RAID-0 and 2 on single disk).
> Of course it was quite different for clean build without sstate
> prepopulated and build where most of the stuff was reused from sstate.
>
> see http://wiki.webos-ports.org/wiki/OE_benchmark

How many cores do you have in your build machine?
I started a build, and after 20 minutes it had completed 1500 tasks using:

PARALLEL_MAKE     = "-j24"
BB_NUMBER_THREADS =   "6"

The I decided to kill it.

When I did
PARALLEL_MAKE     = "-j12"
BB_NUMBER_THREADS =   "24"

It completed 2000 tasks in less than half the time.

This does not use tmpfs though.
Do you have any comparision between tmpfs builds and RAID builds?

I currently do not use INHERIT += "rm_work"
since I want to be able to do changes on some packages.
Is there a way to defined rm_work on a package basis?
Then the majority of the packages can be removed.

I use 75 GB without "rm_work"


BR
Ulf
>
>> ========================
>>
>> Now with 48 MB of RAM, (which I might grow to 96 GB, if someone proves that
>> this makes it faster), this might be useful to speed things up.
>>
>> Can tmpfs beat the kernel cache system?
>>
>> 1.    Typically, I work on less than 10 recipes, and if I continuosly
>>           rebuild those, why not create the build directories as links to
>> a tmpfs file system.
>>           Maybe a configuration file with a list of recipes to build on
>> tmpfs.
>>
>>           During a build from scratch, this is not so useful, but once
>> most stuff is in place, it might,
>>
>> 2.     If the downloads directory was shadowed in a tmpfs system
>>           then there would be less seek time during the build.
>>           The downloads tmpfs should be poplulated at boot time,
>>           and rsynced with a real disk in the background when new stuff
>>           is downloaded from internet.
>>
>> 3.     With 96 GB of RAM, maybe the complete build directory will fit.
>>           Would be nice to build everything on tmpfs, and automatically rsync
>>           to a real disk when there is nothing else to do...
>>
>> 4.     If not tmpfs is used, then It would still be good to have better
>> control
>>           over the build directory.
>>           It make sense to me to have the metadata on an SSD, but the
>>           build directory should be on my RAID cluster for fast rebuilds.
>>           I can set this up manually, but it would be better to be able to
>>           specify this in a configuration file.
>>
> See
> http://www.mail-archive.com/yocto@yoctoproject.org/msg14879.html
>


-- 
Best Regards
Ulf Samuelsson
ulf@emagii.com
+46 722 427437


