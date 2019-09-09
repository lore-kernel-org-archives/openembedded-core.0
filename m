Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3EDB87F317
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 15:30:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x89FUD3M008538
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Sep 2019 08:30:43 -0700
Received: from [128.224.56.218] (128.224.56.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 9 Sep 2019 08:30:37 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20190909151620.36435-1-Trevor.Gamblin@windriver.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <8a421175-ab3a-4521-72d7-1c905e4f56c5@windriver.com>
Date: Mon, 9 Sep 2019 11:30:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909151620.36435-1-Trevor.Gamblin@windriver.com>
Subject: Re: [PATCH] libevent: don't treat test stats line as pass/fail in ptest
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
X-List-Received-Date: Mon, 09 Sep 2019 15:30:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/9/19 11:16 AM, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> The libevent "regress" test outputs its own pass/fail results,
> e.g. "2/300 TESTS FAILED. (31 skipped)", which will be
> miscounted as an extra test fail in the ptest log. Fixed this
> to ignore the libevent results line when counting actual
> pass/fail results.
>
> Also removed the for loop in run-ptest and targeted only the
> libevent "regress" test, as the other tests being run were
> related to performance and did not provide a relevant pass/fail
> output.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta/recipes-support/libevent/libevent/run-ptest | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/meta/recipes-support/libevent/libevent/run-ptest b/meta/recipes-support/libevent/libevent/run-ptest
> index 080806dea9..259fe56fe5 100644
> --- a/meta/recipes-support/libevent/libevent/run-ptest
> +++ b/meta/recipes-support/libevent/libevent/run-ptest
> @@ -10,10 +10,7 @@ LOG="${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-%H%M%S).log"
>   
>   cd ${LIBEVENTLIB}/ptest
>   
> -for test in ./test/*
> -do
> -    $test 2>&1| sed -e '/OK/ s/^/PASS: / ; /FAILED/ s/^/FAIL: / ; /SKIPPED/ s/^/SKIP: / ; /DISABLED/ s/^/SKIP: /' | cut -f1,2 -d ':' | tee -a ${LOG}
> -done
> +./test/regress 2>&1| sed -e '/TESTS/d' -e '/tests/d' -e '/OK/ s/^/PASS: / ; /FAILED/ s/^/FAIL: / ; /SKIPPED/ s/^/SKIP: / ; /DISABLED/ s/^/SKIP: /' | cut -f1,2 -d ':' | tee -a ${LOG}
>   
>   passed=`grep PASS ${LOG}|wc -l`
>   failed=`grep FAIL ${LOG}|wc -l`
Forgot to mention in commit message - this is a follow-up to fb17b46e2 
after seeing the autobuilder test results with that commit.

