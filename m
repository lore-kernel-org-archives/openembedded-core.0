Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.6156.1616490016480611340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 02:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:52020 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lOctX-00FL5M-5c; Tue, 23 Mar 2021 05:00:15 -0400
Date: Tue, 23 Mar 2021 05:00:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: Andre McCurdy <armccurdy@gmail.com>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] really strange usage of FILESPATH and FILESEXTRAPATHS
In-Reply-To: <20210323084108.pxrofv2zmz5mk64h@qschulz>
Message-ID: <d6d69644-b9d5-d99e-27c6-40eacefe5df6@crashcourse.ca>
References: <cb3f5a5e-fe71-d4fb-7cd6-86f457238fde@crashcourse.ca> <CAJ86T=WDjxift1cMeACmSE+an1kC+t+EuTeaO4PT6_+cM+mnjA@mail.gmail.com> <20210323084108.pxrofv2zmz5mk64h@qschulz>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Mar 2021, Quentin Schulz wrote:

> On Mon, Mar 22, 2021 at 03:18:30PM -0700, Andre McCurdy wrote:
> > On Mon, Mar 22, 2021 at 2:29 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >
> > >   here's the next head-scratching oddity i just ran across in the
> > > current layer (and there's more weirdness on its way).
> > >
> > >   perusing a recipe only to see:
> > >
> > >   FILESPATH =+ "${COMMON_STUFF_DIR}:"
> > >   SRC_URI += "file://file1 file://file2 file://file 3 ... etc ..."
> > >
> > > ok ... apparently, there are a number of recipes that want access to
> > > some small set of common files, so the solution(?) was to put those
> > > common files in some (out-of-layer) directory, and prepend to
> > > FILESPATH in each of those recipe files so that SRC_URI could find
> > > them.
> > >
> > >   i am not going to ask if this is some wickedly clever trick, since
> > > it can't be. it just can't.
> >
> > It's unconventional, but I guess it will work OK (i.e. it won't have
> > any surprising or negative side effects).
> >
> > It's better than (for example) one recipe fetching source from the
> > build directory of another recipe - which obviously breaks if you
> > don't somehow guarantee the order in which recipes are (re)built. I've
> > seen projects which did things like that and then needed to disable
> > sstate for CI and release builds as a workaround...
> >
> > >   even stranger, one of the common files was a configuration script
> > > that contributed the line:
> > >
> > >   . config.sh
> > >
> > > to the top of a number of common tasks like do_configure, do_compile,
> > > do_install and so on.
> >
> > It's not clear how a common file in SRC_URI could affect any tasks?
> >
> > >   a similar tactic was to find this line in a class file:
> > >
> > >   FILESEXTRAPATHS_prepend := "${COMMON_STUFF_DIR}:"
> > >
> > > my head hurts.
> > >
> > >   first, if i needed to do something in common at the beginning of
> > > some basic tasks, i'd invent a bbclass file that "_prepend"ed to those
> > > tasks, and just inherit it when necessary.
> > >
> > >   as for a number of recipes needing access to common files for any
> > > reason, well, thoughts? my first thought is to encapsulate those files
> > > in a separate recipe, then make that recipe a build dependency so that
> > > those files would be available from the sysroot, but i'm sure there
> > > are better ideas.
> >
> > Build dependencies are heavily geared towards libraries and header
> > files rather than common source files. See SYSROOT_DIRS and
> > SYSROOT_DIRS_BLACKLIST in staging.bbclass, which limit which
> > directories get staged in sysroot. You would need to navigate your
> > way around that (e.g. ensuring that the common source files get
> > staged in sysroot without being included in the final image, etc).
> > Certainly
>
> Recipes in DEPENDS are automatically added to RDEPENDS only in very
> specific cases (e.g. a library of the former appears in the NEEDED
> field of a library of the latter). It's perfectly safe to have a
> recipe export most of its content to the sysroot and still not have
> it being installed in the image.
>
> This is to me the cleanest and most maintainable solution.

  so, just to be clear, you seem to be agreeing with my original
proposal -- stuff all that common content in a single recipe, have it
install in the sysroot, make the recipe a build-time dependency of the
other recipes, and let those other recipes grab what they need from
the sysroot, yes?

  for now, i'm going to leave the structure as it is until i can get
clarification from someone as to why it was done that way, maybe
there's something i haven't noticed.

rday
