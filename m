Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE6F766DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 02:27:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9E2R7R2023217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 19:27:07 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 13 Oct 2015 19:27:06 -0700
Message-ID: <561DBD79.4090703@windriver.com>
Date: Wed, 14 Oct 2015 10:27:05 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1441950663-11139-1-git-send-email-wenzong.fan@windriver.com>
In-Reply-To: <1441950663-11139-1-git-send-email-wenzong.fan@windriver.com>
Subject: Re: [PATCH] mdadm: fix CFLAGS invalid issue
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
X-List-Received-Date: Wed, 14 Oct 2015 02:27:09 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping ...

Thanks
Wenzong

On 09/11/2015 01:51 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> * Pass global CFLAGS to build:
>
> The CFLAGS does not pass to build at all since it was redefined by
> mdadm Makefile:
>
>    CFLAGS = $(CWFLAGS) $(CXFLAGS) ...
>
> This could be done by setting 'CXFLAGS="${CFLAGS}"'.
>
> * Also fix ptest build error caused by global CFLAGS:
>
>    raid6check.c: In function 'check_stripes':
>    raid6check.c:315:8: error: 'stripe_buf' may be used uninitialized \
>    in this function [-Werror=maybe-uninitialized]
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   .../mdadm/files/mdadm-fix-ptest-build-error.patch  | 34 ++++++++++++++++++++++
>   meta/recipes-extended/mdadm/mdadm_3.3.4.bb         |  3 +-
>   2 files changed, 36 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-error.patch
>
> diff --git a/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-error.patch b/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-error.patch
> new file mode 100644
> index 0000000..b2495c0
> --- /dev/null
> +++ b/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-error.patch
> @@ -0,0 +1,34 @@
> +From d062030a36faa77193ac66b498a1ec704013dbb1 Mon Sep 17 00:00:00 2001
> +From: Wenzong Fan <wenzong.fan@windriver.com>
> +Date: Thu, 10 Sep 2015 03:52:20 -0400
> +Subject: [PATCH] mdadm: fix ptest build error
> +
> +Initialize *stripe_buf as NULL to fix ptest build error:
> +
> +  raid6check.c: In function 'check_stripes':
> +  raid6check.c:315:8: error: 'stripe_buf' may be used uninitialized \
> +  in this function [-Werror=maybe-uninitialized]
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> +---
> + raid6check.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/raid6check.c b/raid6check.c
> +index cb8522e..e4a9ff0 100644
> +--- a/raid6check.c
> ++++ b/raid6check.c
> +@@ -312,7 +312,7 @@ int check_stripes(struct mdinfo *info, int *source, unsigned long long *offsets,
> + 	/* read the data and p and q blocks, and check we got them right */
> + 	int data_disks = raid_disks - 2;
> + 	int syndrome_disks = data_disks + is_ddf(layout) * 2;
> +-	char *stripe_buf;
> ++	char *stripe_buf = NULL;
> +
> + 	/* stripes[] is indexed by raid_disk and holds chunks from each device */
> + 	char **stripes = xmalloc(raid_disks * sizeof(char*));
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
> index 460a430..a8b4ee1 100644
> --- a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
> @@ -12,6 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
>              file://mdadm-3.2.2_fix_for_x32.patch \
>              file://gcc-4.9.patch \
>              file://mdadm-3.3.2_x32_abi_time_t.patch \
> +           file://mdadm-fix-ptest-build-error.patch \
>              file://run-ptest \
>   	  "
>   SRC_URI[md5sum] = "7ca8b114710f98f53f20c5787b674a09"
> @@ -21,7 +22,7 @@ CFLAGS += "-fno-strict-aliasing"
>
>   inherit autotools-brokensep
>
> -EXTRA_OEMAKE = "CHECK_RUN_DIR=0"
> +EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
>   # PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's asm/types.h
>   # prevents 64-bit userland from seeing this definition, instead defaulting
>   # to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get
>

