Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 2B2A87E993
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 09:51:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Sep 2019 02:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,484,1559545200"; d="scan'208";a="359437828"
Received: from fwan32-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.252.38.244])
	by orsmga005.jf.intel.com with ESMTP; 09 Sep 2019 02:51:39 -0700
To: openembedded-core@lists.openembedded.org
References: <20190908232331.2295-1-raj.khem@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <79b2c2ab-df72-fdcf-d859-d2cdde905ef7@intel.com>
Date: Mon, 9 Sep 2019 10:51:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190908232331.2295-1-raj.khem@gmail.com>
Subject: Re: [PATCH] elfutils: Fix build on ppc/musl
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
X-List-Received-Date: Mon, 09 Sep 2019 09:51:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

There's a 0.177 upgrade on the list (and in mut), is this required for 
that too?

Ross

On 09/09/2019 00:23, Khem Raj wrote:
> musl relies on the pt_regs definitions from kernel ptrace headers
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../elfutils/elfutils_0.176.bb                |  1 +
>   ...cliude-asm-ptrace.h-for-pt_regs-defi.patch | 32 +++++++++++++++++++
>   2 files changed, 33 insertions(+)
>   create mode 100644 meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> index d98457e3f9..fe810282bc 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> @@ -29,6 +29,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
>              file://debian/disable_werror.patch \
>              file://debian/testsuite-ignore-elflint.diff \
>              file://0001-skip-the-test-when-gcc-not-deployed.patch \
> +           file://0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch \
>              file://run-ptest \
>              file://ptest.patch \
>              "
> diff --git a/meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch b/meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch
> new file mode 100644
> index 0000000000..3303333c45
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch
> @@ -0,0 +1,32 @@
> +From 2e2232d0935bf8ef6e66ebffba3be68a73b5b3e5 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 8 Sep 2019 15:57:59 -0700
> +Subject: [PATCH] ppc_initreg.c: Incliude asm/ptrace.h for pt_regs definition
> +
> +Fixes
> +| ../../elfutils-0.176/backends/ppc_initreg.c:79:22: error: field 'r' has incomplete type
> +|       struct pt_regs r;
> +|                      ^
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + backends/ppc_initreg.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/backends/ppc_initreg.c b/backends/ppc_initreg.c
> +index 0e0d359..e5cca7e 100644
> +--- a/backends/ppc_initreg.c
> ++++ b/backends/ppc_initreg.c
> +@@ -33,6 +33,7 @@
> + #include <stdlib.h>
> + #if defined(__powerpc__) && defined(__linux__)
> + # include <sys/ptrace.h>
> ++# include <asm/ptrace.h>
> + # include <sys/user.h>
> + #endif
> +
> +--
> +2.23.0
> +
> 



