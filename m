Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93871C44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:59:44 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8096.1783670378287726842
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=j640NhZK;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EA054C2F4FB
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:59:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40AC760341;
	Fri, 10 Jul 2026 07:59:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 285AF11BD26B3;
	Fri, 10 Jul 2026 09:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783670375; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H0sIadk5bBzXXbGCxUJEMl1wGUpXXgmVQXf6kgJ0Uoo=;
	b=j640NhZKDfeBP1ZguTv3YoD3wPgeZInxZzqDdL5WUIHG3Ew74Z2E3sqBltaqdD0NWL8Lav
	ldUwPrtPLkgyWSX9AWS7S7rcqp8VwBdww+3A+Cw2Ppn+vIMQjGQ1CZQwSC5JvpGMR8Mz23
	bek2jzSVOgVUVBpP1kQjRiHke8BBffB+YsF/PvZvo5B0beDOZU/TjLx9ovhfFFwx2cvBiL
	H/unQQ846Dm7ERDGv/jeDVHNQiv/T++cLsbUw/DQ/pqBR/WC21QDk2REAwfgz2NF/5Jii6
	+LUJ+u3fjgPzcD2k5ef0cI3e4Utuev/A/lOD7fIm/o/IQrPlxPWTfKeg+wBrvA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Yoann Congal <yoann.congal@smile.fr>
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com
Subject: Re: [OE-core] [wrynose][PATCH 3/3] python3: fix CVE-2026-11972
Date: Fri, 10 Jul 2026 09:59:33 +0200
Message-ID: <wUbcnbU-TzOO6xOTZQJ9sg@bootlin.com>
In-Reply-To: <DJUCGZSG6Q42.3GE2OCSOP0W3T@smile.fr>
References: 
 <20260706-fix-cves-python-wrynose-v1-0-b53e09c2b62a@bootlin.com>
 <20260706-fix-cves-python-wrynose-v1-3-b53e09c2b62a@bootlin.com>
 <DJUCGZSG6Q42.3GE2OCSOP0W3T@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240615

On Thursday, July 9, 2026 at 11:05=E2=80=AFPM, Yoann Congal wrote:
> On Mon Jul 6, 2026 at 1:00 PM CEST, Benjamin Robin via lists.openembedded=
=2Eorg wrote:
> > When using the "tarfile" module with a file opened in "streaming mode"
> > (mode=3D"r|") the tarfile module did not properly handle EOF, making ar=
chive
> > parsing take exponentially longer.
> >
> > Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@boot=
lin.com>
> > ---
> >  .../python/python3/CVE-2026-11972.patch            | 59 ++++++++++++++=
++++++++
> >  meta/recipes-devtools/python/python3_3.14.6.bb     |  1 +
> >  2 files changed, 60 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch =
b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
> > new file mode 100644
> > index 000000000000..7dc9c6697112
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
> > @@ -0,0 +1,59 @@
> > +From 2d256d4bfd654bdcaf2d96733799be73b8ff8f69 Mon Sep 17 00:00:00 2001
> > +From: Petr Viktorin <encukou@gmail.com>
> > +Date: Tue, 23 Jun 2026 15:13:30 +0200
> > +Subject: [PATCH 2/2] gh-151981: Make tarfile._Stream.seek break at EOF
> > + (GH-151982)
> > +
> > +CVE: CVE-2026-11972
> > +Upstream-Status: Backport [https://github.com/python/cpython/commit/f5=
0bf13566189c8d0ce5a814f33eff3d89951896]
>=20
> Hello,
>=20
> Upstream patch had a "Co-authored-by: Stan Ulbrych <stan@python.org>"
> that I readded on my branch. Can you send a patch to master to re-add it =
there
> too?

I sent a patch to fix that, same for "glib-2.0: fix CVE-2026-58016".
I am sorry, this was done due to a lack of knowledge regarding how to handle
it.
To summarize, do I just need to include these lines at the end of the commit
message in the patch, without altering anything else?=20
 - CVE:=20
 - Upstream-Status:
 - My Signed-off-by

In Yocto, what is the rule when backporting a commit which is in master, for
example to Wrynose, regarding the Signed-off-by? I just need to add mine
without touching anything else? Is there any difference if I am the author
of the commit in master or not?

Thanks
=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




