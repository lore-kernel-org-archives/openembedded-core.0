Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QmgTK-0003ZO-Dc
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 08:22:58 +0200
Received: by pzk1 with SMTP id 1so5863672pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 23:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=oSAUlbo4wiGuvjS8opVOC8JPpI6u2d3u89N6YWd8zwY=;
	b=CzryOxsmE0vKSD4FlAWwyf1vw/JbwShSKm6kusWX/v/DapeJHXuALxqDtfOB8lz/4b
	zKOA6byli8Ti/LZh2HUzdtQJkqyNg2/Y9Q9cmdqYbbeYfsuTO1qNC5pE4+ss3/jjB41c
	Rg6sIh/ob/QnaaU9FTWALhnZUawpci8Mi6Xo0=
Received: by 10.68.57.40 with SMTP id f8mr1774837pbq.204.1311920319437;
	Thu, 28 Jul 2011 23:18:39 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b4sm1795808pba.75.2011.07.28.23.18.37
	(version=SSLv3 cipher=OTHER); Thu, 28 Jul 2011 23:18:38 -0700 (PDT)
Message-ID: <4E3250BB.8050807@gmail.com>
Date: Thu, 28 Jul 2011 23:18:35 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>	<1311769062.30326.322.camel@phil-desktop>	<1311773637.2344.365.camel@rex>
	<4E302051.1010308@windriver.com>
	<1311777856.30326.356.camel@phil-desktop>
In-Reply-To: <1311777856.30326.356.camel@phil-desktop>
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Fri, 29 Jul 2011 06:22:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2011 07:44 AM, Phil Blundell wrote:
> On Wed, 2011-07-27 at 09:27 -0500, Mark Hatle wrote:
>> On 7/27/11 8:33 AM, Richard Purdie wrote:
>>> On Wed, 2011-07-27 at 13:17 +0100, Phil Blundell wrote:
>>>> On Tue, 2011-07-26 at 13:44 +0100, Richard Purdie wrote:
>>>>> +TARGET_FPU = "${@d.getVar('ARMPKGSFX_FPU', True).strip('-') or 'soft'}"
>>>>
>>>> This seems a bit backwards.  Shouldn't TARGET_FPU be the primary
>>>> variable and then the package suffix be computed from that, rather than
>>>> vice versa?
>>>
>>> It's been "fun" to use the rather limited constructs we have in these
>>> variables to construct the end result. I suspect this way around, it was
>>> the easiest way to get the right variables in the right places.
>>>
>>>>> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv4", "thumb" ], "t", "", d)}"
>>>>> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "thumb" ], "t", "", d)}"
>>>>> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv6", "thumb" ], "t2", "", d)}"
>>>>> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv7", "thumb" ], "t2", "", d)}"
>>>>
>>>> This is wrong: ARMv6 doesn't imply Thumb-2.
>>>
>>> Ah, yes. I'll fix this.
>>
>> Are you sure?  I thought ARMv6 -was- the first to support Thumb-2.  And armv5/4
>> were thumb(1).  Note, not all ARMv6 processors contain thumb support.
>
> It is true that all ARMv4T and ARMv5T processors are only Thumb-1.  It's
> also true that Thumb-2 was first implemented in ARM1156, which is an
> ARMv6 core.  But ARM1136, ARM1176 and ARM11MPCore are also ARMv6 cores
> and all three of those are Thumb-1 only.  Given that nobody is likely to
> target ARM1156 with OE, it's probably a reasonable approximation to say
> that Thumb-2 correlates with ARMv7 and later.
>
> Also, since there are no v5, v6 or v7 cores which don't support Thumb,

cortex-m series supports only thumb2 intsruction set. I am not sure if 
thumb2 alone is a superset of thumb1 iow thumb1 programs could be 
executed on cortex-m series or not. Never had a cortex-m so I am not sure.

> the "t" suffix serves no useful purpose here and might as well just be
> omitted.  That is, there is no CPU which can run "armv6" packages which
> wouldn't also be able to run "armv6t".
>
>> In the original work I did it was just tune-xscale (no be).  AFAIK there is no
>> little endian version of xscale.
>
> No, that's incorrect.  The PXA25x series and IXP420, at least, are
> bi-endian (and I suspect most of the other XScales are too) and there
> are certainly folks running them in little endian configurations.

nslu2 which uses xscale has both be and le versions of SlugOS

>
> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



