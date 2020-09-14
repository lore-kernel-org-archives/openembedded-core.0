Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.57415.1600075056908121184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 02:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=qrUChb1d;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pemorrow@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1045)
	id 28BD7209F315; Mon, 14 Sep 2020 02:17:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 28BD7209F315
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1600075056;
	bh=3p2MlRJ+FRhgpHemAsFgkQ7Yc6gxogSm6bpCP9hFvOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qrUChb1d7qUB+iX19U325YfDWGJI0C8YuGTqdxu3trLP0IoBRp0eh/thQfHKSmwO5
	 UYv96gafIwURh/3IytEynnpKUjd7GGYYmLcNLdhf9r58rzIj4OROvDKJiPO1AYd5v/
	 nOmU1+0MCAV8ctUs+9tFn+6IL3YSMIgsz8wqPgus=
Date: Mon, 14 Sep 2020 02:17:36 -0700
From: "Peter Morrow" <pemorrow@linux.microsoft.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Andre McCurdy <armccurdy@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] squashfs-tools: Allow COMP_DEFAULT to be changed easily at build time
Message-ID: <20200914091736.GA2599@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1599844862-15857-1-git-send-email-pemorrow@linux.microsoft.com>
 <CAJ86T=UPhup8G+e6yt2X9=smV9Y3oMQ=kvZB0K_ivp5ZwKDDCg@mail.gmail.com>
 <4f31caab-3148-c719-32ae-55d84d4bbf8c@gmail.com>
 <CAJ86T=WiU9NzRa3Lvmkc1tbTbM+XWXeRFZ94x9U0eXVD+2vd9g@mail.gmail.com>
 <CAMKF1soujrWimq0ZOYZh-31_5O+6tbdjXT4vPo1G03y+swpL3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soujrWimq0ZOYZh-31_5O+6tbdjXT4vPo1G03y+swpL3g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 12, 2020 at 12:37:28AM -0700, Khem Raj wrote:
> On Fri, Sep 11, 2020 at 11:36 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Fri, Sep 11, 2020 at 10:04 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > >
> > >
> > > On 9/11/20 10:33 AM, Andre McCurdy wrote:
> > > > On Fri, Sep 11, 2020 at 10:21 AM Peter Morrow
> > > > <pemorrow@linux.microsoft.com> wrote:
> > > >>
> > > >> The default compression algorithm is gzip, this patch allows the default
> > > >> to be changed via a bbappend file by setting SQUASHFS_TOOLS_COMP_DEFAULT
> > > >> to a valid compression algorithm.
> > > >>
> > > >> Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> > > >> ---
> > > >>  ...ols-Allow-COMP_DEFAULT-to-be-overridden-v.patch | 34 ++++++++++++++++++++++
> > > >>  .../squashfs-tools/squashfs-tools_git.bb           |  4 +++
> > > >>  2 files changed, 38 insertions(+)
> > > >>  create mode 100644 meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch
> > > >>
> > > >> diff --git a/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch
> > > >> new file mode 100644
> > > >> index 0000000..5f12c42
> > > >> --- /dev/null
> > > >> +++ b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch
> > > >> @@ -0,0 +1,34 @@
> > > >> +From d2d9b517696f5950597f5b60ae8fdade5b7c14a9 Mon Sep 17 00:00:00 2001
> > > >> +From: Peter Morrow <pemorrow@linux.microsoft.com>
> > > >> +Date: Fri, 4 Sep 2020 15:43:15 +0100
> > > >> +Subject: [PATCH] squashfs-tools: Allow COMP_DEFAULT to be overridden via make
> > > >> + cmdline
> > > >> +
> > > >> +Currently the only way to modify the default compression algorithm is to
> > > >> +modify the Makefile. It is useful to be able to set the default compression
> > > >> +algorithm via the make command line since otherwise a build time search
> > > >> +replace operation needs to be performed on the Makefile.
> > > >
> > > > That's not how Makefiles normally work. Options set via the command
> > > > line over-ride variables set with = in the Makefile.
> > > >
> > > > Does setting your chosen value for COMP_DEFAULT on the make command
> > > > line really not work?
> > >
> > > that works if make is invoked with -e option, We do not use make -e with
> > > bare makefile based recipes.
> >
> > The -e option is related to environment variables. It's not relevant
> > for this discussion - which is about setting options via the make
> > command line.
> >
> 
> I somehow oversaw the fact its being passed as make variable on
> cmdline  and not becoming
> an export. so you are right, I think we don't need the patch perhaps
> setting it via EXTRA_OEMAKE
> should suffice

Yes, not sure what I was thinking. I've tested again without the
squashfs-tools patch and setting via EXTRA_OEMAKE works as expected.

Thanks,
Peter.

> 
> > > >> +Upstream-Status: Submitted [https://github.com/plougher/squashfs-tools/pull/93 ]
> > > >> +
> > > >> +Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> > > >> +---
> > > >> + squashfs-tools/Makefile | 2 +-
> > > >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > >> +
> > > >> +diff --git a/squashfs-tools/Makefile b/squashfs-tools/Makefile
> > > >> +index aee4b96..7425605 100644
> > > >> +--- a/squashfs-tools/Makefile
> > > >> ++++ b/squashfs-tools/Makefile
> > > >> +@@ -85,7 +85,7 @@ GZIP_SUPPORT = 1
> > > >> + # in Mksquashfs.  Obviously the compression algorithm must have been
> > > >> + # selected to be built
> > > >> + #
> > > >> +-COMP_DEFAULT = gzip
> > > >> ++COMP_DEFAULT ?= gzip
> > > >> +
> > > >> +
> > > >> + ###############################################
> > > >> +--
> > > >> +2.20.1
> > > >> +
> > > >> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> > > >> index b06951d..df025d4 100644
> > > >> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> > > >> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> > > >> @@ -9,6 +9,7 @@ PV = "4.4"
> > > >>  SRCREV = "52eb4c279cd283ed9802dd1ceb686560b22ffb67"
> > > >>  SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
> > > >>             file://0001-squashfs-tools-fix-build-failure-against-gcc-10.patch;striplevel=2 \
> > > >> +           file://0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch;striplevel=2 \
> > > >>  "
> > > >>
> > > >>  S = "${WORKDIR}/git/squashfs-tools"
> > > >> @@ -25,6 +26,9 @@ PACKAGECONFIG[xattr] = "XATTR_SUPPORT=1,XATTR_SUPPORT=0,attr"
> > > >>  PACKAGECONFIG[zstd] = "ZSTD_SUPPORT=1,ZSTD_SUPPORT=0,zstd"
> > > >>  PACKAGECONFIG[reproducible] = "REPRODUCIBLE_DEFAULT=1,REPRODUCIBLE_DEFAULT=0,"
> > > >>
> > > >> +SQUASHFS_TOOLS_COMP_DEFAULT ?= "gzip"
> > > >> +EXTRA_OEMAKE += "COMP_DEFAULT=${SQUASHFS_TOOLS_COMP_DEFAULT}"
> > > >
> > > > Note that this will force the recipe's default value even if upstream
> > > > squashfs-tools changes. Not a problem now as the two are the same, but
> > > > something which will need to be checked each time squashfs-tools is
> > > > updated.
> > > >
> > > >>  do_compile() {
> > > >>         oe_runmake all
> > > >>  }
> > > >> --
> > > >> 1.8.3.1
> > > >>
> > > >>
> > > >>
> > > >> 

> 

