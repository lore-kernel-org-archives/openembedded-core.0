Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R10VX-0004Rh-Ck
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 20:36:27 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R10Qh-00025r-IW
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 20:31:27 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110906092043.GI31057@jama.jama.net>
References: <20110906092043.GI31057@jama.jama.net>
Date: Tue, 06 Sep 2011 19:30:31 +0100
Message-ID: <1315333831.3091.6.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: Tinylogin or shadow?
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
X-List-Received-Date: Tue, 06 Sep 2011 18:36:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-09-06 at 11:20 +0200, Martin Jansa wrote:
> Hi,
>=20
> if someone wants to use only shadow as login manager, then all postinst
> calling adduser (instead of useradd) are failing ie:
>=20
> recipes-connectivity/avahi/avahi.inc:   grep "^avahi:" /etc/passwd > /dev=
/null || adduser --disabled-password --system --home /var/run/avahi-daemon =
--no-create-home avahi --ingroup avahi -g Avahi
> recipes-connectivity/avahi/avahi.inc:   grep "^avahi-autoipd:" /etc/passw=
d > /dev/null || adduser --disabled-password --system --home /var/lib/avahi=
-autoipd --no-create-home avahi-autoipd --ingroup avahi-autoipd -g "Avahi a=
utoip daemon"
> recipes-connectivity/openssh/openssh_5.8p2.bb:          adduser --system =
--home /var/run/sshd --no-create-home --disabled-password --ingroup sshd -s=
 /bin/false sshd
> recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb:      adduser --system =
--home /dev/null --no-create-home --empty-password --ingroup nogroup -s ${s=
bindir}/ppp-dialin ppp
> recipes-core/dbus/dbus.inc:             adduser --system --home "$MESSAGE=
HOME" --no-create-home --disabled-password \
> recipes-devtools/distcc/distcc_2.18.3.bb:               grep distcc /etc/=
passwd || adduser --system --home /dev/null --no-create-home --empty-passwo=
rd --ingroup nogroup distcc
> recipes-graphics/x11-common/xserver-nodm-init.bb:        adduser --disabl=
ed-password $username
> recipes-multimedia/pulseaudio/pulseaudio.inc:            adduser --disabl=
ed-password --home=3D/var/run/pulse --system \
> recipes-support/hal/hal.inc:    grep haldaemon /etc/passwd || adduser --d=
isabled-password --system --home /var/run/hald --no-create-home haldaemon -=
-ingroup haldaemon -g HAL
>=20
> What is preferred fix,

I guess the first part of any preferred fix is going to have to be to
get the postinsts to be consistent about what mechanism they use for
adding users, rather than the m=C3=A9lange of different approaches that we
seem to have today.  Ideally I think that would be by means of making
the recipes in question use useradd.bbclass.  It might also be
reasonable to extend useradd.bbclass to work with tinylogin and/or
busybox's implementations of useradd if it doesn't already.

If there are recipes which can't use useradd.bbclass for whatever reason
then I guess they should be adjusted to call useradd rather than
adduser, since the former is the more standardized of the two.

As for tinylogin's adduser, I am inclined to say that it should probably
just go away in favour of a wrapper around (ideally a generic) useradd.

> I plan to add u-a to shadow to provide adduser alternative=20
> or add RCONFLICT between tinylogin and shadow as we don't want some passw=
d entries
> from tinylogin and some from shadow (when both installed at the same time=
.
> Someone with better idea or even patches for it?

=46rom the list of files you mentioned, it sounds as though the packages
do conflict with each other at the moment (e.g. on ${bindir}/su) so
adding RCONFLICTS is probably reasonable.=20

p.




