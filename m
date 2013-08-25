Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 716C56041D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 14:22:30 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id r12so739659lbi.15
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hLETznJqg7Lh04t2uahSCCzEVo0XTAaPjeAwWX3bKbM=;
	b=Z4QvX9wnw1JcC07kTg7UumOrtmrB8A+3NRHUWzaSPG7Owsu/xOgvb+qEGOSMNBtqoS
	2vN7/KsUtdTVQZAx7NPArrz7SOEXoqQyJ9h0DlyJfCEO9/8n7kzD2GNq+GK43ocX4Hg6
	pSnxs29BkbD9b0erkamkfqzXG3b2Jfh/z9I7Hfa5JFm2yaO44VO1eLFW9aQRT7wQINnC
	2v8kAJh4GNqEtc6Y24GfHlZSKRFfSgmAFaRdArtiXQDcswgO7yQ7vgUWPN/SrbAp/1CR
	9ln9JOohCXMVpcraI5DqhjO8WqdCHNU6j1jcIXObhIC1GpsWVgUqNHDFhoELFyLvI4QG
	pH2g==
MIME-Version: 1.0
X-Received: by 10.152.228.130 with SMTP id si2mr68732lac.32.1377440550147;
	Sun, 25 Aug 2013 07:22:30 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Sun, 25 Aug 2013 07:22:30 -0700 (PDT)
In-Reply-To: <5219A5C3.1010409@gmail.com>
References: <cover.1377405083.git.bruce.ashfield@windriver.com>
	<c2d44f9ff8d416b7f984bc4027de7acecbec0986.1377405083.git.bruce.ashfield@windriver.com>
	<5219A5C3.1010409@gmail.com>
Date: Sun, 25 Aug 2013 10:22:30 -0400
Message-ID: <CADkTA4MbqNVM0z56CkV5VTMqgTBDqYd=Kzu6wwzRQN5EQDvvOg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jonathan Liu <net147@gmail.com>
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
X-List-Received-Date: Sun, 25 Aug 2013 14:22:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Aug 25, 2013 at 2:35 AM, Jonathan Liu <net147@gmail.com> wrote:
> On 25/08/2013 3:16 PM, Bruce Ashfield wrote:
>>
>> linux kernel commit 84c751bd [ptrace: add ability to retrieve signals
>> without removing from a queue (v4)]
>> added ptrace_peeksiginfo_args to the exported kernel user api.
>>
>> This leads to build errors such as:
>>
>> | In file included from
>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:66:0:
>> | /poky-master/build/tmp/sysroots/qemux86/usr/include/linux/ptrace.h:58:8:
>> error: redefinition of 'struct ptrace_peeksiginfo_args'
>> |  struct ptrace_peeksiginfo_args {
>> |         ^
>> | In file included from
>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/defs.h:159:0,
>> |                  from
>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:37:
>> | /poky-master/build/tmp/sysroots/qemux86/usr/include/sys/ptrace.h:191:8:
>> note: originally defined here
>> |  struct ptrace_peeksiginfo_args
>> |         ^
>> | make[2]: *** [process.o] Error 1
>>
>> In files that include both the eglibc sys/ptrace.h and the linux kernel
>> exported
>> one.
>>
>> We can avoid this by making the eglibc variant only declare its structure
>> if PTRACE_PEEKSIGINFO
>> has not been defined.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   ...ect-ptrace_peeksiginfo_args-from-redefint.patch |   55
>> ++++++++++++++++++++
>>   meta/recipes-core/eglibc/eglibc_2.18.bb            |    1 +
>>   2 files changed, 56 insertions(+)
>>   create mode 100644
>> meta/recipes-core/eglibc/eglibc-2.18/0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch
>>
>> diff --git
>> a/meta/recipes-core/eglibc/eglibc-2.18/0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch
>> b/meta/recipes-core/eglibc/eglibc-2.18/0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch
>> new file mode 100644
>> index 0000000..edf10fb
>> --- /dev/null
>> +++
>> b/meta/recipes-core/eglibc/eglibc-2.18/0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch
>> @@ -0,0 +1,55 @@
>> +From b5fe604678ffc7e0d6c2704a73d22f99b24a6d25 Mon Sep 17 00:00:00 2001
>> +From: Bruce Ashfield <bruce.ashfield@windriver.com>
>> +Date: Sat, 24 Aug 2013 23:51:06 -0400
>> +Subject: [PATCH] ptrace: protect ptrace_peeksiginfo_args from redefintion
>> +
>> +linux kernel commit 84c751bd [ptrace: add ability to retrieve signals
>> without removing from a queue (v4)]
>> +added ptrace_peeksiginfo_args to the exported kernel user api.
>> +
>> +This leads to build errors such as:
>> +
>> +| In file included from
>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:66:0:
>> +|
>> /poky-master/build/tmp/sysroots/qemux86/usr/include/linux/ptrace.h:58:8:
>> error: redefinition of 'struct ptrace_peeksiginfo_args'
>> +|  struct ptrace_peeksiginfo_args {
>> +|         ^
>> +| In file included from
>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/defs.h:159:0,
>> +|                  from
>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:37:
>> +| /poky-master/build/tmp/sysroots/qemux86/usr/include/sys/ptrace.h:191:8:
>> note: originally defined here
>> +|  struct ptrace_peeksiginfo_args
>> +|         ^
>> +| make[2]: *** [process.o] Error 1
>> +
>> +In files that include both the eglibc sys/ptrace.h and the linux kernel
>> exported
>> +one.
>> +
>> +We can avoid this by making the eglibc variant only declare its structure
>> if PTRACE_PEEKSIGINFO
>> +has not been defined.
>
> Missing Upstream-Status.

Thanks for the double check, but I'm not the one to tag this with an upstream
status. My opinion on the applicability of this to eglibc is largely irrelevant.

Cheers,

Bruce

>
> Regards,
> Jonathan
>
>> +
>> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> +---
>> + libc/sysdeps/unix/sysv/linux/sys/ptrace.h |    2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/sysdeps/unix/sysv/linux/sys/ptrace.h
>> b/sysdeps/unix/sysv/linux/sys/ptrace.h
>> +index 2b78565..7800d9a 100644
>> +--- a/sysdeps/unix/sysv/linux/sys/ptrace.h
>> ++++ b/sysdeps/unix/sysv/linux/sys/ptrace.h
>> +@@ -187,6 +187,7 @@ enum __ptrace_eventcodes
>> +   PTRAVE_EVENT_SECCOMP  = 7
>> + };
>> +
>> ++#ifndef PTRACE_PEEKSIGINFO
>> + /* Arguments for PTRACE_PEEKSIGINFO.  */
>> + struct ptrace_peeksiginfo_args
>> + {
>> +@@ -194,6 +195,7 @@ struct ptrace_peeksiginfo_args
>> +   __uint32_t flags;   /* Flags for peeksiginfo.  */
>> +   __int32_t nr;               /* How many siginfos to take.  */
>> + };
>> ++#endif
>> +
>> + enum __ptrace_peeksiginfo_flags
>> + {
>> +--
>> +1.7.10.4
>> +
>> diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb
>> b/meta/recipes-core/eglibc/eglibc_2.18.bb
>> index 17b651f..2257c21 100644
>> --- a/meta/recipes-core/eglibc/eglibc_2.18.bb
>> +++ b/meta/recipes-core/eglibc/eglibc_2.18.bb
>> @@ -26,6 +26,7 @@ SRC_URI =
>> "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr23
>>              file://tzselect-awk.patch \
>>
>> file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
>>              file://fix-tibetian-locales.patch \
>> +
>> file://0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch \
>>             "
>>   SRC_URI[md5sum] = "b395b021422a027d89884992e91734fc"
>>   SRC_URI[sha256sum] =
>> "15f564b45dc5dd65faf0875579e3447961ae61e876933384ae05d19328539ad4"
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

