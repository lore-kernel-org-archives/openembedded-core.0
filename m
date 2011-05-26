Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QPimM-0000rX-1C
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 00:11:42 +0200
Received: by fxm19 with SMTP id 19so1193899fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 15:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=92NB434wxdkqEzVZ9oDihb+vkXiAQySZNcZXR3OV5IU=;
	b=pRy4oF3XvfB5rJ7/11XOkZFKbkFOgt46JR4k8bEt6jy6EI+70woy7FUBK05rNhukoZ
	aB+JwpRR+0/uPy3L8oVW78VgRJjq0zvvMz1TrHs/ojZmbAS2Rqgf53mgZ75XFqULbK9k
	mPdludwS2JwTyv4U2YvzS6Ty0pjv2wbpZnazk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=L7DiZxoz8sv/ok2OwNe9WCjq2AW4RIBt1lI55L4vIizDFJAd6UD5g288JSNfg7E0Ip
	xsRCfi49V6xw9VCf7KoeMJ7M4bU7gfl43K5aTGDoYZCqEqr2itpm3sd97MJtrxi8M+gZ
	LyOBkYHgX0Aay4cHj4K4M7Jv6QVixq1KgFr1g=
Received: by 10.223.57.142 with SMTP id c14mr1525325fah.0.1306447717019;
	Thu, 26 May 2011 15:08:37 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id n15sm453504fag.18.2011.05.26.15.08.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 15:08:35 -0700 (PDT)
Date: Fri, 27 May 2011 00:08:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110526220829.GO3222@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Sad story about Shared State
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
X-List-Received-Date: Thu, 26 May 2011 22:11:42 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DBUa/BSa4z6QPQv1"
Content-Disposition: inline

--DBUa/BSa4z6QPQv1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Good evening,

sorry for long and pesimistic e-mail, but I hope that someone will point
me to something I'm doing completely wrong.

First I was surprised to see how many recipes were rebuilt after this
change:
http://git.openembedded.net/cgit.cgi/openembedded-core/commit/?id=3Daebb9d6=
599aac683456adf56dc11f8b9f10f25c3

because [YOCTO #1074] was resolved by bitbake commit:
http://git.openembedded.net/cgit.cgi/bitbake/commit/?id=3D139b8a625818225c3=
58a1b8363518d7ed6913188
and I had rm_work change
http://patches.openembedded.org/patch/4807/
during this build I decided to find out what is changing so many sstate
checksums for such small changes

so I took another small dbus change from patchwork
http://patches.openembedded.org/patch/4831/
and rebuild many recipes again to play with bitbake-diffsig for a while..

$ bitbake shr-lite-image
=2E.. many recipes (efl,gtk,..) were rebuilt ...=20
=2E.. but lets start somewhere close to dbus in dependency tree - pango ...
-rw-r--r-- 1 bitbake bitbake 17636 May 26 21:38 pango-1.28.3-r1.0.do_instal=
l.sigdata.77b947a28726e59e2075edba10e60295
-rw-r--r-- 1 bitbake bitbake 17636 May 26 23:08 pango-1.28.3-r1.0.do_instal=
l.sigdata.222b490aa1dde18f95b0dd32826012bf
$ bitbake-diffsigs pango-1.28.3-r1.0.do_install.sigdata.77b947a28726e59e207=
5edba10e60295 pango-1.28.3-r1.0.do_install.sigdata.222b490aa1dde18f95b0dd32=
826012bf
Hash for dependent task /OE/shr-core/meta-openembedded/meta-oe/recipes-grap=
hics/pango/pango_1.28.3.bb.do_compile changed from 1afaf7d1eced69f56c8f1cf6=
7229ebc2 to 3d1b790028978c4ebda8e8ea4b26c2d7

-rw-r--r-- 1 bitbake bitbake 16031 May 26 21:38 pango-1.28.3-r1.0.do_compil=
e.sigdata.1afaf7d1eced69f56c8f1cf67229ebc2
-rw-r--r-- 1 bitbake bitbake 16031 May 26 23:08 pango-1.28.3-r1.0.do_compil=
e.sigdata.3d1b790028978c4ebda8e8ea4b26c2d7
$ bitbake-diffsigs pango-1.28.3-r1.0.do_compile.sigdata.1afaf7d1eced69f56c8=
f1cf67229ebc2 pango-1.28.3-r1.0.do_compile.sigdata.3d1b790028978c4ebda8e8ea=
4b26c2d7
Hash for dependent task /OE/shr-core/meta-openembedded/meta-oe/recipes-grap=
hics/pango/pango_1.28.3.bb.do_configure changed from 2a2fe90e11a773b704ded6=
d64bbd6b8f to 8c411f1e2b2b3fe6459a4fa873420c8d

-rw-r--r-- 1 bitbake bitbake 24993 May 26 21:37 pango-1.28.3-r1.0.do_config=
ure.sigdata.2a2fe90e11a773b704ded6d64bbd6b8f
-rw-r--r-- 1 bitbake bitbake 24993 May 26 23:08 pango-1.28.3-r1.0.do_config=
ure.sigdata.8c411f1e2b2b3fe6459a4fa873420c8d
$ bitbake-diffsigs pango-1.28.3-r1.0.do_configure.sigdata.2a2fe90e11a773b70=
4ded6d64bbd6b8f pango-1.28.3-r1.0.do_configure.sigdata.8c411f1e2b2b3fe6459a=
4fa873420c8d
Hash for dependent task /OE/shr-core/meta-openembedded/meta-oe/recipes-grap=
hics/cairo/cairo_1.10.0.bb.do_populate_sysroot changed from fe20d4ce2bb2bf7=
30d027febf2dfeb27 to 0454302dbff3f34b36967a4679940349
Hash for dependent task /OE/shr-core/meta-openembedded/meta-oe/recipes-core=
/glib-2.0/glib-2.0_git.bb.do_populate_sysroot changed from 45d7590c46684333=
0d9b788b253238d8 to 68a4f9b8d7c1fafea99be54e5a2da220

following 2nd change because it's shorter route to dbus change..

-rw-r--r-- 1 bitbake bitbake 19K May 26 21:35 sstate-cache/sstate-glib-2.0-=
armv4t-oe-linux-gnueabi-2.29.3+gitr1+d97cbc6731deab137770bc0fe9c69b06f689f5=
b4-r1-armv4t-2-45d7590c466843330d9b788b253238d8_populate-sysroot.tgz.siginfo
-rw-r--r-- 1 bitbake bitbake 19K May 26 23:05 sstate-cache/sstate-glib-2.0-=
armv4t-oe-linux-gnueabi-2.29.3+gitr1+d97cbc6731deab137770bc0fe9c69b06f689f5=
b4-r1-armv4t-2-68a4f9b8d7c1fafea99be54e5a2da220_populate-sysroot.tgz.siginfo
$ bitbake-diffsigs sstate-cache/sstate-glib-2.0-armv4t-oe-linux-gnueabi-2.2=
9.3+gitr1+d97cbc6731deab137770bc0fe9c69b06f689f5b4-r1-armv4t-2-45d7590c4668=
43330d9b788b253238d8_populate-sysroot.tgz.siginfo sstate-cache/sstate-glib-=
2.0-armv4t-oe-linux-gnueabi-2.29.3+gitr1+d97cbc6731deab137770bc0fe9c69b06f6=
89f5b4-r1-armv4t-2-68a4f9b8d7c1fafea99be54e5a2da220_populate-sysroot.tgz.si=
ginfo=20
Hash for dependent task /OE/shr-core/meta-openembedded/meta-oe/recipes-core=
/glib-2.0/glib-2.0_git.bb.do_install changed from 2bc0418b6ff355c63d66183b6=
390767d to fa5d28375a53c5095982070678980132

-rw-r--r-- 1 bitbake bitbake 17277 May 26 21:35 tmp/stamps/armv4t-oe-linux-=
gnueabi/glib-2.0-1_2.29.3+gitr1+d97cbc6731deab137770bc0fe9c69b06f689f5b4-r1=
=2Edo_install.sigdata.2bc0418b6ff355c63d66183b6390767d
-rw-r--r-- 1 bitbake bitbake 17277 May 26 23:05 tmp/stamps/armv4t-oe-linux-=
gnueabi/glib-2.0-1_2.29.3+gitr1+d97cbc6731deab137770bc0fe9c69b06f689f5b4-r1=
=2Edo_install.sigdata.fa5d28375a53c5095982070678980132
$ bitbake-diffsigs glib-2.0-1_2.29.3+gitr1+d97cbc6731deab137770bc0fe9c69b06=
f689f5b4-r1.do_install.sigdata.2bc0418b6ff355c63d66183b6390767d glib-2.0-1_=
2.29.3+gitr1+d97cbc6731deab137770bc0fe9c69b06f689f5b4-r1.do_install.sigdata=
=2Efa5d28375a53c5095982070678980132
Hash for dependent task /OE/shr-core/meta-openembedded/meta-oe/recipes-core=
/glib-2.0/glib-2.0_git.bb.do_compile changed from e67b51e60d7591b28b0a19a35=
a061fb7 to 0d670ad6e3c8f3e5a0380236cdb80056

-rw-r--r-- 1 bitbake bitbake 16K May 26 23:05 glib-2.0-1_2.29.3+gitr1+d97cb=
c6731deab137770bc0fe9c69b06f689f5b4-r1.do_compile.sigdata.0d670ad6e3c8f3e5a=
0380236cdb80056
-rw-r--r-- 1 bitbake bitbake 16K May 26 21:35 glib-2.0-1_2.29.3+gitr1+d97cb=
c6731deab137770bc0fe9c69b06f689f5b4-r1.do_compile.sigdata.e67b51e60d7591b28=
b0a19a35a061fb7
$ bitbake-diffsigs glib-2.0-1_2.29.3+gitr1+d97cbc6731deab137770bc0fe9c69b06=
f689f5b4-r1.do_compile.sigdata.*
Hash for dependent task /OE/shr-core/meta-openembedded/meta-oe/recipes-core=
/glib-2.0/glib-2.0_git.bb.do_configure changed from 32a3526d951c1cfda7d0986=
d401aac28 to 86d1c9dd8ed0dfceb74120634f4ee971

-rw-r--r-- 1 bitbake bitbake 25K May 26 23:04 glib-2.0-1_2.29.3+gitr1+d97cb=
c6731deab137770bc0fe9c69b06f689f5b4-r1.do_configure.sigdata.32a3526d951c1cf=
da7d0986d401aac28
-rw-r--r-- 1 bitbake bitbake 25K May 26 21:34 glib-2.0-1_2.29.3+gitr1+d97cb=
c6731deab137770bc0fe9c69b06f689f5b4-r1.do_configure.sigdata.86d1c9dd8ed0dfc=
eb74120634f4ee971
bitbake-diffsigs glib-2.0-1_2.29.3+gitr1+d97cbc6731deab137770bc0fe9c69b06f6=
89f5b4-r1.do_configure.sigdata.*
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-core/db=
us/dbus_1.4.1.bb.do_populate_sysroot changed from 06a8b2e32ba10864a6fc09791=
2833176 to fe413a8f790ae3f6ce7a22deea084cfc
Hash for dependent task virtual:native:/OE/shr-core/meta-openembedded/meta-=
oe/recipes-core/glib-2.0/glib-2.0_git.bb.do_populate_sysroot changed from 1=
8f974e09d0fd66cc765866ab565b333 to 51430fcfa8309f9a9276c1e602429f32

-rw-r--r-- 1 bitbake bitbake 19K May 26 21:30 sstate-dbus-armv4t-oe-linux-g=
nueabi-1.4.1-r3-armv4t-2-fe413a8f790ae3f6ce7a22deea084cfc_populate-sysroot.=
tgz.siginfo
-rw-r--r-- 1 bitbake bitbake 19K May 26 23:00 sstate-dbus-armv4t-oe-linux-g=
nueabi-1.4.1-r4-armv4t-2-06a8b2e32ba10864a6fc097912833176_populate-sysroot.=
tgz.siginfo
$ bitbake-diffsigs sstate-dbus-armv4t-oe-linux-gnueabi-1.4.1-r3-armv4t-2-fe=
413a8f790ae3f6ce7a22deea084cfc_populate-sysroot.tgz.siginfo sstate-dbus-arm=
v4t-oe-linux-gnueabi-1.4.1-r4-armv4t-2-06a8b2e32ba10864a6fc097912833176_pop=
ulate-sysroot.tgz.siginfo
basehash changed from ef08f39470f19b15d24f9dac466d0f4c to 7841aff775985c1eb=
6c2dae88f5aa8a4
Variable PR value changed from r3 to r4
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-core/db=
us/dbus_1.4.1.bb.do_install changed from a45db97e2ceeecb9e0335f521cc310b7 t=
o 39276f431220a1d8c29857031ad05fb1

-rw-r--r-- 1 bitbake bitbake 17K May 26 21:30 dbus-1.4.1-r3.do_install.sigd=
ata.a45db97e2ceeecb9e0335f521cc310b7
-rw-r--r-- 1 bitbake bitbake 17K May 26 23:00 dbus-1.4.1-r4.do_install.sigd=
ata.39276f431220a1d8c29857031ad05fb1
$ bitbake-diffsigs dbus-1.4.1-r*do_install*sigdata*
basehash changed from 353b2f86e0001c380d17efc7ea6ce2c5 to 234e7bf0263eda31d=
eb9d7b644f2e7cf
Variable PR value changed from r3 to r4
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-core/db=
us/dbus_1.4.1.bb.do_compile changed from f6e2879a484955efa017c6ab32a5509a t=
o e24cd7b5f9dd3e18cbbca0008d3814da

-rw-r--r-- 1 bitbake bitbake 16K May 26 21:30 dbus-1.4.1-r3.do_compile.sigd=
ata.f6e2879a484955efa017c6ab32a5509a
-rw-r--r-- 1 bitbake bitbake 16K May 26 23:00 dbus-1.4.1-r4.do_compile.sigd=
ata.e24cd7b5f9dd3e18cbbca0008d3814da
$ bitbake-diffsigs dbus-1.4.1-r*do_compile*sigdata*
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-core/db=
us/dbus_1.4.1.bb.do_configure changed from 56d3d4f8c7e312651b0312983fd0111b=
 to c9735abe8bd30b126c6c96cf4940f413

-rw-r--r-- 1 bitbake bitbake 25K May 26 21:30 dbus-1.4.1-r3.do_configure.si=
gdata.56d3d4f8c7e312651b0312983fd0111b
-rw-r--r-- 1 bitbake bitbake 25K May 26 23:00 dbus-1.4.1-r4.do_configure.si=
gdata.c9735abe8bd30b126c6c96cf4940f413
OE @ ~/shr-core/tmp/stamps/armv4t-oe-linux-gnueabi $ bitbake-diffsigs dbus-=
1.4.1-r*do_configure*sigdata*
basehash changed from 7c8afe5d11242edc07d33b7a099ddbaa to f8c3cb2c46f77feb2=
3750921b5c2c0be
Variable PR value changed from r3 to r4
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-core/db=
us/dbus_1.4.1.bb.do_patch changed from 84b94d5311ac57ce52576707e36e1280 to =
f7844c10b663a87f0e2d64d1db150125
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-core/db=
us/dbus_1.4.1.bb.do_unpack changed from f1490bb761693eebb94c4264eae59905 to=
 90868c27ba834e0557eeeeac70ff8052

$ bitbake-diffsigs dbus-1.4.1-r*do_patch*sigdata*
basehash changed from 8f395933e8dc8bfef6ab807a3d61688e to 478ed1531b11d7e71=
546c3322eb00818
Variable PR value changed from r3 to r4
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-core/db=
us/dbus_1.4.1.bb.do_unpack changed from f1490bb761693eebb94c4264eae59905 to=
 90868c27ba834e0557eeeeac70ff8052
$ bitbake-diffsigs dbus-1.4.1-r*do_unpack*sigdata*
basehash changed from 3154be70060b894d8bc19355edc4b78c to 9bbf619b99d6b8fd0=
d36f215cd6ae293
Variable PR value changed from r3 to r4

=2E. end of story ..

=2E. I agree it's "right (TM)" to rebuild not only changed package but also=
 its dependencies ..
=2E. I agree it's not possible to differentiate between important library c=
hange
   which can infulence also packages depending on it even if only transitiv=
e and
   cosmetic change improving ie RDEPENDS_${PN} which doesn't influence even=
 direct dependants
=2E. but impact of such small change on small shr-lite-image?
   almost 2 hours on my quadcore AMD Phenom(tm) II X4 965@3.4Ghz, 4GB RAM, =
tmp/work on raid0 (3 SATA2 discs)

guess how long is runqueue when someone bumps binutils or gcc PR.. it's lik=
e DISTRO_PR bump :/
but almost after every "git pull --rebase".

this was for our minimal image
task-shr-feed we have in old OE takes about 2-3 days on our buildhost (dual=
core with 2GB ram)
for 1 arch, we (SHR) are supporting 3 arm architectures=20
armv4t (om-gta01, om-gta02), armv6-novfp (htcdream), armv7a (palmpre, palmp=
re2, nokia900)
so currently it takes 10-14 days to rebuild feed after DISTRO_PR change..

I'm not sure if we can afford our feeds to track oe-core/meta-oe HEADs=20
like we did with old OE :(.

Is it expected use-case to base layers only on released version of=20
oe-core/meta-oe and never touch recipes which are higher in dependency tree?

Is it possible to disable sstate and do DISTRO_PR bumps manually when=20
distro maintainder decides it's really needed and buildhost is free=20
for long enough to populate feeds?

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DBUa/BSa4z6QPQv1--
