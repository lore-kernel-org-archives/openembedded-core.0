Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RbqYe-0006D9-RA
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Dec 2011 10:27:56 +0100
Received: by eeit10 with SMTP id t10so380720eei.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2011 01:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oNMxRKq+0nGmAcnF6O8da63en3oatwXIoM2zLJ0XDgU=;
	b=CW70P/9OsIDjaX9/3w/FhteVp1pulU9EKGaRAqs5Xk9sAGgpOM2fh0C0UI/oQjDHgT
	PS0SHHgdWtLEcLzPQzkIRFT5YWkAKGi4GfhJPkpmGr5oIhZHkp8/1qXsWWKX2ke2rk32
	Nyu6ph7FjI3a6dNngIEuSF7nHv8CnlD+7fYEA=
Received: by 10.14.29.14 with SMTP id h14mr915161eea.70.1324113655573;
	Sat, 17 Dec 2011 01:20:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 58sm10731402eet.11.2011.12.17.01.20.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Dec 2011 01:20:54 -0800 (PST)
Date: Sat, 17 Dec 2011 10:20:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111217092041.GF3997@jama.jama.net>
References: <1323983329.4568.63.camel@ted>
	<20111217011658.GE3997@jama.jama.net>
	<1324085548.4568.121.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1324085548.4568.121.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Graham Gower <graham.gower@gmail.com>
Subject: Re: opkg: Update svn 625 -> 633 and fix preinst issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Dec 2011 09:27:57 -0000
X-Groupsio-MsgNum: 14376
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y/WcH0a6A93yCHGr"
Content-Disposition: inline

--Y/WcH0a6A93yCHGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 17, 2011 at 01:32:28AM +0000, Richard Purdie wrote:
> On Sat, 2011-12-17 at 02:16 +0100, Martin Jansa wrote:
> > On Thu, Dec 15, 2011 at 09:08:49PM +0000, Richard Purdie wrote:
> > > There is a major issue with opkg images at the moment as preinst
> > > functions are not being executed before their dependencies are instal=
led
> > > and this is leading to corruption of images containing avahi/dbus in
> > > particular.
> > >=20
> > > There are various changes in upstream opkg in the last 8 revisions wh=
ich
> > > make changes in this area but sadly these aren't enough to get things
> > > working for us. I've updated to the latest svn revision with this pat=
ch
> > > since it makes sense to pull in those changes first and then suppleme=
nt
> > > them with the attached patches.
> > >=20
> > > There is a full description of the patches in the patch headers but in
> > > summary they:
> > >=20
> > > a) Ensure preinst functions execute with their dependencies installed.
> > >    This is a pretty invasive change as it changes the package install
> > >    ordering in general.
> > > b) Ensure opkg sets $D, not $PKG_ROOT which we don't use
> > > c) Change opkg to allow execution of postinstall functions which fail
> > >    resulting in execution on the target device as rootfs_ipk.bbclass
> > >    currently does manually.
> > >=20
> > > The remaining changes interface this with the rest of the OE build
> > > infrastructure, adding in the option to tell opkg to run the preinst =
and
> > > postinst functions, ensure the correct environment is present for the
> > > postinst scripts and removing the now unneeded rootfs_ipk class code
> > > which opkg now does itself.
> > >=20
> > > [YOCTO #1711]
> >=20
> > Hi,
> >=20
> > today I got image build failing with this and it seems like some kind of
> > circular dependency or something.
> >=20
> > In fsogsmd_git.bb we have:
> > PACKAGES =3D+ "${PN}-connman ${PN}-connman-dev ${PN}-connman-dbg"
> > RDEPENDS_${PN} +=3D "${PN}-connman"
> >=20
> > and there is also fsogsmd-connman dependency on fsogsmd (because of shl=
ibs),
> > so it's really circular dependency between runtime packages and new opk=
g cannot
> > deal with it.
> >=20
> > Then in log.do_rootfs
> > Installing fsogsmd (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6=
c528-r6.7) to root...
> > Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/qemuarm/fsogsmd_0.5=
=2E0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528-r6.7_qemuarm.ipk.
> > Installing fsogsmd-connman (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc=
56d087c6c528-r6.7) to root...
> > Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/qemuarm/fsogsmd-con=
nman_0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528-r6.7_qemuarm.ipk.
> > Installing fsogsmd (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6=
c528-r6.7) to root...
> > Installing fsogsmd-connman (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc=
56d087c6c528-r6.7) to root...
> > and then this last 2 lines 1794/2 times
> > Installing fsogsmd (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6=
c528-r6.7) to root...
> > Installing fsogsmd-connman (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc=
56d087c6c528-r6.7) to root...
> > Installing task-core-ssh-openssh (1.0-r0) to root...
> > Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv5te/task-core-s=
sh-openssh_1.0-r0_armv5te.ipk.
> > ...
> > and in the end:
> > ERROR: Function 'do_rootfs' failed (see /OE/shr-core/tmp-eglibc/work/qe=
muarm-oe-linux-gnueabi/shr-lite-image/2.0-r20/temp/log.do_rootfs.20387 for =
further information)
> > Collected errors:
> >  * gz_close: Unzip process killed by signal 11.
> >=20
> >  * pkg_get_installed_files: Error extracting file list from /tmp/opkg-T=
7G08e/fsogsmd-connman_0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528=
-r6.7_qemuarm.ipk.
> >  * opkg_install_cmd: Cannot install package task-shr-minimal-apps.
> >=20
> > Reverting this patch and rebuilding opkg before running image build hel=
ps.
> >=20
> > I'll try to upgrade only opkg without your patches first, but I guess i=
t's
> > because of fix_installorder.patch, can we teach it to break circular de=
pendencies
> > or should I fix it in metadata? It seem that longer cycles like
> >=20
> > fsogsmd-config -> fsogsmd-module-modem-ti-calypso -> fsogsmd -> fsogsmd=
-config
> >=20
> > does work.
>=20
> This is likely as a result of the installorder patch :/. Sadly if we
> want the postinstalls to be installed in order we do need that patch.

I've tried to build image with SRCREV=3D633 and it built image fine
then I tried to apply your patch but without installorder.patch to
confirm that the issue with circular depending packages is really cause
by that only and then try to fix installorder.patch to work even with
such packages, but I got many postinst errors :(.=20

=46rom your description I understood that postinst execution should be
almost the same only more logic is moved from rootfs_ipk.bbclass to opkg
itself.

| Collected errors:
|  * pkg_run_script: package "pam-plugin-unix" postinst script returned sta=
tus 1.
|  * opkg_configure: pam-plugin-unix.postinst returned 1.
|  * pkg_run_script: package "pango-module-basic-x" postinst script returne=
d status 1.
|  * opkg_configure: pango-module-basic-x.postinst returned 1.
|  * pkg_run_script: package "pango-module-basic-fc" postinst script return=
ed status 1.
|  * opkg_configure: pango-module-basic-fc.postinst returned 1.
|  * pkg_run_script: package "update-modules" postinst script returned stat=
us 1.
|  * opkg_configure: update-modules.postinst returned 1.
|  * pkg_run_script: package "gdk-pixbuf-loader-png" postinst script return=
ed status 1.
|  * opkg_configure: gdk-pixbuf-loader-png.postinst returned 1.
|  * pkg_run_script: package "gdk-pixbuf-loader-jpeg" postinst script retur=
ned status 1.
|  * opkg_configure: gdk-pixbuf-loader-jpeg.postinst returned 1.
|  * pkg_run_script: package "liberation-fonts" postinst script returned st=
atus 1.
|  * opkg_configure: liberation-fonts.postinst returned 1.
|  * pkg_run_script: package "gdk-pixbuf-loader-xpm" postinst script return=
ed status 1.
|  * opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1.
|  * pkg_run_script: package "gdk-pixbuf-loader-gif" postinst script return=
ed status 1.
|  * opkg_configure: gdk-pixbuf-loader-gif.postinst returned 1.
|  * pkg_run_script: package "ppp" postinst script returned status 1.
|  * opkg_configure: ppp.postinst returned 1.
|  * pkg_run_script: package "ttf-dejavu-common" postinst script returned s=
tatus 127.
|  * opkg_configure: ttf-dejavu-common.postinst returned 127.
|  * pkg_run_script: package "ttf-dejavu-sans" postinst script returned sta=
tus 127.
|  * opkg_configure: ttf-dejavu-sans.postinst returned 127.
|  * pkg_run_script: package "ffalarms" postinst script returned status 127.
|  * opkg_configure: ffalarms.postinst returned 127.
|  * pkg_run_script: package "rsyslog" postinst script returned status 1.
|  * opkg_configure: rsyslog.postinst returned 1.
|  * pkg_run_script: package "ttf-dejavu-sans-mono" postinst script returne=
d status 127.
|  * opkg_configure: ttf-dejavu-sans-mono.postinst returned 127.
|  * pkg_run_script: package "matchbox-keyboard-im" postinst script returne=
d status 1.
|  * opkg_configure: matchbox-keyboard-im.postinst returned 1.
|  * pkg_run_script: package "hicolor-icon-theme" postinst script returned =
status 1.
|  * opkg_configure: hicolor-icon-theme.postinst returned 1.
|  * pkg_run_script: packaERROR: Function 'do_rootfs' failed (see /OE/shr-c=
ore/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/shr-l
ite-image/2.0-r20/temp/log.do_rootfs.10063 for further information)
| ge "ttf-liberation-mono" postinst script returned status 127.
|  * opkg_configure: ttf-liberation-mono.postinst returned 127.
|  * pkg_run_script: package "gtk-immodule-xim" postinst script returned st=
atus 1.
|  * opkg_configure: gtk-immodule-xim.postinst returned 1.
|  * pkg_run_script: package "ca-certificates" postinst script returned sta=
tus 1.
|  * opkg_configure: ca-certificates.postinst returned 1.
NOTE: package shr-lite-image-2.0-r20: task do_rootfs: Failed
ERROR: Task 9 (/OE/shr-core/meta-smartphone/meta-shr/recipes-shr/images/shr=
-lite-image.bb, do_rootfs) failed with exit code '
1'

> The question is whether circular depends are something opkg should
> support or not? What's debian's behaviour in that regard?

Well, it did work before and from quick search it looks that such circular =
dependencies are=20
quite common in our metadata. So I agree that this patch is really needed t=
o fix dbus owner,
but in case there is circular dependency we shouldn't be so strict about or=
der of installs.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y/WcH0a6A93yCHGr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7sXukACgkQN1Ujt2V2gBzG0QCfQV5ZQS1udIDKdUte6bTTHUnh
MzcAoKwj8EndQHqeWqlm7k5NAGhJSFdN
=mq4P
-----END PGP SIGNATURE-----

--Y/WcH0a6A93yCHGr--
