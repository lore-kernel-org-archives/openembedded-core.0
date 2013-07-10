Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 473B460593
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 13:25:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6ADPJIO022231
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 06:25:20 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 10 Jul 2013 06:25:19 -0700
Message-ID: <51DD60BF.9000302@windriver.com>
Date: Wed, 10 Jul 2013 08:25:19 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <ly8v1etzn5.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<ly4nc2twyk.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51DD5E6A.5080301@topic.nl>
In-Reply-To: <51DD5E6A.5080301@topic.nl>
Subject: Re: kernel miscompilation with gcc 4.8 for ARMv5
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
X-List-Received-Date: Wed, 10 Jul 2013 13:25:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/13 8:15 AM, Mike Looijmans wrote:
> On 07/10/2013 02:34 PM, Enrico Scholz wrote:
>> Enrico Scholz
>> <enrico.scholz-wttK6gPy29v+Hn7q9Vec/7NAH6kLmebB@public.gmane.org>
>> writes:
>>
>>> is it expected that recent gcc 4.8[1] compiles the kernel correctly?
>>> Kernels for ARMv5 platforms (PXA168 -> 3.4.52, MX28 -> 3.8.13) fail here
>>> 100% at early boot with
>>
>> Applying two upstream kernel commits
>> 455bd4c430b0c0a361f38e8658a0d6cb469942b5 (ARM: 7668/1: fix
>> memset-related crashes caused by recent GCC (4.7.2) optimizations) and
>> 418df63adac56841ef6b0f1fcf435bc64d4ed177 (ARM: 7670/1: fix the memset
>> fix) seem to fix the problem for me.
>>
>
> I encountered a compilation problem for MIPS kernels (version 3.3 and
> below) with the new GCC compiler:
>
>
>    arch/mips/mm/page.c:89:6: error: 'clear_page' alias in between
> function and variable is not supported
> void clear_page(void *page) __attribute__((alias("clear_page_array")));
>          ^
> arch/mips/mm/page.c:84:12: error: 'clear_page_array' aliased declaration
> [-Werror]
> static u32 clear_page_array[0x120 / 4];
>                ^
> arch/mips/mm/page.c:108:6: error: 'copy_page' alias in between function
> and variable is not supported
> void copy_page(void *to, void *from)
> __attribute__((alias("copy_page_array")));
>         ^
> arch/mips/mm/page.c:102:12: error: 'copy_page_array' aliased declaration
> [-Werror]
> static u32 copy_page_array[0x540 / 4];
>
>
> So I'll probably have to go and look for backports to apply here. Anyone
> happen to come across this one already?
> (Looking in the git history for that file suggests applying
> c022630633624a75b3b58f43dd3c6cc896a56cff from upstream)
>
> A 3.8 kernel is running just fine with gcc 4.8.

The following commit fixed the issue in 3.4.  I assume it'll work in other versions.

kernel.org commit: c022630633624a75b3b58f43dd3c6cc896a56cff

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=c022630633624a75b3b58f43dd3c6cc896a56cff

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


