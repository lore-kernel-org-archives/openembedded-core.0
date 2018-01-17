Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E6B6C786B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 22:46:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jan 2018 14:46:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,374,1511856000"; d="scan'208";a="10560819"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga007.jf.intel.com with ESMTP; 17 Jan 2018 14:46:33 -0800
To: openembedded-core@lists.openembedded.org
References: <20180117205930.35857-1-california.l.sullivan@intel.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <447ffc41-02e9-e221-1fb5-b4871aaeccf9@intel.com>
Date: Wed, 17 Jan 2018 14:46:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180117205930.35857-1-california.l.sullivan@intel.com>
Subject: Re: [PATCH] cryptodev-module: fix with kernels 4.13 and newer
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
X-List-Received-Date: Wed, 17 Jan 2018 22:46:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Apologies, it looks like the same patch was submitted by someone else 
already.

I will ack that one. Ignore this one.

Thanks,
Cal

On 01/17/2018 12:59 PM, California Sullivan wrote:
> Backport a patch from upstream to address designated-init errors such
> as the following:
>
> cryptodev-module/1.9-r0/cryptodev-linux-1.9/ioctl.c:1127:3: error:
> positional initialization of field in 'struct' declared with
> 'designated_init' attribute [-Werror=designated-init]
> |   {0, },
> |    ^
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
>   .../cryptodev/cryptodev-module_1.9.bb              |  1 +
>   .../0001-ioctl.c-Fix-build-with-linux-4.13.patch   | 49 ++++++++++++++++++++++
>   2 files changed, 50 insertions(+)
>   create mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch
>
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
> index 552eb6abaae..ed6d0ecae97 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
> +++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
> @@ -9,6 +9,7 @@ DEPENDS += "cryptodev-linux"
>   
>   SRC_URI += " \
>   file://0001-Disable-installing-header-file-provided-by-another-p.patch \
> +file://0001-ioctl.c-Fix-build-with-linux-4.13.patch \
>   "
>   
>   EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
> diff --git a/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch b/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch
> new file mode 100644
> index 00000000000..eccaff4f3f1
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch
> @@ -0,0 +1,49 @@
> +From f0d69774afb27ffc62bf353465fba145e70cb85a Mon Sep 17 00:00:00 2001
> +From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +Date: Mon, 4 Sep 2017 11:05:08 +0200
> +Subject: [PATCH] ioctl.c: Fix build with linux 4.13
> +
> +Upstream-Status: backport
> +
> +git/ioctl.c:1127:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
> +   {0, },
> +    ^
> +note: (near initialization for 'verbosity_ctl_dir[1]')
> +git/ioctl.c:1136:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
> +   {0, },
> +    ^
> +
> +Linux kernel has added -Werror=designated-init around 4.11 (c834f0e8a8b)
> +triggering build errors with gcc 5 and 6 (but not with gcc 4)
> +
> +Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +Signed-off-by: Cristian Stoica <cristian.stoica@nxp.com>
> +---
> + ioctl.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/ioctl.c b/ioctl.c
> +index 0385203..8d4a162 100644
> +--- a/ioctl.c
> ++++ b/ioctl.c
> +@@ -1124,7 +1124,7 @@ static struct ctl_table verbosity_ctl_dir[] = {
> + 		.mode           = 0644,
> + 		.proc_handler   = proc_dointvec,
> + 	},
> +-	{0, },
> ++	{},
> + };
> +
> + static struct ctl_table verbosity_ctl_root[] = {
> +@@ -1133,7 +1133,7 @@ static struct ctl_table verbosity_ctl_root[] = {
> + 		.mode           = 0555,
> + 		.child          = verbosity_ctl_dir,
> + 	},
> +-	{0, },
> ++	{},
> + };
> + static struct ctl_table_header *verbosity_sysctl_header;
> + static int __init init_cryptodev(void)
> +--
> +2.14.3
> +


