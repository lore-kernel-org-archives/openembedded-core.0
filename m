Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C904C745D8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 08:54:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w798sKkQ002546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 9 Aug 2018 09:54:21 +0100
Message-ID: <ffa3b6563d20aaea5bf4072af343ef0627106e94.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Anuj Mittal
	<anuj.mittal@intel.com>, openembedded-core@lists.openembedded.org, Paul
	Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 09 Aug 2018 09:54:20 +0100
In-Reply-To: <9d148729-8b92-e208-ae5d-3432d693affb@windriver.com>
References: <20180728085316.13484-1-anuj.mittal@intel.com>
	<9d148729-8b92-e208-ae5d-3432d693affb@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] oeqa/selftest: check if rm_work is enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Aug 2018 08:54:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-08 at 13:27 -0400, Randy MacLeod wrote:
> On 07/28/2018 04:53 AM, Anuj Mittal wrote:
> > rm_work if enabled leads to some tests failing that rely on
> > artifacts being present. Check if rm_work.bbclass is included and
> > show an error and exit if it is.
> > 
> > Fixes [YOCTO #12694]
> > 
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > ---
> >   meta/lib/oeqa/selftest/context.py | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/meta/lib/oeqa/selftest/context.py
> > b/meta/lib/oeqa/selftest/context.py
> > index 16812ba96e..3a70f9e77b 100644
> > --- a/meta/lib/oeqa/selftest/context.py
> > +++ b/meta/lib/oeqa/selftest/context.py
> > @@ -187,6 +187,10 @@ class
> > OESelftestTestContextExecutor(OETestContextExecutor):
> >               self.tc.logger.error("You have buildhistory enabled
> > already and this isn't recommended for selftest, please disable it
> > first.")
> >               raise OEQAPreRun
> >   
> > +        if "rm_work.bbclass" in self.tc.td["BBINCLUDED"]:
> > +            self.tc.logger.error("You have rm_work enabled which
> > isn't recommended while running oe-selftest. Please disable it
> > before continuing.")
> > +            raise OEQAPreRun
> > +
> >           if "PRSERV_HOST" in self.tc.td:
> >               self.tc.logger.error("Please unset PRSERV_HOST in
> > order to run oe-selftest")
> >               raise OEQAPreRun
> > 
> 
> Enabling rm_work should NOT be an error, and eventually it should not
> trigger any warnings. OEQA should only test the results of a build
> not how the build was done.

I'm torn on this. My thoughts:

I'd really like the results of oe-selftest to be consistent and
deterministic. If we expect it to work with and without rm_work we
really start having to test both, otherwise you can comparatively
easily find odd failures with one and not the other. I've accidentally
left it enabled, then puzzled over odd test results for an age on too
many occasions :(.

I'm still of the view that rm_work is a horrible hack. Its one I've
bent over backwards to try and keep working over the years[1] since a
lot of people use it, that doesn't mean its any less of a hack though
as when you understand what it does and how it does it, it really is
horrible. 
([1]I made 26 out of 47 changes to the class in the past 12 years)

If you step back and think about it, the use of rm_work precludes tests
from poking into WORKDIR or at the very least makes them have to care
about a lot of very specific task ordering of tasks which may or may
not be present. It doesn't seem unreasonable for selftests to actually
look in WORKDIR to ensure builds are doing the correct things.

> I reviewed some of the rm_work related defects:
> 
> 1. https://bugzilla.yoctoproject.org/show_bug.cgi?id=12647
>    The warning was intentional based on Paul's comment.

There were two issues, one rm_work, the other warning piece isn't an
issue.

> 2. https://bugzilla.yoctoproject.org/show_bug.cgi?id=12655
>    The logs seem to only say that the error goes away when
>    rm_work is NOT enabled. I'd prefer to understand what it is
>    that's causing the failure and perhaps add to the packages
>    recipe so that the output passes the OEQA tests.

The issue is that the test looks for an intermediate file in
WORKDIR/sysroot-destdir. rm_work removes it before the test can find
it.

> 3. https://bugzilla.yoctoproject.org/show_bug.cgi?id=12694
>    Title was: oe-selftest should warn if rm_work is enabled
>    but the commit makes it an error.
> 
> Any disagreement about making it be a warning?
> 
> rm_work saves lots of storage space so I'm reluctant to make
> OEQA require that it is NOT used.

We're not requiring OEQA not use it globally, we're requiring oe-
selftest not enable it. The other OEQA components (image, SDK, eSDK
tests) all are unaffected.

As things stand today several tests break with it. I've no doubt we
could 'fix' them in some way to avoid the problems but do we require
any new test author to test with and without rm_work? Do we start
requiring the autobuilder test both combinations?

When the user runs oe-selftest, I really want them to get the same
results as our autobuilder so we're consistent everywhere. We've had
numerous problems in that regard, e.g. buildhistory enabled/not enabled
and I think its reasonable for the code to check for things which are
known to introduce inconsistency? We have made a lot of progress in
being much more consistent.

Cheers,

Richard





