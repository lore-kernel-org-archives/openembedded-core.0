Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLwgR-0000Wy-66 for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 13:46:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA3Ce4XV027530
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Nov 2011 12:40:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27251-02 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2011 12:39:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA3CdpWN027516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Nov 2011 12:39:53 GMT
Message-ID: <1320323991.20107.49.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 Nov 2011 12:39:51 +0000
In-Reply-To: <22CC451F-6D62-44A0-8984-489D40859F17@dominion.thruhere.net>
References: <cover.1320191934.git.sgw@linux.intel.com>
	<9ef4f9a56a7d68c636768d2a1dbfeb9d6542b5f4.1320191934.git.sgw@linux.intel.com>
	<22CC451F-6D62-44A0-8984-489D40859F17@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Pull v3 1/4] avahi: use useradd to create avahi user for avahi-daemon
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
X-List-Received-Date: Thu, 03 Nov 2011 12:46:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-03 at 13:23 +0100, Koen Kooi wrote:
> Op 2 nov. 2011, om 01:21 heeft Saul Wold het volgende geschreven:
> 
> > DBus was failing to start correct since the avahi user was
> > not setup.
> > 
> > Keep the dbus reload since this could still be installed
> > as a package an would require a dbus restart.
> 
> This doesn't seem to work for me, I keep getting "Unknown username
> 'avahi' in message bus configuration file"

From where? On target device upgrade? do_rootfs? populate_sysroot? More
info would be useful here.

> > Fixes: [YOCTO #1699]
> > 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> > meta/recipes-connectivity/avahi/avahi.inc |   16 +++++++++-------
> > 1 files changed, 9 insertions(+), 7 deletions(-)
> > 
> > diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> > index 5ad9db0..79cfd73 100644
> > --- a/meta/recipes-connectivity/avahi/avahi.inc
> > +++ b/meta/recipes-connectivity/avahi/avahi.inc
> > @@ -14,7 +14,7 @@ SECTION = "network"
> > # python scripts are under GPLv2+
> > LICENSE = "GPLv2+ & LGPLv2.1+"
> > 
> > -INC_PR = "r8"
> > +INC_PR = "r9"
> > 
> > DEPENDS = "expat libcap libdaemon dbus glib-2.0"
> > 
> > @@ -23,7 +23,12 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
> >           file://99avahi-autoipd \
> >           file://initscript.patch"
> > 
> > -inherit autotools pkgconfig update-rc.d gettext
> > +USERADD_PACKAGES = "${PN}-daemon"
> > +USERADD_PARAM_${PN}-daemon = "--system --home /var/run/avahi-daemon \
> > +                              --no-create-home --shell /bin/false \
> > +                              --user-group avahi"
> > +
> > +inherit autotools pkgconfig update-rc.d gettext useradd
> > 
> > EXTRA_OECONF = "--with-distro=debian \
> >              --disable-introspection \
> > @@ -116,15 +121,12 @@ do_install_avahi-autoipd() {
> > 	install ${WORKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
> > }
> > 
> > -# At the time the postinst runs, dbus might not be setup so only restart if running
> > +# At the time the postinst runs, dbus might not be setup so only restart if running 
> > 
> > pkg_postinst_avahi-daemon () {
> > -	# can't do this offline
> > 	if [ "x$D" != "x" ]; then
> > -		exit 1
> > +		exit 0
> > 	fi
> 
> Removing that check completely would be a better idea :)

No it wouldn't, if we're installing this at do_rootfs time, we can just
mark the postinstall as done.

Cheers,

Richard



