Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RcFGv-0003X7-KB
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 12:51:17 +0100
Received: (qmail invoked by alias); 18 Dec 2011 11:44:15 -0000
Received: from p4FDF03DA.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.218]
	by mail.gmx.net (mp024) with SMTP; 18 Dec 2011 12:44:15 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+/CN19erC/LLD6ASdrZDEoAHVUZq0MSy2jall+Yi
	tadtwgqpT7e2Ib
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Sun, 18 Dec 2011 12:44:47 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1323983329.4568.63.camel@ted> <1324122745.4568.136.camel@ted>
	<20111218110042.GK3997@jama.jama.net>
In-Reply-To: <20111218110042.GK3997@jama.jama.net>
MIME-Version: 1.0
Message-Id: <201112181244.47897.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
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
X-List-Received-Date: Sun, 18 Dec 2011 11:51:18 -0000
Content-Type: Text/Plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit

On Sunday, December 18, 2011 12:00:42 PM Martin Jansa wrote:
> On Sat, Dec 17, 2011 at 11:52:25AM +0000, Richard Purdie wrote:
> > On Sat, 2011-12-17 at 11:34 +0100, Martin Jansa wrote:
> > > On Sat, Dec 17, 2011 at 10:22:01AM +0000, Richard Purdie wrote:
> > > > On Sat, 2011-12-17 at 10:20 +0100, Martin Jansa wrote:
> > > > > On Sat, Dec 17, 2011 at 01:32:28AM +0000, Richard Purdie wrote:
> > > > > I've tried to build image with SRCREV=633 and it built image fine
> > > > > then I tried to apply your patch but without installorder.patch to
> > > > > confirm that the issue with circular depending packages is really
> > > > > cause by that only and then try to fix installorder.patch to work
> > > > > even with such packages, but I got many postinst errors :(.
> > > > > 
> > > > > From your description I understood that postinst execution should
> > > > > be almost the same only more logic is moved from
> > > > > rootfs_ipk.bbclass to opkg itself.
> > > > > 
> > > > > | Collected errors:
> > > > > |  * pkg_run_script: package "pam-plugin-unix" postinst script
> > > > > |  returned status 1. * opkg_configure: pam-plugin-unix.postinst
> > > > > |  returned 1.
> > > > > |  * pkg_run_script: package "pango-module-basic-x" postinst script
> > > > > |  returned status 1. * opkg_configure:
> > > > > |  pango-module-basic-x.postinst returned 1. * pkg_run_script:
> > > > > |  package "pango-module-basic-fc" postinst script returned status
> > > > > |  1. * opkg_configure: pango-module-basic-fc.postinst returned 1.
> > > > > |  * pkg_run_script: package "update-modules" postinst script
> > > > > |  returned status 1. * opkg_configure: update-modules.postinst
> > > > > |  returned 1.
> > > > > |  * pkg_run_script: package "gdk-pixbuf-loader-png" postinst
> > > > > |  script returned status 1. * opkg_configure:
> > > > > |  gdk-pixbuf-loader-png.postinst returned 1. * pkg_run_script:
> > > > > |  package "gdk-pixbuf-loader-jpeg" postinst script returned
> > > > > |  status 1. * opkg_configure: gdk-pixbuf-loader-jpeg.postinst
> > > > > |  returned 1. * pkg_run_script: package "liberation-fonts"
> > > > > |  postinst script returned status 1. * opkg_configure:
> > > > > |  liberation-fonts.postinst returned 1. * pkg_run_script: package
> > > > > |  "gdk-pixbuf-loader-xpm" postinst script returned status 1. *
> > > > > |  opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1. *
> > > > > |  pkg_run_script: package "gdk-pixbuf-loader-gif" postinst script
> > > > > |  returned status 1. * opkg_configure:
> > > > > |  gdk-pixbuf-loader-gif.postinst returned 1. * pkg_run_script:
> > > > > |  package "ppp" postinst script returned status 1. *
> > > > > |  opkg_configure: ppp.postinst returned 1.
> > > > > |  * pkg_run_script: package "ttf-dejavu-common" postinst script
> > > > > |  returned status 127. * opkg_configure:
> > > > > |  ttf-dejavu-common.postinst returned 127. * pkg_run_script:
> > > > > |  package "ttf-dejavu-sans" postinst script returned status 127.
> > > > > |  * opkg_configure: ttf-dejavu-sans.postinst returned 127. *
> > > > > |  pkg_run_script: package "ffalarms" postinst script returned
> > > > > |  status 127. * opkg_configure: ffalarms.postinst returned 127.
> > > > > |  * pkg_run_script: package "rsyslog" postinst script returned
> > > > > |  status 1. * opkg_configure: rsyslog.postinst returned 1.
> > > > > |  * pkg_run_script: package "ttf-dejavu-sans-mono" postinst script
> > > > > |  returned status 127. * opkg_configure:
> > > > > |  ttf-dejavu-sans-mono.postinst returned 127. * pkg_run_script:
> > > > > |  package "matchbox-keyboard-im" postinst script returned status
> > > > > |  1. * opkg_configure: matchbox-keyboard-im.postinst returned 1.
> > > > > |  * pkg_run_script: package "hicolor-icon-theme" postinst script
> > > > > |  returned status 1. * opkg_configure:
> > > > > |  hicolor-icon-theme.postinst returned 1. * pkg_run_script:
> > > > > |  packaERROR: Function 'do_rootfs' failed (see
> > > > > |  /OE/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/shr-l
> > > > > 
> > > > > ite-image/2.0-r20/temp/log.do_rootfs.10063 for further information)
> > > > > 
> > > > > | ge "ttf-liberation-mono" postinst script returned status 127.
> > > > > | 
> > > > > |  * opkg_configure: ttf-liberation-mono.postinst returned 127.
> > > > > |  * pkg_run_script: package "gtk-immodule-xim" postinst script
> > > > > |  returned status 1. * opkg_configure: gtk-immodule-xim.postinst
> > > > > |  returned 1. * pkg_run_script: package "ca-certificates"
> > > > > |  postinst script returned status 1. * opkg_configure:
> > > > > |  ca-certificates.postinst returned 1.
> > > > > 
> > > > > NOTE: package shr-lite-image-2.0-r20: task do_rootfs: Failed
> > > > > ERROR: Task 9
> > > > > (/OE/shr-core/meta-smartphone/meta-shr/recipes-shr/images/shr-lite
> > > > > -image.bb, do_rootfs) failed with exit code ' 1'
> > > > 
> > > > This looks like you don't have the offline_postinstall patch applied?
> > > 
> > > I have
> > 
> > Please double check. That patch does things like:
> > 
> > Index: trunk/libopkg/pkg.c
> > ===================================================================
> > --- trunk.orig/libopkg/pkg.c	2011-12-15 15:58:39.000000000 +0000
> > +++ trunk/libopkg/pkg.c	2011-12-15 20:04:50.109992736 +0000
> > @@ -1297,8 +1297,9 @@
> > 
> >       free(cmd);
> >       
> >       if (err) {
> > 
> > -	  opkg_msg(ERROR, "package \"%s\" %s script returned status %d.\n",
> > -               pkg->name, script, err);
> > +          if (!conf->offline_root)
> > +	       opkg_msg(ERROR, "package \"%s\" %s script returned status
> > %d.\n", +                    pkg->name, script, err);
> > 
> >  	  return err;
> >  	  
> >       }
> > 
> > and these are clearly showing up as ERRORs above. This means that:
> > 
> > a) offline_root isn't set (extremely unlikely for do_rootfs to work)
> > b) the patch isn't applied
> > 
> > > > opkg revision 633 will not build correct metadata without the patches
> > > > included.
> > > 
> > > Only patch not included in my opkg build was the installorder one.
> > 
> > I have my doubts about this, sorry...
> 
> With runtime circular dependencies broken by RRECOMMENDS I managed to
> build an image, but there is problem in target opkg
> 
> $D is not empty anymore (it's set to /), so all postinst scripts are
> executing the variant for do_rootfs not for target, e.g.
> 
> Configuring opkg.
> //var/lib/opkg/info/opkg.postinst: line 3: install: command not found
> update-alternatives: Linking //usr/bin/opkg to /usr/bin/opkg-cl
> Configuring kernel-module-fat.
> //var/lib/opkg/info/kernel-module-fat.postinst: line 3:
> arm-oe-linux-gnueabi-depmod: command not found
> 
Apart from circular dependencies my experiences with this patch is:

1. dbus dir ownership: Most ownerships are correct now. Only /var/run/dbus is 
still root:root ( at angstrom with custom fs-perms ).

2. First boot is VERY fast now. Not that I have a problem with being fast - but 
I see many lines like
| S98configure[77]: * pkg_run_script: package "update-modules" postinst script 
returned status 1.
| S98configure[77]: * opkg_configure: update-modules.postinst returned 1.
| S98configure[77]: * pkg_run_script: package "hicolor-icon-theme" postinst 
script returned status 1.
| S98configure[77]: * opkg_configure: hicolor-icon-theme.postinst returned 1.
| S98configure[77]: * pkg_run_script: package "pango-module-basic-x" postinst 
script returned status 1.
| S98configure[77]: * opkg_configure: pango-module-basic-x.postinst returned 1.
Many (all?) of these packages do not extend postinst.

3. xfce gui I usually use is far from working (only mouse pointer that's it)

Andreas



