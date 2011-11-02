Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLYZj-0000ak-Ci
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 12:01:45 +0100
Received: by faas16 with SMTP id s16so281454faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 03:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=vuPJzxmBmLtjXwfQy6atMrCiEhFQtUq27GsdVehxJJ0=;
	b=CuI0cad/mY6WFRQ9U7QETWx4KppN2FW1bAMkYcVDfYujdjxiJ5DH9L09dpwvgQ+yu7
	y3dUkMxzlXlW9RHfYFZt8RgbUUfdH4AFxLDGGa0g1A3KsZNVsBCNBc9jOlKfVwuQJ9zq
	xqG4xSPYasjPDEBIOdEkB17gAUdcOHQsLFQg4=
Received: by 10.223.76.197 with SMTP id d5mr7776639fak.13.1320231335577;
	Wed, 02 Nov 2011 03:55:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i3sm4780880faf.0.2011.11.02.03.55.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 03:55:34 -0700 (PDT)
Date: Wed, 2 Nov 2011 11:55:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111102105528.GE9949@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: dbus broken again
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
X-List-Received-Date: Wed, 02 Nov 2011 11:01:46 -0000
X-Groupsio-MsgNum: 11815
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ep0oHQY+/Gbo/zt0"
Content-Disposition: inline

--ep0oHQY+/Gbo/zt0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

After last attempt to fix dbus there is new issue

I have talked with Richard on IRC already, but will repeat it here just
to warn other dbus users.

Updated list of available packages in /var/lib/opkg/lists/jama-om_gta02.
Upgrading dbus-1 on root from 1.4.12-r2 to 1.4.12-r7...
Downloading
http://jama.dyndns-home.com/org.openembedded.shr-core//armv4t/dbus-1_1.4.12=
-r7_armv4t.ipk.
Running groupadd commands...
Note: group netdev already exists, not re-creating it
Running useradd commands...
Note: username messagebus already exists, not re-creating it
Upgrading libdbus-1-3 on root from 1.4.12-r2 to 1.4.12-r7...
Downloading
http://jama.dyndns-home.com/org.openembedded.shr-core//armv4t/libdbus-1-3_1=
=2E4.12-r7_armv4t.ipk.
Upgrading libglib-2.0-0 on root from 1:2.30.0-r2 to 1:2.30.0-r3...
Downloading
http://jama.dyndns-home.com/org.openembedded.shr-core//armv4t/libglib-2.0-0=
_2.30.0-r3_armv4t.ipk.
Configuring dbus-1.
 System startup links for /etc/init.d/dbus-1 already exist.
Configuring libdbus-1-3.
Configuring libglib-2.0-0.

SHR root@gjama / $ ll /usr/libexec/dbus-daemon-launch-helper
-rwsr-xr-- 1 root 998 142748 Nov  2 10:12
/usr/libexec/dbus-daemon-launch-helper

SHR root@gjama / $ ll -d /var/lib/dbus
drwxr-xr-x 2 999 998 4096 Nov  2 10:12 /var/lib/dbus

SHR root@gjama / $ grep message /etc/group
messagebus:x:101:
SHR root@gjama / $ grep message /etc/passwd
messagebus:x:42:101:Linux User,,,:/var/run/dbus:/bin/sh


and that's because useradd.bbclass is using UID/GID from sysroots
OE om-gta02@shr ~/shr-core $ grep message tmp/sysroots/om-gta02/etc/group
messagebus:x:998:
OE om-gta02@shr ~/shr-core $ grep message tmp/sysroots/om-gta02/etc/passwd
messagebus:!:999:998::/var/lib/dbus:

and nothing is updating /etc/passwd /etc/group IDs on target.

The possible solution would be to force specified UID/GID in
useradd.bbclass to make it consistent during rebuild from scratch or
teach useradd postinst to update UID/GIDs and chown all runtime created
files to new values instead of skiping useradd/groupadd commnads when
user already exists, like it did now:
Note: username messagebus already exists, not re-creating it
Note: group netdev already exists, not re-creating it

Also reported here:
http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1711

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ep0oHQY+/Gbo/zt0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6xIaAACgkQN1Ujt2V2gBxHEQCcDhKTiikfWn9MCGdibGjNfSPg
u3QAoIgyA5njLHLh/PA3UjQ5B/LPcLDd
=q8FI
-----END PGP SIGNATURE-----

--ep0oHQY+/Gbo/zt0--
