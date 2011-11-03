Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLyXw-0007CC-JA for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 15:45:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA3EdSkQ028555
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Nov 2011 14:39:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28034-04 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2011 14:39:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA3EdLS8028549
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Nov 2011 14:39:22 GMT
Message-ID: <1320331161.20107.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 Nov 2011 14:39:21 +0000
In-Reply-To: <86762F88-8EB9-47D0-B1F7-A867ADCCFB1C@dominion.thruhere.net>
References: <1320325020-19012-1-git-send-email-koen@dominion.thruhere.net>
	<86762F88-8EB9-47D0-B1F7-A867ADCCFB1C@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] avahi: fix useradd race condition
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
X-List-Received-Date: Thu, 03 Nov 2011 14:45:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-03 at 14:04 +0100, Koen Kooi wrote:
> Op 3 nov. 2011, om 13:57 heeft Koen Kooi het volgende geschreven:
> 
> > Avahi doesn't work at boot because of:
> > 
> > + sh /OE/../rootfs/var/lib/opkg/info/avahi-daemon.preinst
> > Running useradd commands...
> > grep: /OE/../rootfs/etc/passwd: No such file or directory
> > 
> > That is due to:
> > 
> > Package: avahi-daemon
> > Version: 0.6.30-r9.0
> > [..]
> > Depends: libavahi-core7 (>= 0.6.30), libdaemon0 (>= 0.14), libcap2 (>= 2.22), libavahi-common3 (>= 0.6.30), libdbus-1-3 (>= 1.4.12), sysvinit-pidof, libc6 (>= 2.12), libexpat1 (>= 2.0.1)
> > 
> > After this patch:
> > 
> > Package: avahi-daemon
> > Version: 0.6.30-r10.0
> > [..]
> > Depends: libavahi-core7 (>= 0.6.30), libdaemon0 (>= 0.14), libcap2 (>= 2.22), libavahi-common3 (>= 0.6.30), libdbus-1-3 (>= 1.4.12), sysvinit-pidof, libc6 (>= 2.12), shadow, libexpat1 (>= 2.0.1), base-passwd
> > 
> > This also changes ${PN}-daemon to avahi-daemon to be consistent with the PACKAGES/FILES lines below
> > 
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> > meta/recipes-connectivity/avahi/avahi.inc |    7 ++++---
> > 1 files changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> > index 79cfd73..728c38f 100644
> > --- a/meta/recipes-connectivity/avahi/avahi.inc
> > +++ b/meta/recipes-connectivity/avahi/avahi.inc
> > @@ -14,7 +14,7 @@ SECTION = "network"
> > # python scripts are under GPLv2+
> > LICENSE = "GPLv2+ & LGPLv2.1+"
> > 
> > -INC_PR = "r9"
> > +INC_PR = "r10"
> > 
> > DEPENDS = "expat libcap libdaemon dbus glib-2.0"
> > 
> > @@ -23,8 +23,9 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
> >           file://99avahi-autoipd \
> >           file://initscript.patch"
> > 
> > -USERADD_PACKAGES = "${PN}-daemon"
> > -USERADD_PARAM_${PN}-daemon = "--system --home /var/run/avahi-daemon \
> > +USERADDPN = "avahi-daemon"
> 
> My gut feeling is that useradd.bbclass should add the RDEPENDS in its
> pythoncode instead of relying on people to set both USERADD_PACKAGES
> and USERADDPN to the same value.

Agreed, looking at the code I think we can make this easier on the user.
I'll take the fix to solve the short term issues but we could do with
improving this.

Cheers,

Richard



