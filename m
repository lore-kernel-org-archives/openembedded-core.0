Return-Path: <ulf@emagii.com>
Received: from smtprelay-h31.telenor.se (smtprelay-h31.telenor.se
	[213.150.131.4])
	by mail.openembedded.org (Postfix) with ESMTP id BBF726E9A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 13:32:49 +0000 (UTC)
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h31.telenor.se (Postfix) with ESMTP id 71143E9545
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 14:32:49 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvUhAKEC6VJT4zlmPGdsb2JhbAANTIcYhDq1RoEcAwEBAQE4gloBAQEBAgEjFUABEAsYAgIFFgQHAgIJAwIBAgExFAYNAQUCAQGHeQ2pLXafVBeBKY1WB4JvgUkElECDaIpPiT+BPw
X-IPAS-Result: AvUhAKEC6VJT4zlmPGdsb2JhbAANTIcYhDq1RoEcAwEBAQE4gloBAQEBAgEjFUABEAsYAgIFFgQHAgIJAwIBAgExFAYNAQUCAQGHeQ2pLXafVBeBKY1WB4JvgUkElECDaIpPiT+BPw
X-IronPort-AV: E=Sophos;i="4.95,742,1384297200"; d="scan'208";a="789309263"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.57.102])
	by ipb1.telenor.se with ESMTP; 29 Jan 2014 14:32:22 +0100
Message-ID: <52E902E4.1040607@emagii.com>
Date: Wed, 29 Jan 2014 14:32:20 +0100
From: Ulf Samuelsson <ulf@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1390833588.17424.254.camel@ted>	
	<BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>	
	<52E8EF66.5040609@emagii.com> <1391000162.24655.67.camel@ted>
In-Reply-To: <1391000162.24655.67.camel@ted>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 29 Jan 2014 13:32:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

2014-01-29 13:56, Richard Purdie skrev:
> On Wed, 2014-01-29 at 13:09 +0100, Ulf Samuelsson wrote:
>> We discussed this 2.3 months ago.
>> Did some studies on my dual hex-core machine (24 H/W treads) while
>> building a cloud9-gnome-image derivative.
>> This did about 7500 tasks.
>>
>> Enabled the CPU supervisors in the panel.
>>
>> Everything seems to be ok with BB_NUMBER_THREADS = "24" for about 4-4500
>> tasks.
>>
>> Then the CPUs are mostly inactive and only 1-2 running for ~500 tasks.
>> Then parallellism  is resumed until about task 7000, and again
>> only a few CPUs are active.
> This is likely whilst the lib and toolchain is getting built.
>
>> I believe that some tools use "make" within the Makefile,
>> and they are written badly, and do not use "-j <n>" for
>> that part of the build.
> Which recipes were building at this point? It would be interesting to
> track them down.
I think eglibc, node[-js] (native) and a few others

Think I remember mentioning them when it was discussed.

webkit, node are also not running in parallell in later part of the build

>
>> Got my build down to 83 minutes.
>>
>> Since I have 96 GB of RAM, I tried creating an 80 GB tmpfs for the build,
>> and copied the download and the recipes to the ram.
>>
>> That shaved only 2 monutes from the build, and some stuff,
>> still built using only a single CPU.
> There are certainly dependency bottlenecks in the build such as the
> toolchain, compiler, gettext, gtk+ and so where large numbers of things
> need those dependencies to get built before they can proceed. Not sure
> what we can do to help this though.
In order to find out more, perhaps it should be possible to log info 
about the build.
1. How many makes are in progress when you start a task
2. How long does it take to build a recipe.
3. CPU activity (frequency scaling) when the recipe is build.

A recipe which takes very long time to build but with low CPU activity
should be analyzed to find out if more parallellism can be introduced.

BR
Ulf
>
> Cheers,
>
> Richard
>


-- 
Best Regards
Ulf Samuelsson
ulf@emagii.com
+46 722 427437


