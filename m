Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.4073.1632459064676944399
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 21:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LLOckIb+;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id r16so8378753qtw.11
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 21:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FN55ilam5kuCTdxY4UBMqr7YxPTjlE/ALB6+86Bxx3Q=;
        b=LLOckIb+T3KRMlF3qRl5h6sbI4kA/jmSHZhf4Whj96QKD6ar+vACBdvch8R9ukQGoI
         nufyzN8afKuFI9oi4Uw9RQ8KdmuKNbVxy+dRJQ3+3RUxJeVUxcubZShGGMDL8LTpKJ77
         CKK0wH1l6OKLt+biyDkC9h8XL/3SDrsZE12RNtFUHFD86HJT3lfxSygI+UJ2LSnfQ3Rs
         k+mP3TtO8IkuhYK0jVnWKHkm1KHNRMj/4KPAFgkBQovqhqzSVpQicTKz2GAHrwevx6Pa
         M1W3J+Y9jGECVjWHLJTCYPDGlfNaVsdP7pPYmK2elgV+8a7M1LKEVzf5+QR1kh/u2MxU
         suyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FN55ilam5kuCTdxY4UBMqr7YxPTjlE/ALB6+86Bxx3Q=;
        b=EfWrTmJQxTMP/UFTAzwpeLPcfWizsRkIhcWfq7+6KQT8oc3cn0UOtPZntYptiJ7Fva
         rq/2PK3bGxh/N5sdVHjeurU1k83WQwG2sEN4zdSOeRY4x5g+Myev7zHsA3o9gkiAEBxa
         HmpU2gX1KkQKUs923fYzFHhAyw0DEZfzTc1TUjjKf+d0AJ7cF1gS+xOGazo9otw5sWF/
         lpmiFTsJKCqFdX8AaJ5v9agouys8XmqURaDSdW9OCZ3RUj24YQe/NP0DofowH6ecVDSz
         8FeANN11jvXJM4aUQrzWr/7vL6OliJOoulfc679mu7YfoervdX9GMT2cRE8U3VNAWv2u
         afgA==
X-Gm-Message-State: AOAM530CYU3PoZfn81lzXULDX+Sj4+VnCK0WSQWO2OrSWkbZFhBEZPHs
	AMpvHHK1Yezj9+z9moRtaGfH+Ucm9c9NUujUlyA=
X-Google-Smtp-Source: ABdhPJzy9JhlIpJajLGm7mVJkY4lyfxE/OlX8alcDAQfuz2gu+3462Q7Vb7N2is33DL5BYwfTK/F5/1SGDnV+Agm/mU=
X-Received: by 2002:ac8:6893:: with SMTP id m19mr2328078qtq.116.1632459063754;
 Thu, 23 Sep 2021 21:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <20210920124621.1576702-10-richard.purdie@linuxfoundation.org> <c6c0603017b848fea5650c2a2273e66b@axis.com>
In-Reply-To: <c6c0603017b848fea5650c2a2273e66b@axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 23 Sep 2021 21:50:37 -0700
Message-ID: <CAMKF1sqeyw09suOzauHvqhMfieBedsKa-JH5Qe5H+M8R0cCbgg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 10/14] package_ipk/deb/rpm: Drop recursive do_build task dependencies
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 2:42 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 20 september 2021 14:46
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [RFC PATCH 10/14] package_ipk/deb/rpm: Drop recursive
> > do_build task dependencies
> >
> > This is a controversial change which removes the recursive dependencies
> > from the do_build target of packaging tasks of recipes.
> >
> > Currently this means when you "bitbake <image>" or "bitbake <recipe>",
> > the packaging tasks run for all packaging backends enabled for all recipes
> > in the dependency chain. The same therefore then applies to images.
> >
> > We don't actually need that, it is a convinience thing. Removing it
> > massively simplifies the task graph and causes much fewer tasks to execute
> > in many common scenarios. It also means less sstate is fetched for
> > example when building an image.
> >
> > This means when building a recipe all package formats would be built
> > but when building an image, only the format used by the image would be
> > generated. This should be an improvement in most cases but some CI systems
> > may need to be explict about what they're building.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/package_deb.bbclass | 5 +----
> >  meta/classes/package_ipk.bbclass | 4 +---
> >  meta/classes/package_rpm.bbclass | 4 +---
> >  3 files changed, 3 insertions(+), 10 deletions(-)
> >
> > diff --git a/meta/classes/package_deb.bbclass
> > b/meta/classes/package_deb.bbclass
> > index eca43e17876..77caaa55c8f 100644
> > --- a/meta/classes/package_deb.bbclass
> > +++ b/meta/classes/package_deb.bbclass
> > @@ -315,10 +315,7 @@ python do_package_write_deb () {
> >  do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
> >  do_package_write_deb[cleandirs] = "${PKGWRITEDIRDEB}"
> >  do_package_write_deb[depends] +=
> > "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'),
> > 'do_populate_sysroot')}"
> > -addtask package_write_deb after do_packagedata do_package
> > -
> > +addtask package_write_deb after do_packagedata do_package before do_build
> >
> >  PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
> >  PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
> > -
> > -do_build[recrdeptask] += "do_package_write_deb"
> > diff --git a/meta/classes/package_ipk.bbclass
> > b/meta/classes/package_ipk.bbclass
> > index c3b53854e8b..998e18ba6c1 100644
> > --- a/meta/classes/package_ipk.bbclass
> > +++ b/meta/classes/package_ipk.bbclass
> > @@ -274,9 +274,7 @@ python do_package_write_ipk () {
> >  do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
> >  do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
> >  do_package_write_ipk[depends] +=
> > "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'),
> > 'do_populate_sysroot')}"
> > -addtask package_write_ipk after do_packagedata do_package
> > +addtask package_write_ipk after do_packagedata do_package before do_build
> >
> >  PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
> >  PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
> > -
> > -do_build[recrdeptask] += "do_package_write_ipk"
> > diff --git a/meta/classes/package_rpm.bbclass
> > b/meta/classes/package_rpm.bbclass
> > index 88d861c0e75..60f8299d965 100644
> > --- a/meta/classes/package_rpm.bbclass
> > +++ b/meta/classes/package_rpm.bbclass
> > @@ -748,9 +748,7 @@ python do_package_write_rpm () {
> >  do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
> >  do_package_write_rpm[cleandirs] = "${PKGWRITEDIRRPM}"
> >  do_package_write_rpm[depends] +=
> > "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'),
> > 'do_populate_sysroot')}"
> > -addtask package_write_rpm after do_packagedata do_package
> > +addtask package_write_rpm after do_packagedata do_package before do_build
> >
> >  PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
> >  PACKAGEINDEXDEPS += "createrepo-c-native:do_populate_sysroot"
> > -
> > -do_build[recrdeptask] += "do_package_write_rpm"
> > --
> > 2.32.0
>
> I just wanted to give some positive feedback now that this has been
> integrated. This patch alone reduced the number of edges in the task
> graph by 50% for one of our typical products (from 127721 to 64785).
> That is pretty impressive!
>
> And to add to this, the later patch that removes the use of the meta
> class reduced the number of nodes in the task graph by 10% (from 17122
> to 15313). Also pretty impressive for such a small change.
>

this is quite encouraging, dont go by number of lines of change :)
btw. did you also try with other change which reduces native dependencies,

> //Peter
>
> 
>
