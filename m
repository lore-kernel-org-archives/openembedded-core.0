Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id B0A536A95B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 00:47:28 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id aq17so4118823iec.27
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 17:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Mt3mstBQjVaOT4mflO32VjNd20EY9xuJbvN5vD763ag=;
	b=Jr3YDpzcSwMwc5VbZR02meFd90tFlWp8j+DrRYqLrvSkWHpWckkWWkxpxlAelsgPyy
	8t0YJHPTQWNbmwegOvHUbj1e8BH2Q833/oU0KstOswbVwOzZ3/eQ0SltatwZXsOzsaEx
	4RWhrMOBtKoVtuAg3bHWsQix1GaK1uVchndIs5s5FZ6bzJYjZORQs34Zhpo9G+IL/rVQ
	hAnRoqn26+MHKQmnFagO1WQ6uIJPGRZcfCR4xRj9jQHJ4Dlrf5qwHvQWyS6qVVCXDxNF
	HRlxjCKhOgZ1FsdUFKOrhaNE3N1fTvQMFtwCvwi2ZRMH7gTl0dY9d46RCdj7kE4xRCLp
	KPIg==
X-Received: by 10.50.118.105 with SMTP id kl9mr5007593igb.3.1377478049299;
	Sun, 25 Aug 2013 17:47:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Sun, 25 Aug 2013 17:46:59 -0700 (PDT)
In-Reply-To: <c2d44f9ff8d416b7f984bc4027de7acecbec0986.1377405083.git.bruce.ashfield@windriver.com>
References: <cover.1377405083.git.bruce.ashfield@windriver.com>
	<c2d44f9ff8d416b7f984bc4027de7acecbec0986.1377405083.git.bruce.ashfield@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Aug 2013 17:46:59 -0700
Message-ID: <CAMKF1sr+z-f7KW6BqMLbs0RuFu4fhz_crhBVM_++nOqVb=OtnQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
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
X-List-Received-Date: Mon, 26 Aug 2013 00:47:29 -0000
Content-Type: text/plain; charset=UTF-8

Hi Bruce

On Sat, Aug 24, 2013 at 10:16 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
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

The problem is there however we need not fix it in eglibc thats wrong
place to fix it. The right place to fix it is affected application
which seems so mix glibc and kernel interfaces. It should try to not
mix kernel and glibc interfaces. This patch as such is not
appropriate.


>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  ...ect-ptrace_peeksiginfo_args-from-redefint.patch |   55 ++++++++++++++++++++
>  meta/recipes-core/eglibc/eglibc_2.18.bb            |    1 +
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.18/0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch
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
> +   __uint32_t flags;   /* Flags for peeksiginfo.  */
> +   __int32_t nr;               /* How many siginfos to take.  */
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
>             file://tzselect-awk.patch \
>             file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
>             file://fix-tibetian-locales.patch \
> +           file://0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch \
>            "
>  SRC_URI[md5sum] = "b395b021422a027d89884992e91734fc"
>  SRC_URI[sha256sum] = "15f564b45dc5dd65faf0875579e3447961ae61e876933384ae05d19328539ad4"
> --
> 1.7.10.4
>

