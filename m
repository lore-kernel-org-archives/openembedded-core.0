Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1610A76B7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 16:15:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Aug 2015 09:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,416,1437462000"; d="scan'208";a="755874297"
Received: from jachar-mobl1.amr.corp.intel.com (HELO [10.254.45.92])
	([10.254.45.92])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2015 09:15:53 -0700
Message-ID: <55DDE63D.4020204@linux.intel.com>
Date: Wed, 26 Aug 2015 11:15:57 -0500
From: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: leonardo.sandoval.gonzalez@linux.intel.com, 
	openembedded-core@lists.openembedded.org
References: <cover.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<195df149001acccaffb6ecfbc9b837c2e8a6720d.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <195df149001acccaffb6ecfbc9b837c2e8a6720d.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH v2 2/2] oeqa/selftest: new tests for devtool upgrage feature
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
X-List-Received-Date: Wed, 26 Aug 2015 16:15:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Comments below.

On 26/08/15 02:43, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> Basic tests for the devtool's upgrade feature, including:
>        * Parameter check
>        * Upgrading a real recipe (e2fsprogrs) without patching and
>        	checing its output
>        * Devtool status after upgrade
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>   meta/lib/oeqa/selftest/devtool.py | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
> index b59db15..f72e010 100644
> --- a/meta/lib/oeqa/selftest/devtool.py
> +++ b/meta/lib/oeqa/selftest/devtool.py
> @@ -857,3 +857,39 @@ class DevtoolTests(DevtoolBase):
>               result = runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, qemu.ip))
>               result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand), ignore_status=True)
>               self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
> +
> +    def test_devtool_upgrade(self):
> +        # Check preconditions
> +        workspacedir = os.path.join(self.builddir, 'workspace')
> +        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        # Check parameters
> +        result = runCmd('devtool upgrade -h')
> +        for param in 'recipename srctree --version -V --branch -b --keep-temp --no-patch'.split():
> +            self.assertIn(param, result.output)
> +        # For the moment, we are using a real recipe.
> +        recipe='e2fsprogs'
> +        version='1.42.13'

Isn't a guarantee that this version will be newer ever (i.e. if someone 
upgrade e2fsprogs to 1.42.13) what happen in this case?
> +        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
> +        # Check that recipe is not already under devtool control
> +        result = runCmd('devtool status')
> +        self.assertNotIn(recipe, result.output)
> +        # Check upgrade. Code does not check if new PV is older or newer that current PV, so, it may be that
> +        # we are downgrading instead of upgrading.
> +        result = runCmd('devtool upgrade %s %s -V %s --no-patch' % (recipe, tempdir, version))
> +        # Check if srctree at least is populated
> +        self.assertTrue(len(os.listdir(tempdir)) > 0, 'scrtree (%s) should be populated with new (%s) source code' % (tempdir, version))
> +        # Check new recipe folder is present
> +        self.assertTrue(os.path.exists(os.path.join(workspacedir,'recipes',recipe)), 'Recipe folder should exist')
> +        # Check new recipe file is present
> +        self.assertTrue(os.path.exists(os.path.join(workspacedir,'recipes',recipe,"%s_%s.bb" % (recipe,version))), 'Recipe folder should exist')
> +        # Check devtool status and make sure recipe is present
> +        result = runCmd('devtool status')
> +        self.assertIn(recipe, result.output)
> +        self.assertIn(tempdir, result.output)
> +        # Check devtool reset recipe
> +        result = runCmd('devtool reset %s -n' % recipe)
> +        result = runCmd('devtool status')
> +        self.assertNotIn(recipe, result.output)
> +        self.track_for_cleanup(tempdir)
> +        self.track_for_cleanup(workspacedir)
> +        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')


