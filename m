Return-Path: <mike.looijmans@topic.nl>
Received: from smtp04.online.nl (smtp04.online.nl [194.134.41.34])
	by mail.openembedded.org (Postfix) with ESMTP id 252E56E9AE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2014 09:21:52 +0000 (UTC)
Received: from smtp04.online.nl (localhost [127.0.0.1])
	by smtp04.online.nl (Postfix) with ESMTP id 70420E16E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2014 10:21:51 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp04.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2014 10:21:51 +0100 (CET)
Message-ID: <52ECBCAF.1060403@topic.nl>
Date: Sat, 01 Feb 2014 10:21:51 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1390833588.17424.254.camel@ted>	<BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>	<52E8EF66.5040609@emagii.com>
	<1391000162.24655.67.camel@ted>
In-Reply-To: <1391000162.24655.67.camel@ted>
X-Online-Scanned: by Cloudmark authority (on smtp04.online.nl)
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Sat, 01 Feb 2014 09:21:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/29/2014 01:56 PM, Richard Purdie wrote:
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
>
> This is likely whilst the lib and toolchain is getting built.
>
>> I believe that some tools use "make" within the Makefile,
>> and they are written badly, and do not use "-j <n>" for
>> that part of the build.
>
> Which recipes were building at this point? It would be interesting to
> track them down.

I would suspect "recursive" makes. If you use autotools with the evil 
"SUDIRS=..." construction, it will WAIT for that dir to finish before 
doing anything else.
It's much better to construct a giant makefile in the root, autotools 
will happily do that once properly instructed. I've seen first time 
builds going from half an hour to two minutes, and incremental builds 
taking only one or two seconds instead of several minutes just because I 
removed the recursion.

>> Got my build down to 83 minutes.
>>
>> Since I have 96 GB of RAM, I tried creating an 80 GB tmpfs for the build,
>> and copied the download and the recipes to the ram.
>>
>> That shaved only 2 monutes from the build, and some stuff,
>> still built using only a single CPU.

That confirms what I have already suspected - it is pointless to buy an 
SSD, building OE is mostly CPU limited and hardly I/O related.

I guess the only way to really speed up the build would be to have 
multiple machines participate in it. Single machines aren't really 
getting any faster.

> There are certainly dependency bottlenecks in the build such as the
> toolchain, compiler, gettext, gtk+ and so where large numbers of things
> need those dependencies to get built before they can proceed. Not sure
> what we can do to help this though.

Move them to the front as far as possible I guess. And any package they 
depend on as well... It should try to set up the shortest tree to be 
able to build the crosscompiler and build that first...

Mike.





