Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Rkf9p-0004GJ-3m
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 18:06:45 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Jan 2012 08:59:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="55127278"
Received: from unknown (HELO envy.home) ([10.255.13.204])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jan 2012 08:59:14 -0800
Message-ID: <4F0C6E4F.8040108@linux.intel.com>
Date: Tue, 10 Jan 2012 08:58:55 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Zumeng Chen <zumeng.chen@windriver.com>
References: <cover.1326210673.git.zumeng.chen@windriver.com>
	<f42f850e2c27a23f9e7b46bbebe977a6a19a6c54.1326210673.git.zumeng.chen@windriver.com>
In-Reply-To: <f42f850e2c27a23f9e7b46bbebe977a6a19a6c54.1326210673.git.zumeng.chen@windriver.com>
X-Enigmail-Version: 1.3.3
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] lttng-ust: Integrate into yocto linux
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
X-List-Received-Date: Tue, 10 Jan 2012 17:06:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/10/2012 08:11 AM, Zumeng Chen wrote:
> This patch intended to integrate the LTTng UST 2.0 package, which
> contains the userspace tracer library to trace userspace codes.
> 
> Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
> ---
>  meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb |   25 ++++++++++++++++++++++
>  1 files changed, 25 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
> 
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb b/meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
> new file mode 100644
> index 0000000..846019e
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
> +DESCRIPTION = "The LTTng UST 2.0 package contains the userspace tracer library to trace userspace codes."
> +HOMEPAGE = "http://lttng.org/lttng2.0"
> +BUGTRACKER = "n/a"
> +
> +LICENSE = "LGPLv2.1+ & BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
> +                    file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
> +                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
> +
> +inherit autotools
> +
> +DEPENDS = "liburcu util-linux"
> +
> +SRC_URI = "http://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "0f09bb954c99cb99ab6997cd492953c1"
> +SRC_URI[sha256sum] = "e9ec3c55c2251b3f3b512bfa1015b0f67e35d55793850ccea5134f7b24ee3ba1"
> +
> +S = "${WORKDIR}/lttng-ust-${PV}"
> +
> +# Due to liburcu not building on MIPS currently this recipe needs to
> +# be limited also.
> +# So here let us first suppport x86/arm/powerpc platforms now.
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'

We had discussed using a different comment that more clearly stated why
this is necessary and use the same comment across all the patches
implementing this.

This applies to all 4 patches. The suggestion was in my response to
Patch 1/4 V1:

> Looking through documentation.conf and existing poky sources, I believe
> this test is correct. HOST/TARGET are the same in this case. The comment
> is a bit confusing however. I believe the comment should read:
> 
> # liburcu doesn't build for MIPS
> COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> 
> The key difference being "for" instead of "on". The rest of the comment
> is redundant with the assignment itself. This applies to all 4 patches.

Otherwise, things look good.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


