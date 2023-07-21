Return-Path: <r.czerwinski@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A809EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 07:04:48 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.2038.1689923081557074257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 00:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: r.czerwinski@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=drumknott)
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <r.czerwinski@pengutronix.de>)
	id 1qMkBr-0001Dx-7A; Fri, 21 Jul 2023 09:04:39 +0200
Date: Fri, 21 Jul 2023 09:04:37 +0200
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, Rouven
 Czerwinski <rcz@pengutronix.de>
Subject: Re: [OE-core] [meta][kirkstone][PATCH] json-c: disable -Werror for
 x86-64
Message-ID: <20230721090437.00e3070e@drumknott>
In-Reply-To: <CANNYZj-e2ze=-GS8i5vN+eqxP=N787TRXkPLt1_Z1C81NLZ=hw@mail.gmail.com>
References: <20230720133655.1266273-1-r.czerwinski@pengutronix.de>
	<CANNYZj8jB0bA3eQs2ULb40Ox1q2NE_W4LOs8Ch0HVOWS6fhF2g@mail.gmail.com>
	<CANNYZj-e2ze=-GS8i5vN+eqxP=N787TRXkPLt1_Z1C81NLZ=hw@mail.gmail.com>
Organization: Pengutronix e.K.
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: r.czerwinski@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 07:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184672

Hi,

On Thu, 20 Jul 2023 20:45:44 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> Also, does the issue occur on oe-core master?
>=20

I couldn't reproduce on amster.

> Alex
>=20
> On Thu, 20 Jul 2023 at 20:44, Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > This needs to be reported upstream and the ticket linked (ideally,
> > develop a patch to fix the issue). The tweak needs to be
> > :class-native only.

And with a fresh container and only oe-core+bitbake I couldn't
reproduce this on kirkstone either.

Turns out the BSP I was working had ICECC enabled and json-c-native is
broken on ICECC. Apparently I was holding ICECC_RECIPE_DISABLE wrong,
since it works with ICECC_RECIPE_DISABLE +=3D "json-c-native". I'll send a
patch for that instead.

In conclusion: please ignore this patch.

Thanks for the comments that nudged me to check this again!

Best regards,
Rouven

> >
> > Alex
> >
> > On Thu, 20 Jul 2023 at 15:37, Rouven Czerwinski
> > <r.czerwinski@pengutronix.de> wrote: =20
> > >
> > > From: Rouven Czerwinski <rcz@pengutronix.de>
> > >
> > > Disable -Werror using OECMAKE_C_FLAGS on x86-64. This ensures
> > > that json-c can build on newer distributions where the host
> > > compiler is new enough to treat implicit fallthrough warnings as
> > > errors: | NOTE: VERBOSE=3D1 cmake --build
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/build --target all=
 --
> > > | [1/34]
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/recipe-sysroot-nat=
ive/usr/bin/ice/gcc
> > > -D_GNU_SOURCE -Djson_c_EXPORTS
> > > -I/=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15
> > > -I/=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/build
> > > -isystem/=E2=80=A6/work/x86_64-linux/j
> > > son-c-native/0.15-r0/recipe-sysroot-native/usr/include -O2 -pipe
> > > -ffunction-sections -fdata-sections -Werror -Wall -Wcast-qual
> > > -Wno-error=3Ddeprecated-declarations -Wextra -Wwrite-strings
> > > -Wno-unused-parameter -Wstrict-prototypes -g -fPIC -D_REENTRANT
> > > -MD -MT CMakeFiles/json-c.dir/linkhash.c.o -MF
> > > CMakeFiles/json-c.dir/linkhash.c.o.d -o
> > > CMakeFiles/json-c.dir/linkhash.c.o -c
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c
> > > -0.15/linkhash.c | FAILED: CMakeFiles/json-c.dir/linkhash.c.o |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/recipe-sysroot-nat=
ive/usr/bin/ice/gcc
> > > -D_GNU_SOURCE -Djson_c_EXPORTS
> > > -I/=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15
> > > -I/=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/build
> > > -isystem/=E2=80=A6/work/x86_64-linux/json-c-n
> > > ative/0.15-r0/recipe-sysroot-native/usr/include -O2 -pipe
> > > -ffunction-sections -fdata-sections -Werror -Wall -Wcast-qual
> > > -Wno-error=3Ddeprecated-declarations -Wextra -Wwrite-strings
> > > -Wno-unused-parameter -Wstrict-prototypes -g -fPIC -D_REENTRANT
> > > -MD -MT CMakeFiles/json-c.dir/linkhash.c.o -MF
> > > CMakeFiles/json-c.dir/linkhash.c.o.d -o
> > > CMakeFiles/json-c.dir/linkhash.c.o -c
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/l
> > > inkhash.c |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:
> > > In function 'hashlittle': |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:367:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:368:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:372:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:373:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:376:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:377:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:380:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:381:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:383:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:384:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:420:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:421:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:421:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:422:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:422:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:423:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:423:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:424:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:424:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:425:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:425:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:426:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:426:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:427:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:427:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:428:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:428:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:429:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:429:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:430:3:
> > > note: here |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:430:13:
> > > error: this statement may fall through
> > > [-Werror=3Dimplicit-fallthrough=3D] |
> > > /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:431:3:
> > > note: here | cc1: all warnings being treated as errors
> > >
> > > Passing -Wno-error x86-64 is the minimal invasive fix for older
> > > kirkstone releases.
> > >
> > > Signed-off-by: Rouven Czerwinski <rcz@pengutronix.de>
> > > ---
> > >  meta/recipes-devtools/json-c/json-c_0.15.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb
> > > b/meta/recipes-devtools/json-c/json-c_0.15.bb index
> > > 7cbed55b3b..749eb078f8 100644 ---
> > > a/meta/recipes-devtools/json-c/json-c_0.15.bb +++
> > > b/meta/recipes-devtools/json-c/json-c_0.15.bb @@ -18,6 +18,8 @@
> > > RPROVIDES:${PN} =3D "libjson"
> > >
> > >  inherit cmake ptest
> > >
> > > +OECMAKE_C_FLAGS:append:x86-64 =3D " -Wno-error"
> > > +
> > >  do_install_ptest() {
> > >      install -d ${D}/${PTEST_PATH}/tests
> > >      install ${B}/tests/test* ${D}/${PTEST_PATH}/tests
> > > --
> > > 2.39.2
> > >
> > >
> > >=20
> > > =20


