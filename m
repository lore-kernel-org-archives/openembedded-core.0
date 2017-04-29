Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A083571B9C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Apr 2017 18:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6EE8518288;
	Sat, 29 Apr 2017 20:07:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id J6QqRzZ_OUhp; Sat, 29 Apr 2017 20:07:53 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id AA45F18111;
	Sat, 29 Apr 2017 20:07:53 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FB291A058;
	Sat, 29 Apr 2017 20:07:53 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6AFB01A040;
	Sat, 29 Apr 2017 20:07:53 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Sat, 29 Apr 2017 20:07:53 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 5D2272384;
	Sat, 29 Apr 2017 20:07:53 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Sat, 29 Apr 2017 20:07:53 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Sat, 29 Apr 2017 20:07:52 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Sat, 29 Apr 2017 20:07:53 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2] Handle the hossttools directory when
	restoring from the sstate cache
Thread-Index: AQHSwMYhHhJ8zAKJ+EukMsd3gJwA+qHci6ow
Date: Sat, 29 Apr 2017 18:07:52 +0000
Message-ID: <8681b4fb223c4d4dbf3944533891f4b8@XBOX02.axis.com>
References: <cover.1493391620.git.pkj@axis.com>
	<1493455974.19076.167.camel@linuxfoundation.org>
In-Reply-To: <1493455974.19076.167.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 0/2] Handle the hossttools directory when restoring from the sstate cache
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
X-List-Received-Date: Sat, 29 Apr 2017 18:08:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: den 29 april 2017 10:53
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 0/2] Handle the hossttools directory when
> restoring from the sstate cache
>=20
> On Fri, 2017-04-28 at 17:01 +0200, Peter Kjellerstedt wrote:
> > After the introduction of copying host tools to the build directory
> > and cleaning out $PATH, we got a problem with one of our tools. It
> > turned out that its configure.ac uses AC_PATH_PROG(PERL, perl) to
> > locate the perl interpreter, and uses that on the shebang line of the
> > installed tool. Previously it found /usr/bin/perl and used that, but
> > now it will find ${TMPDIR}/hosttools/perl and use that instead, which
> > means that if the tool is restored from the sstate cache in another
> > build directory than where it originated from, the path will be
> > wrong.
> >
> > These two patches adds a new variable (HOSTTOOLS_DIR) for the
> > ${TMPDIR}/hosttools directory, and then makes sure it is handled by
> > the staging code so that any references to its value are properly
> > corrected when restoring from the sstate cache.
>=20
> I did mention on irc that I didn't really want to do this, I only
> wanted to fix this issue on a case by case basis.
>=20
> The reason is that we currently have pretty clean sstate files in this
> regard, we haven't needed to do this. If we add this, we'll become
> reliant on the fixups. The fixups are slow and ideally we want to pass
> in correct paths in the first place if/as/where we can.

I am not sure how much my change will affect performance, but I think it=20
should be negligible. It only adds one more regular expression to a sed=20
command that would be run anyway. And all files (at least that I can see=20
in my tmp/sysroot-components) that need to be fixed for HOSTTOOLS_DIR=20
already need some other fixup so it does not add to the number of files=20
needing to be fixed.

> So is there a way we can only do this if/as/where needed instead of
> universally?
>=20
> The performance overhead of fixups verses no fixups is significant.
>=20
> Cheers,
>=20
> Richard

This actually turned out much worse than I had first thought.

When I examined what files had been modified in tmp/sysroot-components afte=
r
applying my change, the following files were listed:

tmp/sysroots-components/mips32r2el-nf/libtool-cross/usr/bin/crossscripts/mi=
psel-poky-linux-libtool:lt_truncate_bin=3D"FIXME_HOSTTOOLS_DIR/dd bs=3D4096=
 count=3D1"
tmp/sysroots-components/mips32r2el-nf/python/usr/lib/python2.7/config/Makef=
ile:INSTALL=3D FIXME_HOSTTOOLS_DIR/install -c
tmp/sysroots-components/mips32r2el-nf/python/usr/lib/python2.7/config/Makef=
ile:MKDIR_P=3D FIXME_HOSTTOOLS_DIR/mkdir -p
tmp/sysroots-components/mips32r2el-nf/python3/usr/lib/python3.5/config-3.5m=
/Makefile:INSTALL=3D   FIXME_HOSTTOOLS_DIR/install -c
tmp/sysroots-components/mips32r2el-nf/python3/usr/lib/python3.5/config-3.5m=
/Makefile:MKDIR_P=3D   FIXME_HOSTTOOLS_DIR/mkdir -p
tmp/sysroots-components/mips32r2el-nf/python3/usr/lib/python3.5/config/Make=
file:INSTALL=3D        FIXME_HOSTTOOLS_DIR/install -c
tmp/sysroots-components/mips32r2el-nf/python3/usr/lib/python3.5/config/Make=
file:MKDIR_P=3D        FIXME_HOSTTOOLS_DIR/mkdir -p
tmp/sysroots-components/mips32r2el-nf/apache2/usr/share/apache2/build/confi=
g_vars.mk:EGREP =3D FIXME_HOSTTOOLS_DIR/grep -E
tmp/sysroots-components/mips32r2el-nf/apr/usr/share/build-1/libtool:lt_trun=
cate_bin=3D"FIXME_HOSTTOOLS_DIR/dd bs=3D4096 count=3D1"

So I guess there are potential problems with them. However, in addition to =
the=20
files listed above, all postinst-useradd-* scripts where also listed. That =
is=20
because they set up PATH like this:

export PATH=3D"${BUILDDIR}/scripts:FIXMESTAGINGDIRTARGET-native/usr/bin/mip=
sel-poky-linux:FIXMESTAGINGDIRTARGET/usr/bin/crossscripts:FIXMESTAGINGDIRTA=
RGET-native/usr/sbin:FIXMESTAGINGDIRTARGET-native/usr/bin:FIXMESTAGINGDIRTA=
RGET-native/sbin:FIXMESTAGINGDIRTARGET-native/bin:${BUILDDIR}/poky/bitbake/=
bin:FIXME_HOSTTOOLS_DIR"

[ I modified the line to use ${BUILDDIR} rather than the expanded value to
  make it shorter in the mail. ]

And sure enough, when I tested a build without my fixes where a recipe that=
=20
creates a user is restored from sstate to satisfy the dependencies of anoth=
er=20
recipe, and the hosttools path that is in the postinst-useradd script no=20
longer exists, the script fails to create the user. But it does it silently=
,=20
without causing a build failure! And even if I add the -e option to sh for=
=20
these scripts they still do not fail, because the missing commands are call=
ed=20
from within if tests and thus do not trigger the shell to abort. This is ve=
ry=20
bad, and if at all possible should be fixed for Pyro before release, as it =
may=20
lead to very odd failures for anyone using recipes that create users/groups=
.

Another thing I noticed when looking at that PATH line, was the existence o=
f=20
FIXMESTAGINGDIRTARGET-native. Those should have been FIXMESTAGINGDIRHOST, b=
ut=20
I think the logic in sstate.bbclass is flawed as it only does that replacem=
ent=20
if native.bbclass or any cross*.bbclass has been inherited, but the native=
=20
paths can very well be used in a target recipe. It only happens to work bec=
ause=20
RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE are defined as:

RECIPE_SYSROOT =3D "${WORKDIR}/recipe-sysroot"
RECIPE_SYSROOT_NATIVE =3D "${WORKDIR}/recipe-sysroot-native"

If RECIPE_SYSROOT_NATIVE instead had been defined as:

RECIPE_SYSROOT_NATIVE =3D "${WORKDIR}/native-recipe-sysroot "

I am sure we would have seen failures since the paths would no longer have=
=20
been fixed...

I believe the sed expression used in sstate_hardcode_path() when cross.bbcl=
ass=20
or crosssdk.bbclass has been inherited should be used for all the cases, bu=
t=20
it needs to be corrected so that FIXMESTAGINGDIRHOST is searched for before=
=20
FIXMESTAGINGDIRTARGET, or it will never match. Fixing this is not critical =
due=20
to how RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE are defined, so fixing it c=
an=20
wait till after Pyro.

//Peter


