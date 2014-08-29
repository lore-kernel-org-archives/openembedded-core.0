Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7556FEA9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 09:14:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7T9ETFm016920
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 02:14:30 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 29 Aug 2014 02:14:29 -0700
Message-ID: <54004472.3000601@windriver.com>
Date: Fri, 29 Aug 2014 17:14:26 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1409301362.git.Chong.Lu@windriver.com>
	<36a722d493c52d16f6d55ed07df82e865e7f3db7.1409301362.git.Chong.Lu@windriver.com>
In-Reply-To: <36a722d493c52d16f6d55ed07df82e865e7f3db7.1409301362.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 1/2] libunwind: add recipes
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
X-List-Received-Date: Fri, 29 Aug 2014 09:14:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 08/29/2014 04:38 PM, Chong Lu wrote:
> Add libunwind from meta-oe to oe-core, since perf depends on it.
To be clearly, adding this recipes to perf allows it to do stack traces 
on ARM - thumb2 and MIPS targets.
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   meta/recipes-support/libunwind/libunwind.inc    | 30 +++++++++++++++++++++++++
>   meta/recipes-support/libunwind/libunwind_1.1.bb |  4 ++++
>   2 files changed, 34 insertions(+)
>   create mode 100644 meta/recipes-support/libunwind/libunwind.inc
>   create mode 100644 meta/recipes-support/libunwind/libunwind_1.1.bb
>
> diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
> new file mode 100644
> index 0000000..b27b9e5
> --- /dev/null
> +++ b/meta/recipes-support/libunwind/libunwind.inc
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "a portable and efficient C programming interface (API) to determine the call-chain of a program"
> +HOMEPAGE = "http://www.nongnu.org/libunwind"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
> +
> +SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
> +
> +inherit autotools
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,lzma"
> +
> +EXTRA_OECONF_arm = "--enable-debug-frame"
> +
> +CFLAGS += "${ATOMICOPS}"
> +ATOMICOPS_armv5 = "-DAO_USE_PTHREAD_DEFS=1"
> +ATOMICOPS_armv4 = "-DAO_USE_PTHREAD_DEFS=1"
> +ATOMICOPS ?= ""
> +
> +LDFLAGS += "${LIBATOMICS}"
> +LIBATOMICS_armv5 = "-latomic_ops"
> +LIBATOMICS_armv4 = "-latomic_ops"
> +LIBATOMICS ?= ""
> +
> +DEPENDS += "${DEPLIBATOMICS}"
> +DEPLIBATOMICS_armv5 = "libatomics-ops"
> +DEPLIBATOMICS_armv4 = "libatomics-ops"
> +DEPLIBATOMICS ?= ""
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
> new file mode 100644
> index 0000000..bc38e36
> --- /dev/null
> +++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
> @@ -0,0 +1,4 @@
> +require libunwind.inc
> +
> +SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
> +SRC_URI[sha256sum] = "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"


