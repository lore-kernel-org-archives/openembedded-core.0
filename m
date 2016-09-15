Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 00C6D77071
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 13:15:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 15 Sep 2016 06:15:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,339,1470726000"; d="scan'208";a="1050801306"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.6.213])
	by orsmga002.jf.intel.com with ESMTP; 15 Sep 2016 06:15:43 -0700
Message-ID: <1473945341.3558.33.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: jwang <jing.j.wang@intel.com>, openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2016 14:15:41 +0100
In-Reply-To: <1473729455-32649-2-git-send-email-jing.j.wang@intel.com>
References: <1473729455-32649-1-git-send-email-jing.j.wang@intel.com>
	<1473729455-32649-2-git-send-email-jing.j.wang@intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 2/4] meta: implement key baserunner features
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
X-List-Received-Date: Thu, 15 Sep 2016 13:15:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-09-13 at 09:17 +0800, jwang wrote:
> From: zjh <junhuix.zhang@intel.com>
> 
> Baserunner contains three features:
> 1. load cases from a manifest file
> 2. load cases from a package such as "oeqa.runtime"
> 3. create runner engine based on pyunit textrunner


I think this and 1/4 should probably be squashed together?

> 
> Signed-off-by: zjh <junhuix.zhang@intel.com>
> ---
>  meta/lib/base/baserunner.py | 44
> ++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/lib/base/baserunner.py
> b/meta/lib/base/baserunner.py
> index 56b838e..d59872f 100755
> --- a/meta/lib/base/baserunner.py
> +++ b/meta/lib/base/baserunner.py
> @@ -31,30 +31,62 @@ class FakeOptions(object):
>  class TestRunnerBase(object):
>      '''test runner base '''
>      def __init__(self, context=None):
> -        self.tclist = []
> +        self.testslist = []
>          self.runner = None
>          self.context = context if context else TestContext()
> +        self.test_options = None
>          self.test_result = None
>          self.run_time = None
>  
> +    def __del__(self):
> +        """
> +        Because unittest.TestCase is a class object, it will exist
> as long as the python virtual machine process.
> +        So tc can't be released if we don't release them explicitly.
> +        """
> +        if hasattr(unittest.TestCase, "tc"):
> +            delattr(unittest.TestCase, "tc")
> +
> +    @staticmethod
> +    def get_tc_from_manifest(fname):
> +        '''get tc list from manifest format '''
> +        with open(fname, "r") as f:
> +            tclist = [n.strip() for n in f.readlines() \
> +                                if n.strip() and not
> n.strip().startswith('#')]
> +        return tclist

It might be nice to handle open() failing here? If open() fails we're
trying to return an undefined instance.

>  
>      def configure(self, options=FakeOptions()):
>          '''configure before testing'''
> -        pass
> +        self.test_options = options
> +        self.runner = unittest.TextTestRunner(stream=sys.stderr, \

There's no need for a backslash here, we can rely on Python's implied
continuation.

> +                                                  verbosity=2)
>  
>      def result(self):
>          '''output test result '''
> -        pass
> +        return self.test_result
>  
>      def loadtest(self, names=None):
>          '''load test suite'''
> -        pass
> +        if names is None:

It's much more idiomatic to write these like:

	if not names:

> +            names = self.testslist
> +        testloader = unittest.TestLoader()
> +        tclist = []
> +        for name in names:
> +            tset = testloader.loadTestsFromName(name)
> +            if tset.countTestCases() > 0:
> +                tclist.append(tset)
> +            elif tset._tests == []:

variable names prefixed with an underscore are, by convention,
internal/private to the object.

Is there a case where countTestCases() might not be > 0 and _tests[] !=
[] ? i.e. can we just use an else here?

> +                tclist.append(testloader.discover(name, "[!_]*.py",
> os.path.curdir))
> +        return testloader.suiteClass(tclist)
>  
>      def runtest(self, testsuite):
>          '''run test suite'''
> -        pass
> +        starttime = time.time()
> +        self.test_result = self.runner.run(testsuite)
> +        self.run_time = time.time() - starttime
>  
>      def start(self, testsuite):
>          '''start testing'''
> -        pass
> +        setattr(unittest.TestCase, "tc", self.context)
> +        self.runtest(testsuite)
> +        self.result()
>  
> -- 
> 2.1.4
> 

