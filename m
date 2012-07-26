Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SuJph-0003On-Lf
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 10:54:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2012 01:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="186606033"
Received: from unknown (HELO helios.localnet) ([10.252.121.37])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2012 01:42:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 26 Jul 2012 09:42:36 +0100
Message-ID: <1756274.ud5AYazWdz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 26 Jul 2012 08:54:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 26 July 2012 10:08:49 Koen Kooi wrote:
> Op 26 jul. 2012, om 08:29 heeft Radu Moisan <radu.moisan@intel.com> het
> > volgende geschreven:
> > it does not build, it complains about nothing providing dbus-x11
> > 
> > Radu
> > 
> > On 07/26/2012 09:17 AM, Radu Moisan wrote:
> >> Followed suggestions from Bugz 2261:
> >> 
> >> 1) remove the --with-x/--without-x configure arguments. If you want to
> >> force no-discovery for native builds the correct argument is
> >> --disable-x11-autolaunch. This ensures that DBus looks at the build
> >> environment to determine whether to enable X11 bus discovery or not.
> >> 
> >> 2) make the virtual/libx11 DEPENDS conditional based on the x11 distro
> >> feature. This makes the build dependencies reflect the feature list.
> >> 
> >> 3) remove dbus-x11, meaning that dbus-launch with its potential X11
> >> dependency is now back in dbus where is belongs.
> >> 
> >> 4) Potentially make dbus provide dbus-x11, for compatibility.
> >> 
> >> Fixes [Yocto #2261]
> >> 
> >> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> >> ---
> >> 
> >>  meta/recipes-core/dbus/dbus.inc |   11 ++++++-----
> >>  1 file changed, 6 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/meta/recipes-core/dbus/dbus.inc
> >> b/meta/recipes-core/dbus/dbus.inc index a75583d..9559f6f 100644
> >> --- a/meta/recipes-core/dbus/dbus.inc
> >> +++ b/meta/recipes-core/dbus/dbus.inc
> >> @@ -31,10 +31,10 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf
> >> ${sysconfdir}/dbus-1/session>> 
> >>    DEBIANNAME_${PN} = "dbus-1"
> >>  
> >>  -PACKAGES =+ "${PN}-lib ${PN}-systemd
> >>  ${@base_contains('DISTRO_FEATURES', 'x11', '${PN}-x11', '', d)}">> 
> >> +PACKAGES =+ "${PN}-lib ${PN}-systemd"
> >> 
> >>  -FILES_${PN}-x11 = "${bindir}/dbus-launch"
> >> 
> >> -RDEPENDS_${PN}-x11 = "${PN}"
> >> +# for compatibility
> 
> PROVIDES += "dbus-x11"
> 
> >> +RREPLACES_${PN} += "dbus-x11"
> 
> RPROVIDES_${PN} += "dbus-x11"

For the sake of clarity, you mean both of these, not RPROVIDES instead of 
adding RREPLACES - right?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


