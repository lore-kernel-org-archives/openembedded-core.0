Return-Path: <net147@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 603E161013
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 06:40:49 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id bj1so2240376pad.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 23:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=+e2H+ue8kePsTEuEmrDRKYiMM4Tb9cUnRiAQz5dk/cE=;
	b=NV81g8hOFvaQOgQntAB9T95Lcc88ibSdvv8XgypWAsW8oXi4QVLaWxH19u7+NX8Dt2
	niCPvk2q2mDve+zIRR3juHnps4j4EuKhB84jPyRhrCezB53W9P+pQsI5bNG0TfETaHjO
	l8QeWXmRWuV6/6MkOQY2J5GcJc5oyeyqCifXYhfpAuSnbJl84xeXIl0k5rsRNGJAQcgu
	x/KAFzL91r2AsiXkKxDLmoOfS6PPvj0Yec2ZP9kbYo1dBbS87biEAV5D8gPjVOHl8Sx1
	V06oUVK09WxCcRGsLUJtx9e28Ak9NThdmxvq+wpGuPNUGlqUFB+e8pscgzj/U23JnmmY
	WpWA==
X-Received: by 10.68.212.106 with SMTP id nj10mr8626204pbc.74.1377412849531;
	Sat, 24 Aug 2013 23:40:49 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	py4sm10159709pbb.33.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 24 Aug 2013 23:40:48 -0700 (PDT)
Message-ID: <5219A5C3.1010409@gmail.com>
Date: Sun, 25 Aug 2013 16:35:47 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1377405083.git.bruce.ashfield@windriver.com>
	<c2d44f9ff8d416b7f984bc4027de7acecbec0986.1377405083.git.bruce.ashfield@windriver.com>
In-Reply-To: <c2d44f9ff8d416b7f984bc4027de7acecbec0986.1377405083.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sun, 25 Aug 2013 06:40:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 25/08/2013 3:16 PM, Bruce Ashfield wrote:
> linux kernel commit 84c751bd [ptrace: add ability to retrieve signals without removing from a queue (v4)]
> added ptrace_peeksiginfo_args to the exported kernel user api.
>
> This leads to build errors such as:
>
> | In file included from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:66:0:
> | /poky-master/build/tmp/sysroots/qemux86/usr/include/linux/ptrace.h:58:8: error: redefinition of 'struct ptrace_peeksiginfo_args'
> |  struct ptrace_peeksiginfo_args {
> |         ^
> | In file included from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/defs.h:159:0,
> |                  from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:37:
> | /poky-master/build/tmp/sysroots/qemux86/usr/include/sys/ptrace.h:191:8: note: originally defined here
> |  struct ptrace_peeksiginfo_args
> |         ^
> | make[2]: *** [process.o] Error 1
>
> In files that include both the eglibc sys/ptrace.h and the linux kernel exported
> one.
>
> We can avoid this by making the eglibc variant only declare its structure if PTRACE_PEEKSIGINFO
> has not been defined.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   ...ect-ptrace_peeksiginfo_args-from-redefint.patch |   55 ++++++++++++++++++++
>   meta/recipes-core/eglibc/eglibc_2.18.bb            |    1 +
>   2 files changed, 56 insertions(+)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.18/0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch
>
> diff --git a/meta/recipes-core/eglibc/eglibc-2.18/0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch b/meta/recipes-core/eglibc/eglibc-2.18/0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch
> new file mode 100644
> index 0000000..edf10fb
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.18/0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch
> @@ -0,0 +1,55 @@
> +From b5fe604678ffc7e0d6c2704a73d22f99b24a6d25 Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@windriver.com>
> +Date: Sat, 24 Aug 2013 23:51:06 -0400
> +Subject: [PATCH] ptrace: protect ptrace_peeksiginfo_args from redefintion
> +
> +linux kernel commit 84c751bd [ptrace: add ability to retrieve signals without removing from a queue (v4)]
> +added ptrace_peeksiginfo_args to the exported kernel user api.
> +
> +This leads to build errors such as:
> +
> +| In file included from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:66:0:
> +| /poky-master/build/tmp/sysroots/qemux86/usr/include/linux/ptrace.h:58:8: error: redefinition of 'struct ptrace_peeksiginfo_args'
> +|  struct ptrace_peeksiginfo_args {
> +|         ^
> +| In file included from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/defs.h:159:0,
> +|                  from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:37:
> +| /poky-master/build/tmp/sysroots/qemux86/usr/include/sys/ptrace.h:191:8: note: originally defined here
> +|  struct ptrace_peeksiginfo_args
> +|         ^
> +| make[2]: *** [process.o] Error 1
> +
> +In files that include both the eglibc sys/ptrace.h and the linux kernel exported
> +one.
> +
> +We can avoid this by making the eglibc variant only declare its structure if PTRACE_PEEKSIGINFO
> +has not been defined.
Missing Upstream-Status.

Regards,
Jonathan
> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> +---
> + libc/sysdeps/unix/sysv/linux/sys/ptrace.h |    2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/sysdeps/unix/sysv/linux/sys/ptrace.h b/sysdeps/unix/sysv/linux/sys/ptrace.h
> +index 2b78565..7800d9a 100644
> +--- a/sysdeps/unix/sysv/linux/sys/ptrace.h
> ++++ b/sysdeps/unix/sysv/linux/sys/ptrace.h
> +@@ -187,6 +187,7 @@ enum __ptrace_eventcodes
> +   PTRAVE_EVENT_SECCOMP  = 7
> + };
> +
> ++#ifndef PTRACE_PEEKSIGINFO
> + /* Arguments for PTRACE_PEEKSIGINFO.  */
> + struct ptrace_peeksiginfo_args
> + {
> +@@ -194,6 +195,7 @@ struct ptrace_peeksiginfo_args
> +   __uint32_t flags;	/* Flags for peeksiginfo.  */
> +   __int32_t nr;		/* How many siginfos to take.  */
> + };
> ++#endif
> +
> + enum __ptrace_peeksiginfo_flags
> + {
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb b/meta/recipes-core/eglibc/eglibc_2.18.bb
> index 17b651f..2257c21 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.18.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.18.bb
> @@ -26,6 +26,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr23
>              file://tzselect-awk.patch \
>              file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
>              file://fix-tibetian-locales.patch \
> +           file://0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch \
>             "
>   SRC_URI[md5sum] = "b395b021422a027d89884992e91734fc"
>   SRC_URI[sha256sum] = "15f564b45dc5dd65faf0875579e3447961ae61e876933384ae05d19328539ad4"


