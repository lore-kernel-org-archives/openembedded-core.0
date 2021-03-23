Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web12.6034.1616488874272997065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 01:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4F4PwQ00Rkz5tlC;
	Tue, 23 Mar 2021 09:41:09 +0100 (CET)
Date: Tue, 23 Mar 2021 09:41:08 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] really strange usage of FILESPATH and FILESEXTRAPATHS
Message-ID: <20210323084108.pxrofv2zmz5mk64h@qschulz>
References: <cb3f5a5e-fe71-d4fb-7cd6-86f457238fde@crashcourse.ca>
 <CAJ86T=WDjxift1cMeACmSE+an1kC+t+EuTeaO4PT6_+cM+mnjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WDjxift1cMeACmSE+an1kC+t+EuTeaO4PT6_+cM+mnjA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 22, 2021 at 03:18:30PM -0700, Andre McCurdy wrote:
> On Mon, Mar 22, 2021 at 2:29 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   here's the next head-scratching oddity i just ran across in the
> > current layer (and there's more weirdness on its way).
> >
> >   perusing a recipe only to see:
> >
> >   FILESPATH =+ "${COMMON_STUFF_DIR}:"
> >   SRC_URI += "file://file1 file://file2 file://file 3 ... etc ..."
> >
> > ok ... apparently, there are a number of recipes that want access to
> > some small set of common files, so the solution(?) was to put those
> > common files in some (out-of-layer) directory, and prepend to
> > FILESPATH in each of those recipe files so that SRC_URI could find
> > them.
> >
> >   i am not going to ask if this is some wickedly clever trick, since
> > it can't be. it just can't.
> 
> It's unconventional, but I guess it will work OK (i.e. it won't have
> any surprising or negative side effects).
> 
> It's better than (for example) one recipe fetching source from the
> build directory of another recipe - which obviously breaks if you
> don't somehow guarantee the order in which recipes are (re)built. I've
> seen projects which did things like that and then needed to disable
> sstate for CI and release builds as a workaround...
> 
> >   even stranger, one of the common files was a configuration script
> > that contributed the line:
> >
> >   . config.sh
> >
> > to the top of a number of common tasks like do_configure, do_compile,
> > do_install and so on.
> 
> It's not clear how a common file in SRC_URI could affect any tasks?
> 
> >   a similar tactic was to find this line in a class file:
> >
> >   FILESEXTRAPATHS_prepend := "${COMMON_STUFF_DIR}:"
> >
> > my head hurts.
> >
> >   first, if i needed to do something in common at the beginning of
> > some basic tasks, i'd invent a bbclass file that "_prepend"ed to those
> > tasks, and just inherit it when necessary.
> >
> >   as for a number of recipes needing access to common files for any
> > reason, well, thoughts? my first thought is to encapsulate those files
> > in a separate recipe, then make that recipe a build dependency so that
> > those files would be available from the sysroot, but i'm sure there
> > are better ideas.
> 
> Build dependencies are heavily geared towards libraries and header
> files rather than common source files. See SYSROOT_DIRS and
> SYSROOT_DIRS_BLACKLIST in staging.bbclass, which limit which
> directories get staged in sysroot. You would need to navigate your way
> around that (e.g. ensuring that the common source files get staged in
> sysroot without being included in the final image, etc). Certainly

Recipes in DEPENDS are automatically added to RDEPENDS only in very
specific cases (e.g. a library of the former appears in the NEEDED field
of a library of the latter). It's perfectly safe to have a recipe export
most of its content to the sysroot and still not have it being installed
in the image.

This is to me the cleanest and most maintainable solution.

Quentin
