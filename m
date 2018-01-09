Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE046FFD4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 18:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8104E208DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 18:55:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id yZyZ4cOOFOmT
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 18:55:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 67514208CC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 18:55:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C9631163254; Tue,  9 Jan 2018 13:55:04 -0500 (EST)
Date: Tue, 9 Jan 2018 13:55:04 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180109185504.GC9657@denix.org>
References: <20180109015738.GB9657@denix.org>
MIME-Version: 1.0
In-Reply-To: <20180109015738.GB9657@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: bash: add missing build dependencies for ptest
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
X-List-Received-Date: Tue, 09 Jan 2018 18:55:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I believe below DEPENDS line should actually refer "virtual/libc-locale" 
instead of directly "glibc-locale":

http://cgit.openembedded.org/openembedded-core/tree/meta/conf/distro/include/tclibc-glibc.inc


On Mon, Jan 08, 2018 at 08:57:38PM -0500, Denys Dmytriyenko wrote:
> Somehow, below change was never sent or discussed on the list - can't seem to 
> find it.
> 
> Does this mean bash always requires glibc-locale built, even if I don't use 
> ptest or enable locale?
> 
> -- 
> Denys
> 
> 
> 
> commit 2820a2c530018f59895fb57770caa8511d31afd4
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Fri Oct 13 14:52:16 2017 +0100
> 
>     bash: add missing build dependencies for ptest
>     
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> 
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
> index f8a92b5..f4e1f7a 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -24,7 +24,9 @@ ALTERNATIVE_PRIORITY = "100"
>  RDEPENDS_${PN} += "base-files"
>  RDEPENDS_${PN}_class-nativesdk = ""
>  RDEPENDS_${PN}-ptest += "make"
> -RDEPENDS_${PN}-ptest_append_libc-glibc += " locale-base-fr-fr locale-base-de-de"
> +
> +DEPENDS_append_libc-glibc = " glibc-locale"
> +RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-fr-fr locale-base-de-de"
>  
>  USERADD_PACKAGES = "${PN}-ptest"
>  USERADD_PARAM_${PN}-ptest = "--create-home --user-group test"
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

