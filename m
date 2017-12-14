Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E8D8478744
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 01:12:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBE1CGiD020918
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Dec 2017 17:12:16 -0800 (PST)
Received: from server.local (128.224.21.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 13 Dec 2017 17:12:15 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1513168490.19417.183.camel@linuxfoundation.org>
	<694b540b-1fc8-0388-5419-01c6e3f100c6@windriver.com>
	<1513173904.16507.1.camel@linuxfoundation.org>
	<85f7c521-01c4-7870-0f57-7ca217fce8e3@windriver.com>
	<1513174448.16507.8.camel@linuxfoundation.org>
	<2df34489-8c8f-bd76-3972-7ab648aeffee@windriver.com>
	<1513209861.16507.15.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <9159806a-8e45-f7f2-2421-fda03c45de67@windriver.com>
Date: Wed, 13 Dec 2017 20:12:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1513209861.16507.15.camel@linuxfoundation.org>
Cc: "Lock, Joshua" <joshua.g.lock@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Fix for the APIC hangs in qemux86-64
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
X-List-Received-Date: Thu, 14 Dec 2017 01:12:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2017-12-13 7:04 PM, Richard Purdie wrote:
> On Wed, 2017-12-13 at 19:01 -0500, Bruce Ashfield wrote:
>> On 2017-12-13 9:14 AM, Richard Purdie wrote:
>>>
>>> On Wed, 2017-12-13 at 09:07 -0500, Bruce Ashfield wrote:
>>>>
>>>> On 12/13/2017 09:05 AM, Richard Purdie wrote:
>>>>>
>>>>>
>>>>> On Wed, 2017-12-13 at 08:38 -0500, Bruce Ashfield wrote:
>>>>>>
>>>>>>
>>>>>> On 12/13/2017 07:34 AM, Richard Purdie wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Hi Bruce,
>>>>>>>
>>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12301
>>>>>>>
>>>>>>> We've root caused the hangs we're seeing in qemux86-64 on
>>>>>>> our
>>>>>>> autobuilder workers. We've identified a commit on 4.15-rc3
>>>>>>> which
>>>>>>> fixes
>>>>>>> the issue but backporting it to the autobuilder's host
>>>>>>> kernels
>>>>>>> will
>>>>>>> be
>>>>>>> a pain.
>>>>>>>
>>>>>>> As a workaround I'd like to enable x2apic on qemux86-64.
>>>>>>> Since
>>>>>>> that
>>>>>>> works via MSRs it avoids the problem.
>>>>>>>
>>>>>>> Would it be a big issue to set CONFIG_X86_X2APIC=y for
>>>>>>> qemux86-
>>>>>>> 64?
>>>>>> Nope. No big deal at all. I've used the same config i the
>>>>>> past
>>>>>> when doing work with rt-KVM, so I know it well.
>>>>>>
>>>>>> I'll prep a commit, and send it along as part of a rebased
>>>>>> set
>>>>>> of kernel patches.
>>>>> Thanks, much appreciated.
>>>>>
>>>>> Did we get to the bottom of the 4.12 selftest failures?
>>>>>
>>>> Not yet no. I was distracted for a day, but need to learn how
>>>> to run them myself. I was able to log in via serial in my normal
>>>> boot flow, so that didn't get me anywhere.
>>>>
>>>> Is the selftest HOWO in the yocto docs ? I'll google it up this
>>>> morning.
>>> No HOWTO but I did give you the command. In a poky checkout run:
>>>
>>> oe-selftest -r runqemu.RunqemuTests.test_boot_deploy
>>>
>>> which runs a single test that fails (setup DL_DIR/SSTATE_MIRRORS
>>> first
>>> to speed it up a bit).
>>>
>>> It may tell you to clear SANITY_TESTED_DISTROS, I think it auto
>>> adds
>>> meta-selftest now. You may also need to set DISPLAY to something
>>> (e.g.
>>> a dummy vncserver).
>>>
>> With the cleanup that Ross gave me, I'm now able to see the issue.
>>
>> I'll start debugging on Thursday.
>>
>> One additional question: what's the right way to find the logs of
>> that
>> run ?
>>
>> I'm getting a bit of noise from:
>>
>> ----------------
>>        0155:            else:
>> Exception: FileNotFoundError: [Errno 2] No such file or directory:
>> '/home/bruce/poky/build/tmp/sysroots-components/x86_64/python3-
>> native/usr/lib/python3.5/sqlite3/__pycache__/dump.cpython-35.opt-
>> 1.pyc'
>> ->
>> '/home/bruce/poky/build/tmp/work/core2-64-poky-linux/gnu-efi/3.0.6-
>> r0/recipe-sysroot-
>> native/usr/lib/python3.5/sqlite3/__pycache__/dump.cpython-35.opt-
>> 1.pyc'
>>
>> ERROR: gnu-efi-3.0.6-r0 do_package: Function failed:
>> extend_recipe_sysroot
>> ERROR: Logfile of failure stored in:
>> /home/bruce/poky/build/tmp/work/core2-64-poky-linux/gnu-efi/3.0.6-
>> r0/temp/log.do_package.10495
> 
> You've deleted pyc files from python itself which is bad. I'd
> cleansstate python-native and rebuilt it to fix that. Ross meant onto
> to run it on the poky meta directory...
> 

Is this what I should expect for the error ?

It looked like qemu timed out, but that is probably just the log
in issue, correct ?

A manual log into the same image worked!

Bruce

-------------------
32105  3290 python3 /home/bruce/poky/scripts/oe-selftest -r 
runqemu.RunqemuTests.test_boot_deploy
32520 32105 /bin/sh -c runqemu nographic 
/home/bruce/poky/build/tmp/deploy/images/qemux86-64 tcpserial=51081 
bootparams="console=tty1 console=ttyS0,115200n8 printk.time=1" 
qemuparams="-serial tcp:127.0.0.1:44545 -pidfile pidfile_32105"
32521 32520 python3 /home/bruce/poky/scripts/runqemu nographic 
/home/bruce/poky/build/tmp/deploy/images/qemux86-64 tcpserial=51081 
bootparams=console=tty1 console=ttyS0,115200n8 printk.time=1 
qemuparams=-serial tcp:127.0.0.1:44545 -pidfile pidfile_32105
32522 32105 python3 /home/bruce/poky/scripts/oe-selftest -r 
runqemu.RunqemuTests.test_boot_deploy
32527 32521 /bin/sh -c sudo /home/bruce/poky/scripts/runqemu-ifup 1000 
1000 
/home/bruce/poky/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin
32528 32527 sudo /home/bruce/poky/scripts/runqemu-ifup 1000 1000 
/home/bruce/poky/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin
32529     2 [kworker/u8:1]
32530 32105 ps axww -o pid,ppid,command

Qemu ended unexpectedly, dump data from host is in 
/tmp/oe-saved-tests/201712131950_qemu
Sending SIGTERM to runqemu
Sending SIGKILL to runqemu
Output from runqemu:
runqemu - INFO - Continuing with the following parameters:

runqemu - INFO - Setting up tap interface under sudo

----------------------------------------------------------------------
2017-12-13 19:52:57,550 - oe-selftest - INFO - Ran 1 test in 257.941s
2017-12-13 19:52:57,550 - oe-selftest - INFO - FAILED
2017-12-13 19:52:57,550 - oe-selftest - INFO -  (errors=1)
2017-12-13 19:52:57,550 - oe-selftest - INFO - RESULTS:
2017-12-13 19:52:57,551 - oe-selftest - INFO - RESULTS - 
runqemu.RunqemuTests.test_boot_deploy - Testcase 2007: ERROR
2017-12-13 19:52:57,551 - oe-selftest - INFO - SUMMARY:
2017-12-13 19:52:57,551 - oe-selftest - INFO - oe-selftest () - Ran 1 
test in 257.946s
2017-12-13 19:52:57,551 - oe-selftest - INFO - oe-selftest - FAIL - 
Required tests failed


> Cheers,
> 
> Richard
> 
> 


