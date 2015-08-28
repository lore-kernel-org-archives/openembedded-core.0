Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 30E9C60043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 09:18:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 28 Aug 2015 02:18:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="633882520"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.13.245])
	by orsmga003.jf.intel.com with ESMTP; 28 Aug 2015 02:18:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, benjamin.esquivel@linux.intel.com
Date: Fri, 28 Aug 2015 10:18:28 +0100
Message-ID: <1675897.By6dee7Xjq@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1440690651.15187.88.camel@linux.intel.com>
References: <1440591962-35348-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<3276619.q6MX28H7QK@peggleto-mobl.ger.corp.intel.com>
	<1440690651.15187.88.camel@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] selftest/manifest.py: Test to verify rootfs manifest
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
X-List-Received-Date: Fri, 28 Aug 2015 09:18:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 27 August 2015 10:50:51 Benjamin Esquivel wrote:
> Hey Paul, thanks for looking at this, check the comments below.
> 
> On Thu, 2015-08-27 at 09:34 +0100, Paul Eggleton wrote:
> > Hi Benjamin / Mariano,
> > 
> > On Wednesday 26 August 2015 12:26:02 Benjamin Esquivel wrote:
> > > Adding a new test to verify if the packages in the
> > > manifest files actually exists in pkgdata.
> > > 
> > >  -adding a setUpClass for when more tests get created here
> > >  -check for the paths and fail gracefully if not there
> > >  -skip the test when there are no manifest files to check
> > >  -debug prints for failure analysis
> > > 
> > > [YOCTO#8028]
> > > 
> > > Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com
> > > 
> > > Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> > > ---
> > > 
> > >  meta/lib/oeqa/selftest/manifest.py | 52
> > > 
> > > ++++++++++++++++++++++++++++++++++++++ 1 file changed, 52
> > > insertions(+)
> > > 
> > >  create mode 100644 meta/lib/oeqa/selftest/manifest.py
> > > 
> > > diff --git a/meta/lib/oeqa/selftest/manifest.py
> > > b/meta/lib/oeqa/selftest/manifest.py new file mode 100644
> > > index 0000000..c2bc945
> > > --- /dev/null
> > > +++ b/meta/lib/oeqa/selftest/manifest.py
> > > @@ -0,0 +1,52 @@
> > > +import unittest
> > > +import os
> > > +from glob import glob
> > > +
> > > +from oeqa.selftest.base import oeSelfTest
> > > +from oeqa.utils.commands import get_bb_var
> > > +from oeqa.utils.decorators import testcase
> > > +
> > > +class VerifyManifest(oeSelfTest):
> > > +    '''Tests for the manifest files and contents of an image'''
> > > +
> > > +    @classmethod
> > > +    def setUpClass(self):
> > > +
> > > +        # get directory locations from variable values and check
> > > them
> > > +        self.deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE');
> > > +        if not self.deploy_dir_image \
> > > +            or not os.path.isdir(self.deploy_dir_image):
> > > +            raise unittest.SkipTest("{}: DEPLOY_DIR_IMAGE does not
> > > exist:
> > > {}"\ +                    .format("VerifyManifest",
> > > self.deploy_dir_image))
> > > +
> > > +        self.pkgdata_dir = get_bb_var('PKGDATA_DIR');
> > > +        if not self.pkgdata_dir \
> > > +            or not os.path.isdir(self.pkgdata_dir):
> > > +            raise unittest.SkipTest("{}: PKGDATA_DIR does not
> > > exist: {}"\
> > > +                    .format("VerifyManifest", self.pkgdata_dir))
> > > +
> > > +        # get the manifest files
> > > +        # no need to try: since glob would return an empty list if
> > > +        # the path is non-existant
> > > +        self.manifest_files = glob("%s/*.manifest" %
> > > self.deploy_dir_image)
> > > +        self.log.debug("manifest files:
> > > {}".format(self.manifest_files)) +
> > > 
> > >        if not self.manifest_files:
> > > +            raise unittest.SkipTest("{}: No manifest files found
> > > in: {}"\
> > > +                .format("VerifyManifest", self.deploy_dir_image))
> > > +
> > > +
> > > +    def test_manifest_entries(self):
> > > +        '''Verifying the manifest entries as packages '''
> > > +        testname = self.id().split('.')[-1]
> > > +        rundir = os.path.join(self.pkgdata_dir, "runtime-reverse")
> > > +
> > > +        errmsg = "ERROR: Package %s is in manifest but not in
> > > pkgdata"
> > > +        for manifest in self.manifest_files:
> > > +            with open(manifest, "r") as mfile:
> > > +                for manifest_entries in mfile:
> > > +                    pkg = manifest_entries.split()[0]
> > > +                    pkgfile = os.path.join(rundir, pkg)
> > > +                    self.log.debug("{}: looking for {}"\
> > > +                            .format(testname, pkgfile))
> > > +                    self.assertTrue(os.path.isfile(pkgfile),
> > > +                            errmsg % pkg)
> > 
> > Shouldn't this test actually be building an image (e.g. using
> > bitbake('core-image-minimal') ) in order to ensure there's a manifest
> > file for
> > it to look at? Then you can make the test fail rather than skipping
> > if the file
> > isn't there or doesn't contain a small set of packages we know should
> > be
> > listed.
> 
> The reason the actual build of an image was not included in the test is
> because it is abstracted from it. That's why it contains checks for
> when the manifests are not there it skips the test instead of failing.
> 
> This would give you the chance to write some level of abstraction that
> is able to have test subjects (i.e. subject A: core-image-minimal with
> systemd and ipk). Otherwise you're locking the test to a single
> scenario which is usually the most common. All the corner cases are
> hidden from that scope of testing.
>
> On the other hand, if we had that design I'm talking about we could
> easily have a default behavior that does exactly what you're proposing.
> 
> What do you think?

We want oe-selftest to be able to objectively test that expected functionality 
works when run unattended (as it is on the autobuilder), so if there are 
multiple scenarios to test then we probably need to be explicitly setting 
those up and testing them here rather than expecting the user to set them up 
beforehand. If that adds time to the oe-selftest run, well, so be it.

> > Also while you're adding this could you add a similar test function
> > for the
> > SDK (both host + target manifests).
> 
> I believe we could add many more tests that's why I started splitting
> common tasks to the setup function of the test.
> 
> I'll add this in the next patch version.

Great, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

