Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9ED6A78879
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 09:13:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0V9D3Om002709
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Jan 2018 01:13:03 -0800 (PST)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 31 Jan 2018 01:12:50 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
References: <1512528404-110242-1-git-send-email-hongxu.jia@windriver.com>
	<8a6e557b-b2bb-28bd-05ef-63ef209bc9ae@windriver.com>
Message-ID: <96f645e6-47cf-ef37-8071-fd490017ba4e@windriver.com>
Date: Wed, 31 Jan 2018 17:16:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <8a6e557b-b2bb-28bd-05ef-63ef209bc9ae@windriver.com>
Subject: Re: [PATCH 1/2] scripts/runqemu: qemumips support up to 2GiB RAM
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
X-List-Received-Date: Wed, 31 Jan 2018 09:13:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年12月20日 09:53, Hongxu Jia wrote:
> Ping Ross
>

Ping

//Hongxu

> //Hongxu
>
> On 2017年12月06日 10:46, Hongxu Jia wrote:
>> OE uses qemumips to simulate a Malta board by default.
>>
>> As upstream qemu introduced:
>> https://git.qemu.org/?p=qemu.git;a=commit;h=94c2b6aff43cdfcfdfb552773a6b6b973a72ef0b 
>>
>>
>> The Malta board can support up to 2GiB of RAM which should
>> be able to boot a Linux kernel built with CONFIG_HIGHMEM
>> enabled and passing "-m 2048" to QEMU and appending the
>> following kernel parameters:
>> ...
>> mem=256M@0x0 mem=256M@0x90000000 mem=1536M@0x20000000
>> ...
>>
>> But the following commit in kernel broke above mem=X@Y setting
>> which added the memory as reserved memory area.
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411 
>>
>> ...
>> commit 73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411
>> Author: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
>> Date:   Wed Nov 23 14:43:49 2016 +0100
>>
>>      MIPS: fix mem=X@Y commandline processing
>> ...
>>
>> So remove `mem=*' to disable user-defined physical RAM map
>> which let kernel itself caculates memory ranges.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   scripts/runqemu | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index f2b4b3c..0ae2f85 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -658,7 +658,10 @@ class BaseConfig(object):
>>               logger.info('QB_MEM is not set, use 512M by default')
>>               self.set('QB_MEM', '-m 512')
>>   -        self.kernel_cmdline_script += ' mem=%s' % 
>> self.get('QB_MEM').replace('-m','').strip() + 'M'
>> +        mach = self.get('MACHINE')
>> +        if mach != 'qemumips':
>> +            self.kernel_cmdline_script += ' mem=%s' % 
>> self.get('QB_MEM').replace('-m','').strip() + 'M'
>> +
>>           self.qemu_opt_script += ' %s' % self.get('QB_MEM')
>>         def check_tcpserial(self):
>
>


