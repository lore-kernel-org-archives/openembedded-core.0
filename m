Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPIQm-0004AJ-SI
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 21:08:13 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 May 2012 11:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="135814944"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2012 11:58:28 -0700
Message-ID: <4FA03254.5030706@linux.intel.com>
Date: Tue, 01 May 2012 11:58:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1335478762-14532-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1335478762-14532-1-git-send-email-obi@opendreambox.org>
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
X-List-Received-Date: Tue, 01 May 2012 19:08:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/26/2012 03:19 PM, Andreas Oberritter wrote:
> * Set lists_dir to /var/lib/opkg
>
>    commit 16808bc4817492beba512f4e73bce8c232d1eafa
>    Author: Marcin Juszkiewicz<hrw@openembedded.org>
>    Date:   Mon Mar 17 23:40:48 2008 +0000
>
> * Update new options sample and move the opkg.conf to correct place
>
>    commit cc9825d97962287df75e164aec456901292e1b7f
>    Author: Tick Chen<ticktock35@gmail.com>
>    Date:   Mon Dec 29 19:41:47 2008 +0800
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   meta/recipes-devtools/opkg/opkg-collateral.bb      |    8 +++++---
>   meta/recipes-devtools/opkg/opkg-collateral/lists   |    2 +-
>   .../opkg/opkg-collateral/opkg.conf.comments        |    3 +++
>   3 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/opkg/opkg-collateral.bb b/meta/recipes-devtools/opkg/opkg-collateral.bb
> index e3e0b5f..251c535 100644
> --- a/meta/recipes-devtools/opkg/opkg-collateral.bb
> +++ b/meta/recipes-devtools/opkg/opkg-collateral.bb
> @@ -2,6 +2,8 @@ DESCRIPTION = "opkg configuration files"
>   SECTION = "base"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +PR = "r1"
> +
>   SRC_URI = "file://opkg.conf.comments \
>   	   file://lists \
>   	   file://dest \
> @@ -15,8 +17,8 @@ do_compile () {
>   }
>
>   do_install () {
> -	install -d ${D}${sysconfdir}/
> -	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg.conf
> +	install -d ${D}${sysconfdir}/opkg
> +	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
>   }
>
> -CONFFILES_${PN} = "${sysconfdir}/opkg.conf"
> +CONFFILES_${PN} = "${sysconfdir}/opkg/opkg.conf"
> diff --git a/meta/recipes-devtools/opkg/opkg-collateral/lists b/meta/recipes-devtools/opkg/opkg-collateral/lists
> index 3c524f8..f8aecd8 100644
> --- a/meta/recipes-devtools/opkg/opkg-collateral/lists
> +++ b/meta/recipes-devtools/opkg/opkg-collateral/lists
> @@ -1,2 +1,2 @@
> -lists_dir ext /var/lib/ipkg
> +lists_dir ext /var/lib/opkg
>
> diff --git a/meta/recipes-devtools/opkg/opkg-collateral/opkg.conf.comments b/meta/recipes-devtools/opkg/opkg-collateral/opkg.conf.comments
> index 51623f4..e1fdada 100644
> --- a/meta/recipes-devtools/opkg/opkg-collateral/opkg.conf.comments
> +++ b/meta/recipes-devtools/opkg/opkg-collateral/opkg.conf.comments
> @@ -18,6 +18,9 @@
>   #option proxy_username<username>
>   #option proxy_password<password>
>
> +# Enable GPGME signature
> +# option check_signature 1
> +
>   # Offline mode (for use in constructing flash images offline)
>   #option offline_root target
>

Merged into OE-Core

Thanks
	Sau!


