Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SuHjR-00057c-0N
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 08:39:33 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 25 Jul 2012 23:28:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127035956"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by AZSMGA002.ch.intel.com with ESMTP; 25 Jul 2012 23:28:00 -0700
Message-ID: <5010E3CF.3060709@intel.com>
Date: Thu, 26 Jul 2012 09:29:35 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 06:39:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

it does not build, it complains about nothing providing dbus-x11

Radu

On 07/26/2012 09:17 AM, Radu Moisan wrote:
> Followed suggestions from Bugz 2261:
>
> 1) remove the --with-x/--without-x configure arguments. If you want to force
> no-discovery for native builds the correct argument is --disable-x11-autolaunch.
> This ensures that DBus looks at the build environment to determine whether to
> enable X11 bus discovery or not.
>
> 2) make the virtual/libx11 DEPENDS conditional based on the x11 distro feature.
> This makes the build dependencies reflect the feature list.
>
> 3) remove dbus-x11, meaning that dbus-launch with its potential X11 dependency
> is now back in dbus where is belongs.
>
> 4) Potentially make dbus provide dbus-x11, for compatibility.
>
> Fixes [Yocto #2261]
>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   meta/recipes-core/dbus/dbus.inc |   11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index a75583d..9559f6f 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -31,10 +31,10 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
>   
>   DEBIANNAME_${PN} = "dbus-1"
>   
> -PACKAGES =+ "${PN}-lib ${PN}-systemd ${@base_contains('DISTRO_FEATURES', 'x11', '${PN}-x11', '', d)}"
> +PACKAGES =+ "${PN}-lib ${PN}-systemd"
>   
> -FILES_${PN}-x11 = "${bindir}/dbus-launch"
> -RDEPENDS_${PN}-x11 = "${PN}"
> +# for compatibility
> +RREPLACES_${PN} += "dbus-x11"
>   
>   FILES_${PN}-systemd = "${systemd_unitdir}/system/"
>   
> @@ -43,6 +43,7 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
>                  ${bindir}/dbus-cleanup-sockets \
>                  ${bindir}/dbus-send \
>                  ${bindir}/dbus-monitor \
> +               ${bindir}/dbus-launch \
>                  ${libexecdir}/dbus* \
>                  ${sysconfdir} \
>                  ${localstatedir} \
> @@ -58,8 +59,8 @@ pkg_postinst_dbus() {
>   	fi
>   }
>   
> -EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
> -EXTRA_OECONF_X_virtclass-native = "--without-x"
> +EXTRA_OECONF_X = ""
> +EXTRA_OECONF_X_virtclass-native = "--disable-x11-autolaunch"
>   
>   EXTRA_OECONF = "--disable-tests \
>                   --disable-checks \



