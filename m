Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5995C745BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 09:37:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w659bOcK008380
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Jul 2018 02:37:24 -0700 (PDT)
Received: from [128.224.162.216] (128.224.162.216) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 5 Jul 2018 02:37:24 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180704065654.21039-1-zhe.he@windriver.com>
	<CAMKF1sr-+FgZYWSD-LEVxZ5uAf7TE8qTPJ7=NYs=ixOPc9cwHA@mail.gmail.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <0cf4c4a2-c9ef-7f1b-ccfe-f1413dc1f312@windriver.com>
Date: Thu, 5 Jul 2018 17:37:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr-+FgZYWSD-LEVxZ5uAf7TE8qTPJ7=NYs=ixOPc9cwHA@mail.gmail.com>
X-Originating-IP: [128.224.162.216]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 05 Jul 2018 09:37:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018年07月04日 21:29, Khem Raj wrote:
> i think you can squash both patches into one. Additionally we should
> be able to cover mipsel case as well

I started a build with latest poky and only set DEFAULTTUE=mipsel. Is this the right way to use little endian?

Then I got the following error and found kernel and kernel modules output are all big endian.

ERROR: linux-yocto-4.14.48+gitAUTOINC+94457657b8_6c2433d7c5-r0 do_package_qa: QA Issue: Endiannes did not match (1 to 0) on /work/qemumips-poky-linux/linux-yocto/4.14.48+gitAUTOINC+94457657b8_6c2433d7c5-r0/packages-split/kernel-module-i2c-dev-4.14.48-yocto-standard/lib/modules/4.14.48-yocto-standard/kernel/drivers/i2c/i2c-dev.ko [arch]

Then I tried to build a empty file.
tmp/work/x86_64-linux/gcc-cross-mipsel/8.1.0-r0/recipe-sysroot-native/usr/bin/mipsel-poky-linux/mipsel-poky-linux-gcc -c a.c
as: unrecognized option '-EL'

Does it mean there something wrong with little endian toolchain?

Zhe

> On Tue, Jul 3, 2018 at 11:57 PM He Zhe <zhe.he@windriver.com> wrote:
>> OE uses qemumips to simulate a Malta board by default.
>>
>> As upstream qemu introduced:
>> https://git.qemu.org/?p=qemu.git;a=commit;h=94c2b6aff43cdfcfdfb552773a6b6b973a72ef0b
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
>> ...
>> commit 73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411
>> Author: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
>> Date:   Wed Nov 23 14:43:49 2016 +0100
>>
>>     MIPS: fix mem=X@Y commandline processing
>> ...
>>
>> So remove `mem=*' to disable user-defined physical RAM map
>> which let kernel itself caculates memory ranges.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  scripts/runqemu | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index de42d0f323..597e7e9a79 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -668,7 +668,10 @@ class BaseConfig(object):
>>              logger.info('QB_MEM is not set, use 512M by default')
>>              self.set('QB_MEM', '-m 512')
>>
>> -        self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
>> +        mach = self.get('MACHINE')
>> +        if mach != 'qemumips':
>> +            self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
>> +
>>          self.qemu_opt_script += ' %s' % self.get('QB_MEM')
>>
>>      def check_tcpserial(self):
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


