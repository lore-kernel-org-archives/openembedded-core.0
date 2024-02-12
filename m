Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E30C4829C
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 17:15:00 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.12179.1707758092470636880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 09:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=dff+ClB9;
 spf=pass (domain: posteo.net, ip: 185.67.36.66, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 8F1D9240105
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 18:14:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1707758090; bh=/GjPMHrFKpBSqsic8ILNCI7b1Qjyt0IJBd1GnWqE+dg=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=dff+ClB9lE7MXVshWZjRNaAbNu7yuYfhXNaYcxCmlMGNcIukMiIIJlQkD/61J0YrA
	 EaNfJCmSFZfNgmRW9kOBabRjXvCT3DZVN/MiEq0SJQe7AwFCV5d4RiLFWhLKmc+oxz
	 qNIvNk5jTxs9sGlZCmDx+kgd3PRlexGswTzH0Tf8NK7OW1XznFYE7mPsPFPi9Vmwno
	 1xA2F5/IotGnOvqtOIaoNgn2nduMDJOSI+naJxBiSF4oe5aqjkTQq299kAPpHX6Pyu
	 nInZ8ydrlOxG/Fn/TCzH1EhAuDhD1AIUKGILAGc2bYMuYMR8HuXEaCwh3iP6LJyGbA
	 EBAP5RtVD3BqA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TYWKj1Zp7z6tyn;
	Mon, 12 Feb 2024 18:14:48 +0100 (CET)
Message-ID: <cdf7b4b84b5167d8e2c95e49fc941356d3e77547.camel@posteo.net>
Subject: Re: [OE-core] [PATCH] patchtest: Add selftest for test
 cve_check_ignore
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: Andrej Valek <andrej.v@skyrain.eu>, Simone =?ISO-8859-1?Q?Wei=DF?=
	 <simone.p.weiss@posteo.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
Date: Mon, 12 Feb 2024 17:14:48 +0000
In-Reply-To: <4609194f-c7b5-49bd-a607-f602797f0334@skyrain.eu>
References: <20240210135259.563083-1-simone.p.weiss@posteo.com>
	 <c7d59770-b975-4608-ae0d-0ac8dd1531d9@skyrain.eu>
	 <051501a2118aa94251de40fbaee00f424ff4c6f7.camel@posteo.net>
	 <4609194f-c7b5-49bd-a607-f602797f0334@skyrain.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 17:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195348

On Mon, 2024-02-12 at 07:43 +0100, Andrej Valek wrote:
> Hi Simone,
>=20
> OK, looks fine, but... what is the difference between=20
> https://github.com/openembedded/openembedded-core/blob/master/meta/lib/oe=
qa/selftest/cases/cve_check.py#L224
> =C2=A0
> ? I added a small test there, while we were adding this feature. Does it
> mean, that is not sufficient?
>=20
> Regards,
> Andrej
Hi Andrej,
It is just a very different thing. This tests checks if patches use
CVE_STATUS correctly when handing in patches.

Cheers
Simone
>=20
> On 11.02.2024 13:33, Simone Wei=C3=9F wrote:
> > On Sun, 2024-02-11 at 12:45 +0100, Andrej Valek wrote:
> > > Hi Simone,
> > >=20
> > > Is there a special reason, why you're adding already removed feature
> > > https://lists.openembedded.org/g/openembedded-core/message/189917=C2=
=A0?
> > >=20
> > > Regards,
> > > Andrej
> > >=20
> > Hi Andrej,
> >=20
> > I am not adding an already removed feature here:)
> >=20
> > - This is a selftest, so it is used to test patchtest itself and not
> > patches with patchtest.
> > - The test from patchtest tested is also not
> > test_cve_presence_in_commit_message, which deals with the commit
> > message
> > of a patch, but one dealing with the use of CVE_STATUS in the meta
> > data of
> > a recipe test_cve_check_ignore.
> >=20
> > Cheers,
> > Simone
> > > On 10.02.2024 14:52, Simone Wei=C3=9F wrote:
> > > > From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > > >=20
> > > > Add a selftest for the recently introduced check for
> > > > CVE_CHECK_IGNORE.
> > > >=20
> > > > Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > > > ---
> > > > =C2=A0=C2=A0 .../TestMetadata.test_cve_check_ignore.fail=C2=A0=C2=
=A0 | 30
> > > > ++++++++++++++++++
> > > > =C2=A0=C2=A0 .../TestMetadata.test_cve_check_ignore.pass=C2=A0=C2=
=A0 | 31
> > > > +++++++++++++++++++
> > > > =C2=A0=C2=A0 2 files changed, 61 insertions(+)
> > > > =C2=A0=C2=A0 create mode 100644
> > > > meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_igno
> > > > re.f
> > > > ail
> > > > =C2=A0=C2=A0 create mode 100644
> > > > meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_igno
> > > > re.p
> > > > ass
> > > >=20
> > > > diff --git
> > > > a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ig
> > > > nore
> > > > .fail
> > > > b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ig
> > > > nore
> > > > .fail
> > > > new file mode 100644
> > > > index 0000000000..3574463ade
> > > > --- /dev/null
> > > > +++
> > > > b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ig
> > > > nore
> > > > .fail
> > > > @@ -0,0 +1,30 @@
> > > > +From c4ca86b9cca3643097db0328e2f34dccffbba309 Mon Sep 17 00:00:00
> > > > 2001
> > > > +From: =3D?UTF-8?q?Simone=3D20Wei=3DC3=3D9F?=3D <simone.p.weiss@pos=
teo.com>
> > > > +Date: Sat, 10 Feb 2024 13:18:44 +0100
> > > > +Subject: [PATCH] selftest-hello: add CVE_CHECK_IGNORE
> > > > +MIME-Version: 1.0
> > > > +Content-Type: text/plain; charset=3DUTF-8
> > > > +Content-Transfer-Encoding: 8bit
> > > > +
> > > > +This should fail the test_cve_tag_format selftest.
> > > > +
> > > > +Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > > > +---
> > > > + .../recipes-test/selftest-hello/selftest-hello_1.0.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > > > 3
> > > > ++-
> > > > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-
> > > > hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-
> > > > hello_1.0.bb
> > > > +index 547587bef4..3ef9b87c34 100644
> > > > +--- a/meta-selftest/recipes-test/selftest-hello/selftest-
> > > > hello_1.0.bb
> > > > ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-
> > > > hello_1.0.bb
> > > > +@@ -16,4 +16,5 @@ do_install() {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0install -m 0755 hellowor=
ld ${D}${bindir}
> > > > + }
> > > > +
> > > > +-BBCLASSEXTEND =3D "native nativesdk"
> > > > +\ No newline at end of file
> > > > ++CVE_CHECK_IGNORE =3D "CVE-2024-12345"
> > > > ++BBCLASSEXTEND =3D "native nativesdk"
> > > > +--
> > > > +2.39.2
> > > > +
> > > > diff --git
> > > > a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ig
> > > > nore
> > > > .pass
> > > > b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ig
> > > > nore
> > > > .pass
> > > > new file mode 100644
> > > > index 0000000000..10f942a6eb
> > > > --- /dev/null
> > > > +++
> > > > b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ig
> > > > nore
> > > > .pass
> > > > @@ -0,0 +1,31 @@
> > > > +From 7d4d3fee0c7111830ee9b2b049ae3ce265b26030 Mon Sep 17 00:00:00
> > > > 2001
> > > > +From: =3D?UTF-8?q?Simone=3D20Wei=3DC3=3D9F?=3D <simone.p.weiss@pos=
teo.com>
> > > > +Date: Sat, 10 Feb 2024 13:23:56 +0100
> > > > +Subject: [PATCH] selftest-hello: add CVE_STATUS
> > > > +MIME-Version: 1.0
> > > > +Content-Type: text/plain; charset=3DUTF-8
> > > > +Content-Transfer-Encoding: 8bit
> > > > +
> > > > +This should pass the test_cve_tag_format selftest.
> > > > +
> > > > +Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > > > +---
> > > > + .../recipes-test/selftest-hello/selftest-hello_1.0.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > > > 4
> > > > +++-
> > > > + 1 file changed, 3 insertions(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-
> > > > hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-
> > > > hello_1.0.bb
> > > > +index 547587bef4..9908b3b417 100644
> > > > +--- a/meta-selftest/recipes-test/selftest-hello/selftest-
> > > > hello_1.0.bb
> > > > ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-
> > > > hello_1.0.bb
> > > > +@@ -16,4 +16,6 @@ do_install() {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0install -m 0755 hellowor=
ld ${D}${bindir}
> > > > + }
> > > > +
> > > > +-BBCLASSEXTEND =3D "native nativesdk"
> > > > +\ No newline at end of file
> > > > ++CVE_STATUS[CVE-2024-12345] =3D "not-applicable-platform: Issue
> > > > only
> > > > applies on Windows"
> > > > ++
> > > > ++BBCLASSEXTEND =3D "native nativesdk"
> > > > +--
> > > > +2.39.2
> > > > +
> > > >=20
> > > >=20
> > > >=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195300):
> https://lists.openembedded.org/g/openembedded-core/message/195300
> Mute This Topic: https://lists.openembedded.org/mt/104277396/8052774
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[simone.p.w=
eiss@posteo.com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


