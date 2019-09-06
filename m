Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C557E7F3DD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 18:35:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x86IZw8U006970
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Sep 2019 11:35:58 -0700 (PDT)
Received: from [128.224.56.218] (128.224.56.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 6 Sep 2019 11:35:57 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20190906140443.30110-1-Trevor.Gamblin@windriver.com>
	<d1e5a94c07b6298a2c5d5041de7910e935eea06d.camel@linuxfoundation.org>
	<9f2cad3d-cf89-d9da-025c-ea3e5168b5e2@windriver.com>
	<b61dc3ff2a7e061bf78a2b2c97022e92bf7fff24.camel@linuxfoundation.org>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <3ec34134-04ff-1c66-f65c-b9bc8935a36b@windriver.com>
Date: Fri, 6 Sep 2019 14:35:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b61dc3ff2a7e061bf78a2b2c97022e92bf7fff24.camel@linuxfoundation.org>
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
X-List-Received-Date: Fri, 06 Sep 2019 18:35:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/6/19 11:24 AM, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2019-09-06 at 11:10 -0400, Trevor Gamblin wrote:
>> On 9/6/19 10:26 AM, Richard Purdie wrote:
>>> On Fri, 2019-09-06 at 10:04 -0400, Trevor Gamblin wrote:
>>>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>>>
>>>> The libevent ptest used to report only a global pass or a fail
>>>> result.
>>>> Count individual PASS, FAIL, SKIP results. The SKIP results now
>>>> include tests that are disabled in the libevent code.
>>>>
>>>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>>>> ---
>>>>   .../libevent/libevent/run-ptest               | 34 ++++++++++++-
>>>> ----
>>>> --
>>>>   1 file changed, 22 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-support/libevent/libevent/run-ptest
>>>> b/meta/recipes-support/libevent/libevent/run-ptest
>>>> index 0241851c70..b7d945246f 100644
>>>> --- a/meta/recipes-support/libevent/libevent/run-ptest
>>>> +++ b/meta/recipes-support/libevent/libevent/run-ptest
>>>> @@ -1,18 +1,28 @@
>>>>   #!/bin/sh
>>>>   
>>>> -fail=0
>>>> +# run-ptest - 'ptest' test infrastructure shell script that
>>>> +#   wraps the libevent test scripts
>>>> +#
>>>> +# Trevor Gamblin <trevor.gamblin@windriver.com>
>>>> +###############################################################
>>>> +LIBEVENTLIB=/usr/lib/libevent
>>>> +LOG="${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-
>>>> %H%M%S).log"
>>>> +
>>>> +cd ${LIBEVENTLIB}/ptest
>>>> +
>>>>   for test in ./test/*
>>>>   do
>>>> -	$test
>>>> -	if [ $? -ne 0 ]
>>>> -	then
>>>> -		fail=1
>>>> -	fi
>>>> +    $test 2>&1|tee -a ${LOG}
>>>>   done
>>>>   
>>>> -if [ $fail -eq 0 ]
>>>> -then
>>>> -	echo "PASS: libevent"
>>>> -else
>>>> -	echo "FAIL: libevent"
>>>> -fi
>>>> +passed=`grep OK ${LOG}|wc -l`
>>>> +failed=`grep FAILED ${LOG}|wc -l`
>>>> +skipped=`grep -E 'DISABLED|SKIPPED' ${LOG}|wc -l`
>>>> +all=$((passed + failed + skipped))
>>>> +
>>>> +(   echo "=== Test Summary ==="
>>>> +    echo "TOTAL: ${all}"
>>>> +    echo "PASSED: ${passed}"
>>>> +    echo "FAILED: ${failed}"
>>>> +    echo "SKIPPED: ${skipped}"
>>>> +) | tee -a ${LOG}
>>> Does this work correctly such that ptest-runner picks up the
>>> individual
>>> test pass/fail results? I thought the tests would need individual
>>> pass/fail lines for that to work?
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>> They do have individual pass/fail results in the ptest-runner output,
>> but those don't match up with the pass/fail usually provided by
>> ptest, so the log is parsed for OK/FAILED/SKIPPED/DISABLED and
>> translated. Example output:
>> write_cb: write 12
>> write_cb: write -1
>> === Test Summary ===
>> TOTAL: 316
>> PASSED: 300
>> FAILED: 0
>> SKIPPED: 16
>> DURATION: 87
>> END: /usr/lib/libevent/ptest
>> 2019-09-06T14:50
>> STOP: ptest-runner
>> Compare with the last log from autobuilder (
>> https://autobuilder.yocto.io/pub/non-release/20190829-10/testresults/qemux86-64-ptest/libevent.log
>> ):
>> write_cb: write 12
>> write_cb: write -1
>> FAIL: libevent
>> DURATION: 116
>> I'm working on a v2 to address multilib - I'll add the example output
>> to the commit as well.
> You're missing my point. There are log parsers such as:
>
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/lib/oeqa/utils/logparser.py
>
> The output has to follow the format in:
>
> https://wiki.yoctoproject.org/wiki/Ptest
>
> to quote it:
>
> """
> One major point of ptest is to consolidate the output format of all
> tests into a single common format. The format selected is the automake
> "simple test" format:
>
> result: testname
>
> Where "result" is one of PASS, FAIL or SKIP and "testname" can be any
> identifying string (the same format used by Automake.)
> """
>
> which is why you'll see other run-ptest scripts using sed to add in
> PASS/FAIL/SKIP strings.
Noted - fixing and adding this in for v2.
>
> I think the PASSED/FAILED counts are generated by ptest-runner itself.
I didn't see this in the source. I'll leave the summary in for v2.
>
> Cheers,
>
> Richard
>
>
>

