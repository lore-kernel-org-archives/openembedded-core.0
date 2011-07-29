Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qmu60-0002oc-Je
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 22:55:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6TKpUtd005606
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 13:51:30 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 29 Jul 2011 13:51:29 -0700
Message-ID: <4E331D50.1040004@windriver.com>
Date: Fri, 29 Jul 2011 15:51:28 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20110729163912.GN15286@jama.jama.net>
	<1311959073-16925-1-git-send-email-Martin.Jansa@gmail.com>
	<20110729171007.GO15286@jama.jama.net>
	<4E32F718.7060906@windriver.com>
	<1311971039.3141.33.camel@lenovo.internal.reciva.com>
In-Reply-To: <1311971039.3141.33.camel@lenovo.internal.reciva.com>
Subject: Re: [PATCH] feature-arm-thumb: respect ARM_INSTRUCTION_SET
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
X-List-Received-Date: Fri, 29 Jul 2011 20:55:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/29/11 3:23 PM, Phil Blundell wrote:
> On Fri, 2011-07-29 at 13:08 -0500, Mark Hatle wrote:
>> Sorry I was gone much of yesterday and not able to comment.  I'm going to break
>> this down into the two problems that I see people having.
>>
>> 1) "interworking".  I was recently told EABI requires interworking to be
>> enabled, and in OE-core we only support EABI.  So we should always have the
>> interworking enabled for the tunes that we support.
>>
>> Is this correct, any objections?  If so, assume from this point forward
>> interworking is always enabled and we only support (in oe-core) interworking
>> capable ARM chips.
> 
> That's pretty much right though not 100% correct.  Although it is true
> that the AAPCS (and by extension the EABI) effectively requires all
> relocatable objects to be built with interworking on, there are special
> provisions for translating BX to MOV during link edit and hence allowing
> v4 CPUs to run executables which are non-interworking but otherwise
> conformant with the EABI.  The effect of this is that, although v4 isn't
> naturally an interworking-capable architecture, it is nonetheless
> grandfathered into the EABI universe.  See the remarks in section 5.6 of
> ARM IHI 0042D.
> 
> And, pragmatically, there is a small but significant base of OE users on
> v4 (not v4t) platforms and I don't think we want to do anything that
> would disenfranchise them in OE-core.

Which set of users is still v4 (not interworking compatible)?  Are new
processors being made that still require that capability? or (in oe-core) is it
time to drop support?

Just because it's not in oe-core, doesn't mean it can't be in angstrom, or even
meta-oe as unique tunings for those architectures..

> Neither the AAPCS nor the wider EABI makes any attempt to cater for
> architectures earlier than v4 and I don't think OE-core needs to do so
> either.  It's not totally unimaginable that someone might wish to target
> OE-core at a v3 system but, if that ever happens, they can fill in the
> missing bits in an overlay.

Ya, I never expected we'd support anything older the v4... but there is more
variation in v4 then I had realized.

>> The confusion continues that people are expecting a package arch of "armv5t" to
>> be arbitrarily thumb or not thumb.. since the arch (to them) indicates that the
>> CPU is compatible with both thumb and ARM code.  That was not the intent of this
>> change.  Instead the _package architecture_ is designed to convey the ABI and
>> instruction set used when building the software in the package.
> 
> It's worth pointing out, just in case it isn't already obvious, that an
> individual package might contain a mixture of ARM and Thumb binaries,
> and an individual binary might contain a mixture of ARM-state and
> Thumb-state functions.  This is doubly true when static libraries are
> involved, of course.  Some compilers may (although GCC doesn't, today)
> even switch automatically between ARM-state and Thumb-state depending on
> their view of which is going to give the best results.

I didn't realize there were compilers that would switch states.. the others I
knew, but for the most part things are built on a package-level basis with a
single set of options for the whole package.  (There will always be exceptions
of course.)

> So, the distinction between "arm" and "thumb" binaries is always going
> to be a slightly blurry one and, although I can see the attraction of
> being able to label a particular package as "arm" or "thumb", it's more
> a question of picking points on a continuum than a binary switch.

Currently the switching point is on a recipe basis.  I'm sure we could make a
recipe that does both thumb and arm and do dynamic switching on a binary by
binary basis inside of a recipe.. but nothing that I am aware of does that
today.  I've also not seen any real-world use cases that point to this --
outside of custom application code that is being specifically tuned for a device.

>> This not only helps with debugging what someone is using, but also helps with
>> designing filesystems that may contain both arm and thumb code.  For example a
>> developer is building a device.. they have the requirements of "higher"
>> performance in there specific application, but maximum space savings everywhere
>> else.  They want to start with a binary package feed, NOT the build system.  So
>> they will mix and match the armv5 and armv5t packages by choosing the smaller
>> packages for most things (usually thumb), and using the ARM instruction set
>> where they need performance (usually armv5 packages).
>>
>> ---
>>
>> So having a single value that simply switches the instruction set, without
>> changing the package arch violates the intent of the change.  An alternative
>> would be something like:
> 
> It's not entirely obvious to me that Thumb-ness is, in this sense,
> sufficiently special to deserve a distinct package architecture.  After
> all, one can already switch between -Os and -O99, or different -mtune
> levels or no doubt many other things which influence code size and

I've always seen -O levels set at the distribution or recipe level, not
dynamically changes as a user creates a system.  Yes it can be done, but
practically speaking I don't see that.. (other then building say one recipe with
-O0 to facilitate in additional debugging, but that's not usually distributed
beyond the developer doing the individual work.)

> performance without the package architecture changing.  I guess some
> DISTROs might want to offer a smorgasbord kind of approach where every
> binary is compiled in N different ways and packaged separately, but I
> get the general sense that most distros will probably not want to do
> that and perhaps it oughtn't to be the default behaviour.

again, if a distribution doesn't want to distinguish between thumb and not,
that's fine.. oe-core doesn't set distribution policy.  But for oe-core it is a
use-case that I had in mind while doing much of the development.  It's also a
use-case that I have active customers requesting from me...

> (And of course, on another pragmatic point, it isn't by any means
> universally true that ARM-state has better performance than Thumb-state
> on real world systems.  There are a significant number of cases where
> you get higher performance in Thumb-state than ARM-state.)

Yup I'm aware of that as well..  which is why many customers want both ARM and
thumb versions of the software so they can compare the disk size vs performance
to meet whatever their targets are.. (most of the time for the OS it's purely
disk size.. their application is where they tune the performance characteristics.)

> p.
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



