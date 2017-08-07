Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 13F926010B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 20:28:45 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 13:28:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,339,1498546800"; d="scan'208";a="134752484"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by orsmga005.jf.intel.com with ESMTP; 07 Aug 2017 13:28:46 -0700
To: Leoanardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20170802172239.26420-1-leonardo.sandoval.gonzalez@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <c321bccf-7a02-11d3-f0bc-46efa1cdf0a2@linux.intel.com>
Date: Mon, 7 Aug 2017 15:29:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170802172239.26420-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: Re: [PATCH] context: Include a command line argument to run all except certain tests
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
X-List-Received-Date: Mon, 07 Aug 2017 20:28:46 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi,

The code looks ok but i prefer to implement this kind of feature inside
loader instead of at context module, this is because the oeqa loader has
all the logic to get tests and filter it if is necessary.

Cheers,
Anibal

On 08/02/2017 12:22 PM, Leoanardo Sandoval wrote:
> Useful command line argument (-R, which is the oposite of current -r) that allows
> to run all test cases except the ones indicated through the command line.
> 
> Some command line examples:
> 
> * Run all except the distro test case:
> $ oe-selftest -R distrodata
> 
> * Run all except the archiver test case and a single bblayers unit test
> $ oe-selftest -R archiver bblayers.BitbakeLayers.test_bitbakelayers_add_remove
> 
> [YOCTO #11847]
> 
> Signed-off-by: Leoanardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  meta/lib/oeqa/core/context.py     | 20 +++++++++++++++++---
>  meta/lib/oeqa/selftest/context.py | 11 ++++++++---
>  2 files changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
> index 422e289992..acd547416f 100644
> --- a/meta/lib/oeqa/core/context.py
> +++ b/meta/lib/oeqa/core/context.py
> @@ -41,6 +41,14 @@ class OETestContext(object):
>  
>          return modules
>  
> +    def skipTests(self, skips):
> +        if not skips:
> +            return
> +        for test in self.suites:
> +            for skip in skips:
> +                if test.id().startswith(skip):
> +                    setattr(test, 'setUp', lambda: test.skipTest('Skip by the command line argument "%s"' % skip))
> +
>      def loadTests(self, module_paths, modules=[], tests=[],
>              modules_manifest="", modules_required=[], filters={}):
>          if modules_manifest:
> @@ -50,9 +58,12 @@ class OETestContext(object):
>                  modules_required, filters)
>          self.suites = self.loader.discover()
>  
> -    def runTests(self):
> +    def runTests(self, skips=[]):
>          self.runner = self.runnerClass(self, descriptions=False, verbosity=2)
>  
> +        # Dinamically skip those tests specified though arguments
> +        self.skipTests(skips)
> +
>          self._run_start_time = time.time()
>          result = self.runner.run(self.suites)
>          self._run_end_time = time.time()
> @@ -128,7 +139,8 @@ class OETestContextExecutor(object):
>          self.tc_kwargs = {}
>          self.tc_kwargs['init'] = {}
>          self.tc_kwargs['load'] = {}
> -        self.tc_kwargs['run'] = {}
> +        self.tc_kwargs['list'] = {}
> +        self.tc_kwargs['run']  = {}
>  
>          self.tc_kwargs['init']['logger'] = self._setup_logger(logger, args)
>          if args.test_data_file:
> @@ -143,6 +155,8 @@ class OETestContextExecutor(object):
>          else:
>              self.tc_kwargs['load']['modules'] = []
>  
> +        self.tc_kwargs['run']['skips'] = []
> +
>          self.module_paths = args.CASES_PATHS
>  
>      def _pre_run(self):
> @@ -159,7 +173,7 @@ class OETestContextExecutor(object):
>              sys.exit(1)
>  
>          if args.list_tests:
> -            rc = self.tc.listTests(args.list_tests, **self.tc_kwargs['run'])
> +            rc = self.tc.listTests(args.list_tests, **self.tc_kwargs['list'])
>          else:
>              self._pre_run()
>              rc = self.tc.runTests(**self.tc_kwargs['run'])
> diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
> index 990c761f29..9e90d3c256 100644
> --- a/meta/lib/oeqa/selftest/context.py
> +++ b/meta/lib/oeqa/selftest/context.py
> @@ -25,14 +25,14 @@ class OESelftestTestContext(OETestContext):
>          self.custommachine = None
>          self.config_paths = config_paths
>  
> -    def runTests(self, machine=None):
> +    def runTests(self, machine=None, skips=[]):
>          if machine:
>              self.custommachine = machine
>              if machine == 'random':
>                  self.custommachine = choice(self.machines)
>              self.logger.info('Run tests with custom MACHINE set to: %s' % \
>                      self.custommachine)
> -        return super(OESelftestTestContext, self).runTests()
> +        return super(OESelftestTestContext, self).runTests(skips)
>  
>      def listTests(self, display_type, machine=None):
>          return super(OESelftestTestContext, self).listTests(display_type)
> @@ -51,6 +51,9 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
>          group.add_argument('-a', '--run-all-tests', default=False,
>                  action="store_true", dest="run_all_tests",
>                  help='Run all (unhidden) tests')
> +        group.add_argument('-R', '--skip-tests', required=False, action='store',
> +                nargs='+', dest="skips", default=None,
> +                help='Run all (unhidden) tests except the ones specified. Format should be <module>[.<class>[.<test_method>]]')
>          group.add_argument('-r', '--run-tests', required=False, action='store',
>                  nargs='+', dest="run_tests", default=None,
>                  help='Select what tests to run (modules, classes or test methods). Format should be: <module>.<class>.<test_method>')
> @@ -133,6 +136,8 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
>          copyfile(self.tc_kwargs['init']['config_paths']['bblayers'], 
>                  self.tc_kwargs['init']['config_paths']['bblayers_backup'])
>  
> +        self.tc_kwargs['run']['skips'] = args.skips
> +
>      def _pre_run(self):
>          def _check_required_env_variables(vars):
>              for var in vars:
> @@ -203,7 +208,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
>              sys.exit(1)
>  
>          if args.list_tests:
> -            rc = self.tc.listTests(args.list_tests, **self.tc_kwargs['run'])
> +            rc = self.tc.listTests(args.list_tests, **self.tc_kwargs['list'])
>          else:
>              self._pre_run()
>              rc = self.tc.runTests(**self.tc_kwargs['run'])
> 

