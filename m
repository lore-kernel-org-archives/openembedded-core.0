Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 18CEC79A8E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 08:53:54 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9F8rpEI032108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 15 Oct 2018 09:53:52 +0100
Message-ID: <ad34c69dbab91a7250874cb70d0c03a62adc3e2c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 15 Oct 2018 09:53:51 +0100
In-Reply-To: <1539588294-5532-2-git-send-email-ee.peng.yeoh@intel.com>
References: <1539588294-5532-1-git-send-email-ee.peng.yeoh@intel.com>
	<1539588294-5532-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/5] oeqa/core/runner: write testresult to json files
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
X-List-Received-Date: Mon, 15 Oct 2018 08:53:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-15 at 15:24 +0800, Yeoh Ee Peng wrote:
> As part of the solution to replace Testopia to store testresult,
> OEQA need to output testresult into json file, where these json
> testresult file will be stored in git repository by the future
> test-case-management tools.
> 
> Both the testresult (eg. PASSED, FAILED, ERROR) and  the test log
> (eg. message from unit test assertion) will be created for storing.
> 
> Also the library class inside this patch will be reused by the future
> test-case-management tools to write json testresult for manual test
> case executed.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/lib/oeqa/core/runner.py | 64 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
> index 56666ee..56e8526 100644
> --- a/meta/lib/oeqa/core/runner.py
> +++ b/meta/lib/oeqa/core/runner.py
> @@ -6,6 +6,8 @@ import time
>  import unittest
>  import logging
>  import re
> +import json
> +import pathlib
>  
>  from unittest import TextTestResult as _TestResult
>  from unittest import TextTestRunner as _TestRunner
> @@ -119,8 +121,9 @@ class OETestResult(_TestResult):
>          self.successes.append((test, None))
>          super(OETestResult, self).addSuccess(test)
>  
> -    def logDetails(self):
> +    def logDetails(self, json_file_dir=''):

json_file_dir=None

>          self.tc.logger.info("RESULTS:")
> +        results = {}
>          for case_name in self.tc._registry['cases']:
>              case = self.tc._registry['cases'][case_name]
>  
> @@ -137,6 +140,12 @@ class OETestResult(_TestResult):
>                  t = " (" + "{0:.2f}".format(self.endtime[case.id()] - self.starttime[case.id()]) + "s)"
>  
>              self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (case.id(), oeid, status, t))
> +            results[case.id()] = (status, log)
> +
> +        if len(json_file_dir) > 0:

if json_file_dir:

> +            tresultjsonhelper = OETestResultJSONHelper()
> +            tresultjsonhelper.dump_testresult_file(results, json_file_dir)
> +            tresultjsonhelper.dump_log_files(results, os.path.join(json_file_dir, 'logs'))
>  
>  class OEListTestsResult(object):
>      def wasSuccessful(self):
> @@ -249,3 +258,56 @@ class OETestRunner(_TestRunner):
>              self._list_tests_module(suite)
>  
>          return OEListTestsResult()
> +
> +class OETestResultJSONHelper(object):
> +
> +    def get_testsuite_from_testcase(self, testcase):
> +        testsuite = testcase[0:testcase.rfind(".")]
> +        return testsuite
> +
> +    def get_testsuite_testcase_dictionary(self, testresults):
> +        testsuite_testcase_dict = {}
> +        for testcase in testresults.keys():
> +            testsuite = self.get_testsuite_from_testcase(testcase)
> +            if testsuite in testsuite_testcase_dict:
> +                testsuite_testcase_dict[testsuite].append(testcase)
> +            else:
> +                testsuite_testcase_dict[testsuite] = [testcase]
> +        return testsuite_testcase_dict
> +
> +    def _create_testcase_testresult_object(self, testcase_list, testresults):
> +        testcase_dict = {}
> +        for testcase in sorted(testcase_list):
> +            testcase_dict[testcase] = {"testresult": testresults[testcase][0]}
> +        return testcase_dict
> +
> +    def _create_json_testsuite_string(self, testresults):
> +        testsuite_testcase = self.get_testsuite_testcase_dictionary(testresults)
> +        testsuite_object = {'testsuite': {}}
> +        testsuite_dict = testsuite_object['testsuite']
> +        for testsuite in sorted(testsuite_testcase.keys()):
> +            testsuite_dict[testsuite] = {'testcase': {}}
> +            testsuite_dict[testsuite]['testcase'] = self._create_testcase_testresult_object(
> +                                                        testsuite_testcase[testsuite],
> +                                                        testresults)
> +        return json.dumps(testsuite_object, sort_keys=True, indent=4)

This patch itself is better but I want to make sure we're using the
right data format for this results file. Can you describe the format
you're planning to use for the results?

I think what we may need to do is:

a) Combine the results and log data into a single file

b) Stop trying to split things into testsuites here and do that during
the results processing. Here, we should just be writing the test case
names as they are in the system.

c) Don't rely on the filename to pass information. For example,
logDetails() needs to take a parameter which says whether these are
"runtime", "selftest", "manual" or whatever and that information also
needs to be stored in the json file.

I think if you describe the results format and/or provide a sample
results entry in json format, this will become clearer.



> +    def _write_file(self, write_dir, file_name, file_content):
> +        file_path = os.path.join(write_dir, file_name)
> +        with open(file_path, 'w') as the_file:
> +            the_file.write(file_content)
> +
> +    def dump_testresult_file(self, testresults, write_dir):
> +        if not os.path.exists(write_dir):
> +            pathlib.Path(write_dir).mkdir(parents=True, exist_ok=True)

The above can be moved into _write_file() rather than being duplicated.
Also, can't we use bb.utils.mkdirhier() like the rest of the code? That
can be called unconditionally as it tests internally if it needs to
create the directory.

> +        json_testsuite = self._create_json_testsuite_string(testresults)
> +        self._write_file(write_dir, 'testresults.json', json_testsuite)
> +
> +    def dump_log_files(self, testresults, write_dir):
> +        if not os.path.exists(write_dir):
> +            pathlib.Path(write_dir).mkdir(parents=True, exist_ok=True)
> +        for testcase in testresults.keys():
> +            test_log = testresults[testcase][1]
> +            if test_log is not None:

Just "if test_log:" should be fine.

> +                file_name = '%s.log' % testcase
> +                self._write_file(write_dir, file_name, test_log)


Cheers,

Richard


