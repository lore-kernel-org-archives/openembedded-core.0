Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A03087F3AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 19:22:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x86JLe3q009061
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Sep 2019 12:22:08 -0700
Received: from [128.224.56.218] (128.224.56.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 6 Sep 2019 12:21:42 -0700
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
References: <20190906185159.4923-1-Trevor.Gamblin@windriver.com>
	<219406fe-4067-45b7-5d47-47783a90d605@windriver.com>
Message-ID: <8fda307d-862b-3b79-077c-5092bd3b9321@windriver.com>
Date: Fri, 6 Sep 2019 15:21:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <219406fe-4067-45b7-5d47-47783a90d605@windriver.com>
Subject: Re: [PATCH v2] libevent: add granularity to ptest log
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
X-List-Received-Date: Fri, 06 Sep 2019 19:22:17 -0000
Content-Type: multipart/alternative;
	boundary="------------EEDB3B9AE5B2DD3203F611C9"
Content-Language: en-US

--------------EEDB3B9AE5B2DD3203F611C9
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 9/6/19 3:02 PM, Trevor Gamblin wrote:
>
> On 9/6/19 2:51 PM, Trevor Gamblin wrote:
>
>> From: Trevor Gamblin<trevor.gamblin@windriver.com>
>>
>> The libevent ptest used to report only a global pass or a fail result.
>> Count individual PASS, FAIL, SKIP results. The SKIP results now
>> include tests that are disabled in the libevent code.
>>
>> libevent's ptest output did not comply with the automake-style output
>> "result: testname", and reported a FAIL status at the end of the test
>> run if any of the libevent tests failed. This patch makes the log
>> consistent with the automake style:
>>
>>      PASS: http/cancel_by_host_no_ns
>>      PASS: http/cancel_inactive_server
>>      PASS: http/cancel_by_host_no_ns_inactive_server
>>      SKIPPED: http/cancel_by_host_server_timeout
>>      SKIPPED: http/cancel_server_timeout
>>
>> and provides a summary as follows:
>>
>>      === Test Summary ===
>>      TOTAL: 316
>>      PASSED: 300
>>      FAILED: 0
>>      SKIPPED: 16
>>      DURATION: 87
>>      END: /usr/lib/libevent/ptest
>>
>> Signed-off-by: Trevor Gamblin<trevor.gamblin@windriver.com>
>> ---
>>   .../libevent/libevent/run-ptest               | 34 ++++++++++++-------
>>   .../libevent/libevent_2.1.11.bb               |  3 ++
>>   2 files changed, 25 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta/recipes-support/libevent/libevent/run-ptest b/meta/recipes-support/libevent/libevent/run-ptest
>> index 0241851c70..080806dea9 100644
>> --- a/meta/recipes-support/libevent/libevent/run-ptest
>> +++ b/meta/recipes-support/libevent/libevent/run-ptest
>> @@ -1,18 +1,28 @@
>>   #!/bin/sh
>>   
>> -fail=0
>> +# run-ptest - 'ptest' test infrastructure shell script that
>> +#   wraps the libevent test scripts
>> +#
>> +# Trevor Gamblin<trevor.gamblin@windriver.com>
>> +###############################################################
>> +LIBEVENTLIB=@libdir@/libevent
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
>> +    $test 2>&1| sed -e '/OK/ s/^/PASS: / ; /FAILED/ s/^/FAIL: / ; /SKIPPED/ s/^/SKIP: / ; /DISABLED/ s/^/SKIP: /' | cut -f1,2 -d ':' | tee -a ${LOG}
>>   done
>>   
>> -if [ $fail -eq 0 ]
>> -then
>> -	echo "PASS: libevent"
>> -else
>> -	echo "FAIL: libevent"
>> -fi
>> +passed=`grep PASS ${LOG}|wc -l`
>> +failed=`grep FAIL ${LOG}|wc -l`
>> +skipped=`grep -E SKIP ${LOG}|wc -l`
>> +all=$((passed + failed + skipped))
>> +
>> +(   echo "=== Test Summary ==="
>> +    echo "TOTAL: ${all}"
>> +    echo "PASSED: ${passed}"
>> +    echo "FAILED: ${failed}"
>> +    echo "SKIPPED: ${skipped}"
>> +) | tee -a ${LOG}
>> diff --git a/meta/recipes-support/libevent/libevent_2.1.11.bb b/meta/recipes-support/libevent/libevent_2.1.11.bb
>> index 1e18f0ab2c..f005ab8bda 100644
>> --- a/meta/recipes-support/libevent/libevent_2.1.11.bb
>> +++ b/meta/recipes-support/libevent/libevent_2.1.11.bb
>> @@ -43,4 +43,7 @@ do_install_ptest() {
>>   	do
>>   		install -m 0755 $file ${D}${PTEST_PATH}/test
>>   	done
>> +
>> +        # handle multilib
>> +        sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
>>   }
>
> ptest logs are currently still including some performance test outputs 
> in addition to the PASS/FAIL stuff we are concerned with. That being 
> said, I figured it'd be better to get a working patch in to use on a 
> test run before the weekend. Example of the performance output below:||
>
> |||write callback. should only see this once||
> ||timeout fired, time to end test||
> ||usec used=80, usec passed=1501872, cpu usage=0.01%||
> ||closed_cb: detected socket close with success||
> ||=====expected||
> ||Now= 1567793437.757017||
> ||Inserted:||
> ||  0x405940 [fd  3] Write||
> ||  0x4059d0 [fd  4] Read Persist Timeout=T+1||
> ||  0x405a60 [fd  5] Write Persist Timeout=T+1||
> ||  0x405af0 [fd  6] Read Timeout=T+2.5||
> ||  0x405b80 [fd  -1] Timeout=T+1||
> ||  0x405c10 [fd  -1] Timeout=T+1||
> ||  0x405ca0 [fd  -1] Timeout=T+1||
> ||  0x405d30 [fd  -1] Persist Timeout=T+2.5||
> ||  0x405dc0 [fd  -1] Persist Timeout=T+1||
> ||  0x405e50 [fd  -1] Persist Timeout=T+2.5||
> ||  0x406000 [sig 2] Signal Persist||
> ||Active:||
> ||  0x405ee0 [fd  -1, priority=0] Read active||
> ||  0x405f70 [fd  -1, priority=0] Read Write Timeout active||
> ||  0x4059d0 [fd  4, priority=0] Read active||
> ||======received||
> ||Inserted events:||
> ||  0x405940 [fd  3] Write||
> ||  0x4059d0 [fd  4] Read Persist Timeout=1567793438.756966||
> ||  0x405a60 [fd  5] Write Persist Timeout=1567793438.756966||
> ||  0x405af0 [fd  6] Read Timeout=1567793440.256966||
> ||  0x405308 [fd  8] Read Persist Internal||
> ||  0x406000 [sig 2] Signal Persist||
> ||  0x405800 [fd  -1] Internal Timeout=1567793438.756966||
> ||  0x4058b0 [fd  -1] Internal Timeout=1567793440.256966||
> ||  0x405ca0 [fd  -1] Timeout=1567793438.756966||
> ||  0x405e50 [fd  -1] Persist Timeout=1567793440.256966||
> ||  0x405b80 [fd  -1] Timeout=1567793438.756966||
> ||  0x405c10 [fd  -1] Timeout=1567793438.756966||
> ||  0x405dc0 [fd  -1] Persist Timeout=1567793438.756966||
> ||  0x405d30 [fd  -1] Persist Timeout=1567793440.256966||
> ||Active events:||
> ||  0x4059d0 [fd  4, priority=0] Read active||
> ||  0x405ee0 [fd  -1, priority=0] Read active||
> ||  0x405f70 [fd  -1, priority=0] Read Write Timeout active||
> ||read_cb: read 12||
> ||read_cb: read 0 - means EOF||
> ||waiting for 30 conns||
> ||Average group read bucket level: 0.000000||
> ||Average group write bucket level: 0.000000||
> ||1: 683014.200000 per second||
> ||2: 4389273.600000 per second||
> ||3: 683014.200000 per second||
> ||4: 687929.400000 per second||
> ||5: 683014.200000 per second||
> ||6: 592950.200000 per second||
> ||7: 683014.200000 per second||
> ||8: 687929.400000 per second||
> ||9: 1433587.200000 per second||
> ||10: 17691353.400000 per second||
> ||11: 1433590.400000 per second||
> ||12: 17667606.200000 per second||
> ||13: 1202576.000000 per second||
> ||14: 592950.200000 per second||
> ||15: 592950.200000 per second||
> ||16: 17667606.200000 per second||
> ||17: 1199100.600000 per second||
> ||18: 16940233.600000 per second||
> ||19: 1402460.800000 per second||
> ||20: 17667606.200000 per second||
> ||21: 17670063.800000 per second||
> ||22: 592950.200000 per second||
> ||23: 592950.200000 per second||
> ||24: 17667606.200000 per second||
> ||25: 17670063.800000 per second||
> ||26: 17667606.200000 per second||
> ||27: 17699551.800000 per second||
> ||28: 17697907.000000 per second||
> ||29: 17699551.800000 per second||
> ||30: 1216486.400000 per second||
> ||   total: 230756497.800000 per second||
> || average: 7691883.260000 per second||
> ||  stddev: 8132709.287741 per second||
> ||209005, 20000||
> ||write_cb: write 12||
> ||write_cb: write -1|
>
> At least some of the libevent test scripts output only this content 
> (i.e. they don't run any of the PASS/FAIL/SKIP tests), so I'll look 
> into dropping those from the ptest unless there's a reason we'd want 
> to leave them in.
> ||||||
>
>
Just determined that only the libevent "regress" test is involved in the 
PASS/FAIL tests of interest. I'll submit a v3 on Monday.

--------------EEDB3B9AE5B2DD3203F611C9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/6/19 3:02 PM, Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:219406fe-4067-45b7-5d47-47783a90d605@windriver.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>On 9/6/19 2:51 PM, Trevor Gamblin wrote:<br>
      </p>
      <blockquote type="cite"
        cite="mid:20190906185159.4923-1-Trevor.Gamblin@windriver.com">
        <pre class="moz-quote-pre" wrap="">From: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com" moz-do-not-send="true">&lt;trevor.gamblin@windriver.com&gt;</a>

The libevent ptest used to report only a global pass or a fail result.
Count individual PASS, FAIL, SKIP results. The SKIP results now
include tests that are disabled in the libevent code.

libevent's ptest output did not comply with the automake-style output
"result: testname", and reported a FAIL status at the end of the test
run if any of the libevent tests failed. This patch makes the log
consistent with the automake style:

    PASS: http/cancel_by_host_no_ns
    PASS: http/cancel_inactive_server
    PASS: http/cancel_by_host_no_ns_inactive_server
    SKIPPED: http/cancel_by_host_server_timeout
    SKIPPED: http/cancel_server_timeout

and provides a summary as follows:

    === Test Summary ===
    TOTAL: 316
    PASSED: 300
    FAILED: 0
    SKIPPED: 16
    DURATION: 87
    END: /usr/lib/libevent/ptest

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com" moz-do-not-send="true">&lt;trevor.gamblin@windriver.com&gt;</a>
---
 .../libevent/libevent/run-ptest               | 34 ++++++++++++-------
 .../libevent/libevent_2.1.11.bb               |  3 ++
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent/run-ptest b/meta/recipes-support/libevent/libevent/run-ptest
index 0241851c70..080806dea9 100644
--- a/meta/recipes-support/libevent/libevent/run-ptest
+++ b/meta/recipes-support/libevent/libevent/run-ptest
@@ -1,18 +1,28 @@
 #!/bin/sh
 
-fail=0
+# run-ptest - 'ptest' test infrastructure shell script that
+#   wraps the libevent test scripts 
+#
+# Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com" moz-do-not-send="true">&lt;trevor.gamblin@windriver.com&gt;</a>
+###############################################################
+LIBEVENTLIB=@libdir@/libevent
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
+    $test 2&gt;&amp;1| sed -e '/OK/ s/^/PASS: / ; /FAILED/ s/^/FAIL: / ; /SKIPPED/ s/^/SKIP: / ; /DISABLED/ s/^/SKIP: /' | cut -f1,2 -d ':' | tee -a ${LOG}
 done
 
-if [ $fail -eq 0 ]
-then
-	echo "PASS: libevent"
-else
-	echo "FAIL: libevent"
-fi
+passed=`grep PASS ${LOG}|wc -l`
+failed=`grep FAIL ${LOG}|wc -l`
+skipped=`grep -E SKIP ${LOG}|wc -l`
+all=$((passed + failed + skipped))
+
+(   echo "=== Test Summary ==="
+    echo "TOTAL: ${all}"
+    echo "PASSED: ${passed}"
+    echo "FAILED: ${failed}"
+    echo "SKIPPED: ${skipped}"
+) | tee -a ${LOG}
diff --git a/meta/recipes-support/libevent/libevent_2.1.11.bb b/meta/recipes-support/libevent/libevent_2.1.11.bb
index 1e18f0ab2c..f005ab8bda 100644
--- a/meta/recipes-support/libevent/libevent_2.1.11.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.11.bb
@@ -43,4 +43,7 @@ do_install_ptest() {
 	do
 		install -m 0755 $file ${D}${PTEST_PATH}/test
 	done
+        
+        # handle multilib
+        sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
</pre>
      </blockquote>
      <p>ptest logs are currently still including some performance test
        outputs in addition to the PASS/FAIL stuff we are concerned
        with. That being said, I figured it'd be better to get a working
        patch in to use on a test run before the weekend. Example of the
        performance output below:<code></code></p>
      <p><code></code><code>write callback. should only see this once</code><code><br>
        </code><code>timeout fired, time to end test</code><code><br>
        </code><code>usec used=80, usec passed=1501872, cpu usage=0.01%</code><code><br>
        </code><code>closed_cb: detected socket close with success</code><code><br>
        </code><code>=====expected</code><code><br>
        </code><code>Now= 1567793437.757017</code><code><br>
        </code><code>Inserted:</code><code><br>
        </code><code>  0x405940 [fd  3] Write</code><code><br>
        </code><code>  0x4059d0 [fd  4] Read Persist Timeout=T+1</code><code><br>
        </code><code>  0x405a60 [fd  5] Write Persist Timeout=T+1</code><code><br>
        </code><code>  0x405af0 [fd  6] Read Timeout=T+2.5</code><code><br>
        </code><code>  0x405b80 [fd  -1] Timeout=T+1</code><code><br>
        </code><code>  0x405c10 [fd  -1] Timeout=T+1</code><code><br>
        </code><code>  0x405ca0 [fd  -1] Timeout=T+1</code><code><br>
        </code><code>  0x405d30 [fd  -1] Persist Timeout=T+2.5</code><code><br>
        </code><code>  0x405dc0 [fd  -1] Persist Timeout=T+1</code><code><br>
        </code><code>  0x405e50 [fd  -1] Persist Timeout=T+2.5</code><code><br>
        </code><code>  0x406000 [sig 2] Signal Persist</code><code><br>
        </code><code>Active:</code><code><br>
        </code><code>  0x405ee0 [fd  -1, priority=0] Read active</code><code><br>
        </code><code>  0x405f70 [fd  -1, priority=0] Read Write Timeout
          active</code><code><br>
        </code><code>  0x4059d0 [fd  4, priority=0] Read active</code><code><br>
        </code><code>======received</code><code><br>
        </code><code>Inserted events:</code><code><br>
        </code><code>  0x405940 [fd  3] Write</code><code><br>
        </code><code>  0x4059d0 [fd  4] Read Persist
          Timeout=1567793438.756966</code><code><br>
        </code><code>  0x405a60 [fd  5] Write Persist
          Timeout=1567793438.756966</code><code><br>
        </code><code>  0x405af0 [fd  6] Read Timeout=1567793440.256966</code><code><br>
        </code><code>  0x405308 [fd  8] Read Persist Internal</code><code><br>
        </code><code>  0x406000 [sig 2] Signal Persist</code><code><br>
        </code><code>  0x405800 [fd  -1] Internal
          Timeout=1567793438.756966</code><code><br>
        </code><code>  0x4058b0 [fd  -1] Internal
          Timeout=1567793440.256966</code><code><br>
        </code><code>  0x405ca0 [fd  -1] Timeout=1567793438.756966</code><code><br>
        </code><code>  0x405e50 [fd  -1] Persist
          Timeout=1567793440.256966</code><code><br>
        </code><code>  0x405b80 [fd  -1] Timeout=1567793438.756966</code><code><br>
        </code><code>  0x405c10 [fd  -1] Timeout=1567793438.756966</code><code><br>
        </code><code>  0x405dc0 [fd  -1] Persist
          Timeout=1567793438.756966</code><code><br>
        </code><code>  0x405d30 [fd  -1] Persist
          Timeout=1567793440.256966</code><code><br>
        </code><code>Active events:</code><code><br>
        </code><code>  0x4059d0 [fd  4, priority=0] Read active</code><code><br>
        </code><code>  0x405ee0 [fd  -1, priority=0] Read active</code><code><br>
        </code><code>  0x405f70 [fd  -1, priority=0] Read Write Timeout
          active</code><code><br>
        </code><code>read_cb: read 12</code><code><br>
        </code><code>read_cb: read 0 - means EOF</code><code><br>
        </code><code>waiting for 30 conns</code><code><br>
        </code><code>Average group read bucket level: 0.000000</code><code><br>
        </code><code>Average group write bucket level: 0.000000</code><code><br>
        </code><code>1: 683014.200000 per second</code><code><br>
        </code><code>2: 4389273.600000 per second</code><code><br>
        </code><code>3: 683014.200000 per second</code><code><br>
        </code><code>4: 687929.400000 per second</code><code><br>
        </code><code>5: 683014.200000 per second</code><code><br>
        </code><code>6: 592950.200000 per second</code><code><br>
        </code><code>7: 683014.200000 per second</code><code><br>
        </code><code>8: 687929.400000 per second</code><code><br>
        </code><code>9: 1433587.200000 per second</code><code><br>
        </code><code>10: 17691353.400000 per second</code><code><br>
        </code><code>11: 1433590.400000 per second</code><code><br>
        </code><code>12: 17667606.200000 per second</code><code><br>
        </code><code>13: 1202576.000000 per second</code><code><br>
        </code><code>14: 592950.200000 per second</code><code><br>
        </code><code>15: 592950.200000 per second</code><code><br>
        </code><code>16: 17667606.200000 per second</code><code><br>
        </code><code>17: 1199100.600000 per second</code><code><br>
        </code><code>18: 16940233.600000 per second</code><code><br>
        </code><code>19: 1402460.800000 per second</code><code><br>
        </code><code>20: 17667606.200000 per second</code><code><br>
        </code><code>21: 17670063.800000 per second</code><code><br>
        </code><code>22: 592950.200000 per second</code><code><br>
        </code><code>23: 592950.200000 per second</code><code><br>
        </code><code>24: 17667606.200000 per second</code><code><br>
        </code><code>25: 17670063.800000 per second</code><code><br>
        </code><code>26: 17667606.200000 per second</code><code><br>
        </code><code>27: 17699551.800000 per second</code><code><br>
        </code><code>28: 17697907.000000 per second</code><code><br>
        </code><code>29: 17699551.800000 per second</code><code><br>
        </code><code>30: 1216486.400000 per second</code><code><br>
        </code><code>   total: 230756497.800000 per second</code><code><br>
        </code><code> average: 7691883.260000 per second</code><code><br>
        </code><code>  stddev: 8132709.287741 per second</code><code><br>
        </code><code>209005, 20000</code><code><br>
        </code><code>write_cb: write 12</code><code><br>
        </code><code>write_cb: write -1</code></p>
      <p>At least some of the libevent test scripts output only this
        content (i.e. they don't run any of the PASS/FAIL/SKIP tests),
        so I'll look into dropping those from the ptest unless there's a
        reason we'd want to leave them in. <br>
        <code></code><code></code><code></code></p>
      <br>
    </blockquote>
    Just determined that only the libevent "regress" test is involved in
    the PASS/FAIL tests of interest. I'll submit a v3 on Monday.<br>
  </body>
</html>

--------------EEDB3B9AE5B2DD3203F611C9--
