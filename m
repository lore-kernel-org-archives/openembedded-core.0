Return-Path: <ross.burton@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 059DD7F3D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 12:05:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Sep 2019 05:05:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,528,1559545200"; d="scan'208";a="362831899"
Received: from creinhar-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.39.119])
	by orsmga005.jf.intel.com with ESMTP; 20 Sep 2019 05:05:52 -0700
To: openembedded-core@lists.openembedded.org
References: <20190920101457.10169-1-quanyang.wang@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <9156945a-f8c1-235b-9c53-bdda0fc8b746@intel.com>
Date: Fri, 20 Sep 2019 13:05:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190920101457.10169-1-quanyang.wang@windriver.com>
Subject: Re: [PATCH] kexec-tools: fix arm kexec failure for __NR_kexec_file_load
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
X-List-Received-Date: Fri, 20 Sep 2019 12:05:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Remember to add the Upstream-Status:

https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/kexec/kexec-syscall.h?id=b54816eff272324320c490d62dc36b27d2838732

Ross

On 20/09/2019 11:14, quanyang.wang@windriver.com wrote:
> From: Wang Quanyang <quanyang.wang@windriver.com>
> 
> Once use kexec in arm arch, it will throw out the error info as below:
> 
> Could not find a free area of memory of 0xc78e744 bytes...
> 
> This is because that kexec use kexec_file_load to load image by default
> but arm doesn't support it. So add this patch to avoid use kexec_file_load
> in arm platforms.
> 
> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
> ---
>   ...ndefine-__NR_kexec_file_load-for-arm.patch | 37 +++++++++++++++++++
>   .../kexec/kexec-tools_2.0.19.bb               |  1 +
>   2 files changed, 38 insertions(+)
>   create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch
> 
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch b/meta/recipes-kernel/kexec/kexec-tools/0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch
> new file mode 100644
> index 0000000000..1b11363191
> --- /dev/null
> +++ b/meta/recipes-kernel/kexec/kexec-tools/0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch
> @@ -0,0 +1,37 @@
> +From b54816eff272324320c490d62dc36b27d2838732 Mon Sep 17 00:00:00 2001
> +From: Quanyang Wang <quanyang.wang@windriver.com>
> +Date: Mon, 16 Sep 2019 10:49:05 +0800
> +Subject: [PATCH] kexec/arm: undefine __NR_kexec_file_load for arm
> +
> +In the kernel upstream commit 4ab65ba7a5cb
> +("ARM: add kexec_file_load system call number"),
> +__NR_kexec_file_load for arm has been defined to be 401.
> +This results that even if kexec_file_load isn't implemented
> +for arm but the function is_kexec_file_load_implemented()
> +will still return true. So undef __NR_kexec_file_load for
> +arm architecture.
> +
> +Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
> +Signed-off-by: Simon Horman <horms@verge.net.au>
> +---
> + kexec/kexec-syscall.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
> +index dac1c1f..92d51d3 100644
> +--- a/kexec/kexec-syscall.h
> ++++ b/kexec/kexec-syscall.h
> +@@ -56,6 +56,10 @@
> + #endif
> + #endif /*ifndef __NR_kexec_load*/
> +
> ++#ifdef __arm__
> ++#undef __NR_kexec_file_load
> ++#endif
> ++
> + #ifndef __NR_kexec_file_load
> +
> + #ifdef __x86_64__
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
> index 3439899070..c3f74359f1 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
> @@ -18,6 +18,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
>       file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
>       file://0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch \
>       file://0005-Disable-PIE-during-link.patch \
> +    file://0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch \
>   "
>   
>   SRC_URI[md5sum] = "052458f0a35c2a3b0d2302caa3318e9f"
> 


