Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA7C279202
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 23:12:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9INCuna013691
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Oct 2018 16:12:56 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 18 Oct 2018 16:12:55 -0700
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <20181017022220.20841-1-Randy.MacLeod@windriver.com>
	<20181017022220.20841-2-Randy.MacLeod@windriver.com>
	<a8a5a1b9c5b5f477c5d6a119564f86ae4a8df342.camel@linuxfoundation.org>
	<CAMKF1spqvkXcedaEWQ-5qy_kCX4FLg5m2o0WA+nQzkRwUCeoPA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <fb27f898-4792-aba3-cc3e-c9c15204a003@windriver.com>
Date: Thu, 18 Oct 2018 19:12:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spqvkXcedaEWQ-5qy_kCX4FLg5m2o0WA+nQzkRwUCeoPA@mail.gmail.com>
X-Originating-IP: [172.25.44.4]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: update from 3.13.0 to 3.14.0
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
X-List-Received-Date: Thu, 18 Oct 2018 23:12:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/18/18 1:51 PM, Khem Raj wrote:
> On Thu, Oct 18, 2018 at 5:02 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On #if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
> Tue, 2018-10-16 at 22:22 -0400, Randy MacLeod wrote:
>>> Removed patches are all upstream.
>>> Adjusted two patches due to rebase.
>>>
>>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>>
>> I set the autobuilder at this and it fails in musl in
>> do_compile_ptest_base:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/27/builds/126/steps/7/logs/step1b
>>
> 
> yeah using  __GLIBC_PREREQ needs to be wrapped in
> 
> #if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
> 
> #endif

For v2 I'll fix the build for musl and
remove that unused patch that patchworks pointed out.

All the glibc builds succeeded except for arm and mips64
which were not supported by the recipe. I'll check on that
with the new version of valgrind at some point, likely on
master-wr-> 2.6.1.



Here is the pass rate compared to 2.6-M3 QA run:

Test run:       qa-3.13   vg-3.14   vg-3.13

Tests ran       558       547       538
Passed          215       287       201
Failed          343       260       337
Passrate 	38.53     52.5      37.4
Last Passrate   49.1

where:
   qa-3.13 is from the 2.6-M3 QA report
   vg-3.14 is this update and
   vg-3.13 is with this update removed using poky at:
      3b77e7b785 systemtap: Fix issues from 4.0 upgrade

So the ptest results really are better and they are even
better than the last pass rate that QA reported.
Nonetheless, a 52.5% pass rate isn't good enough so
I'll work on that for master-wr with backports to 2.6.1.

../Randy



Some notes and more raw data than presented above.

BTW, I allocated 4G RAM to the qemu machine
after running with the default and seeing the OOM killer
run many times. I wonder if the QA test doesn't allocate
enough RAM to deal with valgrind's high overhead.


The ptests summary using:
qemux86-64 using core-image-full-cmdline and
40GB extra FS in the image and running:
$ runqemu nographic slirp kvm qemuparams="-m 4096"

valgrind-3.14 is:
=== Test Summary ===
TOTAL: 579
PASSED: 287
FAILED: 260
SKIPPED: 32

with valgrind-3.13:

=== Test Summary ===
TOTAL: 570
PASSED: 201
FAILED: 337
SKIPPED: 32


> 
>> Cheers,
>>
>> Richard
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
# Randy MacLeod
# Wind River Linux

