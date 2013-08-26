Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 63A966A95B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 04:08:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 25 Aug 2013 21:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,955,1367996400"; d="scan'208";a="386379629"
Received: from unknown (HELO [10.255.14.139]) ([10.255.14.139])
	by fmsmga001.fm.intel.com with ESMTP; 25 Aug 2013 21:08:46 -0700
Message-ID: <521AD4CE.2020907@linux.intel.com>
Date: Sun, 25 Aug 2013 21:08:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <1377487515-26654-1-git-send-email-bruce.ashfield@windriver.com>
	<1377487515-26654-2-git-send-email-bruce.ashfield@windriver.com>
In-Reply-To: <1377487515-26654-2-git-send-email-bruce.ashfield@windriver.com>
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
X-List-Received-Date: Mon, 26 Aug 2013 04:08:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/25/2013 08:25 PM, Bruce Ashfield wrote:
> The addition of ptrace_peeksiginfo_args to the uapi in kernel commit
> 84c751bd [ptrace: add ability to retrieve signals without removing from a queue (v4)]
> means that existing applications using glibc versions that define ptrace_peeksiginfo_args
> in sys/ptrace.h will get duplicate structure definitions like:
>
>      | In file included from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:66:0:
>      | /poky-master/build/tmp/sysroots/qemux86/usr/include/linux/ptrace.h:58:8: error: redefinition of 'struct ptrace_peeksiginfo_args'
>      |  struct ptrace_peeksiginfo_args {
>      |         ^
>      | In file included from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/defs.h:159:0,
>      |                  from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:37:
>      | /poky-master/build/tmp/sysroots/qemux86/usr/include/sys/ptrace.h:191:8: note: originally defined here
>      |  struct ptrace_peeksiginfo_args
>      |         ^
>      | make[2]: *** [process.o] Error 1
>
> Reverting to the previous status of not exporting this structure temporarily
> fixes applications, until they can be adjusted to not mix sys/ptrace.h and
> linux/ptrace.h includes.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   ...1-ptrace.h-remove-ptrace_peeksiginfo_args.patch |   50 ++++++++++++++++++++
>   .../linux-libc-headers/linux-libc-headers_3.10.bb  |    2 +-
>   2 files changed, 51 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch
> new file mode 100644
> index 0000000..da2e117
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch
> @@ -0,0 +1,50 @@
> +From 7dddfb8fec5317ea16154d30e8e18b6559979b60 Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@windriver.com>
> +Date: Sun, 25 Aug 2013 22:51:07 -0400
> +Subject: [PATCH] ptrace.h: remove ptrace_peeksiginfo_args
> +
> +The addition of ptrace_peeksiginfo_args to the uapi in kernel commit
> +84c751bd [ptrace: add ability to retrieve signals without removing from a queue (v4)]
> +means that existing applications using glibc versions that define ptrace_peeksiginfo_args
> +in sys/ptrace.h will get duplicate structure definitions like:
> +
> +    | In file included from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:66:0:
> +    | /poky-master/build/tmp/sysroots/qemux86/usr/include/linux/ptrace.h:58:8: error: redefinition of 'struct ptrace_peeksiginfo_args'
> +    |  struct ptrace_peeksiginfo_args {
> +    |         ^
> +    | In file included from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/defs.h:159:0,
> +    |                  from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:37:
> +    | /poky-master/build/tmp/sysroots/qemux86/usr/include/sys/ptrace.h:191:8: note: originally defined here
> +    |  struct ptrace_peeksiginfo_args
> +    |         ^
> +    | make[2]: *** [process.o] Error 1
> +
> +Reverting to the previous status of not exporting this structure temporarily
> +fixes applications, until they can be adjusted to not mix sys/ptrace.h and
> +linux/ptrace.h includes.
> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Just for the record, it has no Upstream-Status, I know how much you 
dislike upstream status and just how inappropriate this patch is!

I will put this in MUT so we can move forward tonight.

Thanks
	Sau!

> +---
> + include/uapi/linux/ptrace.h |    6 ------
> + 1 file changed, 6 deletions(-)
> +
> +diff --git a/include/uapi/linux/ptrace.h b/include/uapi/linux/ptrace.h
> +index 52ebcc8..524599d 100644
> +--- a/include/uapi/linux/ptrace.h
> ++++ b/include/uapi/linux/ptrace.h
> +@@ -55,12 +55,6 @@
> +
> + #define PTRACE_PEEKSIGINFO	0x4209
> +
> +-struct ptrace_peeksiginfo_args {
> +-	__u64 off;	/* from which siginfo to start */
> +-	__u32 flags;
> +-	__s32 nr;	/* how may siginfos to take */
> +-};
> +-
> + /* Read signals from a shared (process wide) queue */
> + #define PTRACE_PEEKSIGINFO_SHARED	(1 << 0)
> +
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
> index eb04367..b2e6f0f 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
> @@ -1,6 +1,6 @@
>   require linux-libc-headers.inc
>
> -PR = "r0"
> +SRC_URI += "file://0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch"
>
>   SRC_URI[md5sum] = "72d0a9b3e60cd86fabcd3f24b1708944"
>   SRC_URI[sha256sum] = "46c9e55e1fddf40813b8d697d5645037a8e2af5c1a8dff52b3fe82b5021582b8"
>

