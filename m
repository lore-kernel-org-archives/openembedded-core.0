Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RcQkn-0007ty-BT for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 01:06:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBINxqrC008617
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 23:59:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06963-07 for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 23:59:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBINxgZM008611
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 23:59:43 GMT
Message-ID: <1324252783.4568.159.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 18 Dec 2011 23:59:43 +0000
In-Reply-To: <201112181244.47897.schnitzeltony@gmx.de>
References: <1323983329.4568.63.camel@ted> <1324122745.4568.136.camel@ted>
	<20111218110042.GK3997@jama.jama.net>
	<201112181244.47897.schnitzeltony@gmx.de>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pBINxqrC008617
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
X-List-Received-Date: Mon, 19 Dec 2011 00:06:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2011-12-18 at 12:44 +0100, Andreas M=C3=BCller wrote:
> On Sunday, December 18, 2011 12:00:42 PM Martin Jansa wrote:
> > On Sat, Dec 17, 2011 at 11:52:25AM +0000, Richard Purdie wrote:
> > > On Sat, 2011-12-17 at 11:34 +0100, Martin Jansa wrote:
> > > > On Sat, Dec 17, 2011 at 10:22:01AM +0000, Richard Purdie wrote:
> > > > > On Sat, 2011-12-17 at 10:20 +0100, Martin Jansa wrote:
> > > > > > On Sat, Dec 17, 2011 at 01:32:28AM +0000, Richard Purdie wrot=
e:
> > > > > > I've tried to build image with SRCREV=3D633 and it built imag=
e fine
> > > > > > then I tried to apply your patch but without installorder.pat=
ch to
> > > > > > confirm that the issue with circular depending packages is re=
ally
> > > > > > cause by that only and then try to fix installorder.patch to =
work
> > > > > > even with such packages, but I got many postinst errors :(.
> > > > > >=20
> > > > > > From your description I understood that postinst execution sh=
ould
> > > > > > be almost the same only more logic is moved from
> > > > > > rootfs_ipk.bbclass to opkg itself.
> > > > > >=20
> > > > > > | Collected errors:
> > > > > > |  * pkg_run_script: package "pam-plugin-unix" postinst scrip=
t
> > > > > > |  returned status 1. * opkg_configure: pam-plugin-unix.posti=
nst
> > > > > > |  returned 1.
> > > > > > |  * pkg_run_script: package "pango-module-basic-x" postinst =
script
> > > > > > |  returned status 1. * opkg_configure:
> > > > > > |  pango-module-basic-x.postinst returned 1. * pkg_run_script=
:
> > > > > > |  package "pango-module-basic-fc" postinst script returned s=
tatus
> > > > > > |  1. * opkg_configure: pango-module-basic-fc.postinst return=
ed 1.
> > > > > > |  * pkg_run_script: package "update-modules" postinst script
> > > > > > |  returned status 1. * opkg_configure: update-modules.postin=
st
> > > > > > |  returned 1.
> > > > > > |  * pkg_run_script: package "gdk-pixbuf-loader-png" postinst
> > > > > > |  script returned status 1. * opkg_configure:
> > > > > > |  gdk-pixbuf-loader-png.postinst returned 1. * pkg_run_scrip=
t:
> > > > > > |  package "gdk-pixbuf-loader-jpeg" postinst script returned
> > > > > > |  status 1. * opkg_configure: gdk-pixbuf-loader-jpeg.postins=
t
> > > > > > |  returned 1. * pkg_run_script: package "liberation-fonts"
> > > > > > |  postinst script returned status 1. * opkg_configure:
> > > > > > |  liberation-fonts.postinst returned 1. * pkg_run_script: pa=
ckage
> > > > > > |  "gdk-pixbuf-loader-xpm" postinst script returned status 1.=
 *
> > > > > > |  opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1.=
 *
> > > > > > |  pkg_run_script: package "gdk-pixbuf-loader-gif" postinst s=
cript
> > > > > > |  returned status 1. * opkg_configure:
> > > > > > |  gdk-pixbuf-loader-gif.postinst returned 1. * pkg_run_scrip=
t:
> > > > > > |  package "ppp" postinst script returned status 1. *
> > > > > > |  opkg_configure: ppp.postinst returned 1.
> > > > > > |  * pkg_run_script: package "ttf-dejavu-common" postinst scr=
ipt
> > > > > > |  returned status 127. * opkg_configure:
> > > > > > |  ttf-dejavu-common.postinst returned 127. * pkg_run_script:
> > > > > > |  package "ttf-dejavu-sans" postinst script returned status =
127.
> > > > > > |  * opkg_configure: ttf-dejavu-sans.postinst returned 127. *
> > > > > > |  pkg_run_script: package "ffalarms" postinst script returne=
d
> > > > > > |  status 127. * opkg_configure: ffalarms.postinst returned 1=
27.
> > > > > > |  * pkg_run_script: package "rsyslog" postinst script return=
ed
> > > > > > |  status 1. * opkg_configure: rsyslog.postinst returned 1.
> > > > > > |  * pkg_run_script: package "ttf-dejavu-sans-mono" postinst =
script
> > > > > > |  returned status 127. * opkg_configure:
> > > > > > |  ttf-dejavu-sans-mono.postinst returned 127. * pkg_run_scri=
pt:
> > > > > > |  package "matchbox-keyboard-im" postinst script returned st=
atus
> > > > > > |  1. * opkg_configure: matchbox-keyboard-im.postinst returne=
d 1.
> > > > > > |  * pkg_run_script: package "hicolor-icon-theme" postinst sc=
ript
> > > > > > |  returned status 1. * opkg_configure:
> > > > > > |  hicolor-icon-theme.postinst returned 1. * pkg_run_script:
> > > > > > |  packaERROR: Function 'do_rootfs' failed (see
> > > > > > |  /OE/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/shr-=
l
> > > > > >=20
> > > > > > ite-image/2.0-r20/temp/log.do_rootfs.10063 for further inform=
ation)
> > > > > >=20
> > > > > > | ge "ttf-liberation-mono" postinst script returned status 12=
7.
> > > > > > |=20
> > > > > > |  * opkg_configure: ttf-liberation-mono.postinst returned 12=
7.
> > > > > > |  * pkg_run_script: package "gtk-immodule-xim" postinst scri=
pt
> > > > > > |  returned status 1. * opkg_configure: gtk-immodule-xim.post=
inst
> > > > > > |  returned 1. * pkg_run_script: package "ca-certificates"
> > > > > > |  postinst script returned status 1. * opkg_configure:
> > > > > > |  ca-certificates.postinst returned 1.
> > > > > >=20
> > > > > > NOTE: package shr-lite-image-2.0-r20: task do_rootfs: Failed
> > > > > > ERROR: Task 9
> > > > > > (/OE/shr-core/meta-smartphone/meta-shr/recipes-shr/images/shr=
-lite
> > > > > > -image.bb, do_rootfs) failed with exit code ' 1'
> > > > >=20
> > > > > This looks like you don't have the offline_postinstall patch ap=
plied?
> > > >=20
> > > > I have
> > >=20
> > > Please double check. That patch does things like:
> > >=20
> > > Index: trunk/libopkg/pkg.c
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > --- trunk.orig/libopkg/pkg.c	2011-12-15 15:58:39.000000000 +0000
> > > +++ trunk/libopkg/pkg.c	2011-12-15 20:04:50.109992736 +0000
> > > @@ -1297,8 +1297,9 @@
> > >=20
> > >       free(cmd);
> > >      =20
> > >       if (err) {
> > >=20
> > > -	  opkg_msg(ERROR, "package \"%s\" %s script returned status %d.\n=
",
> > > -               pkg->name, script, err);
> > > +          if (!conf->offline_root)
> > > +	       opkg_msg(ERROR, "package \"%s\" %s script returned status
> > > %d.\n", +                    pkg->name, script, err);
> > >=20
> > >  	  return err;
> > >  	 =20
> > >       }
> > >=20
> > > and these are clearly showing up as ERRORs above. This means that:
> > >=20
> > > a) offline_root isn't set (extremely unlikely for do_rootfs to work=
)
> > > b) the patch isn't applied
> > >=20
> > > > > opkg revision 633 will not build correct metadata without the p=
atches
> > > > > included.
> > > >=20
> > > > Only patch not included in my opkg build was the installorder one.
> > >=20
> > > I have my doubts about this, sorry...
> >=20
> > With runtime circular dependencies broken by RRECOMMENDS I managed to
> > build an image, but there is problem in target opkg
> >=20
> > $D is not empty anymore (it's set to /), so all postinst scripts are
> > executing the variant for do_rootfs not for target, e.g.
> >=20
> > Configuring opkg.
> > //var/lib/opkg/info/opkg.postinst: line 3: install: command not found
> > update-alternatives: Linking //usr/bin/opkg to /usr/bin/opkg-cl
> > Configuring kernel-module-fat.
> > //var/lib/opkg/info/kernel-module-fat.postinst: line 3:
> > arm-oe-linux-gnueabi-depmod: command not found
> >=20
> Apart from circular dependencies my experiences with this patch is:
>=20
> 1. dbus dir ownership: Most ownerships are correct now. Only /var/run/d=
bus is=20
> still root:root ( at angstrom with custom fs-perms ).

I think the volatile handling is different in angstrom so I'm not sure
quite what is at fault here...

> 2. First boot is VERY fast now. Not that I have a problem with being fa=
st - but=20
> I see many lines like
> | S98configure[77]: * pkg_run_script: package "update-modules" postinst=
 script=20
> returned status 1.
> | S98configure[77]: * opkg_configure: update-modules.postinst returned =
1.
> | S98configure[77]: * pkg_run_script: package "hicolor-icon-theme" post=
inst=20
> script returned status 1.
> | S98configure[77]: * opkg_configure: hicolor-icon-theme.postinst retur=
ned 1.
> | S98configure[77]: * pkg_run_script: package "pango-module-basic-x" po=
stinst=20
> script returned status 1.
> | S98configure[77]: * opkg_configure: pango-module-basic-x.postinst ret=
urned 1.
> Many (all?) of these packages do not extend postinst.
>=20
> 3. xfce gui I usually use is far from working (only mouse pointer that'=
s it)

I'm pretty sure these last two are the on device postinstalls not
working as Martin mentions. We should just remove the
offlineroot_varname patch as the easiest fix. I did this in the hope we
could kill off some of the variables in the bbclass files but it doesn't
look like such a good idea now :/. I'll remove that patch is nobody
objects.

Cheers,

Richard



