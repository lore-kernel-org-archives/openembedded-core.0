Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 764357680C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 17:30:37 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so203373866wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 10:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B0vPGJIL/oIX6tM3qDXSM1jgBFZHD3J1IB84/z4To8Y=;
	b=FaL10LRAXTsZSlZILYIKk+aagyiSkqhKk8BYX2C30k1aUTv6E7qN6V7rSt+3Ogiao6
	IZUr9n1hYME+UKLXfs4I7wt656nk0QuKNw1h5TQ9Ivd4VDyrH2WCnWfLdYeiI2y0FUAc
	6lwaZ+2jEdwMqX3ChNJlA+Le1NBhJwyo1arw7TncE43UDUrXfCbv4GvCqjCAYDpFIOcR
	pU2pgiUZdRfMMGwxWz6ROXDwfsZRAZPJV5L9+BHlhH41TCrHD6DukrcUFnq59AgjsvOc
	ufQ28oaQn1t7Do55k5pi6hiqv3+UWvakop3tDqJOPhqmpY2F0WwbwlRJySj+ipUJ44bF
	iFNA==
X-Received: by 10.194.80.38 with SMTP id o6mr30789346wjx.52.1442943037239;
	Tue, 22 Sep 2015 10:30:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jq10sm2901824wjc.40.2015.09.22.10.30.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 10:30:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Sep 2015 19:30:40 +0200
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20150922173040.GC2388@jama>
References: <1442931113-25056-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1442931113-25056-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] sstate: run recipe-provided hooks outside of ${B}
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
X-List-Received-Date: Tue, 22 Sep 2015 17:30:39 -0000
X-Groupsio-MsgNum: 71461
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Content-Disposition: inline

--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2015 at 03:11:53PM +0100, Ross Burton wrote:
> To avoid races between the sstate tasks/hooks using ${B} as the cwd, and =
other
> tasks such as cmake_do_configure which deletes and re-creates ${B}, ensur=
e that
> all sstate hooks are run in the right directory, and run the prefunc/post=
func in WORKDIR.

No error in first 126 iterations of:
for i in `seq -w 1 1000`; do bitbake -c cleansstate perf; bitbake -c build =
-f perf 2>&1 | tee log.perf.$i; done

so it's good improvement, thanks!

Please get this merged in fido and dizzy as well.

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/sstate.bbclass | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
>=20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index b9ad6da..695929c 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -61,16 +61,6 @@ SSTATE_SIG_PASSPHRASE ?=3D ""
>  # Whether to verify the GnUPG signatures when extracting sstate archives
>  SSTATE_VERIFY_SIG ?=3D "0"
> =20
> -# Specify dirs in which the shell function is executed and don't use ${B}
> -# as default dirs to avoid possible race about ${B} with other task.
> -sstate_create_package[dirs] =3D "${SSTATE_BUILDDIR}"
> -sstate_unpack_package[dirs] =3D "${SSTATE_INSTDIR}"
> -
> -# Do not run sstate_hardcode_path() in ${B}:
> -# the ${B} maybe removed by cmake_do_configure() while
> -# sstate_hardcode_path() running.
> -sstate_hardcode_path[dirs] =3D "${SSTATE_BUILDDIR}"
> -
>  python () {
>      if bb.data.inherits_class('native', d):
>          d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH', False))
> @@ -267,7 +257,7 @@ def sstate_install(ss, d):
>              oe.path.copyhardlinktree(state[1], state[2])
> =20
>      for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '').split(=
):
> -        bb.build.exec_func(postinst, d)
> +        bb.build.exec_func(postinst, d, (os.getcwd(),))
> =20
>      for lock in locks:
>          bb.utils.unlockfile(lock)
> @@ -307,7 +297,8 @@ def sstate_installpkg(ss, d):
>              bb.warn("Cannot verify signature on sstate package %s" % sst=
atepkg)
> =20
>      for f in (d.getVar('SSTATEPREINSTFUNCS', True) or '').split() + ['ss=
tate_unpack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS', True) or '').spl=
it():
> -        bb.build.exec_func(f, d)
> +        # All hooks should run in the SSTATE_INSTDIR
> +        bb.build.exec_func(f, d, (sstateinst,))
> =20
>      for state in ss['dirs']:
>          prepdir(state[1])
> @@ -579,8 +570,9 @@ def sstate_package(ss, d):
> =20
>      for f in (d.getVar('SSTATECREATEFUNCS', True) or '').split() + ['sst=
ate_create_package'] + \
>               (d.getVar('SSTATEPOSTCREATEFUNCS', True) or '').split():
> -        bb.build.exec_func(f, d)
> - =20
> +        # All hooks should run in SSTATE_BUILDDIR.
> +        bb.build.exec_func(f, d, (sstatebuild,))
> +
>      bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)
> =20
>      return
> @@ -642,19 +634,21 @@ python sstate_task_prefunc () {
>      shared_state =3D sstate_state_fromvars(d)
>      sstate_clean(shared_state, d)
>  }
> +sstate_task_prefunc[dirs] =3D "${WORKDIR}"
> =20
>  python sstate_task_postfunc () {
>      shared_state =3D sstate_state_fromvars(d)
>      sstate_install(shared_state, d)
>      for intercept in shared_state['interceptfuncs']:
> -        bb.build.exec_func(intercept, d)
> +        bb.build.exec_func(intercept, d, (os.getcwd(),))
>      omask =3D os.umask(002)
>      if omask !=3D 002:
>         bb.note("Using umask 002 (not %0o) for sstate packaging" % omask)
>      sstate_package(shared_state, d)
>      os.umask(omask)
>  }
> - =20
> +sstate_task_postfunc[dirs] =3D "${WORKDIR}"
> +
> =20
>  #
>  # Shell function to generate a sstate package from a directory
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYBkD8ACgkQN1Ujt2V2gBwdFgCgk2OeLD22KS3cHcpIXO687s40
Y8gAn3zvHv5t/mAUPDrE8lGuE7jU3z24
=mjkV
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
