Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id C556F61222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 22:53:00 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 Aug 2013 15:53:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,865,1367996400"; d="scan'208";a="345367461"
Received: from unknown (HELO [10.255.14.106]) ([10.255.14.106])
	by azsmga001.ch.intel.com with ESMTP; 12 Aug 2013 15:52:37 -0700
Message-ID: <52096735.9060300@linux.intel.com>
Date: Mon, 12 Aug 2013 15:52:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Yevhen Kyriukha <kirgene@gmail.com>
References: <1376324886-17664-1-git-send-email-kirgene@gmail.com>
In-Reply-To: <1376324886-17664-1-git-send-email-kirgene@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v1] connman: fix systemd support for connman-* packages.
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
X-List-Received-Date: Mon, 12 Aug 2013 22:53:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2013 09:28 AM, Yevhen Kyriukha wrote:
> This patch fixes systemd's postinst/postrm script generation.
>
> Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
> ---
>   meta/recipes-connectivity/connman/connman.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 6b5ea0b..c5014b7 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -56,6 +56,7 @@ PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
>   INITSCRIPT_NAME = "connman"
>   INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
>
> +SYSTEMD_PACKAGES = "${PN} ${PN}-vpn"

This needs to be guarded with a check for the vpn in PACKAGECONFIG, 
otherwise a packaging error can occur since the service file is not 
available:

ERROR: Function failed: SYSTEMD_SERVICE_connman-vpn value 
connman-vpn.service does not exist

Please correct this.

Thanks
	Sau!

>   SYSTEMD_SERVICE_${PN} = "connman.service"
>   SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
>   SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
>

