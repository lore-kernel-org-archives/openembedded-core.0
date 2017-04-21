Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5728B605BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 11:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id CBB8331E61D0;
	Fri, 21 Apr 2017 13:30:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id SOJk_Qbf4VT8; Fri, 21 Apr 2017 13:30:35 +0200 (CEST)
Received: from t510.zcs.saftware.de (p57A6179E.dip0.t-ipconnect.de
	[87.166.23.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id E42B731E56BC;
	Fri, 21 Apr 2017 13:30:34 +0200 (CEST)
Date: Fri, 21 Apr 2017 13:30:34 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: Andrea Adami <andrea.adami@gmail.com>
Message-ID: <20170421133034.59e68228@t510.zcs.saftware.de>
In-Reply-To: <CAAQYJAs_8am0azk+0_3MNvwrNU6WiX2_5HgH0ouwWdyK6F8rAA@mail.gmail.com>
References: <1492771191-4445-1-git-send-email-obi@opendreambox.org>
	<CAAQYJAs_8am0azk+0_3MNvwrNU6WiX2_5HgH0ouwWdyK6F8rAA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "kernel: Fix symlinks"
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
X-List-Received-Date: Fri, 21 Apr 2017 11:30:38 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Apr 2017 13:02:51 +0200
Andrea Adami <andrea.adami@gmail.com> wrote:

> On Fri, Apr 21, 2017 at 12:39 PM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
> > This reverts commit c7bc46b9bc29dd0953ab8d63b50fa105bb66892e.
> >
> > It broke dpkg's update-alternatives, which requires absolute paths.  
> 
> This is really uncommon.

Actually it's not. Try it on any Debian or Ubuntu system.

> I had already expressed my negative opinion about absolute paths for kernel [1].
> Personally, I had to patch the bootloader (kexecboot).
> 
> So please try some workaround instead of changing it back.

Well, there's no workaround. Other than opkg's update-alternatives, dpkg's maintains
an alternatives database in /etc/alternatives, so the symlink is going to point to
an absolute path outside of /boot anyway.

To fix your problem, kernel.bbclass should be changed to not use update-alternatives
at all. But it's definitely wrong to break the original u-a by using invalid command-
line arguments.

Regards,
Andreas


> Cheers
> Andrea
> 
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2014-July/093988.html
> 
> >
> > | update-alternatives: error: alternative path is not absolute as it should be
> >
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > ---
> >  meta/classes/kernel.bbclass             | 6 +++---
> >  meta/recipes-kernel/linux/linux-dtb.inc | 4 ++--
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 12a748d..8cf357f 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -49,11 +49,10 @@ python __anonymous () {
> >
> >      for type in types.split():
> >          typelower = type.lower()
> > -        imagedest = d.getVar('KERNEL_IMAGEDEST')
> >
> >          d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
> >
> > -        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
> > +        d.setVar('FILES_kernel-image-' + typelower, '/boot/' + type + '-${KERNEL_VERSION_NAME}')
> >
> >          d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower)
> >
> > @@ -61,8 +60,9 @@ python __anonymous () {
> >
> >          d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
> >
> > +        imagedest = d.getVar('KERNEL_IMAGEDEST')
> >          priority = d.getVar('KERNEL_PRIORITY')
> > -        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
> > +        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
> >          d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
> >
> >          postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
> > diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> > index 22e374f..41aad7c 100644
> > --- a/meta/recipes-kernel/linux/linux-dtb.inc
> > +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> > @@ -63,7 +63,7 @@ pkg_postinst_kernel-devicetree () {
> >                         DTB_EXT=${DTB##*.}
> >                         DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
> >                         DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> > -                       update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
> > +                       update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
> >                 done
> >         done
> >  }
> > @@ -76,7 +76,7 @@ pkg_postrm_kernel-devicetree () {
> >                         DTB_EXT=${DTB##*.}
> >                         DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
> >                         DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> > -                       update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
> > +                       update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
> >                 done
> >         done
> >  }
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core  


