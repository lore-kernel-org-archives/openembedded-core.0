Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QWs5o-0006ts-4k
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 17:33:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5FFTprp028318
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 08:29:51 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 15 Jun 2011 08:29:51 -0700
Message-ID: <4DF8CFEE.9040606@windriver.com>
Date: Wed, 15 Jun 2011 10:29:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>	<1308086688.15712.362.camel@rex>	<CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>	<1308132426.15712.387.camel@rex>	<9B8FDB01-CFAA-497E-BD0E-93D421E6C4F8@dominion.thruhere.net>	<1308133322.15712.395.camel@rex>	<0566033F-1AB8-4E16-A064-A3EB3A5CA143@dominion.thruhere.net>	<1308137782.15712.415.camel@rex>
	<4E5331E5-260E-468A-A1C8-9FF132CF85F8@dominion.thruhere.net>
In-Reply-To: <4E5331E5-260E-468A-A1C8-9FF132CF85F8@dominion.thruhere.net>
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jun 2011 15:33:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

After reading the discussion, and some investigation I did on my own last week..
 I think there is a more fundamental problem then just a couple of variables
changing names and such.  (Perhaps this was eluded to in a previous conversation
that I missed.. but)

I don't see a -clear- definition of a machine, soc, cpu, etc layed out in
oe-core.  What I mean by this is, we have various tune files, we have a few
machine files.. but how do these all fit together?  I wasn't able to just go in
and say "Ohh these are the paremeters for armv7a", I had to dig around and guess
how things got constructed.

What I've done in the past (commerical product, no OE based) is have a series of
configuration files.  Note, the names below are mine, not OE terms!  Keep this
in mind.  The definitions are arranged in a pseudo-hierarchy that allows each
level to add additional information, until the level of information is properly
determined.

arch <- define basic characteristics about an architecture, such as ARM, Power,
SH, MIPS, etc..

ABI <- define basic characteristics about a specific ABI (multilib), living
inside of an arch.  This defines characteristics for gcc, glibc, and "base"
definitions for CFLAGS, CPU instruction sets, etc.. to produce a minimal
compatible set of binaries.   This SHOULD be enough to build a system..

CPU <- tuning files to enable additional CPU features, optimizations, etc.. the
CPU file is not allowed to change the ABI however.  (For instance, it can't
suddenly enable hard-float on a soft-float multilib.)

BSP (machine) <- final tunings specific to a given machine.


The inclusion order is:

arch can only include the 'all' (no arch)
ABI must include one and only one arch
CPU must include one and only one ABI, or may include another CPU
BSP (machine) must include one or more CPUs (this enables multilibs)

So each BSP (machine) configuration defines what CPU tunings, and thus ABIs are
available on it.  It also defines the default ABI, and may override the CPU
tunings if there is something more precise needed for a given board -- such as a
errata workaround.

While the above has worked for me, I'm sure it would need tailoring in oe-core..
 I'm not advocating changing huge sections of variable namings, just putting in
some sanity to each of these levels....  bringing that into play, we can then
expand to what was mentioned below with package feeds and similar.

The "allarch" is inherited from the special no-arch.  This starts the process of
specifying what packaging is available.

Each ABI specifies a "base" package arch for it's settings and ABI.  This gets
added to "any existing items", i.e. the 'all' arch

Each CPU tune gets more and more specific.  Package feed compatibility is
defined here..  For instance an i686 CPU would include the i586, which could
include i486, which could include i386..  This would result in a feed capability
of i686 being the "preferred", and compatible with i586, i486, i386, all.

The BSP (machine) then would do it's final tunings.  That would define the
machine arch as the highest level, things only setup for that machine.

Anyway, something to consider.  I haven't had the time to really dig into OE and
see if any of this makes sense with what we have -- but it might help resolve
some of these issues, and make it easier to manage the arch, tuning, and related
variables in a single hierarchy so we can see what does and doesn't work -- and
what needs improvement.

--Mark

On 6/15/11 6:52 AM, Koen Kooi wrote:
> 
> Op 15 jun 2011, om 13:36 heeft Richard Purdie het volgende geschreven:
> 
>> On Wed, 2011-06-15 at 12:37 +0200, Koen Kooi wrote:
>>> Op 15 jun 2011, om 12:22 heeft Richard Purdie het volgende geschreven:
>>>
>>>> On Wed, 2011-06-15 at 12:15 +0200, Koen Kooi wrote:
>>>>> Op 15 jun 2011, om 12:07 heeft Richard Purdie het volgende geschreven:
>>>> I know, but we have two choices:
>>>>
>>>> a) Continue this spiral of confusing variable names, conflict and wacky 
>>>>  bugs
>>>>
>>>> b) Come up with a plan to address it and roll it out
>>>>
>>>> I'm favouring b), particularly since this would help several different
>>>> architectures with a variety of issues. If we need to better document
>>>> that and have a process fine, but that is not a good argument for not
>>>> doing it at all.
>>>
>>> I agree on that, put previous efforts in the yocto universe were
>>> rushed through (like the machine-name -> machine_name change I keep
>>> going on about), so I have a knee jerk reaction to such things
>>> nowadays. For various reasons yocto and later oe-core have not been
>>> friendly to distros having package feeds out there. Sometimes the
>>> changes made things better, but they were still painfull. It seems to
>>> be getting better nowadays, which is good, but everyone still needs to
>>> be carefull. Pet peeve: missing PR bumps.
>>
>> Well, I think everyone is trying to improve, trying to do better and
>> hopefully we are learning from any mistakes made.
>>
>>> What I need for angstrom is a variable that:For 
>>>
>>> 1) *never* changes its value
>>
>> As I've mentioned several times, I think it is reasonable to allarch to
>> clear or otherwise invalidate such a variable. That is a very special
>> case though and setting it to "all" was perhaps a poor choice of value.
> 
>>> 2) holds the base arch (armv7a, ppc603e, etc)
>>
>> Sounds like BASE_PACKAGE_ARCH
>>
>>> 3) Is set in *all* the tune include files
>>
>> Again sounds like BASE_PACKAGE_ARCH. Can it not default to TARGET_ARCH?
> 
> Defaulting to TARGET_ARCH would break 4)
> 
>> Grepping the tune files in OE-Core we seem to be pretty good about this
>> right now.
> 
> In OE-core yes, not sure about the other layers.
> 
>>> 4) must be set to complete parsing when MACHINE is set
>>
>> I suspect this doesn't give as much value as you'd think but I'm
>> indifferent.
> 
> It's an early warning system :)
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



