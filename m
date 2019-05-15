Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF9B7DE3D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 02:23:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4F2MOaX007258
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 May 2019 19:22:34 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 14 May 2019 19:22:13 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, "Yang, Liezhi"
	<Liezhi.Yang@windriver.com>, "Burton, Ross" <ross.burton@intel.com>, "Hao,
	Kexin" <Kexin.Hao@windriver.com>
References: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
	<20190514035716.27376-2-Randy.MacLeod@windriver.com>
	<4588fa927b2e10223bab39d65aab4184db783f49.camel@linuxfoundation.org>
	<8f1030b6-b831-7ac8-88e3-1208272d7533@windriver.com>
	<19e3463fcf6a41f0c35b7227760bd1f2cf6aeac5.camel@linuxfoundation.org>
	<c6d172d4-80f4-d91b-662f-b9b1de85f032@windriver.com>
	<0332c9bc1d4a9d3b841a1afb658dfd952e2e3d80.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <ff3995a4-6c30-0e36-53ad-d02f7d037f81@windriver.com>
Date: Tue, 14 May 2019 22:22:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0332c9bc1d4a9d3b841a1afb658dfd952e2e3d80.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH 2/5] valgrind: do not strip the package or ptests
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
X-List-Received-Date: Wed, 15 May 2019 02:23:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 5/14/19 5:46 PM, richard.purdie@linuxfoundation.org wrote:
> On Tue, 2019-05-14 at 17:42 -0400, Randy MacLeod wrote:
>> On 5/14/19 5:32 PM, richard.purdie@linuxfoundation.org wrote:
>>> Actually, my test was flawed. I just retested and this time it
>>> worked.
>>> What I tested with was:
>>>
>>> RDEPENDS_${PN}-ptest += " sed perl perl-module-file-glob ${PN}
>>> ${PN}-dbg"
>>> INSANE_SKIP_${PN}-ptest = "debug-deps"
>>
>> Ah nice. Thanks.
> 
> Note I add PN above, I'm going to send a different patch which does
> that in the ptest bbclass as it fixes a ton of problems. Its not quite
> a straightforward patch though.
> 
>>> Can you see if that works for you?
>>
>> Sure. I'll test and resend the whole series.
>>
>>> We also have a problem that its overflowing the 4GB limit on some
>>> image
>>> sizes with the debug info included :/
>>
>> There's an enhancement to track that:
>>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=13025
>> Kevin owns it and has it scheduled for 2.8 M2.
> 
> The immediate problem will have to be fixed before valgrind can merge:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/602
> 
> Cheers,
> 
> Richard
> 

More test results!

The qemuarm64 valgrind ptest failures are due to a hard-coded
timeout patch in vg_regtest. It timed out at 30 seconds but
always left orphaned process hanging which eventually triggered
an OOM killer rampage. I bumped the timeout to 300 seconds to
see what that would do. It takes a long, long time but
the final result is the same as x86:

qemuarm64:
=== Test Summary ===
TOTAL: 159
PASSED: 149
FAILED: 1
SKIPPED: 9
DURATION: 10083
END: /usr/lib/valgrind/ptest
2019-05-14T23:16


qemuppc (300 second timeout):
=== Test Summary ===
TOTAL: 159
PASSED: 146
FAILED: 3
SKIPPED: 10
DURATION: 5492
END: /usr/lib/valgrind/ptest
2019-05-15T01:59
STOP: ptest-runner
root@qemuppc:/usr/lib/valgrind/ptest# grep FAIL 
valgrind_ptest_20190515-002816.log
FAIL: drd/tests/annotate_trace_memory
    but ^^^-- sorting exp-32bit and out file -> no diff
FAIL: drd/tests/annotate_trace_memory_xml <-- same
FAIL: drd/tests/std_list
FAILED: 3

I'm not sure why the output file is not ordered as expected but
I will likely not investigate qemuppc unless someone knows of a
use-case where this is an actual problem.


We need to agree on how to handle the ptest timeout.
I'll check if other recipes accept the optional timeout from:
    # ptest-runner -h
    Usage: ptest-runner [-d directory] [-e exclude] [-l list] \
      [-t timeout] [-x xml-filename] [-h] [ptest1 ptest2 ...]

It's tempting to just bump the timeout to 300 seconds
since anything that fails with that timeout really should
be fixed. The right thing is to pass the timeout from ptest-runner
down to valgrind's vg_regtest script. If we have people who set
timeouts to a non-default value and will be running valgrind's
ptest then I could do that.

Since I'm a completist, I'm going to try qemumips64 next! :)
-- 
# Randy MacLeod
# Wind River Linux

