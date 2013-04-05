Received: from mail-qe0-f54.google.com ([209.85.128.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1UOEuT-0008RA-PD
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 00:15:06 +0200
Received: by mail-qe0-f54.google.com with SMTP id s14so2303925qeb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 14:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=4rKM9tXssuzCSzYaNWfKVxDx7SPECNSAEaKTJ7+HVyA=;
	b=W46HxYSdtW8jpQa3xHXzev0L9y0trr4RUQ+IIXJasmV5cw9OoHI4NptNjTii5ze6U+
	ukebQrLJ9pmeVRa4FChMCrVYW2XY03ovy5I4HVZUAArGInJSLdqWAovVWGrXv9VhLiff
	2kqV6deULe+P4Y6RSSd7EgcNntAaSAxx1BXNr5PNhDTm5cv4/Qy056XD7Bxd8JQkqGW+
	orv+Om2APbvkN0JsFyvcpxvo2Jp5/czx3ypURP6dtFYtUbYYKvzRIwWCfmrQSsXpVnoc
	q65PJMbKeEov/l/xc5Lxkk8zgol4xdSzR1JWVouToRN/fqv+sIkKdg2RPp1xfr/aIC8N
	Ys8g==
MIME-Version: 1.0
X-Received: by 10.49.3.134 with SMTP id c6mr11704000qec.41.1365199066653; Fri,
	05 Apr 2013 14:57:46 -0700 (PDT)
Received: by 10.49.36.41 with HTTP; Fri, 5 Apr 2013 14:57:46 -0700 (PDT)
In-Reply-To: <20130405212904.GH3191@jama>
References: <1365196380-1930-1-git-send-email-kirgene@gmail.com>
	<20130405212904.GH3191@jama>
Date: Sat, 6 Apr 2013 00:57:46 +0300
Message-ID: <CADV-EXG=s6tDsjDh4kSCMjvgBB5Dj1qYFHx41FpUhg4qtMV0UA@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: added python-systemd package generation.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 22:15:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

2013/4/6 Martin Jansa <martin.jansa@gmail.com>
>
> On Sat, Apr 06, 2013 at 12:13:00AM +0300, Yevhen Kyriukha wrote:
> > ---
> >  meta/recipes-core/systemd/systemd_199.bb |   21 +++++++++++++++++----
> >  1 file changed, 17 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
> > index ba1d133..2a3d351 100644
> > --- a/meta/recipes-core/systemd/systemd_199.bb
> > +++ b/meta/recipes-core/systemd/systemd_199.bb
> > @@ -10,12 +10,18 @@ PROVIDES = "udev"
> >
> >  PE = "1"
> >
> > -DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
> > +DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 python"
> >  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> >
> >  SECTION = "base/shell"
> >
> > -inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
> > +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d pythonnative python-dir
> > +
> > +# need to export these variables for python-config to work
> > +export BUILD_SYS
> > +export HOST_SYS
> > +export STAGING_INCDIR
> > +export STAGING_LIBDIR
> >
> >  SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
> >             file://touchscreen.rules \
> > @@ -63,9 +69,9 @@ EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
> >                   --disable-coredump \
> >                   --disable-introspection \
> >                   --disable-tcpwrap \
> > +                 --with-python \
> >                   --enable-split-usr \
> >                   --disable-microhttpd \
> > -                 --without-python \
> >                   --with-sysvrcnd-path=${sysconfdir} \
> >                   ac_cv_path_KILL=${base_bindir}/kill \
> >                 "
> > @@ -114,7 +120,7 @@ python populate_packages_prepend (){
> >  }
> >  PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
> >
> > -PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install"
> > +PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install python-${PN} python-${PN}-dbg python-${PN}-staticdev"
> >
> >  USERADD_PACKAGES = "${PN}"
> >  GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
> > @@ -124,6 +130,13 @@ FILES_${PN}-analyze = "${base_bindir}/systemd-analyze"
> >  FILES_${PN}-initramfs = "/init"
> >  RDEPENDS_${PN}-initramfs = "${PN}"
> >
> > +FILES_python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py* ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
> > +RDEPENDS_python-${PN} = "python-core"
> > +FILES_python-${PN}-staticdev = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.la"
> > +RDEPENDS_python-${PN} = "python-core"
> > +FILES_python-${PN}-dbg = "${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
> > +RDEPENDS_python-${PN} = "python-core"
>
> You have 3x RDEPENDS_python-${PN} (maybe you wanted -dbg and -staticdev,
> but those do not need python-core imho).
>
> It's more common to start with ${PN}, but maybe it makes sense with
> python- prefix if you think about it as python module not systemd
> package...
>
> > +
> >  FILES_${PN}-gui = "${bindir}/systemadm"
> >
> >  FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
> > --
> > 1.7.9.5
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


> You have 3x RDEPENDS_python-${PN} (maybe you wanted -dbg and -staticdev,
> but those do not need python-core imho).

Yes, I meant -dbg and -staticdev. I don't know what to write in
RDEPENDS for these packages.

> It's more common to start with ${PN}, but maybe it makes sense with
> python- prefix if you think about it as python module not systemd
> package...

It's python package that is an interface to some systemd functionality
therefore I named it "python-systemd".

I'll send new version of this patch as I found some missing rdepends.

Regards,
Yevhen


