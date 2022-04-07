Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BA4C352A1
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from radex-web.radex.nl (radex-web.radex.nl [178.250.146.7])
 by mx.groups.io with SMTP id smtpd.web09.4823.1649325548628668487
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 02:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 178.250.146.7, mailfrom: fntoth@gmail.com)
Received: from [192.168.1.35] (cust-178-250-146-69.breedbanddelft.nl
 [178.250.146.69])
	by radex-web.radex.nl (Postfix) with ESMTPS id E3FF32406A;
	Thu,  7 Apr 2022 11:59:06 +0200 (CEST)
Message-ID: <ee66f2ee-f56e-43c9-1dc5-4500f2eb4ae1@gmail.com>
Date: Thu, 7 Apr 2022 11:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] apt: add apt selftest to test signed package feeds
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Xavier Berger <xavier.berger@bio-logic.net>,
 Alexander Kanavin <alex@linutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20220403195046.7060-1-fntoth@gmail.com>
 <20220403195046.7060-5-fntoth@gmail.com>
 <694f4b0519a5365015c7eb561767b27f3a07e975.camel@linuxfoundation.org>
 <369e2108-34a9-dbfc-eb09-817a1eee4604@gmail.com>
 <add235b4921d1a7e7e87ea718624904c1f7b6af2.camel@linuxfoundation.org>
 <9c8771c5-1b2a-0d6f-0658-ba08dd9ad5fa@gmail.com>
 <afcc7bdc350eff203b217e8fb1c542bb1a5c2a9d.camel@linuxfoundation.org>
 <c0325b11-7db5-2a1e-9da8-edcc6abfc2a6@gmail.com>
 <e0610002c53395add39f8f041a23d26830791d62.camel@linuxfoundation.org>
 <7f28c93e-f349-8931-d18a-51178a1e9779@gmail.com>
 <8e947ab1f537a11382caec901c88e7ce66822fe4.camel@linuxfoundation.org>
From: Ferry Toth <fntoth@gmail.com>
In-Reply-To: 
 <8e947ab1f537a11382caec901c88e7ce66822fe4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164104


Op 06-04-2022 om 23:05 schreef Richard Purdie:
> On Wed, 2022-04-06 at 21:44 +0200, Ferry Toth wrote:
>> Hi
>>
>> Op 06-04-2022 om 17:23 schreef Richard Purdie:
>>> On Wed, 2022-04-06 at 16:43 +0200, Ferry Toth wrote:
>>>> Op 06-04-2022 om 13:40 schreef Richard Purdie:
>>>>> On Tue, 2022-04-05 at 17:23 +0200, Ferry Toth wrote:
>>>>>> Op 04-04-2022 om 22:39 schreef Richard Purdie:
>>>>>>   =C2=A0On Mon, 2022-04-04 at 19:35 +0200, Ferry Toth wrote:
>>>>>>>   =C2=A0Op 04-04-2022 om 15:58 schreef Richard Purdie:
>>>>>>>>> On Sun, 2022-04-03 at 21:50 +0200, Ferry Toth wrote:
>>>>>>>>> Looking at the patches I wondered if this would break testimage=
 and
>>>>>>>>> unfortunately it does:
>>>>>>>>>
>>>>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/buil=
ds/50
>>>>>>>>> 13/s
>>>>>>>>> teps/12/logs/stdio
>>>>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/buil=
ds/49
>>>>>>>>> 75
>>>>>>>> That is weird, do I understand correctly that it fails on:
>>>>>>>>   =C2=A0=C2=A0apt-get remove --yes run-postinsts-dev
>>>>>>>> Reading package lists...
>>>>>>>> Building dependency tree...
>>>>>>>> E: Unable to locate package run-postinsts-dev
>>>>>>>>
>>>>>>>> That is actually *) one line I didn't touch. I did note while te=
sting
>>>>>>>> that I saw this exact message, however that was not counted as a=
 fail.
>>>>>>>>
>>>>>>>> What could cause this? Because the complaint is it can't remove =
the
>>>>>>>> package because it was not installed.
>>>>>>>>
>>>>>>>> It would be trivial to remove the line
>>>>>>>>
>>>>>>>> *) self.pkg('remove --yes run-postinsts-dev')
>>>>>>>>
>>>>>>>> but how could it have passed the test before?
>>>>>>> I think the issue is you edited testimage which is a different se=
t of
>>>>>>> tests
>>>>>>> which aren't just called by oe-selftest but by things like
>>>>>> That would be my first thought too, but...
>>>>>> because the failure seems to be on the line self.pkg('remove --yes=
 run-
>>>>>> postinsts-dev'),=C2=A0 that would mean the line self.pkg('update')=
 passed.
>>>>>> And that should only pass if it finds a signed repository and has =
the key
>>>>>> installed (and believe me, I saw a log of that in the last week).
>>>>>> So, there may be a second thing wrong?
>>>>> I was easily able to reproduce this locally and it shows the
>>>>> setup_source_config_for_package_install() step fails and hence the =
sources
>>>>> aren't setup correctly, hence the update probably works.
>>>>   =C2=A0not correct, hence works. You lost me here, but I'll try to =
reproduce.
>>> I mean the command doesn't work correctly. In my local logs I see:
>>>
>>> DEBUG: Command: cd /etc/apt/; cp sources.list sources.list.bak; sed -=
i 's/\[trusted=3Dyes\] http:\/\/bogus_ip:bogus_port/http:\/\/192.168.7.1:=
46599/g' sources.list
>>> Status: 1 Output:  cp: can't stat 'sources.list': No such file or dir=
ectory
>>> sed: sources.list: No such file or directory
>>>
>>>>   =20
>>>>> go in and find/share them. The issue does locally reproduce for me =
with a
>>>>> "bitbake core-image-sato -c testimage" with package_deb set as the =
backend.
>>>> ..in conf. But without PACKAGE_CLASSES, PACKAGE_FEED_GPG_NAME,
>>>> PACKAGE_FEED_GPG_PASSPHRASE_FILE?
>>> Yes.
>>>
>>>>>> Yes, regardless the above, we need to either make signing always e=
nabled
>>>>>> in
>>>>>> all test cases or detect whether signing is used.
>>>>>> Do you have a hint if there is a variable to test in class AptRepo=
Test if
>>>>>> PACKAGE_FEED_GPG_NAME has been set?
>>>>>> Otherwise I could just duplicate code and create
>>>>>> apt.AptRepoTest.test_apt_install_from_repo_signed.
>>>>>> What would you prefer?
>>>>>>
>>>>> We should be able to test self.tc.td.get('PACKAGE_FEED_GPG_NAME') i=
n the
>>>>> test
>>>>> and handle accordingly?
I'll try this for autodetecting the test case.
>>>>>
>>>>> I did merge the base changes into the release since I thought it wa=
s fair to
>>>>> get
>>>>> the fixes in before it was built. We just need to get the test sort=
ed now, I
>>>>> think it is close.
>>>> Thanks for merging.
>>>> I'll fix the test, that's only fair.
>>>> One thing, the test "test_testimage_apt" is new. It needs to be sche=
duled
>>>> somewhere (where "test_testimage_dnf" is called i guess), I didn't a=
dd that.
>>>> Is that correct?
>>>>   =20
>>> No, the autobuilder runs all the tests in oe-selftest so it should be=
 covered
>>> (and is why we saw the failures on the autobuilder).
>> I was running 'oe-selftest -K -r
>> runtime_test.TestImage.test_testimage_apt' whereas buildbot seems to b=
e
>> running 'apt.AptRepoTest.test_apt_install_from_repo' directly.
> We have several types of test. There are two types in play here,
>
> "oe-selftest -K -r runtime_test.TestImage.test_testimage_apt"
>
> and
>
> "bitbake core-image-sato -c testimage"

Thanks for the explanation. Yesterday evening I built Sato and was able=20
to reproduce=C2=A0 the issue.

(that was a big build with half of build time spent on building Rust).

core-image-sato does not have a /etc/apt/sources.list, the selftest publi=
c key is not on the image and gpg is not installed. This explains the err=
ors in the log.

> The latter testimage tests are often run every time we create images an=
d running
> testimage will trigger 'apt.AptRepoTest.test_apt_install_from_repo' if =
the image
> has apt present and is built using debian package management.
>
> We also run oe-selftest which triggers a testimage of it's own for a sp=
ecfic
> test case.
Got it.
> So we'd expect the normal testimage calls to not have the package signi=
ng
> enabled and then we'd have the oe-selftest which specifically tests sig=
ning.
>
>> However, test_testimage_apt is where keys are setup (keys found in
>> meta-selftest). So, where/when is test_testimage_apt called (or
>> test_testimage_dnf for that matter)?
> Those are called by the oe-selftest call on the autobuilder. We run the=
 oe-
> selftest with a mask on the autobuilder so pretty much all of them run.
After looking at more detail at autobuilder schedules I get it.
> Cheers,
>
> Richard
>
>

