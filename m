Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 086B57F427
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 15:10:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x86FAEum018752
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Sep 2019 08:10:14 -0700 (PDT)
Received: from [128.224.56.218] (128.224.56.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 6 Sep 2019 08:10:13 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20190906140443.30110-1-Trevor.Gamblin@windriver.com>
	<d1e5a94c07b6298a2c5d5041de7910e935eea06d.camel@linuxfoundation.org>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <9f2cad3d-cf89-d9da-025c-ea3e5168b5e2@windriver.com>
Date: Fri, 6 Sep 2019 11:10:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d1e5a94c07b6298a2c5d5041de7910e935eea06d.camel@linuxfoundation.org>
Subject: Re: [PATCH] libevent: add granularity to ptest
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
X-List-Received-Date: Fri, 06 Sep 2019 15:10:14 -0000
Content-Type: multipart/alternative;
	boundary="------------241BB08507ACAEF1AC928958"
Content-Language: en-US

--------------241BB08507ACAEF1AC928958
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/19 10:26 AM, Richard Purdie wrote:

> On Fri, 2019-09-06 at 10:04 -0400, Trevor Gamblin wrote:
>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>
>> The libevent ptest used to report only a global pass or a fail
>> result.
>> Count individual PASS, FAIL, SKIP results. The SKIP results now
>> include tests that are disabled in the libevent code.
>>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>   .../libevent/libevent/run-ptest               | 34 ++++++++++++-----
>> --
>>   1 file changed, 22 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta/recipes-support/libevent/libevent/run-ptest
>> b/meta/recipes-support/libevent/libevent/run-ptest
>> index 0241851c70..b7d945246f 100644
>> --- a/meta/recipes-support/libevent/libevent/run-ptest
>> +++ b/meta/recipes-support/libevent/libevent/run-ptest
>> @@ -1,18 +1,28 @@
>>   #!/bin/sh
>>   
>> -fail=0
>> +# run-ptest - 'ptest' test infrastructure shell script that
>> +#   wraps the libevent test scripts
>> +#
>> +# Trevor Gamblin <trevor.gamblin@windriver.com>
>> +###############################################################
>> +LIBEVENTLIB=/usr/lib/libevent
>> +LOG="${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-%H%M%S).log"
>> +
>> +cd ${LIBEVENTLIB}/ptest
>> +
>>   for test in ./test/*
>>   do
>> -	$test
>> -	if [ $? -ne 0 ]
>> -	then
>> -		fail=1
>> -	fi
>> +    $test 2>&1|tee -a ${LOG}
>>   done
>>   
>> -if [ $fail -eq 0 ]
>> -then
>> -	echo "PASS: libevent"
>> -else
>> -	echo "FAIL: libevent"
>> -fi
>> +passed=`grep OK ${LOG}|wc -l`
>> +failed=`grep FAILED ${LOG}|wc -l`
>> +skipped=`grep -E 'DISABLED|SKIPPED' ${LOG}|wc -l`
>> +all=$((passed + failed + skipped))
>> +
>> +(   echo "=== Test Summary ==="
>> +    echo "TOTAL: ${all}"
>> +    echo "PASSED: ${passed}"
>> +    echo "FAILED: ${failed}"
>> +    echo "SKIPPED: ${skipped}"
>> +) | tee -a ${LOG}
> Does this work correctly such that ptest-runner picks up the individual
> test pass/fail results? I thought the tests would need individual
> pass/fail lines for that to work?
>
> Cheers,
>
> Richard
>
>
They do have individual pass/fail results in the ptest-runner output, 
but those don't match up with the pass/fail usually provided by ptest, 
so the log is parsed for OK/FAILED/SKIPPED/DISABLED and translated. 
Example output:

|write_cb: write 12
write_cb: write -1
=== Test Summary ===
TOTAL: 316
PASSED: 300
FAILED: 0
SKIPPED: 16
DURATION: 87
END: /usr/lib/libevent/ptest
2019-09-06T14:50
STOP: ptest-runner|

Compare with the last log from autobuilder 
(https://autobuilder.yocto.io/pub/non-release/20190829-10/testresults/qemux86-64-ptest/libevent.log):

|write_cb: write 12||
||write_cb: write -1||
||FAIL: libevent||
||DURATION: 116|

||I'm working on a v2 to address multilib - I'll add the example output 
to the commit as well.


--------------241BB08507ACAEF1AC928958
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>On 9/6/19 10:26 AM, Richard Purdie wrote:<br>
    </p>
    <blockquote type="cite"
cite="mid:d1e5a94c07b6298a2c5d5041de7910e935eea06d.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Fri, 2019-09-06 at 10:04 -0400, Trevor Gamblin wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>

The libevent ptest used to report only a global pass or a fail
result.
Count individual PASS, FAIL, SKIP results. The SKIP results now
include tests that are disabled in the libevent code.

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
---
 .../libevent/libevent/run-ptest               | 34 ++++++++++++-----
--
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent/run-ptest
b/meta/recipes-support/libevent/libevent/run-ptest
index 0241851c70..b7d945246f 100644
--- a/meta/recipes-support/libevent/libevent/run-ptest
+++ b/meta/recipes-support/libevent/libevent/run-ptest
@@ -1,18 +1,28 @@
 #!/bin/sh
 
-fail=0
+# run-ptest - 'ptest' test infrastructure shell script that
+#   wraps the libevent test scripts 
+#
+# Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
+###############################################################
+LIBEVENTLIB=/usr/lib/libevent
+LOG="${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-%H%M%S).log"
+
+cd ${LIBEVENTLIB}/ptest 
+
 for test in ./test/*
 do
-	$test
-	if [ $? -ne 0 ]
-	then
-		fail=1
-	fi
+    $test 2&gt;&amp;1|tee -a ${LOG}
 done
 
-if [ $fail -eq 0 ]
-then
-	echo "PASS: libevent"
-else
-	echo "FAIL: libevent"
-fi
+passed=`grep OK ${LOG}|wc -l`
+failed=`grep FAILED ${LOG}|wc -l`
+skipped=`grep -E 'DISABLED|SKIPPED' ${LOG}|wc -l`
+all=$((passed + failed + skipped))
+
+(   echo "=== Test Summary ==="
+    echo "TOTAL: ${all}"
+    echo "PASSED: ${passed}"
+    echo "FAILED: ${failed}"
+    echo "SKIPPED: ${skipped}"
+) | tee -a ${LOG}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Does this work correctly such that ptest-runner picks up the individual
test pass/fail results? I thought the tests would need individual
pass/fail lines for that to work?

Cheers,

Richard


</pre>
    </blockquote>
    <p>They do have individual pass/fail results in the ptest-runner
      output, but those don't match up with the pass/fail usually
      provided by ptest, so the log is parsed for
      OK/FAILED/SKIPPED/DISABLED and translated. Example output:</p>
    <code>write_cb: write 12<br>
      write_cb: write -1<br>
      === Test Summary ===<br>
      TOTAL: 316<br>
      PASSED: 300<br>
      FAILED: 0<br>
      SKIPPED: 16<br>
      DURATION: 87<br>
      END: /usr/lib/libevent/ptest<br>
      2019-09-06T14:50<br>
      STOP: ptest-runner</code><br>
    <p>Compare with the last log from autobuilder
(<a class="moz-txt-link-freetext" href="https://autobuilder.yocto.io/pub/non-release/20190829-10/testresults/qemux86-64-ptest/libevent.log">https://autobuilder.yocto.io/pub/non-release/20190829-10/testresults/qemux86-64-ptest/libevent.log</a>):</p>
    <p><code>write_cb: write 12</code><code><br>
      </code><code>write_cb: write -1</code><code><br>
      </code><code>FAIL: libevent</code><code><br>
      </code><code>DURATION: 116</code></p>
    <p><code></code>I'm working on a v2 to address multilib - I'll add
      the example output to the commit as well.<br>
    </p>
  </body>
</html>

--------------241BB08507ACAEF1AC928958--
