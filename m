Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXxiW-0004jH-Nz
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 18:50:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 May 2012 09:39:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148463388"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 25 May 2012 09:39:59 -0700
Message-ID: <4FBFB5DF.7020806@linux.intel.com>
Date: Fri, 25 May 2012 09:39:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337868551-6674-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1337868551-6674-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] wpa-supplicant: add wpa_supplicant.conf to CONFFILES and don't install it twice
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
X-List-Received-Date: Fri, 25 May 2012 16:50:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/24/2012 07:09 AM, Martin Jansa wrote:
> * first we install ${WORKDIR}/wpa_supplicant.conf-sane
>    install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane ${D}${sysconfdir}/wpa_supplicant.conf
>    and a bit later in do_install we were overwritting it with ${WORKDIR}/wpa_supplicant.conf
>    install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}
> * notice that this patch also changes .conf permissions from 644 back to 600
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   .../wpa-supplicant/wpa-supplicant-0.7.inc          |    2 +-
>   .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> index b489893..efd1a66 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> @@ -22,6 +22,7 @@ PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
>   FILES_wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
>   FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
>   FILES_${PN} += "${datadir}/dbus-1/system-services/*"
> +CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
>
>   do_configure () {
>   	install -m 0755 ${WORKDIR}/defconfig-gnutls .config
> @@ -50,7 +51,6 @@ do_install () {
>   	install -d ${D}${sysconfdir}/network/if-pre-up.d/
>   	install -d ${D}${sysconfdir}/network/if-post-down.d/
>   	install -d ${D}${sysconfdir}/network/if-down.d/
> -	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}
>   	install -m 755 ${WORKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
>   	cd ${D}${sysconfdir}/network/&&  \
>   	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
> index 1e0086a..7bbb8c0 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
> @@ -1,6 +1,6 @@
>   require wpa-supplicant-0.7.inc
>
> -PR = "r10"
> +PR = "r11"
>
>   SRC_URI[md5sum] = "f516f191384a9a546e3f5145c08addda"
>   SRC_URI[sha256sum] = "d0cd50caa85346ccc376dcda5ed3c258eef19a93b3cade39d25760118ad59443"

Merged into OE-Core

Thanks
	Sau!


