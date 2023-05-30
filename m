Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5331FC77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 21:44:56 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.1211.1685483089528619866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 14:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.37] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 34ULikTK021280;
	Tue, 30 May 2023 16:44:47 -0500
Message-ID: <40e7d2a3-2b45-323b-3986-2c6e89bf74ef@kernel.crashing.org>
Date: Tue, 30 May 2023 16:44:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH v4] Fixes pseudo build in loongarch64
Content-Language: en-US
To: Seebs <seebs@seebs.net>, zhangjialing@loongson.cn
Cc: openembedded-core@lists.openembedded.org
References: <20230530113302.1473632-1-zhangjialing@loongson.cn>
 <20230530114341.15e9f79e@seebsdell>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20230530114341.15e9f79e@seebsdell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 21:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181957

I am working on changing the v4 into a more generic implementation based on 
Seebs' and others comments.  I'll likely be sending something to the list as an 
RFC later today or tomorrow.

--Mark

On 5/30/23 11:43 AM, Seebs wrote:
> On Tue, 30 May 2023 19:33:03 +0800
> zhangjialing@loongson.cn wrote:
> 
>> +#ifdef __loongarch64
> 
> No.
> 
> Use the configuration mechanisms or whatever to determine the *actual
> distinction you care about*, which is "does glibc have __xstat64", give
> that a name, and use the name.
> 
> Some day, someone else will make a glibc that doesn't have __xstat64.
> The change to adopt that should be one line in configure or the like,
> not hundreds of changes scattered throughout the code.
> 
>> +        int existed = (real_stat64(path, &buf) != -1);
>> +#else
>>   	int existed = (real___xstat64(_STAT_VER, path, &buf) != -1);
>> -
>> +#endif
> 
> This looks suspiciously similar to the logic you introduce elsewhere
> for base_stat, base_fstat, etcetera.
> 
> Reproducing that up here:
> 
>> +#ifdef __loongarch64
>> +#define base_fstatat(dirfd, path, buf, flags) real_fstatat64( dirfd,
>> path, buf, flags)
>> +#else
>>   #define base_fstatat(dirfd, path, buf, flags)
>> real___fxstatat64(_STAT_VER, dirfd, path, buf, flags)
>> +#endif
> 
> Again, shouldn't be using a specific arch flag, should be using a
> symbolic flag, but: Given this, maybe we should just be using
> base_fstatat, base_stat, etcetera, in these lines, rather than
> calling a specific real___foo function directly. Or alternatively,
> we should be using pseudo_stat, etcetera, which also exist, and
> I honestly don't remember why there are two sets of those.
> 
> So the change should look something like
> 
> - int existed = ((real___xstat64(_STAT_VER, path, &buf) != -1);
> + int existed = ((base_stat(path, &buf) != -1);
> 
> with suitable updates to the way we define the base_foo functions,
> making them contingent on something like HAVE_XSTAT.
> 
> This would cover the vast majority of these changes, but not all of
> them.
> 
>> --- a/ports/linux/guts/fstat.c
>> +++ b/ports/linux/guts/fstat.c
>> @@ -7,8 +7,17 @@
>>    * int fstat(int fd, struct stat *buf)
>>    *	int rc = -1;
>>    */
>> -
>> +#ifdef __loongarch64
>> +	struct stat64 buf64;
>> +        /* populate buffer with complete data */
>> +	real_fstat(fd, buf);
>> +        /* obtain fake data */
>> +	rc = wrap_fstat64(fd, &buf64);
>> +        /* overwrite */
>> +	pseudo_stat32_from64(buf, &buf64);
>> +#else
>>   	rc = wrap___fxstat(_STAT_VER, fd, buf);
>> +#endif
>>   
>>   /*	return rc;
>>    * }
> 
> Here, we really do have a meaningful change; in the standard linux port,
> we know that we can just forward fstat to __fxstat.
> 
> Probably the best model for the canonical way to fix this is to look
> at the oldclone/newclone subports. When you have changes this
> substantive, we don't want to do them with large inline #ifdefs; we want
> to describe these as distinct subports, which have a different set of
> functions. So in the hypothetical new "xstat" port, we'd have the
> existing fstat and __fxstat wrappers, and in the new "noxstat" port,
> we'd just have an fstat wrapper that uses the same logic.
> 
>> diff --git a/templates/wrapfuncs.c b/templates/wrapfuncs.c
>> index 93bb671..14a42e2 100644
>> --- a/templates/wrapfuncs.c
>> +++ b/templates/wrapfuncs.c
>> @@ -13,7 +13,9 @@
>>    * script if you want to modify this. */
>>   @body
>>   
>> +#ifndef __loongarch64
>>   static ${type} (*real_${name})(${decl_args}) = ${real_init};
>> +#endif
>>   
>>   ${maybe_skip}
> 
> I don't understand how this part can work at all; I was under the
> impression that we actually did in fact use these real_foo objects,
> and this seems to remove them all, so I don't even get how this
> is compiling or running, because after this, there's no real_foo
> function pointers at all?
> 
> Unfortunately, it turns out bitrot has taken my laptop and I can't
> build pseudo on it natively because _STAT_VER no longer exists. So
> I think the hypothetical distant future in which we conceivably
> care about a system on which the real___xstatat(_STAT_VER, ...) calls
> fail and isn't __longarch64 actually happened over a year ago and
> we just didn't notice.
> 
> "Oops."
> 
> -s
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181938): https://lists.openembedded.org/g/openembedded-core/message/181938
> Mute This Topic: https://lists.openembedded.org/mt/99217464/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

