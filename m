Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QmgzU-0000S0-Oy
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 08:56:12 +0200
Received: by pzk1 with SMTP id 1so5908821pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 23:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=LY166aj8yehCyr5Jc0aE6sVRdT71NoK7/nxChJfre5c=;
	b=e3+C53boSB7buvQMpe9OsOJg5gp44ULaJiQydgkm7csWy4Hm3YLDE7TVzeh3Q5nTdJ
	Qqc+d2sVrTo2XOKrKOttDwJok7ug5WAsgnUbWmDuR9oBMmELYLMbEQmLn3/Bretd9Tdb
	PrmZIiIvVAplkO6VDhYNxbKc7e2er8n16u0jM=
Received: by 10.68.47.9 with SMTP id z9mr32664pbm.140.1311922315699;
	Thu, 28 Jul 2011 23:51:55 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id l7sm1833414pbh.26.2011.07.28.23.51.54
	(version=SSLv3 cipher=OTHER); Thu, 28 Jul 2011 23:51:54 -0700 (PDT)
Message-ID: <4E325889.9090105@gmail.com>
Date: Thu, 28 Jul 2011 23:51:53 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>	<1311769062.30326.322.camel@phil-desktop>
	<1311773637.2344.365.camel@rex> <4E324E62.1080601@gmail.com>
In-Reply-To: <4E324E62.1080601@gmail.com>
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
X-List-Received-Date: Fri, 29 Jul 2011 06:56:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 11:08 PM, Khem Raj wrote:
> On 07/27/2011 06:33 AM, Richard Purdie wrote:
>> On Wed, 2011-07-27 at 13:17 +0100, Phil Blundell wrote:
>>> On Tue, 2011-07-26 at 13:44 +0100, Richard Purdie wrote:
>>>> +TARGET_FPU = "${@d.getVar('ARMPKGSFX_FPU', True).strip('-') or
>>>> 'soft'}"
>>>
>>> This seems a bit backwards. Shouldn't TARGET_FPU be the primary
>>> variable and then the package suffix be computed from that, rather than
>>> vice versa?
>>
>> It's been "fun" to use the rather limited constructs we have in these
>> variables to construct the end result. I suspect this way around, it was
>> the easiest way to get the right variables in the right places.
>>
>>>> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [
>>>> "armv4", "thumb" ], "t", "", d)}"
>>>> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [
>>>> "armv5", "thumb" ], "t", "", d)}"
>>>> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [
>>>> "armv6", "thumb" ], "t2", "", d)}"
>>>> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [
>>>> "armv7", "thumb" ], "t2", "", d)}"
>>>
>>> This is wrong: ARMv6 doesn't imply Thumb-2.
>>
>> Ah, yes. I'll fix this.
>>
>>>> +# Whether to compile with code to allow interworking between the two
>>>> +# instruction sets. This allows thumb code to be executed on a
>>>> primarily
>>>> +# arm system and vice versa. It is strongly recommended that
>>>> DISTROs not
>>>> +# turn this off - the actual cost is very small.
>>>> +TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM
>>>> functions"
>>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES",
>>>> "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}"
>>>> +OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES",
>>>> "no-thumb-interwork", ":thumb-interwork", "", d)}"
>>>
>>> This is only relevant for v4t, I guess. Interworking is basically
>>> always on for v5 and later and (CeSI aside) it's impossible on v4, so
>>> hardly anybody is going to be flipping this switch. I'm not sure it
>>> really merits an OVERRIDE.
>>
>> I'd be happy to remove this option if there are no objections. It was
>> left for compatibility with the existing tune-thumb file but as you say,
>> it likely doesn't make much sense.
>
>
> I know SHR uses armv4t but I dont know of armv4 usecases. May be we
> could may armv4t as oldest supported arm arch and leave armv4 out.

oh well how did I forget strongARM so yes dropping armv4 may not be so easy



