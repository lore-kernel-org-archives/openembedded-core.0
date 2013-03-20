Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIPmq-0006mj-BY
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 21:39:05 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so1657677pbc.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 13:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=eMwc7FlbAatXv/xzjPm7oXnhH45pyPWvRkLoIxGI/co=;
	b=h4WkMQRj8lQCJes8bDPO+evFz0WPACCtES017nytjsMin+0euwMUMlCQjyhEuI3vFY
	ub7p/M5JKZsvL+0T5rRK2a3UKvWmqjfk5MG5g6cRLoaL9BKqmHCBBAKM+sXlWHkcNvum
	xsoBYvJH1T0oISbJpuLmUy9iBHb422BVqhnePNhUx9nx5lqZn8mVYt3nVTath5/QUMIm
	wfJCtaOzHK3ynAeIvWAP9pmjUgIptB65riQx+g620RkAuFiUIpREuETVEjUjD+PwuF6K
	I/JXLp9rmqOOi0ZFgAW8oT4R3zREUjSduV0MfNvqhDcftKEbFX9jlnc0uekCMg3T1KJU
	f4Dw==
X-Received: by 10.68.171.99 with SMTP id at3mr11231813pbc.136.1363810932350;
	Wed, 20 Mar 2013 13:22:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 1sm3218127pbg.18.2013.03.20.13.22.09
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 13:22:11 -0700 (PDT)
Date: Wed, 20 Mar 2013 21:22:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20130320202206.GD3220@jama>
References: <1363807567-27267-1-git-send-email-obi@opendreambox.org>
	<20130320201843.GC3220@jama>
MIME-Version: 1.0
In-Reply-To: <20130320201843.GC3220@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH/RFC] netbase: inherit allarch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2013 20:39:05 -0000
X-Groupsio-MsgNum: 36844
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UfEAyuTBtIjiZzX6"
Content-Disposition: inline

--UfEAyuTBtIjiZzX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2013 at 09:18:43PM +0100, Martin Jansa wrote:
> On Wed, Mar 20, 2013 at 08:26:07PM +0100, Andreas Oberritter wrote:
> > It doesn't ship any binaries, so it should use allarch,
> > now that ifupdown has been moved to another recipe.
> >=20
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > ---
> > This causes the following error on my system. Notice the "r0" in the fa=
iled
> > path. Running "bitbake -ccleansstate netbase" doesn't help.
>=20
> You need to remove tmpdir-eglibc/pkgdata for netbase too and don't
> forget to remove all .ipk files from deploy/ipk too, because opkg will
> prefer "higher" architecture instead of higher version, so you'll get
> different (older) netbase installed in do_rootfs and then upgraded on
> target on first opkg upgrade, sigh.

Ah and also netbase stamps.

I've reported the same when netbase was changed from MACHINE_ARCH to
TUNE_PKGARCH:
http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg343=
18.html

> > ERROR: Error executing a python function in /build/openembedded-core/me=
ta/recipes-core/netbase/netbase_5.0.bb:
> > OSError: [Errno 2] No such file or directory: '/build/tmp/work/all-oe-l=
inux/netbase/netbase-1_5.0-r0/packages-split/netbase-dbg'
> >=20
> > ERROR: The stack trace of python calls that resulted in this exception/=
failure was:
> > ERROR:   File "do_package_ipk", line 194, in <module>
> > ERROR:=20
> > ERROR:   File "do_package_ipk", line 45, in do_package_ipk
> > ERROR:=20
> > ERROR: The code that was being executed was:
> > ERROR:      0190:        bb.utils.unlockfile(lf)
> > ERROR:      0191:
> > ERROR:      0192:
> > ERROR:      0193:
> > ERROR:  *** 0194:do_package_ipk(d)
> > ERROR:      0195:
> > ERROR: [From file: 'do_package_ipk', lineno: 194, function: <module>]
> > ERROR:      0041:        basedir =3D os.path.join(os.path.dirname(root))
> > ERROR:      0042:        arch =3D localdata.getVar('PACKAGE_ARCH', True)
> > ERROR:      0043:        pkgoutdir =3D "%s/%s" % (outdir, arch)
> > ERROR:      0044:        bb.mkdirhier(pkgoutdir)
> > ERROR:  *** 0045:        os.chdir(root)
> > ERROR:      0046:        from glob import glob
> > ERROR:      0047:        g =3D glob('*')
> > ERROR:      0048:        try:
> > ERROR:      0049:            del g[g.index('CONTROL')]
> > ERROR: [From file: 'do_package_ipk', lineno: 45, function: do_package_i=
pk]
> > ERROR: Function failed: do_package_ipk
> > ERROR: Execution of event handler 'run_buildstats' failed
> > Traceback (most recent call last):
> >   File "run_buildstats(e)", line 104, in run_buildstats(e=3D<bb.build.T=
askFailed object at 0x73d7810>)
> >   File "buildstats.bbclass", line 5, in write_task_data(status=3D'faile=
d', logfile=3D'/build/tmp/buildstats/netbase-qemumipsel/201303202017/netbas=
e-1_5.0-r0/do_package_write_ipk', dev=3D'dm-1', e=3D<bb.build.TaskFailed ob=
ject at 0x73d7810>)
> > IOError: [Errno 2] No such file or directory: '/build/tmp/buildstats/ne=
tbase-qemumipsel/201303202017/netbase-1_5.0-r0/do_package_write_ipk'
> >=20
> > ERROR: Logfile of failure stored in: /build/tmp/work/all-oe-linux/netba=
se/netbase-1_5.0-r1/temp/log.do_package_write_ipk.27140
> > ERROR: Task 13 (/build/openembedded-core/meta/recipes-core/netbase/netb=
ase_5.0.bb, do_package_write_ipk) failed with exit code '1'
> >=20
> >  meta/recipes-core/netbase/netbase_5.0.bb |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-co=
re/netbase/netbase_5.0.bb
> > index 03fdc38..673a139 100644
> > --- a/meta/recipes-core/netbase/netbase_5.0.bb
> > +++ b/meta/recipes-core/netbase/netbase_5.0.bb
> > @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://packages.debian.org/netbase"
> >  SECTION =3D "base"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D3dd6192d306f582dee=
7687da3d8748ab"
> > -PR =3D "r0"
> > +PR =3D "r1"
> >  PE =3D "1"
> > =20
> >  SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
> > @@ -13,6 +13,8 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netbase/netbase_=
${PV}.tar.gz \
> >  SRC_URI[md5sum] =3D "a379d9199d44d817543eddc211a29b70"
> >  SRC_URI[sha256sum] =3D "ac9424d3cb2bd3c07b6c5bc5875c434d3bc687a73cd7c5=
4b7dc7122308afa9dc"
> > =20
> > +inherit allarch
> > +
> >  do_install () {
> >  	install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
> >  	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
> > --=20
> > 1.7.10.4
> >=20
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UfEAyuTBtIjiZzX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFKGm4ACgkQN1Ujt2V2gBzuAACfSn/EfcHn1WaAx1ZD/oDT5OJl
XU8An3WkSqMyfSmrRZgA05X7uAPWHSJJ
=nkSu
-----END PGP SIGNATURE-----

--UfEAyuTBtIjiZzX6--
