Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 0528660B05
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 02:16:49 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Aug 2014 19:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,802,1400050800"; d="scan'208";a="464965069"
Received: from unknown (HELO [10.255.12.12]) ([10.255.12.12])
	by azsmga001.ch.intel.com with ESMTP; 04 Aug 2014 19:16:50 -0700
Message-ID: <53E03E91.4070601@linux.intel.com>
Date: Mon, 04 Aug 2014 19:16:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1407204209-12879-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1407204209-12879-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH][RFC/RFT] busybox: Make busybox connman aware
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
X-List-Received-Date: Tue, 05 Aug 2014 02:16:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2014 07:03 PM, Saul Wold wrote:
> This change makes busybox aware of both connman and the standard dhcp
> client, while there is a caveat about using busybox's ifup/ifdown, this
> change will make the 3 possibly dhcp clients behave better when busybox
> is used.
>
> Enable the CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP feature to busybox will
> search for various external clients and then add connman as an external
> client.
>
> [YOCTO #6521]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-core/busybox/busybox/defconfig               |  2 +-
>   .../recipes-core/busybox/busybox/recognize_connmand.patch | 15 +++++++++++++++
>   meta/recipes-core/busybox/busybox_1.22.1.bb               |  1 +
>   3 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-core/busybox/busybox/recognize_connmand.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
> index 0107231..35f1026 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -781,7 +781,7 @@ CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN=y
>   CONFIG_FEATURE_IFUPDOWN_IPV4=y
>   CONFIG_FEATURE_IFUPDOWN_IPV6=y
>   CONFIG_FEATURE_IFUPDOWN_MAPPING=y
> -# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
> +CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP=y
>   # CONFIG_INETD is not set
>   # CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
>   # CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
> diff --git a/meta/recipes-core/busybox/busybox/recognize_connmand.patch b/meta/recipes-core/busybox/busybox/recognize_connmand.patch
> new file mode 100644
> index 0000000..495bb05
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/recognize_connmand.patch
> @@ -0,0 +1,15 @@

There will be a V2 with the Signed-off-by and Upstream-Status tags!!

This is an RFC after all!

Sau!

> +Index: busybox-1.22.1/networking/ifupdown.c
> +===================================================================
> +--- busybox-1.22.1.orig/networking/ifupdown.c
> ++++ busybox-1.22.1/networking/ifupdown.c
> +@@ -521,6 +521,10 @@ struct dhcp_client_t {
> + };
> +
> + static const struct dhcp_client_t ext_dhcp_clients[] = {
> ++	{ "connmand",
> ++		"true",
> ++		"true",
> ++	},
> + 	{ "dhcpcd",
> + 		"dhcpcd[[ -h %hostname%]][[ -i %vendor%]][[ -I %client%]][[ -l %leasetime%]] %iface%",
> + 		"dhcpcd -k %iface%",
> diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
> index 46641e1..edee4a9 100644
> --- a/meta/recipes-core/busybox/busybox_1.22.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
> @@ -30,6 +30,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://inetd \
>              file://login-utilities.cfg \
>              file://0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch \
> +           file://recognize_connmand.patch \
>   "
>
>   SRC_URI[tarball.md5sum] = "337d1a15ab1cb1d4ed423168b1eb7d7e"
>

