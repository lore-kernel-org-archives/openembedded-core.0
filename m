Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 742A465FE5;
	Thu, 24 Jul 2014 11:18:45 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so9476319wiv.7
	for <multiple recipients>; Thu, 24 Jul 2014 04:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=JJSrOdVc7cIGsKvpifECk5ooIqqksFfboDAybzTpI3k=;
	b=wFSrGsbNmm/YFNfb4Cl+SJhHnLeL4WODXWm8fu/crsunqsXaWTmJhFPme92pLi17V5
	CjPyu+CimnVJnD5vNL3L5TcnsZS3yAnVtX5UVvWU9X8AyxohQ4UqMuiqaguWn3CCkvqr
	yoQ6rFci0JUF2+731IbUfbp12pbRen6xVpDnpzyAFIp0BM4Wl7wKNMK9ykgTg6hl8vD2
	wAIq9IyjuCA0m4AkgJPkqqaC9ycaKd4EeQDgxpyrldHj72M+//SnSXB19/fuIa95x2Ct
	r7uPERZH28ZwuP4rIOw4pn6bpmArF6zdycO6epwNHUpfUYMvtVYnt4fGIC0MwclQts0E
	eURg==
X-Received: by 10.180.9.38 with SMTP id w6mr731447wia.61.1406200726652;
	Thu, 24 Jul 2014 04:18:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f6sm15027172wja.25.2014.07.24.04.18.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 04:18:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Jul 2014 13:19:01 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140724111901.GJ2492@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, wrong PACKAGE_ARCHs 2014-07-24
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
X-List-Received-Date: Thu, 24 Jul 2014 11:18:49 -0000
X-Groupsio-MsgNum: 55489
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NZiXfHLGvOGtDZMn"
Content-Disposition: inline

--NZiXfHLGvOGtDZMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This is new report generated with oe-core/scripts/sstate-diff-machines.sh
=20
To reproduce it, you need "qemux86copy" MACHINE which is the same as
qemux86 only with different name (to simulate 2 MACHINEs with same
TUNE_PKGARCH in oe-core). You can find commit adding "qemux86copy" in
jansa/master branch:
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/master

Current logs:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20140724_0109=
42.log/

jansa/master branches are containing couple of pending changes (mostly
to remove allarch), so if you try it with current master branches it
will be (a lot) worse.

> ERROR: 43 issues were found in these recipes: android-tools dracut
> font-alias initscripts ipsec-tools libxml-filter-buffertext-perl
> libxml-sax-writer-perl lmsensors oprofile oprofileui oprofileui-server
> polkit-group-rule-datetime polkit-group-rule-network shr-theme-neo
> sysvinit tipcutils vpnc xfce4-session xl2tpd xserver-common
> xserver-nodm-init xuser-account

ERROR: 57 issues were found in these recipes: android-tools dracut
font-alias initscripts ipsec-tools libxml-filter-buffertext-perl
libxml-sax-writer-perl lmsensors oprofile oprofileui oprofileui-server
polkit-group-rule-datetime polkit-group-rule-network shr-theme-neo
sysvinit terminus-font tipcutils ttf-arphic-uming ttf-dejavu ttf-droid
ttf-gentium ttf-hunkyfonts ttf-inconsolata ttf-liberation ttf-mplus
ttf-sazanami ttf-ubuntu-font-family ttf-wqy-zenhei vpnc xfce4-session
xl2tpd xserver-common xserver-nodm-init xuser-account

no improvement on this front, it even got a bit worse because ttf* allarch
recipes gained runtime dependency on TUNE_PKGARCH fontconfig

> The best way to read and fix this issues is to fix do_configure
> signatures first, because otherwise the same recipes are listed also in
> do_populate_sysroot and do_package_write_ipk logs (I've tried to remove
> "duplicities" in this e-mail)

 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemux86 =3D=3D=3D
ERROR: ipsec-tools different signature for task do_configure.sigdata betwee=
n qemux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed fro=
m 0446075964867e62e8e631878de6832d to 9d2e475ed80a276182d16181d81f8639

ERROR: oprofile different signature for task do_configure.sigdata between q=
emux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed fro=
m 0446075964867e62e8e631878de6832d to 9d2e475ed80a276182d16181d81f8639

ERROR: tipcutils different signature for task do_configure.sigdata between =
qemux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed fro=
m 0446075964867e62e8e631878de6832d to 9d2e475ed80a276182d16181d81f8639

ERROR: xl2tpd different signature for task do_configure.sigdata between qem=
ux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed fro=
m 0446075964867e62e8e631878de6832d to 9d2e475ed80a276182d16181d81f8639

ERROR: 4 errors found in /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate-=
diff/1406164182/signatures.qemux86.do_configure.sigdata.log


 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwee=
n qemux86copy and qemux86 =3D=3D=3D
ERROR: initscripts different signature for task do_populate_sysroot.sigdata=
 between qemux86copy and qemux86
Hash for dependent task initscripts_1.0.bb.do_install changed from 170c1ec2=
9ccecf61834957d8baf77cfd to 0b7e40649be9c13355a440a00cd86489

ERROR: ipsec-tools different signature for task do_populate_sysroot.sigdata=
 between qemux86copy and qemux86
Hash for dependent task ipsec-tools_0.8.1.bb.do_install changed from c0dce8=
c3763ecaf499b4ac84d1f6b93a to 8e0024ff3a924e118861252574d745bf

ERROR: oprofile different signature for task do_populate_sysroot.sigdata be=
tween qemux86copy and qemux86
Hash for dependent task oprofile_0.9.9.bb.do_install changed from de26574c0=
9b5d5ec3dfbc0673eff4e55 to 2e970d5a2406ec721ae882184d8054b5

ERROR: tipcutils different signature for task do_populate_sysroot.sigdata b=
etween qemux86copy and qemux86
Hash for dependent task tipcutils_2.0.6.bb.do_install changed from 038cac07=
45f61713f579657b1f32a82d to 4c4f76d3617aa8c8b11af7452aa63aac

ERROR: xl2tpd different signature for task do_populate_sysroot.sigdata betw=
een qemux86copy and qemux86
Hash for dependent task xl2tpd_git.bb.do_install changed from c9e55b16445f7=
2b1717e8eacb1fd87de to 804f93bffd8a9ec62c67660c36452a11

ERROR: 5 errors found in /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate-=
diff/1406164182/signatures.qemux86.do_populate_sysroot.sigdata.log


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemux86 =3D=3D=3D
ERROR: android-tools different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemux86
Hash for dependent task android-tools-conf_1.0.bb.do_packagedata changed fr=
om 195da381fa622a602e2291e5546adac9 to a044baf70a14323659d5cd9a752928d2

ERROR: dracut different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_packagedata changed from b1f=
25e253c145af3993649350fe6f8bd to 510118de5a02e7c8683b043c29acdfcb

ERROR: initscripts different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemux86
Hash for dependent task initscripts_1.0.bb.do_packagedata changed from 8be7=
2e32fdabff805f268f782d9b3945 to 8d0a9416ece5b340adbcd0a0c1ab9687
Hash for dependent task initscripts_1.0.bb.do_package changed from 2e53d791=
3f602ce8682759c36e7342db to 5d3bbe9740f5afe719c3acfad564aa93

ERROR: ipsec-tools different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemux86
Hash for dependent task ipsec-tools_0.8.1.bb.do_packagedata changed from d7=
6ff099dc2cf9a061b53ff40b62e2b6 to 40f2d95ae9e829531d6030b64ec56e82
Hash for dependent task ipsec-tools_0.8.1.bb.do_package changed from 2d484c=
5af08df5e3a4fac2370aceed0c to cb3cdd65a02f5d4b31c1767a6c705589

ERROR: lmsensors different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemux86
Hash for dependent task lmsensors-config_1.0.bb.do_packagedata changed from=
 1a2553a360e48c0572f8af2aed810c63 to 57f8677131571d369e5dea34ce1c1552

ERROR: oprofile different signature for task do_package_write_ipk.sigdata b=
etween qemux86copy and qemux86
Hash for dependent task oprofile_0.9.9.bb.do_package changed from b41eec570=
1a943eff9624616089810cd to b87e08d7e52e62a45c2b34e2f57d13ff
Hash for dependent task linux-yocto_3.14.bb.do_packagedata changed from b1f=
25e253c145af3993649350fe6f8bd to 510118de5a02e7c8683b043c29acdfcb
Hash for dependent task oprofile_0.9.9.bb.do_packagedata changed from 0a496=
14491da3b6a4ca4f658b9673117 to 1df76389d665c222e105fd18073f5197

ERROR: oprofileui different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemux86
Hash for dependent task oprofile_0.9.9.bb.do_packagedata changed from 0a496=
14491da3b6a4ca4f658b9673117 to 1df76389d665c222e105fd18073f5197

ERROR: oprofileui-server different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemux86
Hash for dependent task oprofile_0.9.9.bb.do_packagedata changed from 0a496=
14491da3b6a4ca4f658b9673117 to 1df76389d665c222e105fd18073f5197

ERROR: sysvinit different signature for task do_package_write_ipk.sigdata b=
etween qemux86copy and qemux86
Hash for dependent task initscripts_1.0.bb.do_packagedata changed from 8be7=
2e32fdabff805f268f782d9b3945 to 8d0a9416ece5b340adbcd0a0c1ab9687

ERROR: tipcutils different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemux86
Hash for dependent task tipcutils_2.0.6.bb.do_package changed from 879aaa77=
37082012e0212833fd007069 to 692bfe9fa865d92abcd84cfb8acf551e
Hash for dependent task tipcutils_2.0.6.bb.do_packagedata changed from a2bc=
5b4aa2c93480d88a5987ae522e22 to a3ffd18b3bc40cc8b82972aced87a4f5

ERROR: vpnc different signature for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_packagedata changed from b1f=
25e253c145af3993649350fe6f8bd to 510118de5a02e7c8683b043c29acdfcb

ERROR: xfce4-session different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemux86
Hash for dependent task xfce4-session_4.10.1.bb.do_packagedata changed from=
 164c09c220484e584342a2bd5097453b to 5075184a766e7c7497d38cec99aedda0
Hash for dependent task xfce4-session_4.10.1.bb.do_package changed from 891=
eaf00722fd278cac5c6c50ed80929 to 42396333eaf74e4ef8e0a86205e99fca

ERROR: xl2tpd different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemux86
Hash for dependent task xl2tpd_git.bb.do_package changed from 35f25d5a882fb=
650aacae83b736d648b to 8004e97e42312119c6dca43734c51ae1
Hash for dependent task xl2tpd_git.bb.do_packagedata changed from 548a3a912=
2097aa5f0516ccbba1087ac to dbdc776a91ec457b9f2639fd37c9a45a

ERROR: 13 errors found in /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate=
-diff/1406164182/signatures.qemux86.do_package_write_ipk.sigdata.log


 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemuarm =3D=3D=3D
INFO: grub-efi-native task do_configure.sigdata doesn't exist in qemuarm
ERROR: libxml-filter-buffertext-perl different signature for task do_config=
ure.sigdata between qemux86copy and qemuarm
Hash for dependent task perl_5.20.0.bb.do_populate_sysroot changed from a58=
27c8deafb0ace555794c62c44e19f to 1a07f7ac7ad2a2750b58dfa60136114b

ERROR: libxml-sax-writer-perl different signature for task do_configure.sig=
data between qemux86copy and qemuarm
Hash for dependent task perl_5.20.0.bb.do_populate_sysroot changed from a58=
27c8deafb0ace555794c62c44e19f to 1a07f7ac7ad2a2750b58dfa60136114b

INFO: makedevs-native task do_configure.sigdata doesn't exist in qemuarm
INFO: opkg-native task do_configure.sigdata doesn't exist in qemuarm
ERROR: polkit-group-rule-datetime different signature for task do_configure=
=2Esigdata between qemux86copy and qemuarm
Hash for dependent task shadow_4.2.1.bb.do_populate_sysroot changed from ef=
35c98587d35f92312e024d6c19fda7 to b2c13268b7e9cf2a9f4f07613ed4b134
Hash for dependent task polkit_0.111.bb.do_populate_sysroot changed from 09=
971684e84d52aecaae1d48e925927d to 12d1d712ac27acd857ce2ae744fefdbf
Hash for dependent task base-passwd_3.5.29.bb.do_populate_sysroot changed f=
rom b275eb16cdf2e0c8d137153365e71d91 to 99d441f565ded88bfdb88f9c2122605d
Hash for dependent task shadow-sysroot_4.2.1.bb.do_populate_sysroot changed=
 from 398a30c683ac078dfaa122046e880854 to 02abc5b9ebfb842d466472989f68d33a

ERROR: polkit-group-rule-network different signature for task do_configure.=
sigdata between qemux86copy and qemuarm
Hash for dependent task shadow_4.2.1.bb.do_populate_sysroot changed from ef=
35c98587d35f92312e024d6c19fda7 to b2c13268b7e9cf2a9f4f07613ed4b134
Hash for dependent task polkit_0.111.bb.do_populate_sysroot changed from 09=
971684e84d52aecaae1d48e925927d to 12d1d712ac27acd857ce2ae744fefdbf
Hash for dependent task base-passwd_3.5.29.bb.do_populate_sysroot changed f=
rom b275eb16cdf2e0c8d137153365e71d91 to 99d441f565ded88bfdb88f9c2122605d
Hash for dependent task shadow-sysroot_4.2.1.bb.do_populate_sysroot changed=
 from 398a30c683ac078dfaa122046e880854 to 02abc5b9ebfb842d466472989f68d33a

ERROR: xserver-common different signature for task do_configure.sigdata bet=
ween qemux86copy and qemuarm
Hash for dependent task eglibc_2.19.bb.do_populate_sysroot changed from 9ee=
4ec70d0adcd47ae9f6c5e47e48eb8 to 2b5c3de6165e76e3867f834b8dc9faf8

ERROR: xuser-account different signature for task do_configure.sigdata betw=
een qemux86copy and qemuarm
Hash for dependent task shadow_4.2.1.bb.do_populate_sysroot changed from ef=
35c98587d35f92312e024d6c19fda7 to b2c13268b7e9cf2a9f4f07613ed4b134
Hash for dependent task base-passwd_3.5.29.bb.do_populate_sysroot changed f=
rom b275eb16cdf2e0c8d137153365e71d91 to 99d441f565ded88bfdb88f9c2122605d
Hash for dependent task shadow-sysroot_4.2.1.bb.do_populate_sysroot changed=
 from 398a30c683ac078dfaa122046e880854 to 02abc5b9ebfb842d466472989f68d33a

ERROR: 6 errors found in /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate-=
diff/1406164182/signatures.qemuarm.do_configure.sigdata.log


 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwee=
n qemux86copy and qemuarm =3D=3D=3D
INFO: grub-efi-native task do_populate_sysroot.sigdata doesn't exist in qem=
uarm
ERROR: libxml-filter-buffertext-perl different signature for task do_popula=
te_sysroot.sigdata between qemux86copy and qemuarm
Hash for dependent task libxml-filter-buffertext-perl_1.01.bb.do_install ch=
anged from c0664a06ae9cc1828f84084b19e28b48 to 3a94085ea4874f2400d33877be11=
c3bb

ERROR: libxml-sax-writer-perl different signature for task do_populate_sysr=
oot.sigdata between qemux86copy and qemuarm
Hash for dependent task libxml-sax-writer-perl_0.54.bb.do_install changed f=
rom 937d2322f2410d19dfaa535de29a6d9c to 7c22648743bb57a8f80c964990be2dd1

INFO: makedevs-native task do_populate_sysroot.sigdata doesn't exist in qem=
uarm
INFO: opkg-native task do_populate_sysroot.sigdata doesn't exist in qemuarm
ERROR: polkit-group-rule-datetime different signature for task do_populate_=
sysroot.sigdata between qemux86copy and qemuarm
Hash for dependent task polkit-group-rule-datetime.bb.do_install changed fr=
om 9d876912566765df8421fec799a17dee to b5dc9ae4b9882ad8a778a880f9918ec1

ERROR: polkit-group-rule-network different signature for task do_populate_s=
ysroot.sigdata between qemux86copy and qemuarm
Hash for dependent task polkit-group-rule-network.bb.do_install changed fro=
m b3a90317d679dc66f4b8b91644907f7b to fc2da3de76ce02d689723debf30c72c2

ERROR: xserver-common different signature for task do_populate_sysroot.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task xserver-common_1.34.bb.do_install changed from b4b8=
012e4789dba696b22f75fd3a19ab to 67077a7e44514aa6988cff25d9127fc0

ERROR: xuser-account different signature for task do_populate_sysroot.sigda=
ta between qemux86copy and qemuarm
Hash for dependent task xuser-account_0.1.bb.do_install changed from 50526d=
8256835edc1c2fa0ded4ae5cb3 to db94ea0af45e1cca37232eb279ad6ccb

ERROR: 6 errors found in /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate-=
diff/1406164182/signatures.qemuarm.do_populate_sysroot.sigdata.log


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemuarm =3D=3D=3D
ERROR: font-alias different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemuarm
Hash for dependent task font-util_1.3.0.bb.do_packagedata changed from 240e=
9f197a35c45e16f7957196d16880 to 8daf39e990b4715cc27dcc79d64b1197

ERROR: libxml-filter-buffertext-perl different signature for task do_packag=
e_write_ipk.sigdata between qemux86copy and qemuarm
Hash for dependent task libxml-filter-buffertext-perl_1.01.bb.do_packagedat=
a changed from 19f9f108f69cbcf6524df72792c0cdf9 to d73678d16d972608711f8663=
017d4942
Hash for dependent task libxml-filter-buffertext-perl_1.01.bb.do_package ch=
anged from fac229152e46ff5e106dd176a1d217b5 to 292bdce4ef6acffae05248e9fe84=
d28e
Hash for dependent task libxml-sax-perl_0.99.bb.do_packagedata changed from=
 620b046110c0cd52e34ff379cc9f5f06 to 442bdc38c98fb050d087e84f62a11fd8
Hash for dependent task perl_5.20.0.bb.do_packagedata changed from 087612f0=
c27730f54fe63df5dcfb4cb8 to bfaa94ddaa3354977afaef6cd7aa38cd

ERROR: libxml-sax-writer-perl different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
Hash for dependent task libxml-sax-writer-perl_0.54.bb.do_package changed f=
rom e4e5b1e43bed90485848001a0a937f50 to b772a20d75274135387a10ca67f0a3b3
Hash for dependent task libxml-filter-buffertext-perl_1.01.bb.do_packagedat=
a changed from 19f9f108f69cbcf6524df72792c0cdf9 to d73678d16d972608711f8663=
017d4942
Hash for dependent task libxml-sax-writer-perl_0.54.bb.do_packagedata chang=
ed from c193b495df6b86760cb4c253665934da to 26ec4e8097d94765a461194c8ba259c3
Hash for dependent task perl_5.20.0.bb.do_packagedata changed from 087612f0=
c27730f54fe63df5dcfb4cb8 to bfaa94ddaa3354977afaef6cd7aa38cd

ERROR: polkit-group-rule-datetime different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
Hash for dependent task polkit-group-rule-datetime.bb.do_package changed fr=
om 8b40a2920a66d6bcab23fc3accb78a99 to 7a0ab3dcd19bfd6a7cbb620ce8abbc91
Hash for dependent task polkit-group-rule-datetime.bb.do_packagedata change=
d from f85f71da3c25b7a4d5c37b216eab0ada to 2b0b1976d3bf8f5b2952ab01a8d93cf9

ERROR: polkit-group-rule-network different signature for task do_package_wr=
ite_ipk.sigdata between qemux86copy and qemuarm
Hash for dependent task polkit-group-rule-network.bb.do_package changed fro=
m e6e441c30b4aacf370f18177e32b6d77 to 92c06f7b7b54f5399925a0868c062427
Hash for dependent task polkit-group-rule-network.bb.do_packagedata changed=
 from c510fa9526f32478cd14078c9a77bd59 to 4aca1231f8c792982f80106f05ad106e

ERROR: shr-theme-neo different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task icon-theme-neo_git.bb.do_packagedata changed from b=
b99a912cc0202066f1e789efc8c9ed9 to c682c613dd47d104e3ea166bedbe55bf

ERROR: terminus-font different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 40=
988bccfdb18819fdd0de4a106f0b1b to 7ec585ec5f12653d537dbd07cc2c809e

ERROR: ttf-arphic-uming different signature for task do_package_write_ipk.s=
igdata between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 40=
988bccfdb18819fdd0de4a106f0b1b to 7ec585ec5f12653d537dbd07cc2c809e

ERROR: ttf-dejavu different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 40=
988bccfdb18819fdd0de4a106f0b1b to 7ec585ec5f12653d537dbd07cc2c809e

ERROR: ttf-droid different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 40=
988bccfdb18819fdd0de4a106f0b1b to 7ec585ec5f12653d537dbd07cc2c809e

ERROR: ttf-gentium different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 40=
988bccfdb18819fdd0de4a106f0b1b to 7ec585ec5f12653d537dbd07cc2c809e

ERROR: ttf-hunkyfonts different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 40=
988bccfdb18819fdd0de4a106f0b1b to 7ec585ec5f12653d537dbd07cc2c809e

ERROR: ttf-inconsolata different signature for task do_package_write_ipk.si=
gdata between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 40=
988bccfdb18819fdd0de4a106f0b1b to 7ec585ec5f12653d537dbd07cc2c809e

ERROR: ttf-liberation different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 40=
988bccfdb18819fdd0de4a106f0b1b to 7ec585ec5f12653d537dbd07cc2c809e

ERROR: ttf-mplus different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 40=
988bccfdb18819fdd0de4a106f0b1b to 7ec585ec5f12653d537dbd07cc2c809e

ERROR: ttf-sazanami different signature for task do_package_write_ipk.sigda=
ta between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 40=
988bccfdb18819fdd0de4a106f0b1b to 7ec585ec5f12653d537dbd07cc2c809e

ERROR: ttf-ubuntu-font-family different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 40=
988bccfdb18819fdd0de4a106f0b1b to 7ec585ec5f12653d537dbd07cc2c809e

ERROR: ttf-wqy-zenhei different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 40=
988bccfdb18819fdd0de4a106f0b1b to 7ec585ec5f12653d537dbd07cc2c809e

ERROR: xserver-common different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
Hash for dependent task xmodmap_1.0.8.bb.do_packagedata changed from fdf761=
8a857d3ec3672bcd1eaeff1902 to 211c8f63cf388c0b5a6acdc67a16a564
Hash for dependent task xinput-calibrator_git.bb.do_packagedata changed fro=
m c38475499ddb41fe9206a8425afa6f34 to 3b6a247698fd479ce409abaa07cba72a
Hash for dependent task fbset_2.1.bb.do_packagedata changed from 7bfb87511c=
1308f0b197f9217607c195 to 45107f2d0183d0ff0e53715d3a99c884
Hash for dependent task xserver-common_1.34.bb.do_package changed from fbd2=
8787175e53550173e2546104ff4d to d02fcc1d6a35982247d61675bfa975d0
Hash for dependent task xdpyinfo_1.3.1.bb.do_packagedata changed from 9ccc7=
a606d555d35e50b36c818509ceb to f55926bf7e31fe6d528f035d54cdcc38
Hash for dependent task xserver-common_1.34.bb.do_packagedata changed from =
61a304293c54e4b435fdb2132411fc2d to 0a936c59786386507e3f4f0bd1335570
Hash for dependent task xrandr_1.4.2.bb.do_packagedata changed from f78bbf9=
1c9ec7e200a60c7adbb2b2309 to e29b329a05a42cccb895d32fd57e12b7

ERROR: xserver-nodm-init different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemuarm
Hash for dependent task xserver-common_1.34.bb.do_packagedata changed from =
61a304293c54e4b435fdb2132411fc2d to 0a936c59786386507e3f4f0bd1335570
Hash for dependent task xserver-nodm-init_2.0.bb.do_packagedata changed fro=
m a129538f89a24a1357b0de8373da8eea to 722561b4290062ded95dc9ac3e24a1f8
Hash for dependent task xinit_1.3.3.bb.do_packagedata changed from ecf69b89=
6b602467b29837ae08e14744 to 9127edcc7a41aa37a9c653064bb467d6
Hash for dependent task xserver-nodm-init_2.0.bb.do_package changed from 11=
52352f70586a76b43a194c957588ed to 6993af4cd634f9de87259762133d5520

ERROR: xuser-account different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task xuser-account_0.1.bb.do_packagedata changed from e6=
467775e5d36624ecd7336bb6e875f7 to 3842064397c3663cf690fd640eeb860c
Hash for dependent task xuser-account_0.1.bb.do_package changed from a13a8d=
b162f032ff8d7e4ef285f41e5b to a4e2528079949221fd5f4401b0fff546

ERROR: 21 errors found in /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate=
-diff/1406164182/signatures.qemuarm.do_package_write_ipk.sigdata.log

--NZiXfHLGvOGtDZMn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPQ66UACgkQN1Ujt2V2gByFSACgrTm3lPHVjTVZeoKNLOxl+RRe
xaIAnip/jC6k9+D90To95TUYHy30h2pF
=vk85
-----END PGP SIGNATURE-----

--NZiXfHLGvOGtDZMn--
