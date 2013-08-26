Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57A0E6B4BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 04:26:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7Q4QXLA025423
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Aug 2013 21:26:34 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.21.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 25 Aug 2013 21:26:33 -0700
Message-ID: <521AD8F8.10807@windriver.com>
Date: Mon, 26 Aug 2013 00:26:32 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1377487515-26654-1-git-send-email-bruce.ashfield@windriver.com>
	<1377487515-26654-2-git-send-email-bruce.ashfield@windriver.com>
	<521AD4CE.2020907@linux.intel.com>
In-Reply-To: <521AD4CE.2020907@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-libc-headers: ptrace.h: remove ptrace_peeksiginfo_args
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
X-List-Received-Date: Mon, 26 Aug 2013 04:26:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-26 12:08 AM, Saul Wold wrote:
> On 08/25/2013 08:25 PM, Bruce Ashfield wrote:
>> The addition of ptrace_peeksiginfo_args to the uapi in kernel commit
>> 84c751bd [ptrace: add ability to retrieve signals without removing
>> from a queue (v4)]
>> means that existing applications using glibc versions that define
>> ptrace_peeksiginfo_args
>> in sys/ptrace.h will get duplicate structure definitions like:
>>
>>      | In file included from
>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:66:0:
>>
>>      |
>> /poky-master/build/tmp/sysroots/qemux86/usr/include/linux/ptrace.h:58:8:
>> error: redefinition of 'struct ptrace_peeksiginfo_args'
>>      |  struct ptrace_peeksiginfo_args {
>>      |         ^
>>      | In file included from
>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/defs.h:159:0,
>>
>>      |                  from
>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:37:
>>
>>      |
>> /poky-master/build/tmp/sysroots/qemux86/usr/include/sys/ptrace.h:191:8: note:
>> originally defined here
>>      |  struct ptrace_peeksiginfo_args
>>      |         ^
>>      | make[2]: *** [process.o] Error 1
>>
>> Reverting to the previous status of not exporting this structure
>> temporarily
>> fixes applications, until they can be adjusted to not mix sys/ptrace.h
>> and
>> linux/ptrace.h includes.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   ...1-ptrace.h-remove-ptrace_peeksiginfo_args.patch |   50
>> ++++++++++++++++++++
>>   .../linux-libc-headers/linux-libc-headers_3.10.bb  |    2 +-
>>   2 files changed, 51 insertions(+), 1 deletion(-)
>>   create mode 100644
>> meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch
>>
>>
>> diff --git
>> a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch
>> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch
>>
>> new file mode 100644
>> index 0000000..da2e117
>> --- /dev/null
>> +++
>> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch
>>
>> @@ -0,0 +1,50 @@
>> +From 7dddfb8fec5317ea16154d30e8e18b6559979b60 Mon Sep 17 00:00:00 2001
>> +From: Bruce Ashfield <bruce.ashfield@windriver.com>
>> +Date: Sun, 25 Aug 2013 22:51:07 -0400
>> +Subject: [PATCH] ptrace.h: remove ptrace_peeksiginfo_args
>> +
>> +The addition of ptrace_peeksiginfo_args to the uapi in kernel commit
>> +84c751bd [ptrace: add ability to retrieve signals without removing
>> from a queue (v4)]
>> +means that existing applications using glibc versions that define
>> ptrace_peeksiginfo_args
>> +in sys/ptrace.h will get duplicate structure definitions like:
>> +
>> +    | In file included from
>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:66:0:
>>
>> +    |
>> /poky-master/build/tmp/sysroots/qemux86/usr/include/linux/ptrace.h:58:8:
>> error: redefinition of 'struct ptrace_peeksiginfo_args'
>> +    |  struct ptrace_peeksiginfo_args {
>> +    |         ^
>> +    | In file included from
>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/defs.h:159:0,
>>
>> +    |                  from
>> /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:37:
>>
>> +    |
>> /poky-master/build/tmp/sysroots/qemux86/usr/include/sys/ptrace.h:191:8: note:
>> originally defined here
>> +    |  struct ptrace_peeksiginfo_args
>> +    |         ^
>> +    | make[2]: *** [process.o] Error 1
>> +
>> +Reverting to the previous status of not exporting this structure
>> temporarily
>> +fixes applications, until they can be adjusted to not mix
>> sys/ptrace.h and
>> +linux/ptrace.h includes.
>> +
>> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>
> Just for the record, it has no Upstream-Status, I know how much you
> dislike upstream status and just how inappropriate this patch is!

Thanks! And honestly, I didn't leave out the upstream status on purpose
this time .. like I said, it just isn't in my workflow, since I normally
seek and destroy them!

I'm pretty sure I can't convince the kernel guys to not export that
structure, but I can try. Otherwise, it can have the "dirty hack" upstream
status.

>
> I will put this in MUT so we can move forward tonight.

Fingers crossed, my builds are working here.

Bruce

>
> Thanks
>      Sau!
>
>> +---
>> + include/uapi/linux/ptrace.h |    6 ------
>> + 1 file changed, 6 deletions(-)
>> +
>> +diff --git a/include/uapi/linux/ptrace.h b/include/uapi/linux/ptrace.h
>> +index 52ebcc8..524599d 100644
>> +--- a/include/uapi/linux/ptrace.h
>> ++++ b/include/uapi/linux/ptrace.h
>> +@@ -55,12 +55,6 @@
>> +
>> + #define PTRACE_PEEKSIGINFO    0x4209
>> +
>> +-struct ptrace_peeksiginfo_args {
>> +-    __u64 off;    /* from which siginfo to start */
>> +-    __u32 flags;
>> +-    __s32 nr;    /* how may siginfos to take */
>> +-};
>> +-
>> + /* Read signals from a shared (process wide) queue */
>> + #define PTRACE_PEEKSIGINFO_SHARED    (1 << 0)
>> +
>> +--
>> +1.7.10.4
>> +
>> diff --git
>> a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
>> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
>> index eb04367..b2e6f0f 100644
>> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
>> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
>> @@ -1,6 +1,6 @@
>>   require linux-libc-headers.inc
>>
>> -PR = "r0"
>> +SRC_URI += "file://0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch"
>>
>>   SRC_URI[md5sum] = "72d0a9b3e60cd86fabcd3f24b1708944"
>>   SRC_URI[sha256sum] =
>> "46c9e55e1fddf40813b8d697d5645037a8e2af5c1a8dff52b3fe82b5021582b8"
>>


