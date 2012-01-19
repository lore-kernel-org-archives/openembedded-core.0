Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnyDu-0001yw-Lj
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 21:04:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jan 2012 11:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100530769"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2012 11:56:57 -0800
Message-ID: <4F187589.1010108@linux.intel.com>
Date: Thu, 19 Jan 2012 11:56:57 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326855665-11617-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1326855665-11617-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] e2fsprogs_1.42.bb: Fix build fallout for uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2012 20:04:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2012 07:01 PM, Khem Raj wrote:
> e2fsprogs 1.42 onwards uses fallocate() which uclibc
> does not implement(yet). In most of places its use
> is controlled and it only used when configure detects
> fallocate being present but in this one case it missed
> to check for fallocate being available so here we
> add the check
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../e2fsprogs/e2fsprogs-1.42/fallocate.patch       |   22 ++++++++++++++++++++
>   meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb  |    3 +-
>   2 files changed, 24 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch
> new file mode 100644
> index 0000000..4d952a5
> --- /dev/null
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch
> @@ -0,0 +1,22 @@
> +We assume that fallocate is supported somehow
> +but we need to check if we have fallocate()
> +this problem shows up on uclibc systems since
> +uclibc does not have fallocate() implemented
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +
> +Index: e2fsprogs-1.42/lib/ext2fs/unix_io.c
> +===================================================================
> +--- e2fsprogs-1.42.orig/lib/ext2fs/unix_io.c	2012-01-17 17:24:34.290780625 -0800
> ++++ e2fsprogs-1.42/lib/ext2fs/unix_io.c	2012-01-17 17:25:37.338783680 -0800
> +@@ -895,7 +895,7 @@
> + 		goto unimplemented;
> + #endif
> + 	} else {
> +-#ifdef FALLOC_FL_PUNCH_HOLE
> ++#if defined FALLOC_FL_PUNCH_HOLE&&  defined HAVE_FALLOCATE
> + 		/*
> + 		 * If we are not on block device, try to use punch hole
> + 		 * to reclaim free space.
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
> index 9ff85a2..f6759aa7 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
> @@ -1,8 +1,9 @@
>   require e2fsprogs.inc
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI += "file://quotefix.patch \
> +            file://fallocate.patch \
>               file://acinclude.m4"
>
>   SRC_URI[md5sum] = "a3c4ffd7352310ab5e9412965d575610"

Merged into OE-Core

Thanks
	Sau!


