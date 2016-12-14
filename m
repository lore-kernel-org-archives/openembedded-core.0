Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6282F7721B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 11:45:05 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP; 14 Dec 2016 03:45:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="42236889"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 14 Dec 2016 03:45:05 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id CECD86A4006;
	Wed, 14 Dec 2016 03:44:17 -0800 (PST)
Date: Wed, 14 Dec 2016 13:44:30 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Message-ID: <20161214114430.GA19511@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1481644407-16699-1-git-send-email-jair.de.jesus.gonzalez.plascencia@linux.intel.com>
	<20161213201722.GA6557@linux.intel.com>
	<012801d255a0$806ad8e0$81408aa0$@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <012801d255a0$806ad8e0$81408aa0$@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] selftest/wic: extending test coverage for WIC script options
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
X-List-Received-Date: Wed, 14 Dec 2016 11:45:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 13, 2016 at 06:24:57PM -0600, Jair Gonzalez wrote:
> Hi Ed,
> 
> Thank you for your response and suggestions. Below are my comments.
> 

> > > +    @testcase(1557)
> > > +    def test_listed_images_help(self):
> > > +        """Test wic listed images help"""
> > > +        output = runCmd('wic list images').output
> > > +        imageDetails = [line.split() for line in output.split('\n')]
> > > +        imageList = [row[0] for row in imageDetails]
> > How about replacing two last lines with this?
> > imagelist = [line.split()[0] for line in output.split('\n')]
> I agree. What about this?
> imagelist = [line.split()[0] for line in output.splitlines()]

This is event better, thanks!

> > > +
> > > + "--image-name=core-image-minimal").status)
> > Is '=' mandatory here?
> On wic's help it appears as mandatory, but on practice, it can be used both
> ways. I decided to use both ways along the module to test both usages and
> increase coverage, but not to dedicate specific test cases to each
> combination.

Makes sense to me.

> > >      def test_compress_gzip(self):
> > >          """Test compressing an image with gzip"""
> > >          self.assertEqual(0, runCmd("wic create directdisk "
> > > -                                   "--image-name core-image-minimal "
> > > +                                   "-e core-image-minimal "
> > --image-name is more readable than -e from my point of view.
> Similarly to the '=' to define long option names' arguments, I used both
> forms of each option along the module to increase coverage.
OK

> > > +    def test_debug_skip_build_check_and_build_rootfs(self):
> > > +        """Test wic debug, skip-build-check and build_rootfs"""
> > > +        self.assertEqual(0, runCmd("wic create directdisk "
> > > +                                   "--image-name=core-image-minimal "
> > > +                                   "-D -s -f").status)
> > > +        self.assertEqual(1, len(glob(self.resultdir +
> "directdisk-*.direct")))
> > > +        self.assertEqual(0, runCmd("wic create directdisk "
> > > +                                   "--image-name=core-image-minimal "
> > > +                                   "--debug "
> > > +                                   "--skip-build-check "
> > > +                                   "--build-rootfs").status)
> > > +        self.assertEqual(1, len(glob(self.resultdir +
> > > + "directdisk-*.direct")))
> > > +
> > I'd split this to two test cases as they're testing two different options.
> Actually, those are three different options (with their short and long
> versions). I did this to not add too many test cases, but as you mention,
> probably it's better to separate them by option to make it clearer.
Agreed.

> core-image-minimal").status)
> > > -        self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-
> > *.direct")))
> > > -        self.assertEqual(1, len(glob(self.resultdir +
> "HYBRID_ISO_IMG-*.iso")))
> > > +                                   "--image-name core-image-minimal"
> > > +                                   ).status)
> > This is less readable. Is this only to fit the line into 80 chars?
> > If so, let's not do it. Lines up to 100 chars long are more readable than
> this I
> > believe.
> I changed it to conform to PEP8 and increase readability on editors adjusted
> to 80 chars. However, if you consider it's better to leave it on 100 chars,
> I could work within that.

Let's agree on max 100 chars/line if it improves readability. Otherwise
80 is ok.

> > > +        self.assertEqual(0, runCmd("wic create directdisk "
> > > +                                   "--image-name=%s "
> > > +                                   "--vars %s"
> > > +                                   % (image, imgenvdir)).status)
> > > +
> > Do we really want to test short and long variant of options?
> > If so, we should do it for all options.
> Within the module, all short and long variant of options are tested. Not all
> combinations of long variants with '=' and without it are tested, though.

OK, makes sense to me.

> > > +    @testcase(1562)
> > > +    def test_alternate_output_dir(self):
> > > +        """Test alternate output directory"""
> > > +        self.assertEqual(0, runCmd("wic create directdisk "
> > > +                                   "-e core-image-minimal "
> > > +                                   "-o %s"
> > > +                                   % self.alternate_resultdir).status)
> > > +        self.assertEqual(1, len(glob(self.alternate_resultdir +
> > > +                                     "build/directdisk-*.direct")))
> > > +        self.assertEqual(0, runCmd("wic create mkefidisk -e "
> > > +                                   "core-image-minimal "
> > > +                                   "--outdir %s"
> > > +                                   % self.alternate_resultdir).status)
> > > +        self.assertEqual(1, len(glob(self.alternate_resultdir +
> > > +                                     "build/mkefidisk-*direct")))
> > Would one test be enough?
> I'm using both output option variants to increase coverage.
yep, understood.

> > BTW, did you measure how long does the test run before and after your
> > changes? We should be careful here as this test runs on ab and makes
> people
> > wait longer for results.
> Agreed. I didn't do it, but I'll measure it and take it into account for my
> next update.

Great! It would be interesting to look at the numbers.


--
Regards,
Ed

