Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UANUd-0007aL-Fd
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 17:35:11 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Feb 2013 08:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,742,1355126400"; d="scan'208";a="267911522"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.55])
	by orsmga001.jf.intel.com with ESMTP; 26 Feb 2013 08:18:25 -0800
Message-ID: <512CE051.2090900@linux.intel.com>
Date: Tue, 26 Feb 2013 08:18:25 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1361857721.git.liezhi.yang@windriver.com>
	<a5db423d88f92e3ff5ed58bf35c7561b80aec82e.1361857721.git.liezhi.yang@windriver.com>
In-Reply-To: <a5db423d88f92e3ff5ed58bf35c7561b80aec82e.1361857721.git.liezhi.yang@windriver.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] lttng-ust: cannot find -llttng-ust-tracepoint
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
X-List-Received-Date: Tue, 26 Feb 2013 16:35:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Pulling in Tom as I don't have any experience with lttng.

On 02/26/2013 01:24 AM, Robert Yang wrote:
> liblttng_ust.la should depend on liblttng-ust-tracepoint.la, otherwise
> there maybe a parallel build issue when building liblttng_ust.la:
> 
> ld: cannot find -llttng-ust-tracepoint
> 
> [YOCTO #3934]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../lttng-ust/depends-liblttng-ust-tracepoin.patch | 30 ++++++++++++++++++++++
>  meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb       |  4 ++-
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-ust/depends-liblttng-ust-tracepoin.patch
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-ust/depends-liblttng-ust-tracepoin.patch b/meta/recipes-kernel/lttng/lttng-ust/depends-liblttng-ust-tracepoin.patch
> new file mode 100644
> index 0000000..458a8d4
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-ust/depends-liblttng-ust-tracepoin.patch
> @@ -0,0 +1,30 @@
> +liblttng_ust.la should depend on liblttng-ust-tracepoint.la
> +
> +liblttng_ust.la should depend on liblttng-ust-tracepoint.la, otherwise
> +there maybe a parallel build issue:
> +
> +ld: cannot find -llttng-ust-tracepoint
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + liblttng-ust/Makefile.am | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/liblttng-ust/Makefile.am b/liblttng-ust/Makefile.am
> +--- a/liblttng-ust/Makefile.am
> ++++ b/liblttng-ust/Makefile.am
> +@@ -67,7 +67,8 @@ liblttng_ust_la_LIBADD = \
> + 	-llttng-ust-tracepoint \
> + 	$(top_builddir)/snprintf/libustsnprintf.la \
> + 	$(top_builddir)/liblttng-ust-comm/liblttng-ust-comm.la \
> +-	liblttng-ust-runtime.la liblttng-ust-support.la
> ++	liblttng-ust-runtime.la liblttng-ust-support.la \
> ++	liblttng-ust-tracepoint.la
> + 
> + if LTTNG_UST_BUILD_WITH_LIBUUID
> + liblttng_ust_la_LIBADD += -luuid
> +-- 
> +1.7.11.2
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb
> index 20c8b3d..6c2ca04 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb
> @@ -22,7 +22,9 @@ PV = "2.1.0"
>  PR = "r0"
>  PE = "2"
>  
> -SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git"
> +SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git \
> +	   file://depends-liblttng-ust-tracepoin.patch \
> +	   "
>  
>  S = "${WORKDIR}/git"
>  
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


