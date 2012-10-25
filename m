Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1TRExA-00027C-Ah
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 06:21:56 +0200
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCF007ANKU2SU40@vms173009.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 23:08:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BE4EA20077; Thu,
	25 Oct 2012 00:08:26 -0400 (EDT)
Date: Thu, 25 Oct 2012 00:08:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20121025040826.GG3465@denix.org>
References: <1313164784.6733.165.camel@phil-desktop>
MIME-version: 1.0
In-reply-to: <1313164784.6733.165.camel@phil-desktop>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: dbus: only use x11 if DISTRO_FEATURES has selected it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Oct 2012 04:21:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Aug 12, 2011 at 04:59:43PM +0100, Phil Blundell wrote:
> This makes it possible to include dbus in a non-X11-equipped DISTRO.

I have a follow up question on this old change...


> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-core/dbus/dbus.inc |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index 6b76cba..a8ecda8 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -5,7 +5,8 @@ SECTION = "base"
>  LICENSE = "AFL-2 | GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>                      file://dbus/dbus.h;firstline=6;endline=20;md5=6eea2e0c7750dd8e620dcb1437312fa5"
> -DEPENDS = "expat virtual/libintl virtual/libx11 libsm"
> +X11DEPENDS = "virtual/libx11 libsm"
> +DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
>  DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
>  DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"

Would there be any objections extending this DISTRO check to nativesdk as 
well?

-- 
Denys


>  
> @@ -22,7 +23,7 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
>  
>  DEBIANNAME_${PN} = "dbus-1"
>  
> -PACKAGES =+ "${PN}-lib ${PN}-x11 ${PN}-systemd"
> +PACKAGES =+ "${PN}-lib ${PN}-systemd ${@base_contains('DISTRO_FEATURES', 'x11', '${PN}-x11', '', d)}"
>  
>  FILES_${PN}-x11 = "${bindir}/dbus-launch"
>  RDEPENDS_${PN}-x11 = "${PN}"
> @@ -73,7 +74,7 @@ pkg_postinst_dbus() {
>  	fi
>  }
>  
> -EXTRA_OECONF_X = "--with-x"
> +EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
>  EXTRA_OECONF_X_virtclass-native = "--without-x"
>  
>  EXTRA_OECONF = "--disable-tests \
> -- 
> 1.7.4.1
> 
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


