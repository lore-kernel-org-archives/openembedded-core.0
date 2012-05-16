Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1SUYLe-0005k4-5r
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 09:08:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4G6wZGw012885
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 23:58:36 -0700 (PDT)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 15 May 2012 23:58:35 -0700
Message-ID: <4FB34FA9.7010009@windriver.com>
Date: Wed, 16 May 2012 14:56:41 +0800
From: Jesse Zhang <sen.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111110 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336980383-11201-1-git-send-email-sen.zhang@windriver.com>
In-Reply-To: <1336980383-11201-1-git-send-email-sen.zhang@windriver.com>
X-Originating-IP: [128.224.162.230]
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH] wpa-supplicant: don't reset ${S}
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
X-List-Received-Date: Wed, 16 May 2012 07:08:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Please ignore this one.

I found I could just use the "patchdir" parameter.

jesse

On 05/14/2012 03:26 PM, Jesse Zhang wrote:
> If ${S} is set to the subdir wpa_supplicant, patches with changes in
> other subdirs can't be applied. Fix ${S} so patches can be applied in
> the normal way.
> 
> Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
> ---
> 
> I was adding a patch to wpa-supplicant using bbappend in our layer, but it was
> impossible since ${S} was overridden and set to a subdir in the unpacked
> source.
> 
> Jesse
> 
>  .../wpa-supplicant/wpa-supplicant-0.7.inc          |   15 +++++++++------
>  1 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> index aabb3df..1db4acf 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> @@ -3,9 +3,9 @@ HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
>  BUGTRACKER = "http://hostap.epitest.fi/bugz/"
>  SECTION = "network"
>  LICENSE = "GPLv2 | BSD"
> -LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
> -                    file://../README;md5=54cfc88015d3ce83f7156e63c6bb1738 \
> -                    file://wpa_supplicant.c;beginline=1;endline=17;md5=acdc5a4b0d6345f21f136eace747260e"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
> +                    file://README;md5=54cfc88015d3ce83f7156e63c6bb1738 \
> +                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=17;md5=acdc5a4b0d6345f21f136eace747260e"
>  DEPENDS = "gnutls dbus libnl"
>  RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
>  
> @@ -16,7 +16,7 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
>             file://wpa_supplicant.conf-sane \
>             file://99_wpa_supplicant"
>  
> -S = "${WORKDIR}/wpa_supplicant-${PV}/wpa_supplicant"
> +S = "${WORKDIR}/wpa_supplicant-${PV}/"
>  
>  PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
>  FILES_wpa-supplicant-passphrase = "${sbindir}/wpa_passphrase"
> @@ -24,16 +24,19 @@ FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
>  FILES_${PN} += "${datadir}/dbus-1/system-services/*"
>  
>  do_configure () {
> +	cd wpa_supplicant
>  	install -m 0755 ${WORKDIR}/defconfig-gnutls .config
>  }
>  
>  export EXTRA_CFLAGS = "${CFLAGS}"
>  do_compile () {
> +	cd wpa_supplicant
>  	unset CFLAGS CPPFLAGS CXXFLAGS
>  	oe_runmake
>  }
>  
>  do_install () {
> +	cd wpa_supplicant
>  	install -d ${D}${sbindir}
>  	install -m 755 wpa_supplicant ${D}${sbindir}
>  	install -m 755 wpa_cli        ${D}${sbindir}
> @@ -56,9 +59,9 @@ do_install () {
>  	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
>  
>  	install -d ${D}/${sysconfdir}/dbus-1/system.d
> -	install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
> +	install -m 644 ${S}/wpa_supplicant/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
>  	install -d ${D}/${datadir}/dbus-1/system-services
> -	install -m 644 ${S}/dbus/*.service ${D}/${datadir}/dbus-1/system-services
> +	install -m 644 ${S}/wpa_supplicant/dbus/*.service ${D}/${datadir}/dbus-1/system-services
>  	sed -i -e s:${base_sbindir}:${sbindir}:g ${D}/${datadir}/dbus-1/system-services/*.service
>  
>  	install -d ${D}/etc/default/volatiles


