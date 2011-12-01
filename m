Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW8Aj-0001fY-Vq
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 16:03:38 +0100
Received: by eekc1 with SMTP id c1so1300899eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 06:56:53 -0800 (PST)
Received: by 10.14.3.140 with SMTP id 12mr977675eeh.183.1322751413560;
	Thu, 01 Dec 2011 06:56:53 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id x12sm18284019eef.9.2011.12.01.06.56.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 06:56:52 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 1 Dec 2011 15:56:48 +0100
In-Reply-To: <20111201130112.GE19917@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20110906092043.GI31057@jama.jama.net>
	<1315333831.3091.6.camel@lenovo.internal.reciva.com>
	<20111201130112.GE19917@jama.jama.net>
Message-Id: <9CB6D7AB-B515-49C1-9948-62C0D7729089@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
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
X-List-Received-Date: Thu, 01 Dec 2011 15:03:38 -0000
X-Groupsio-MsgNum: 13447
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0A3BD2E4-E36F-422D-AA9B-24C9BA11D888";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0A3BD2E4-E36F-422D-AA9B-24C9BA11D888
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 1 dec. 2011, om 14:01 heeft Martin Jansa het volgende geschreven:

> On Tue, Sep 06, 2011 at 07:30:31PM +0100, Phil Blundell wrote:
>> On Tue, 2011-09-06 at 11:20 +0200, Martin Jansa wrote:
>>> Hi,
>>>=20
>>> if someone wants to use only shadow as login manager, then all =
postinst
>>> calling adduser (instead of useradd) are failing ie:
>>>=20
>>> recipes-connectivity/avahi/avahi.inc:   grep "^avahi:" /etc/passwd > =
/dev/null || adduser --disabled-password --system --home =
/var/run/avahi-daemon --no-create-home avahi --ingroup avahi -g Avahi
>>> recipes-connectivity/avahi/avahi.inc:   grep "^avahi-autoipd:" =
/etc/passwd > /dev/null || adduser --disabled-password --system --home =
/var/lib/avahi-autoipd --no-create-home avahi-autoipd --ingroup =
avahi-autoipd -g "Avahi autoip daemon"
>>> recipes-connectivity/openssh/openssh_5.8p2.bb:          adduser =
--system --home /var/run/sshd --no-create-home --disabled-password =
--ingroup sshd -s /bin/false sshd
>>> recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb:      adduser =
--system --home /dev/null --no-create-home --empty-password --ingroup =
nogroup -s ${sbindir}/ppp-dialin ppp
>>> recipes-core/dbus/dbus.inc:             adduser --system --home =
"$MESSAGEHOME" --no-create-home --disabled-password \
>>> recipes-devtools/distcc/distcc_2.18.3.bb:               grep distcc =
/etc/passwd || adduser --system --home /dev/null --no-create-home =
--empty-password --ingroup nogroup distcc
>>> recipes-graphics/x11-common/xserver-nodm-init.bb:        adduser =
--disabled-password $username
>>> recipes-multimedia/pulseaudio/pulseaudio.inc:            adduser =
--disabled-password --home=3D/var/run/pulse --system \
>>> recipes-support/hal/hal.inc:    grep haldaemon /etc/passwd || =
adduser --disabled-password --system --home /var/run/hald =
--no-create-home haldaemon --ingroup haldaemon -g HAL
>>>=20
>>> What is preferred fix,
>>=20
>> I guess the first part of any preferred fix is going to have to be to
>> get the postinsts to be consistent about what mechanism they use for
>> adding users, rather than the m=E9lange of different approaches that =
we
>> seem to have today.  Ideally I think that would be by means of making
>> the recipes in question use useradd.bbclass.  It might also be
>> reasonable to extend useradd.bbclass to work with tinylogin and/or
>> busybox's implementations of useradd if it doesn't already.
>>=20
>> If there are recipes which can't use useradd.bbclass for whatever =
reason
>> then I guess they should be adjusted to call useradd rather than
>> adduser, since the former is the more standardized of the two.
>>=20
>> As for tinylogin's adduser, I am inclined to say that it should =
probably
>> just go away in favour of a wrapper around (ideally a generic) =
useradd.
>=20
> just small update on this, from my original list only 2 recipes are
> still not using useradd.bbclass:
>=20
> recipes-connectivity/avahi/avahi.inc:   grep "^avahi:" /etc/passwd > =
/dev/null || adduser --disabled-password --system --home =
/var/run/avahi-daemon --no-create-home avahi --ingroup avahi -g Avahi
> recipes-connectivity/avahi/avahi.inc:   grep "^avahi-autoipd:" =
/etc/passwd > /dev/null || adduser --disabled-password --system --home =
/var/lib/avahi-autoipd --no-create-home avahi-autoipd --ingroup =
avahi-autoipd -g "Avahi autoip daemon"
> recipes-devtools/distcc/distcc_2.18.3.bb:               grep distcc =
/etc/passwd || adduser --system --home /dev/null --no-create-home =
--empty-password --ingroup nogroup distcc
>=20
> Is someone using them? Any volunteer to migrate them and test them?

I'm in java hell right now, but I'll try to fix those after that. But it =
would be nice if someone beats me to it :)

regards,

Koen=

--Apple-Mail=_0A3BD2E4-E36F-422D-AA9B-24C9BA11D888
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7XlbIACgkQMkyGM64RGpFlVwCgtJq1Y3bqy5QFaadqwBy76XZV
8HQAn3XAfL18tEWAJMNU5k03N2IgXF4Y
=vbRT
-----END PGP SIGNATURE-----

--Apple-Mail=_0A3BD2E4-E36F-422D-AA9B-24C9BA11D888--
