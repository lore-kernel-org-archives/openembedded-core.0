Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D16F8606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 13:34:44 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1bRg1s-0001Gs-ME from Nathan_Lynch@mentor.com ;
	Mon, 25 Jul 2016 06:34:44 -0700
Received: from [172.30.80.100] (147.34.91.1) by SVR-ORW-FEM-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 25 Jul 2016 06:34:44 -0700
To: "dengke.du@windriver.com" <dengke.du@windriver.com>
References: <1469220826-8991-1-git-send-email-nathan_lynch@mentor.com>
	<57957417.6040208@windriver.com>
From: Nathan Lynch <Nathan_Lynch@mentor.com>
Message-ID: <a73ce349-5710-c586-b1f4-97cdec78a5a7@mentor.com>
Date: Mon, 25 Jul 2016 08:34:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <57957417.6040208@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "lttng-tools: filter random filename of ptest output"
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
X-List-Received-Date: Mon, 25 Jul 2016 13:34:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

[please remember to cc the list]

On 07/24/2016 09:06 PM, dengke.du@windriver.com wrote:
> OK, thanks for your remind, the 1,2 and 4 I will pick it up. I show a
> total PASS beacuse when the tests PASS that it output many random
> filenames.

I'm sorry but I don't understand what you intend to do, and I'm unsure
what you mean by "random filenames".  If you have some QA analysis code
which cannot handle strange or unpredictable filenames in the output
then that's what should be fixed.

Please accept the revert, thanks.


> 
> //dengke
> 
> On 2016年07月23日 04:53, Nathan Lynch wrote:
>> This reverts commit 29a8c45be2862be02afe2ebbc5c026a42f351990.
>>
>> A few things wrong with this change:
>>
>> 1. It patches a patch (runtest-2.4.0.patch).
>> 2. It introduces deviations from the desired ptest output format.
>> 3. It discards PASS: lines from the test output; I *want* to see those.
>> 4. The upstream status of "pending" is incorrect; I do not see this
>>     patch on the lttng-dev mailing list (not that it would apply anyway).
>>
>> Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
>> ---
>>   ...ls-filter-random-filename-of-tests-output.patch | 55
>> ----------------------
>>   meta/recipes-kernel/lttng/lttng-tools_git.bb       |  1 -
>>   2 files changed, 56 deletions(-)
>>   delete mode 100644
>> meta/recipes-kernel/lttng/lttng-tools/0001-lttng-tools-filter-random-filename-of-tests-output.patch
>>
>>
>> diff --git
>> a/meta/recipes-kernel/lttng/lttng-tools/0001-lttng-tools-filter-random-filename-of-tests-output.patch
>> b/meta/recipes-kernel/lttng/lttng-tools/0001-lttng-tools-filter-random-filename-of-tests-output.patch
>>
>> deleted file mode 100644
>> index fed5a2fb59d6..000000000000
>> ---
>> a/meta/recipes-kernel/lttng/lttng-tools/0001-lttng-tools-filter-random-filename-of-tests-output.patch
>>
>> +++ /dev/null
>> @@ -1,55 +0,0 @@
>> -From b9744428d6dfb1cba7b6e3fdbf0613977914b12f Mon Sep 17 00:00:00 2001
>> -From: Dengke Du <dengke.du@windriver.com>
>> -Date: Fri, 29 Apr 2016 03:25:58 -0400
>> -Subject: [PATCH] lttng-tools: filter random filename of tests output
>> -
>> -Show the failed tests, filter the random filename when the test
>> -passed, add up the result.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ----
>> - tests/run.sh | 25 +++++++++++++++++++++++--
>> - 1 file changed, 23 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/tests/run.sh b/tests/run.sh
>> -index 6455359..9080afc 100755
>> ---- a/tests/run.sh
>> -+++ b/tests/run.sh
>> -@@ -17,9 +17,30 @@
>> - # Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 
>> 02111-1307, USA.
>> - #
>> -
>> -+# Define two variable to store the passed and failed result
>> -+pass_count=0
>> -+fail_count=0
>> -+
>> - [ -z "$1" ] && echo "Error: No testlist. Please specify a testlist
>> to run." && exit 1
>> -
>> --prove --merge -v --exec '' - < $1 | sed \
>> -+# Using a while loop to add up the passed and failed result, we use
>> Here Strings
>> -+# "<<<" in bash in order to redirect the test output to the while
>> loop. If put the
>> -+# test output as a pipeline, the while loop will run in subshell, we
>> can't get the
>> -+# pass_count and fail_count when the subshell exit.
>> -+while read line
>> -+do
>> -+    if [[ $line == "FAIL"* ]]; then
>> -+        echo $line;((fail_count=fail_count+1))
>> -+    fi
>> -+    if [[ $line == "PASS"* ]]; then
>> -+        ((pass_count=pass_count+1))
>> -+    fi
>> -+done <<< "$(prove --merge -v --exec '' - < $1 | sed \
>> -   -e 's|^ok \(.*\)|PASS: \1|' \
>> -   -e 's|^not ok \(.*\)|FAIL: \1|' \
>> --  | egrep -h 'PASS|FAIL'
>> -+  | egrep -h 'PASS|FAIL')"
>> -+
>> -+# Add up the result and output the passed and failed tests
>> -+echo "$1 statistics"
>> -+echo "total pass: $pass_count tests passed!"
>> -+echo "total fail: $fail_count tests failed!"
>> ---
>> -2.8.1
>> -
>> diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb
>> b/meta/recipes-kernel/lttng/lttng-tools_git.bb
>> index da2b68552bce..b0c369ce964a 100644
>> --- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
>> +++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
>> @@ -29,7 +29,6 @@ PACKAGECONFIG_remove_libc-musl = "lttng-ust"
>>   SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.7 \
>>              file://stop-using-SIGUNUSED.patch \
>>              file://runtest-2.4.0.patch \
>> -          
>> file://0001-lttng-tools-filter-random-filename-of-tests-output.patch \
>>              file://run-ptest"
>>     S = "${WORKDIR}/git"
> 


