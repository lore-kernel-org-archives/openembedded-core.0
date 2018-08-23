Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F20DC793F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 20:48:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7NKm12o026567
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 13:48:02 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 23 Aug 2018 13:48:00 -0700
To: <openembedded-core@lists.openembedded.org>, "Jia, Hongxu"
	<Hongxu.Jia@windriver.com>
References: <1534929402-6673-1-git-send-email-hongxu.jia@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <6159825d-e050-fdd1-7d5a-5e6a6a59282f@windriver.com>
Date: Thu, 23 Aug 2018 16:47:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1534929402-6673-1-git-send-email-hongxu.jia@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH] mtools: fix race issue while mtools invoked frequently
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
X-List-Received-Date: Thu, 23 Aug 2018 20:48:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 08/22/2018 05:16 AM, Hongxu Jia wrote:
> While invoking mtools frequently, the unblocking request

s/unblocking/non-blocking/

I would read 'unblocking' as a request that results in the
system becoming unblocked whereas non-blocking is more
commonly used and refers to function calls that will
not result in calling blocking system calls.

Indeed the NB in LOCK_NB stand for non-blocking.

> caused race issue. Here is an example of syslinux
> [snip]
> dd if=/dev/zero of=floppy.img bs=1024 count=144
> losetup /dev/loop1 floppy.img
> mkdosfs /dev/loop1
> syslinux -i /dev/loop1
> |plain floppy: device "/proc/6351/fd/3" busy (Resource temporarily unavailable):
> |Cannot initialize 'S:'
> |Bad target s:/ldlinux.sys
> [snip]
> 
> The idea is from:
> https://bugzilla.redhat.com/show_bug.cgi?id=1235016
> https://groups.google.com/a/chromium.org/forum/#!msg/chromium-os-dev/bRPUCFHoBTQ/ZjB8kjjx1vUJ

I read though most of that and it seems that people think
that this may be a work-around. What do you think?

If I were used to using mtools and it never blocked,
the I'd certainly be upset that we patched it to block.
lockdev.h gets used by:

$ grep -r "lockdev.h" mtools-4.0.18/
mtools-4.0.18/plain_io.c:#include "lockdev.h"
mtools-4.0.18/floppyd.c:#include "lockdev.h"

so until you can explain what the root cause of the
problem is more clearly, and why this change won't cause
problems for users of mtools, I think you should continue
to work on this problem.

Or maybe the commit just needs a more details technical
explanation that summarizes the long thread that you linked
to...

../Randy


> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...01-remove-LOCK_NB-to-use-blocking-request.patch | 44 ++++++++++++++++++++++
>   meta/recipes-devtools/mtools/mtools_4.0.18.bb      |  1 +
>   2 files changed, 45 insertions(+)
>   create mode 100644 meta/recipes-devtools/mtools/mtools/0001-remove-LOCK_NB-to-use-blocking-request.patch
> 
> diff --git a/meta/recipes-devtools/mtools/mtools/0001-remove-LOCK_NB-to-use-blocking-request.patch b/meta/recipes-devtools/mtools/mtools/0001-remove-LOCK_NB-to-use-blocking-request.patch
> new file mode 100644
> index 0000000..47385a5
> --- /dev/null
> +++ b/meta/recipes-devtools/mtools/mtools/0001-remove-LOCK_NB-to-use-blocking-request.patch
> @@ -0,0 +1,44 @@
> +From 5bdbfe0a63fed48104b17412854b26ee2275869a Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 22 Aug 2018 16:54:39 +0800
> +Subject: [PATCH] remove LOCK_NB to use blocking request
> +
> +While invoking mtools frequently, the unblocking request
> +caused race issue. Here is an example of syslinux
> +[snip]
> +dd if=/dev/zero of=floppy.img bs=1024 count=144
> +losetup /dev/loop1 floppy.img
> +mkdosfs /dev/loop1
> +syslinux -i /dev/loop1
> +|plain floppy: device "/proc/6351/fd/3" busy (Resource temporarily unavailable):
> +|Cannot initialize 'S:'
> +|Bad target s:/ldlinux.sys
> +[snip]
> +
> +The idea is from:
> +https://bugzilla.redhat.com/show_bug.cgi?id=1235016
> +https://groups.google.com/a/chromium.org/forum/#!msg/chromium-os-dev/bRPUCFHoBTQ/ZjB8kjjx1vUJ
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + lockdev.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lockdev.h b/lockdev.h
> +index 4467bc2..5a135ad 100644
> +--- a/lockdev.h
> ++++ b/lockdev.h
> +@@ -43,7 +43,7 @@ int lock_dev(int fd, int mode, struct device *dev)
> + 		return 0;
> +
> + #if (defined(HAVE_FLOCK) && defined (LOCK_EX) && defined(LOCK_NB))
> +-	if (flock(fd, (mode ? LOCK_EX : LOCK_SH)|LOCK_NB) < 0)
> ++	if (flock(fd, (mode ? LOCK_EX : LOCK_SH)) < 0)

> + #else /* FLOCK */
> +
> + #if (defined(HAVE_LOCKF) && defined(F_TLOCK))
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
> index dcd32ed..91f7b7c 100644
> --- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
> +++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
> @@ -31,6 +31,7 @@ SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
>              file://mtools-makeinfo.patch \
>              file://no-x11.gplv3.patch \
>              file://0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch \
> +           file://0001-remove-LOCK_NB-to-use-blocking-request.patch \
>              "
>   
>   SRC_URI_append_class-native = " file://disable-hardcoded-configs.patch"
> 


-- 
# Randy MacLeod
# Wind River Linux

