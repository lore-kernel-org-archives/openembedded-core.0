Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9493F73BB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 20:24:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 28 Sep 2015 13:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,604,1437462000"; d="scan'208";a="814939742"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.43])
	([10.219.5.43])
	by orsmga002.jf.intel.com with ESMTP; 28 Sep 2015 13:24:04 -0700
Message-ID: <5609A248.8020303@linux.intel.com>
Date: Mon, 28 Sep 2015 15:25:44 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1443095587-13852-4-git-send-email-markus.lehtonen@linux.intel.com>
In-Reply-To: <1443095587-13852-4-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH v3 03/10] oe-selftest: devtool: add method for checking workspace dir
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
X-List-Received-Date: Mon, 28 Sep 2015 20:24:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/24/2015 06:53 AM, Markus Lehtonen wrote:
> In order to remove some code duplication.
>
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>   meta/lib/oeqa/selftest/devtool.py | 63 +++++++++++++++------------------------
>   1 file changed, 24 insertions(+), 39 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
> index 3a8168c..b8b872c 100644
> --- a/meta/lib/oeqa/selftest/devtool.py
> +++ b/meta/lib/oeqa/selftest/devtool.py
> @@ -84,11 +84,18 @@ class DevtoolBase(oeSelfTest):
>
>   class DevtoolTests(DevtoolBase):
>
> +    def _get_workspace_dir(self):
> +        """Get workspace directory"""
> +        workspacedir = os.path.join(self.builddir, 'workspace')
> +        self.assertTrue(not os.path.exists(workspacedir),
> +                        'This test cannot be run with a workspace directory '
> +                        'under the build directory')
> +        return workspacedir
> +
>       @testcase(1158)
>       def test_create_workspace(self):
>           # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()

If all tests are using workspacedir, I believe it make sense to have a 
setUp method and setting workspacedir there:

.
     def setUp(self):
	self.workspacedir = # the _get_workspace_dir body code goes here
.
.

>           result = runCmd('bitbake-layers show-layers')
>           self.assertTrue('/workspace' not in result.output, 'This test cannot be run with a workspace layer in bblayers.conf')
>           # Try creating a workspace layer with a specific path
> @@ -109,9 +116,7 @@ class DevtoolTests(DevtoolBase):
>
>       @testcase(1159)
>       def test_devtool_add(self):
> -        # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()
>           # Fetch source
>           tempdir = tempfile.mkdtemp(prefix='devtoolqa')
>           self.track_for_cleanup(tempdir)
> @@ -144,9 +149,7 @@ class DevtoolTests(DevtoolBase):
>
>       @testcase(1162)
>       def test_devtool_add_library(self):
> -        # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()
>           # We don't have the ability to pick up this dependency automatically yet...
>           bitbake('libusb1')
>           # Fetch source
> @@ -185,9 +188,7 @@ class DevtoolTests(DevtoolBase):
>
>       @testcase(1160)
>       def test_devtool_add_fetch(self):
> -        # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()
>           # Fetch source
>           tempdir = tempfile.mkdtemp(prefix='devtoolqa')
>           self.track_for_cleanup(tempdir)
> @@ -232,9 +233,7 @@ class DevtoolTests(DevtoolBase):
>
>       @testcase(1161)
>       def test_devtool_add_fetch_git(self):
> -        # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()
>           # Fetch source
>           tempdir = tempfile.mkdtemp(prefix='devtoolqa')
>           self.track_for_cleanup(tempdir)
> @@ -284,9 +283,7 @@ class DevtoolTests(DevtoolBase):
>
>       @testcase(1164)
>       def test_devtool_modify(self):
> -        # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()
>           # Clean up anything in the workdir/sysroot/sstate cache
>           bitbake('mdadm -c cleansstate')
>           # Try modifying a recipe
> @@ -336,9 +333,7 @@ class DevtoolTests(DevtoolBase):
>
>       @testcase(1166)
>       def test_devtool_modify_invalid(self):
> -        # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()
>           # Try modifying some recipes
>           tempdir = tempfile.mkdtemp(prefix='devtoolqa')
>           self.track_for_cleanup(tempdir)
> @@ -400,8 +395,7 @@ class DevtoolTests(DevtoolBase):
>       @testcase(1165)
>       def test_devtool_modify_git(self):
>           # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()
>           testrecipe = 'mkelfimage'
>           src_uri = get_bb_var('SRC_URI', testrecipe)
>           self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
> @@ -434,8 +428,7 @@ class DevtoolTests(DevtoolBase):
>       @testcase(1167)
>       def test_devtool_modify_localfiles(self):
>           # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()
>           testrecipe = 'lighttpd'
>           src_uri = (get_bb_var('SRC_URI', testrecipe) or '').split()
>           foundlocal = False
> @@ -467,8 +460,7 @@ class DevtoolTests(DevtoolBase):
>       @testcase(1169)
>       def test_devtool_update_recipe(self):
>           # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()
>           testrecipe = 'minicom'
>           recipefile = get_bb_var('FILE', testrecipe)
>           src_uri = get_bb_var('SRC_URI', testrecipe)
> @@ -514,8 +506,7 @@ class DevtoolTests(DevtoolBase):
>       @testcase(1172)
>       def test_devtool_update_recipe_git(self):
>           # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()
>           testrecipe = 'mtd-utils'
>           recipefile = get_bb_var('FILE', testrecipe)
>           src_uri = get_bb_var('SRC_URI', testrecipe)
> @@ -609,8 +600,7 @@ class DevtoolTests(DevtoolBase):
>       @testcase(1170)
>       def test_devtool_update_recipe_append(self):
>           # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()
>           testrecipe = 'mdadm'
>           recipefile = get_bb_var('FILE', testrecipe)
>           src_uri = get_bb_var('SRC_URI', testrecipe)
> @@ -685,8 +675,7 @@ class DevtoolTests(DevtoolBase):
>       @testcase(1171)
>       def test_devtool_update_recipe_append_git(self):
>           # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()
>           testrecipe = 'mtd-utils'
>           recipefile = get_bb_var('FILE', testrecipe)
>           src_uri = get_bb_var('SRC_URI', testrecipe)
> @@ -781,9 +770,7 @@ class DevtoolTests(DevtoolBase):
>
>       @testcase(1163)
>       def test_devtool_extract(self):
> -        # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()
>           tempdir = tempfile.mkdtemp(prefix='devtoolqa')
>           # Try devtool extract
>           self.track_for_cleanup(tempdir)
> @@ -795,9 +782,7 @@ class DevtoolTests(DevtoolBase):
>
>       @testcase(1168)
>       def test_devtool_reset_all(self):
> -        # Check preconditions
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> -        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        workspacedir = self._get_workspace_dir()
>           tempdir = tempfile.mkdtemp(prefix='devtoolqa')
>           self.track_for_cleanup(tempdir)
>           self.track_for_cleanup(workspacedir)
> @@ -846,7 +831,7 @@ class DevtoolTests(DevtoolBase):
>                   break
>           else:
>               self.skipTest('No tap devices found - you must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
> -        workspacedir = os.path.join(self.builddir, 'workspace')
> +        workspacedir = self._get_workspace_dir()
>           self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
>           # Definitions
>           testrecipe = 'mdadm'
>

