Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1805A619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 17:07:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jul 2013 10:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,670,1367996400"; d="scan'208";a="370613226"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2013 10:07:26 -0700
Message-ID: <51E42C4D.3080001@linux.intel.com>
Date: Mon, 15 Jul 2013 10:07:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Simon Busch <morphis@gravedo.de>
References: <1373907623-24030-1-git-send-email-morphis@gravedo.de>
In-Reply-To: <1373907623-24030-1-git-send-email-morphis@gravedo.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wpa-supplicant: backport patch to fix dbus interface for autoscan functionality
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
X-List-Received-Date: Mon, 15 Jul 2013 17:07:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2013 10:00 AM, Simon Busch wrote:
> See https://lists.connman.net/pipermail/connman/2013-July/014871.html for details about
> the issue with connman and http://lists.shmoo.com/pipermail/hostap/2013-July/028167.html
> about the upstream submission of the patch.
>
> Signed-off-by: Simon Busch <morphis@gravedo.de>
> ---
>   .../wpa-supplicant/wpa-supplicant-2.0.inc          |  3 +-
>   .../register-autoscan-correctly.patch              | 49 ++++++++++++++++++++++
>   .../wpa-supplicant/wpa-supplicant_2.0.bb           |  2 +-
>   3 files changed, 52 insertions(+), 2 deletions(-)
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
This needs an Upstream-Status: tag in this patch.
> @@ -0,0 +1,49 @@
> +From 199f871006f756911a844dfadbc6e8b98e1088ef Mon Sep 17 00:00:00 2001
> +From: Tomasz Bursztyka <tomasz.bursztyka@linux.intel.com>
> +Date: Mon, 1 Jul 2013 16:07:40 +0300
> +Subject: [PATCH] dbus: Register the AutoScan method call at the right place
> +
> +Signed-hostap: Tomasz Bursztyka <tomasz.bursztyka@linux.intel.com>
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
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
> index a8b0dad..da18621 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
> @@ -1,6 +1,6 @@
>   require wpa-supplicant-2.0.inc
>
> -PR = "r1"
> +PR = "r2"
>
No PR bumps required anymore.

Thanks
	Sau!

>   SRC_URI[md5sum] = "3be2ebfdcced52e00eda0afe2889839d"
>   SRC_URI[sha256sum] = "2c115609fbb5223d51381084a5c944455a8afcda81d584173ff55ba233379e09"
>

