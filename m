Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id AD31065C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 14:21:28 +0000 (UTC)
Received: by wiga1 with SMTP id a1so101057579wig.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=yjU0pSi7kkIa6tFwn/GE3vNtVnIvn4SyMX0g0pvBfpU=;
	b=VmCwnwFfflS6PIFTsBCMEMkWorTloCuxwK8CiflXwQnFtPGWakhsRlgHa4glJQuaL6
	gpmHtIkS6MqbOKX1sl3YUwgqjku6wbHakw/70fnEQHhAEPv2EoIlXyYe1YCHTkiSiG8S
	lFM2WHRKmbMoN6bU33VrOlp5xjWz0xmL7jXVeKcNp/pGJJIjREmrya3UwERFthJ4QyVs
	wzKILzSPnDdXk767ZO7ClP2PDC999ozZs5RIIgOpT7+fFuuW/VflPu2A0drL8rlmqMWY
	6JTcSvSQzvvEq3qnSw7dy2PFzXaff47wdvhc0QdPo4Z3UwH8mInlxBXX9jvszi1lFtrL
	nePA==
X-Received: by 10.194.235.66 with SMTP id uk2mr15412021wjc.62.1436883688491;
	Tue, 14 Jul 2015 07:21:28 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fr9sm3480992wic.19.2015.07.14.07.21.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jul 2015 07:21:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Jul 2015 16:21:40 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150714142140.GC2184@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: dbus-test no longer built for dbus-ptest after last bitbake changes
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
X-List-Received-Date: Tue, 14 Jul 2015 14:21:34 -0000
X-Groupsio-MsgNum: 67933
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PuGuTyElPB9bOcsM"
Content-Disposition: inline

--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm not 100% sure it's related to recent bitbake variable expansion
changes, but my recent builds are failing with errors about
dbus-ptest cannot be installed because dbus-test-ptest doesn't exist

ERROR:=20
Collected errors:

 * satisfy_dependencies_for: Cannot satisfy the following dependencies
 * for dbus-ptest:

 * 	dbus-test-ptest *=20

 * opkg_install_cmd: Cannot install package dbus-ptest.

It's using a bit strange construct to add it to RDEPENDS:
meta/recipes-core/dbus/dbus.inc:RDEPENDS_dbus-ptest_class-target =3D
"dbus-test-ptest"

but checking cooker log shows that dbus-test
(meta/recipes-core/dbus/dbus-test_1.8.18.bb) wasn't built at all, only
dbus-test message is from opkg error and this QA error from dbus itself:

NOTE: recipe dbus-1.8.18-r0: task do_package_write_ipk: Started
WARNING: QA Issue: dbus-ptest rdepends on dbus-test-ptest, but it isn't
a build dependency? [build-deps]

Any ideas?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PuGuTyElPB9bOcsM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWlGvMACgkQN1Ujt2V2gBxiXgCdEji6j5uQ6dToyPI/E3u3VcMi
5ccAn0c7uE/GxfZ7lsaalszqb3atdLLG
=DiX6
-----END PGP SIGNATURE-----

--PuGuTyElPB9bOcsM--
