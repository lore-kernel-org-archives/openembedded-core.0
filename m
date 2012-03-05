Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4fp3-0006ph-7H
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 22:52:01 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Mar 2012 13:43:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="114800810"
Received: from unknown (HELO [10.255.15.110]) ([10.255.15.110])
	by orsmga001.jf.intel.com with ESMTP; 05 Mar 2012 13:43:23 -0800
Message-ID: <4F55337A.8050104@linux.intel.com>
Date: Mon, 05 Mar 2012 13:43:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330588500-25258-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1330588500-25258-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] util-linux: Fix build when NLS is disabled
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
X-List-Received-Date: Mon, 05 Mar 2012 21:52:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/29/2012 11:55 PM, Khem Raj wrote:
> AC_CHECK_DECLS generated defines should be
> checked with #if not #ifdef
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../fix_NL_TIME_FIRST_WEEKDAY.patch                |   24 ++++++++++++++++++++
>   meta/recipes-core/util-linux/util-linux_2.21.bb    |    5 ++-
>   2 files changed, 27 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-core/util-linux/util-linux-2.21/fix_NL_TIME_FIRST_WEEKDAY.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux-2.21/fix_NL_TIME_FIRST_WEEKDAY.patch b/meta/recipes-core/util-linux/util-linux-2.21/fix_NL_TIME_FIRST_WEEKDAY.patch
> new file mode 100644
> index 0000000..545c3a9
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux-2.21/fix_NL_TIME_FIRST_WEEKDAY.patch
> @@ -0,0 +1,24 @@
> +configure uses AC_CHECK_DECLS to check for _NL_TIME_WEEK_1STDAY
> +which means we will get HAVE_DECL__NL_TIME_WEEK_1STDAY
> +defined to 1 if symbol is declared, otherwise to 0 in config.h
> +
> +Therefore we cannot rely on conditionals which check for it
> +being defined or not since it always will be defined so correct
> +thing is to use #if instead of #ifdef
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +Index: util-linux-2.21/misc-utils/cal.c
> +===================================================================
> +--- util-linux-2.21.orig/misc-utils/cal.c	2012-02-29 23:41:54.413347665 -0800
> ++++ util-linux-2.21/misc-utils/cal.c	2012-02-29 23:42:44.573350057 -0800
> +@@ -297,7 +297,7 @@
> +  * the locale database, which can be overridden with the
> +  * -s (Sunday) or -m (Monday) options.
> +  */
> +-#ifdef HAVE_DECL__NL_TIME_WEEK_1STDAY
> ++#if HAVE_DECL__NL_TIME_WEEK_1STDAY
> + 	/*
> + 	 * You need to use 2 locale variables to get the first day of the week.
> + 	 * This is needed to support first_weekday=2 and first_workday=1 for
> diff --git a/meta/recipes-core/util-linux/util-linux_2.21.bb b/meta/recipes-core/util-linux/util-linux_2.21.bb
> index aa6ac64..8234ecb 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.21.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.21.bb
> @@ -1,5 +1,5 @@
>   MAJOR_VERSION = "2.21"
> -PR = "r0"
> +PR = "r1"
>   require util-linux.inc
>
>   # note that `lscpu' is under GPLv3+
> @@ -7,7 +7,8 @@ LICENSE_util-linux-lscpu = "GPLv3+"
>
>   SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
>               file://util-linux-ng-2.16-mount_lock_path.patch \
> -            file://uclibc-__progname-conflict.patch \
> +            file://uclibc-__progname-conflict.patch \
> +            file://fix_NL_TIME_FIRST_WEEKDAY.patch \
>   "
>
>   SRC_URI[md5sum] = "3c7a26963f3921c1e775a80330321870"

Merged into OE-core

Thanks
	Sau!


