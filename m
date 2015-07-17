Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 6FF5F65CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 11:29:59 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 21558F811D9; Fri, 17 Jul 2015 05:30:00 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 58C63F81188;
	Fri, 17 Jul 2015 05:29:59 -0600 (MDT)
Message-ID: <55A8E744.3060509@mlbassoc.com>
Date: Fri, 17 Jul 2015 05:30:12 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <55A8DF6B.3040909@mlbassoc.com>
	<2990247.hoeDgcCp8y@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <2990247.hoeDgcCp8y@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: image.bbclass vs core-image.bbclass
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
X-List-Received-Date: Fri, 17 Jul 2015 11:30:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-07-17 05:14, Paul Eggleton wrote:
> Hi Gary,
>
> On Friday 17 July 2015 04:56:43 Gary Thomas wrote:
>> Why are some ROOTFS_POSTPROCESS_COMMANDs being set in image.bbclass
>> and others in core-image.bbclass?  If I build an image using only
>> image.bbclass, I miss the settings from core-image.bbclass (which
>> is somewhat misnamed IMO since it's heavier than image.bbclass)?
>>
>> Is there some reason not to have all of the ROOTFS_POSTPROCESS_COMMANDs
>> just in image.bbclass alone?
>
> The existence of this class is kind of a legacy from when parts of Poky became
> OE-Core - originally core-image.bbclass was called poky-image.bbclass, and
> what was in it was specific to Poky. We had to bring it over though because all
> of our example images, which we need to have for verification (if nothing
> else), inherited from it and still do. We've made minor adjustments to core-
> image.bbclass since then but there are still things in there that are clearly
> "distro" type definitions that don't make sense for everyone; so far nobody has
> really stepped up to find any better common items or reasonable defaults
> (perhaps there aren't any, though I doubt that).
>
> There is a bug open assigned to me to try to sort this out, but to be honest
> I've been struggling with how to best to do it:
>
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=5424
>
> I'm open to any suggestions, because I do think the dichotomy between these
> classes ought to be resolved if it can be done practically.
>
> Specifically on the ROOTFS_POSTPROCESS_COMMANDs, those do look like they ought
> to somehow be in image.bbclass if they can be added in a manner that doesn't
> interfere with people's ability to create images that aren't rootfses.

It seems that many of the ROOTFS_POSTPROCESS_COMMANDs in image.bbclass already
assume that a rootfs is being built.

To me the ROOTFS_POSTPROCESS_COMMANDs that are in core-image.bbclass
don't seem any more invasive than the ones in image.bbclass.  For starters,
I'd like to see them moved to image.bbclass.  It's also quite strange that
the read-only-rootfs hook is defined in image.bbclass but only invoked
from core-image.bbclass??  [That's the one that lead me down this road]

Any objections to a patch that does that?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

