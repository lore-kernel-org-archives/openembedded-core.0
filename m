Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sm9eq-00068f-Lm
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 22:25:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2012 13:14:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166504706"
Received: from unknown (HELO helios.localnet) ([10.252.120.234])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 13:14:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 03 Jul 2012 21:14:07 +0100
Message-ID: <1772332.Hc46G99qAB@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-26-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <1335478762-14532-1-git-send-email-obi@opendreambox.org>
References: <1335478762-14532-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
Subject: Re: [PATCH] opkg-collateral: import fixes from OE-Classic
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
X-List-Received-Date: Tue, 03 Jul 2012 20:25:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 27 April 2012 00:19:22 Andreas Oberritter wrote:
> * Set lists_dir to /var/lib/opkg
> 
>   commit 16808bc4817492beba512f4e73bce8c232d1eafa
>   Author: Marcin Juszkiewicz <hrw@openembedded.org>
>   Date:   Mon Mar 17 23:40:48 2008 +0000
> 
> * Update new options sample and move the opkg.conf to correct place
> 
>   commit cc9825d97962287df75e164aec456901292e1b7f
>   Author: Tick Chen <ticktock35@gmail.com>
>   Date:   Mon Dec 29 19:41:47 2008 +0800
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/recipes-devtools/opkg/opkg-collateral.bb      |    8 +++++---
>  meta/recipes-devtools/opkg/opkg-collateral/lists   |    2 +-
>  .../opkg/opkg-collateral/opkg.conf.comments        |    3 +++
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/opkg/opkg-collateral.bb
> b/meta/recipes-devtools/opkg/opkg-collateral.bb index e3e0b5f..251c535
> 100644
> --- a/meta/recipes-devtools/opkg/opkg-collateral.bb
> +++ b/meta/recipes-devtools/opkg/opkg-collateral.bb
> @@ -2,6 +2,8 @@ DESCRIPTION = "opkg configuration files"
>  SECTION = "base"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +PR = "r1"
> +
>  SRC_URI = "file://opkg.conf.comments \
>  	   file://lists \
>  	   file://dest \
> @@ -15,8 +17,8 @@ do_compile () {
>  }
> 
>  do_install () {
> -	install -d ${D}${sysconfdir}/
> -	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg.conf
> +	install -d ${D}${sysconfdir}/opkg
> +	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
>  }
> 
> -CONFFILES_${PN} = "${sysconfdir}/opkg.conf"
> +CONFFILES_${PN} = "${sysconfdir}/opkg/opkg.conf"
> diff --git a/meta/recipes-devtools/opkg/opkg-collateral/lists
> b/meta/recipes-devtools/opkg/opkg-collateral/lists index 3c524f8..f8aecd8
> 100644
> --- a/meta/recipes-devtools/opkg/opkg-collateral/lists
> +++ b/meta/recipes-devtools/opkg/opkg-collateral/lists
> @@ -1,2 +1,2 @@
> -lists_dir ext /var/lib/ipkg
> +lists_dir ext /var/lib/opkg

Unfortunately, it seems this change has caused bug 2595 - moving the config file 
to /etc/opkg means that it is always read regardless of whether -f is specified 
or not (as it is during do_rootfs in order to specify our own generated config 
file), and this means that after opkg-collateral is installed into the rootfs, 
this version of the config is used, resulting in opkg ignoring the lists it has 
already downloaded (since it now sees list_dir as var/lib/opkg instead of 
var/lib/opkg/lists) and thus it fails to install any of the "attemptonly" 
packages (including *-dev, *-dbg, etc.).

The question is, should opkg be fixed to not load anything from etc/opkg/ when 
-f is specified?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


