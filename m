Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.9363.1629019194875757003
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 02:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 3599CE0002;
	Sun, 15 Aug 2021 09:19:52 +0000 (UTC)
Date: Sun, 15 Aug 2021 11:19:51 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
	Randy MacLeod <rwmacleod@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
	umesh kalappa0 <umesh.kalappa0@gmail.com>,
	vinay.kumar@blackfigtech.com
Subject: Re: [PATCH] glibc: Fix CVE-2021-35942
Message-ID: <YRjcNxUwivcLlpit@piout.net>
References: <20210728075215.154410-1-vinay.m.engg@gmail.com>
 <CANUMPcVVHAPZ1KQEq1kvrEYhvfkFY5oJMMmzxcUzDcpzwEovHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANUMPcVVHAPZ1KQEq1kvrEYhvfkFY5oJMMmzxcUzDcpzwEovHA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 15/08/2021 13:19:33+0530, Vinay Kumar wrote:
> Hi Richard,
> 
> Any update on the above patch.
> Please let me know if anything is pending from my side.
> 

I didn't test because the plan is to switch to glibc2.34 which IIRC has
the fix.

> Regards,
> Vinay
> 
> On Wed, Jul 28, 2021 at 1:22 PM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
> >
> > Source: https://sourceware.org/git/glibc.git
> > Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=28011
> >
> > Backported upstream commit 5adda61f62b77384718b4c0d8336ade8f2b4b35c to
> > glibc-2.33 source.
> >
> > Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
> >
> > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > ---
> >  .../glibc/glibc/CVE-2021-35942.patch          | 44 +++++++++++++++++++
> >  meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
> >  2 files changed, 45 insertions(+)
> >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> >
> > diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> > new file mode 100644
> > index 0000000000..5cae1bc91c
> > --- /dev/null
> > +++ b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> > @@ -0,0 +1,44 @@
> > +From 5adda61f62b77384718b4c0d8336ade8f2b4b35c Mon Sep 17 00:00:00 2001
> > +From: Andreas Schwab <schwab@linux-m68k.org>
> > +Date: Fri, 25 Jun 2021 15:02:47 +0200
> > +Subject: [PATCH] wordexp: handle overflow in positional parameter number (bug
> > + 28011)
> > +
> > +Use strtoul instead of atoi so that overflow can be detected.
> > +
> > +Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
> > +CVE: CVE-2021-35942
> > +Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > +---
> > + posix/wordexp-test.c | 1 +
> > + posix/wordexp.c      | 2 +-
> > + 2 files changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/posix/wordexp-test.c b/posix/wordexp-test.c
> > +index f93a546d7e..9df02dbbb3 100644
> > +--- a/posix/wordexp-test.c
> > ++++ b/posix/wordexp-test.c
> > +@@ -183,6 +183,7 @@ struct test_case_struct
> > +     { 0, NULL, "$var", 0, 0, { NULL, }, IFS },
> > +     { 0, NULL, "\"\\n\"", 0, 1, { "\\n", }, IFS },
> > +     { 0, NULL, "", 0, 0, { NULL, }, IFS },
> > ++    { 0, NULL, "${1234567890123456789012}", 0, 0, { NULL, }, IFS },
> > +
> > +     /* Flags not already covered (testit() has special handling for these) */
> > +     { 0, NULL, "one two", WRDE_DOOFFS, 2, { "one", "two", }, IFS },
> > +diff --git a/posix/wordexp.c b/posix/wordexp.c
> > +index bcbe96e48d..1f3b09f721 100644
> > +--- a/posix/wordexp.c
> > ++++ b/posix/wordexp.c
> > +@@ -1399,7 +1399,7 @@ envsubst:
> > +   /* Is it a numeric parameter? */
> > +   else if (isdigit (env[0]))
> > +     {
> > +-      int n = atoi (env);
> > ++      unsigned long n = strtoul (env, NULL, 10);
> > +
> > +       if (n >= __libc_argc)
> > +       /* Substitute NULL. */
> > +--
> > +2.17.1
> > +
> > diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
> > index e9f01a14c5..abb01f8468 100644
> > --- a/meta/recipes-core/glibc/glibc_2.33.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> > @@ -58,6 +58,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> >             file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
> >             file://mte-backports.patch \
> >             file://CVE-2021-33574.patch \
> > +           file://CVE-2021-35942.patch \
> >             "
> >  S = "${WORKDIR}/git"
> >  B = "${WORKDIR}/build-${TARGET_SYS}"
> > --
> > 2.31.1
> >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
