Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qt0hx-0007ic-VG
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 19:12:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 10:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,375,1309762800"; d="scan'208";a="41638505"
Received: from unknown (HELO [10.255.14.242]) ([10.255.14.242])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2011 10:07:36 -0700
Message-ID: <4E495258.1030708@linux.intel.com>
Date: Mon, 15 Aug 2011 10:07:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313164784.6733.165.camel@phil-desktop>
In-Reply-To: <1313164784.6733.165.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: dbus: only use x11 if DISTRO_FEATURES has selected it
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
X-List-Received-Date: Mon, 15 Aug 2011 17:12:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2011 08:59 AM, Phil Blundell wrote:
> This makes it possible to include dbus in a non-X11-equipped DISTRO.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-core/dbus/dbus.inc |    7 ++++---
>   1 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index 6b76cba..a8ecda8 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -5,7 +5,8 @@ SECTION = "base"
>   LICENSE = "AFL-2 | GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>                       file://dbus/dbus.h;firstline=6;endline=20;md5=6eea2e0c7750dd8e620dcb1437312fa5"
> -DEPENDS = "expat virtual/libintl virtual/libx11 libsm"
> +X11DEPENDS = "virtual/libx11 libsm"
> +DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
>   DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
>   DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
>
> @@ -22,7 +23,7 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
>
>   DEBIANNAME_${PN} = "dbus-1"
>
> -PACKAGES =+ "${PN}-lib ${PN}-x11 ${PN}-systemd"
> +PACKAGES =+ "${PN}-lib ${PN}-systemd ${@base_contains('DISTRO_FEATURES', 'x11', '${PN}-x11', '', d)}"
>
>   FILES_${PN}-x11 = "${bindir}/dbus-launch"
>   RDEPENDS_${PN}-x11 = "${PN}"
> @@ -73,7 +74,7 @@ pkg_postinst_dbus() {
>   	fi
>   }
>
> -EXTRA_OECONF_X = "--with-x"
> +EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
>   EXTRA_OECONF_X_virtclass-native = "--without-x"
>
>   EXTRA_OECONF = "--disable-tests \

Merged into OE-Core

Thanks
	Sau!


