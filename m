Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RbrVv-00080K-EU for openembedded-core@lists.openembedded.org;
	Sat, 17 Dec 2011 11:29:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBHAMAwJ027818;
	Sat, 17 Dec 2011 10:22:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26464-03; Sat, 17 Dec 2011 10:22:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBHAM0mT027812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 17 Dec 2011 10:22:01 GMT
Message-ID: <1324117321.4568.128.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 17 Dec 2011 10:22:01 +0000
In-Reply-To: <20111217092041.GF3997@jama.jama.net>
References: <1323983329.4568.63.camel@ted>
	<20111217011658.GE3997@jama.jama.net> <1324085548.4568.121.camel@ted>
	<20111217092041.GF3997@jama.jama.net>
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
X-List-Received-Date: Sat, 17 Dec 2011 10:29:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-12-17 at 10:20 +0100, Martin Jansa wrote:
> On Sat, Dec 17, 2011 at 01:32:28AM +0000, Richard Purdie wrote:
> > On Sat, 2011-12-17 at 02:16 +0100, Martin Jansa wrote:
> > > On Thu, Dec 15, 2011 at 09:08:49PM +0000, Richard Purdie wrote:
> > > > There is a major issue with opkg images at the moment as preinst
> > > > functions are not being executed before their dependencies are installed
> > > > and this is leading to corruption of images containing avahi/dbus in
> > > > particular.
> > > > 
> > > > There are various changes in upstream opkg in the last 8 revisions which
> > > > make changes in this area but sadly these aren't enough to get things
> > > > working for us. I've updated to the latest svn revision with this patch
> > > > since it makes sense to pull in those changes first and then supplement
> > > > them with the attached patches.
> > > > 
> > > > There is a full description of the patches in the patch headers but in
> > > > summary they:
> > > > 
> > > > a) Ensure preinst functions execute with their dependencies installed.
> > > >    This is a pretty invasive change as it changes the package install
> > > >    ordering in general.
> > > > b) Ensure opkg sets $D, not $PKG_ROOT which we don't use
> > > > c) Change opkg to allow execution of postinstall functions which fail
> > > >    resulting in execution on the target device as rootfs_ipk.bbclass
> > > >    currently does manually.
> > > > 
> > > > The remaining changes interface this with the rest of the OE build
> > > > infrastructure, adding in the option to tell opkg to run the preinst and
> > > > postinst functions, ensure the correct environment is present for the
> > > > postinst scripts and removing the now unneeded rootfs_ipk class code
> > > > which opkg now does itself.
> > > > 
> > > > [YOCTO #1711]
> > > 
> > > Hi,
> > > 
> > > today I got image build failing with this and it seems like some kind of
> > > circular dependency or something.
> > > 
> > > In fsogsmd_git.bb we have:
> > > PACKAGES =+ "${PN}-connman ${PN}-connman-dev ${PN}-connman-dbg"
> > > RDEPENDS_${PN} += "${PN}-connman"
> > > 
> > > and there is also fsogsmd-connman dependency on fsogsmd (because of shlibs),
> > > so it's really circular dependency between runtime packages and new opkg cannot
> > > deal with it.
> > > 
> > > Then in log.do_rootfs
> > > Installing fsogsmd (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528-r6.7) to root...
> > > Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/qemuarm/fsogsmd_0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528-r6.7_qemuarm.ipk.
> > > Installing fsogsmd-connman (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528-r6.7) to root...
> > > Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/qemuarm/fsogsmd-connman_0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528-r6.7_qemuarm.ipk.
> > > Installing fsogsmd (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528-r6.7) to root...
> > > Installing fsogsmd-connman (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528-r6.7) to root...
> > > and then this last 2 lines 1794/2 times
> > > Installing fsogsmd (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528-r6.7) to root...
> > > Installing fsogsmd-connman (1:0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528-r6.7) to root...
> > > Installing task-core-ssh-openssh (1.0-r0) to root...
> > > Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv5te/task-core-ssh-openssh_1.0-r0_armv5te.ipk.
> > > ...
> > > and in the end:
> > > ERROR: Function 'do_rootfs' failed (see /OE/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/shr-lite-image/2.0-r20/temp/log.do_rootfs.20387 for further information)
> > > Collected errors:
> > >  * gz_close: Unzip process killed by signal 11.
> > > 
> > >  * pkg_get_installed_files: Error extracting file list from /tmp/opkg-T7G08e/fsogsmd-connman_0.5.0+gitr20+96698077b6ccd5fc1222e0b2b9fc56d087c6c528-r6.7_qemuarm.ipk.
> > >  * opkg_install_cmd: Cannot install package task-shr-minimal-apps.
> > > 
> > > Reverting this patch and rebuilding opkg before running image build helps.
> > > 
> > > I'll try to upgrade only opkg without your patches first, but I guess it's
> > > because of fix_installorder.patch, can we teach it to break circular dependencies
> > > or should I fix it in metadata? It seem that longer cycles like
> > > 
> > > fsogsmd-config -> fsogsmd-module-modem-ti-calypso -> fsogsmd -> fsogsmd-config
> > > 
> > > does work.
> > 
> > This is likely as a result of the installorder patch :/. Sadly if we
> > want the postinstalls to be installed in order we do need that patch.
> 
> I've tried to build image with SRCREV=633 and it built image fine
> then I tried to apply your patch but without installorder.patch to
> confirm that the issue with circular depending packages is really cause
> by that only and then try to fix installorder.patch to work even with
> such packages, but I got many postinst errors :(. 
> 
> From your description I understood that postinst execution should be
> almost the same only more logic is moved from rootfs_ipk.bbclass to opkg
> itself.
> 
> | Collected errors:
> |  * pkg_run_script: package "pam-plugin-unix" postinst script returned status 1.
> |  * opkg_configure: pam-plugin-unix.postinst returned 1.
> |  * pkg_run_script: package "pango-module-basic-x" postinst script returned status 1.
> |  * opkg_configure: pango-module-basic-x.postinst returned 1.
> |  * pkg_run_script: package "pango-module-basic-fc" postinst script returned status 1.
> |  * opkg_configure: pango-module-basic-fc.postinst returned 1.
> |  * pkg_run_script: package "update-modules" postinst script returned status 1.
> |  * opkg_configure: update-modules.postinst returned 1.
> |  * pkg_run_script: package "gdk-pixbuf-loader-png" postinst script returned status 1.
> |  * opkg_configure: gdk-pixbuf-loader-png.postinst returned 1.
> |  * pkg_run_script: package "gdk-pixbuf-loader-jpeg" postinst script returned status 1.
> |  * opkg_configure: gdk-pixbuf-loader-jpeg.postinst returned 1.
> |  * pkg_run_script: package "liberation-fonts" postinst script returned status 1.
> |  * opkg_configure: liberation-fonts.postinst returned 1.
> |  * pkg_run_script: package "gdk-pixbuf-loader-xpm" postinst script returned status 1.
> |  * opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1.
> |  * pkg_run_script: package "gdk-pixbuf-loader-gif" postinst script returned status 1.
> |  * opkg_configure: gdk-pixbuf-loader-gif.postinst returned 1.
> |  * pkg_run_script: package "ppp" postinst script returned status 1.
> |  * opkg_configure: ppp.postinst returned 1.
> |  * pkg_run_script: package "ttf-dejavu-common" postinst script returned status 127.
> |  * opkg_configure: ttf-dejavu-common.postinst returned 127.
> |  * pkg_run_script: package "ttf-dejavu-sans" postinst script returned status 127.
> |  * opkg_configure: ttf-dejavu-sans.postinst returned 127.
> |  * pkg_run_script: package "ffalarms" postinst script returned status 127.
> |  * opkg_configure: ffalarms.postinst returned 127.
> |  * pkg_run_script: package "rsyslog" postinst script returned status 1.
> |  * opkg_configure: rsyslog.postinst returned 1.
> |  * pkg_run_script: package "ttf-dejavu-sans-mono" postinst script returned status 127.
> |  * opkg_configure: ttf-dejavu-sans-mono.postinst returned 127.
> |  * pkg_run_script: package "matchbox-keyboard-im" postinst script returned status 1.
> |  * opkg_configure: matchbox-keyboard-im.postinst returned 1.
> |  * pkg_run_script: package "hicolor-icon-theme" postinst script returned status 1.
> |  * opkg_configure: hicolor-icon-theme.postinst returned 1.
> |  * pkg_run_script: packaERROR: Function 'do_rootfs' failed (see /OE/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/shr-l
> ite-image/2.0-r20/temp/log.do_rootfs.10063 for further information)
> | ge "ttf-liberation-mono" postinst script returned status 127.
> |  * opkg_configure: ttf-liberation-mono.postinst returned 127.
> |  * pkg_run_script: package "gtk-immodule-xim" postinst script returned status 1.
> |  * opkg_configure: gtk-immodule-xim.postinst returned 1.
> |  * pkg_run_script: package "ca-certificates" postinst script returned status 1.
> |  * opkg_configure: ca-certificates.postinst returned 1.
> NOTE: package shr-lite-image-2.0-r20: task do_rootfs: Failed
> ERROR: Task 9 (/OE/shr-core/meta-smartphone/meta-shr/recipes-shr/images/shr-lite-image.bb, do_rootfs) failed with exit code '
> 1'

This looks like you don't have the offline_postinstall patch applied?

opkg revision 633 will not build correct metadata without the patches
included.

> > The question is whether circular depends are something opkg should
> > support or not? What's debian's behaviour in that regard?
> 
> Well, it did work before and from quick search it looks that such circular dependencies are 
> quite common in our metadata.

Do you have some examples? I couldn't find any in OE-Core?

>  So I agree that this patch is really needed to fix dbus owner,
> but in case there is circular dependency we shouldn't be so strict about order of installs.

So how you you handle A depends on B which depends on A and be strict
about dependency order?

Cheers,

Richard



