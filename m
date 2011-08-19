Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QuR35-0006bc-KQ
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 17:31:55 +0200
Received: by yxl11 with SMTP id 11so200880yxl.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=cRM/xUK5c6AZ792JaBB5rwQ9esfZkbqXB4gvmtNdv/E=;
	b=Tk3IThRH6BX1ZMIj2J9/Lb67zYWB5C5oeBneej1zh1oJpQoyA7ZPCVbP/q9g4W4zG/
	zoJZeB9a0zfJdCcMaWW3jYCwEiLqJjJS0I80FPO4tWCqvL+OKCjb9IQBzspXXPObjxM/
	1+vO7p7gSDJSPyJl8jAp+Z+J6boC0YEdVIbSo=
Received: by 10.236.191.135 with SMTP id g7mr8425161yhn.92.1313767629590;
	Fri, 19 Aug 2011 08:27:09 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v5sm1704701ibk.27.2011.08.19.08.27.08
	(version=SSLv3 cipher=OTHER); Fri, 19 Aug 2011 08:27:08 -0700 (PDT)
Message-ID: <4E4E80C9.7010507@gmail.com>
Date: Fri, 19 Aug 2011 08:27:05 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1313700595.git.sgw@linux.intel.com>
	<5e892786b427b2049ddf0e660d57877e24f89385.1313700595.git.sgw@linux.intel.com>
	<1313745878.6733.259.camel@phil-desktop>
	<1313763965.13995.100.camel@rex>
In-Reply-To: <1313763965.13995.100.camel@rex>
Subject: Re: [CONSOLIDATED PULL 15/32] conf, recipes: Redefine LINKER_HASH_STYLE
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
X-List-Received-Date: Fri, 19 Aug 2011 15:31:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/2011 7:26 AM, Richard Purdie wrote:
> On Fri, 2011-08-19 at 10:24 +0100, Phil Blundell wrote:
>> On Thu, 2011-08-18 at 13:55 -0700, Saul Wold wrote:
>>> From: Khem Raj<raj.khem@gmail.com>
>>>
>>> LINKER_HASH_STYLE is not set to either sysv or gnu
>>> depending upon architecture e.g. mips does not support
>>> gnu hash style among the supported architectures so
>>> we make sure its set to 'sysv' form mips
>>>
>>> Linker flags are munged to adhere to renamed variable
>>>
>>> Third option is to set it to 'both' we do
>>> not do that by default but user can still set it
>>
>> It wasn't totally obvious to me why this patch is a good thing.  Can you
>> explain why this change is desirable?

when we build libraries within gcc e.g. libgcc or libstdc++ etc. then
it does not respect injection of LDFLAGS as we do so if we set hash 
style to gnu then it does not get passed to build environment of those
runtime libraries. Now one may argue that its a bug in gcc  but I would 
rather like to use provisions gcc provides.

This patch makes ways for us to specify linker style options to gcc 
configure.
but the bigger problem is that I forgot to attach the gcc patch that 
adds this options to gcc configury:) that however does not impact this
patch so much but the next one where I enable the gcc options.



>>
>> Also, I found the first paragraph of the description above quite hard to
>> understand.  Do you think you could try to reword it to be a bit
>> clearer?

Yes I had a typo in there

  LINKER_HASH_STYLE is not set to either sysv or gnu

should have been

  LINKER_HASH_STYLE is now set to either sysv or gnu
>
> Agreed, I'm also having trouble understanding this change. I guess its
> related to the options passed into gcc but I suspect we can just improve
> the gcc option handling instead.
>
> What I don't like about this patch is forcing a string into LDFLAGS and
> I much prefer the current approach where its either added or its not,
> its not just adding a parameter through the variable.
>

Yes default is sysv so if you do not specify anything then linker 
assumes sysv but since barring mips we pass this option to all 
architecture there should be not much impact on other architectures than 
mips.

> Also, if mips doesn't support this, how is anything at all working at
> the moment?

see last line in distro/include/tcmode-default.inc

TARGET_LINK_HASH_STYLE ?= 
"${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH', d, True) 
in ['mips', 'mipsel', 'mips64', 'mips64el']]}"


>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



