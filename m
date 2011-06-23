Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZtbL-0000c1-Fo
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 01:46:23 +0200
Received: by pwi1 with SMTP id 1so1647181pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 16:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=VLNeXqQjZtzBVCHwbo3og7QyakS2l3Y+0GP0WfxhPJo=;
	b=fxRh93g0kHfOSfaX89dwgyLiVScgL6hh0ESQ7H2odfxOOSkTatb4s0mQ6qaUCW5yyT
	QAvNsyxPEcr5VxydBIMJzikg9YIX6+en7hONE4K0rTZAPrZ1KMmc2Qm8uVUPpsFaZoIc
	LM/UFAQDLjvWW7ICawQbJNSFsk4A+VtRyuttk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=q91d9n/u3uJq0X6h9kI31D4PyFf/FHFY0u5gXrl09jFyAms2d6TsgqfAWch6XQv1HI
	gpRaPSjHY7qPfQ8GMMDRE5tPfMwM5SgHlfsKxspLdPO0+ViRVB3yvZ2IoUijWq9C5rEN
	1prr57hm6+arrcN1bPl+7RApfW8wujRzoG5EA=
Received: by 10.142.211.1 with SMTP id j1mr553927wfg.162.1308872566625;
	Thu, 23 Jun 2011 16:42:46 -0700 (PDT)
Received: from [192.168.1.75] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c10sm1454699wff.12.2011.06.23.16.42.45
	(version=SSLv3 cipher=OTHER); Thu, 23 Jun 2011 16:42:45 -0700 (PDT)
Message-ID: <4E03CF74.7030702@gmail.com>
Date: Thu, 23 Jun 2011 16:42:44 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308732995.git.dongxiao.xu@intel.com>	<d7c256ba838d05c85c6e7c2569f0a6c7b276ab17.1308732995.git.dongxiao.xu@intel.com>	<1308743075.21613.82.camel@phil-desktop>	<D5AB6E638E5A3E4B8F4406B113A5A19A12D6A3E0A9@shsmsx501.ccr.corp.intel.com>	<1308822049.21613.128.camel@phil-desktop>
	<1308824075.20015.109.camel@rex>
In-Reply-To: <1308824075.20015.109.camel@rex>
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Thu, 23 Jun 2011 23:46:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/23/2011 03:14 AM, Richard Purdie wrote:
> On Thu, 2011-06-23 at 10:40 +0100, Phil Blundell wrote:
>> On Thu, 2011-06-23 at 12:08 +0800, Xu, Dongxiao wrote:
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>>>> Phil Blundell
>>>> Sent: Wednesday, June 22, 2011 7:45 PM
>>>> To: Patches and discussions about the oe-core layer
>>>> Subject: Re: [OE-core] [PATCH 1/1] libc-locale: split locale handling from libc
>>>> recipe.
>>>>
>>>> I still don't quite understand why the virtual/libiconv provider has moved from
>>>> eglibc to eglibc-locale.  Can you explain what's going on there?
>>>
>>> Generally, the purpose of this patch is to reduce eglibc's do_package time.
>>>
>>> Since many other recipes' do_package have dependency on eglibc's do_package, thus the sooner eglibc could finish its do_package, the ealier can other do_packages be executed, which improves the parallelism.
>>>
>>>  From our study, we found most of eglibc's do_package time is used to handle locale. Therefore we split all the locale related stuffs into a separately recipe eglibc-locale.
>>
>> Yes, I understand that.  But I don't think this answers the question
>> about why, specifically, glibc-locale is now PROVIDEing
>> virtual/libiconv.  Does that recipe, in fact, implement libiconv?
>
> I must admit I was wondering about this too. Isn't the libiconv
> functionality still packaged as part of the libc recipe, not the locale
> part?
>
yes it should be in libc

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



