Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD6C06D268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 18:32:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2EIVSkA015847
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Mar 2019 11:31:44 -0700
Received: from yow-masselst-lx1.localnet (128.224.21.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Thu, 14 Mar 2019 11:31:25 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Christopher Larson <kergoth@gmail.com>
Date: Thu, 14 Mar 2019 14:31:21 -0400
Message-ID: <2708854.tNq2jWpnpt@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CABcZANmQp3PNhqGMwekPmiaq=prZBBwtPftzJvzeTYJFYfDRDA@mail.gmail.com>
References: <1552499826-26884-1-git-send-email-mark.asselstine@windriver.com>
	<CABcZANmQp3PNhqGMwekPmiaq=prZBBwtPftzJvzeTYJFYfDRDA@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] go.bbclass: Export GOARM
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
X-List-Received-Date: Thu, 14 Mar 2019 18:32:26 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Wednesday, March 13, 2019 3:40:18 PM EDT Christopher Larson wrote:
> How would bitbake respond to an =E2=80=98export=E2=80=99 line with the em=
pty string? I.e.
> can you do an actual conditional export the way we do conditional inherit=
s,
> so it still is only exported for arm, even if the value is set to the emp=
ty
> string for others?

Unfortunately no. It is a parsing error.

I am working on alternatives and will hopefully have something out shortly.

MarkA

>=20
> On Wed, Mar 13, 2019 at 10:57 AM Mark Asselstine <
>=20
> mark.asselstine@windriver.com> wrote:
> > When building GO packages for ARM (v5, v6, v7) it is expected that the
> > GOARM env variable is set during the build. Not having GOARM exported
> > will result in GO binaries which can't be executed on the target
> > (terminate with segfault). Per https://github.com/golang/go/wiki/GoArm
> >=20
> > We already have the logic in goarch.bbclass to determine the correct
> > value of GOARM (see GOARM_TARGET), but currently this is only used to
> > build go itself (go-cross_1.*.bb requires go-cross.inc --> export
> > GOARM =3D "${TARGET_GOARM}").
> >=20
> > Here we export GOARM but we do it such that it is only exported if we
> > are building for 'arm' and only when recipes requiring/inheriting
> > go.bbclass are be used to build for the target.
> >=20
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> >=20
> > Richard,
> >=20
> > MarkH and I were debating this one some. He was suggesting I add
> > 'GOARM ?=3D ""' so as not to leave things undefined for non-arm target
> > builds. I however, like the behavior of this as submitted here as
> > non-arm target builds don't get polluted with a useless export in
> > their do_compile scripts and such. The question is as presented here
> > is the behavior deterministic?
> >=20
> >=20
> > meta/classes/go.bbclass | 3 +++
> >=20
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> > index af331f8..72e2c29 100644
> > --- a/meta/classes/go.bbclass
> > +++ b/meta/classes/go.bbclass
> > @@ -8,6 +8,9 @@ GOROOT =3D "${STAGING_LIBDIR}/go"
> >=20
> >  export GOROOT
> >  export GOROOT_FINAL =3D "${libdir}/go"
> >=20
> > +GOARM_arm_class-target =3D "${TARGET_GOARM}"
> > +export GOARM
> > +
> >=20
> >  DEPENDS_GOLANG_class-target =3D "virtual/${TUNE_PKGARCH}-go
> >=20
> > virtual/${TARGET_PREFIX}go-runtime"
> >=20
> >  DEPENDS_GOLANG_class-native =3D "go-native"
> >  DEPENDS_GOLANG_class-nativesdk =3D "virtual/${TARGET_PREFIX}go-crosssdk
> >=20
> > virtual/${TARGET_PREFIX}go-runtime"
> > --
> > 2.7.4
> >=20
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core





