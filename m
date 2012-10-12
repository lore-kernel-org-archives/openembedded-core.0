Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1TMlo1-00044n-8a
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 22:26:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9CKChIM025786
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Oct 2012 13:12:43 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 12 Oct 2012 13:12:43 -0700
Message-ID: <507879AA.3010403@windriver.com>
Date: Fri, 12 Oct 2012 16:12:26 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: <tom.zanussi@intel.com>
References: <cover.1350070372.git.tom.zanussi@intel.com>
	<1d0dc88e1635cfc24612a3e97d0391facdc2c65f.1350070372.git.tom.zanussi@intel.com>
In-Reply-To: <1d0dc88e1635cfc24612a3e97d0391facdc2c65f.1350070372.git.tom.zanussi@intel.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] lttng-modules: update SRCREV and remove is_compat_task patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2012 20:26:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-10-12 03:52 PM, tom.zanussi@intel.com wrote:
> From: Tom Zanussi<tom.zanussi@intel.com>
>
> The existing SRCREV doesn't point to v2.0.5 as the recipe version
> suggests, and is actually building modules that won't work with the
> lttng-tools it's supposed to be matching.
>
> Also, remove the is_compat_task patch for lttng-syscalls.c to avoid
> do_patch errors, as recent versions of lttng-modules have added this
> check.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Tom Zanussi<tom.zanussi@intel.com>
> ---
>   ...ls-protect-is_compat_task-from-redefiniti.patch | 41 ----------------------
>   .../lttng-2.0/lttng-modules_2.0.5.bb               |  9 +++--
>   2 files changed, 4 insertions(+), 46 deletions(-)
>   delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
>
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch b/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
> deleted file mode 100644
> index 0056633..0000000
> --- a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 415a1a678cb2fcf603f9777f2c7b71c1e38f8101 Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield<bruce.ashfield@windriver.com>
> -Date: Mon, 19 Mar 2012 13:30:31 -0400
> -Subject: [PATCH] lttng-sycalls: protect is_compat_task from redefinition
> -
> -recent -stable kernels have their own fallback definition of is_compat_task
> -
> -   #define is_compat_task() (0)
> -
> -To protect against this double definition of is_compat_task we can check
> -to see if it is already defined, and skip the lttng variant.
> -
> -Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
> ----
> - lttng-syscalls.c |    4 ++++
> - 1 files changed, 4 insertions(+), 0 deletions(-)
> -
> -diff --git a/lttng-syscalls.c b/lttng-syscalls.c
> -index 9de3c07..80d0f05 100644
> ---- a/lttng-syscalls.c
> -+++ b/lttng-syscalls.c
> -@@ -17,12 +17,16 @@
> - #include "ltt-events.h"
> -
> - #ifndef CONFIG_COMPAT
> -+
> -+#ifndef is_compat_task
> - static inline int is_compat_task(void)
> - {
> - 	return 0;
> - }
> - #endif
> -
> -+#endif
> -+
> - static
> - void syscall_entry_probe(void *__data, struct pt_regs *regs, long id);
> -
> ---
> -1.7.5.4
> -
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
> index 4c78f36..96ab85f 100644
> --- a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
> @@ -10,13 +10,12 @@ DEPENDS = "virtual/kernel"
>
>   inherit module
>
> -SRCREV = "4d3e89e379fc66480d729abe8daa5c86eb585400"
> -PV = "2.0.pre11+git${SRCREV}"
> -PR = "r0"
> +SRCREV = "cbb0f0f5203e9901084f38792e484f6fa988e10a"
> +PV = "2.0.5+git${SRCREV}"
> +PR = "r1"
>
>   SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
> -           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
> -           file://lttng-sycalls-protect-is_compat_task-from-redefiniti.patch"
> +           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
>
>   export INSTALL_MOD_DIR="kernel/lttng-modules"
>   export KERNEL_SRC="${STAGING_KERNEL_DIR}"



