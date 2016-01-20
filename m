Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8C40B6FFE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 01:17:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K1H2eN015004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Jan 2016 17:17:02 -0800 (PST)
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jan 2016 17:17:01 -0800
To: Andre McCurdy <armccurdy@gmail.com>
References: <569DE54C.7090506@windriver.com>
	<CAJ86T=WDHvsC2PKP5wKizrq_+Ri1Z6OTnJLhxsS4O1DoKpy=Bw@mail.gmail.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <569EE00C.6070408@windriver.com>
Date: Wed, 20 Jan 2016 09:17:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WDHvsC2PKP5wKizrq_+Ri1Z6OTnJLhxsS4O1DoKpy=Bw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [BUG REPORT] failed to build valgrind on qemuarm
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
X-List-Received-Date: Wed, 20 Jan 2016 01:17:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年01月20日 04:20, Andre McCurdy wrote:
> On Mon, Jan 18, 2016 at 11:27 PM, Rongqing Li <rongqing.li@windriver.com> wrote:
>>
>> 2: on qemuarma9
>>
>
> The problem seems to be that the machine doesn't support NEON and
> Valgrind 3.11 includes a new test case which uses embedded NEON
> instructions.
>
> We do already disable a few tests which don't build for all ARM
> machines (see "remove-arm-variant-specific.patch"), so maybe the
> "sh-mem-random" test should be disabled as well. I'll take a look.
>
> What DEFAULTTUNE does the qemuarma9 machine use?
>

DEFAULTTUNE="armv7at"

thanks

-Roy

>>
>> | arm-wrs-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=softfp  -marm
>> -mthumb-interwork
>> --sysroot=/work/wr/buildarea/arm/bitbake_build/tmp/sysroots/qemuarma9
>> -DHAVE_CONFIG_H -I.
>> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/memcheck/tests
>> -I../..
>> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0
>> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/include
>> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/coregrind
>> -I../../include
>> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/VEX/pub
>> -I../../VEX/pub -DVGA_arm=1 -DVGO_linux=1 -DVGP_arm_linux=1
>> -DVGPV_arm_linux_vanilla=1   -Winline -Wall -Wshadow -Wno-long-long -g
>> -fno-stack-protector    -O2 -pipe -g  -fno-omit-frame-pointer
>> -fvisibility=default -O0 -c -o sh-mem-random.o
>> /work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/memcheck/tests/sh-mem-random.c
>> | {standard input}: Assembler messages:
>> | {standard input}:1107: Error: selected processor does not support ARM mode
>> `vld1.64 {d7},[r3]'
>> | {standard input}:1107: Error: selected processor does not support ARM mode
>> `vst1.64 {d7},[r2]'
>> | Makefile:2467: recipe for target 'sh-mem-random.o' failed
>>
>>
>> and the codes are below:
>>
>> 194 #elif defined(__linux__) && defined(__arm__) && !defined(__aarch64__)
>> 195             /* On arm32, many compilers generate a 64-bit float move
>> 196                using two 32 bit integer registers, which completely
>> 197                defeats this test.  Hence force a 64-bit NEON load and
>> 198                store.  I guess this will break the build on non-NEON
>> 199                capable targets. */
>> 200             __asm__ __volatile__ (
>> 201                "vld1.64 {d7},[%0] ; vst1.64 {d7},[%1] "
>> 202                : : "r"(arr+src), "r"(arr+dst) : "d7","memory"
>> 203             );
>> 204 #else
>>
>>
>> -Roy
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

-- 
Best Reagrds,
Roy | RongQing Li

