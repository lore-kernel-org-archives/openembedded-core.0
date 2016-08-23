Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97C2160053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 15:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7067518168;
	Tue, 23 Aug 2016 17:15:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id UUSfRwuJwPN8; Tue, 23 Aug 2016 17:15:39 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 7A41C18093;
	Tue, 23 Aug 2016 17:15:39 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 62AAD1AD1;
	Tue, 23 Aug 2016 17:15:39 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 5211D1A89;
	Tue, 23 Aug 2016 17:15:39 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 4FEFA34F;
	Tue, 23 Aug 2016 17:15:39 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Tue, 23 Aug 2016 17:15:38 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1156.000;
	Tue, 23 Aug 2016 17:15:39 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: inherit allarch and use RDEPENDS
Thread-Index: AdH9UTOMfzokDyFSTwO5LfUd1BayLA==
Date: Tue, 23 Aug 2016 15:15:39 +0000
Message-ID: <0bf5343047414781867c8fc56c68ccba@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: inherit allarch and use RDEPENDS
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
X-List-Received-Date: Tue, 23 Aug 2016 15:15:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I just stumbled on the mail below and it raised some questions:

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: den 22 augusti 2016 16:21
> To: openembedded-core@lists.openembedded.org; Joe Slater
> Cc: openembedded-commits@lists.openembedded.org
> Subject: Re: [OE-core] [oe-commits] [openembedded-core] 01/02: systemd-
> compat-units: pkg_postinst() does not work
>=20
> On Thu, Aug 18, 2016 at 03:52:33PM +0000, git@git.openembedded.org
> wrote:
> > rpurdie pushed a commit to branch master in repository openembedded-cor=
e.

[cut]

> > -RDPEPENDS_${PN} =3D "systemd"
> > +RDEPENDS_${PN} =3D "systemd"
>=20
> This is good typo fix, but also causes allarch systemd-compat-units to
> RDEPENDS on TUNE_PKGARCH systemd as reported in:
> http://lists.openembedded.org/pipermail/openembedded-core/2016-August/125=
483.html
>=20
> So either please exclude it in layer.conf or drop this runtime
> dependency completely.
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

This is the first I heard about limits to recipes that inherit allarch=20
and also use RDEPENDS. So after I read the above, I went and read the=20
documentation for the allarch class, which unfortunately did not make=20
my understanding much clearer.

Am I to understand that a recipe that inherits allarch cannot have=20
runtime dependencies on packages that are built differently per=20
architecture or MACHINE? If so, what can it have runtime dependencies=20
on? Only other allarch recipes? What are the design limitations behind=20
this and is there anything that could be done to change the situation?

As an example, say that I have a recipe that only installs a static=20
script, so inheriting allarch is a natural thing to do. However, for=20
this script to work it must call a binary built by another recipe so=20
it of course RDEPENDS on that other package. Are you saying this is=20
wrong? Because that sounds odd to me as it severely limits the=20
usefulness of the allarch class.

Another example would be a recipe that installs a static Perl script.=20
Can it not inherit allarch while also have a runtime dependency on perl?

If the above is true, why are there no QA tests or similar that catch=20
these kind of problems?

//Peter


