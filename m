Return-Path: <openembedded-core@emagii.com>
Received: from smtprelay-h21.telenor.se (smtprelay-h21.telenor.se
	[195.54.99.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5516E7DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 12:09:35 +0000 (UTC)
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 20B31E9301
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 13:09:34 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AiUSALfu6FJT4zlmPGdsb2JhbAANTINEvQVPgRsDAQEBATiCWgEBAQECAQEBATU2CgYLCyEWBAsJAwIBAgEVARsUEwYCAQGHeQ0IqQigTxePBoQ4BJVVglOBMokdiT+BPw
X-IronPort-AV: E=Sophos;i="4.95,741,1384297200"; d="scan'208";a="795240255"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.57.102])
	by ipb2.telenor.se with ESMTP; 29 Jan 2014 13:09:11 +0100
Message-ID: <52E8EF66.5040609@emagii.com>
Date: Wed, 29 Jan 2014 13:09:10 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1390833588.17424.254.camel@ted>
	<BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>
In-Reply-To: <BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Wed, 29 Jan 2014 12:09:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2014-01-28 11:08, Koen Kooi skrev:
> Op 27 jan. 2014, om 15:39 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
>
>> Its rather sad that people don't appear to read local.conf and then complain
>> about slow builds when they're just using a single thread. Most systems have
>> more than one core now so we might as well use a more automatic default
>> for these values. This may lead to better experiences for new users.
>>
>> [YOCTO #2528]
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
>> index 71856b8..36d33e1 100644
>> --- a/meta/conf/local.conf.sample
>> +++ b/meta/conf/local.conf.sample
>> @@ -18,12 +18,18 @@
>> # option determines how many tasks bitbake should run in parallel:
>> #
>> #BB_NUMBER_THREADS ?= "4"
>> +#
>> +# Default to setting automatically based on cpu count
>> +BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
> I've noticed that after 4 threads IO becomes a big bottleneck when you have things like webkit, qt, asio etc in the buildqueue. Combine that with issues like every make -j thread taking >2GB ram with asio and webkit this default seems a bit high. I'd use 0.5*numcpu with a lower bound of 2.
>
> regards,
We discussed this 2.3 months ago.
Did some studies on my dual hex-core machine (24 H/W treads) while 
building a cloud9-gnome-image derivative.
This did about 7500 tasks.

Enabled the CPU supervisors in the panel.

Everything seems to be ok with BB_NUMBER_THREADS = "24" for about 4-4500 
tasks.

Then the CPUs are mostly inactive and only 1-2 running for ~500 tasks.
Then parallellism  is resumed until about task 7000, and again
only a few CPUs are active.

I believe that some tools use "make" within the Makefile,
and they are written badly, and do not use "-j <n>" for
that part of the build.

Got my build down to 83 minutes.

Since I have 96 GB of RAM, I tried creating an 80 GB tmpfs for the build,
and copied the download and the recipes to the ram.

That shaved only 2 monutes from the build, and some stuff,
still built using only a single CPU.

BR
Ulf Samuelsson


> Koen
>
>> #
>> # The second option controls how many processes make should run in parallel when
>> # running compile tasks:
>> #
>> #PARALLEL_MAKE ?= "-j 4"
>> #
>> +# Default to setting automatically based on cpu count
>> +PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
>> +#
>> # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>> # be appropriate for example.
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Best Regards
Ulf Samuelsson
eMagii


