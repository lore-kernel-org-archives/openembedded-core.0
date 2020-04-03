Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web10.667.1585933873797756306
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 10:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VHJXooBo;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id e138so5363085vsc.11
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 10:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0o96n+B4QwKx+CSF4eeuBO3S8sQ8z1yV4OXf9yFJ9gE=;
        b=VHJXooBoL2rcw59q83MFWIDwM5HYkPT3Q7Zz9HWzZD/iSiV9+CIQ5z3n21QTgpjwTQ
         erewCqK9wM0Ci/r9+oqa3kkSqPJlID+GWcSNUJGNFNb0MuwBcA6GmEpvsH+cJPVYi5YZ
         5n8Dua9SBBlX2aDjLvTMHZLUHiBLzrPRVpzELl342+UvzErpB0RiJTraNXKDvtwFgPNs
         hmT7jLgF8ef5ovDuxRgUUajW4e5FzyhaUkLjjKXwiLnLJSZDURCZkxJAvpSpUM2FfD37
         Y1RCOwuMAGIBhATvHX3LPmGQM3A/QMRIXjmf3bPg9tsdNskIyWK4o0UP0UOtRfJJqS9/
         F/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0o96n+B4QwKx+CSF4eeuBO3S8sQ8z1yV4OXf9yFJ9gE=;
        b=RIhoEdTxWhP+vo/2Cpr5iJ9g/9pIaTjzlWT11g9fGdY5nVTW4cTyrMvz5Izz2aorxR
         olb0F6PtUfZS+C8qyyxX3ZlOGm0t7+F3mv9ODlCqTrEGhz1WlozmCK1rFMntDJlBLO3I
         HMj7Bf8dBl7PgQx5pqVpMLqyRkw5fdJ6pXUi2wP1q9cIfX8oEWx4Oz1TlkQZlAlX4PA/
         NUxT8zmpuPPnESV+IvoTQvFREqP11YHCXxBeMcaC+U0IqLqucLzowewl32VcMSSRaB+E
         te7r8a7Q9yNg1YBhLtqTa83ffyWsIUzeTeOwQqXBsZrGnxlZtYA+DZP7unxZCmKqbY+y
         MEwQ==
X-Gm-Message-State: AGi0PuYkE/Y3C/W95PCN1QAEfYBDgHyqIhhJHUx6LUvzDdb2mGc1lCEN
	Ke4sA3/lm18mSdYUt2EZTUPc3wCAMLLZRczevTw=
X-Google-Smtp-Source: APiQypKzfjbzsZC/qcRi97wtxfhgK/pP5nODDFy/G41CzZt5IWNM+MHmj42dUsAybl9L4iP9f5LkgI9ywILf1ge+Jac=
X-Received: by 2002:a05:6102:1c8:: with SMTP id s8mr7060718vsq.11.1585933872709;
 Fri, 03 Apr 2020 10:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200330165105.7151-1-sno@netbsd.org> <CAJ86T=UzXroEiVQhD8TZOH6ia0bnGY+drtSZawtocvWOH7JsWQ@mail.gmail.com>
 <6603E84C-D054-4927-968B-1AFBFFCF129D@gmail.com>
In-Reply-To: <6603E84C-D054-4927-968B-1AFBFFCF129D@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 3 Apr 2020 10:11:04 -0700
Message-ID: <CAJ86T=VW2WxbxpKNvF4fSV6iPg6_NHPtSu6kKAY37XRZ_m_c8Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] initscripts/init-system-helpers: fix mountnfs.sh dependency
To: Jens Rehsack <rehsack@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 3, 2020 at 8:57 AM Jens Rehsack <rehsack@gmail.com> wrote:
> > Am 30.03.2020 um 19:19 schrieb Andre McCurdy <armccurdy@gmail.com>:
> > On Mon, Mar 30, 2020 at 9:51 AM Jens Rehsack <rehsack@gmail.com> wrote:
> >>
> >> With commit c9fc9110be33fe0f24bc3a7c242b584a4ca33e04
> >>    Author: Yue Tao <Yue.Tao@windriver.com>
> >>    Date:   Fri May 25 10:48:08 2018 +0800
> >>
> >>        initscripts: Avoid starting rpcbind daemon twice
> >>
> >>        Check the status before start it to avoid duplicates.
> >>
> >> the use of a script {/usr/sbin/}service is introduced - maybe earlier
> >> provided by systemd, nowadays mostly by init-system-helpers from
> >> debian project.
> >>
> >> For the very first shot, maybe discussions and improvements based
> >> on that script collection, use just the init-system-helpers-service
> >> in initscripts/mountnfs.sh to avoid problems mounting NFS in later
> >> boot stage.
> >>
> >> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> >> ---
> >> .../initscripts/init-system-helpers_1.57.bb   | 52 +++++++++++++++++++
> >> .../initscripts/initscripts_1.0.bb            |  1 +
> >> 2 files changed, 53 insertions(+)
> >> create mode 100644 meta/recipes-core/initscripts/init-system-helpers_1.57.bb
> >>
> >> diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.57.bb b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
> >> new file mode 100644
> >> index 0000000000..2b09983483
> >> --- /dev/null
> >> +++ b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
> >> @@ -0,0 +1,52 @@
> >> +# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
> >> +# Released under the MIT license (see COPYING.MIT for the terms)
> >
> > Is this really necessary?
>
> Nope. It's a default preambel, vim adds :)
>
> >> +SUMMARY = "helper tools for all init systems"
> >> +DESCRIPTION = "This package contains helper tools that are necessary for switching between \
> >> +the various init systems that Debian contains (e. g. sysvinit or \
> >> +systemd). An example is deb-systemd-helper, a script that enables systemd unit \
> >> +files without depending on a running systemd. \
> >> +\
> >> +It also includes the \"service\", \"invoke-rc.d\", and \"update-rc.d\" scripts which \
> >> +provide an abstraction for enabling, disabling, starting, and stopping \
> >> +services for all supported Debian init systems as specified by the policy. \
> >> +\
> >> +While this package is maintained by pkg-systemd-maintainers, it is NOT \
> >> +specific to systemd at all. Maintainers of other init systems are welcome to \
> >> +include their helpers in this package."
> >> +HOMEPAGE = "https://salsa.debian.org/debian/init-system-helpers"
> >> +SECTION = "base"
> >> +LICENSE = "BSD-3-clause & GPLv2"
> >> +LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
> >> +
> >> +PACKAGES += "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
> >
> > According to the OE style guide, PACKAGES should go near the end of
> > the recipe (after do_install, before FILES_${PN}).
>
> *shrug*
> I see that neither initscripts nor busybox following this guide - so I don't know.

Yeah, most people don't care about variable ordering and maintainers
don't do anything to enforce it so this comment was mainly FYI.

> >> +DEPENDS = "perl"
> >
> > Since this recipe doesn't do anything in do_configure or do_compile
> > it's odd that it needs a build time dependency on perl?
>
> As debian/control says so.
>
> And maybe little time later someone wants to do something with
> update-rc.d or one of the systemd helpers as debian does.
> Or one likes to add man-pages (pod2man)?
>
> It's not that wrong.

Unnecessary build time dependencies can cause increased build times
(either due to building dependencies which otherwise would not have
been needed or limiting the scope the build scheduler has for
parallelization). Maybe not in this case since there's a run time
dependency on perl too, but in general adding unnecessary dependencies
just looks bad - as if you don't really understand the concept. Adding
a dependency now because it might be needed in the future isn't a good
justification either.

> >> +SRCREV = "760c625ec0e1ffebec2e391d891d389da0f65726"
> >> +SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git"
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +do_configure() {
> >> +       :
> >> +}
> >> +
> >> +do_compile() {
> >> +       :
> >> +}
> >> +
> >> +do_install() {
> >> +       install -d -m 0755 ${D}${sbindir}
> >> +       install -m 0755 ${S}/script/invoke-rc.d ${D}${sbindir}
> >> +       install -m 0755 ${S}/script/service ${D}${sbindir}
> >> +       install -m 0755 ${S}/script/update-rc.d ${D}${sbindir}
> >> +}
> >> +
> >> +FILES_${PN} = ""
> >
> > If you want the default package to be empty then you probably need to add:
> >
> >  ALLOW_EMPTY_${PN} = "1"
>
> Yeah - wanted to add that but fall through ...
>
> >> +FILES_${PN}-invoke-rc.d = "${sbindir}/invoke-rc.d"
> >> +FILES_${PN}-service = "${sbindir}/service"
> >> +FILES_${PN}-update-rc.d = "${sbindir}/update-rc.d"
> >> +
> >> +RDEPENDS_${PN}-update-rc.d = "perl"
> >> +RRECOMMENDS_${PN} += "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
> >> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> >> index 1a59b82fbf..4080c4a495 100644
> >> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> >> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> >> @@ -50,6 +50,7 @@ PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','
> >> PACKAGES =+ "${PN}-functions ${PN}-sushell"
> >> RDEPENDS_${PN} = "initd-functions \
> >>                   ${@bb.utils.contains('DISTRO_FEATURES','selinux','${PN}-sushell','',d)} \
> >> +                  init-system-helpers-service \
> >>                 "
> >> # Recommend pn-functions so that it will be a preferred default provider for initd-functions
> >> RRECOMMENDS_${PN} = "${PN}-functions"
> >> --
> >> 2.17.1
> >>
> >> 
>
> --
> Jens Rehsack - rehsack@gmail.com
>
