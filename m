Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlSsz-00057G-0P
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 23:12:41 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jan 2012 14:04:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="95883879"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by orsmga001.jf.intel.com with ESMTP; 12 Jan 2012 14:04:57 -0800
Message-ID: <4F0F5909.4080907@linux.intel.com>
Date: Thu, 12 Jan 2012 14:04:57 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326337436.git.zumeng.chen@windriver.com>
	<6466944f4fff355f13da46c47fc22a907f6eda60.1326337436.git.zumeng.chen@windriver.com>
In-Reply-To: <6466944f4fff355f13da46c47fc22a907f6eda60.1326337436.git.zumeng.chen@windriver.com>
Subject: Re: [PATCH 2/4] lttng-tools: Integrated from git repo.
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
X-List-Received-Date: Thu, 12 Jan 2012 22:12:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2012 07:11 PM, Zumeng Chen wrote:
> This patch intended to integrate the Linux trace toolkit, which
> is a suite of tools designed to extract program execution details
> from the Linux operating system and interpret them.
>
> lttng-tools 2.0 is currently in pre-release(-pre16), so we have to
> update it when official released.
>
> Signed-off-by: Zumeng Chen<zumeng.chen@windriver.com>
> ---
>   ...tools-fix-compiling-error-for-powerpc-arm.patch |   28 ++++++++++++++++++
>   .../lttng-2.0/lttng-tools_2.0-pre16.bb             |   30 ++++++++++++++++++++
>   2 files changed, 58 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
>
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-powerpc-arm.patch b/meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
> new file mode 100644
> index 0000000..f8e144f
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
> @@ -0,0 +1,28 @@
> +From 5d8d75ab0c7f9e0009d90a2e5ad6475034a5c859 Mon Sep 17 00:00:00 2001
> +From: Zumeng Chen<zumeng.chen@windriver.com>
> +Date: Tue, 10 Jan 2012 12:41:45 +0800
> +Subject: [PATCH 1/1] Fix compiling error on powerpc and arm
> +

No Upstream-Status:


> +For powerpc and arm, some MAP_ are defined asm/mman.h,
> +so including it in header.
> +
> +Signed-off-by: Zumeng Chen<zumeng.chen@windriver.com>
> +---
> + common/runas.c |    1 +
> + 1 files changed, 1 insertions(+), 0 deletions(-)
> +
> +diff --git a/common/runas.c b/common/runas.c
> +index f612ccc..62a2791 100644
> +--- a/common/runas.c
> ++++ b/common/runas.c
> +@@ -29,6 +29,7 @@
> + #include<fcntl.h>
> + #include<sched.h>
> + #include<sys/mman.h>
> ++#include<asm/mman.h>
> +
> + #include<lttngerr.h>
> +
> +--
> +1.7.5.4
> +
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
> new file mode 100644
> index 0000000..cde57f7
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
> @@ -0,0 +1,30 @@
> +SECTION = "devel"
> +SUMMARY = "Linux Trace Toolkit Control"
> +DESCRIPTION = "The Linux trace toolkit is a suite of tools designed \
> +to extract program execution details from the Linux operating system \
> +and interpret them."
> +
> +LICENSE = "GPLv2.1"

You have gpl-2.0  and lgpl-2.1 list below which is the correct LICENSE?

Sau!

> +LIC_FILES_CHKSUM = "file://COPYING;md5=ab682a4729389c3f11913d758affe98e \
> +                    file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
> +
> +DEPENDS = "liburcu popt lttng-ust"
> +
> +SRCREV = "f2ca2e251d8f49b0dbbcca529dd61b3562c1147f"
> +PV = "v2.0.pre16+git${SRCREV}"
> +PR = "r0"
> +
> +SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git\
> +           file://lttng-tools-fix-compiling-error-for-powerpc-arm.patch"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +export KERNELDIR="${STAGING_KERNEL_DIR}"
> +
> +# Due to liburcu not building for MIPS currently this recipe needs to
> +# be limited also.
> +# So here let us first suppport x86/arm/powerpc platforms now.
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'


