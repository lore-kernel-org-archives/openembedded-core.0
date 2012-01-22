Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rp496-0007EF-Tl
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 21:36:13 +0100
Received: by iabz21 with SMTP id z21so4003503iab.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jan 2012 12:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KZO8eC+ocU1YBdPb06ET3loNOpb32OSNRMbFgrQgMYQ=;
	b=mYY9exxkAh5fuDVr3N8Kf7GmC1Bz8Q103Uhe2m01aHQplKlXJNNZXf2K529p3zhKGP
	bQCVDRLxjxWBrCEJbzNFnGFVj3QxwPxr+EKwnjr3oHQerP8vOsvJm00qXCF2PBOveQrA
	Icqv05RRWXLhd+DtT1xvsEHcJb4Vk8eOfLXJE=
Received: by 10.43.131.196 with SMTP id hr4mr5509527icc.55.1327264105433;
	Sun, 22 Jan 2012 12:28:25 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id d15sm38380313ibf.7.2012.01.22.12.28.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Jan 2012 12:28:24 -0800 (PST)
Date: Sun, 22 Jan 2012 12:29:16 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120122202916.GA29776@sakrah.homelinux.org>
References: <cover.1327255445.git.shane.wang@intel.com>
	<5da104c33636cbe2d512779de0799f78edbedd37.1327255445.git.shane.wang@intel.com>
MIME-Version: 1.0
In-Reply-To: <5da104c33636cbe2d512779de0799f78edbedd37.1327255445.git.shane.wang@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 06/18] iptables: upgrade to 1.4.12.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Jan 2012 20:36:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/01/12 02:06), Shane Wang wrote:
> This patch is to upgrade iptables to 1.4.12.2, and introduce a patch not to check unknown symbols.
> Otherwise, when it is compiled, it will report "libxtables.so.7" from LD_PRELOAD cannot be preloaded.

you should say dont build 'check' target by default or something on
those lines

> 
> Signed-off-by: Shane Wang <shane.wang@intel.com>
> ---
>  .../iptables/iptables/GNUmakefile.patch            |   18 ++++++++++++++++++
>  .../{iptables_1.4.12.1.bb => iptables_1.4.12.2.bb} |    7 ++++---
>  2 files changed, 22 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-extended/iptables/iptables/GNUmakefile.patch
>  rename meta/recipes-extended/iptables/{iptables_1.4.12.1.bb => iptables_1.4.12.2.bb} (88%)
> 
> diff --git a/meta/recipes-extended/iptables/iptables/GNUmakefile.patch b/meta/recipes-extended/iptables/iptables/GNUmakefile.patch
> new file mode 100644
> index 0000000..c60e84f
> --- /dev/null
> +++ b/meta/recipes-extended/iptables/iptables/GNUmakefile.patch
> @@ -0,0 +1,18 @@
> +Don't check unknown symbols.
> +
> +Signed-off-by: Shane Wang <shane.wang@intel.com>
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +diff -r abb89394ce0c extensions/GNUmakefile.in
> +--- a/extensions/GNUmakefile.in	Mon Jan 23 00:12:27 2012 +0800
> ++++ b/extensions/GNUmakefile.in	Mon Jan 23 00:38:32 2012 +0800
> +@@ -68,7 +68,7 @@
> + 
> + .PHONY: all install clean distclean FORCE
> + 
> +-all: ${targets} check
> ++all: ${targets}
> + 
> + check: ${targets}
> + 	@echo "  CHECK    unknown symbols in .so files"; \
> diff --git a/meta/recipes-extended/iptables/iptables_1.4.12.1.bb b/meta/recipes-extended/iptables/iptables_1.4.12.2.bb
> similarity index 88%
> rename from meta/recipes-extended/iptables/iptables_1.4.12.1.bb
> rename to meta/recipes-extended/iptables/iptables_1.4.12.2.bb
> index 52aa4d5..2d3d311 100644
> --- a/meta/recipes-extended/iptables/iptables_1.4.12.1.bb
> +++ b/meta/recipes-extended/iptables/iptables_1.4.12.2.bb
> @@ -21,10 +21,11 @@ RRECOMMENDS_${PN} = "kernel-module-x-tables \
>  FILES_${PN} =+ "${libdir}/xtables/"
>  FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
>  
> -SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2"
> +SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
> +           file://GNUmakefile.patch"
>  
> -SRC_URI[md5sum] = "b08a1195ec2c1ebeaf072db3c55fdf43"
> -SRC_URI[sha256sum] = "77e6581f21f15946a814fa311236e5f3f7c6593180f9d695cea06aa95e464aba"
> +SRC_URI[md5sum] = "212112389c7f10c72efb31a4ed193a4c"
> +SRC_URI[sha256sum] = "09fff7dfe6af95675474fd5d0fc67622fac5a0f3d6e02ee614deae9a2e5dae13"
>  
>  inherit autotools
>  
> -- 
> 1.7.6
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


