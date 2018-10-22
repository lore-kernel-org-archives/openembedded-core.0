Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4630160248
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 08:32:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9M8Vx25011859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 22 Oct 2018 09:32:01 +0100
Message-ID: <a12cf13bca36f6573be192ada5bbf60dbaa4b902.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 09:31:59 +0100
In-Reply-To: <1540191264-12332-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1540191264-12332-1-git-send-email-ee.peng.yeoh@intel.com>
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
X-List-Received-Date: Mon, 22 Oct 2018 08:32:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ee Peng,

Thanks, this is looking good, there is still one small tweak needed
below.

On Mon, 2018-10-22 at 14:54 +0800, Yeoh Ee Peng wrote:
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
> the latest testresult for a given result_id. The json testresult
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
>  meta/lib/oeqa/core/runner.py | 40 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
> index f1dd080..82463cf 100644
> --- a/meta/lib/oeqa/core/runner.py
> +++ b/meta/lib/oeqa/core/runner.py
> @@ -249,3 +256,34 @@ class OETestRunner(_TestRunner):
>              self._list_tests_module(suite)
>  
>          return OEListTestsResult()
> +
> +class OETestResultJSONHelper(object):
> +
> +    testresult_filename = 'testresults.json'
> +
> +    def _get_testresults(self, write_dir):
> +        testresults = {}
> +        file = os.path.join(write_dir, self.testresult_filename)
> +        if os.path.exists(file):
> +            with open(file, "r") as f:
> +                testresults = json.load(f)
> +        return testresults
> +
> +    def _create_json_testresults_string(self, result_id, test_result, configuration, write_dir):
> +        testresults = self._get_testresults(write_dir)
> +        testresult = {'configuration': configuration,
> +                      'result': test_result}
> +        testresults[result_id] = testresult
> +        return json.dumps(testresults, sort_keys=True, indent=4)
> +
> +    def _write_file(self, write_dir, file_name, file_content):
> +        file_path = os.path.join(write_dir, file_name)
> +        with open(file_path, 'w') as the_file:
> +            the_file.write(file_content)
> +
> +    def dump_testresult_file(self, result_id, test_result, configuration, write_dir):
> +        bb.utils.mkdirhier(write_dir)
> +        lf = bb.utils.lockfile(os.path.join(write_dir, 'jsontestresult.lock'))
> +        json_testresults = self._create_json_testresults_string(result_id, test_result, configuration, write_dir)
> +        self._write_file(write_dir, self.testresult_filename, json_testresults)
> +        bb.utils.unlockfile(lf)

Before we write out the file we need to load in any existing data so we
effectively append to the data. I think if we do that this patch should
be ready to merge.

I did also wonder if we need a common configuration function rather
than duplicating the code into each of the test classes.

Cheers,

Richard



