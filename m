Return-Path: <holger@holgis.net>
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
	by mail.openembedded.org (Postfix) with ESMTP id 9140B7830A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 10:35:33 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.mailbox.org (Postfix) with ESMTPS id 0B4B342913;
	Thu, 24 Aug 2017 12:35:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
	[80.241.56.117]) (amavisd-new, port 10030)
	with ESMTP id KJjge8_NzgVk; Thu, 24 Aug 2017 12:35:31 +0200 (CEST)
Date: Thu, 24 Aug 2017 12:35:25 +0200 (CEST)
From: =?UTF-8?Q?Holger_Schr=C3=B6der?= <holger@holgis.net>
Reply-To: =?UTF-8?Q?Holger_Schr=C3=B6der?= <holger@holgis.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-ID: <95716270.25864.1503570929624@office.mailbox.org>
In-Reply-To: <1503569790.32591.187.camel@linuxfoundation.org>
References: <1911181157.25321.1503568263847@office.mailbox.org>
	<1347152023.25658.1503569657844@office.mailbox.org>
	<1503569790.32591.187.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
Subject: Re: [PATCH] ignore .svn directory in intercepts_dir
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
X-List-Received-Date: Thu, 24 Aug 2017 10:35:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


> Richard Purdie <richard.purdie@linuxfoundation.org> hat am 24. August 201=
7 um 12:16 geschrieben:
>=20
>=20
> On Thu, 2017-08-24 at 12:14 +0200, Holger Schr=C3=B6der wrote:
> > Hi all,
> >=20
> > i would like to get this patch into openembedded-core.
> > i hope this mail is in the correct form. Please tell
> > me if not.
> >=20
> > kind regards, Holger
> >=20
> > Patch description:
> >=20
> > A customer of mine still runs svn. And when i build
> > a rootfs in a jenkins job on the master node, i get
> > a python exception because the .svn directory cannot
> > be executed as an interceptor as it seems.
> >=20
> > With this patch a possible ".svn" subdirectory in
> > that directory will be ignred, and my jenkins build
> > succeeds.
> >=20
> > Signed-off-by: Holger Schr=C3=B6der <holger@holgis.net>
> > ---
> >  meta/lib/oe/rootfs.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> > index 96591f3..e99aa67 100644
> > --- a/meta/lib/oe/rootfs.py
> > +++ b/meta/lib/oe/rootfs.py
> > @@ -296,7 +296,7 @@ class Rootfs(object, metaclass=3DABCMeta):
> >          for script in os.listdir(intercepts_dir):
> >              script_full =3D os.path.join(intercepts_dir, script)
> > =20
> > -            if script =3D=3D "postinst_intercept" or not
> > os.access(script_full, os.X_OK):
> > +            if script =3D=3D "postinst_intercept" or script =3D=3D ".s=
vn" or
> > not os.access(script_full, os.X_OK):
> >                  continue
> > =20
> >              bb.note("> Executing %s intercept ..." % script)
>=20
>=20
> I think a better, more general solution here would be to add:
>=20
> if script.startswith("."):
>      continue
>=20
> ?
>=20
my first goal was to be less "invasive", but thinking
about it the more general solution is better.

i will update the patch.

> Cheers,
>=20
> Richard
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

