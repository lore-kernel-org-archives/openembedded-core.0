Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6CEBC74C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 22:54:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9MMs7IN000722
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 22 Oct 2018 23:54:09 +0100
Message-ID: <e222c50a97c8b1b555cac324659e723b49b28413.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 23:54:07 +0100
In-Reply-To: <1540204485-22641-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1540204485-22641-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/4] oeqa/core/runner: write testresult to json files
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
X-List-Received-Date: Mon, 22 Oct 2018 22:54:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-22 at 18:34 +0800, Yeoh Ee Peng wrote:
> As part of the solution to replace Testopia to store testresult,
> OEQA need to output testresult into single json file, where json
> testresult file will be stored in git repository by the future
> test-case-management tools.
> 
> The json testresult file will store more than one set of results,
> where each set of results was uniquely identified by the result_id.
> The result_id would be like "runtime-qemux86-core-image-sato", where
> it was a runtime test with target machine equal to qemux86 and running
> on core-image-sato image. The json testresult file will only store
> the latest test content for a given result_id. The json testresult
> file contains the configuration (eg. COMMIT, BRANCH, MACHINE, IMAGE),
> result (eg. PASSED, FAILED, ERROR), test log, and result_id.
> 
> Based on the destination json testresult file directory provided,
> it could have multiple instances of bitbake trying to write json
> testresult to a single testresult file, using locking a lockfile
> alongside the results file directory to prevent races.
> 
> Also the library class inside this patch will be reused by the future
> test-case-management tools to write json testresult for manual test
> case executed.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/lib/oeqa/core/runner.py | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
> index f1dd080..2243a10 100644
> --- a/meta/lib/oeqa/core/runner.py
> +++ b/meta/lib/oeqa/core/runner.py
> @@ -6,6 +6,7 @@ import time
>  import unittest
>  import logging
>  import re
> +import json
>  
>  from unittest import TextTestResult as _TestResult
>  from unittest import TextTestRunner as _TestRunner
> @@ -119,8 +120,9 @@ class OETestResult(_TestResult):
>          self.successes.append((test, None))
>          super(OETestResult, self).addSuccess(test)
>  
> -    def logDetails(self):
> +    def logDetails(self, json_file_dir=None, configuration=None, result_id=None):
>          self.tc.logger.info("RESULTS:")
> +        result = {}
>          for case_name in self.tc._registry['cases']:
>              case = self.tc._registry['cases'][case_name]
>  
> @@ -137,6 +139,11 @@ class OETestResult(_TestResult):
>                  t = " (" + "{0:.2f}".format(self.endtime[case.id()] - self.starttime[case.id()]) + "s)"
>  
>              self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (case.id(), oeid, status, t))
> +            result[case.id()] = {'status': status, 'log': log}
> +
> +        if json_file_dir:
> +            tresultjsonhelper = OETestResultJSONHelper()
> +            tresultjsonhelper.dump_testresult_file(result_id, result, configuration, json_file_dir)
>  
>  class OEListTestsResult(object):
>      def wasSuccessful(self):
> @@ -249,3 +256,33 @@ class OETestRunner(_TestRunner):
>              self._list_tests_module(suite)
>  
>          return OEListTestsResult()
> +
> +class OETestResultJSONHelper(object):
> +
> +    testresult_filename = 'testresults.json'
> +
> +    def _get_existing_testresults_if_available(self, write_dir):
> +        testresults = {}
> +        file = os.path.join(write_dir, self.testresult_filename)
> +        if os.path.exists(file):
> +            with open(file, "r") as f:
> +                testresults = json.load(f)
> +        return testresults
> +
> +    def _create_json_testresults_string(self, test_results, result_id, test_result, configuration):
> +        test_results[result_id] = {'configuration': configuration, 'result': test_result}
> +        return json.dumps(test_results, sort_keys=True, indent=4)

I think the above function can be removed as its no longer used
anywhere.

I've queued these patches for testing on the main autobuilder as I
think we're close and wanted to check it doesn't show issues. I still
wonder if we couldn't write out the files to a specific directory more
reliably but I think I'd need to look at the code for longer to come up
with any proposal. Right now I guess we can at least configure the
autobuilder to put the files in a common location (so it can collect
them up).

Cheers,

Richard

> +    def _write_file(self, write_dir, file_name, file_content):
> +        file_path = os.path.join(write_dir, file_name)
> +        with open(file_path, 'w') as the_file:
> +            the_file.write(file_content)
> +
> +    def dump_testresult_file(self, result_id, test_result, configuration, write_dir):
> +        bb.utils.mkdirhier(write_dir)
> +        lf = bb.utils.lockfile(os.path.join(write_dir, 'jsontestresult.lock'))
> +        test_results = self._get_existing_testresults_if_available(write_dir)
> +        test_results[result_id] = {'configuration': configuration, 'result': test_result}
> +        json_testresults = json.dumps(test_results, sort_keys=True, indent=4)
> +        self._write_file(write_dir, self.testresult_filename, json_testresults)
> +        bb.utils.unlockfile(lf)
> -- 
> 2.7.4
> 


