Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAA8CD4941
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 03:13:51 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web10.8172.1695266030909250190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 20:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=UQ2dbTsB;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id 843261B8C;
	Thu, 21 Sep 2023 05:13:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695266028;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	l=8305; bh=G99XCS18Tw0Omv+aEahgdnykrRn7aJG+HCgtYaULbkA=;
	b=UQ2dbTsB4mFshLbXFcTZMAvV+tM50VRAEMg5Gf4ACdeBTQl9CxawD09K85tbPRZY
	wFjYKJnlGJ7rdxEBP0AKEP0hzKDDFh4bs6Iitpzh9SuIdN5i4zVnjs45u760RUQQ+HM
	+RScUj71NV9Zl4Gi+zoLhXsjMUllma8CzhLFaWPLpH9zY6jjV0fjk5jDRv2/jy/HX9N
	8Fj4iNqmaSD8inDnwONT1liKPfLIoLLU7gOj2d0pphQi0Tsuypy+m85FVOCxbAZW9aI
	pijSKx4rpOmZQ9ZEoB9t4YIrCTHptu97j0Ht0UnyJyCEuWKgDsD3WCGm1G1N56o31Ob
	gmW0RLNuJA==
Received: by smtp.mailfence.com with ESMTPSA ; Thu, 21 Sep 2023 05:13:43 +0200 (CEST)
Message-ID: <8ceb1c53-6a41-4c8e-88a7-ec8e190542fb@redrectangle.org>
Date: Wed, 20 Sep 2023 20:13:41 -0700
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
 <27cb51c4-b2f5-42bf-b9d4-b951300be586@redrectangle.org>
 <8020b725b64f722d6eded90a5b92b38c758da0c9.camel@linuxfoundation.org>
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <8020b725b64f722d6eded90a5b92b38c758da0c9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 03:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187969

On 9/20/23 3:20 PM, Richard Purdie wrote:
> On Wed, 2023-09-20 at 14:50 -0700, Robert Joslyn wrote:
>> On 9/19/23 5:54 AM, Richard Purdie wrote:
>>> On Tue, 2023-09-19 at 05:40 -0700, Robert Joslyn wrote:
>>>> On 9/18/23 4:59 AM, Richard Purdie wrote:
>>>>> On Sun, 2023-09-17 at 18:57 -0700, Robert Joslyn via
>>>>> lists.openembedded.org wrote:
>>>>>> NSS support was removed, so adjust PACKAGECONFIG options.
>>>>>>
>>>>>> The --enable-crypto-auth option was removed and split into separat=
e
>>>>>> options for basic-auth, bearer-auth, digest-auth, kerberos-auth,
>>>>>> negotiate-auth, and aws. Enable basic, bearer, digest, and negotia=
te by
>>>>>> default as these are probably the most common.
>>>>>>
>>>>>> Disable test 1279 since this requires libcurl and hangs the tests.
>>>>>>
>>>>>> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
>>>>>> ---
>>>>>>     meta/recipes-support/curl/curl/disable-tests       |  1 +
>>>>>>     .../curl/{curl_8.2.1.bb =3D> curl_8.3.0.bb}          | 14 ++++=
+++++-----
>>>>>>     2 files changed, 10 insertions(+), 5 deletions(-)
>>>>>>     rename meta/recipes-support/curl/{curl_8.2.1.bb =3D> curl_8.3.=
0.bb} (88%)
>>>>>>
>>>>>> diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/r=
ecipes-support/curl/curl/disable-tests
>>>>>> index b687b2bb76..fdac795662 100644
>>>>>> --- a/meta/recipes-support/curl/curl/disable-tests
>>>>>> +++ b/meta/recipes-support/curl/curl/disable-tests
>>>>>> @@ -21,6 +21,7 @@
>>>>>>     # This test is scanning the source tree
>>>>>>     1222
>>>>>>     # These CRL tests need --libcurl option to be enabled
>>>>>> +1279
>>>>>>     1400
>>>>>>     1401
>>>>>>     1402
>>>>> Thanks for the patch. Unfortunately there were warnings generated o=
n
>>>>> the autobuilder test run for this:
>>>>>
>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5=
452
>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5=
631
>>>> I'm not very familiar with the autobuilder infrastructure, but it lo=
oks
>>>> to be running something like "bitbake core-image-ptest-curl -c
>>>> testimage". When I run this, I do get a warning:
>>>>
>>>> WARNING: core-image-ptest-curl-1.0-r0 do_testimage: There were faili=
ng
>>>> ptests.
>>> Running with -v might help show a touch more information.
>>>
>>>> Unfortunately, I don't see any failing tests. When running the tests
>>>> manually (called runqemu, then ptest-runner curl in the VM) there ar=
e
>>>> some tests that print an error about not finding a library and get
>>>> skipped. I removed those test cases as well, but I still get the war=
ning
>>>> about failing ptests.
>>>>
>>>> What's the ptest code looking for to trigger a test failure? I shoul=
d
>>>> have some more time to look at this later today, I'm probably just
>>>> missing something obvious.
>>> Commands like:
>>>
>>> resulttool report ./tmp/log/oeqa/
>>>
>>> resulttool log --dump-ptest ./output-logs ./tmp/log/oeqa/
>>>
>>> Might help amd/or have a look at the testimage log in core-image-ptes=
t-
>>> curl's WORKDIR/temp/log.do_testimage
>>>
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>> In running this a few times, on my machine it's not curl but other tes=
ts
>> that fail. The autobuilder output only showed a curl failure, so I'm n=
ot
>> sure what's different in my environment. This is what resulttool shows=
:
>>
>> s.robert@hezmana ~/yocto/poky-master/build $ resulttool report
>> ./tmp/log/oeqa/
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> Test Result Status Summary (Counts/Percentages sorted by testseries, I=
D)
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ----------------------------------------------------------------------=
----------------------------------------
>> Test Series | ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> Passed=C2=A0=C2=A0=C2=A0=C2=A0 | Failed | Skipped
>> ----------------------------------------------------------------------=
----------------------------------------
>> oeqa | runtime_core-image-ptest-curl_qemux86-64_20230920012443 | 4725
>> (91%) | 7 (0%) | 448 (9%)
>> ----------------------------------------------------------------------=
----------------------------------------
>> Total | 1 | 4725=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 448
>> ----------------------------------------------------------------------=
----------------------------------------
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> qemux86-64 PTest Result Summary
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ----------------------------------------------------------------------=
----------------------------------------
>> Recipe=C2=A0=C2=A0=C2=A0=C2=A0 | Passed=C2=A0=C2=A0=C2=A0=C2=A0 | Fail=
ed | Skipped=C2=A0 | Time(s)
>> ----------------------------------------------------------------------=
----------------------------------------
>> attr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>> bash=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 78=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 107
>> busybox=C2=A0=C2=A0=C2=A0 | 619=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 88=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 7
>> curl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 847=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 188
>> openssh=C2=A0=C2=A0=C2=A0 | 81=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 712
>> openssl=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 0
>> perl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2570=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 192=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 549
>> util-linux | 524=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 166=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 36
>> zlib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>> ----------------------------------------------------------------------=
----------------------------------------
>>
>>
>>
>>
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> Failed test cases (sorted by testseries, ID)
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ----------------------------------------------------------------------=
----------------------------------------
>> testseries | result_id : oeqa |
>> runtime_core-image-ptest-curl_qemux86-64_20230920012443
>>   =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-array
>>   =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-execscript
>>   =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-intl
>>   =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-read
>>   =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-shopt
>>   =C2=A0=C2=A0=C2=A0 ptestresult.perl.cpan/ExtUtils-Constant/t/Constan=
t
>>   =C2=A0=C2=A0=C2=A0 ptestresult.util-linux.mount:_complex
>> ----------------------------------------------------------------------=
----------------------------------------
>>
>>
>> I posted the output from a manual ptest-runner call here:
>>
>> https://gist.github.com/bobolopolis/e02401a87d1d6b2f48ca2d70998f13c1
> If you delete or move tmp/log/oeqa/ out the way, you effectively reset
> the state so if you do that, then just run the curl ptest the result
> should be clearer.
>
> I did go back and look up the autobuilder failure and tried to dig up
> more logs:
>
> http://autobuilder.yocto.io/pub/non-release/20230918-9/testresults/qemu=
x86-64-ptest/curl.log
> http://autobuilder.yocto.io/pub/non-release/20230918-9/testresults/qemu=
x86-64-ptest/core-image-ptest-curl/log.do_testimage.4047690.2023091810523=
8
>
> http://autobuilder.yocto.io/pub/non-release/20230918-9/testresults/qemu=
arm64-ptest/curl.log
> http://autobuilder.yocto.io/pub/non-release/20230918-9/testresults/qemu=
arm64-ptest/core-image-ptest-curl/log.do_testimage.59151.20230918103439
>
> so it was test 1964 that failed in both cases. I know know why though
> :/
>
> Cheers,
>
> Richard

Interestingly, that test gets skipped for me (on both x86-64 and arm64):

test 1964... 1964: IGNORED: The tool set in the test case for this:=20
'lib1964' does not exist

That test looks related to the aws authentication feature that is=20
disabled via PACKAGECONFIG and is a new flag in this version. I can send=20
an updated patch enabling that to see if it changes anything, although=20
I'm still not sure why I see different behavior than the autobuilder.

Thanks,

Robert


