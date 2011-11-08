Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNmtf-00071L-J0
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 15:43:31 +0100
Received: by faat2 with SMTP id t2so579514faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2011 06:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=AE/48p/olMIIDvutZtgzclO3HKCYnOrVXh1nzHmoRH8=;
	b=T4wXzfq/AthyBci+Z8rYzYFZPbd0uKAQ6ADb7PWMn3YIkoOMAiCUP1veX45NGR329P
	MX4d91f+lxO7codF78kOddtHRc6XSR1rQDc33hDWzhBY7Iprilfn/eXUEfLFNmS6GEXl
	zKoQF0NjGFFe8cV14u85IbdYPzKLXdABAbMfg=
Received: by 10.223.17.23 with SMTP id q23mr55115425faa.11.1320763034263;
	Tue, 08 Nov 2011 06:37:14 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d3sm2381900fad.2.2011.11.08.06.37.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 06:37:13 -0800 (PST)
Date: Tue, 8 Nov 2011 15:37:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111108143701.GC3641@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: BB_SIGNATURE_HANDLER = "basichash" unusable strict?
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
X-List-Received-Date: Tue, 08 Nov 2011 14:43:31 -0000
X-Groupsio-MsgNum: 12100
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline

--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Today I've started build from scratch and dediced to give basichash a try (=
as it is supposed to become default IIRC):

So after cleaning tmpdir, sstate cache, pseudo I've started clean build..

1) bitbake -k gcc-cross | tee -a log.${MACHINE};=20
2) bitbake -k virtual/kernel | tee -a log.${MACHINE};=20
3) bitbake -k core-image-core | tee -a log.${MACHINE};=20
4) bitbake -k shr-lite-image  | tee -a log.${MACHINE};=20

But then I've noticed that after successfull build of gcc-cross in step 1 i=
t started another gcc-* build in step 2..

$ bitbake-diffsigs sstate-cache/sstate-gcc-cross-initial-armv4t-oe-linux-gn=
ueabi-4.6.1+svnr180099-r18-x86_64_armv4t-2-*_populate-lic.tgz.siginfo
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-devtool=
s/gcc/gcc-cross-initial_4.6.bb.do_patch changed from 27ad89a6c7a2909c692d70=
ef9e5f35f3 to 1226ce1337b5619d6ac4b3e5b4f7ad8d

$ bitbake-diffsigs tmp-eglibc/stamps/armv4t-oe-linux-gnueabi/gcc-cross-init=
ial-4.6.1+svnr180099-r18.do_patch.sigdata.*
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-devtool=
s/gcc/gcc-cross-initial_4.6.bb.do_headerfix changed from b3744b0f4ce6528b83=
cfd41819f5dfac to 155191eba6adf57f8bb0dbfa3328e86d
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-devtool=
s/gcc/gcc-cross-initial_4.6.bb.do_unpack changed from 916fc502f05393665f6ce=
2b739f2bbdd to 607514e9b955d0574ca73d68ac1c4909

$ bitbake-diffsigs tmp-eglibc/stamps/armv4t-oe-linux-gnueabi/gcc-cross-init=
ial-4.6.1+svnr180099-r18.do_unpack.sigdata.*
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-devtool=
s/gcc/gcc-cross-initial_4.6.bb.do_fetch changed from 0d06e2791086ad47e27f62=
d4d3a5fb64 to 2d49d81052858f923d2509004fe9b25a

$ bitbake-diffsigs tmp-eglibc/stamps/armv4t-oe-linux-gnueabi/gcc-cross-init=
ial-4.6.1+svnr180099-r18.do_fetch.sigdata.*
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-devtools/subversion/subversion_1.7.0.bb.do_populate_sysroot changed=
 from d09614a543e3363f048e7b109fcd018e to 5a8f4950f420ea8c502a088425784a67

$ bitbake-diffsigs sstate-cache/sstate-subversion-native-x86_64-linux-1.7.0=
-r0-x86_64-2-*populate-sysroot.tgz.siginfo
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-devtools/subversion/subversion_1.7.0.bb.do_install changed from fa7=
e205110d0d39d245e2e8026353121 to 5bfeb570596bd50c4f0c39c25b7801cd

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/subversion-native-1.7.0-r=
0.do_install.sigdata.*
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-devtools/subversion/subversion_1.7.0.bb.do_compile changed from e99=
a13758e0b55409de0a6773333a7fc to 562b9e2fd556973a7f3785e1a6b5bd40

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/subversion-native-1.7.0-r=
0.do_compile.sigdata.*
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-devtools/subversion/subversion_1.7.0.bb.do_configure changed from 5=
f19d874d3c5435aa04e30948a35769c to 4d33c1af00bd7256d169f3558aa3ce64

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/subversion-native-1.7.0-r=
0.do_configure.sigdata.*
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-support/neon/neon_0.29.6.bb.do_populate_sysroot changed from bec257=
48384aaf2082943c484f3efa67 to 3c63f185b68a70934066deed691e5c86

$ bitbake-diffsigs sstate-cache/sstate-neon-native-x86_64-linux-0.29.6-r0-x=
86_64-2-*populate-sysroot.tgz.siginfo
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-support/neon/neon_0.29.6.bb.do_install changed from 4da3b0fda3d78e2=
d9240823c7e4a0b12 to 099cbf5b04054ea6d0180c2ea8d55893

$ bitbake-diffsigs sstate-cache/sstate-neon-native-x86_64-linux-0.29.6-r0-x=
86_64-2-*populate-sysroot.tgz.siginfo
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-support/neon/neon_0.29.6.bb.do_install changed from 4da3b0fda3d78e2=
d9240823c7e4a0b12 to 099cbf5b04054ea6d0180c2ea8d55893

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/neon-native-0.29.6-r0.do_=
install.sigdata.*
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-support/neon/neon_0.29.6.bb.do_compile changed from 3fe8f07d07e3837=
e5def65d6ad526fad to cf92f049a9358396c57dd3afe89a097e

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/neon-native-0.29.6-r0.do_=
compile.sigdata.*
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-support/neon/neon_0.29.6.bb.do_configure changed from fea13b2a72cee=
c337b9e99b2e688ce22 to 470409c68f202204094c0fb78ea0bb9c

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/neon-native-0.29.6-r0.do_=
configure.sigdata.*
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-core/libxml/libxml2_2.7.8.bb.do_populate_sysroot changed from 85a14=
f7a73ea96fe85227c5a4bac3f1f to f3bbb2f69cdef3ee60360fbbd6fab311

$ bitbake-diffsigs sstate-cache/sstate-libxml2-native-x86_64-linux-2.7.8-r*=
populate-sysroot.tgz.siginfo
basehash changed from 306c63118517faab316c218dd29b9bf3 to 8cfccf0b10cde4211=
693f56e5a96e12e
Variable PR value changed from r3 to r4
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-core/libxml/libxml2_2.7.8.bb.do_install changed from 57f3a4db8953b2=
ce5dbc363757c03b7e to 17fbf32e34250f887781b708b39a3086

Ah.. yes I did 2 small patches to libxml2 and openssl between step 1 and st=
ep2:
http://patchwork.openembedded.org/patch/14521/
http://patchwork.openembedded.org/patch/14519/

But do we want to rebuild everything after every change small like this?
Or is it configuration issue or just bug in sstate implementation?

Btw libxml2 isn't first difference.. I can dig more..

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/libxml2-native-2.7.8-r*do=
_install.sigdata*
basehash changed from 62dc1c0a61f00ddf535653092ac6b990 to 6a0264b149637ff9e=
d4cc4131dbb8281
Variable PR value changed from r3 to r4
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-core/libxml/libxml2_2.7.8.bb.do_compile changed from 6a22c51bd60c2c=
9cd5d1449049fbc594 to 6fa97d974fbbee1191565d2d1093f61f

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/libxml2-native-2.7.8-r*do=
_compile.sigdata*
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-core/libxml/libxml2_2.7.8.bb.do_configure changed from 15cb4d383c2c=
dbdc14fa03465ba12994 to 0b0d0799166dd435bd3bfd7f8013e601

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/libxml2-native-2.7.8-r*do=
_configure.sigdata*
basehash changed from e64cbe7dbb385da9105320b536b413f4 to a5daed8957519be42=
f83c33d8674a3b1
Variable PR value changed from r3 to r4
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-core/libxml/libxml2_2.7.8.bb.do_patch changed from d5143d7e48c26966=
de6cd61a1c432429 to 13eb7410db1ca3751b200cdebd0634f6
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-devtool=
s/python/python-native_2.7.2.bb.do_populate_sysroot changed from ceefb2abf0=
808fa4224854d17e8f361b to ee687271695d9ac1ac5463e0891bc67c

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/libxml2-native-2.7.8-r*do=
_patch.sigdata*
basehash changed from d09eeb290e84cc693a2511fd22fc115e to 21637f5f0f972a331=
66ce82f9c25cd32
Variable PR value changed from r3 to r4
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-core/libxml/libxml2_2.7.8.bb.do_unpack changed from 80fbdd88cf3e4bf=
7faa04b5aa1689bb5 to 2bc535cff2ff219fb1549bbcb3f8d40f

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/libxml2-native-2.7.8-r*do=
_unpack.sigdata*
basehash changed from f37acfa6dffa81ed3e7339f794e546c1 to 3dfdc9a2be00284ec=
0a7010a286a470c
Variable PR value changed from r3 to r4

$ bitbake-diffsigs sstate-cache/sstate-python-native-x86_64-linux-2.7.2-r0.=
0-x86_64-2-*populate-sysroot.tgz.siginfo
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-devtool=
s/python/python-native_2.7.2.bb.do_install changed from cc1386028c2c1849e65=
032e03e4bbc3c to 3cbe787cc4f489db10ab55d62ba7fa70

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/python-native-2.7.2-r0.0.=
do_install.sigdata.*
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-devtool=
s/python/python-native_2.7.2.bb.do_compile changed from 891f9adecc7d0e87f03=
b953b8bf67b29 to 79e4cebf62bc4a973d27a74984a0f1cc

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/python-native-2.7.2-r0.0.=
do_compile.sigdata.*
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-devtool=
s/python/python-native_2.7.2.bb.do_configure changed from 365565f55cf4df1a9=
0438320ff760897 to 8fad169835037b6d8081481603036be8

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/python-native-2.7.2-r0.0.=
do_configure.sigdata.*
Hash for dependent task virtual:native:/OE/shr-core/meta-openembedded/meta-=
oe/recipes-connectivity/openssl/openssl_1.0.0e.bb.do_populate_sysroot chang=
ed from aaaf818a6acd42821a765910705fdbe3 to 76f61b8f3b9894caac33589daf4cb05b

$ bitbake-diffsigs sstate-cache/sstate-openssl-native-x86_64-linux-1.0.0e-r=
14.*populate-sysroot.tgz.siginfo
basehash changed from df1102af82e7c91406e7af4f8a2a588e to 98fbaf83c6220b8e8=
92475967c251c75
Variable PR value changed from ${INC_PR}.3 to ${INC_PR}.4
Hash for dependent task virtual:native:/OE/shr-core/meta-openembedded/meta-=
oe/recipes-connectivity/openssl/openssl_1.0.0e.bb.do_install changed from f=
ff1adc3d5ffab89798fd2e7c7e3278e to b3eacc0fffeb29d03880ae53eba77307

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/openssl-native-1.0.0e-r14=
=2E*do_install.sigdata*
basehash changed from de6aa28ab623161658d03dd8465558e7 to 81ecc9ba2506e7d8f=
3b7036fafc44fe4
Variable PR value changed from ${INC_PR}.3 to ${INC_PR}.4
Hash for dependent task virtual:native:/OE/shr-core/meta-openembedded/meta-=
oe/recipes-connectivity/openssl/openssl_1.0.0e.bb.do_compile changed from 8=
1948f726657b1a54df49717006e3eb8 to 3ea129c0a248c274b57d71002150664f

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/openssl-native-1.0.0e-r14=
=2E*do_compile.sigdata*
Hash for dependent task virtual:native:/OE/shr-core/meta-openembedded/meta-=
oe/recipes-connectivity/openssl/openssl_1.0.0e.bb.do_configure changed from=
 c70f8fa60f7680a69b2efa9b3328b363 to f6d20bac2b382c853e73cd1d276e3ed6

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/openssl-native-1.0.0e-r14=
=2E*do_configure.sigdata*
Hash for dependent task virtual:native:/OE/shr-core/meta-openembedded/meta-=
oe/recipes-connectivity/openssl/openssl_1.0.0e.bb.do_patch changed from 235=
2761d461df7639a4700c346bf944c to 231d6c0c919e6c86961397f2100288a3

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/openssl-native-1.0.0e-r14=
=2E*do_patch.sigdata*
basehash changed from 42b5dc2d5bf3214822c1fca56a823b93 to 44c20013d47432071=
3936ab78ddd79d2
Variable PR value changed from ${INC_PR}.3 to ${INC_PR}.4
Hash for dependent task virtual:native:/OE/shr-core/meta-openembedded/meta-=
oe/recipes-connectivity/openssl/openssl_1.0.0e.bb.do_unpack changed from fb=
9a2dae9ddc97d158c2f41c67ecffdd to 20325a8541ca8d988c24343d45c0e908

$ bitbake-diffsigs tmp-eglibc/stamps/x86_64-linux/openssl-native-1.0.0e-r14=
=2E*do_unpack.sigdata*
basehash changed from 69ae853186255c752cb79bc6747ab5ca to 72f78bacf7e8b5f21=
b25f9189f2abf40
Variable PR value changed from ${INC_PR}.3 to ${INC_PR}.4

I have few extra patches in my branch so for this particular test case you =
also need ie
http://patchwork.openembedded.org/patch/13699/

But it shouldn't be hard to find similar issue for any other dependency tre=
e (ie with git-native instead of subversion-native).

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk65Po0ACgkQN1Ujt2V2gBx1DgCeL2Kjk51opMKhF3ImQbQ7rOvF
PucAoLeMHCGSByNHDMgsnFz+tsmOwFmx
=q8Ec
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
