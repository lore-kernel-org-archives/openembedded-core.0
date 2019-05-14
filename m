Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D191160102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 18:24:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4EIOe8t028056
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 May 2019 11:24:40 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 14 May 2019 11:24:40 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alistair Francis
	<Alistair.Francis@wdc.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20190513225205.14791-1-alistair.francis@wdc.com>
	<d2813cd316e8c8574f532727cb464d2a6e0bd796.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <a0e0cda1-dd25-5347-fcc2-c01a5de3cc04@windriver.com>
Date: Tue, 14 May 2019 14:24:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d2813cd316e8c8574f532727cb464d2a6e0bd796.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH] gdb: Upgrade from 8.2.1 to 8.3
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
X-List-Received-Date: Tue, 14 May 2019 18:24:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 5/14/19 1:36 PM, Richard Purdie wrote:
> On Mon, 2019-05-13 at 22:53 +0000, Alistair Francis wrote:
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>> If there are issues with the patch the branch is avaliable here:
>> https://github.com/alistair23/openembedded-core/tree/alistair/gdb-8.3
> 
> Seems there is a problem in oe-selftest:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/174/steps/7/logs/step2d
> 
> "oe-selftest -r package.PackageTests.test_gdb_hardlink_debug" should
> reproduce and it seemed to happen on more than one host.

I have some off-list notes, show below, for a bug that I haven't
gotten to yet.

Alistair,

Could you adjust the oeqa match criteria based on the info below?

../Randy


The oe-selftest:
    https://bugzilla.yoctoproject.org/show_bug.cgi?id=13123
is failing because the check at:
    meta/lib/oeqa/selftest/cases/package.py:
                elif "Breakpoint 1, main () at hello.c:4" in l:
is too precise. (This wasn't obvious to me for quite a
while based on the defect report!)

Anyway, at times, the test would pass for me other times
it would not as you may have noticed. For interactive tests, gdb
always functions properly but the breakpoint doesn't always
result in the *exact* string:
    "Breakpoint 1, main () at hello.c:4"
sometimes (with glibc-dev, iirc) it's:
    "Breakpoint 1, 0x0804905e in main () at hello.c:4"
and sometimes it's just:
    "Breakpoint 1, 0x0804905e: file hello.c, line 4"

so unless Khem or someone knows how to ensure
100% consistent behaviour, perhaps we should search for:

    "Breakpoint 1, .* hello.c.*4"   ( I'm not sure of the proper regex.)
since that will confirm that a breakpoint was hit at the proper file/line.

> 
> Cheers,
> 
> Richard
> 


-- 
# Randy MacLeod
# Wind River Linux

