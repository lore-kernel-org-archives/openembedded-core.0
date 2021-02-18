Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.1545.1613615541085520795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 18:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=nxVvksO/;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: mcroce@linux.microsoft.com)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5F55520B6C40
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 18:32:20 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5F55520B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1613615540;
	bh=8nJsiyjj1QlckIc4CjhAo+wByfi6ljCrOFgSgMArYFw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nxVvksO/Lv3ICqZTfqLTcCVtwfMplTj80RVU65MHVpx7Zpwui1tcigDFW1foNcJ28
	 n2oViQPdxuMq+KjnIifucX22OCKFnqsK8gPkGBUvsvxJIzfi1EzPTJ+xd6erDIAbGf
	 BtOUREt2q1JAABCPFJroNpNW/QWw3OoYa6yW8LjQ=
Received: by mail-pl1-f182.google.com with SMTP id ba1so427135plb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 18:32:20 -0800 (PST)
X-Gm-Message-State: AOAM533KQMH40XIjVhotpdb6E0Jy+IaX3k1/GSeUc5MPVsC60/cMPlcD
	njUf2Zy2G33OOEbUUU1OtaMEDukwqRp2/5Wwn1w=
X-Google-Smtp-Source: ABdhPJxzM017YTQHdbYtzie1ovbNwFebETYSDJD7wfnlKG5bJUw2B8PXpA+gLQICWyHmLX0aktMJD+9li5ZKPLA9jEs=
X-Received: by 2002:a17:90a:4092:: with SMTP id l18mr1809350pjg.39.1613615539948;
 Wed, 17 Feb 2021 18:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20210208181747.44789-1-mcroce@linux.microsoft.com> <CADkTA4P-kS6UdgDmT9J=FtWGy0Tmu28RtDtXHOg0M_J8z41vAQ@mail.gmail.com>
In-Reply-To: <CADkTA4P-kS6UdgDmT9J=FtWGy0Tmu28RtDtXHOg0M_J8z41vAQ@mail.gmail.com>
From: "Matteo Croce" <mcroce@linux.microsoft.com>
Date: Thu, 18 Feb 2021 03:31:44 +0100
X-Gmail-Original-Message-ID: <CAFnufp1BS2mZxJ5TAu6bVX7h76_k2vrnbrLDj6o83UbOCb5M_w@mail.gmail.com>
Message-ID: <CAFnufp1BS2mZxJ5TAu6bVX7h76_k2vrnbrLDj6o83UbOCb5M_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-kernel: add libbpf
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 9:13 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Mon, Feb 8, 2021 at 1:18 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
> >
> > From: Matteo Croce <mcroce@microsoft.com>
> >
> > Add a recipe to build libbpf from https://github.com/libbpf/libbpf
> > The only patch fixes a build issue, and it's already merged upstream.
>
> Thanks for the submission! I have a few comments / questions.
>
> To get this into oe-core, we should be commenting / documenting why it
> should be in core, versus another layer. The standard criteria is that
> there are enough varied users and that the functionality is common
> enough, that it belongs in core.
>
> There should also be some sort of oe-selftest for the functionality,
> otherwise, it is hard to detect breakages. Some sort of application
> that uses the library and that can be executed in qemu would be
> enough.
>
> What are the kernel requirements ? CONFIG_BPF is selected by other
> kernel configs (it has no menu entry, so it must be), is it that, or
> something else that is the requirement (classic BFP?). If that option
> is now always on, is that true for the reference kernel versions in
> master (5.4 and 5.10).
>

Something like this will work? I see a similar trick in the uprobe recipe:

do_compile() {
 if grep -q "CONFIG_BPF_SYSCALL=y" ${STAGING_KERNEL_BUILDDIR}/.config
 then
  oe_runmake
 else
  bbnote "BFP syscall is not enabled"
 fi
}


> Finally, does this work across all the supported architectures ? if
> not, we'll need compatibility settings.
>

I'm adding this:

COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64).*-linux"

> >
> > Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> > ---
> >  ...01-install-don-t-preserve-file-owner.patch | 29 +++++++++++++++++++
> >  meta/recipes-kernel/libbpf/libbpf_0.3.bb      | 25 ++++++++++++++++
> >  2 files changed, 54 insertions(+)
> >  create mode 100644 meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch
> >  create mode 100644 meta/recipes-kernel/libbpf/libbpf_0.3.bb
> >
> > diff --git a/meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch b/meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch
> > new file mode 100644
> > index 0000000000..4e65d8d80a
> > --- /dev/null
> > +++ b/meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch
> > @@ -0,0 +1,29 @@
> > +From 7df10d91db6f533cc0f6c09f4ae8ad92918c6160 Mon Sep 17 00:00:00 2001
> > +From: Matteo Croce <mcroce@microsoft.com>
> > +Date: Tue, 26 Jan 2021 12:41:47 +0100
> > +Subject: [PATCH] install: don't preserve file owner
> > +
> > +'cp -p' preserve file ownership, this may leave files owned by the
> > +current in user in /lib .
> > +
>
> We need the upstream status documented here, not just in the commit message.
>

You want the upstream commit, or just saying that it will go into 0.4 is enough?

> > +Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> > +---
> > + Makefile | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index da33613..ab66edc 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -130,7 +130,7 @@ define do_s_install
> > +       $(Q)if [ ! -d '$(DESTDIR)$2' ]; then            \
> > +               $(INSTALL) -d -m 755 '$(DESTDIR)$2';    \
> > +       fi;
> > +-      $(Q)cp -fpR $1 '$(DESTDIR)$2'
> > ++      $(Q)cp -fR $1 '$(DESTDIR)$2'
> > + endef
> > +
> > + install: all install_headers install_pkgconfig
> > +--
> > +2.29.2
> > +
> > diff --git a/meta/recipes-kernel/libbpf/libbpf_0.3.bb b/meta/recipes-kernel/libbpf/libbpf_0.3.bb
> > new file mode 100644
> > index 0000000000..402e57257f
> > --- /dev/null
> > +++ b/meta/recipes-kernel/libbpf/libbpf_0.3.bb
> > @@ -0,0 +1,25 @@
> > +SUMMARY = "Library for BPF handling"
> > +DESCRIPTION = "Library for BPF handling"
> > +HOMEPAGE = "https://github.com/libbpf/libbpf"
> > +SECTION = "libs"
> > +LICENSE = "LGPLv2.1+"
> > +
> > +LIC_FILES_CHKSUM = "file://../LICENSE.LPGL-2.1;md5=b370887980db5dd40659b50909238dbd"
> > +
> > +DEPENDS = "zlib elfutils"
> > +
> > +SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https"
> > +SRCREV = "051a4009f94d5633a8f734ca4235f0a78ee90469"
> > +
> > +# Backported from version 0.4
> > +SRC_URI += "file://0001-install-don-t-preserve-file-owner.patch"
> > +
> > +S = "${WORKDIR}/git/src"
> > +
> > +inherit pkgconfig
>
> I see inherit pkgconfig, but no PACKAGECONFIG setting. Is it actually
> used here ?
>
> > +
> > +do_install() {
> > +       make install DESTDIR=${D} LIBDIR=${libdir}
>
> Rather than a bare 'make' call, this should likely be oe_runmake
>

Right.
While at it, what about adding DESTDIR and LIBDIR to ${EXTRA_OEMAKE}?
They are ignored in the build phase

> Bruce
>
> > +}
> > +
> > +BBCLASSEXTEND = "native"
> > --
> > 2.29.2
> >
> >
> > 
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

Regards,
-- 
per aspera ad upstream
