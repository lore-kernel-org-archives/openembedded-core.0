Return-Path: <openembedded-core@emagii.com>
Received: from smtprelay-b32.telenor.se (smtprelay-b32.telenor.se
	[213.150.131.21])
	by mail.openembedded.org (Postfix) with ESMTP id 492E16DB8E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 22:43:13 +0000 (UTC)
Received: from ipb5.telenor.se (ipb5.telenor.se [195.54.127.168])
	by smtprelay-b32.telenor.se (Postfix) with ESMTP id EF846C47A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:43:14 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AosaAJI6jVJT4zlmPGdsb2JhbAANTIM/vWxOgTADAQEBATiCWgEBAQECAQEBASQRNAIIAhELGAkWDwkDAgECARUBGxQTBgIBARqHXQsIrmaSAxeOFYEjOoQyA5VDgk+BL5QHgXA
X-IronPort-AV: E=Sophos;i="4.93,739,1378850400"; d="scan'208";a="433610800"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.236]) ([83.227.57.102])
	by ipb5.telenor.se with ESMTP; 20 Nov 2013 23:43:14 +0100
Message-ID: <528D3B01.8060700@emagii.com>
Date: Wed, 20 Nov 2013 23:43:13 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <528D2429.7040705@emagii.com> <1384982956.16887.94.camel@ted>
In-Reply-To: <1384982956.16887.94.camel@ted>
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
X-List-Received-Date: Wed, 20 Nov 2013 22:43:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2013-11-20 22:29, Richard Purdie skrev:
> Hi Ulf,
>
> Nice to see someone else looking at this. I've shared some of my
> thoughts and observations below based on some of the work I've done
> trying to speed things up.
>
> On Wed, 2013-11-20 at 22:05 +0100, Ulf Samuelsson wrote:
>> Finally got my new build machine running. so I thought I'd measure
>> the performance vs the old machine
>>
>> Home Built
>> Core i7-980X
>>       6 core/12 threads @ 3,33GHz
>>       12 GB RAM @ 1333 Mhz.
>>       WD Black 1 TB @ 7200 rpm
>>
>> Precision 7500
>>       2 x  (X5670 6 core 2,93 MHz)
>>       2 x (24 GB RAM @ 1333 MHz)
>>       2 x SAS 600 GB / 15K rpm, Striped RAID
>>
>> Run Angstrom Distribution
>>
>> oebb.sh config beaglebone
>> bitbake cloud9-<my>-gnome-image  (It is slightly extended)
>>
>> The first machine build this in about three hours using
>> PARALLEL_MAKE = "-j6"
>> BB_NUMBER_THREADS = "6"
>>
>> The second machine build this much faster:
>>
>> Initially tried
>>
>> PARALLEL_MAKE = "-j2"
>> BB_NUMBER_THREADS = "12"
>>
>> but the CPU frequency tool showed it to idle.
>> Changed to:
>>
>> PARALLEL_MAKE = "-j6"
>> BB_NUMBER_THREADS = "24"
>>
>> and was quicker, but it seemed to be a little flawed.
>> At several times during the build, the CPU frequtil
>> showed that most of the cores went down to
>> minimum frequency (2,93 GHz -> 1,6 GHz)
>>
>> The image build breaks down into 7658 tasks
>>
>> 19:36    Start of Pseudo Build
>> 19:40    Start of real build
>> 19:42    Task 1000 built         2 minutes
>> 19:45    Task 2000 built         3 minutes
>> 19:47    Task 3000 built         2 minutes
>> 19:48    Task 3500 built         1 minute
>> 19:57    Task 4000 built         9 minutes ****** (1)
>> 20:00    Task 4500 built         3 minutes
>> 20:04    Task 5000 built         4 minutes
>> 20:14    Task 5700 built       10 minutes
>> 20:17    Task 6000 built         3 minutes
>> 20:27    Task 6500 built       10 minutes
>> 20:43    Task 7500 built       16 minutes
>> 20:52    Task 7657 built         9 minutes ******* (2)
>> 20:59    Task 7658 built         7 minutes ******* (3) (do_rootfs)
>>
>> Total Time 83 minutes
> FWIW this is clearly an older revision of the system. We now build
> pseudo in tree so the "Start of Pseudo Build" no longer exists. There
> have been several fixes in various performance areas recently too which
> all help a little. If that saves us the single threaded first 4 minutes
> that is clearly a good thing! :)
This is the Angstrom Master, which is Yocto-1.3
Had problems getting the build to complete with the Angstrom Yocto-1.4

>> There are several reasons for the speed traps.
>>
>> (1) This occurs at the end of the build of the native tools
>>         The build of the cross packages has started and stuff are unpacked
>>         and patched, and waiting for eglibc to be ready.
> We have gone through this "critical path" and tried to strip out as many
> dependencies as we can without sacrificing correctness. I'm open to
> further ideas.
>
>> (2) This occurs at the end of the build, when very few packages
>>         are left to build so the RunQueue only contains a few packages.
>>
>>         Had a look at the packages built at the end.
>>
>>         webkit-gtk, gimp, abiword pulseaudio.
>>
>>       abiword has PARALLEL_MAKE = "" and takes forever.
>>       I tried building an image with PARALLEL_MAKE = "-j24" and this
>> build completes without problem.
>>       but I have not loaded it to a target yet.
>>       AbiWord seems to be compiling almost alone for a long time.
>>
>>       Webkit-gtk has a strange fix in do_compile.
>>
>> do_compile() {
>>       if [ x"$MAKE" = x ]; then MAKE=make; fi
>>       ...
>>       for error_count in 1 2 3; do
>>           ...
>>           ${MAKE} ${EXTRA_OEMAKE} "$@" || exit_code=1
>>           ...
>>       done
>>       ...
>> }
>>
>>       Not sure, but I think this means that PARALLEL_MAKE might get ignored.
> I think we got rid of this in master. It was to workaround make bugs
> which we now detect and error upon instead.
>
>>       Why restrict PARALLEL_MAKE to anything less than the number of H/W
>> threads in the machine?
>>
>>       Came up with a construct PARALLEL_HIGH which is defined alongside
>> PARALLEL_MAKE in conf/local.conf
>>
>>       PARALLEL_MAKE = "-j8"
>>       PARALLEL_HIGH = "-j24"
>>
>>       In the appropriate recipes, which seems to be processed by bitbake
>> in solitude I do:
>>
>>       PARALLEL_HIGH ?= "${PARALLEL_MAKE}"
>>       PARALLEL_MAKE  = "${PARALLEL_HIGH}"
>>
>>       This means that they will try to use each H/W thread.
> Please benchmark the difference. I suspect we can just set the high
> number of make for everything. Note that few makefiles are well enough
> written to benefit from high levels of make (webkit being an notable
> exception).

I only checked a few, and no hard data, but looking at the cpufreq
it certainly seemed better.
Hard data is needed of course, so I will try that tomorrow.

>
>>       When I looked at the bitbake runqueue stuff, it seems to prioritize
>>       things with a lot of dependencies, which results in things like the
>> webkit-gtk
>>       beeing built among the last packages.
>>
>>       It would probably be better if the webkit-gtk build started earlier,
>>       so that the gimp build which depends on webkit-gtk, does not have
>>       to run as a single task for a few minutes.
>>
>>       I am thinking of adding a few dummy packages which depend on
>> webkit-gtk and the
>>       other long builds at the end, to fool bitbake to start their build
>> earlier,
>>       but it might be a better idea, if a build hint could be part of the
>> recipe.
>>
>>       I guess a value, which could be added to the dependency count would
>> not be
>>       to hard to implement (for those that know how)
> It would be easy to write a custom scheduler which hardcoded
> prioritisation of critical path items (or slow ones). Its an idea I've
> not tried yet and would be easier than artificial dependency trees.
I generated a recipe which just installs /home/root
but depends on a few things like gimp, webkit-gtk etc
to see if I can get them to start earlier.
Then I duplicated it 15 times and made a recipe which depends on these 15,
and included the latter recipe in the image.

Unfortunately this does not seem to make a difference.
It was actually a few seconds slower, which I guess is due
to the extra build time of the new recipes.
gimp is still there as the only thread at the end.
It could be that webkit-gtk depends on so many things it *has* to be 
built at the end.
>
> One point to note is that looking at the build "bootcharts", there are
> "pinch points". For core-image-sato, these are notably the toolchain,
> then gettext, then gtk, then gstreamer. I suspect webkit has a similar
> issue to that.

Another idea:

I suspect that there is a lot of unpacking and patching of recipes
for the target when the native stuff is built.
Does it make sense to have multiple threads reading the disk, for
the target recipes during the native build or will we just lose out
due to seek time?

Having multiple threads accessing the disk, might force the disk to spend
most of its time seeking.
Found an application which measures seek time performance,
and my WD Black will do 83 seeks per second, and my SAS disk will do 
twice that.
The RAID of two SAS disks will provide close to SSD throughput (380 MB/s)
but seek time is no better than a single SAS disk.

Since there is "empty time" at the end of the native build, does it make 
sense
to minimize unpack/patch of target stuff when we reach that point, and
then we let loose?

========================

Now with 48 MB of RAM, (which I might grow to 96 GB, if someone proves that
this makes it faster), this might be useful to speed things up.

Can tmpfs beat the kernel cache system?

1.    Typically, I work on less than 10 recipes, and if I continuosly
         rebuild those, why not create the build directories as links to 
a tmpfs file system.
         Maybe a configuration file with a list of recipes to build on 
tmpfs.

         During a build from scratch, this is not so useful, but once 
most stuff is in place, it might,

2.     If the downloads directory was shadowed in a tmpfs system
         then there would be less seek time during the build.
         The downloads tmpfs should be poplulated at boot time,
         and rsynced with a real disk in the background when new stuff
         is downloaded from internet.

3.     With 96 GB of RAM, maybe the complete build directory will fit.
         Would be nice to build everything on tmpfs, and automatically rsync
         to a real disk when there is nothing else to do...

4.     If not tmpfs is used, then It would still be good to have better 
control
         over the build directory.
         It make sense to me to have the metadata on an SSD, but the
         build directory should be on my RAID cluster for fast rebuilds.
         I can set this up manually, but it would be better to be able to
         specify this in a configuration file.

>> (3) Creating the rootfs seems to have zero parallelism.
>>       But I have not investigated if anything can be done.
> This is something I do want to fix in 1.6. We need to convert the core
> to python to gain access to easier threading mechanisms though.
> Certainly parallel image type generation and compression would be a win
> here.
>   
>>       ===================================
>>
>> So I propose the following changes:
>>
>> 1.Remove PARALLEL_MAKE = "" from abiword
>> 2.Add the PARALLEL_HIGH variable to a few recipes.
>> 3.Investigate if we can force the build of a few packages to an earlier
>> point.
>>
>> =======================================
>> BTW: Have noticed that there are some dependencies missing from the recipes.
>>
>>
>>
>> DEPENDENCY BUGS
>> pangomm    needs to depend on "pango"
>>       Otherwise, the required pangocairo might not be available when
>> pangomm is configured
>>
>> goffice needs to depend on "librsvg gdk-pixbuf"
>>       Also on "gobject-2.0 gmodule-2.0 gio-2.0", but I  did not find
>> those packages,
>>       so I assume they are generated somewhere. Did not investigate further.
> I'm sure patches would be most welcome for bugs like this.
>
> Cheers,
>
> Richard
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Best Regards
Ulf Samuelsson
eMagii


