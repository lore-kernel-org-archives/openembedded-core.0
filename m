Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UdIDu-0004bn-S1
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 12:49:23 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 May 2013 03:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,691,1363158000"; d="scan'208";a="242950015"
Received: from unknown (HELO [10.255.12.57]) ([10.255.12.57])
	by AZSMGA002.ch.intel.com with ESMTP; 17 May 2013 03:30:45 -0700
Message-ID: <519606D4.1040705@linux.intel.com>
Date: Fri, 17 May 2013 13:30:44 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
References: <1368786726-32071-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <1368786726-32071-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman-gnome: fixed DHCP segfault
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 10:49:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/17/2013 01:32 PM, Emilia Ciobanu wrote:
> In networks that don't have a DHCP server configured, ipv4 address
> allocation fails and the ipv4 structure doesn't get populated.
> The patch checks this case also.
>
> [YOCTO #3945]
>
> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
> ---
>   .../connman-gnome/null_check_for_ipv4_config.patch |   26 ++++++++++++++++++++
>   .../connman/connman-gnome_0.7.bb                   |    1 +
>   2 files changed, 27 insertions(+)
>   create mode 100644 meta/recipes-connectivity/connman/connman-gnome/null_check_for_ipv4_config.patch
>
> diff --git a/meta/recipes-connectivity/connman/connman-gnome/null_check_for_ipv4_config.patch b/meta/recipes-connectivity/connman/connman-gnome/null_check_for_ipv4_config.patch
> new file mode 100644
> index 0000000..456a4ba
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman-gnome/null_check_for_ipv4_config.patch

You need to have Signed-off-by and Upstream-Status in your patch files also.

And any Comments that might make it more clear.

Sau!


> @@ -0,0 +1,26 @@
> +Index: git/properties/ethernet.c
> +===================================================================
> +--- git.orig/properties/ethernet.c
> ++++ git/properties/ethernet.c
> +@@ -194,7 +194,7 @@ void add_ethernet_service(GtkWidget *mai
> +
> + 	data->button = button;
> +
> +-	if (g_str_equal(ipv4_config.method, "dhcp") == TRUE)
> ++	if (!ipv4_config.method || g_str_equal(ipv4_config.method, "dhcp") == TRUE)
> + 		update_ethernet_ipv4(data, CONNMAN_POLICY_DHCP);
> + 	else
> + 		update_ethernet_ipv4(data, CONNMAN_POLICY_MANUAL);
> +Index: git/properties/wifi.c
> +===================================================================
> +--- git.orig/properties/wifi.c
> ++++ git/properties/wifi.c
> +@@ -230,7 +230,7 @@ static void wifi_ipconfig(GtkWidget *tab
> +
> + 	data->ipv4_config = ipv4_config;
> +
> +-	if (g_str_equal(ipv4_config.method, "dhcp") == TRUE)
> ++	if (!ipv4_config.method || g_str_equal(ipv4_config.method, "dhcp") == TRUE)
> + 		update_wifi_ipv4(data, CONNMAN_POLICY_DHCP);
> + 	else
> + 		update_wifi_ipv4(data, CONNMAN_POLICY_MANUAL);
> diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> index 6299e70..4f8875c 100644
> --- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> +++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> @@ -12,6 +12,7 @@ DEPENDS = "gtk+ dbus-glib intltool-native"
>   SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
>   SRC_URI = "git://github.com/connectivity/connman-gnome.git;protocol=git \
>   	   file://0001-Removed-icon-from-connman-gnome-about-applet.patch \
> +	   file://null_check_for_ipv4_config.patch \
>   	   file://images/* \
>             "
>
>


