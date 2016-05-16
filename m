Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A14F605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:49:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4GCnSi4026167
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 16 May 2016 05:49:28 -0700
Received: from server.local (147.11.118.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 16 May 2016 05:49:27 -0700
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
	<2cc568062314cdddd5ff2f60dd6d9685b3b12831.1463157783.git.raj.khem@gmail.com>
	<1463295824.9746.152.camel@linuxfoundation.org>
	<CAMKF1spXkA9+x62pzj9ukt0uKdmmWW3BMcKPCbpRgVC7Qbve6Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <2196a177-c364-ea7b-0545-a42e631880dc@windriver.com>
Date: Mon, 16 May 2016 08:49:27 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spXkA9+x62pzj9ukt0uKdmmWW3BMcKPCbpRgVC7Qbve6Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] tcmode-default: Bump gcc,glibc,gdb
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
X-List-Received-Date: Mon, 16 May 2016 12:49:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-05-15 5:25 AM, Khem Raj wrote:
> On Sun, May 15, 2016 at 12:03 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2016-05-13 at 09:46 -0700, Khem Raj wrote:
>>> gcc 6.1, glibc 2.24, gdb 7.11
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  meta/conf/distro/include/tcmode-default.inc | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> I'll merge most of this series however before we can move to gcc6 by
>> default there are some remaining issues:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/b
>> uilds/788/steps/BuildImages/logs/stdio
>>
>> qt4-x11-free fails to compile
>
> This can be fixed easily. I will see if I can cook up one.
>
>> linux-yocto 4.1 also fails
>
> I am sure if we upgrade to latest point release of 4.1 then most of
> fixes may be available.
> but there are more than 1 fixes that would require backport

Two 4.1 -stable updates came out just recently. I already have them
queued here. I'll send them along today .. will have a scan to see if
the gcc6 changes were picked up by the maintainer.

>
>>
>> (on qemux86-64, qemux86, qemuppc, qemumips, qemuarm)
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/7
>> 78/steps/BuildImages_1/logs/stdio
>>
>> linux-yocto 4.4 fails on ppc
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/bui
>> lds/768/steps/BuildImages/logs/stdio
>
> This patch https://patchwork.ozlabs.org/patch/614548/ is required and
> I gave pointers for that to Bruce
> and was hoping that with
> http://git.openembedded.org/openembedded-core/commit/?id=f1c75b93a4e11425e595c5ce043fbb0276a41931
> the above fix is bundled in but Bruce might be able to conform.
>

Confirmed that the fix is in that commit. In linux-yocto:

Author: Khem Raj <raj.khem@gmail.com>
Date:   Mon Apr 25 05:47:01 2016 +0000

     powerpc/ptrace: Fix out of bounds array access warning

     gcc-6 correctly warns about a out of bounds access

     arch/powerpc/kernel/ptrace.c:407:24: warning: index 32 denotes an 
offset greater than size of 'u64[32][1] {aka long long unsigned 
int[32][1]}' [-Warray-bounds]
             offsetof(struct thread_fp_state, fpr[32][0]));
                             ^

     check the end of array instead of beginning of next element to fix this

     Signed-off-by: Khem Raj <raj.khem@gmail.com>
     Cc: Kees Cook <keescook@chromium.org>
     Cc: Michael Ellerman <mpe@ellerman.id.au>
     Cc: Segher Boessenkool <segher@kernel.crashing.org>
     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

All the branches have that commit now, and it is covered by that SRCREV
bump. So there's something else lurking for ppc.

Bruce

>
>>
>> non-GPLv3 on elfutils and diffutils
>
> Yes, now, I wonder if we can backport fixes from newer versions and
> still call it GPL-2 without getting
> consent from patch authors. This is going to be a bit twisted.
>
>>
>> (There may be other failures too, the build hasn't completed yet)
>>
>> We'll need to come up with a plan to address these issues (possibly
>> upgrades for some of the kernels?) before we can change the defaults.
>>
>> Cheers,
>>
>> Richard
>>
>>


