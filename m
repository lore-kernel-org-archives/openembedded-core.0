Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW6Mp-0006hg-N1
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 14:08:01 +0100
Received: by ggnh1 with SMTP id h1so1782550ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 05:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=abNaekYWm+B/D6VgKGKQy0pzLthY6hf6NlnsYMWCMNU=;
	b=fxFPZIn4a45A/gA2rzuKWUfnZ/o5eRRdqIPBMo4D3WMJgzrvX7hr/1pReSa5oUnEfO
	9UzM+VwgjQ2PqlXR3YEhqlHr3U6mX89rcbQAPCHPcScnqlvlui/4/dogbTcdITSBPu+U
	MTa9hnc0auxELkso8NJJId0zM9fhU63TFfuXc=
Received: by 10.205.129.147 with SMTP id hi19mr7216591bkc.102.1322744477191;
	Thu, 01 Dec 2011 05:01:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p13sm11215668bkd.4.2011.12.01.05.01.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 05:01:14 -0800 (PST)
Date: Thu, 1 Dec 2011 14:01:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111201130112.GE19917@jama.jama.net>
References: <20110906092043.GI31057@jama.jama.net>
	<1315333831.3091.6.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1315333831.3091.6.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Thu, 01 Dec 2011 13:08:02 -0000
X-Groupsio-MsgNum: 13438
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y2zxS2PfCDLh6JVG"
Content-Disposition: inline

--y2zxS2PfCDLh6JVG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2011 at 07:30:31PM +0100, Phil Blundell wrote:
> On Tue, 2011-09-06 at 11:20 +0200, Martin Jansa wrote:
> > Hi,
> >=20
> > if someone wants to use only shadow as login manager, then all postinst
> > calling adduser (instead of useradd) are failing ie:
> >=20
> > recipes-connectivity/avahi/avahi.inc:   grep "^avahi:" /etc/passwd > /d=
ev/null || adduser --disabled-password --system --home /var/run/avahi-daemo=
n --no-create-home avahi --ingroup avahi -g Avahi
> > recipes-connectivity/avahi/avahi.inc:   grep "^avahi-autoipd:" /etc/pas=
swd > /dev/null || adduser --disabled-password --system --home /var/lib/ava=
hi-autoipd --no-create-home avahi-autoipd --ingroup avahi-autoipd -g "Avahi=
 autoip daemon"
> > recipes-connectivity/openssh/openssh_5.8p2.bb:          adduser --syste=
m --home /var/run/sshd --no-create-home --disabled-password --ingroup sshd =
-s /bin/false sshd
> > recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb:      adduser --syste=
m --home /dev/null --no-create-home --empty-password --ingroup nogroup -s $=
{sbindir}/ppp-dialin ppp
> > recipes-core/dbus/dbus.inc:             adduser --system --home "$MESSA=
GEHOME" --no-create-home --disabled-password \
> > recipes-devtools/distcc/distcc_2.18.3.bb:               grep distcc /et=
c/passwd || adduser --system --home /dev/null --no-create-home --empty-pass=
word --ingroup nogroup distcc
> > recipes-graphics/x11-common/xserver-nodm-init.bb:        adduser --disa=
bled-password $username
> > recipes-multimedia/pulseaudio/pulseaudio.inc:            adduser --disa=
bled-password --home=3D/var/run/pulse --system \
> > recipes-support/hal/hal.inc:    grep haldaemon /etc/passwd || adduser -=
-disabled-password --system --home /var/run/hald --no-create-home haldaemon=
 --ingroup haldaemon -g HAL
> >=20
> > What is preferred fix,
>=20
> I guess the first part of any preferred fix is going to have to be to
> get the postinsts to be consistent about what mechanism they use for
> adding users, rather than the m=E9lange of different approaches that we
> seem to have today.  Ideally I think that would be by means of making
> the recipes in question use useradd.bbclass.  It might also be
> reasonable to extend useradd.bbclass to work with tinylogin and/or
> busybox's implementations of useradd if it doesn't already.
>=20
> If there are recipes which can't use useradd.bbclass for whatever reason
> then I guess they should be adjusted to call useradd rather than
> adduser, since the former is the more standardized of the two.
>=20
> As for tinylogin's adduser, I am inclined to say that it should probably
> just go away in favour of a wrapper around (ideally a generic) useradd.

just small update on this, from my original list only 2 recipes are
still not using useradd.bbclass:

recipes-connectivity/avahi/avahi.inc:   grep "^avahi:" /etc/passwd > /dev/n=
ull || adduser --disabled-password --system --home /var/run/avahi-daemon --=
no-create-home avahi --ingroup avahi -g Avahi
recipes-connectivity/avahi/avahi.inc:   grep "^avahi-autoipd:" /etc/passwd =
> /dev/null || adduser --disabled-password --system --home /var/lib/avahi-a=
utoipd --no-create-home avahi-autoipd --ingroup avahi-autoipd -g "Avahi aut=
oip daemon"
recipes-devtools/distcc/distcc_2.18.3.bb:               grep distcc /etc/pa=
sswd || adduser --system --home /dev/null --no-create-home --empty-password=
 --ingroup nogroup distcc

Is someone using them? Any volunteer to migrate them and test them?

Cheers,

> > I plan to add u-a to shadow to provide adduser alternative=20
> > or add RCONFLICT between tinylogin and shadow as we don't want some pas=
swd entries
> > from tinylogin and some from shadow (when both installed at the same ti=
me.
> > Someone with better idea or even patches for it?
>=20
> From the list of files you mentioned, it sounds as though the packages
> do conflict with each other at the moment (e.g. on ${bindir}/su) so
> adding RCONFLICTS is probably reasonable.=20
>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--y2zxS2PfCDLh6JVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7XepgACgkQN1Ujt2V2gBzWdACaA2BAUfHKqaOguwncmLoi5GwQ
nBcAoIsSgDrjGSjbOIRl8cXOmc64W56G
=BvIh
-----END PGP SIGNATURE-----

--y2zxS2PfCDLh6JVG--
