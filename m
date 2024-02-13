Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0ACC48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 16:49:15 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.16505.1707842955217459184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 08:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=CiiiktI+;
 spf=pass (domain: posteo.net, ip: 185.67.36.65, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 5D4AF240029
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 17:49:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1707842953; bh=c5I7WblsCjGmAlSFPrYg9TGtu4IngR7HKeTjY5wBJ7A=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=CiiiktI+d1CEPnvS5Tb7zFk9Bpo7YnRYAdBPgeQ4V1joPvabjR6337c8FG9U1G+R0
	 H2UWSbp3sjhy6fa22+C8i8Pyld7cAk3/djcv3n26RJcTebatj+tdjvUV35CyYp7Yl7
	 pQYPWGKt7rU5v8A6FoOuqK3R+zyrXmvmjLNrm42JUOYvH5ZWWBDovtRM+jxE06oJUi
	 QgbvaLdz57GIwLSnlKEqyu7zn4uD/Zfk+pPYYX6NqitCwBlWSAzINSmfF9yfNj8TO/
	 eMqwz5g0ZEm0A7D94DtCvBbEu72hnowoAIia8WB0RpPih3UN4MGA1t8yywkoMY7FUm
	 to8+bda9oPeJg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TZ6jh0dv6z6txv;
	Tue, 13 Feb 2024 17:49:11 +0100 (CET)
Message-ID: <c5c04be0fd22c12cb14aa3cc9c44341a775e4ff9.camel@posteo.net>
Subject: Re: [OE-core] [PATCH] patchtest: Add selftest for test
 cve_check_ignore
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: Trevor Gamblin <tgamblin@baylibre.com>, Simone =?ISO-8859-1?Q?Wei=DF?=
	 <simone.p.weiss@posteo.com>, openembedded-core@lists.openembedded.org
Date: Tue, 13 Feb 2024 16:49:11 +0000
In-Reply-To: <cf013188-f838-4d44-ae15-21f2d6fc4e5b@baylibre.com>
References: <20240210135259.563083-1-simone.p.weiss@posteo.com>
	 <cf013188-f838-4d44-ae15-21f2d6fc4e5b@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 16:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195419

On Tue, 2024-02-13 at 09:55 -0500, Trevor Gamblin wrote:
>=20
> On 2024-02-10 08:52, Simone Wei=C3=9F wrote:
> > From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> >=20
> > Add a selftest for the recently introduced check for CVE_CHECK_IGNORE.
> Hi, sorry for the late reply. Were you able to test this successfully=20
> using the patchtest selftest run (or by manually running patchtest on=20
> the test patches)? I am seeing both cases skip on my end.

Hi Trevor,

Yes both were fine e.g.

FAIL: test CVE check ignore: CVE_CHECK_IGNORE is deprecated and should be
replaced by CVE_STATUS (test_metadata.TestMetadata.test_cve_check_ignore).

As data for checking for modified files is constructed based on the
included layers, a quick suspicion did you nor add meta-selftest before
you tried?

Cheers,
Simone
> >=20
> > Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > ---
> > =C2=A0 .../TestMetadata.test_cve_check_ignore.fail=C2=A0=C2=A0 | 30
> > ++++++++++++++++++
> > =C2=A0 .../TestMetadata.test_cve_check_ignore.pass=C2=A0=C2=A0 | 31
> > +++++++++++++++++++
> > =C2=A0 2 files changed, 61 insertions(+)
> > =C2=A0 create mode 100644
> > meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.f
> > ail
> > =C2=A0 create mode 100644
> > meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.p
> > ass
> >=20
> > diff --git
> > a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
> > .fail
> > b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
> > .fail
> > new file mode 100644
> > index 0000000000..3574463ade
> > --- /dev/null
> > +++
> > b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
> > .fail
> > @@ -0,0 +1,30 @@
> > +From c4ca86b9cca3643097db0328e2f34dccffbba309 Mon Sep 17 00:00:00
> > 2001
> > +From: =3D?UTF-8?q?Simone=3D20Wei=3DC3=3D9F?=3D <simone.p.weiss@posteo.=
com>
> > +Date: Sat, 10 Feb 2024 13:18:44 +0100
> > +Subject: [PATCH] selftest-hello: add CVE_CHECK_IGNORE
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +This should fail the test_cve_tag_format selftest.
> > +
> > +Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > +---
> > + .../recipes-test/selftest-hello/selftest-hello_1.0.bb=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3
> > ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-
> > hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-
> > hello_1.0.bb
> > +index 547587bef4..3ef9b87c34 100644
> > +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> > ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> > +@@ -16,4 +16,5 @@ do_install() {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0install -m 0755 helloworld $=
{D}${bindir}
> > + }
> > +
> > +-BBCLASSEXTEND =3D "native nativesdk"
> > +\ No newline at end of file
> > ++CVE_CHECK_IGNORE =3D "CVE-2024-12345"
> > ++BBCLASSEXTEND =3D "native nativesdk"
> > +--
> > +2.39.2
> > +
> > diff --git
> > a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
> > .pass
> > b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
> > .pass
> > new file mode 100644
> > index 0000000000..10f942a6eb
> > --- /dev/null
> > +++
> > b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
> > .pass
> > @@ -0,0 +1,31 @@
> > +From 7d4d3fee0c7111830ee9b2b049ae3ce265b26030 Mon Sep 17 00:00:00
> > 2001
> > +From: =3D?UTF-8?q?Simone=3D20Wei=3DC3=3D9F?=3D <simone.p.weiss@posteo.=
com>
> > +Date: Sat, 10 Feb 2024 13:23:56 +0100
> > +Subject: [PATCH] selftest-hello: add CVE_STATUS
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +This should pass the test_cve_tag_format selftest.
> > +
> > +Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > +---
> > + .../recipes-test/selftest-hello/selftest-hello_1.0.bb=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4
> > +++-
> > + 1 file changed, 3 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-
> > hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-
> > hello_1.0.bb
> > +index 547587bef4..9908b3b417 100644
> > +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> > ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> > +@@ -16,4 +16,6 @@ do_install() {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0install -m 0755 helloworld $=
{D}${bindir}
> > + }
> > +
> > +-BBCLASSEXTEND =3D "native nativesdk"
> > +\ No newline at end of file
> > ++CVE_STATUS[CVE-2024-12345] =3D "not-applicable-platform: Issue only
> > applies on Windows"
> > ++
> > ++BBCLASSEXTEND =3D "native nativesdk"
> > +--
> > +2.39.2
> > +
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#195273):
> > https://lists.openembedded.org/g/openembedded-core/message/195273
> > Mute This Topic: https://lists.openembedded.org/mt/104277396/7611679
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > tgamblin@baylibre.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20


