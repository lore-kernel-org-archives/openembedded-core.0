Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 275147665D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 08:34:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 27 Aug 2015 01:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,421,1437462000"; d="scan'208";a="633148591"
Received: from djcarton-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.50])
	by orsmga003.jf.intel.com with ESMTP; 27 Aug 2015 01:34:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>,
	Mariano Lopez <mariano.lopez@linux.intel.com>
Date: Thu, 27 Aug 2015 09:34:28 +0100
Message-ID: <3276619.q6MX28H7QK@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1440591962-35348-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1440591962-35348-1-git-send-email-benjamin.esquivel@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 27 Aug 2015 08:34:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Benjamin / Mariano,

On Wednesday 26 August 2015 12:26:02 Benjamin Esquivel wrote:
> Adding a new test to verify if the packages in the
> manifest files actually exists in pkgdata.
>  -adding a setUpClass for when more tests get created here
>  -check for the paths and fail gracefully if not there
>  -skip the test when there are no manifest files to check
>  -debug prints for failure analysis
> 
> [YOCTO#8028]
> 
> Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/manifest.py | 52
> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 52 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/manifest.py
> 
> diff --git a/meta/lib/oeqa/selftest/manifest.py
> b/meta/lib/oeqa/selftest/manifest.py new file mode 100644
> index 0000000..c2bc945
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/manifest.py
> @@ -0,0 +1,52 @@
> +import unittest
> +import os
> +from glob import glob
> +
> +from oeqa.selftest.base import oeSelfTest
> +from oeqa.utils.commands import get_bb_var
> +from oeqa.utils.decorators import testcase
> +
> +class VerifyManifest(oeSelfTest):
> +    '''Tests for the manifest files and contents of an image'''
> +
> +    @classmethod
> +    def setUpClass(self):
> +
> +        # get directory locations from variable values and check them
> +        self.deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE');
> +        if not self.deploy_dir_image \
> +            or not os.path.isdir(self.deploy_dir_image):
> +            raise unittest.SkipTest("{}: DEPLOY_DIR_IMAGE does not exist:
> {}"\ +                    .format("VerifyManifest", self.deploy_dir_image))
> +
> +        self.pkgdata_dir = get_bb_var('PKGDATA_DIR');
> +        if not self.pkgdata_dir \
> +            or not os.path.isdir(self.pkgdata_dir):
> +            raise unittest.SkipTest("{}: PKGDATA_DIR does not exist: {}"\
> +                    .format("VerifyManifest", self.pkgdata_dir))
> +
> +        # get the manifest files
> +        # no need to try: since glob would return an empty list if
> +        # the path is non-existant
> +        self.manifest_files = glob("%s/*.manifest" % self.deploy_dir_image)
> +        self.log.debug("manifest files: {}".format(self.manifest_files)) +
>        if not self.manifest_files:
> +            raise unittest.SkipTest("{}: No manifest files found in: {}"\
> +                .format("VerifyManifest", self.deploy_dir_image))
> +
> +
> +    def test_manifest_entries(self):
> +        '''Verifying the manifest entries as packages '''
> +        testname = self.id().split('.')[-1]
> +        rundir = os.path.join(self.pkgdata_dir, "runtime-reverse")
> +
> +        errmsg = "ERROR: Package %s is in manifest but not in pkgdata"
> +        for manifest in self.manifest_files:
> +            with open(manifest, "r") as mfile:
> +                for manifest_entries in mfile:
> +                    pkg = manifest_entries.split()[0]
> +                    pkgfile = os.path.join(rundir, pkg)
> +                    self.log.debug("{}: looking for {}"\
> +                            .format(testname, pkgfile))
> +                    self.assertTrue(os.path.isfile(pkgfile),
> +                            errmsg % pkg)

Shouldn't this test actually be building an image (e.g. using
bitbake('core-image-minimal') ) in order to ensure there's a manifest file for 
it to look at? Then you can make the test fail rather than skipping if the file 
isn't there or doesn't contain a small set of packages we know should be 
listed.

Also while you're adding this could you add a similar test function for the 
SDK (both host + target manifests).

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

