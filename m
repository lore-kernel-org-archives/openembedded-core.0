Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A82D077071
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 13:15:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 15 Sep 2016 06:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,339,1470726000"; d="scan'208";a="1056499154"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.6.213])
	by fmsmga002.fm.intel.com with ESMTP; 15 Sep 2016 06:15:49 -0700
Message-ID: <1473945348.3558.34.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: jwang <jing.j.wang@intel.com>, openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2016 14:15:48 +0100
In-Reply-To: <1473729455-32649-3-git-send-email-jing.j.wang@intel.com>
References: <1473729455-32649-1-git-send-email-jing.j.wang@intel.com>
	<1473729455-32649-3-git-send-email-jing.j.wang@intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 3/4] meta: use baserunner in oetest
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
X-List-Received-Date: Thu, 15 Sep 2016 13:15:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-09-13 at 09:17 +0800, jwang wrote:
> From: zjh <junhuix.zhang@intel.com>
> 
> enable two features from baserunner:
> 1. loadtest
> 2. read test cases from manifest file
> 
> Signed-off-by: zjh <junhuix.zhang@intel.com>
> ---
>  meta/lib/oeqa/oetest.py | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
> index 4a740fb..9211cec 100644
> --- a/meta/lib/oeqa/oetest.py
> +++ b/meta/lib/oeqa/oetest.py
> @@ -28,6 +28,8 @@ except ImportError:
>      pass
>  from oeqa.utils.decorators import LogResults, gettag, getResults
>  from oeqa.utils import avoid_paths_in_environ
> +from base.baserunner import TestRunnerBase
> +
>  
>  logger = logging.getLogger("BitBake")
>  
> @@ -203,8 +205,10 @@ def custom_verbose(msg, *args, **kwargs):
>              logger.info(_buffer_logger.rstrip("\n"), *args,
> **kwargs)
>          _buffer_logger = ""
>  
> -class TestContext(object):
> +class TestContext(TestRunnerBase):
> +    _configure_in_init = True

This is a funny variable, when would it not be True and why? Could we
add a comment here about what the variable is for?

Should it be an argument passed at object construction, as it's denoted
as internal by the _ prefix?

>      def __init__(self, d, exported=False):
> +        super(TestContext, self).__init__(self)
>          self.d = d
>  
>          self.testsuites = self._get_test_suites()
> @@ -223,6 +227,9 @@ class TestContext(object):
>          self.imagefeatures = d.getVar("IMAGE_FEATURES",
> True).split()
>          self.distrofeatures = d.getVar("DISTRO_FEATURES",
> True).split()
>  
> +        if self._configure_in_init:
> +            self.configure()

If we don't configure during __init__() when do we do it? Why might we
not do it during __init__() ?

> +
>      # get testcase list from specified file
>      # if path is a relative path, then relative to build/conf/
>      def _read_testlist(self, fpath, builddir):
> @@ -329,9 +336,7 @@ class TestContext(object):
>      def loadTests(self):
>          setattr(oeTest, "tc", self)
>  
> -        testloader = unittest.TestLoader()
> -        testloader.sortTestMethodsUsing = None
> -        suites = [testloader.loadTestsFromName(name) for name in
> self.testslist]
> +        suites = self.loadtest(self.testslist)
>          suites = filterByTagExp(suites, getattr(self, "tagexp",
> None))
>  
>          # Determine dependencies between suites by looking for
> @skipUnlessPassed
> @@ -376,9 +381,9 @@ class TestContext(object):
>          def cmpfunc(a, b):
>              return cmp((a.depth, a.index), (b.depth, b.index))
>  
> -        suites.sort(key=functools.cmp_to_key(cmpfunc))
> +        suites._tests.sort(key=functools.cmp_to_key(cmpfunc))

We appear to be using a non-public instance variable, is there
something else we could be using here to get the list of tests?

>  
> -        self.suite = testloader.suiteClass(suites)
> +        self.suite = suites
>  
>          return self.suite
>  
> @@ -387,11 +392,10 @@ class TestContext(object):
>          if hasattr(self, "tagexp") and self.tagexp:
>              logger.info("Filter test cases by tags: %s" %
> self.tagexp)
>          logger.info("Found %s tests" % self.suite.countTestCases())
> -        runner = unittest.TextTestRunner(verbosity=2)
>          if 'bb' in sys.modules:
> -            runner.stream.write = custom_verbose
> -
> -        return runner.run(self.suite)
> +            self.runner.stream.write = custom_verbose
> +        self.start(self.suite)
> +        return self.result()
>  
>  class RuntimeTestContext(TestContext):
>      def __init__(self, d, target, exported=False):
> -- 
> 2.1.4
> 

