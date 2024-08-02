Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD35C3DA49
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 10:24:22 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.89768.1722594251287548067
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 03:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=r1w/nKQI;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Dedj2XvYnA92TTA7LIEyGB1dt/tlYNNoqcuQAh5qEsA=; b=r1w/nKQIGeFRvnyDJJdkmX6O1s
	qqyb+9dFXmHFTZ9FsaKVyZ8KmY+JMVam1LVLbVlKb1PjoHjnxesOX+l7CleDN3bcIxdPVqtqWKfJp
	tsaTxQJuliVvguFS8miIhxV7aXu8QkZWvUaEw0YeHSSU4LlOYiT3BHdYpVqfcEW0gOFG518sUfk3L
	CevBkCoiMG/b5TKlefYVSD22/oFWMjVQVRT/1H8uDreYY1xUSu5CxwDgzMS6SJ+RXK+Ofk0/r/4dD
	bOBDGr+xRN5xUS2NdIv9DBUuZx8zf0lU0EfhimMfbu51uGJsjdqrpCdB/KSBmhSRCZrjX3968sRiK
	l/trju0g==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1sZpSB-000EdD-AW; Fri, 02 Aug 2024 12:24:07 +0200
Received: from [93.165.249.40] (helo=[192.168.8.20])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1sZpSB-000O1S-1j;
	Fri, 02 Aug 2024 12:24:07 +0200
Message-ID: <f47e5c53e97b190852dc5578e0c3f0fe140803da.camel@geanix.com>
Subject: Re: [OE-core] [PATCH v2 3/5] ninja: build modified version with GNU
 Make jobserver support
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>, Randy MacLeod
 <randy.macleod@windriver.com>, Andreas Helbech Kleist
 <andreaskleist@gmail.com>
Date: Fri, 02 Aug 2024 12:24:06 +0200
In-Reply-To: <202404251130553913ebd5@mail.local>
References: <20240404111613.2574424-1-martin@geanix.com>
	 <20240404111613.2574424-4-martin@geanix.com>
	 <202404251130553913ebd5@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27355/Fri Aug  2 10:30:40 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 10:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202897

Hi Alexandre,

I see you keep carrying these patches. I'm still working with ninja
upstream to add jobserver support there[1]. I was planning to redo
these patches once ninja merges that. But I can do a respin with my
patches added to ninja if you like?

[1] https://github.com/ninja-build/ninja/pull/2450

On Thu, 2024-04-25 at 13:30 +0200, Alexandre Belloni wrote:
> Hello,
>=20
> This patch doesn't apply on master anymore because ninja has been
> updated.
>=20
>=20
> On 04/04/2024 13:16:11+0200, Martin Hundeb?ll wrote:
> > Ninja doesn't (yet) support the GNU Make jobserver out of the box,
> > but
> > there is a pull request adding that support[1]. Since that pull
> > request
> > (and its derived three-part pull requests) seem to be ignored by
> > upstream, kitware (creator/maintainer of cmake) has created a
> > fork[2]
> > only to carry the jobserver patches. Change the source uri to point
> > at
> > the kitware fork of ninja, and add two patches from the original
> > pull
> > request to also support the new-style fifo jobserver feature.
> >=20
> > Note that the kitware fork of ninja is also used by buildroot[3].
> >=20
> > [1] https://github.com/ninja-build/ninja/pull/2263
> > [2] https://github.com/Kitware/ninja
> > [3]
> > https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/ninja/=
ninja.mk
> >=20
> > Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> > ---
> > =C2=A0...ename-TokenPool-Setup-to-SetupClient.patch | 113 ++++++++
> > =C2=A0...-jobserver-fifo-style-client-support.patch | 271
> > ++++++++++++++++++
> > =C2=A0meta/recipes-devtools/ninja/ninja_1.11.1.bb=C2=A0=C2=A0 |=C2=A0=
=C2=A0 8 +-
> > =C2=A03 files changed, 390 insertions(+), 2 deletions(-)
> > =C2=A0create mode 100644 meta/recipes-devtools/ninja/files/0001-Rename-
> > TokenPool-Setup-to-SetupClient.patch
> > =C2=A0create mode 100644 meta/recipes-devtools/ninja/files/0002-Add-GNU=
-
> > make-jobserver-fifo-style-client-support.patch
> >=20
> > diff --git a/meta/recipes-devtools/ninja/files/0001-Rename-
> > TokenPool-Setup-to-SetupClient.patch b/meta/recipes-
> > devtools/ninja/files/0001-Rename-TokenPool-Setup-to-
> > SetupClient.patch
> > new file mode 100644
> > index 0000000000..a503f8c75f
> > --- /dev/null
> > +++ b/meta/recipes-devtools/ninja/files/0001-Rename-TokenPool-
> > Setup-to-SetupClient.patch
> > @@ -0,0 +1,113 @@
> > +From f5642d8b49688dfc84679451b531d92f3b6e7cb0 Mon Sep 17 00:00:00
> > 2001
> > +From: Stefan Becker <chemobejk@gmail.com>
> > +Date: Sat, 15 Dec 2018 19:29:42 +0200
> > +Subject: [PATCH 1/2] Rename TokenPool::Setup() to SetupClient()
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Make space to add new API to set up token pool master.
> > +
> > +Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> > +Upstream-Status: Submitted
> > [https://github.com/Kitware/ninja/pull/2]
> > +---
> > + src/build.cc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 6 +++---
> > + src/subprocess_test.cc=C2=A0=C2=A0=C2=A0 | 3 ++-
> > + src/tokenpool-gnu-make.cc | 6 +++---
> > + src/tokenpool-gnu-make.h=C2=A0 | 3 ++-
> > + src/tokenpool.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 3 ++-
> > + src/tokenpool_test.cc=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > + 6 files changed, 13 insertions(+), 10 deletions(-)
> > +
> > +diff --git a/src/build.cc b/src/build.cc
> > +index 53e4405..d8a6dff 100644
> > +--- a/src/build.cc
> > ++++ b/src/build.cc
> > +@@ -474,9 +474,9 @@ struct RealCommandRunner : public
> > CommandRunner {
> > + RealCommandRunner::RealCommandRunner(const BuildConfig& config) :
> > config_(config) {
> > +=C2=A0=C2=A0 max_load_average_ =3D config.max_load_average;
> > +=C2=A0=C2=A0 if ((tokens_ =3D TokenPool::Get()) !=3D NULL) {
> > +-=C2=A0=C2=A0=C2=A0 if (!tokens_->Setup(config_.parallelism_from_cmdli=
ne,
> > +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 confi=
g_.verbosity =3D=3D
> > BuildConfig::VERBOSE,
> > +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 max_l=
oad_average_)) {
> > ++=C2=A0=C2=A0=C2=A0 if (!tokens_->SetupClient(config_.parallelism_from=
_cmdline,
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config_.verbosity =3D=3D
> > BuildConfig::VERBOSE,
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 max_load_average_)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delete tokens_;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tokens_ =3D NULL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +diff --git a/src/subprocess_test.cc b/src/subprocess_test.cc
> > +index eddc110..222b59b 100644
> > +--- a/src/subprocess_test.cc
> > ++++ b/src/subprocess_test.cc
> > +@@ -40,7 +40,8 @@ struct TestTokenPool : public TokenPool {
> > +=C2=A0=C2=A0 void Reserve()=C2=A0=C2=A0=C2=A0=C2=A0 {}
> > +=C2=A0=C2=A0 void Release()=C2=A0=C2=A0=C2=A0=C2=A0 {}
> > +=C2=A0=C2=A0 void Clear()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {}
> > +-=C2=A0 bool Setup(bool ignore_unused, bool verbose, double&
> > max_load_average) { return false; }
> > ++=C2=A0 bool SetupClient(bool ignore_unused, bool verbose,
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 double& max_load_average) { return =
false; }
> > +=20
> > + #ifdef _WIN32
> > +=C2=A0=C2=A0 bool _token_available;
> > +diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
> > +index 60e0552..6fb72a6 100644
> > +--- a/src/tokenpool-gnu-make.cc
> > ++++ b/src/tokenpool-gnu-make.cc
> > +@@ -28,9 +28,9 @@ GNUmakeTokenPool::GNUmakeTokenPool() :
> > available_(1), used_(0) {
> > + GNUmakeTokenPool::~GNUmakeTokenPool() {
> > + }
> > +=20
> > +-bool GNUmakeTokenPool::Setup(bool ignore,
> > +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 bool verbose,
> > +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 double& max_load_average) {
> > ++bool GNUmakeTokenPool::SetupClient(bool ignore,
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool verbose,
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 double& max_lo=
ad_average) {
> > +=C2=A0=C2=A0 const char* value =3D GetEnv("MAKEFLAGS");
> > +=C2=A0=C2=A0 if (!value)
> > +=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> > +diff --git a/src/tokenpool-gnu-make.h b/src/tokenpool-gnu-make.h
> > +index c94cca5..f4ab8d7 100644
> > +--- a/src/tokenpool-gnu-make.h
> > ++++ b/src/tokenpool-gnu-make.h
> > +@@ -24,7 +24,8 @@ struct GNUmakeTokenPool : public TokenPool {
> > +=C2=A0=C2=A0 virtual void Reserve();
> > +=C2=A0=C2=A0 virtual void Release();
> > +=C2=A0=C2=A0 virtual void Clear();
> > +-=C2=A0 virtual bool Setup(bool ignore, bool verbose, double&
> > max_load_average);
> > ++=C2=A0 virtual bool SetupClient(bool ignore, bool verbose,
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 double& max_load_average);
> > +=20
> > +=C2=A0=C2=A0 // platform specific implementation
> > +=C2=A0=C2=A0 virtual const char* GetEnv(const char* name) =3D 0;
> > +diff --git a/src/tokenpool.h b/src/tokenpool.h
> > +index 931c227..ce2bf48 100644
> > +--- a/src/tokenpool.h
> > ++++ b/src/tokenpool.h
> > +@@ -26,7 +26,8 @@ struct TokenPool {
> > +=C2=A0=C2=A0 virtual void Clear() =3D 0;
> > +=20
> > +=C2=A0=C2=A0 // returns false if token pool setup failed
> > +-=C2=A0 virtual bool Setup(bool ignore, bool verbose, double&
> > max_load_average) =3D 0;
> > ++=C2=A0 virtual bool SetupClient(bool ignore, bool verbose,
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 double& max_load_average) =3D 0;
> > +=20
> > + #ifdef _WIN32
> > +=C2=A0=C2=A0 virtual void WaitForTokenAvailability(HANDLE ioport) =3D =
0;
> > +diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
> > +index 1bc1c84..9d07146 100644
> > +--- a/src/tokenpool_test.cc
> > ++++ b/src/tokenpool_test.cc
> > +@@ -77,7 +77,7 @@ struct TokenPoolTest : public testing::Test {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENVIRONMENT_INIT(buf_);
> > +=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if ((tokens_ =3D TokenPool::Get()) !=3D NULL)=
 {
> > +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!tokens_->Setup(ignore_jobserver, =
false, load_avg_)) {
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!tokens_->SetupClient(ignore_jobse=
rver, false,
> > load_avg_)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delete tokens_;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tokens_ =3D NULL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +--=20
> > +2.44.0
> > +
> > diff --git a/meta/recipes-devtools/ninja/files/0002-Add-GNU-make-
> > jobserver-fifo-style-client-support.patch b/meta/recipes-
> > devtools/ninja/files/0002-Add-GNU-make-jobserver-fifo-style-client-
> > support.patch
> > new file mode 100644
> > index 0000000000..770a53fbc9
> > --- /dev/null
> > +++ b/meta/recipes-devtools/ninja/files/0002-Add-GNU-make-
> > jobserver-fifo-style-client-support.patch
> > @@ -0,0 +1,271 @@
> > +From 830b7fb396383171c5fac2aae7de880ac83ce955 Mon Sep 17 00:00:00
> > 2001
> > +From: Stefan Becker <chemobejk@gmail.com>
> > +Date: Mon, 7 Nov 2022 20:45:27 +0200
> > +Subject: [PATCH 2/2] Add GNU make jobserver fifo style client
> > support
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +GNU make 4.4 introduced a new jobserver style "fifo" for POSIX
> > systems
> > +which passes a named pipe down to the clients.
> > +
> > +- update auth parser to recognize "fifo:<name>" format
> > +- open named pipe for reading and writing
> > +- make sure the file descriptors are closed in the destructor
> > +- add 2 tests that aren't compiled for WIN32
> > +
> > +Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> > +Upstream-Status: Submitted
> > [https://github.com/Kitware/ninja/pull/2]
> > +---
> > + src/tokenpool-gnu-make-posix.cc | 46 ++++++++++++++++-
> > + src/tokenpool_test.cc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 88
> > ++++++++++++++++++++++++++++++---
> > + 2 files changed, 127 insertions(+), 7 deletions(-)
> > +
> > +diff --git a/src/tokenpool-gnu-make-posix.cc b/src/tokenpool-gnu-
> > make-posix.cc
> > +index 8447070..a82cce4 100644
> > +--- a/src/tokenpool-gnu-make-posix.cc
> > ++++ b/src/tokenpool-gnu-make-posix.cc
> > +@@ -40,6 +40,7 @@ struct GNUmakeTokenPoolPosix : public
> > GNUmakeTokenPool {
> > +=C2=A0 private:
> > +=C2=A0=C2=A0 int rfd_;
> > +=C2=A0=C2=A0 int wfd_;
> > ++=C2=A0 bool closeFds_;
> > +=20
> > +=C2=A0=C2=A0 struct sigaction old_act_;
> > +=C2=A0=C2=A0 bool restore_;
> > +@@ -48,14 +49,19 @@ struct GNUmakeTokenPoolPosix : public
> > GNUmakeTokenPool {
> > +=C2=A0=C2=A0 static void CloseDupRfd(int signum);
> > +=20
> > +=C2=A0=C2=A0 bool CheckFd(int fd);
> > ++=C2=A0 bool CheckFifo(const char* fifo);
> > +=C2=A0=C2=A0 bool SetAlarmHandler();
> > + };
> > +=20
> > +-GNUmakeTokenPoolPosix::GNUmakeTokenPoolPosix() : rfd_(-1), wfd_(-
> > 1), restore_(false) {
> > ++GNUmakeTokenPoolPosix::GNUmakeTokenPoolPosix() : rfd_(-1), wfd_(-
> > 1), closeFds_(false), restore_(false) {
> > + }
> > +=20
> > + GNUmakeTokenPoolPosix::~GNUmakeTokenPoolPosix() {
> > +=C2=A0=C2=A0 Clear();
> > ++=C2=A0 if (closeFds_) {
> > ++=C2=A0=C2=A0=C2=A0 close(wfd_);
> > ++=C2=A0=C2=A0=C2=A0 close(rfd_);
> > ++=C2=A0 }
> > +=C2=A0=C2=A0 if (restore_)
> > +=C2=A0=C2=A0=C2=A0=C2=A0 sigaction(SIGALRM, &old_act_, NULL);
> > + }
> > +@@ -69,6 +75,36 @@ bool GNUmakeTokenPoolPosix::CheckFd(int fd) {
> > +=C2=A0=C2=A0 return true;
> > + }
> > +=20
> > ++bool GNUmakeTokenPoolPosix::CheckFifo(const char* fifo) {
> > ++=C2=A0 // remove possible junk from end of fifo name
> > ++=C2=A0 char *filename =3D strdup(fifo);
> > ++=C2=A0 char *end;
> > ++=C2=A0 if ((end =3D strchr(filename, ' ')) !=3D NULL) {
> > ++=C2=A0=C2=A0=C2=A0 *end =3D '\0';
> > ++=C2=A0 }
> > ++
> > ++=C2=A0 int rfd =3D open(filename, O_RDONLY);
> > ++=C2=A0 if (rfd < 0) {
> > ++=C2=A0=C2=A0=C2=A0 free(filename);
> > ++=C2=A0=C2=A0=C2=A0 return false;
> > ++=C2=A0 }
> > ++
> > ++=C2=A0 int wfd =3D open(filename, O_WRONLY);
> > ++=C2=A0 if (wfd < 0) {
> > ++=C2=A0=C2=A0=C2=A0 close(rfd);
> > ++=C2=A0=C2=A0=C2=A0 free(filename);
> > ++=C2=A0=C2=A0=C2=A0 return false;
> > ++=C2=A0 }
> > ++
> > ++=C2=A0 free(filename);
> > ++
> > ++=C2=A0 rfd_ =3D rfd;
> > ++=C2=A0 wfd_ =3D wfd;
> > ++=C2=A0 closeFds_ =3D true;
> > ++
> > ++=C2=A0 return true;
> > ++}
> > ++
> > + int GNUmakeTokenPoolPosix::dup_rfd_ =3D -1;
> > +=20
> > + void GNUmakeTokenPoolPosix::CloseDupRfd(int signum) {
> > +@@ -89,6 +125,13 @@ bool GNUmakeTokenPoolPosix::SetAlarmHandler()
> > {
> > + }
> > +=20
> > + bool GNUmakeTokenPoolPosix::ParseAuth(const char* jobserver) {
> > ++=C2=A0 // check for jobserver-fifo style
> > ++=C2=A0 const char* fifo;
> > ++=C2=A0 if (((fifo =3D strstr(jobserver, "=3Dfifo:")) !=3D NULL) &&
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CheckFifo(fifo + 6))
> > ++=C2=A0=C2=A0=C2=A0 return SetAlarmHandler();
> > ++
> > ++=C2=A0 // check for legacy simple pipe style
> > +=C2=A0=C2=A0 int rfd =3D -1;
> > +=C2=A0=C2=A0 int wfd =3D -1;
> > +=C2=A0=C2=A0 if ((sscanf(jobserver, "%*[^=3D]=3D%d,%d", &rfd, &wfd) =
=3D=3D 2) &&
> > +@@ -100,6 +143,7 @@ bool GNUmakeTokenPoolPosix::ParseAuth(const
> > char* jobserver) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0 return true;
> > +=C2=A0=C2=A0 }
> > +=20
> > ++=C2=A0 // some jobserver style we don't support
> > +=C2=A0=C2=A0 return false;
> > + }
> > +=20
> > +diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
> > +index 9d07146..e15da6c 100644
> > +--- a/src/tokenpool_test.cc
> > ++++ b/src/tokenpool_test.cc
> > +@@ -19,7 +19,10 @@
> > + #ifdef _WIN32
> > + #include <windows.h>
> > + #else
> > ++#include <fcntl.h>
> > + #include <unistd.h>
> > ++#include <sys/types.h>
> > ++#include <sys/stat.h>
> > + #endif
> > +=20
> > + #include <stdio.h>
> > +@@ -35,6 +38,8 @@
> > + #define AUTH_FORMAT(tmpl)=C2=A0=C2=A0 "foo " tmpl "=3D%d,%d bar"
> > + #define ENVIRONMENT_CLEAR() unsetenv("MAKEFLAGS")
> > + #define ENVIRONMENT_INIT(v) setenv("MAKEFLAGS", v, true)
> > ++
> > ++#define FIFO_NAME "ninja-test-tokenpool-fifo"
> > + #endif
> > +=20
> > + namespace {
> > +@@ -60,11 +65,24 @@ struct TokenPoolTest : public testing::Test {
> > +=C2=A0=C2=A0=C2=A0=C2=A0 semaphore_name_ =3D SEMAPHORE_NAME;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if ((semaphore_ =3D CreateSemaphore(0, 0, 2, =
SEMAPHORE_NAME))
> > =3D=3D NULL)
> > + #else
> > ++=C2=A0=C2=A0=C2=A0 if (mkfifo(FIFO_NAME, 0600) < 0) {
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_TRUE(false);
> > ++=C2=A0=C2=A0=C2=A0 }
> > ++
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (pipe(fds_) < 0)
> > + #endif
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_TRUE(false);
> > +=C2=A0=C2=A0 }
> > +=20
> > ++=C2=A0 void GetPool(bool ignore_jobserver) {
> > ++=C2=A0=C2=A0=C2=A0 if ((tokens_ =3D TokenPool::Get()) !=3D NULL) {
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!tokens_->SetupClient(ignore_jobse=
rver, false,
> > load_avg_)) {
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delete tokens_;
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tokens_ =3D NULL;
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > ++=C2=A0=C2=A0=C2=A0 }
> > ++=C2=A0 }
> > ++
> > +=C2=A0=C2=A0 void CreatePool(const char* format, bool ignore_jobserver=
 =3D
> > false) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (format) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sprintf(buf_, format,
> > +@@ -76,18 +94,30 @@ struct TokenPoolTest : public testing::Test {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 );
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENVIRONMENT_INIT(buf_);
> > +=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +-=C2=A0=C2=A0=C2=A0 if ((tokens_ =3D TokenPool::Get()) !=3D NULL) {
> > +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!tokens_->SetupClient(ignore_jobse=
rver, false,
> > load_avg_)) {
> > +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delete tokens_;
> > +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tokens_ =3D NULL;
> > +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +-=C2=A0=C2=A0=C2=A0 }
> > ++=C2=A0=C2=A0=C2=A0 GetPool(ignore_jobserver);
> > +=C2=A0=C2=A0 }
> > +=20
> > +=C2=A0=C2=A0 void CreateDefaultPool() {
> > +=C2=A0=C2=A0=C2=A0=C2=A0 CreatePool(AUTH_FORMAT("--jobserver-auth"));
> > +=C2=A0=C2=A0 }
> > +=20
> > ++#ifndef _WIN32
> > ++=C2=A0 void CreateFifoPool() {
> > ++=C2=A0=C2=A0=C2=A0 // close simple pipe fds...
> > ++=C2=A0=C2=A0=C2=A0 close(fds_[0]);
> > ++=C2=A0=C2=A0=C2=A0 close(fds_[1]);
> > ++
> > ++=C2=A0=C2=A0=C2=A0 // ... and open named pipe instead
> > ++=C2=A0=C2=A0=C2=A0 if ((fds_[0] =3D open(FIFO_NAME, O_RDONLY|O_NONBLO=
CK)) < 0)
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_TRUE(false);
> > ++=C2=A0=C2=A0=C2=A0 if ((fds_[1] =3D open(FIFO_NAME, O_WRONLY)) < 0)
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_TRUE(false);
> > ++
> > ++=C2=A0=C2=A0=C2=A0 ENVIRONMENT_INIT("foo --jobserver-auth=3Dfifo:" FI=
FO_NAME "
> > bar");
> > ++=C2=A0=C2=A0=C2=A0 GetPool(false);
> > ++=C2=A0 }
> > ++#endif
> > ++
> > +=C2=A0=C2=A0 virtual void TearDown() {
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (tokens_)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delete tokens_;
> > +@@ -96,6 +126,7 @@ struct TokenPoolTest : public testing::Test {
> > + #else
> > +=C2=A0=C2=A0=C2=A0=C2=A0 close(fds_[0]);
> > +=C2=A0=C2=A0=C2=A0=C2=A0 close(fds_[1]);
> > ++=C2=A0=C2=A0=C2=A0 unlink(FIFO_NAME);
> > + #endif
> > +=C2=A0=C2=A0=C2=A0=C2=A0 ENVIRONMENT_CLEAR();
> > +=C2=A0=C2=A0 }
> > +@@ -167,6 +198,15 @@ TEST_F(TokenPoolTest, MonitorFD) {
> > +=20
> > +=C2=A0=C2=A0 EXPECT_EQ(fds_[0], tokens_->GetMonitorFd());
> > + }
> > ++
> > ++TEST_F(TokenPoolTest, MonitorFDFifo) {
> > ++=C2=A0 CreateFifoPool();
> > ++
> > ++=C2=A0 ASSERT_NE(NULL, tokens_);
> > ++=C2=A0 EXPECT_EQ(kLoadAverageDefault, load_avg_);
> > ++
> > ++=C2=A0 EXPECT_NE(-1, tokens_->GetMonitorFd());
> > ++}
> > + #endif
> > +=20
> > + TEST_F(TokenPoolTest, ImplicitToken) {
> > +@@ -226,6 +266,42 @@ TEST_F(TokenPoolTest, TwoTokens) {
> > +=C2=A0=C2=A0 EXPECT_TRUE(tokens_->Acquire());
> > + }
> > +=20
> > ++#ifndef _WIN32
> > ++TEST_F(TokenPoolTest, TwoTokensFifo) {
> > ++=C2=A0 CreateFifoPool();
> > ++
> > ++=C2=A0 ASSERT_NE(NULL, tokens_);
> > ++=C2=A0 EXPECT_EQ(kLoadAverageDefault, load_avg_);
> > ++
> > ++=C2=A0 // implicit token
> > ++=C2=A0 EXPECT_TRUE(tokens_->Acquire());
> > ++=C2=A0 tokens_->Reserve();
> > ++=C2=A0 EXPECT_FALSE(tokens_->Acquire());
> > ++
> > ++=C2=A0 // jobserver offers 2nd token
> > ++=C2=A0 char test_tokens[1] =3D { '+' };
> > ++=C2=A0 ASSERT_EQ(1u, write(fds_[1], test_tokens,
> > sizeof(test_tokens)));
> > ++=C2=A0 EXPECT_TRUE(tokens_->Acquire());
> > ++=C2=A0 tokens_->Reserve();
> > ++=C2=A0 EXPECT_FALSE(tokens_->Acquire());
> > ++
> > ++=C2=A0 // release 2nd token
> > ++=C2=A0 tokens_->Release();
> > ++=C2=A0 EXPECT_TRUE(tokens_->Acquire());
> > ++
> > ++=C2=A0 // release implicit token - must return 2nd token back to
> > jobserver
> > ++=C2=A0 tokens_->Release();
> > ++=C2=A0 EXPECT_TRUE(tokens_->Acquire());
> > ++
> > ++=C2=A0 // there must be one token available
> > ++=C2=A0 EXPECT_EQ(1u, read(fds_[0], buf_, sizeof(buf_)));
> > ++=C2=A0 EXPECT_EQ(test_tokens[0], buf_[0]);
> > ++
> > ++=C2=A0 // implicit token
> > ++=C2=A0 EXPECT_TRUE(tokens_->Acquire());
> > ++}
> > ++#endif
> > ++
> > + TEST_F(TokenPoolTest, Clear) {
> > +=C2=A0=C2=A0 CreateDefaultPool();
> > +=20
> > +--=20
> > +2.44.0
> > +
> > diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
> > b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
> > index 8e297ec4d4..dbff2e191a 100644
> > --- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
> > +++ b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
> > @@ -6,9 +6,13 @@ LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Da81586a64ad4e476c791cda7e2f2c52e"
> > =C2=A0
> > =C2=A0DEPENDS =3D "re2c-native ninja-native"
> > =C2=A0
> > -SRCREV =3D "a524bf3f6bacd1b4ad85d719eed2737d8562f27a"
> > +SRCREV =3D "95dee2a91d96c409d54f9fa0b70ea9aa2bdf8e63"
> > =C2=A0
> > -SRC_URI =3D "git://github.com/ninja-
> > build/ninja.git;branch=3Drelease;protocol=3Dhttps"
> > +SRC_URI =3D " \
> > +=C2=A0=C2=A0=C2=A0 git://github.com/kitware/ninja.git;branch=3Dkitware=
-staged-
> > features;protocol=3Dhttps \
> > +=C2=A0=C2=A0=C2=A0 file://0001-Rename-TokenPool-Setup-to-SetupClient.p=
atch=C2=A0\
> > +=C2=A0=C2=A0=C2=A0
> > file://0002-Add-GNU-make-jobserver-fifo-style-client-support.patch=C2=
=A0
> > \
> > +"
> > =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
> > =C2=A0
> > =C2=A0S =3D "${WORKDIR}/git"
> > --=20
> > 2.44.0
> >=20
>=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#197956):
> > https://lists.openembedded.org/g/openembedded-core/message/197956
> > Mute This Topic:
> > https://lists.openembedded.org/mt/105326967/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
>=20
>=20


