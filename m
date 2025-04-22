Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB90C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:38:06 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.41560.1745332677113758744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NYB1c7UZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5f720c717so643858085a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745332676; x=1745937476; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fJvHONZ6090p0sjQO0PbsuB5s8cVGaz0771EfN1vDzI=;
        b=NYB1c7UZOTyPY6sv1Pt1WLtmcXpob7K6yhw50XS4edOlFZ5yms4irZoQ7TU3rq0+BU
         bc3UrbV+9QJRVt8Y6oy+DSm3fSV+tXO4NHeIFj8cA7unbnCXrOY0CCboNBss0niH0HC5
         bty9oCdybpRTqqRGPJZg2anzHX35CCZM6EP2s7nZYJveMX3VifAJNkCZ+6UmBFYnzjtD
         8qii4Q05J2ojtTDJ7/0nu93DL1RnBmUQT+rPjPnJvq35yPbcbpMl60/xuvWT6EhjdFol
         FvNwXxu7VfkqZ/fBGjp53UTnBKrfTh2ANxRwGnDCkhd/2chnT8k/8SfQK6SQtdfS2Ft+
         UYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332676; x=1745937476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJvHONZ6090p0sjQO0PbsuB5s8cVGaz0771EfN1vDzI=;
        b=aJGu9ciFpG1nA10zXCDumyxH1pk18fOfVrOqxcNuTxd67J/U3pCo3zT+iSu3OapgiU
         ATaDhQaNcN8oimFHgJCCphQ6wWTLfNn1osZO/VD2THLsBRLSGZkZ+esRaM7TCTpciFJw
         bOexYpGMH1Sy//tzoSX4guXVp12tiDCaqoa6qeyl3DIYiNMmXU2jUDJD41FosBbn5aa/
         RJSUemohPu7stii3AuGxLWuTx6R1GsV9OzWehxXPGne2AXOPc5b84V+QI3QKfhCt/Bvz
         27bR49WntCS7oLhenFAdjbi741npYEDiv4pPK82tDcuo/dl6+6uOGwTYni17aoy9v6j6
         R3CA==
X-Gm-Message-State: AOJu0YzKFxRyBPQys/Bi04oRoRvgRqT35/sVxZ7ujdHPXPWK8awJbpiw
	LD+LqQW+BGUp/JsD2JTy2RDg6qakS7yjVfndNdp6LFRxz81tT0kLHOL3vxcUUxzE0uv+Cp/cC3B
	IwCzep9uQkBB+l/CWHzVR57WbZLs=
X-Gm-Gg: ASbGncsgyFf2P7DsFwPFpfqdRZDgf3HfkIwgoiUmOt3HisK/Q1xidEoUew8y6oKPrCu
	kQTfHylFNuYEWxSuwh4pOruxuSbx3DvWHJhjNEmlD3/ZZFXOX9/M2mn18lUQ/DjIURdi7l9dprD
	+XWHOTmyScsj4FZyC9/LsOoGv0p5Z3r/OSvUr/qtL7G0MgDBidp5c5KY8W
X-Google-Smtp-Source: AGHT+IHR+1cNntvTzvEk07gl7lfqrzePmMR1pBvr1kGj1iFhwbE5mQJVIhdOFXpoOn5nIsh8j13gfxV8+V8ZVWb7gvU=
X-Received: by 2002:a05:620a:29c8:b0:7c5:6b46:e1ee with SMTP id
 af79cd13be357-7c925737e7bmr2466549885a.4.1745332676068; Tue, 22 Apr 2025
 07:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250415130608.1804620-1-bst@pengutronix.de> <93208223-1610-45f6-92d5-dfbe60181211@pengutronix.de>
In-Reply-To: <93208223-1610-45f6-92d5-dfbe60181211@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Apr 2025 16:37:44 +0200
X-Gm-Features: ATxdqUFrskbAKBx2CzFOGiEL3amcrBky_lLmpEvlAyO2e2-P4r8yAFqm3zE-JeI
Message-ID: <CANNYZj_R5Ejuu3HgkdwFjq0wbxDewW9w=Jbbif+b=ONX+WCP0A@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH oe-core 1/4] initramfs-framework: make
 RDEPENDS/RRECOMMENDS base package-specific
To: bst@pengutronix.de
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215224

I wonder if there's a gap in testing somehow? Can you review
everything that mentions initramfs in meta/lib/oeqa/selftest/cases,
and see if it can be extended to cover this?

Alex

On Tue, 15 Apr 2025 at 15:11, Bastian Krause via
lists.openembedded.org <bst=pengutronix.de@lists.openembedded.org>
wrote:
>
> On 4/15/25 3:06 PM, Bastian Krause wrote:
> > initramfs-framework itself is a meta package. It cannot be referenced in
> > PACKAGE_INSTALL directly, so the RDEPENDS/RRECOMMENDS do not have an
> > effect. So turn them into directives for initramfs-framework-base
> > instead.
> >
> > Currently all users of initramfs-framework-* add
> > ${VIRTUAL-RUNTIME_base-utils} explicitly to PACKAGE_INSTALL. For
> > `PACKAGE_CLASSES = "package_rpm"`, a dependency for `/bin/sh` is added by
> > RPM's shebang detection further hiding this issue.
>
> Initially I stumbled upon this in a custom initramfs image with:
>
>    PACAKGE_INSTALL = "initramfs-framework-base"
>
> Having PACKAGE_CLASSES = "package_ipk", the initramfs did not contain a
> shell. With PACKAGE_CLASSES = "package_rpm" however, busybox appeared
> (unexpectedly) in the image.
>
> Checking the rpm package's dependencies:
>
>    $ rpm -qp build/tmp/deploy/rpm/noarch/initramfs-framework-base-1.0-r0.noarch.rpm --requires
>    warning: Found bdb_ro Packages database while attempting sqlite backend: using bdb_ro backend.
>    /bin/sh
>    rpmlib(CompressedFileNames) <= 3.0.4-1
>    rpmlib(FileDigests) <= 4.6.0-1
>    rpmlib(PayloadFilesHavePrefix) <= 4.0-1
>    rpmlib(PayloadIsZstd) <= 5.4.18-1
>
> The shebang in the initramfs-framework-base scripts is added as a
> dependency, pulling in busybox in my case.
>
> Now I'm wondering if that's expected. I'm surprised that switching the
> package manager results in additional dependencies getting pulled in.
>
> This seems to have caused issues before, e.g.:
>
>    https://git.yoctoproject.org/poky/commit/?id=bc5d66e793b0750e540e9dac4608b8eb9644590e
>
> Regards,
> Bastian
>
>
> >
> > Signed-off-by: Bastian Krause <bst@pengutronix.de>
> > ---
> >   meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> > index bb4984366d..184da4f39d 100644
> > --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> > +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> > @@ -1,8 +1,6 @@
> >   SUMMARY = "Modular initramfs system"
> >   LICENSE = "MIT"
> >   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> > -RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_base-utils}"
> > -RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
> >
> >
> >   inherit allarch
> > @@ -72,6 +70,7 @@ PACKAGES = "${PN}-base \
> >              "
> >
> >   FILES:${PN}-base = "/init /init.d/99-finish /dev"
> > +RDEPENDS:${PN}-base += "${VIRTUAL-RUNTIME_base-utils}"
> >
> >   # 99-finish in base depends on some other module which mounts
> >   # the rootfs, like 90-rootfs. To replace that default, use
> > @@ -79,7 +78,7 @@ FILES:${PN}-base = "/init /init.d/99-finish /dev"
> >   # initramfs recipe and install something else, or install
> >   # something that runs earlier (for example, a 89-my-rootfs)
> >   # and mounts the rootfs. Then 90-rootfs will proceed immediately.
> > -RRECOMMENDS:${PN}-base += "initramfs-module-rootfs"
> > +RRECOMMENDS:${PN}-base += "initramfs-module-rootfs ${VIRTUAL-RUNTIME_base-utils-syslog}"
> >
> >   SUMMARY:initramfs-module-exec = "initramfs support for easy execution of applications"
> >   RDEPENDS:initramfs-module-exec = "${PN}-base"
>
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214851): https://lists.openembedded.org/g/openembedded-core/message/214851
> Mute This Topic: https://lists.openembedded.org/mt/112275547/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

