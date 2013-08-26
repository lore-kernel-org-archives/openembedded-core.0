Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 731CE6A95B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 02:14:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7Q2Erdq000321
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Aug 2013 22:14:54 -0400 (EDT)
Received: from bruce-ashfields-macbook.local (128.224.21.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 25 Aug 2013 19:14:53 -0700
Message-ID: <521ABA1C.9010105@windriver.com>
Date: Sun, 25 Aug 2013 22:14:52 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1377405083.git.bruce.ashfield@windriver.com>
	<c2d44f9ff8d416b7f984bc4027de7acecbec0986.1377405083.git.bruce.ashfield@windriver.com>
	<CAMKF1sr+z-f7KW6BqMLbs0RuFu4fhz_crhBVM_++nOqVb=OtnQ@mail.gmail.com>
	<521AA761.4000605@windriver.com>
In-Reply-To: <521AA761.4000605@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] eglibc: ptrace: protect ptrace_peeksiginfo_args from redefintion
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
X-List-Received-Date: Mon, 26 Aug 2013 02:14:57 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-25 8:54 PM, Bruce Ashfield wrote:
> On 13-08-25 8:46 PM, Khem Raj wrote:
>> Hi Bruce
>>
>> On Sat, Aug 24, 2013 at 10:16 PM, Bruce Ashfield
>> <bruce.ashfield@windriver.com> wrote:
>>> linux kernel commit 84c751bd [ptrace: add ability to retrieve signals
>>> without removing from a queue (v4)]
>>> added ptrace_peeksiginfo_args to the exported kernel user api.
>>>
>>> This leads to build errors such as:
>>>
>>> | In file included from
>>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:66:0:
>>>
>>> |
>>> /poky-master/build/tmp/sysroots/qemux86/usr/include/linux/ptrace.h:58:8:
>>> error: redefinition of 'struct ptrace_peeksiginfo_args'
>>> |  struct ptrace_peeksiginfo_args {
>>> |         ^
>>> | In file included from
>>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/defs.h:159:0,
>>>
>>> |                  from
>>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:37:
>>>
>>> |
>>> /poky-master/build/tmp/sysroots/qemux86/usr/include/sys/ptrace.h:191:8:
>>> note: originally defined here
>>> |  struct ptrace_peeksiginfo_args
>>> |         ^
>>> | make[2]: *** [process.o] Error 1
>>>
>>> In files that include both the eglibc sys/ptrace.h and the linux
>>> kernel exported
>>> one.
>>>
>>> We can avoid this by making the eglibc variant only declare its
>>> structure if PTRACE_PEEKSIGINFO
>>> has not been defined.
>>
>> The problem is there however we need not fix it in eglibc thats wrong
>> place to fix it. The right place to fix it is affected application
>> which seems so mix glibc and kernel interfaces. It should try to not
>> mix kernel and glibc interfaces. This patch as such is not
>> appropriate.
>
> My insistence is that this go in in the mean time, otherwise the 3.10

s/insistence/suggestion/

That came out a bit to strong! :)

Bruce

> kernel headers miss the M4 cutoff and basically the whole release.
>
> I'm certainly not going to have the time and cycles to fix individual
> applications, so our choices boil down to taking this change, rolling
> back to the 3.8 headers, or waiting for individual package maintainers
> to update their packages to work with the 3.10 headers.
>
> I personally don't see the harm in this change, since these applications
> have always had this mix of both sys/ptrace.h and linux/ptrace.h in the
> past, now doesn't seem like the time to fix them.
>
> Cheers,
>
> Bruce
>
>
>>
>>
>>>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> ---
>>>   ...ect-ptrace_peeksiginfo_args-from-redefint.patch |   55
>>> ++++++++++++++++++++
>>>   meta/recipes-core/eglibc/eglibc_2.18.bb            |    1 +
>>>   2 files changed, 56 insertions(+)
>>>   create mode 100644
>>> meta/recipes-core/eglibc/eglibc-2.18/0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch
>>>
>>>
>>> diff --git
>>> a/meta/recipes-core/eglibc/eglibc-2.18/0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch
>>> b/meta/recipes-core/eglibc/eglibc-2.18/0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch
>>>
>>> new file mode 100644
>>> index 0000000..edf10fb
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-core/eglibc/eglibc-2.18/0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch
>>>
>>> @@ -0,0 +1,55 @@
>>> +From b5fe604678ffc7e0d6c2704a73d22f99b24a6d25 Mon Sep 17 00:00:00 2001
>>> +From: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> +Date: Sat, 24 Aug 2013 23:51:06 -0400
>>> +Subject: [PATCH] ptrace: protect ptrace_peeksiginfo_args from
>>> redefintion
>>> +
>>> +linux kernel commit 84c751bd [ptrace: add ability to retrieve
>>> signals without removing from a queue (v4)]
>>> +added ptrace_peeksiginfo_args to the exported kernel user api.
>>> +
>>> +This leads to build errors such as:
>>> +
>>> +| In file included from
>>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:66:0:
>>>
>>> +|
>>> /poky-master/build/tmp/sysroots/qemux86/usr/include/linux/ptrace.h:58:8:
>>> error: redefinition of 'struct ptrace_peeksiginfo_args'
>>> +|  struct ptrace_peeksiginfo_args {
>>> +|         ^
>>> +| In file included from
>>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/defs.h:159:0,
>>>
>>> +|                  from
>>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:37:
>>>
>>> +|
>>> /poky-master/build/tmp/sysroots/qemux86/usr/include/sys/ptrace.h:191:8:
>>> note: originally defined here
>>> +|  struct ptrace_peeksiginfo_args
>>> +|         ^
>>> +| make[2]: *** [process.o] Error 1
>>> +
>>> +In files that include both the eglibc sys/ptrace.h and the linux
>>> kernel exported
>>> +one.
>>> +
>>> +We can avoid this by making the eglibc variant only declare its
>>> structure if PTRACE_PEEKSIGINFO
>>> +has not been defined.
>>> +
>>> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> +---
>>> + libc/sysdeps/unix/sysv/linux/sys/ptrace.h |    2 ++
>>> + 1 file changed, 2 insertions(+)
>>> +
>>> +diff --git a/sysdeps/unix/sysv/linux/sys/ptrace.h
>>> b/sysdeps/unix/sysv/linux/sys/ptrace.h
>>> +index 2b78565..7800d9a 100644
>>> +--- a/sysdeps/unix/sysv/linux/sys/ptrace.h
>>> ++++ b/sysdeps/unix/sysv/linux/sys/ptrace.h
>>> +@@ -187,6 +187,7 @@ enum __ptrace_eventcodes
>>> +   PTRAVE_EVENT_SECCOMP  = 7
>>> + };
>>> +
>>> ++#ifndef PTRACE_PEEKSIGINFO
>>> + /* Arguments for PTRACE_PEEKSIGINFO.  */
>>> + struct ptrace_peeksiginfo_args
>>> + {
>>> +@@ -194,6 +195,7 @@ struct ptrace_peeksiginfo_args
>>> +   __uint32_t flags;   /* Flags for peeksiginfo.  */
>>> +   __int32_t nr;               /* How many siginfos to take.  */
>>> + };
>>> ++#endif
>>> +
>>> + enum __ptrace_peeksiginfo_flags
>>> + {
>>> +--
>>> +1.7.10.4
>>> +
>>> diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb
>>> b/meta/recipes-core/eglibc/eglibc_2.18.bb
>>> index 17b651f..2257c21 100644
>>> --- a/meta/recipes-core/eglibc/eglibc_2.18.bb
>>> +++ b/meta/recipes-core/eglibc/eglibc_2.18.bb
>>> @@ -26,6 +26,7 @@ SRC_URI =
>>> "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr23
>>>              file://tzselect-awk.patch \
>>>
>>> file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
>>>              file://fix-tibetian-locales.patch \
>>> +
>>> file://0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch \
>>>             "
>>>   SRC_URI[md5sum] = "b395b021422a027d89884992e91734fc"
>>>   SRC_URI[sha256sum] =
>>> "15f564b45dc5dd65faf0875579e3447961ae61e876933384ae05d19328539ad4"
>>> --
>>> 1.7.10.4
>>>
>


