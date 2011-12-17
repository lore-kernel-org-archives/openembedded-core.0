Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RbsvL-0001sk-Uy for openembedded-core@lists.openembedded.org;
	Sat, 17 Dec 2011 12:59:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBHBqUxO028323;
	Sat, 17 Dec 2011 11:52:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26464-05; Sat, 17 Dec 2011 11:52:26 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBHBqO9v028317
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 17 Dec 2011 11:52:25 GMT
Message-ID: <1324122745.4568.136.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 17 Dec 2011 11:52:25 +0000
In-Reply-To: <20111217103429.GG3997@jama.jama.net>
References: <1323983329.4568.63.camel@ted>
	<20111217011658.GE3997@jama.jama.net> <1324085548.4568.121.camel@ted>
	<20111217092041.GF3997@jama.jama.net> <1324117321.4568.128.camel@ted>
	<20111217103429.GG3997@jama.jama.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Sat, 17 Dec 2011 11:59:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-12-17 at 11:34 +0100, Martin Jansa wrote:
> On Sat, Dec 17, 2011 at 10:22:01AM +0000, Richard Purdie wrote:
> > On Sat, 2011-12-17 at 10:20 +0100, Martin Jansa wrote:
> > > On Sat, Dec 17, 2011 at 01:32:28AM +0000, Richard Purdie wrote:
> > > I've tried to build image with SRCREV=633 and it built image fine
> > > then I tried to apply your patch but without installorder.patch to
> > > confirm that the issue with circular depending packages is really cause
> > > by that only and then try to fix installorder.patch to work even with
> > > such packages, but I got many postinst errors :(. 
> > > 
> > > From your description I understood that postinst execution should be
> > > almost the same only more logic is moved from rootfs_ipk.bbclass to opkg
> > > itself.
> > > 
> > > | Collected errors:
> > > |  * pkg_run_script: package "pam-plugin-unix" postinst script returned status 1.
> > > |  * opkg_configure: pam-plugin-unix.postinst returned 1.
> > > |  * pkg_run_script: package "pango-module-basic-x" postinst script returned status 1.
> > > |  * opkg_configure: pango-module-basic-x.postinst returned 1.
> > > |  * pkg_run_script: package "pango-module-basic-fc" postinst script returned status 1.
> > > |  * opkg_configure: pango-module-basic-fc.postinst returned 1.
> > > |  * pkg_run_script: package "update-modules" postinst script returned status 1.
> > > |  * opkg_configure: update-modules.postinst returned 1.
> > > |  * pkg_run_script: package "gdk-pixbuf-loader-png" postinst script returned status 1.
> > > |  * opkg_configure: gdk-pixbuf-loader-png.postinst returned 1.
> > > |  * pkg_run_script: package "gdk-pixbuf-loader-jpeg" postinst script returned status 1.
> > > |  * opkg_configure: gdk-pixbuf-loader-jpeg.postinst returned 1.
> > > |  * pkg_run_script: package "liberation-fonts" postinst script returned status 1.
> > > |  * opkg_configure: liberation-fonts.postinst returned 1.
> > > |  * pkg_run_script: package "gdk-pixbuf-loader-xpm" postinst script returned status 1.
> > > |  * opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1.
> > > |  * pkg_run_script: package "gdk-pixbuf-loader-gif" postinst script returned status 1.
> > > |  * opkg_configure: gdk-pixbuf-loader-gif.postinst returned 1.
> > > |  * pkg_run_script: package "ppp" postinst script returned status 1.
> > > |  * opkg_configure: ppp.postinst returned 1.
> > > |  * pkg_run_script: package "ttf-dejavu-common" postinst script returned status 127.
> > > |  * opkg_configure: ttf-dejavu-common.postinst returned 127.
> > > |  * pkg_run_script: package "ttf-dejavu-sans" postinst script returned status 127.
> > > |  * opkg_configure: ttf-dejavu-sans.postinst returned 127.
> > > |  * pkg_run_script: package "ffalarms" postinst script returned status 127.
> > > |  * opkg_configure: ffalarms.postinst returned 127.
> > > |  * pkg_run_script: package "rsyslog" postinst script returned status 1.
> > > |  * opkg_configure: rsyslog.postinst returned 1.
> > > |  * pkg_run_script: package "ttf-dejavu-sans-mono" postinst script returned status 127.
> > > |  * opkg_configure: ttf-dejavu-sans-mono.postinst returned 127.
> > > |  * pkg_run_script: package "matchbox-keyboard-im" postinst script returned status 1.
> > > |  * opkg_configure: matchbox-keyboard-im.postinst returned 1.
> > > |  * pkg_run_script: package "hicolor-icon-theme" postinst script returned status 1.
> > > |  * opkg_configure: hicolor-icon-theme.postinst returned 1.
> > > |  * pkg_run_script: packaERROR: Function 'do_rootfs' failed (see /OE/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/shr-l
> > > ite-image/2.0-r20/temp/log.do_rootfs.10063 for further information)
> > > | ge "ttf-liberation-mono" postinst script returned status 127.
> > > |  * opkg_configure: ttf-liberation-mono.postinst returned 127.
> > > |  * pkg_run_script: package "gtk-immodule-xim" postinst script returned status 1.
> > > |  * opkg_configure: gtk-immodule-xim.postinst returned 1.
> > > |  * pkg_run_script: package "ca-certificates" postinst script returned status 1.
> > > |  * opkg_configure: ca-certificates.postinst returned 1.
> > > NOTE: package shr-lite-image-2.0-r20: task do_rootfs: Failed
> > > ERROR: Task 9 (/OE/shr-core/meta-smartphone/meta-shr/recipes-shr/images/shr-lite-image.bb, do_rootfs) failed with exit code '
> > > 1'
> > 
> > This looks like you don't have the offline_postinstall patch applied?
> 
> I have

Please double check. That patch does things like:

Index: trunk/libopkg/pkg.c
===================================================================
--- trunk.orig/libopkg/pkg.c	2011-12-15 15:58:39.000000000 +0000
+++ trunk/libopkg/pkg.c	2011-12-15 20:04:50.109992736 +0000
@@ -1297,8 +1297,9 @@
      free(cmd);
 
      if (err) {
-	  opkg_msg(ERROR, "package \"%s\" %s script returned status %d.\n", 
-               pkg->name, script, err);
+          if (!conf->offline_root)
+	       opkg_msg(ERROR, "package \"%s\" %s script returned status %d.\n", 
+                    pkg->name, script, err);
 	  return err;
      }
 
and these are clearly showing up as ERRORs above. This means that:

a) offline_root isn't set (extremely unlikely for do_rootfs to work)
b) the patch isn't applied

> > opkg revision 633 will not build correct metadata without the patches
> > included.
> 
> Only patch not included in my opkg build was the installorder one.

I have my doubts about this, sorry...
 
> > > > The question is whether circular depends are something opkg should
> > > > support or not? What's debian's behaviour in that regard?
> > > 
> > > Well, it did work before and from quick search it looks that such circular dependencies are 
> > > quite common in our metadata.
> > 
> > Do you have some examples? I couldn't find any in OE-Core?
> 
> I'll try.
> 
> > >  So I agree that this patch is really needed to fix dbus owner,
> > > but in case there is circular dependency we shouldn't be so strict about order of installs.
> > 
> > So how you you handle A depends on B which depends on A and be strict
> > about dependency order?
> 
> The problem with dbus/base-passwd can be fixed by this patch, but for
> fsogsmd* modules the order is not so important, so I think that when there
> is circular dependency detected the order _shouldn't_ be so strict and
> maybe warning can be shown, but it shouldn't be fatal.

Looking at fsogsmd, that specific packages split doesn't really make
sense. fsogsmd depends on fsogsmd-connman and fsogsmd-connman depends on
fsogsmd. This means that both or neither can be installed but never
either of them singly so the split is just a waste of space.

I agree we need to improve that patch to detect loops but I'm not sure a
warning makes sense as we can't tell the difference between a case where
we don't care and a case where the resulting image is corrupt...

Cheers,

Richard




