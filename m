Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QUkCb-0005Sa-OA
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 20:43:34 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2011 11:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,342,1304319600"; d="scan'208";a="16292759"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2011 11:40:12 -0700
Message-ID: <4DF1138C.5050202@linux.intel.com>
Date: Thu, 09 Jun 2011 11:40:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1307534773-30707-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1307534773-30707-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] avahi: fix dbus system-service packaging and move	more things to .inc
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
X-List-Received-Date: Thu, 09 Jun 2011 18:43:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2011 05:06 AM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-connectivity/avahi/avahi.inc       |   23 +++++++++++++++--------
>   meta/recipes-connectivity/avahi/avahi_0.6.30.bb |    9 +--------
>   2 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index 9e26a20..2ab037e 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -17,14 +17,10 @@ LICENSE = "GPLv2+&  LGPLv2.1+"
>
>   DEPENDS = "expat libcap libdaemon dbus glib-2.0 gtk+ libglade"
>
> -# uclibc has no nss
> -RRECOMMENDS_avahi-daemon_append_libc-glibc = "libnss-mdns"
> -RRECOMMENDS_${PN}_append_libc-glibc = "libnss-mdns"
> -
>   SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
> -        file://00avahi-autoipd \
> -        file://99avahi-autoipd \
> -        file://initscript.patch"
> +          file://00avahi-autoipd \
> +          file://99avahi-autoipd \
> +          file://initscript.patch"
>
>   inherit autotools pkgconfig update-rc.d gettext
>
> @@ -34,6 +30,7 @@ EXTRA_OECONF = "--with-distro=debian \
>                --disable-gdbm \
>                --disable-mono \
>                --disable-monodoc \
> +             --disable-gtk3 \
>                --disable-qt3 \
>                --disable-qt4 \
>                --disable-python \
> @@ -64,6 +61,15 @@ pkg_postrm_avahi-systemd() {
>   	systemctl disable avahi-daemon.service
>   }
>
> +# uclibc has no nss
> +RRECOMMENDS_avahi-daemon_append_libc-glibc = "libnss-mdns"
> +RRECOMMENDS_${PN}_append_libc-glibc = "libnss-mdns"
> +
> +RDEPENDS_avahi-daemon = "sysvinit-pidof"
> +
> +FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
> +                       ${sysconfdir}/avahi/avahi-autoipd.action \
> +                       ${sysconfdir}/dhcp3/*/avahi-autoipd"
>   FILES_libavahi-common = "${libdir}/libavahi-common.so.*"
>   FILES_libavahi-core = "${libdir}/libavahi-core.so.*"
>   FILES_libavahi-ui = "${libdir}/libavahi-ui.so.*"
> @@ -78,7 +84,8 @@ FILES_avahi-daemon = "${sbindir}/avahi-daemon \
>                         ${sysconfdir}/init.d/avahi-daemon \
>                         ${datadir}/avahi/introspection/*.introspect \
>                         ${datadir}/avahi/avahi-service.dtd \
> -                      ${datadir}/avahi/service-types"
> +                      ${datadir}/avahi/service-types \
> +                      ${datadir}/dbus-1/system-services"
>   FILES_libavahi-client = "${libdir}/libavahi-client.so.*"
>   FILES_avahi-dnsconfd = "${sbindir}/avahi-dnsconfd \
>                           ${sysconfdir}/avahi/avahi-dnsconfd.action \
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
> index 23c0fa0..05716d0 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
> @@ -6,14 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>                       file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
>                       file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
>
> -RDEPENDS_avahi-daemon = "sysvinit-pidof"
> -PR = "r3"
> -
> -EXTRA_OECONF += "--disable-gtk3"
> -
> -FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
> -                       ${sysconfdir}/avahi/avahi-autoipd.action \
> -		       ${sysconfdir}/dhcp3/*/avahi-autoipd"
> +PR = "r4"
>
>   SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
>   SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"


Merged into OE-Core

Thanks
	Sau!



