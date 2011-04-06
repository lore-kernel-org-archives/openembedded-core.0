Received: from mail1.matrix-vision.com ([78.47.19.71])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.jones@matrix-vision.de>)
	id 1Q7V7z-0007Jt-BP; Wed, 06 Apr 2011 17:58:43 +0200
Received: from mail1.matrix-vision.com (localhost [127.0.0.1])
	by mail1.matrix-vision.com (Postfix) with ESMTP id CBC257213E;
	Wed,  6 Apr 2011 17:47:16 +0200 (CEST)
Received: from erinome (g2.matrix-vision.com [80.152.136.245])
	by mail1.matrix-vision.com (Postfix) with ESMTPA id 8B29272119;
	Wed,  6 Apr 2011 17:47:16 +0200 (CEST)
Received: from erinome (localhost [127.0.0.1])
	by erinome (Postfix) with ESMTP id D55986F8A;
	Wed,  6 Apr 2011 17:47:15 +0200 (CEST)
Received: by erinome (Postfix, from userid 108)
	id C6A076F9C; Wed,  6 Apr 2011 17:47:15 +0200 (CEST)
Received: from [192.168.65.46] (host65-46.intern.matrix-vision.de
	[192.168.65.46]) by erinome (Postfix) with ESMTPA id ADA2D6F8A;
	Wed,  6 Apr 2011 17:47:15 +0200 (CEST)
Message-ID: <4D9C8B03.8080008@matrix-vision.de>
Date: Wed, 06 Apr 2011 17:47:15 +0200
From: Michael Jones <michael.jones@matrix-vision.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101029 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D832AA4.1020701@matrix-vision.de>	<AB78D48B-B478-47DF-A7CF-94FF96C313AC@dominion.thruhere.net>	<1301060302.3018.129.camel@rex>
	<4D8CA329.10407@matrix-vision.de>	<1301064949.3018.147.camel@rex>
	<4D8CBCA4.2070603@matrix-vision.de> <1301316136.3018.189.camel@rex>
In-Reply-To: <1301316136.3018.189.camel@rex>
X-MV-Disclaimer: true (erinome)
X-AV-Checked: ClamAV using ClamSMTP (erinome)
X-AV-Checked: ClamAV using ClamSMTP (mail1)
Cc: koen@dominion.thruhere.net, openembedded-core@lists.openembedded.org
Subject: Re: [oe] staging & using kernel headers
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
X-List-Received-Date: Wed, 06 Apr 2011 15:58:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Sorry for the delay, I overlooked the last 2 replies because I was no
longer in to: or cc:  :(

On 03/28/2011 02:42 PM, Richard Purdie wrote:
> On Fri, 2011-03-25 at 17:02 +0100, Michael Jones wrote:
>> On 03/25/2011 03:55 PM, Richard Purdie wrote:
>>> On Fri, 2011-03-25 at 15:14 +0100, Michael Jones wrote:
>>> Ok, so you only really have the options of:
>>>
>>> a) Use a specific patched kernel for linux-libc-headers which has these
>>> headers in it (see below for why this is ugly)
>>> b) Install some extra headers in "libc-headers-extras" type recipe
>>> c) Ship default versions of the headers with your userspace and use
>>> those if shared versions don't exist. This assumes the API is stable and
>>> on its way to mainline.
>>>
>>> I don't think this is as common a requirement as you think as most
>>> people get this kind of thing merged into the mainline kernel to try and
>>> reduce this kind of problem.
>>
>> To clarify, it's not that I have a custom patched kernel I need to use.
>>  I am following V4L2 development, so I am using a new kernel from those
>> developers.  V4L2 changes do of course move upstream.
> 
> Ok, sorry, I was lacking context here.
>  
>>> The ugliness is where you have two different arm boards you want to
>>> build, with a common optimisation/toolchain and each wants to redirect
>>> linux-libc-headers to its own "special" version. The question is then,
>>> why aren't the "special" bits in mainline.
>>
>> OK, so here's what I'm realizing, please correct me if I'm wrong:
>> What I did unconventionally (ie. wrong) was to use a kernel version
>> newer than my linux-libc-headers were.  I should create a new
>> linux-libc-headers recipe, as I had done with the kernel recipe, and
>> build glibc and linux-libc-headers using my 2.6.38 kernel.
> 
> We should *always* be using linux-libc-headers >= to the kernel version
> being used.

Isn't it the other way around?  Steffen Sledz had the opposite problem
as me in Feb
(http://www.mail-archive.com/openembedded-devel%40lists.openembedded.org/msg16022.html)
because he's using a kernel older than the linux-libc-headers.  He
quotes the kernel doc: "This means that a program built against a C
library using older kernel headers should run on a newer kernel"

> 
>> I only stumbled upon this because the gstreamer-ti recipes were pointing
>> at internal kernel headers, but because these are user-space apps, they
>> should actually be using the linux-libc-headers.  Right?
> 
> Ideally, yes. I know under some circumstances, they might want to poke
> into internal kernel headers but that is really a design issue that
> needs fixing.
> 
> Cheers,
> 
> Richard
> 

-Michael


MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner


