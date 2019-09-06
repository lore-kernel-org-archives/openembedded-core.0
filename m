Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60D937F3EE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 14:10:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x86EA56p027497
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Sep 2019 07:10:05 -0700 (PDT)
Received: from [128.224.56.218] (128.224.56.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 6 Sep 2019 07:10:04 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20190906140443.30110-1-Trevor.Gamblin@windriver.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <ed110ac4-f904-a839-d979-e356addbcefe@windriver.com>
Date: Fri, 6 Sep 2019 10:10:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906140443.30110-1-Trevor.Gamblin@windriver.com>
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
X-List-Received-Date: Fri, 06 Sep 2019 14:10:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Still looking at the root cause of the libevent failures in the 
autobuilder, but this patch will provide more libevent ptest 
pass/fail/skip statistics (instead of reporting a pass only if all 
libevent tests pass), and possibly help determine if the pass rate is 
high enough for M3.

On 9/6/19 10:04 AM, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> The libevent ptest used to report only a global pass or a fail result.
> Count individual PASS, FAIL, SKIP results. The SKIP results now
> include tests that are disabled in the libevent code.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../libevent/libevent/run-ptest               | 34 ++++++++++++-------
>   1 file changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/meta/recipes-support/libevent/libevent/run-ptest b/meta/recipes-support/libevent/libevent/run-ptest
> index 0241851c70..b7d945246f 100644
> --- a/meta/recipes-support/libevent/libevent/run-ptest
> +++ b/meta/recipes-support/libevent/libevent/run-ptest
> @@ -1,18 +1,28 @@
>   #!/bin/sh
>   
> -fail=0
> +# run-ptest - 'ptest' test infrastructure shell script that
> +#   wraps the libevent test scripts
> +#
> +# Trevor Gamblin <trevor.gamblin@windriver.com>
> +###############################################################
> +LIBEVENTLIB=/usr/lib/libevent
> +LOG="${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-%H%M%S).log"
> +
> +cd ${LIBEVENTLIB}/ptest
> +
>   for test in ./test/*
>   do
> -	$test
> -	if [ $? -ne 0 ]
> -	then
> -		fail=1
> -	fi
> +    $test 2>&1|tee -a ${LOG}
>   done
>   
> -if [ $fail -eq 0 ]
> -then
> -	echo "PASS: libevent"
> -else
> -	echo "FAIL: libevent"
> -fi
> +passed=`grep OK ${LOG}|wc -l`
> +failed=`grep FAILED ${LOG}|wc -l`
> +skipped=`grep -E 'DISABLED|SKIPPED' ${LOG}|wc -l`
> +all=$((passed + failed + skipped))
> +
> +(   echo "=== Test Summary ==="
> +    echo "TOTAL: ${all}"
> +    echo "PASSED: ${passed}"
> +    echo "FAILED: ${failed}"
> +    echo "SKIPPED: ${skipped}"
> +) | tee -a ${LOG}

