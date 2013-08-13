Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0AE2E61037
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 15:30:55 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Aug 2013 08:30:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,870,1367996400"; d="scan'208";a="281406707"
Received: from unknown (HELO [10.255.14.106]) ([10.255.14.106])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Aug 2013 08:30:55 -0700
Message-ID: <520A512F.3060108@linux.intel.com>
Date: Tue, 13 Aug 2013 08:30:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Yevhen Kyriukha <kirgene@gmail.com>
References: <1376393206-14191-1-git-send-email-kirgene@gmail.com>
In-Reply-To: <1376393206-14191-1-git-send-email-kirgene@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] connman: fix systemd support for connman-* packages.
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
X-List-Received-Date: Tue, 13 Aug 2013 15:30:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2013 04:26 AM, Yevhen Kyriukha wrote:
> This patch fixes systemd's postinst/postrm script generation.
>
> Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
> ---
>   meta/recipes-connectivity/connman/connman.inc | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 6b5ea0b..37ce3ec 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -56,6 +56,14 @@ PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
>   INITSCRIPT_NAME = "connman"
>   INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
>
> +python __anonymous () {
> +    systemd_packages = "${PN}"
> +    pkgconfig = d.getVar('PACKAGECONFIG', True)
> +    if ('openvpn' or 'vpnc' or 'l2tp' or 'pptp') in pkgconfig.split():
> +        systemd_packages += " ${PN}-vpn"
> +    d.setVar('SYSTEMD_PACKAGES', systemd_packages)
> +}
> +
>   SYSTEMD_SERVICE_${PN} = "connman.service"
>   SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
>   SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
>
Can't you use the base_contains style of anon python in the 
SYSTEMD_PACKAGES:

SYSTEMD_PACKAGES = "${PN} ${@base_contains('PACKAGECONFIG', 'vpn', 
'${PN}-vpn', '', d)}"

Or can any one of those in the list above trigger the vpn, it would be 
cleaner if we just trigger on just one item.

Sau!

