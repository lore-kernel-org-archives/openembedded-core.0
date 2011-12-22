Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rdemm-0008Ea-71
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 10:18:00 +0100
Received: by eeit10 with SMTP id t10so4086653eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 01:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PZMDdHN5P1rmy6mGuhMrjcR1c7HTXi4CgxxvKIfDqp8=;
	b=ZJ5O+ll/z53I9b1F9xUC5X4qjx2JRE5aFZiAmgVcoK6UncuX8ymue8A27niBlfdy/e
	lRDtS8KegE74SIO0RjygFeNJJzMRa8KfgOQjZZX3/kc8LKLZ/+SEp09XAXMuo8V62mJ/
	0f7l/zJiMXM9Ok9OErpLgA3mInU0KVsdrnA4k=
Received: by 10.213.7.214 with SMTP id e22mr5174507ebe.58.1324545054077;
	Thu, 22 Dec 2011 01:10:54 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z43sm31706061eef.7.2011.12.22.01.10.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 01:10:53 -0800 (PST)
Date: Thu, 22 Dec 2011 10:10:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111222091041.GI12791@jama.jama.net>
References: <alpine.DEB.2.00.1112220939580.26143@entw48>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1112220939580.26143@entw48>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Regression bug: dbus messagebus user generation is wrong
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
X-List-Received-Date: Thu, 22 Dec 2011 09:18:00 -0000
X-Groupsio-MsgNum: 14656
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WHz+neNWvhIGAO8A"
Content-Disposition: inline

--WHz+neNWvhIGAO8A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2011 at 09:49:01AM +0100, Bernhard Guillon wrote:
> Hi all,
> we switched the way we chown /usr/libexec/dbus-daemon-launch-helper
> with this commit:
>=20
> commit 46e6c3fa8034b12d178d605f3f5d7efe69671a13
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Fri Oct 21 02:49:51 2011 +0000
>=20
>      dbus: use useradd class to allow use in read-only filesystems
>=20
>      Move creation of required user/groups to useradd class thus allowing
>      use with read-only filesystems and booting the initial boot.
>=20
>      Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>=20
>=20
> We changed the owner ship of the user on the device before this commit.=
=20
> Now we change the owner ship on build time which is wrong. If we change=
=20
> the owner ship on buildtime we cannot know the gid of the messagebus=20
> group. On my system it is e.g 117 but on my targtet it is 997. There is n=
o=20
> standard mapping for gid to names so we need to switch back to change the=
=20
> group on the device.

See http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1711
but it's still broken in some cases (on my buildhost 3 from 5 machines
are broken, 2 are working after last opkg changes).

Good test is to enable testlab and run this in your deploy/images directory
find . ! -type l -name \*tar.gz`; do=20
  echo $i;=20
  tar -tvf $i | grep dbus-daemon-launch;=20
  tar --numeric-owner -tvf $i | grep dbus-daemon-launch;=20
  tar xzvpf $i ./etc/group;=20
  grep messagebus ./etc/group;=20
done | tee -a image.test

And working image needs to have not only messagebus as owner but also
matching GID in 2nd line and last line from packaged /etc/group. With
latest opkg fixes it seems to work, but only if there is messagebus in
packaged /etc/group at all, reported here:
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014619=
=2Ehtml
but probably got lost in other issues with new opkg, like this one
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014654=
=2Ehtml
(if D is not needed to be set from opkg then why was offlineroot_varname.pa=
tch
added in first place? and I have updated this after
offlineroot_varname.patch removal and new version is in shr branch)
=20
> I can send a patch which reenables the postinstall owner ship change if=
=20
> you like.

Such patch is already on ML from me, now I'm using .bbappend from my
layer=20
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3Dc08d=
fd5f5559902f6966648f75d6c6bfd2597a5b

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WHz+neNWvhIGAO8A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7y9BEACgkQN1Ujt2V2gBxanwCfYyOVQsIIY4glpMe5su7je2UB
41YAn3AKcLGYgWGaQgrnyCQuPJ0v0avn
=fa7X
-----END PGP SIGNATURE-----

--WHz+neNWvhIGAO8A--
