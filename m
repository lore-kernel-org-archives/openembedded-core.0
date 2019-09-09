Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D48297BE3C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 13:39:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x89DcvH4005742
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Sep 2019 06:39:07 -0700
Received: from [128.224.56.218] (128.224.56.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 9 Sep 2019 06:38:46 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20190909133549.34399-1-Trevor.Gamblin@windriver.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <7eeff276-592e-ab12-25db-e508714c7595@windriver.com>
Date: Mon, 9 Sep 2019 09:38:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909133549.34399-1-Trevor.Gamblin@windriver.com>
Subject: Re: [PATCH v3] libevent: add granularity to ptest log
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
X-List-Received-Date: Mon, 09 Sep 2019 13:39:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/9/19 9:35 AM, Trevor Gamblin wrote:

> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> The libevent ptest used to report only a global pass or a fail result.
> Count individual PASS, FAIL, SKIP results. The SKIP results now
> include tests that are disabled in the libevent code.
>
> libevent's ptest output did not comply with the automake-style output
> "result: testname", and reported a FAIL status at the end of the test
> run if any of the libevent tests failed. This patch makes the log
> consistent with the automake style:
>
>      PASS: http/cancel_by_host_no_ns
>      PASS: http/cancel_inactive_server
>      PASS: http/cancel_by_host_no_ns_inactive_server
>      SKIP: http/cancel_by_host_server_timeout
>      SKIP: http/cancel_server_timeout
>
> and provides a summary as follows:
>
>      === Test Summary ===
>      TOTAL: 316
>      PASSED: 300
>      FAILED: 0
>      SKIPPED: 16
>      DURATION: 87
>      END: /usr/lib/libevent/ptest
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../libevent/libevent/run-ptest               | 43 ++++++++++++-------
>   .../libevent/libevent_2.1.11.bb               |  3 ++
>   2 files changed, 31 insertions(+), 15 deletions(-)
>
> diff --git a/meta/recipes-support/libevent/libevent/run-ptest b/meta/recipes-support/libevent/libevent/run-ptest
> index 0241851c70..79d6da3ee1 100644
> --- a/meta/recipes-support/libevent/libevent/run-ptest
> +++ b/meta/recipes-support/libevent/libevent/run-ptest
> @@ -1,18 +1,31 @@
>   #!/bin/sh
>   
> -fail=0
> -for test in ./test/*
> -do
> -	$test
> -	if [ $? -ne 0 ]
> -	then
> -		fail=1
> -	fi
> -done
> +# run-ptest - 'ptest' test infrastructure shell script that
> +#   wraps the libevent test scripts
> +#
> +# Trevor Gamblin <trevor.gamblin@windriver.com>
> +###############################################################
> +LIBEVENTLIB=@libdir@/libevent
> +LOG="${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-%H%M%S).log"
>   
> -if [ $fail -eq 0 ]
> -then
> -	echo "PASS: libevent"
> -else
> -	echo "FAIL: libevent"
> -fi
> +cd ${LIBEVENTLIB}/ptest
> +
> +# Run the libevent regress test, but format the pass/fail outputs so
> +# that ptest can count them. Ignore the line containing "tests or
> +# "TESTS" as that line is the libevent total at the end of the test
> +# and is counted as an extra test failure, e.g.
> +# "2/300 TESTS FAILED. (31 skipped)" will be seen as a test failure
> +# rather than a total
> +./test/regress 2>&1| sed -e '/TESTS/d' -e '/tests/d' -e '/OK/ s/^/PASS: / ; /FAILED/ s/^/FAIL: / ; /SKIPPED/ s/^/SKIP: / ; /DISABLED/ s/^/SKIP: /' | cut -f1,2 -d ':' | tee -a ${LOG}
> +
> +passed=`grep PASS ${LOG}|wc -l`
> +failed=`grep FAIL ${LOG}|wc -l`
> +skipped=`grep -E SKIP ${LOG}|wc -l`
> +all=$((passed + failed + skipped))
> +
> +(   echo "=== Test Summary ==="
> +    echo "TOTAL: ${all}"
> +    echo "PASSED: ${passed}"
> +    echo "FAILED: ${failed}"
> +    echo "SKIPPED: ${skipped}"
> +) | tee -a ${LOG}
> diff --git a/meta/recipes-support/libevent/libevent_2.1.11.bb b/meta/recipes-support/libevent/libevent_2.1.11.bb
> index 1e18f0ab2c..f005ab8bda 100644
> --- a/meta/recipes-support/libevent/libevent_2.1.11.bb
> +++ b/meta/recipes-support/libevent/libevent_2.1.11.bb
> @@ -43,4 +43,7 @@ do_install_ptest() {
>   	do
>   		install -m 0755 $file ${D}${PTEST_PATH}/test
>   	done
> +
> +        # handle multilib
> +        sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
>   }
Noticed that the autobuilder results using v2 were detecting libevent's 
"2/300 TESTS FAILED. (31 skipped)" line at the end of the regress test 
as an extra failure. Fixed that up and reduced the ptest to just running 
"regress", as the other scripts in the test folder are more 
performance-oriented and don't provide a pass/fail result that can be used.

