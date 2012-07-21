Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Ssab8-0000y3-3d
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 16:23:58 +0200
Received: by qaat11 with SMTP id t11so612648qaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2012 07:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=UM1B8DFqEk9SdFOv9B5KAd0zoSx1B8NeMEDYajL88no=;
	b=tWMmZYBEA+9ypC2NQuZdvnPQPEamoW2SfT/DoHcTo9e49hg5uCX8S2zKFgeJoJYj4Y
	wBTz7MYReWB/0bsG5kS7yG8gqtc9/5s45gDzfz1B983cyPnLsHUA75L4kVCtNIGR4XG7
	QRla2C9EuiuKjtb/ypPo3o3GtDEeVx8H/3dEKs3wrhePvvknPEhbVyCz7j2jG7h9qzXY
	kblbB3LUWcidhFNVfQIXBVOKYuB68Z/rKQxQ7hbJAGXKRiRoATmeYeLPab60/bmB/+Ss
	KgglZxgGDkEsXwt25Nf5FnGf+b0+8Er90adX3mZbeGxh7s+JV0mYj+3Ze1yIm4WSrvM2
	/AHQ==
MIME-Version: 1.0
Received: by 10.229.136.197 with SMTP id s5mr2602500qct.42.1342879953297; Sat,
	21 Jul 2012 07:12:33 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Sat, 21 Jul 2012 07:12:33 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207210644110.1819@oneiric>
References: <alpine.DEB.2.02.1207191738300.22542@oneiric>
	<CADkTA4MBfe8uW4k8t-975hixqPCT5Q-_t4wXYh0vKvk7B8W_QA@mail.gmail.com>
	<alpine.DEB.2.02.1207210644110.1819@oneiric>
Date: Sat, 21 Jul 2012 10:12:33 -0400
Message-ID: <CADkTA4Myz35prigzOekZ7hFxuTUujbMierEf-kyts0-yrXU7eQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: what are the major phases of do_patch() for the kernel?
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
X-List-Received-Date: Sat, 21 Jul 2012 14:23:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 21, 2012 at 6:50 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Thu, 19 Jul 2012, Bruce Ashfield wrote:
>
>> On Thu, Jul 19, 2012 at 5:50 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>> >
>> >   short version: what happens during each major processing step of the
>> > do_patch function for the kernel?
>> >
>> >   longer version: i'm stepping through what happens when i do a
>> > "bitbake linux-yocto", and documenting what happens at each step --
>> > currently looking at do_patch().
>> >
>> >   after having run the previous validate_branches target, what i
>> > appear to have is the source directory containing the kernel source
>> > with the (for me) standard/arm-versatile-926ejs branch checked out,
>> > and no top-level "meta" directory.  so far, so good.
>> >
>> >   now, i'm building core-image-minimal for qemuarm, so i'm being as
>> > unexciting and non-exotic as possible -- not selecting any special
>> > parameters or corner cases or anything.
>> >
>> >   so as i peruse do_patch() in kernel-yocto.bbclass, i'm following
>> > along to functions like createme and updateme and patchme, and with
>> > createme, further into decheckpoint and check_defconfig and ... you
>> > get the idea.  and i'm kind of getting lost in the weeds of details.
>> >
>> >   given that i'm building an absolutely stock target with a supported
>> > machine, all i really need for the moment is a very high-level
>> > explanation of what each of those main routines does.
>> >
>> >   so if my initial understanding is correct (that before i start
>> > do_patch), i have the stock yocto kernel checked out to the
>> > appropriate machine branch and nothing else), what does each
>> > subsequent step accomplish?
>> >
>> >   don't need horrific detail, just one line or less as to what's
>> > accomplished by each step like:
>> >
>> >   * createme
>> >     * decheckpoint
>> >     * checkdefconfig
>> >     * check_branch
>> >     * metaize
>> >   * updateme
>>
>> Most of this is already covered in the kernel architecture manual
>> that you can find on the yocto pages .. I'd suggest starting there.
>
>   actually, i *was* going through your kernel manual and the major
> thing that was causing me grief was a lack of precise terminology.
> when you're reading chapter 3, there are numerous references to the
> "kernel tree", but i think it would be massively useful to distinguish
> between the variations of tree here.
>
>   one could start by mentioning the pristine kernel.org tree that's
> used as a starting point.  then there's the tree one checks out of
> git.yoctoproject.org, which contains (among other things) a "meta"
> branch which is then added to that tree and its content applied.  from
> what i can read in the kern-tools utilities, that might be called the
> "metaize"d tree.  after which the configuration is done, and so on.
>
>   terminology matters.  all i'm after is, if i'm describing this
> process to a class, i want to use terminology that matches what's in
> the manuals.

Sure ... but I'll point out that you are going into architectural
details that are
under the covers, and that are written from the point of view of a kernel tree
maintainer using the tools, they are not written from the point of view of the
casual observer. The moving parts of the tools that can be tweaked, are already
brought out out to the recipes (I'll point out again that the bitbake
recipes you
see are but one binding).

So yes, another variation of the document might be useful, but I've (we've),
moved these details out from "in front" and instead have focussed on the
use cases .. from someone creating a new BSP, or adding a configuration
fragment to their build .. i.e. it looks and works just like any other
package in
the system from the point of view of user manipulations, with the extra
functionality available if someone has used them, and finds that their use
case doesn't fit the mold (i.e. how many people go an need to modify bitbake
when using oe-core? it took me 2 years to need to do that).

What is the goal of a class that you'd be trying to do around this ? That
makes all the difference in what I'd suggest for options and changes.

Cheers,

Bruce

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


