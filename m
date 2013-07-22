Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 84D6360686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 03:48:09 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Jul 2013 20:48:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,716,1367996400"; d="scan'208";a="271387213"
Received: from unknown (HELO [10.255.14.5]) ([10.255.14.5])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Jul 2013 20:48:08 -0700
Message-ID: <51ECAB78.5070002@linux.intel.com>
Date: Sun, 21 Jul 2013 20:48:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ming Liu <ming.liu@windriver.com>
References: <1374112474-13597-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1374112474-13597-1-git-send-email-ming.liu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3] util-linux: replace += with _append to EXTRA_OECONF_class-native
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
X-List-Received-Date: Mon, 22 Jul 2013 03:48:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2013 06:54 PM, Ming Liu wrote:
> The native/nativesdk overrides of EXTRA_OECONF should take effect before
> append operator, otherwise, it will cause EXTRA_OECONF be overridden instead
> of be appended at native/nativesdk build time.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   meta/recipes-core/util-linux/util-linux_2.23.1.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux_2.23.1.bb b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
> index 12f5021..3040476 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.23.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
> @@ -18,5 +18,5 @@ SRC_URI[md5sum] = "6741eeaff93ff5a6bacdd3816bdd87c4"
>   SRC_URI[sha256sum] = "ad4a7831d7b27d0172996fd343e809716c2403b32a94e15194d8ea797223c4af"
>
>   CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
> -EXTRA_OECONF_class-native += "--disable-fallocate --disable-use-tty-group"
> -EXTRA_OECONF_class-nativesdk += "--disable-fallocate --disable-use-tty-group"
> +EXTRA_OECONF_append_class-native = " --disable-fallocate --disable-use-tty-group"
> +EXTRA_OECONF_append_class-nativesdk = " --disable-fallocate --disable-use-tty-group"
>

While this seems correct, it is causing some down stream issues with 
e2fsprogs-native and not finding the uuid library

>  Enabling testio debugging by default
> | checking for x86_64-linux-pkg-config... no
> | checking for pkg-config... /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
> | checking pkg-config is at least version 0.9.0... yes
> | checking for uuid_generate in -luuid... no
> | configure: error: external uuid library not found
> | Configure failed. The contents of all config.log files follows to aid debugging
> | ERROR: oe_runconf failed

Can you please research this further.

Thanks
	Sau!



