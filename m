Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAF1CD494D
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 05:12:46 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.9326.1695273163182614781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 22:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C5HpbTyY;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c00e1d4c08so8255771fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695273161; x=1695877961; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5WOkA8dAHQTPnbzIxD2Lhz1/6Cf3oojodbci2nMIdvk=;
        b=C5HpbTyYch96B3TkLvlrMQfe1KhNc2ecNBqZTseuasD0+yvhlhXRmcHroI6+Ub9wH5
         L3ZD90cWl3bLx/VoWTyanmKQDvzzVEHbePE/o/a4trbXHMBVqXbJ2wq2tV6CO2CTKOmh
         +6VH4AMvYYCkTnCt67fZHxF6P5d7v+JhuhrB3nVOXVwIpMs1agNbUbFqxDebqnh5dUOh
         zj1WNRhBnn5CSOwCd+sTQvk8VpIRjk01kyVQQ9d5kj65YEnb4LLFMYosMNsKdfqZNNeT
         qy/IMkpFBsL203r5dhiwW5JHFtsRzOrnsUlbvev/toUbWI/tmlPDFLgWl1lb+qVurJm3
         ILfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695273161; x=1695877961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WOkA8dAHQTPnbzIxD2Lhz1/6Cf3oojodbci2nMIdvk=;
        b=oFZat4lkh4A0GPbvMmmLhlaWMC5Heb0/BfCnYMXXNzGqHMeyaCfX7i+R3aXPAqtxt2
         8s14303dLCW42nhPbY07cpCLGBycZauLspfxjJ2ib9iegeYDEOn1wTlTpYwp2HVat/Zv
         vA3M0wa7fG1sYiEmslsUsXGYPlU/4+Obt+Tyk2sbnrpIRqmoJW7/6/vHWxfSxCJO3rp4
         aemgvjPRMuqnO1ratJ/LJpeUoW4GO3r/RAA2R5dDTOQMSJYRAqcmRY6K2y8DV2KDOFI3
         E//Yt1J3uaOMCER4xOAWyiNt25W9yIRKX02qGtaDX9tdQNdEJyBEfyFoZi6wKLCNmFLz
         NBIA==
X-Gm-Message-State: AOJu0Yy5Dnc+0m7liVmykwUhvJIGVm0YlvJKpN/Z+OjzxlikFfjj3sfv
	26F3Eb73EBvhgJDquyjYGcqYggUiBewapK0Ge/Q=
X-Google-Smtp-Source: AGHT+IFj1Msnr9++AVCgeXJmCoReni4iqKXPB9J0MylkmVfaGW3dUoWFENQiARqvhx+BXnSxuvYzLjDjZYx03Sykblo=
X-Received: by 2002:a2e:6a09:0:b0:2c0:1c32:b4e1 with SMTP id
 f9-20020a2e6a09000000b002c01c32b4e1mr3726655ljc.27.1695273160780; Wed, 20 Sep
 2023 22:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230918015735.391442-1-robert.joslyn@redrectangle.org>
 <a91ac1e923426bcd1848a54f8aeec34155ffa13a.camel@linuxfoundation.org>
 <919339d4-a7cf-44b1-952e-d37cdd972075@redrectangle.org> <c9df2926bf3f14a8f89eefe110171b500a8e85c3.camel@linuxfoundation.org>
 <27cb51c4-b2f5-42bf-b9d4-b951300be586@redrectangle.org> <8020b725b64f722d6eded90a5b92b38c758da0c9.camel@linuxfoundation.org>
 <8ceb1c53-6a41-4c8e-88a7-ec8e190542fb@redrectangle.org>
In-Reply-To: <8ceb1c53-6a41-4c8e-88a7-ec8e190542fb@redrectangle.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Sep 2023 07:12:29 +0200
Message-ID: <CANNYZj-JEaB0ui+f0=NT4-7_hu0UL0EDb0YzNQ0KFXGJWr+zRw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] curl: Update from 8.2.1 to 8.3.0
To: robert.joslyn@redrectangle.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 05:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187970

I applied the patch on current poky master with default config
(a83a16b7939e066b6686b62ae7ec66f12ef34f1e) and ran the tests locally:

root@qemux86-64:/usr/lib/curl/ptest/tests# ./runtests.pl -a -n -j4


The failure I am getting is:

test 1964...[HTTP AWS_SIGV4 with one provider and auth cred via URL,
but X-Xxx-Date header set manually]

 1964: protocol FAILED!
 There was no content at all in the file log/3/server.input.
 Server glitch? Total curl failure? Returned: 48

So you should be able to reproduce this. Did you rebase on my curl
changes that landed in master recently?

Alex

On Thu, 21 Sept 2023 at 05:13, Robert Joslyn via
lists.openembedded.org
<robert.joslyn=redrectangle.org@lists.openembedded.org> wrote:
>
> On 9/20/23 3:20 PM, Richard Purdie wrote:
> > On Wed, 2023-09-20 at 14:50 -0700, Robert Joslyn wrote:
> >> On 9/19/23 5:54 AM, Richard Purdie wrote:
> >>> On Tue, 2023-09-19 at 05:40 -0700, Robert Joslyn wrote:
> >>>> On 9/18/23 4:59 AM, Richard Purdie wrote:
> >>>>> On Sun, 2023-09-17 at 18:57 -0700, Robert Joslyn via
> >>>>> lists.openembedded.org wrote:
> >>>>>> NSS support was removed, so adjust PACKAGECONFIG options.
> >>>>>>
> >>>>>> The --enable-crypto-auth option was removed and split into separate
> >>>>>> options for basic-auth, bearer-auth, digest-auth, kerberos-auth,
> >>>>>> negotiate-auth, and aws. Enable basic, bearer, digest, and negotiate by
> >>>>>> default as these are probably the most common.
> >>>>>>
> >>>>>> Disable test 1279 since this requires libcurl and hangs the tests.
> >>>>>>
> >>>>>> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> >>>>>> ---
> >>>>>>     meta/recipes-support/curl/curl/disable-tests       |  1 +
> >>>>>>     .../curl/{curl_8.2.1.bb => curl_8.3.0.bb}          | 14 +++++++++-----
> >>>>>>     2 files changed, 10 insertions(+), 5 deletions(-)
> >>>>>>     rename meta/recipes-support/curl/{curl_8.2.1.bb => curl_8.3.0.bb} (88%)
> >>>>>>
> >>>>>> diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-support/curl/curl/disable-tests
> >>>>>> index b687b2bb76..fdac795662 100644
> >>>>>> --- a/meta/recipes-support/curl/curl/disable-tests
> >>>>>> +++ b/meta/recipes-support/curl/curl/disable-tests
> >>>>>> @@ -21,6 +21,7 @@
> >>>>>>     # This test is scanning the source tree
> >>>>>>     1222
> >>>>>>     # These CRL tests need --libcurl option to be enabled
> >>>>>> +1279
> >>>>>>     1400
> >>>>>>     1401
> >>>>>>     1402
> >>>>> Thanks for the patch. Unfortunately there were warnings generated on
> >>>>> the autobuilder test run for this:
> >>>>>
> >>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5452
> >>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5631
> >>>> I'm not very familiar with the autobuilder infrastructure, but it looks
> >>>> to be running something like "bitbake core-image-ptest-curl -c
> >>>> testimage". When I run this, I do get a warning:
> >>>>
> >>>> WARNING: core-image-ptest-curl-1.0-r0 do_testimage: There were failing
> >>>> ptests.
> >>> Running with -v might help show a touch more information.
> >>>
> >>>> Unfortunately, I don't see any failing tests. When running the tests
> >>>> manually (called runqemu, then ptest-runner curl in the VM) there are
> >>>> some tests that print an error about not finding a library and get
> >>>> skipped. I removed those test cases as well, but I still get the warning
> >>>> about failing ptests.
> >>>>
> >>>> What's the ptest code looking for to trigger a test failure? I should
> >>>> have some more time to look at this later today, I'm probably just
> >>>> missing something obvious.
> >>> Commands like:
> >>>
> >>> resulttool report ./tmp/log/oeqa/
> >>>
> >>> resulttool log --dump-ptest ./output-logs ./tmp/log/oeqa/
> >>>
> >>> Might help amd/or have a look at the testimage log in core-image-ptest-
> >>> curl's WORKDIR/temp/log.do_testimage
> >>>
> >>>
> >>> Cheers,
> >>>
> >>> Richard
> >>>
> >> In running this a few times, on my machine it's not curl but other tests
> >> that fail. The autobuilder output only showed a curl failure, so I'm not
> >> sure what's different in my environment. This is what resulttool shows:
> >>
> >> s.robert@hezmana ~/yocto/poky-master/build $ resulttool report
> >> ./tmp/log/oeqa/
> >> ==============================================================================================================
> >> Test Result Status Summary (Counts/Percentages sorted by testseries, ID)
> >> ==============================================================================================================
> >> --------------------------------------------------------------------------------------------------------------
> >> Test Series | ID                                                      |
> >> Passed     | Failed | Skipped
> >> --------------------------------------------------------------------------------------------------------------
> >> oeqa | runtime_core-image-ptest-curl_qemux86-64_20230920012443 | 4725
> >> (91%) | 7 (0%) | 448 (9%)
> >> --------------------------------------------------------------------------------------------------------------
> >> Total | 1 | 4725       | 7      | 448
> >> --------------------------------------------------------------------------------------------------------------
> >>
> >> ==============================================================================================================
> >> qemux86-64 PTest Result Summary
> >> ==============================================================================================================
> >> --------------------------------------------------------------------------------------------------------------
> >> Recipe     | Passed     | Failed | Skipped  | Time(s)
> >> --------------------------------------------------------------------------------------------------------------
> >> attr       | 2          | 0      | 0        | 0
> >> bash       | 78         | 5      | 0        | 107
> >> busybox    | 619        | 0      | 88       | 7
> >> curl       | 847        | 0      | 0        | 188
> >> openssh    | 81         | 0      | 1        | 712
> >> openssl    | 0          | 0      | 0        | 0
> >> perl       | 2570       | 1      | 192      | 549
> >> util-linux | 524        | 1      | 166      | 36
> >> zlib       | 1          | 0      | 0        | 0
> >> --------------------------------------------------------------------------------------------------------------
> >>
> >>
> >>
> >>
> >>
> >> ==============================================================================================================
> >> Failed test cases (sorted by testseries, ID)
> >> ==============================================================================================================
> >> --------------------------------------------------------------------------------------------------------------
> >> testseries | result_id : oeqa |
> >> runtime_core-image-ptest-curl_qemux86-64_20230920012443
> >>       ptestresult.bash.run-array
> >>       ptestresult.bash.run-execscript
> >>       ptestresult.bash.run-intl
> >>       ptestresult.bash.run-read
> >>       ptestresult.bash.run-shopt
> >>       ptestresult.perl.cpan/ExtUtils-Constant/t/Constant
> >>       ptestresult.util-linux.mount:_complex
> >> --------------------------------------------------------------------------------------------------------------
> >>
> >>
> >> I posted the output from a manual ptest-runner call here:
> >>
> >> https://gist.github.com/bobolopolis/e02401a87d1d6b2f48ca2d70998f13c1
> > If you delete or move tmp/log/oeqa/ out the way, you effectively reset
> > the state so if you do that, then just run the curl ptest the result
> > should be clearer.
> >
> > I did go back and look up the autobuilder failure and tried to dig up
> > more logs:
> >
> > http://autobuilder.yocto.io/pub/non-release/20230918-9/testresults/qemux86-64-ptest/curl.log
> > http://autobuilder.yocto.io/pub/non-release/20230918-9/testresults/qemux86-64-ptest/core-image-ptest-curl/log.do_testimage.4047690.20230918105238
> >
> > http://autobuilder.yocto.io/pub/non-release/20230918-9/testresults/qemuarm64-ptest/curl.log
> > http://autobuilder.yocto.io/pub/non-release/20230918-9/testresults/qemuarm64-ptest/core-image-ptest-curl/log.do_testimage.59151.20230918103439
> >
> > so it was test 1964 that failed in both cases. I know know why though
> > :/
> >
> > Cheers,
> >
> > Richard
>
> Interestingly, that test gets skipped for me (on both x86-64 and arm64):
>
> test 1964... 1964: IGNORED: The tool set in the test case for this:
> 'lib1964' does not exist
>
> That test looks related to the aws authentication feature that is
> disabled via PACKAGECONFIG and is a new flag in this version. I can send
> an updated patch enabling that to see if it changes anything, although
> I'm still not sure why I see different behavior than the autobuilder.
>
> Thanks,
>
> Robert
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187969): https://lists.openembedded.org/g/openembedded-core/message/187969
> Mute This Topic: https://lists.openembedded.org/mt/101426058/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

