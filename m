Return-Path: <openembedded-core@emagii.com>
Received: from smtprelay-b22.telenor.se (smtprelay-b22.telenor.se
	[195.54.99.213])
	by mail.openembedded.org (Postfix) with ESMTP id B13D16D159
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2013 15:06:41 +0000 (UTC)
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id 08E76EAA53
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2013 16:06:39 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmIbAGDEkFJT4zlmPGdsb2JhbAANTIM/vCNOgS8DAQEBATiCWgEBAQECAQEBATU2CgYLCxgJFg8JAwIBAgEVARsUEwYCAQGHdwsIrVuRYReOMCQ6hDMDlUWCT4EwlAuBaA
X-IronPort-AV: E=Sophos;i="4.93,758,1378850400"; d="scan'208";a="439358997"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.236]) ([83.227.57.102])
	by ipb3.telenor.se with ESMTP; 23 Nov 2013 16:06:36 +0100
Message-ID: <5290C47B.3030100@emagii.com>
Date: Sat, 23 Nov 2013 16:06:35 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <528D2429.7040705@emagii.com>
	<1384982956.16887.94.camel@ted>	<528DBE98.3080309@emagii.com>
	<1385042000.16887.133.camel@ted>
In-Reply-To: <1385042000.16887.133.camel@ted>
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
X-List-Received-Date: Sat, 23 Nov 2013 15:06:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2013-11-21 14:53, Richard Purdie skrev:
> On Thu, 2013-11-21 at 09:04 +0100, Ulf Samuelsson wrote:
>>>>        Why restrict PARALLEL_MAKE to anything less than the number of H/W
>>>> threads in the machine?
>>>>
>>>>        Came up with a construct PARALLEL_HIGH which is defined alongside
>>>> PARALLEL_MAKE in conf/local.conf
>>>>
>>>>        PARALLEL_MAKE = "-j8"
>>>>        PARALLEL_HIGH = "-j24"
>>>>
>>>>        In the appropriate recipes, which seems to be processed by bitbake
>>>> in solitude I do:
>>>>
>>>>        PARALLEL_HIGH ?= "${PARALLEL_MAKE}"
>>>>        PARALLEL_MAKE  = "${PARALLEL_HIGH}"
>>>>
>>>>        This means that they will try to use each H/W thread.
>>> Please benchmark the difference. I suspect we can just set the high
>>> number of make for everything. Note that few makefiles are well enough
>>> written to benefit from high levels of make (webkit being an notable
>>> exception).
>>>
>> It looks like it is shaving off  ~2 minutes from a build which normally
>> takes ~84 minutes.
>>
>> First build
>> PARALLEL_MAKE = "-j12"
>> PARALLEL_HIGH = "-j24"
>> BB_NUMBER_THREADS = "24"
>> real    83m24.093s
>>
>> Second build
>> PARALLEL_MAKE = "-j12"
>> PARALLEL_HIGH = "-j12"
>> BB_NUMBER_THREADS = "24"
>> real    85m12.007s
> but what if you set both to -j24?
>
> What I'm trying to understand is if we really need two different
> variables?
>
> Note you can also do:
>
> PARALLEL_MAKE = "-j12"
> PARALLEL_MAKE_pn-webkit-gtk = "-j24"
>
> so I'm still not convinced we want to start having PARALLEL_HIGH as it
> will just confuse users IMO.
Today I tried building Angstrom cloud9-gnome-image which is about 75 GB.

"sources" and "build" both located in tmpfs.
(What the heck, RAM is cheap)

PARALLEL_MAKE = "-j 12"
PARALLEL_HIGH = "24"
BB_NUMBER_THREADS = "24"

The time to build from a RAID 0  (2 x SAS 15k RPM) was 01:23:25
The time to build from tmpfs  was 01:21:15
     This includes rsync'ing the deploy directory to the RAID disk
so improving disk performance has its limits.
     (It was nice not listening to the disk seeks though)

Only a 2 minute difference which is a bit disappointing...

It completed 7658 task.
I tried to check parallellity during the build by:

ps -e | grep make  | wc -l

Everythings seems to be nice until about 3500 tasks.

Then the numbed of makes drop dramatically

When gcc-cross-linaro was built, only 2 makes are in progress.
Between 4000 - 6000 the number of makes vary around 10-20
After 6000 it rises and varies between 30-50.
     There is a noticeable slowdown in task completion rate
Around 7500 the number of tasks drop to a handful, and so does
the number of makes.
When gimp is the only package compiling, make count = 4

13:52:22
Building cloud9-icu-gnome-image
14:12:20    4000    19:58
14:19:04    5000    04:44    makes = (10-20)
14:27:21    5531
14:31:48    6000    12:44    makes = (30-50)
14:40:43    6500    08:57
14:57:42    7500    16:59
15:03:38    7647
15:06:45    7657    building gimp
15:13:56    7658    do_rootfs

============================================

I suspect that there are a number of packages that ignore PARALLEL_MAKE
by "${MAKE} target inside the Makefile without passing PARALLEL_MAKE

The gcc compiler build is one, but I suspect
eglibc
eglibc-locale
webkit-gtk
pulseaudio
gimp
inkscape
glib-2.0

as well

============================================
Running 50 makes on a 24 thread machine is probably no good.

One possible idea would be to count most tasks a "1" thread
but to count a "do_compile" as "2" or "3" threads when determining
whether to start new tasks or not.

If there are few computables, then this would not limit anything,

If there are many compiles that are computable,  then fewer would be 
started.
I suspect the latter part of the build will benefit.
Know too little about the bitbake source to do modifications,
but I think that if every time a do_compile is started, a variable 
"maketasks" is
increased, and then decreased when stop you could do:

     if ((activity + (maketasks * scale_factor)) < number_tasks) then


It would reduce the risk of getting into the situations where you have man
more make provesses than H/W threads.

Since the behaviour of the build varies over time, I think a dynamic 
algorithm
of some kind is needed.

Would it not be fun, if bitbake could tell the kernel how many makes to 
allow
at a certan point of time?
and make would request a number of threads, but would be satisfied
with the number provided by the kernel
===============================
BTW: found another lacking dependency

parted needs libdl during configure, which means it needs
to depend on "eglibc".


BR
Ulf Samuelsson

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


