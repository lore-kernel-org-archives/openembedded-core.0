Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0657E091
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 11:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 02A101832D;
	Sat, 31 Aug 2019 13:21:13 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id nVn_jXQkOFK7; Sat, 31 Aug 2019 13:21:12 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0E37418134;
	Sat, 31 Aug 2019 13:21:11 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A967C1E06E;
	Sat, 31 Aug 2019 13:21:11 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B7D81E068;
	Sat, 31 Aug 2019 13:21:11 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sat, 31 Aug 2019 13:21:11 +0200 (CEST)
Received: from xbox06.axis.com (xbox06.axis.com [10.0.15.176])
	by thoth.se.axis.com (Postfix) with ESMTP id 8EDED279D;
	Sat, 31 Aug 2019 13:21:11 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by xbox06.axis.com (10.0.15.176)
	with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Sat, 31 Aug 2019 13:21:11 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1395.000; Sat, 31 Aug 2019 13:21:11 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Mattias Hansson <mattihn@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] base.bbclass: add dependency on pseudo from
	do_prepare_recipe_sysroot
Thread-Index: AQHVX1L39gDGe2fIG0SkmmS9ulA1t6cVGmHg
Date: Sat, 31 Aug 2019 11:21:11 +0000
Message-ID: <154c1328c10e4d46a55de92d7abfcb8d@XBOX04.axis.com>
References: <20190816091329.10359-1-mattihn@axis.com>
	<289f14f3a89bf12fef9d830cd0579a06bf5514a8.camel@linuxfoundation.org>
In-Reply-To: <289f14f3a89bf12fef9d830cd0579a06bf5514a8.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Mattias Hansson <mattihn@axis.com>
Subject: Re: [PATCH] base.bbclass: add dependency on pseudo from do_prepare_recipe_sysroot
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
X-List-Received-Date: Sat, 31 Aug 2019 11:21:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 30 augusti 2019 18:50
> To: Mattias Hansson <Mattias.Hansson@axis.com>; openembedded-
> core@lists.openembedded.org
> Cc: Mattias Hansson <Mattias.Hansson@axis.com>
> Subject: Re: [OE-core] [PATCH] base.bbclass: add dependency on pseudo
> from do_prepare_recipe_sysroot
>=20
> On Fri, 2019-08-16 at 11:13 +0200, Mattias Hansson wrote:
> > do_prepare_recipe_sysroot may perform groupadd, which requires pseudo.
> > However, do_prepare_recipe_sysroot does not depend on pseudo explicitly=
,
> > which sometimes causes a build error when building a recipe that adds
> > groups.
> >
> > This issue only occurs when executing do_prepare_recipe_sysroot for a
> > recipe that adds groups before finishing a task that depends on pseudo
> > for a recipe that doesn't add groups.
> >
> > Signed-off-by: Mattias Hansson <mattihn@axis.com>
> > ---
> >  meta/classes/base.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > index 0c8a4b2862..0576b110c9 100644
> > --- a/meta/classes/base.bbclass
> > +++ b/meta/classes/base.bbclass
> > @@ -480,6 +480,7 @@ python () {
> >      # If we're building a target package we need to use fakeroot (pseu=
do)
> >      # in order to capture permissions, owners, groups and special file=
s
> >      if not bb.data.inherits_class('native', d) and not bb.data.inherit=
s_class('cross', d):
> > +        d.setVarFlag('do_prepare_recipe_sysroot', 'fakeroot', '1')
> >          d.setVarFlag('do_unpack', 'umask', '022')
> >          d.setVarFlag('do_configure', 'umask', '022')
> >          d.setVarFlag('do_compile', 'umask', '022')
>=20
> This basically forces all target recipes prepare-recipe sysroot to run
> under pseudo "just in case", with all the performance overhead that
> entails. prepare_recipe_sysroot does a lot of file accesses so this is
> significant. It will also increase the pseudo database sizes
> everywhere.
>=20
> We'll need to find a better way to handle this I'm afraid.
>=20
> Cheers,
>=20
> Richard

What do you prefer then, that we add this to useradd.bbclass instead?

python () {
    # This corresponds to similar code in base.bbclass, but is added here a=
s it
    # is only needed for recipes that add users/groups.
    if not bb.data.inherits_class('native', d) and not bb.data.inherits_cla=
ss('cross', d):
        d.setVarFlag('do_prepare_recipe_sysroot', 'fakeroot', '1')}
}

That way it should only affect recipes that manipulate users/groups.

//Peter


