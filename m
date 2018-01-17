Return-Path: <california.l.sullivan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4C16777BD2
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 22:48:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jan 2018 14:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,374,1511856000"; d="scan'208";a="10561529"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga007.jf.intel.com with ESMTP; 17 Jan 2018 14:48:35 -0800
To: Daniel Schultz <d.schultz@phytec.de>,
	Openembedded-core@lists.openembedded.org
References: <1515163072-18559-1-git-send-email-d.schultz@phytec.de>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <980b4eb1-75f5-d366-a671-9b93d2001d44@intel.com>
Date: Wed, 17 Jan 2018 14:48:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1515163072-18559-1-git-send-email-d.schultz@phytec.de>
Subject: Re: [RFC] cryptodev: Fix build errors with v4.11
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
X-List-Received-Date: Wed, 17 Jan 2018 22:48:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Acked-by: California Sullivan <california.l.sullivan@intel.com>

On 01/05/2018 06:37 AM, Daniel Schultz wrote:
> Commit message from the included patch:
> "Linux kernel has added -Werror=designated-init around 4.11 (c834f0e8a8b)
> triggering build errors with gcc 5 and 6 (but not with gcc 4)"
>
> Backport from https://github.com/cryptodev-linux/cryptodev-linux
> Based on commit f0d69774afb27ffc62bf353465fba145e70cb85a
>
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>   .../cryptodev/cryptodev-module_1.9.bb              |  1 +
>   .../0001-ioctl.c-Fix-build-with-linux-4.13.patch   | 49 ++++++++++++++++++++++
>   2 files changed, 50 insertions(+)
>   create mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch
>
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
> index 552eb6a..ed6d0ec 100644
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
> index 0000000..a41efac
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch
> @@ -0,0 +1,49 @@
> +From f0d69774afb27ffc62bf353465fba145e70cb85a Mon Sep 17 00:00:00 2001
> +From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +Date: Mon, 4 Sep 2017 11:05:08 +0200
> +Subject: [PATCH] ioctl.c: Fix build with linux 4.13
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
> +Upstream-Status: Backport
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
> +2.7.4
> +


