Received: from mail2.matrix-vision.com ([85.214.244.251])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.jones@matrix-vision.de>)
	id 1Q39VI-0005Vy-BQ; Fri, 25 Mar 2011 17:04:48 +0100
Received: from mail2.matrix-vision.com (localhost [127.0.0.1])
	by mail2.matrix-vision.com (Postfix) with ESMTP id 904CB405CD;
	Fri, 25 Mar 2011 17:02:45 +0100 (CET)
Received: from erinome (g2.matrix-vision.com [80.152.136.245])
	by mail2.matrix-vision.com (Postfix) with ESMTPA id 397793F62A;
	Fri, 25 Mar 2011 17:02:45 +0100 (CET)
Received: from erinome (localhost [127.0.0.1])
	by erinome (Postfix) with ESMTP id BE67C6F8A;
	Fri, 25 Mar 2011 17:02:44 +0100 (CET)
Received: by erinome (Postfix, from userid 108)
	id AFD826F9C; Fri, 25 Mar 2011 17:02:44 +0100 (CET)
Received: from [192.168.65.46] (host65-46.intern.matrix-vision.de
	[192.168.65.46]) by erinome (Postfix) with ESMTPA id 9BCED6F8A;
	Fri, 25 Mar 2011 17:02:44 +0100 (CET)
Message-ID: <4D8CBCA4.2070603@matrix-vision.de>
Date: Fri, 25 Mar 2011 17:02:44 +0100
From: Michael Jones <michael.jones@matrix-vision.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101029 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <4D832AA4.1020701@matrix-vision.de>	
	<AB78D48B-B478-47DF-A7CF-94FF96C313AC@dominion.thruhere.net>	
	<1301060302.3018.129.camel@rex> <4D8CA329.10407@matrix-vision.de>
	<1301064949.3018.147.camel@rex>
In-Reply-To: <1301064949.3018.147.camel@rex>
X-MV-Disclaimer: true (erinome)
X-AV-Checked: ClamAV using ClamSMTP (erinome)
X-AV-Checked: ClamAV using ClamSMTP (mail2)
Cc: koen@dominion.thruhere.net,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: staging & using kernel headers
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
X-List-Received-Date: Fri, 25 Mar 2011 16:04:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/25/2011 03:55 PM, Richard Purdie wrote:
> On Fri, 2011-03-25 at 15:14 +0100, Michael Jones wrote:
>> On 03/25/2011 02:38 PM, Richard Purdie wrote:
>>> On Fri, 2011-03-18 at 10:55 +0100, Koen Kooi wrote:
>>>> CC:ing oe-core since we have kernel.bbclass patches there as well.
>>>>
>>>> Op 18 mrt 2011, om 10:49 heeft Michael Jones het volgende geschreven:
>>>>
>>>>> Hello Koen & co.,
>>>>>
>>>>> I recently bumped into a problem with recipes ti-dmai and gstreamer-ti
>>>>> when they included the kernel headers.  These headers were staged by
>>>>> kernel.bbclass sysroot_stage_all_append() with a lot of manual copying
>>>>> and manipulating links and such, rather than using 'oe_runmake
>>>>> headers_install'.  Back in October Koen explained this
>>>>> (http://article.gmane.org/gmane.comp.handhelds.openembedded/37772) is
>>>>> because some recipes use private kernel API.  The result of this with my
>>>>> 2.6.38 kernel
>>>>
>>>> DMAI and gst-ti don't really work with anything newer than 2.6.32-psp, we're trying to get that addressed internally.
>>>>
>>>>> is that I get a warning-turned-error from linux/types.h
>>>>> that "Attempt to use kernel headers from user space".
>>>>>
>>>>> ti-dmai_svn.bb hacks this (self-admittedly) by defining
>>>>> _EXPORTED_HEADERS_ (commit d0184be13b4879e, also from Koen).  I had to
>>>>> modify the recipe to enable the define to actually get passed as a
>>>>> compile option.  For gstreamer-ti, there was no such hack in place, but
>>>>> it was needed for the same reason.
>>>>>
>>>>> I would think it is a common requirement for recipes to include kernel
>>>>> headers, and this warning has been around since 2.6.32.  I got around it
>>>>> with gstreamer-ti by installing the headers with headers_install into a
>>>>> subdir of the headers directory set up currently by kernel.bbclass, and
>>>>> pointing the gstreamer-ti recipe at that, but I'm not sure if there's a
>>>>> better way.
>>>>>
>>>>> If there are some recipes that need internal kernel sources staged for
>>>>> them, then it seems to me that we need both sets of kernel headers: one
>>>>> exported to userspace (with headers_install) and one that is not.
>>>>> Right?  Can we agree on a standard place/manner for this?
>>>>>
>>>>> Below is my patch to get gstreamer-ti working, for illustration.
>>>>
>>>> I don't really have a better suggestion, apart from adding a var in e.g. bitbake.conf to point to the userspace stuff.
>>>>
>>>> We might even do the reverse, stage the full set into
>>>> $kernel_dir/private and the userspace ones in $kernel_dir, that would
>>>> make it more clear which recipes need internal API.
>>>
>>> Anything using internal kernel headers is effectively kernel module like
>>> and should be using STAGING_DIR_KERNEL. There should be a complete set
>>> of headers available there, particularly after recent improvements to
>>> kernel.bbclass in oecore. Note that using kernel headers like this
>>> effectively makes the package machine specific since the kernel is
>>> machine specific.
>>
>> When you say "_internal_ kernel headers", I assume you mean kernel
>> headers which aren't intended for user space.  But because of the
>> "Attempt to use kernel headers from user space" warning (or rather the
>> motivations behind the warning), I don't want to/ I can't use the exact
>> same headers for building apps which need public kernel API as I do for
>> building modules which use internal kernel headers.
> 
> Ok, so you only really have the options of:
> 
> a) Use a specific patched kernel for linux-libc-headers which has these
> headers in it (see below for why this is ugly)
> b) Install some extra headers in "libc-headers-extras" type recipe
> c) Ship default versions of the headers with your userspace and use
> those if shared versions don't exist. This assumes the API is stable and
> on its way to mainline.
> 
> I don't think this is as common a requirement as you think as most
> people get this kind of thing merged into the mainline kernel to try and
> reduce this kind of problem.

To clarify, it's not that I have a custom patched kernel I need to use.
 I am following V4L2 development, so I am using a new kernel from those
developers.  V4L2 changes do of course move upstream.

> 
> The ugliness is where you have two different arm boards you want to
> build, with a common optimisation/toolchain and each wants to redirect
> linux-libc-headers to its own "special" version. The question is then,
> why aren't the "special" bits in mainline.

OK, so here's what I'm realizing, please correct me if I'm wrong:
What I did unconventionally (ie. wrong) was to use a kernel version
newer than my linux-libc-headers were.  I should create a new
linux-libc-headers recipe, as I had done with the kernel recipe, and
build glibc and linux-libc-headers using my 2.6.38 kernel.

I only stumbled upon this because the gstreamer-ti recipes were pointing
at internal kernel headers, but because these are user-space apps, they
should actually be using the linux-libc-headers.  Right?

thanks for the discussion,
Michael

> 
> Cheers,
> 
> Richard
> 


MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner


