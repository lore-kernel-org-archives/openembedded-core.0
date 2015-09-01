Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 29B2576F8A;
	Tue,  1 Sep 2015 19:08:48 +0000 (UTC)
Received: by wibz8 with SMTP id z8so42578233wib.1;
	Tue, 01 Sep 2015 12:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=j3DPjxOcyd/HPkfQsX+ohrVEw/G4J+rckz54nbSpC28=;
	b=RA+LroiEI8C82zs4ows63sYUlHuR9HV92seHk3jwVIu1yP7ppMb904sqOUDN9ilMTl
	vQGBErEOoK6vUdYFqgEYNtJLNaRt8CxJdDTOz2qz9o3zvgyNHBfRTgryhaAearnxVBb2
	zQg+puekvpQ569kotKZlO9CTLNeSYvqZOUFqJJj30Q/RyTujdPx8sDHrps+zOl7UBcRB
	7vhetlA+JgI+FUOy5uBTjaqP7Wa/29w4Uxw+usNu/fRIDY1N+6di+Pg5zxiyHl1bHn27
	OX9iJNRHvjOaGZ+nIOfPsMn/o4zfNokN9N3Xy8eU8bomON4n9rYUouNjuuZHdsoAYhlV
	O/9g==
X-Received: by 10.194.95.103 with SMTP id dj7mr19484565wjb.118.1441134527957; 
	Tue, 01 Sep 2015 12:08:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 4sm28552055wjt.46.2015.09.01.12.08.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Sep 2015 12:08:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Sep 2015 21:09:02 +0200
To: openembedded-core@lists.openembedded.org,
	Alex Franco <alejandro.franco@linux.intel.com>
Message-ID: <20150901190902.GD2458@jama>
References: <20150901104522.9FC59505A9@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150901104522.9FC59505A9@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Alex Franco : Fix mode +st on TMPDIR when creating it
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
X-List-Received-Date: Tue, 01 Sep 2015 19:08:49 -0000
X-Groupsio-MsgNum: 70426
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline

--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2015 at 10:45:22AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 8236d57439640a185c0226312cd4903a3ce2f53b
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D8236d57439640a185c0226312cd4903a3ce2f53b
>=20
> Author: Alex Franco <alejandro.franco@linux.intel.com>
> Date:   Fri Aug 28 17:34:04 2015 -0500
>=20
> Fix mode +st on TMPDIR when creating it
>=20
> A sanity check fails when TMPDIR has setuid, setgid set. It was
> proposed to fix this on TMPDIR creation instead of failing with
> a sanity test only. This patch handles removal of those special
> bits (and additonally, the sticky bit) from BUILDDIR and TMPDIR
> when these directories are created.

Can you explain why it's needed to remove them?

I have tmp-glibc mounted as tmpfs:
drwxrwxrwt   4 root    jenkins   80 Sep  1 19:02 tmp-glibc

and since this change all bitbake executions are failing with:

NOTE: Started PRServer with DBfile: /home/jenkins/oe/world/shr-core/cache/p=
rserv.sqlite3, IP: 127.0.0.1, PORT: 43102, PID: 9220
ERROR: Execution of event handler 'check_sanity_eventhandler' failed
Traceback (most recent call last):
  File "check_sanity_eventhandler(e)", line 6, in check_sanity_eventhandler=
(e=3D<bb.event.SanityCheck object at 0x3c76ad0>)
  File "sanity.bbclass", line 34, in check_sanity(sanity_data=3D<bb.data_sm=
art.DataSmart object at 0x3c83890>)
  File "sanity.bbclass", line 157, in check_sanity_everybuild(status=3D<San=
ityStatus object at 0x3c83850>, d=3D<bb.data_smart.DataSmart object at 0x3c=
83890>)
OSError: [Errno 1] Operation not permitted: '/home/jenkins/oe/world/shr-cor=
e/tmp-glibc'

I can change the permissions manually, but I would like to know
why is this needed and checked every time the bitbake is executed.

Regards,

>=20
> [YOCTO #7669]
>=20
> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/classes/sanity.bbclass | 5 +++++
>  scripts/oe-setup-builddir   | 1 +
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index ef90fc8..2864318 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -686,6 +686,7 @@ def check_sanity_version_change(status, d):
>      status.addresult(check_not_nfs(tmpdir, "TMPDIR"))
> =20
>  def check_sanity_everybuild(status, d):
> +    import os, stat
>      # Sanity tests which test the users environment so need to run at ea=
ch build (or are so cheap
>      # it makes sense to always run them.
> =20
> @@ -839,6 +840,10 @@ def check_sanity_everybuild(status, d):
>                  status.addresult("Error, TMPDIR has changed location. Yo=
u need to either move it back to %s or rebuild\n" % saved_tmpdir)
>      else:
>          bb.utils.mkdirhier(tmpdir)
> +        # Remove setuid, setgid and sticky bits from TMPDIR
> +        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISUID)
> +        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISGID)
> +        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISVTX)
>          with open(checkfile, "w") as f:
>              f.write(tmpdir)
> =20
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index add0b50..f5b7e4e 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -24,6 +24,7 @@ if [ -z "$BUILDDIR" ]; then
>  fi
> =20
>  mkdir -p "$BUILDDIR/conf"
> +chmod -R -st "$BUILDDIR"=20
> =20
>  if [ ! -d "$BUILDDIR" ]; then
>      echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXl984ACgkQN1Ujt2V2gBz22wCfRvUopuNWrg7WOsCMLBKqdezv
WssAoKihuQXYHvXPKkz9deo9O5u9oyH2
=XXS2
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--
