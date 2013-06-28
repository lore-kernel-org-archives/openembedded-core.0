Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id AF658618B5;
	Fri, 28 Jun 2013 11:55:53 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id z15so995117ead.35
	for <multiple recipients>; Fri, 28 Jun 2013 04:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IEtMbynWShKkZl49lSklios8xjlDD/VoCmsthuVRrWY=;
	b=FQSXnIJHRSiMAbMB9gLWFtTuw7HW2hhezUmJgkFVn9b39q9/RpdhIHR5lOIkCPOuD5
	P6w1ZMn+ZLP+79RmxKXoHk0A3Vpa5zFBq9IwZJkTlFr+adaZgUjnu0HKNYqQ2p3l65Ce
	1+yUDCfTjJrnkoSOAykcU5NUx/H6jH+Tys50abgTKS0BFQw4trFHKsZhnPb6Pa4jTmTr
	8TvEsVyTmfk2o8ZlfrVL1yiCHrbC3fQARHU4w32W/f2qO07dmIUYqXFbJZ0gz42+O5h+
	/zLYkhDMUDWxLeqYvDpUmEyKMbNK6HvNHgn30WfwbuosrmIsFyRI1616OZ47qkinUNti
	Yqtw==
X-Received: by 10.14.100.2 with SMTP id y2mr13523926eef.75.1372420554001;
	Fri, 28 Jun 2013 04:55:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bj46sm10071050eeb.13.2013.06.28.04.55.52 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 04:55:53 -0700 (PDT)
Date: Fri, 28 Jun 2013 13:56:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20130628115633.GL3261@jama>
References: <20130625163758.7F04650176@opal>
MIME-Version: 1.0
In-Reply-To: <20130625163758.7F04650176@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Chen Qi : busybox: add the ability to split the busybox binary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jun 2013 11:55:54 -0000
X-Groupsio-MsgNum: 41099
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Jtds+vpI57xq70EV"
Content-Disposition: inline

--Jtds+vpI57xq70EV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2013 at 04:37:58PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: e5a1442819dfb74e86a6f69da008ba6908c8bbc7
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3De5a1442819dfb74e86a6f69da008ba6908c8bbc7
>=20
> Author: Chen Qi <Qi.Chen@windriver.com>
> Date:   Mon Jun 17 12:47:20 2013 +0800
>=20
> busybox: add the ability to split the busybox binary
>=20
> This patch enables us to split the busybox into two binaries, one
> containing suid applications, and the other containing nosuid apps.
>=20
> Add a variable, BUSYBOX_SPLIT_SUID, to control whether to split the
> busybox binary into two parts. We default it to "1" to enable the
> splitting, but users could still override it to disable the splitting.
> After all, busybox has no internal support for this suid apps splitting,
> so there might be users out there who want just one busybox binary.
>=20
> The basic idea here is to build the busybox twice, each with the correct
> configuration items. We extract the non-app part of the original .config
> file, and merge this part with the suid-app part to form a .config which
> contains only suid apps. The same strategy applies to the non-suid apps.

Hi,

have you tried to do on-device upgrade with this change?
It looks very broken, description follows:

13:48:33 < JaMa> was sed applet removed from busybox or something like that=
? upgrade path seems to be broken
13:48:34 < JaMa> Configuring busybox-syslog.
13:48:34 < JaMa> /usr/bin/update-alternatives: line 186: sed: not found
13:48:58 < JaMa> and then all applets in main busybox package fail to set u=
-a because of missing sed..
13:49:27 < JaMa> and then fixing that is more complicated because wget syml=
ink is gone too, so opkg update opkg upgrade wont work
13:49:40 < zecke> JaMa: IIRC the specific postinst was removed from busybox=
?!
13:50:55 < JaMa> /var/lib/opkg/info/busybox.postinst is still there
13:51:02 < JaMa> with a lot of u-a calls
13:51:34 < zecke> JaMa: generated by the bbclass and not the one that was i=
n the busybox.inc (but i only read the digest and skip stuff)
13:51:37 < JaMa> that commit says it removes redundant u-a
13:52:11 < JaMa> SHR root@gjama ~ $ grep sed /var/lib/opkg/info/busybox.pos=
tinst   update-alternatives --install /bin/sed sed /bin/busybox.nosuid 50
13:52:23 < zecke> JaMa: Do you know if they/he tested on device upgrade?
13:52:56 < zecke> i am obviously just guessing
13:54:05 < JaMa> all u-a are still pointing to /bin/busybox, but that one i=
s gone replaced by /bin/busybox.(no)suid
13:54:44 < JaMa> we should install /bin/busybox -> /bin/busybox.nosuid to f=
ix upgrade path..

--Jtds+vpI57xq70EV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHNefEACgkQN1Ujt2V2gBysIwCfSmZumon4kNVXGqZtk9T3WUfv
Ul0An0/a0TnG4YsIfQhtZ8x/KDSotb83
=siTX
-----END PGP SIGNATURE-----

--Jtds+vpI57xq70EV--
