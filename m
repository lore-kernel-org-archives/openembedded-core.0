Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D4CCA61663
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 17:42:06 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Jul 2013 10:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,670,1367996400"; d="scan'208";a="268583796"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Jul 2013 10:41:51 -0700
Message-ID: <51E4345F.20501@linux.intel.com>
Date: Mon, 15 Jul 2013 10:41:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Simon Busch <morphis@gravedo.de>
References: <1373909634-31509-1-git-send-email-morphis@gravedo.de>
In-Reply-To: <1373909634-31509-1-git-send-email-morphis@gravedo.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] wpa-supplicant: backport patch to fix dbus interface for autoscan functionality
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
X-List-Received-Date: Mon, 15 Jul 2013 17:42:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2013 10:33 AM, Simon Busch wrote:
> See https://lists.connman.net/pipermail/connman/2013-July/014871.html for details about
> the issue with connman and http://lists.shmoo.com/pipermail/hostap/2013-July/028167.html
> about the upstream submission of the patch.
>
> Signed-off-by: Simon Busch <morphis@gravedo.de>
> ---
>   .../wpa-supplicant/wpa-supplicant-2.0.inc          |  3 +-
>   .../register-autoscan-correctly.patch              | 49 ++++++++++++++++++++++
>   2 files changed, 51 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
> index 8d7233a..ce669a1 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
> @@ -20,7 +20,8 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
>              file://wpa_supplicant.conf \
>              file://wpa_supplicant.conf-sane \
>              file://99_wpa_supplicant \
> -           file://fix-libnl3-host-contamination.patch"
> +           file://fix-libnl3-host-contamination.patch \
> +           file://register-autoscan-correctly.patch"
>
>   S = "${WORKDIR}/wpa_supplicant-${PV}"
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch
> new file mode 100644
> index 0000000..4881295
> --- /dev/null


> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch
> @@ -0,0 +1,49 @@
> +From 199f871006f756911a844dfadbc6e8b98e1088ef Mon Sep 17 00:00:00 2001
> +From: Tomasz Bursztyka <tomasz.bursztyka@linux.intel.com>
> +Date: Mon, 1 Jul 2013 16:07:40 +0300
> +Subject: [PATCH] dbus: Register the AutoScan method call at the right place
> +
> +Signed-hostap: Tomasz Bursztyka <tomasz.bursztyka@linux.intel.com>

Still no Upstream-Status here,

Please see:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks
	Sau!

> +---
> + wpa_supplicant/dbus/dbus_new.c | 18 +++++++++---------
> + 1 file changed, 9 insertions(+), 9 deletions(-)
> +
> +diff --git a/wpa_supplicant/dbus/dbus_new.c b/wpa_supplicant/dbus/dbus_new.c
> +index 8bc6618..d076d2d 100644
> +--- a/wpa_supplicant/dbus/dbus_new.c
> ++++ b/wpa_supplicant/dbus/dbus_new.c
> +@@ -1917,15 +1917,6 @@ static const struct wpa_dbus_method_desc wpas_dbus_global_methods[] = {
> + 		  END_ARGS
> + 	  }
> + 	},
> +-#ifdef CONFIG_AUTOSCAN
> +-	{ "AutoScan", WPAS_DBUS_NEW_IFACE_INTERFACE,
> +-	  (WPADBusMethodHandler) &wpas_dbus_handler_autoscan,
> +-	  {
> +-		  { "arg", "s", ARG_IN },
> +-		  END_ARGS
> +-	  }
> +-	},
> +-#endif /* CONFIG_AUTOSCAN */
> + 	{ NULL, NULL, NULL, { END_ARGS } }
> + };
> +
> +@@ -2649,6 +2640,15 @@ static const struct wpa_dbus_method_desc wpas_dbus_interface_methods[] = {
> + 	  }
> + 	},
> + #endif /* CONFIG_AP */
> ++#ifdef CONFIG_AUTOSCAN
> ++	{ "AutoScan", WPAS_DBUS_NEW_IFACE_INTERFACE,
> ++	  (WPADBusMethodHandler) &wpas_dbus_handler_autoscan,
> ++	  {
> ++		  { "arg", "s", ARG_IN },
> ++		  END_ARGS
> ++	  }
> ++	},
> ++#endif /* CONFIG_AUTOSCAN */
> + 	{ NULL, NULL, NULL, { END_ARGS } }
> + };
> +
> +--
> +1.8.1.2
> +
>

