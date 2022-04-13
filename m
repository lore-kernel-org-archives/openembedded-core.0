Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE04C47089
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.3706.1649836241066589716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 00:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=ftk78nwt;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-084-057-071-010.084.057.pools.vodafone-ip.de [84.57.71.10])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B197683953;
	Wed, 13 Apr 2022 09:50:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1649836238;
	bh=BiOI9+IRdqC0XItEFwHshe+lrYLfqs9+WU2Su2ry1Ic=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ftk78nwtfvVbHlvA1tJCWy91pAFi1p8L7BuqPc7qMTExpaexlyDrcoN/bXfYwy3SO
	 gkdHaoMoOW3lINkdMXsmrhdKHjhM9ejvtT/OEbBF+TLHo+yBDgWIXwVxNEgvg44p8/
	 2dvQAhreHf7uy28tgjir4AVG+aj7ti3mKWtYD+v1RfDf9okl4N1/0qgJd3egvmF3Hm
	 b5G+GyeoqGSOGzEvZFzXJpOjLaBFUwnmHFSU4cDz3EDQ7erYW717bQO5TRw4FKh83M
	 ouJnuPSg8MPXbwa6CDCe4fBQj3u5JFtr2ztTnkhmuZafF+cbka/hVnll2wD82fvaIv
	 T3ET1EZxVZZMA==
Message-ID: <6f786caa-21ea-962a-e265-154e086400bc@denx.de>
Date: Wed, 13 Apr 2022 09:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 1/1] kernel: add kernel-image-fitimage-initramfs
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20220330091522.795083-1-ch@denx.de>
 <20220330091522.795083-2-ch@denx.de>
 <ec096923-51a9-5407-9836-689c3ac2d4d2@denx.de>
 <af4b0806c4668d272b38dd6def483451f45c8a9e.camel@linuxfoundation.org>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: 
 <af4b0806c4668d272b38dd6def483451f45c8a9e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164307

Hi Richard,

On 2022-04-13 09:35, Richard Purdie wrote:
> On Wed, 2022-04-13 at 09:18 +0200, Claudius Heine wrote:
>> Hi,
>>
>> On 2022-03-30 11:15, Claudius Heine wrote:
>>> When creating an initramfs bundled into a kernel fitimage, the resulting
>>> fitimage will only be placed into the deploy directory and not packaged
>>> by the kernel recipe/class.
>>>
>>> Changing the kernel recipe/class to produce a package with the fitimage
>>> containing the initramfs is not possible, because build dependencies
>>> require the kernel packages to be already build before the initramfs can
>>> be created.
>>>
>>> The kernel-image-fitimage-initramfs recipe solves this dependency cycle
>>> by packaging the fitimage with the embedded initramfs from the deploy
>>> directory and replaces the `kernel-image` and `kernel-image-fitimage`
>>> packages from the kernel recipe/class.
>>
>> This patch was on master-next for a short while, any feedback on it?
>>
>> In the cover letter I stated the only downside of this solution is, that
>> in case of package based updating, it would require manually changing
>> the version of this recipe.
>>
>> Is this an acceptable downside, or is there a good way to fix this?
> 
> There were a few things which concern me. It is late in the release cycle for
> this to make it into kirkstone so I was deferring it until 4.1 and the next
> development cycle.
> 
> I was worried that it doesn't have a maintainers entry. I was also worried that
> it doesn't have any tests and doesn't get used at all on the autobuilder. There
> doesn't seem to have been much other feedback/review on the mailing list either.
> There also isn't any documentation. This makes it likely to become a piece of
> untested and potentially dead code going forward.
> 
> People are fixing up bits of the fitimage and initramfs code adhoc with just
> enough changes to sovle their use case. We really need docs and tests and
> ideally a clear plan on how this all fits together.
> 
> I suspect that the downside you mention, the fact that the kernel is removed
> from package management will also catch people out. It is different to our
> normal behaviour and I don't know how we highlight to users that this issue is
> present.
> 
> I'm also worried that we don't have enough people looking at rewiew and that
> there are probably issues here we need to discuss but we simply don't have the
> right people with time to look at and think about it. I'm not the subject matter
> expert here :(.
> 
> I wish I had something I could say as to how to make it acceptable to merge
> (definitely needs tests) but I really don't know this area well enough and I
> haven't had the time to think enough about it. It hovered in -next for a while
> as I was trying my best to do so but with the release breaking I needed to clear
> out -next for my own sanity and this ended in my defer pile. Even writing the
> email explaining why takes 10 minutes.

Thanks a lot for the explanation! I might come back to this at a more 
relaxed period with the suggested improvements.

regards,
Claudius

