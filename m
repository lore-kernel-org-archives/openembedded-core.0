Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07A1C2FC08
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 21:50:59 +0000 (UTC)
Received: from mailout-l3b-97.contactoffice.com (mailout-l3b-97.contactoffice.com [212.3.242.97])
 by mx.groups.io with SMTP id smtpd.web11.2312.1695246657702620472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 14:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=VgZeYM6G;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.97, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by mailout-l3b-97.contactoffice.com (Postfix) with ESMTP id 439C21394;
	Wed, 20 Sep 2023 23:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695246655;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	l=6587; bh=ZTcK2jlxWUKi6cWs/8g+Kx2IPXNO6iQehUcPzcoLL8M=;
	b=VgZeYM6G9SFJd44tr09b1+ZiypKAWg/8TEUlZ9dOOuZuOSUBfIHMtGQmYSonQPq5
	znUT17UQx4mZ6Le2INpkejWkWAAabC1z94Jal1mTe+QvLfM5lfJZh5C/pEAGxL372Zm
	LIKqXWKL88gWDN8ieON4flFNjNeMUFhvbsV+HJmrpa81hDkyvzmk08mkDp6PWzDXj3I
	m8ESZXuVgB5nNFCWHN8fExqV0unAmJDJudrnn3G0Ghd2KUNcyZlWQGiuqTB9PCLgr7c
	LWpO2eY+ZTKEsiWcJshMRAl7reY0bq9hOLUCZlVgl/59BD0PpMrZym2v15FBkXv3i/P
	l4A6HdxPsA==
Received: by smtp.mailfence.com with ESMTPSA ; Wed, 20 Sep 2023 23:50:51 +0200 (CEST)
Message-ID: <27cb51c4-b2f5-42bf-b9d4-b951300be586@redrectangle.org>
Date: Wed, 20 Sep 2023 14:50:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] curl: Update from 8.2.1 to 8.3.0
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230918015735.391442-1-robert.joslyn@redrectangle.org>
 <a91ac1e923426bcd1848a54f8aeec34155ffa13a.camel@linuxfoundation.org>
 <919339d4-a7cf-44b1-952e-d37cdd972075@redrectangle.org>
 <c9df2926bf3f14a8f89eefe110171b500a8e85c3.camel@linuxfoundation.org>
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <c9df2926bf3f14a8f89eefe110171b500a8e85c3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 21:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187943

On 9/19/23 5:54 AM, Richard Purdie wrote:
> On Tue, 2023-09-19 at 05:40 -0700, Robert Joslyn wrote:
>> On 9/18/23 4:59 AM, Richard Purdie wrote:
>>> On Sun, 2023-09-17 at 18:57 -0700, Robert Joslyn via
>>> lists.openembedded.org wrote:
>>>> NSS support was removed, so adjust PACKAGECONFIG options.
>>>>
>>>> The --enable-crypto-auth option was removed and split into separate
>>>> options for basic-auth, bearer-auth, digest-auth, kerberos-auth,
>>>> negotiate-auth, and aws. Enable basic, bearer, digest, and negotiate=
 by
>>>> default as these are probably the most common.
>>>>
>>>> Disable test 1279 since this requires libcurl and hangs the tests.
>>>>
>>>> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
>>>> ---
>>>>    meta/recipes-support/curl/curl/disable-tests       |  1 +
>>>>    .../curl/{curl_8.2.1.bb =3D> curl_8.3.0.bb}          | 14 +++++++=
++-----
>>>>    2 files changed, 10 insertions(+), 5 deletions(-)
>>>>    rename meta/recipes-support/curl/{curl_8.2.1.bb =3D> curl_8.3.0.b=
b} (88%)
>>>>
>>>> diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/rec=
ipes-support/curl/curl/disable-tests
>>>> index b687b2bb76..fdac795662 100644
>>>> --- a/meta/recipes-support/curl/curl/disable-tests
>>>> +++ b/meta/recipes-support/curl/curl/disable-tests
>>>> @@ -21,6 +21,7 @@
>>>>    # This test is scanning the source tree
>>>>    1222
>>>>    # These CRL tests need --libcurl option to be enabled
>>>> +1279
>>>>    1400
>>>>    1401
>>>>    1402
>>> Thanks for the patch. Unfortunately there were warnings generated on
>>> the autobuilder test run for this:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/545=
2
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/563=
1
>> I'm not very familiar with the autobuilder infrastructure, but it look=
s
>> to be running something like "bitbake core-image-ptest-curl -c
>> testimage". When I run this, I do get a warning:
>>
>> WARNING: core-image-ptest-curl-1.0-r0 do_testimage: There were failing
>> ptests.
> Running with -v might help show a touch more information.
>
>> Unfortunately, I don't see any failing tests. When running the tests
>> manually (called runqemu, then ptest-runner curl in the VM) there are
>> some tests that print an error about not finding a library and get
>> skipped. I removed those test cases as well, but I still get the warni=
ng
>> about failing ptests.
>>
>> What's the ptest code looking for to trigger a test failure? I should
>> have some more time to look at this later today, I'm probably just
>> missing something obvious.
> Commands like:
>
> resulttool report ./tmp/log/oeqa/
>
> resulttool log --dump-ptest ./output-logs ./tmp/log/oeqa/
>
> Might help amd/or have a look at the testimage log in core-image-ptest-
> curl's WORKDIR/temp/log.do_testimage
>
>
> Cheers,
>
> Richard
>
In running this a few times, on my machine it's not curl but other tests=20
that fail. The autobuilder output only showed a curl failure, so I'm not=20
sure what's different in my environment. This is what resulttool shows:

s.robert@hezmana ~/yocto/poky-master/build $ resulttool report=20
./tmp/log/oeqa/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Test Result Status Summary (Counts/Percentages sorted by testseries, ID)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-------------------------------------------------------------------------=
-------------------------------------
Test Series | ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=20
Passed=C2=A0=C2=A0=C2=A0=C2=A0 | Failed | Skipped
-------------------------------------------------------------------------=
-------------------------------------
oeqa | runtime_core-image-ptest-curl_qemux86-64_20230920012443 | 4725=20
(91%) | 7 (0%) | 448 (9%)
-------------------------------------------------------------------------=
-------------------------------------
Total | 1 | 4725=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 448
-------------------------------------------------------------------------=
-------------------------------------

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
qemux86-64 PTest Result Summary
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-------------------------------------------------------------------------=
-------------------------------------
Recipe=C2=A0=C2=A0=C2=A0=C2=A0 | Passed=C2=A0=C2=A0=C2=A0=C2=A0 | Failed =
| Skipped=C2=A0 | Time(s)
-------------------------------------------------------------------------=
-------------------------------------
attr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
bash=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 78=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 107
busybox=C2=A0=C2=A0=C2=A0 | 619=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 88=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 7
curl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 847=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 188
openssh=C2=A0=C2=A0=C2=A0 | 81=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 712
openssl=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 0
perl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2570=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 192=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 549
util-linux | 524=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 166=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 36
zlib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
-------------------------------------------------------------------------=
-------------------------------------





=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Failed test cases (sorted by testseries, ID)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-------------------------------------------------------------------------=
-------------------------------------
testseries | result_id : oeqa |=20
runtime_core-image-ptest-curl_qemux86-64_20230920012443
 =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-array
 =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-execscript
 =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-intl
 =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-read
 =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-shopt
 =C2=A0=C2=A0=C2=A0 ptestresult.perl.cpan/ExtUtils-Constant/t/Constant
 =C2=A0=C2=A0=C2=A0 ptestresult.util-linux.mount:_complex
-------------------------------------------------------------------------=
-------------------------------------


I posted the output from a manual ptest-runner call here:

https://gist.github.com/bobolopolis/e02401a87d1d6b2f48ca2d70998f13c1


Thanks,

Robert


