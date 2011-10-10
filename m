Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDHSr-0002C0-Ow
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 17:08:25 +0200
Received: by bke11 with SMTP id 11so8606915bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 08:02:40 -0700 (PDT)
Received: by 10.223.64.65 with SMTP id d1mr32770703fai.32.1318258959889;
	Mon, 10 Oct 2011 08:02:39 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a7sm32026185fam.22.2011.10.10.08.02.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Oct 2011 08:02:38 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1318255623.23801.31.camel@ted>
Date: Mon, 10 Oct 2011 17:02:32 +0200
Message-Id: <1FEC2574-7F52-460C-A837-4A66C9DF1834@dominion.thruhere.net>
References: <1318255623.23801.31.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH] bitbake.conf: Exclude MACHINE from OVERRIDES variable dependency list
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
X-List-Received-Date: Mon, 10 Oct 2011 15:08:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 okt. 2011, om 16:06 heeft Richard Purdie het volgende geschreven:

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a1420cf..11d76b8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -669,6 +669,7 @@ AUTO_LIBNAME_PKGS =3D "${PACKAGES}"
> OVERRIDES =3D =
"${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES=
}:${DISTROOVERRIDES}:forcevariable"
> DISTROOVERRIDES ?=3D "${DISTRO}"
> MACHINEOVERRIDES ?=3D "${MACHINE}"
> +OVERRIDES[vardepsexclude] =3D "MACHINE"
>=20
> CPU_FEATURES ?=3D ""
> CPU_FEATURES_arm ?=3D "vfp"


MACHINE=3Domap4430-panda bitbake bash -c cleansstate
MACHINE=3Dbeagleboard bitbake bash
MACHINE=3Domap4430-panda bitbake bash

It fully built bash in both case, the diffsig sleuthing I was able to =
do:

=
koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/stamps/armv7a-=
angstrom-linux-gnueabi$ ls | grep bash | grep sigdata | sort
bash-4.1-r2.do_cleansstate.sigdata.dade34525ff3d7567b7e86b24a36307b
bash-4.1-r2.do_fetch.sigdata.15f6bc3de53f1de78303e73688c4f340
bash-4.1-r2.do_unpack.sigdata.980bf1d8267fee1ac36b68c96c4f268c
bash-4.1-r2.do_patch.sigdata.0185f3c332733ffa162bc38244f2f0b4
bash-4.1-r2.do_configure.sigdata.4527bef6d2e22f73a51628c2ac5e7d4e
bash-4.1-r2.do_compile.sigdata.d5cb0399ec5f76911c78cfc99a05663a
bash-4.1-r2.do_install.sigdata.b1781f7a0718ba9922a970820d565455
bash-4.1-r2.do_package.sigdata.2a38d9a1a086e31e620321c1b346514f
bash-4.1-r2.do_package.sigdata.4c4f326e3ba2029d207aca186c9ea332
=
bash-4.1-r2.do_package_write_ipk.sigdata.191dbf64100c3b552a86c361a07e134f
bash-4.1-r2.do_populate_sysroot.sigdata.1643e8bfc8905ff3f269b8ca40d16d17
bash-4.1-r2.do_rm_work_all.sigdata.25cbc1786f8d193c1569e77497d098af
bash-4.1-r2.do_rm_work_all.sigdata.d019b1e392601856aa407615da0c54af
bash-4.1-r2.do_rm_work.sigdata.1453d491285d51b9a88a913bcc6cc72c
bash-4.1-r2.do_rm_work.sigdata.b8f0f9e26355b721638b66069ad83e4e
bash-4.1-r2.do_populate_lic.sigdata.c7c785ae2f366e5a0d8bea4e144e43d0

=
koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/stamps/armv7a-=
angstrom-linux-gnueabi$ bitbake-diffsigs =
bash-4.1-r2.do_package.sigdata.2a38d9a1a086e31e620321c1b346514f =
bash-4.1-r2.do_package.sigdata.4c4f326e3ba2029d207aca186c9ea332
basehash changed from da302dbd386f214d39fbd6fb01267c8d to =
1b439cf1d8c12894e96e96b299a27c12
Variable MACHINE value changed from beagleboard to omap4430-panda
Hash for dependent task =
/OE/tentacle/sources/openembedded-core/meta/recipes-devtools/libtool/libto=
ol-cross_2.4.bb.do_package changed from 98213433ce27776be6f1aa236cbcb6d6 =
to 49add8f8b038b933aa29dd5d90f06c5b
Hash for dependent task =
virtual:native:/OE/tentacle/sources/openembedded-core/meta/recipes-devtool=
s/autoconf/autoconf_2.68.bb.do_package changed from =
dd35fff900f7fd369bbb9eb360308c38 to beef6d088d6d3fff588e78a87a4a4380
Hash for dependent task =
virtual:native:/OE/tentacle/sources/openembedded-core/meta/recipes-core/ge=
ttext/gettext_0.18.1.1.bb.do_package changed from =
30e0a0e6c69119f07c8d1a0d697a86e9 to 2087c79a461c2b312b7c988b29e7cb2d
Hash for dependent task =
virtual:native:/OE/tentacle/sources/openembedded-core/meta/recipes-devtool=
s/gnu-config/gnu-config_20080123.bb.do_package changed from =
017db30f24324e1d2db3ca2b664b68cc to 411dfae70ffa50f8b52a2d9a07948c91
Hash for dependent task =
/OE/tentacle/sources/openembedded-core/meta/recipes-core/gettext/gettext_0=
.18.1.1.bb.do_package changed from 035d53ae6aa5c89a0272671f28214949 to =
b160afaacda3f764244c16dfa4455cf0
Hash for dependent task =
virtual:native:/OE/tentacle/sources/openembedded-core/meta/recipes-devtool=
s/automake/automake_1.11.1.bb.do_package changed from =
feb06b92c7f806cfe8fc24e1914c0047 to 45f0207af62a6142d66da0692f3d6121
Hash for dependent task =
/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc_=
2.12.bb.do_package changed from 04dcab1d3d0c51bdb6c415c8a2b9ff54 to =
c23a8d2301faed76bbb7be8883a9aa88
Hash for dependent task =
/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cr=
oss_4.5.bb.do_package changed from 8666b64d68eb05e4060759f0a6a4db5e to =
183f985ad016d9eecf65a117df3b5ef2
Hash for dependent task =
virtual:native:/OE/tentacle/sources/openembedded-core/meta/recipes-devtool=
s/bison/bison_2.5.bb.do_package changed from =
b8a24af74efee0ca32c2cb8e2b8d14e3 to d3b72610abb4dba152942df5f2455665
Hash for dependent task =
/OE/tentacle/sources/openembedded-core/meta/recipes-devtools/libtool/libto=
ol-native_2.4.bb.do_package changed from =
03ef6e8d51de68fe2f59511a286e6039 to c3e0e363794b7f783b436ac974a1343c
Hash for dependent task =
/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-ru=
ntime_4.5.bb.do_package changed from e377698b3e70352a515f783e416c9506 to =
ca985e80d151e9ccded4caff4c462fa6
Hash for dependent task =
/OE/tentacle/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5=
.9.bb.do_package changed from 7975ab7832c91d8d2d62136fa16c7c4d to =
7177629405a668b2cab828455c418302



