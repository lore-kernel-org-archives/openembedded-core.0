Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R0ruj-00070Y-U1
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 11:25:53 +0200
Received: by ewy5 with SMTP id 5so2495584ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2011 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=gXgv2Rex8W4k4WQ99lGe6TEUQwx4Nmiy4/IN8saNlws=;
	b=k9JNUuzVA0DjQyUBiSYN02kke7BH4irG9NLpSCMdVrTJU30whVxQghnplmNgDn7j15
	u+dLAU98Hmo0zqvcKbH7IisZJQdFHS3/yOilRrhZYDds4MIk//soRNgPjg0xQKMyrcry
	exCqpXlxypk6atXh8WJ6COQv8iQrt4eR71Nwk=
Received: by 10.213.108.193 with SMTP id g1mr1153794ebp.59.1315300851214;
	Tue, 06 Sep 2011 02:20:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f3sm1270656eea.4.2011.09.06.02.20.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Sep 2011 02:20:49 -0700 (PDT)
Date: Tue, 6 Sep 2011 11:20:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110906092043.GI31057@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Tinylogin or shadow?
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
X-List-Received-Date: Tue, 06 Sep 2011 09:25:54 -0000
X-Groupsio-MsgNum: 9146
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ijf6z65S790CMqo8"
Content-Disposition: inline

--ijf6z65S790CMqo8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

if someone wants to use only shadow as login manager, then all postinst
calling adduser (instead of useradd) are failing ie:

recipes-connectivity/avahi/avahi.inc:   grep "^avahi:" /etc/passwd > /dev/n=
ull || adduser --disabled-password --system --home /var/run/avahi-daemon --=
no-create-home avahi --ingroup avahi -g Avahi
recipes-connectivity/avahi/avahi.inc:   grep "^avahi-autoipd:" /etc/passwd =
> /dev/null || adduser --disabled-password --system --home /var/lib/avahi-a=
utoipd --no-create-home avahi-autoipd --ingroup avahi-autoipd -g "Avahi aut=
oip daemon"
recipes-connectivity/openssh/openssh_5.8p2.bb:          adduser --system --=
home /var/run/sshd --no-create-home --disabled-password --ingroup sshd -s /=
bin/false sshd
recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb:      adduser --system --=
home /dev/null --no-create-home --empty-password --ingroup nogroup -s ${sbi=
ndir}/ppp-dialin ppp
recipes-core/dbus/dbus.inc:             adduser --system --home "$MESSAGEHO=
ME" --no-create-home --disabled-password \
recipes-devtools/distcc/distcc_2.18.3.bb:               grep distcc /etc/pa=
sswd || adduser --system --home /dev/null --no-create-home --empty-password=
 --ingroup nogroup distcc
recipes-graphics/x11-common/xserver-nodm-init.bb:        adduser --disabled=
-password $username
recipes-multimedia/pulseaudio/pulseaudio.inc:            adduser --disabled=
-password --home=3D/var/run/pulse --system \
recipes-support/hal/hal.inc:    grep haldaemon /etc/passwd || adduser --dis=
abled-password --system --home /var/run/hald --no-create-home haldaemon --i=
ngroup haldaemon -g HAL

What is preferred fix, I plan to add u-a to shadow to provide adduser alter=
native=20
or add RCONFLICT between tinylogin and shadow as we don't want some passwd =
entries
=66rom tinylogin and some from shadow (when both installed at the same time.
Someone with better idea or even patches for it?

Just in case, list of files provided by both login managers:

bash-4.1# opkg files shadow
Package shadow (4.1.4.3-r4) is installed on root and has the following
files:
/usr/sbin/useradd
/usr/sbin/groupadd
/usr/sbin/groupmems
/usr/sbin/pwck
/etc/securetty
/usr/bin/newgrp.shadow
/usr/sbin/usermod
/usr/bin/chsh.shadow
/usr/sbin/groupmod
/etc/default/useradd
/usr/bin/chfn.shadow
/usr/sbin/nologin
/usr/bin/expiry
/usr/bin/passwd.shadow
/usr/sbin/userdel
/usr/sbin/groupdel
/usr/bin/sg
/usr/bin/su
/usr/sbin/newusers
/etc/login.access
/sbin/vigr.shadow
/usr/bin/groups
/usr/sbin/grpconv
/usr/sbin/logoutd
/usr/sbin/chgpasswd
/usr/sbin/grpck
/usr/sbin/chpasswd.shadow
/usr/bin/gpasswd
/bin/login.shadow
/usr/sbin/grpunconv
/sbin/vipw.shadow
/usr/bin/faillog
/usr/sbin/pwconv
/var/spool/mail/
/usr/bin/chage
/usr/bin/lastlog
/etc/login.defs
/etc/limits
/usr/sbin/pwunconv

bash-4.1# opkg files tinylogin
Package tinylogin (1.4-r7) is installed on root and has the following
files:
/bin/login
/bin/su
/bin/addgroup
/sbin/sulogin
/usr/bin/passwd
/bin/delgroup
/usr/bin/vlock
/bin/tinylogin
/bin/deluser
/sbin/getty
/bin/adduser


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ijf6z65S790CMqo8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5l5esACgkQN1Ujt2V2gBwfMQCffAKSh+s2AEeOvLK1JK0wE01Q
wl8AnRTBbwrIQC0cA24facLakQsZzeSo
=R1OV
-----END PGP SIGNATURE-----

--ijf6z65S790CMqo8--
