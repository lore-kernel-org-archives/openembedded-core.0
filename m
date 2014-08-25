Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D577F62252
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 19:12:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7PJC8eA017312
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 12:12:08 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Mon, 25 Aug 2014 12:12:08 -0700
Message-ID: <53FB8A87.1010202@windriver.com>
Date: Mon, 25 Aug 2014 14:12:07 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1408649791.git.peter.seebach@windriver.com>	<53F77370.2060603@balister.org>
	<20140822133349.76751634@e6410-2>	<20140822193910.GD20524@jama>
	<20140822154954.04d4fc02@e6410-2>	<20140822214626.GF20524@jama>
	<20140822170626.13280b11@e6410-2> <20140822222642.GG20524@jama>
In-Reply-To: <20140822222642.GG20524@jama>
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Mon, 25 Aug 2014 19:12:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/14, 5:26 PM, Martin Jansa wrote:
> On Fri, Aug 22, 2014 at 05:06:26PM -0500, Peter Seebach wrote:
>> On Fri, 22 Aug 2014 23:46:26 +0200
>> Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>>> changing
>>> default DEFAULTTUNE (and TUNE_PKGARCH with that) to have thumb while
>>> still building with -marm doesn't make much sense to me and is only
>>> confusing.
>>
>> I think the distinction is that if you use armv7at-neon, you *can* build
>> specific packages with thumb. Mostly, I guess, I don't think it makes sense
>> to use a tuning that specifically states that it can't run thumb code for
>> processors which can. Although... May not be an important distinction, really,
>> as you note.
>
>> I don't think it makes sense to use a tuning that specifically states
>> that it can't run thumb code

The defaulttune is supposed to supply what the processor and ABI are capable of.

So in the case of armv7a, it's saying no thumb support at all, this included 
thumb interwork.

armv7at says that the processor supports thumb, and interwork -should- be 
enabled.  (It can of course be manually disabled, but that's another issue to be 
dealt with...)

armv7at doesn't say it actually includes thumb combines binaries.  (I argued 
originally it should, but was overruled for a variety of reasons... not the 
least of which is the interwork enabled, and multilib issues with 'same abi' 
configurations.)

So I agree the default should be armv7at or armv7at-neon, unless there is a 
compelling reason to leave it as a default with interwork disabled.

As for the hard float question.  I'm torn on this.. for compatibility a lot of 
the industry is still soft-float based, and frankly I've not exactly encouraged 
it with my customers.. (I'm not seeing general performance improvements, only 
improvements in select artificial benchmarks, or specific pieces of code.)

But if changing the default to hard float were generally agreed upon (for 
architectures where VFP are available) then I wouldn't object.

--Mark

> The problem is that "t" in DEFAULTUNE always adds "t2" to TUNE_PKGARCH
> no matter if you've built the package with -marm or -mthumb. So as long
> as ARM_INSTRUCTION_SET is "arm" by default, we should use the same
> default for DEFAULTTUNE - I wouldn't mind changing ARM_INSTRUCTION_SET
> at least more people will be hit by those ICEs I've reported earlier
> (with patch forcing ARM_INSTRUCTION_SET to "arm" for gdb and icu
> "gdb: force arm mode" http://patchwork.openembedded.org/patch/75703/
> "icu: force arm mode" http://patchwork.openembedded.org/patch/75817/
>
> It would be interesting to try
> http://patchwork.openembedded.org/patch/70985/
> with latest master to see if it can work correctly now, then I wouldn't
> be so opposed to "enabling" thumb in DEFAULTTUNE (even without
> ARM_INSTRUCTION_SET change)
>
>>> Every distro can use something more "optimized" DEFAULTTUNEs for each
>>> MACHINE they use, I do it for SHR:
>>> https://github.com/shr-distribution/meta-smartphone/blob/shr/meta-shr-distro/conf/distro/include/defaulttunes.inc
>>
>> Huh, that's an interesting point. I'll wave this at people and see what they
>> think of it.
>>
>> -s
>> --
>> Listen, get this.  Nobody with a good compiler needs to be justified.
>
>
>


