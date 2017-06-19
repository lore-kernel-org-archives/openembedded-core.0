Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 07AD678219
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 12:41:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jun 2017 05:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,361,1493708400"; d="scan'208";a="101115588"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga002.jf.intel.com with ESMTP; 19 Jun 2017 05:41:16 -0700
Date: Mon, 19 Jun 2017 15:40:44 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Message-ID: <20170619124044.GA5375@mbabyjoh-desk.ger.corp.intel.com>
References: <20170619103238.2626-1-git@andred.net>
MIME-Version: 1.0
In-Reply-To: <20170619103238.2626-1-git@andred.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: fix nftables dependency
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
X-List-Received-Date: Mon, 19 Jun 2017 12:41:17 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

On Mon, Jun 19, 2017 at 11:32:38AM +0100, André Draszik wrote:
> From: André Draszik <adraszik@tycoint.com>
> 
> When building with nftables support, connman doesn't ever
> depend on the nftables command line tool.
> 
> connman will depend on libmnl and libnftnl at build and
> run time. In addition, the nftables rules it creates
> depend on various kernel modules being present.
> 
> Update the PACKAGECONFIG to reflect this.
> 
> Signed-off-by: André Draszik <adraszik@tycoint.com>
> Acked-by: Sylvain Lemieux <slemieux@tycoint.com>
> ---
>  meta/recipes-connectivity/connman/connman.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index ab18f2fe01..132a58ff40 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -51,7 +51,7 @@ PACKAGECONFIG[l2tp] = "--enable-l2tp --with-l2tp=${sbindir}/xl2tpd,--disable-l2t
>  PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,,pptp-linux"
>  # WISPr support for logging into hotspots, requires TLS
>  PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
> -PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,nftables,nftables"
> +PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,kernel-module-nf-tables-ipv4 kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-meta kernel-module-nft-masq-ipv4 kernel-module-nft-nat"
>  PACKAGECONFIG[iptables] = "--with-firewall=iptables ,,iptables,iptables"

Thanks for fixing this. However, this patch introduces some warnings:

WARNING: connman-1.34-r0 do_package_qa: QA Issue: connman rdepends on kernel-module-nf-tables-ipv4, but it isn't a build dependency? [build-deps]
WARNING: connman-1.34-r0 do_package_qa: QA Issue: connman rdepends on kernel-module-nft-chain-nat-ipv4, but it isn't a build dependency? [build-deps]
WARNING: connman-1.34-r0 do_package_qa: QA Issue: connman rdepends on kernel-module-nft-chain-route-ipv4, but it isn't a build dependency? [build-deps]
WARNING: connman-1.34-r0 do_package_qa: QA Issue: connman rdepends on kernel-module-nft-masq-ipv4, but it isn't a build dependency? [build-deps]
WARNING: connman-1.34-r0 do_package_qa: QA Issue: connman rdepends on kernel-module-nft-meta, but it isn't a build dependency? [build-deps]
WARNING: connman-1.34-r0 do_package_qa: QA Issue: connman rdepends on kernel-module-nft-nat, but it isn't a build dependency? [build-deps]
NOTE: Tasks Summary: Attempted 2032 tasks of which 2000 didn't need to be rerun and all succeeded.

Please consider fixing this as well.

Best Regards,
Maxin

