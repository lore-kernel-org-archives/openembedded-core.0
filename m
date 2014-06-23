Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 33E9165F14;
	Mon, 23 Jun 2014 11:20:52 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id x48so6826129wes.11
	for <multiple recipients>; Mon, 23 Jun 2014 04:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=UWuP57iUN0qsYKVxc3KF7kpzkplGAiYOiP0tT+SZiv8=;
	b=LZ4r9pbjSe6UGf+2miYeMw87N/c6xQjixcNl3wcnX4td/FEYfYIEC/id2neGAyegFw
	UH6WPrDcXIS85d5/PRoXVT+Dr8DBhKtAXJCkMALCWSGC3Eehi3zihH3w6PXQUKoph0ey
	V75oP4PKW7reRc/QehEKS2jQy9UWQJpaW0wrYoetIgY/7JMrF/+FCwxa6RPplsIgtxUJ
	SmfNp2B7HC53vPOHaBZRQEJLYh8KRKRW0evr9dWOKTbEpZZ4CJbKcNNrjwhNRBSZqVzt
	jJunvXjRMKeaSvhA1GVXNZEYUOgr17V3zH8heAeFz1znWKNdS0HEId9n2V8b36ngA2eT
	wefw==
X-Received: by 10.194.110.100 with SMTP id hz4mr27192143wjb.65.1403522449770; 
	Mon, 23 Jun 2014 04:20:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gp15sm35665896wjc.10.2014.06.23.04.20.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 04:20:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 Jun 2014 13:20:50 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140623112050.GD2437@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, wrong PACKAGE_ARCHs
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
X-List-Received-Date: Mon, 23 Jun 2014 11:21:06 -0000
X-Groupsio-MsgNum: 54316
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cHMo6Wbp1wrKhbfi"
Content-Disposition: inline

--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This is new report generated with oe-core/scripts/sstate-diff-machines.sh

To reproduce it, you need "qemux86copy" MACHINE which is the same as
qemux86 only with different name (to simulate 2 MACHINEs with same
TUNE_PKGARCH in oe-core). You can find commit adding "qemux86copy" in
jansa/master branch:
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/master

Current logs:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20140623_1031=
33.log/

I've sent fix fir firefox-l10n-*.
jansa/master branches are containing couple of pending changes (mostly
to remove allarch), so if you try it with current master branches it
will be (a lot) worse.

ERROR: 123 issues were found in these recipes: dracut firefox-l10n-*
font-alias gtk-theme-neo initscripts ipsec-tools lmsensors oprofile
oprofileui oprofileui-server polkit-group-rule-datetime
polkit-group-rule-network shr-theme-neo sysvinit tipcutils vpnc webmin
xfce4-session xl2tpd xserver-common xserver-nodm-init xuser-account

The best way to read and fix this issues is to fix do_configure
signatures first, because otherwise the same recipes are listed also in
do_populate_sysroot and do_package_write_ipk logs (I've tried to remove
"duplicities" in this e-mail)

 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemux86 =3D=3D=3D
ERROR: ipsec-tools different signature for task do_configure.sigdata betwee=
n qemux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed fro=
m 044d21e2b15b62951de269546a864761 to 493ec6f39469f86091bf227da56ab374

ERROR: oprofile different signature for task do_configure.sigdata between q=
emux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed fro=
m 044d21e2b15b62951de269546a864761 to 493ec6f39469f86091bf227da56ab374

ERROR: tipcutils different signature for task do_configure.sigdata between =
qemux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed fro=
m 044d21e2b15b62951de269546a864761 to 493ec6f39469f86091bf227da56ab374

ERROR: xl2tpd different signature for task do_configure.sigdata between qem=
ux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed fro=
m 044d21e2b15b62951de269546a864761 to 493ec6f39469f86091bf227da56ab374



 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemuarm =3D=3D=3D
ERROR: polkit-group-rule-datetime different signature for task do_configure=
=2Esigdata between qemux86copy and qemuarm
Hash for dependent task shadow_4.1.4.3.bb.do_populate_sysroot changed from =
10bd48d65ec6c48ffd47a8c0680dd4f0 to 75c0567c089f8bcd655cad984616afd9
Hash for dependent task polkit_0.111.bb.do_populate_sysroot changed from 5b=
2f6dca4e9a791b6ddb437de8f1d37a to 30b2a1b569a5fde24929ae2bcb8c3d47
Hash for dependent task shadow-sysroot_4.1.4.3.bb.do_populate_sysroot chang=
ed from 4e69e139e2362a936f83db7904d192eb to ad29f0109974d30e90e4780b97c503e6
Hash for dependent task base-passwd_3.5.29.bb.do_populate_sysroot changed f=
rom 0629faf9b6a696e2bcda98cf9823c68f to 1e54ce0b06a0e76ba4196791ad628e1e

ERROR: polkit-group-rule-network different signature for task do_configure.=
sigdata between qemux86copy and qemuarm
Hash for dependent task shadow_4.1.4.3.bb.do_populate_sysroot changed from =
10bd48d65ec6c48ffd47a8c0680dd4f0 to 75c0567c089f8bcd655cad984616afd9
Hash for dependent task polkit_0.111.bb.do_populate_sysroot changed from 5b=
2f6dca4e9a791b6ddb437de8f1d37a to 30b2a1b569a5fde24929ae2bcb8c3d47
Hash for dependent task shadow-sysroot_4.1.4.3.bb.do_populate_sysroot chang=
ed from 4e69e139e2362a936f83db7904d192eb to ad29f0109974d30e90e4780b97c503e6
Hash for dependent task base-passwd_3.5.29.bb.do_populate_sysroot changed f=
rom 0629faf9b6a696e2bcda98cf9823c68f to 1e54ce0b06a0e76ba4196791ad628e1e

ERROR: xserver-common different signature for task do_configure.sigdata bet=
ween qemux86copy and qemuarm
Hash for dependent task eglibc_2.19.bb.do_populate_sysroot changed from ce5=
bce3e618d84fc771356c66878307f to f007aed17e892d1acf8d6c5a4a253219

ERROR: xuser-account different signature for task do_configure.sigdata betw=
een qemux86copy and qemuarm
Hash for dependent task shadow_4.1.4.3.bb.do_populate_sysroot changed from =
10bd48d65ec6c48ffd47a8c0680dd4f0 to 75c0567c089f8bcd655cad984616afd9
Hash for dependent task base-passwd_3.5.29.bb.do_populate_sysroot changed f=
rom 0629faf9b6a696e2bcda98cf9823c68f to 1e54ce0b06a0e76ba4196791ad628e1e
Hash for dependent task shadow-sysroot_4.1.4.3.bb.do_populate_sysroot chang=
ed from 4e69e139e2362a936f83db7904d192eb to ad29f0109974d30e90e4780b97c503e6


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemuarm =3D=3D=3D
ERROR: font-alias different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemuarm
Hash for dependent task font-util_1.3.0.bb.do_packagedata changed from 687b=
4e8a953953232a9cbd266d613fc5 to 9c354c97b1eb29a0df93ff294e0a3d4d

ERROR: gtk-theme-neo different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task gtk+_2.24.22.bb.do_packagedata changed from 26f2589=
8265c37c9db595c3d08e1a0e5 to da25e6cd8624867d942d39e894e9def8

ERROR: shr-theme-neo different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task icon-theme-neo_git.bb.do_packagedata changed from 3=
ea1a79edcc005040265cb57a7b77eda to 2673548c476d8de5e354e1582d3380b5

ERROR: webmin different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemuarm
Hash for dependent task webmin_1.620.bb.do_package changed from 1a4ee0753ef=
f9a8e392e851b6bbe252d to 36578d90d5866248da6afaa50fd586a1
Hash for dependent task perl_5.14.3.bb.do_packagedata changed from c7f95281=
2f189c608e14e0862807ae27 to 24b9ff1de4f046333d292aa97673a8d2
Hash for dependent task webmin_1.620.bb.do_packagedata changed from bd1b17c=
957d4091a0f6d3ff6a9acb0fe to b584e5a6a90eeb320046c457b03a607f

ERROR: xserver-common different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
Hash for dependent task xinput-calibrator_git.bb.do_packagedata changed fro=
m 8b02b1d0c82cca35fea242c9d354d536 to 578f5a890ebd7a9bcc37b56d26a66819
Hash for dependent task xserver-common_1.34.bb.do_packagedata changed from =
2fed45862b973793f9bbd4bbcb673b00 to 7f8cf0da84516eef9660abb2eeaba45f
Hash for dependent task xdpyinfo_1.3.1.bb.do_packagedata changed from 1c217=
2f825573d239090c93dba23624f to 405928242519b5028ccaad1fd747f36a
Hash for dependent task xserver-common_1.34.bb.do_package changed from e273=
1ac3f576611edd74b6f98ef91d3d to 6002c1e420b45f8a3b339721c36071cc
Hash for dependent task xmodmap_1.0.8.bb.do_packagedata changed from 06a3ab=
64bde87a30239a9c78be4c1e82 to e5e0ce3137886fdeac6f0607b21f7914
Hash for dependent task xrandr_1.4.2.bb.do_packagedata changed from 47ced14=
b5fe1b2692ad7a219367dbebb to 4e422e31bc487f6300e22ab328308f77
Hash for dependent task fbset_2.1.bb.do_packagedata changed from 7a681e09fe=
6b28c38c9a3654d741ee05 to fde25fb85cbbfa25b2b6408984731203

ERROR: xserver-nodm-init different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemuarm
Hash for dependent task xserver-common_1.34.bb.do_packagedata changed from =
2fed45862b973793f9bbd4bbcb673b00 to 7f8cf0da84516eef9660abb2eeaba45f
Hash for dependent task xinit_1.3.3.bb.do_packagedata changed from 4785e6a6=
3639af8005ecb9e04604657c to 384804020c9cf5f1b2c0452bbd608c5b
Hash for dependent task xserver-nodm-init_2.0.bb.do_packagedata changed fro=
m 0a2b885e26bce9d00891f66cc71f461c to ddf705fad89c250f9ae1afe0788f8ad8
Hash for dependent task xserver-nodm-init_2.0.bb.do_package changed from 38=
ca1cbe0ee04821d8564c6a87a18ed0 to 0258af0d15d7e3989a9c8c017f1c68d6

 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemux86 =3D=3D=3D
ERROR: vpnc different signature for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_packagedata changed from 407=
be3d4a79da2ef3c19413a2393a8a1 to 9c7cb78c5a05f2646531f3f2fa10cdf3

ERROR: xfce4-session different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemux86
Hash for dependent task xfce4-session_4.10.1.bb.do_packagedata changed from=
 e9e68bcf9668d76ab78e4318262723ba to 6e25e42a521f64eb121bc7cccf4a4ee8
Hash for dependent task xfce4-session_4.10.1.bb.do_package changed from b8c=
ec1181a37d2528e4f4bc2152883b5 to 6bb216d35f1120ca59ed4795fdabe997

ERROR: oprofileui different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemux86
Hash for dependent task oprofile_0.9.9.bb.do_packagedata changed from d5af6=
1069bdd20637cd0341f55badb8d to 211c048fc3322f0fe6f5de328114a0be

ERROR: oprofileui-server different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemux86
Hash for dependent task oprofile_0.9.9.bb.do_packagedata changed from d5af6=
1069bdd20637cd0341f55badb8d to 211c048fc3322f0fe6f5de328114a0be

ERROR: lmsensors different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemux86
Hash for dependent task lmsensors-config_1.0.bb.do_packagedata changed from=
 18fdddafaaf421cea83767716002cc4f to eedffc716bb5c4d8d35931b7ecdcf5c2

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cHMo6Wbp1wrKhbfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOoDZIACgkQN1Ujt2V2gBzJcwCePlXHBnMo1hBOTiRoFJW4vKn0
O/YAnRTct+4NUoR0HlK7wyqa8/LcnDBl
=YF6E
-----END PGP SIGNATURE-----

--cHMo6Wbp1wrKhbfi--
