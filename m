Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.47.1632434291188491343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 14:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QYOSKAU7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id t8so21356124wrq.4
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 14:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=UKZjDN4TwYdtZzOj/sGHzyVa5dAGNWXgGc/lIW6FXu4=;
        b=QYOSKAU7UgipwljleaIQ1jKnG6n1JTLwphADePoqvCtt4Kp5O/BUAxZzQ3/f/LGkfP
         0TRETHX9ORrwPCCZpyQqDWW5KmYnBvSgAmn1OfJpaWjttWVVTOMhnw71NUm1+Bx8erbl
         TMrGhWQRwc2w2WJxCZXGsMn72toIiv41kKeAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UKZjDN4TwYdtZzOj/sGHzyVa5dAGNWXgGc/lIW6FXu4=;
        b=JDh+DqeRcRS3Rfqw6bD22y/6rgvt1SUsBqW0PH3HLHm33XINzZteSiBle+FkAlhjvO
         OSlRR4nNNV6iS0McDjxq9+oUXBvQFt7wXNUd5NVBfa1tVbvyJrPY93a3ioQg0cQZdPWi
         JSg1uKlllwuMGjNR7UQZhJ2CoeOJop8Jz1s8YaU0bPYWGXJw2BIyszW7m8sBt73LOeSu
         Q3Vy+0uW4Wld8z+Ke5x3YN7W6+9SlOpz8RhKb9DWENqkhA2IcVXPfoXV2rMWwNdAa2i2
         VcurT724wEckQ3ZguxmDtog5DIfYVuCF89G8WcABm4sytPtnt9WmYIpWUP8dj8XaTy4Z
         NpdQ==
X-Gm-Message-State: AOAM531kpgd2AI9hv3BoZKKeqnhnKoxjYUf9k1uVJw5Y6i9bRD5ITuN6
	Zd2Km4w9UAaVJ2A+WUz4W8EvbA==
X-Google-Smtp-Source: ABdhPJzl8ViMllbl2Y4GiQ2n/1V83NSr0/EEJK91pKX45gD7RggPqRMrLj0qKcpGHJzuSDMrjxhH0Q==
X-Received: by 2002:adf:ee49:: with SMTP id w9mr7689345wro.158.1632434289654;
        Thu, 23 Sep 2021 14:58:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:88ae:54fd:dbd9:15ba? ([2001:8b0:aba:5f3c:88ae:54fd:dbd9:15ba])
        by smtp.gmail.com with ESMTPSA id g2sm6891780wrb.20.2021.09.23.14.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 14:58:09 -0700 (PDT)
Message-ID: <82cd41b2329ae850dd79b04c69d8b64daa337590.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 10/14] package_ipk/deb/rpm: Drop recursive do_build task dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Sep 2021 22:58:08 +0100
In-Reply-To: <c6c0603017b848fea5650c2a2273e66b@axis.com>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
	 <20210920124621.1576702-10-richard.purdie@linuxfoundation.org>
	 <c6c0603017b848fea5650c2a2273e66b@axis.com>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-09-23 at 21:41 +0000, Peter Kjellerstedt wrote:
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
> >  meta/classes/package_deb.bbclass | 5 +----
> >  meta/classes/package_ipk.bbclass | 4 +---
> >  meta/classes/package_rpm.bbclass | 4 +---
> >  3 files changed, 3 insertions(+), 10 deletions(-)
> > 
> > diff --git a/meta/classes/package_deb.bbclass
> > b/meta/classes/package_deb.bbclass
> > index eca43e17876..77caaa55c8f 100644
> > --- a/meta/classes/package_deb.bbclass
> > +++ b/meta/classes/package_deb.bbclass
> > @@ -315,10 +315,7 @@ python do_package_write_deb () {
> >  do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
> >  do_package_write_deb[cleandirs] = "${PKGWRITEDIRDEB}"
> >  do_package_write_deb[depends] +=
> > "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'),
> > 'do_populate_sysroot')}"
> > -addtask package_write_deb after do_packagedata do_package
> > -
> > +addtask package_write_deb after do_packagedata do_package before do_build
> > 
> >  PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
> >  PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
> > -
> > -do_build[recrdeptask] += "do_package_write_deb"
> > diff --git a/meta/classes/package_ipk.bbclass
> > b/meta/classes/package_ipk.bbclass
> > index c3b53854e8b..998e18ba6c1 100644
> > --- a/meta/classes/package_ipk.bbclass
> > +++ b/meta/classes/package_ipk.bbclass
> > @@ -274,9 +274,7 @@ python do_package_write_ipk () {
> >  do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
> >  do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
> >  do_package_write_ipk[depends] +=
> > "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'),
> > 'do_populate_sysroot')}"
> > -addtask package_write_ipk after do_packagedata do_package
> > +addtask package_write_ipk after do_packagedata do_package before do_build
> > 
> >  PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
> >  PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
> > -
> > -do_build[recrdeptask] += "do_package_write_ipk"
> > diff --git a/meta/classes/package_rpm.bbclass
> > b/meta/classes/package_rpm.bbclass
> > index 88d861c0e75..60f8299d965 100644
> > --- a/meta/classes/package_rpm.bbclass
> > +++ b/meta/classes/package_rpm.bbclass
> > @@ -748,9 +748,7 @@ python do_package_write_rpm () {
> >  do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
> >  do_package_write_rpm[cleandirs] = "${PKGWRITEDIRRPM}"
> >  do_package_write_rpm[depends] +=
> > "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'),
> > 'do_populate_sysroot')}"
> > -addtask package_write_rpm after do_packagedata do_package
> > +addtask package_write_rpm after do_packagedata do_package before do_build
> > 
> >  PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
> >  PACKAGEINDEXDEPS += "createrepo-c-native:do_populate_sysroot"
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

Thanks, it is nice to hear something working out well like that! :)

I've been working towards this for a while but we've never been quite ready for
the final pieces until now.

Cheers,

Richard



