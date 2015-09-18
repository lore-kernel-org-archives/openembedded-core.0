Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 07F2F72A78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 15:13:19 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so36710718wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 08:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pWKbD54kbHe2Jsy+CA0GHuiTiEzJfUT+DgfbhJOgTio=;
	b=ewRyKAnOVSXFGNo12gbVVlb8+z0Ac19FwWvNbw8+xos3iizayQJuTVG5xI/NRm+QhX
	KiZztkkKWZW67DpZ7OtVgclTT6TtgwpZzV0R1DAnrL1HnGjdRScR5FISWt+be7ae7TzM
	Oblmngl8op8bJmivuFKlhNFvIZjVFCcXoyWHdw3MUgRAWAAB2t0r/Dn43ACcRsdZbdwz
	BXo/6dRs6BSi1+GT3olTNZLlpvijpP0ka9FQ5Ep9qKKBtBKf0XIIncnmEdnRbNwzyw0E
	9bbldLNF85t0+7cRXwQfhAMogP1iKrZ5IQpSskpOA6UjUXhdEIwFzL6ex0zFLQ2FZ2eE
	l+sA==
X-Received: by 10.180.107.1 with SMTP id gy1mr40550465wib.56.1442589199173;
	Fri, 18 Sep 2015 08:13:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id fu5sm6721533wic.0.2015.09.18.08.13.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 08:13:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Sep 2015 17:13:44 +0200
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20150918151344.GA2385@jama>
References: <20150918115458.GA11095@jama>
	<1442582049-12108-1-git-send-email-Martin.Jansa@gmail.com>
	<55FC149B.80800@topic.nl>
MIME-Version: 1.0
In-Reply-To: <55FC149B.80800@topic.nl>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] insane.bbclass: show PN and relative path in package_qa_check_host_user
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
X-List-Received-Date: Fri, 18 Sep 2015 15:13:21 -0000
X-Groupsio-MsgNum: 71303
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2015 at 03:41:47PM +0200, Mike Looijmans wrote:
> On 18-09-15 15:14, Martin Jansa wrote:
> > * show PN as other QA checks
> > * strip PKGDEST prefix from shown path as other QA checks
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta/classes/insane.bbclass | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index 5c8629a..a35e546 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -980,6 +980,7 @@ def package_qa_check_host_user(path, name, d, elf, =
messages):
> >           return
> >
> >       dest =3D d.getVar('PKGDEST', True)
> > +    pn =3D d.getVar('PN', True)
> >       home =3D os.path.join(dest, 'home')
> >       if path =3D=3D home or path.startswith(home + os.sep):
> >           return
> > @@ -991,14 +992,15 @@ def package_qa_check_host_user(path, name, d, elf=
, messages):
> >           if exc.errno !=3D errno.ENOENT:
> >               raise
> >       else:
> > +        rootfs_path =3D path[len(dest):]
> >           check_uid =3D int(d.getVar('HOST_USER_UID', True))
> >           if stat.st_uid =3D=3D check_uid:
> > -            messages["host-user-contaminated"] =3D "%s is owned by uid=
 %d, which is the same as the user running bitbake. This may be due to host=
 contamination" % (path, check_uid)
> > +            messages["host-user-contaminated"] =3D "%s: %s is owned by=
 uid %d, which is the same as the user running bitbake. This may be due to =
host contamination" % (pn, rootfs_path, check_uid)
> >               return False
> >
> >           check_gid =3D int(d.getVar('HOST_USER_GID', True))
> >           if stat.st_gid =3D=3D check_gid:
> > -            messages["host-user-contaminated"] =3D "%s is owned by gid=
 %d, which is the same as the user running bitbake. This may be due to host=
 contamination" % (path, check_gid)
> > +            messages["host-user-contaminated"] =3D "$s: %s is owned by=
 gid %d, which is the same as the user running bitbake. This may be due to =
host contamination" % (pn, rootfs_path, check_gid)
>=20
> I think "$s" is a typo (that will lead to a Python exception).

You're right, but doesn't lead to python exception here

even the pn was printed out in my test build with this, e.g.:

NOTE: recipe e-wm-0.18.8-r0: task do_package_qa: Started
WARNING: QA Issue: e-wm: /e-wm-dbg/usr/src/debug/e-wm/0.18.8-r0/build/src/b=
in/e_fm_shared_types.h is owned by uid 1026, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contamina=
ted]
NOTE: recipe e-wm-0.18.8-r0: task do_package_qa: Succeeded

But v2 comming with %s. Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlX8KicACgkQN1Ujt2V2gBySTACgtpIFkdnwB0oRxeouAObVaoNj
9SwAn10CEBNP/p/ikG5b5Q1OKfaFm6LU
=DcQZ
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
