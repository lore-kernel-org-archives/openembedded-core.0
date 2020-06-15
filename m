Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.12682.1592207809849220182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 00:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 14A2540B96;
	Mon, 15 Jun 2020 07:56:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7UD1yfqQIFyl; Mon, 15 Jun 2020 07:56:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DB63740A2D;
	Mon, 15 Jun 2020 07:56:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2A79017320C; Mon, 15 Jun 2020 03:56:46 -0400 (EDT)
Date: Mon, 15 Jun 2020 03:56:46 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Arthur She <arthur.she@linaro.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] igt-gpu-tools: add new package
Message-ID: <20200615075646.GU17660@denix.org>
References: <20200615060025.171354-1-arthur.she@linaro.org>
 <CANNYZj9RLRjTgB-Qy4Rzx9iWN4PMGzay-XxgZGEei_HC8gEq=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9RLRjTgB-Qy4Rzx9iWN4PMGzay-XxgZGEei_HC8gEq=w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

https://lists.openembedded.org/g/openembedded-devel/topic/74775294

But I tend to agree.

-- 
Denys


On Mon, Jun 15, 2020 at 09:45:25AM +0200, Alexander Kanavin wrote:
> This should go to meta-oe, rather than core?
> 
> Alex
> 
> On Mon 15. Jun 2020 at 8.00, Arthur She <arthur.she@linaro.org> wrote:
> 
> > igt-gpu-tools is a collection of tools for development and testing of the
> > DRM
> > drivers. (https://gitlab.freedesktop.org/drm/igt-gpu-tools)
> > This recipe is originally copied from meta-intel and added the following
> > modifications
> > 1. Enable ARM architecture
> > 2. Enable igt-runner and Chamelium
> > 3. Build git HEAD code instead of a specific version
> > The original recipe in the meta-intel will be removed and replaced by
> > this one once it get merged.
> >
> > Signed-off-by: Arthur She <arthur.she@linaro.org>
> > ---
> >  .../igt-gpu-tools/igt-gpu-tools_git.bb        | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 meta/recipes-graphics/igt-gpu-tools/
> > igt-gpu-tools_git.bb
> >
> > diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > new file mode 100644
> > index 0000000000..dc9537c9e3
> > --- /dev/null
> > +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > @@ -0,0 +1,47 @@
> > +SUMMARY = "IGT GPU Tools"
> > +DESCRIPTION = "IGT GPU Tools is a collection of tools for development and
> > testing of the DRM drivers"
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=67bfee4df38fa6ecbe3a675c552d4c08"
> > +
> > +LICENSE = "MIT"
> > +
> > +inherit meson
> > +
> > +SRCREV = "d16ad07e7f2a028e14d61f570931c87fa5ce404c"
> > +PV = "1.25+git${SRCPV}"
> > +
> > +SRC_URI = "git://
> > gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod
> > openssl xmlrpc-c gsl elfutils alsa-lib json-c bison-native"
> > +RDEPENDS_${PN} += "bash"
> > +RDEPENDS_${PN}-tests += "bash"
> > +
> > +PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
> > +
> > +EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dchamelium=enabled"
> > +COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
> > +COMPATIBLE_HOST_libc-musl_class-target = "null"
> > +SECURITY_LDFLAGS = "${SECURITY_X_LDFLAGS}"
> > +
> > +gputools_sysroot_preprocess() {
> > +       rm -f ${SYSROOT_DESTDIR}${libdir}/pkgconfig/intel-gen4asm.pc
> > +}
> > +SYSROOT_PREPROCESS_FUNCS += "gputools_sysroot_preprocess"
> > +
> > +do_install_append() {
> > +    install -d ${D}/usr/share/${BPN}/scripts
> > +    install ${S}/scripts/run-tests.sh ${D}/usr/share/${BPN}/scripts
> > +    install -d ${D}/usr/share/${BPN}/runner
> > +    install -D ${B}/runner/igt_runner ${D}/usr/share/${BPN}/runner
> > +    install -D ${B}/runner/igt_resume ${D}/usr/share/${BPN}/runner
> > +}
> > +
> > +FILES_${PN}-benchmarks += "${libexecdir}/${BPN}/benchmarks"
> > +FILES_${PN}-tests += "\
> > +        ${libexecdir}/${BPN}/*\
> > +        ${datadir}/${BPN}/1080p-right.png\
> > +        ${datadir}/${BPN}/1080p-left.png\
> > +        ${datadir}/${BPN}/pass.png\
> > +        ${datadir}/${BPN}/test-list.txt"
> > --
> > 2.25.1
> >
> > 
> >

> 

