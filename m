Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2514470611
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 10:26:24 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so4350841wes.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 03:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4S4+4dG0Z5fYeUEJYFRh1GXg4oWFNbNd8hnZQ0k8Ak0=;
	b=Nk9pUB2GKx5kt8pnFQe3frNAH8dHzn7BuJCWPhrnVkRWL0PNsozYbbmzs6k6O8+pOp
	cWEic+UT3dKAHuRXxWHOxOH9vdds4zoAVjsTigtAAB9p4ADx0bt493GDdQAvgQTM/fdG
	boTTZEx0lI82sgFDLz4ZpJIWcfCjuNGguihJbtNGYcAPrDYUYkdfyEiYYd8QumPppcRj
	4h9C6/IgvdekVLHwuvyUO0ZvpdW9QDDTwHUAZKiuiBY9e2ZyB8XiDar5LDaUZobI/0h2
	cwvon1O7CDxfFSUlUoVvPIoKDHesRAIlbb4j4hYd2kzY59XMgPJnvHajZnTsL86v2bdI
	o0Pw==
X-Received: by 10.180.7.163 with SMTP id k3mr3418468wia.0.1405679184766;
	Fri, 18 Jul 2014 03:26:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	sa4sm13118737wjb.45.2014.07.18.03.26.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jul 2014 03:26:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Jul 2014 12:26:34 +0200
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140718102634.GO2433@jama>
References: <1404936934.15985.48.camel@ted>
	<CAP9ODKpd5-KkRZg7QMbaMS-zn=f6uephJObn3X44RNoEK8y76A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpd5-KkRZg7QMbaMS-zn=f6uephJObn3X44RNoEK8y76A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC 1/3] insane: Split do_package_qa into a separate task (from do_package)
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
X-List-Received-Date: Fri, 18 Jul 2014 10:26:30 -0000
X-Groupsio-MsgNum: 55208
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wrbiW19WTymQQzps"
Content-Disposition: inline

--wrbiW19WTymQQzps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2014 at 11:43:02PM -0300, Otavio Salvador wrote:
> Hello Richard,
>=20
> (added meta-freescale mailing list as it is related to meta-fsl-arm)
>=20
> On Wed, Jul 9, 2014 at 5:15 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Its possible to run the package QA checks as a separate task rather than
> > as part of the do_package task. This offers more parallelism but the
> > fact that made me propose this is that ideally we'd like to access
> > pkgdata to help add new tests and to do that, we need to run later in
> > the task list. We also need to add in RDEPENDS to the task which apply
> > to do_package_write_* but not do_package. See the subsequent patches
> > for why this is desireable.
> >
> > If we split into a separate task, we need to add in calls to read
> > the sub package data, build the cache structure used by do_package and
> > cover the task with sstate (which is empty and just acts as a stamp
> > saying it passed package QA). We also need to handle our own
> > dependencies.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> When I see a RFC serie I expect people to wait some days /for
> comments/. I learned today those are already merged and /no comment
> time/ has been given.
>=20
> The problem I found is that running the QA checks in another task
> seems to break some use-cases.
>=20
> In the libfslcodec (it is a binary blob provided by Freescale for
> multimedia) we have:
>=20
> ...
> python populate_packages_prepend() {
>     ...
>     # FIXME: All binaries lack GNU_HASH in elf binary but as we don't have
>     # the source we cannot fix it. Disable the insane check for now.
>     for p in d.getVar('PACKAGES', True).split():
>         d.setVar("DEBIAN_NOAUTONAME_%s" % p, "1")
>=20
>         if p =3D=3D 'libfslcodec-test-bin':
>             # FIXME: includes the DUT .so files so we need to deploy those
>             d.appendVar("INSANE_SKIP_%s" % p, "ldflags textrel libdir")
>         else:
>             d.appendVar("INSANE_SKIP_%s" % p, "ldflags textrel")
>     ...
> }
>=20
> In this case the INSANE_SKIP var is not being set on time. If we check
> the value it is being set but it seems to be too late.

FWIW: llvm in meta-oe has similar problem

python llvm_populate_packages() {
    libdir =3D bb.data.expand('${libdir}', d)
    libllvm_libdir =3D bb.data.expand('${libdir}/${LLVM_DIR}', d)
    split_dbg_packages =3D do_split_packages(d, libllvm_libdir+'/.debug', '=
^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s-dbg', 'Split debug package for %=
s', allow_dirs=3DTrue)
    split_packages =3D do_split_packages(d, libdir, '^lib(.*)\.so$', 'libll=
vm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=3DTrue, allow_lin=
ks=3DTrue, recursive=3DTrue)
    split_staticdev_packages =3D do_split_packages(d, libllvm_libdir, '^lib=
(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package =
for %s', allow_dirs=3DTrue)  =20
    if split_packages:
        pn =3D d.getVar('PN', True)
        for package in split_packages:
            d.appendVar('INSANE_SKIP_' + package, ' dev-so')
        d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
        d.appendVar('RDEPENDS_' + pn + '-dbg', ' '+' '.join(split_dbg_packa=
ges))
        d.appendVar('RDEPENDS_' + pn + '-staticdev', ' '+' '.join(split_sta=
ticdev_packages))
}

PACKAGESPLITFUNCS_prepend =3D "llvm_populate_packages "

and now it fails with:

ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: lib=
llvm3.3-llvm-3.3 path '/work/armv5te-oe-linux-gnueabi/llvm3.3/3.3-r0/packag=
es-split/libllvm3.3-llvm-3.3/usr/lib/libLLVM-3.3.so' [dev-so]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/llvm3.3/3.3-r0/temp/log.do_package_qa.21=
132
NOTE: recipe llvm3.3-3.3-r0: task do_package_qa: Failed

I'll look at solution for fsl and do the same for llvm (and also possibly m=
erge all dbg and staticdev packages into one.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wrbiW19WTymQQzps
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPI9loACgkQN1Ujt2V2gBwJDQCgpQJ8vIDpyRHJ6iDi7xbrBoqW
AeAAoKF0YEwLIQ4JbY3QBjygV0D+59wf
=eMmQ
-----END PGP SIGNATURE-----

--wrbiW19WTymQQzps--
