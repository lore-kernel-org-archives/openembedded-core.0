Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3D08278312
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 07:00:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q132so8044979wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 00:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SyO1lyQA+RtmpJLAmOVEpJpe0XaylnnRw1nL0/+oIy8=;
	b=Si1C8wCHH0FoLV1hb+0DXRjOvI2Vav6ZBLwTyedNJGyI/XhEa23My9tpxLxC7CGaG+
	iPav6kayAJl1XbJZijV/XE60UqHB7a24kP6IvypW9YRmIgx6V10tIpmvm9dWJ+O/6l05
	dy933//CYGozNOuTY/Gj2Cxc/H9lMad/tUQb9Ub+LhBo+nMF9SoPCHew3jGGDczpxeoA
	5QWf1g2hJFx7kDej8nRBtwBRn++n9nfKfpYRkzoqPcGNO5aSTcshgEF9k2CIyKwV4G8P
	iyJupwy+G6WjrkfLQPbgkepcBZkovkFSKXbq1pO9XNxcMem7LfqWkJBaqI6Zmsqxfcrv
	c0jQ==
X-Gm-Message-State: AMCzsaWt7OjsUcnkQVbsG5nOcxQaEvW9OZVoiIohCSliDt+hIp2w2h0x
	f6lxL2yc4o4gi/ZVljB2zH3CaZ0u
X-Google-Smtp-Source: AOwi7QBtRmgS1DrPLVyzlk4J39th645jocNuVnekDDIQLbbQbO04RxDI4KFWp4Wqq+TZGM+NtFrmjw==
X-Received: by 10.80.157.199 with SMTP id l7mr20108664edk.170.1508310003898;
	Wed, 18 Oct 2017 00:00:03 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h16sm7193760edj.33.2017.10.18.00.00.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 Oct 2017 00:00:03 -0700 (PDT)
Message-ID: <1508310002.20275.6.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Oct 2017 08:00:02 +0100
In-Reply-To: <CAJTo0LY0hxvo2=2HaTHCJRyA9b9Y_V1SFBOFf0tAZaH2ySWTEg@mail.gmail.com>
References: <20171017165424.22887-1-thomas.perrot@tupi.fr>
	<CAJTo0LY0hxvo2=2HaTHCJRyA9b9Y_V1SFBOFf0tAZaH2ySWTEg@mail.gmail.com>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [meta][pyro][PATCH] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 18 Oct 2017 07:00:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-10-17 at 17:56 +0100, Burton, Ross wrote:
> Is this *only* for Pyro or should it be applied to master too?

I've posted backport requests from master to pyro recently which touch
similar locations. Can those be applied first please.

Namely...

> On 17 October 2017 at 17:54, Thomas Perrot <thomas.perrot@tupi.fr> wrote:
> 
> > - Bad image type replacement for aarch64
> > - Fix DTB path in fitimage.its
> > - Ignore fitImage type during the packaging of the initramfs
> > 
> > Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> > ---
> >  meta/classes/kernel-fitimage.bbclass | 6 +++++-
> >  meta/classes/kernel.bbclass          | 4 +++-
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> > fitimage.bbclass
> > index 2630b47316..abbc309b09 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -7,8 +7,11 @@ python __anonymous () {
> >          depends = "%s u-boot-mkimage-native dtc-native" % depends
> >          d.setVar("DEPENDS", depends)
> > 
> > -        if d.getVar("UBOOT_ARCH") == "x86":
> > +        uarch = d.getVar("UBOOT_ARCH")
> > +        if uarch == "x86":
> >              replacementtype = "bzImage"
> > +        elif uarch == "arm64":
> > +            replacementtype = "Image"
> >          else:
> >              replacementtype = "zImage"

here

> > 
> > @@ -351,6 +354,7 @@ fitimage_assemble() {
> >                                 DTB_PATH="arch/${ARCH}/boot/${DTB}"
> >                         fi
> > 
> > +                       DTB=$(echo "${DTB}" | tr '/' '_')
> >                         DTBS="${DTBS} ${DTB}"
> >                         fitimage_emit_section_dtb ${1} ${DTB}
> > ${DTB_PATH}
> >                 done

and here.

Cheers,
Andre'

> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index ce2cab65ae..a8b0d0a061 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -219,7 +219,9 @@ do_bundle_initramfs () {
> >                 # Backing up kernel image relies on its type(regular
> > file
> > or symbolic link)
> >                 tmp_path=""
> >                 for type in ${KERNEL_IMAGETYPES} ; do
> > -                       if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
> > +                       if [ "$type" == "fitImage" ] ; then
> > +                               continue
> > +                       elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
> >                                 linkpath=`readlink -n
> > ${KERNEL_OUTPUT_DIR}/$type`
> >                                 realpath=`readlink -fn
> > ${KERNEL_OUTPUT_DIR}/$type`
> >                                 mv -f $realpath $realpath.bak
> > --
> > 2.13.6
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 

