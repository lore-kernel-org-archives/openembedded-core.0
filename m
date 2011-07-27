Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qm5d9-0002mw-Pn
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:02:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6REtqtw020652
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 07:58:23 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 27 Jul 2011 07:55:56 -0700
Message-ID: <4E3026FB.40409@windriver.com>
Date: Wed, 27 Jul 2011 09:55:55 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311769062.30326.322.camel@phil-desktop>
	<1311773637.2344.365.camel@rex> <4E302051.1010308@windriver.com>
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
X-List-Received-Date: Wed, 27 Jul 2011 15:02:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/27/11 9:44 AM, Phil Blundell wrote:
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

If all of the other ARMv6 cores w/ thumb support are thumb1.  Then it's easily
enough to change it back to 't'.  If someone does add tunings for the 1156 then
they can easily augment it to t2 within that tuning file.  I didn't realize not
all of armv6 (that supported thumb) wasn't thumb2 (or no thumb).

> Also, since there are no v5, v6 or v7 cores which don't support Thumb,
> the "t" suffix serves no useful purpose here and might as well just be
> omitted.  That is, there is no CPU which can run "armv6" packages which
> wouldn't also be able to run "armv6t".

There are definitely chips that are v5, 6 and 7 that do not have thumb support.
 I'm not sure any of them were mass-market chips though.

>> In the original work I did it was just tune-xscale (no be).  AFAIK there is no
>> little endian version of xscale.
> 
> No, that's incorrect.  The PXA25x series and IXP420, at least, are
> bi-endian (and I suspect most of the other XScales are too) and there
> are certainly folks running them in little endian configurations.

Ok.

--Mark

> p.
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



