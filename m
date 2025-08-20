Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B120CCA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 15:44:23 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.20.1755704654481359237
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 08:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q79vJ61O;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb72d5409so3699766b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 08:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755704653; x=1756309453; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0OLZP+hVaNKhqLKdKDBJqZGr594390vp3GuYsYTADY=;
        b=Q79vJ61O+cPr9F3up6qZjG7wYouweM7CmzAr8hU0NsxGXEt5nci/hYdg5w0zXTYkHS
         hyVMh6PXP/CX0Me2S5HWijS4HF6NfZJKTnnbOPReYkm3Ok/ZSSJdgoPg23PVR54E7HtW
         thIKg0BIo7bTNa2nD+RrDfJgHBuMPG0QN8CqwFRHVbMbC28nPR6/jn28w2NttpyKdrXo
         GBzNnq+dFsQRQYFPDSE8jIxn0c3223y5mrV/WMg6JMB0eKyb2zENAw3KO6N3yw8V55e8
         GD4UtqwR7MHa3y6oEVkU5nRnxYrEEtS9VpqwK9Qx+D7CwZhRANlYwgNBbmH/k7LrbSHh
         Bcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755704653; x=1756309453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0OLZP+hVaNKhqLKdKDBJqZGr594390vp3GuYsYTADY=;
        b=Dm+9T2DNQ17G5XJsVyjC2yFPjB90zMv2aFJC2bB181I5YXkT9epzFkbeTu5ZaICQm/
         IeiFPd/43psCzyA8x3fpDV6KJzWaJPS8TwylO57x0qZ9wiijyRrsKxgLd2+gX+n5TIeE
         F09V+XVcGgEJWz3gkuSL5YOTu2sgkLwT5q0TOXR6QCnJiDFkqTPyaG8AtWX64T23OD7+
         1aSAb+pB4vjmnL7yIegUIxZpsx4bHmKvdt0e4DXbm+fESH4HkTso4+RyvVV8qQVRhs+d
         ELouwOme5lv6+EHsuhKcw5a5Tm3dWZwBgAP2C9w2rDrw4vFnq8Mhc5LMkrEJ5LMQv+VP
         Ykuw==
X-Forwarded-Encrypted: i=1; AJvYcCWUy5NKY5QdT7WdHMQbzm0EuVJgj9c0ppA2OmkIJcjlTDl5sXwIhdaSdO4+nktTSojjbDaeRqM8WT5zrZv9BtbqIA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YykrDK7KE57LJTMrGJdQFlcVM4h9uzx/d2VSl+7prwyEFfWe3EK
	UzV76dTWJ2gqDEpScePvU/5gJQii8QdS2fhN2HZ7kiw5r4XN/uogL02T
X-Gm-Gg: ASbGncs5TofxIg17UYJL35W1VoVB7VMkEr1dlkCZ+y0Yguw3cuP8KHbN5oQynou+kOj
	zGlmOBmWNctYuazZM/8Hr4/Of+GPXqTx7Vr8Zaaa8KS+hE2AjPDaBREyMDxDbj0ZeZao3NDS4Xh
	2UmRrk5Bl63AZOhYGdmphFmsC8qQEdYcbnNLEZ7DaKbmTvaAzBuwv1tIBuAHWEO9AmWQBP8PS21
	uwxlpiFALgtinWnwL2T9bxp2HXhbbHUcxX3BpU+dbrXCtH2L4LlQBNuniwX9AJRB/0cZieQf/EY
	ad7wn/4YHoLOleOge6jM9Y+WdmZzYWqd4miaeKAXtzq7Ii9jfizsB2SLwZlEMPVxdCh+qIRSsjM
	MVd6w++IP2C30L9enYth+uOZWVcloIvAMPI8I+IblTA==
X-Google-Smtp-Source: AGHT+IFSxl+2naNQ7BoMl8dZC1yyidoIZ/p49rz0GT19ej4kIHfUSsNBrmSePTtHnh25XmbQCSBtuw==
X-Received: by 2002:a17:907:6ea7:b0:af9:a486:412e with SMTP id a640c23a62f3a-afdf00b74f9mr309824266b.26.1755704652397;
        Wed, 20 Aug 2025 08:44:12 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded4790c9sm196532166b.66.2025.08.20.08.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 08:44:11 -0700 (PDT)
Message-ID: <55bcdde7-a098-4085-b1df-ec3cf372279e@gmail.com>
Date: Wed, 20 Aug 2025 17:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race
 issue
To: Tony Rex <tony.rex@ericsson.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250814172348.3882586-1-tony.rex@ericsson.com>
 <DC2W6ED7YCUS.1V4VLCIHMFF17@bootlin.com>
 <PAXPR07MB8470CECE924BE2127902BAF3E434A@PAXPR07MB8470.eurprd07.prod.outlook.com>
 <CANNYZj_DaekmJt8W1g-nc+QsB7TnY-yyWwmGSR_GOYRORLhRCw@mail.gmail.com>
 <PAXPR07MB847086B08E52F2405CB530B3E430A@PAXPR07MB8470.eurprd07.prod.outlook.com>
 <2583ed72-5988-4d0c-8403-eab3eac4bcac@gmail.com>
 <DB9PR07MB847431FEA99FEA8D6225C062E433A@DB9PR07MB8474.eurprd07.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DB9PR07MB847431FEA99FEA8D6225C062E433A@DB9PR07MB8474.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 15:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222190

On 8/20/25 13:53, Tony Rex wrote:
> It was introduced by this commit:
> https://git.yoctoproject.org/poky/commit/?id=ebfa1700f41b3411aec040144605166c35b8dd14
>
> Maybe "not allowed" is a strong wording, but that was how I interpreted it. Sorry, my bad if I misinterpreted it.

In my understanding (which could be wrong), this is more to avoid
working on a repository, where the exact work-revision can't be
determined. But in your example, it can be determined, if your patch is
not applied.

Some extra ramblings, which may or may not be unadulterated garbage from
me: Your initial commit message mentioned an expansion error. I looked
into that a bit, and is it possible that the repository that is causing
this issue has some access rate limit? The only thing that can fail
sometimes in that code path seems to be "git ls-remote".

Now, when I noticed this, I compiled a git version for myself that
randomly throws an error with "git ls-remote" command, and when I used
it with bitbake, I got this:

ERROR: ExpansionError during parsing
/home/meee/stuff/ptest-images/poky/meta/recipes-core/ell/mytest_get.bb
bb.data_smart.ExpansionError: Failure expanding variable
fetcher_hashes_dummyfunc[vardepvalue], expression was
<etc etc etc>

Is this the same error you got?

>
> Tony
>
> -----Original Message-----
> From: Gyorgy Sarvari <skandigraun@gmail.com>
> Sent: Wednesday, 20 August 2025 12:18
> To: Tony Rex <tony.rex@ericsson.com>; Alexander Kanavin <alex.kanavin@gmail.com>
> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race issue
>
> [You don't often get email from skandigraun@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On 8/19/25 23:10, Tony Rex via lists.openembedded.org wrote:
>> Hi Alex and Mathieu!
>>
>> Ok, so the patch fixes a bug and then the floating tag/branch function is in place again.
>> The floating tag/branch function is broken due to the bug and the patch fixes it.
>>
>> The mail from Mathieu below might not fully reflect the issue here, since it seems to create a recipe with the help of devtool.
>>
>> To verify:
>> 1. add layers/oe-core/meta-selftest to conf/bblayers.conf 2. run
>> bitbake gitrepotest -c fetch
>> result:
>> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
>> 3. run bitbake gitrepotest -c cleanall 4. edit
>> ../layers/oe-core/meta-selftest/recipes-test/gitrepotest/gitrepotest.b
>> b
>> add tag=2.12 in SRC_URI
>> SRC_URI =
>> "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;tag=2.1
>> 2;protocol=https \ and comment out SRCREV #SRCREV = "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
>> 5. run bitbake gitrepotest -c fetch
>> result:
>> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
>> The fetch goes through although this is not allowed according to the floating tag/branch error statement if not d.getVar("__BBSRCREV_SEEN"): in git.py.
> Could you point to a commit/email/etc about this "no floating tags allowed" statement? AFAIK tags without specifying revision is allowed and supported. Not recommended, due to mandatory network access, and because git tags are not immutable, but I'm surprised to hear that they are not supposed to work (which of course can also mean that I just missed a memo)
>
>> 6. run bitbake gitrepotest -c cleanall 7. apply patch
>> 0001-base.bbclass-Fix-the-recipe-parsing-race-issue.patch
>> 8. run bitbake gitrepotest -c fetch
>> result:
>> ERROR: gitrepotest-1.0-r0 do_fetch: Bitbake Fetcher Error:
>> FetchError("Recipe uses a floating tag/branch '2.12' for repo
>> 'git.yoctoproject.org/git/matchbox-panel-2' without a fixed SRCREV yet
>> doesn't call bb.fetch2.get_srcrev() (use SRCPV in PV for OE).", None)
>> ERROR: Logfile of failure stored in:
>> .../build/tmp-glibc/work/cortexa53-wrs-linux/gitrepotest/1.0/temp/log.
>> do_fetch.1254999
>> ERROR: Task (.../layers/oe-core/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb:do_fetch) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
>>
>> Error is the expected result when only having a tag set.
>>
>> Tony
>>
>> -----Original Message-----
>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>> Sent: Tuesday, 19 August 2025 10:53
>> To: Tony Rex <tony.rex@ericsson.com>
>> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe
>> parsing race issue
>>
>> [You don't often get email from alex.kanavin@gmail.com. Learn why this
>> is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> You need to make things a little bit easier for maintainers and try to save their time.
>>
>> I would suggest that you provide clear steps to observe the issue.
>> Attach the recipe file that would demonstrate the issue, and provide clear steps to trigger it. What is confusing right now is that you say here's a recipe that builds ok, but then you 'apply the patch' and then there's some kind of failure. So which patch needs to be applied?
>>
>> Alex
>>
>> On Fri, 15 Aug 2025 at 17:29, Tony Rex via lists.openembedded.org <tony.rex=ericsson.com@lists.openembedded.org> wrote:
>>> Hi Mathieu!
>>>
>>> I think that this is how it is intended to work, bitbake does not allow floating tag/branch anymore.
>>> Please correct me if I'm wrong @Richard Purdie (who implemented this
>>> for security reasons I think.)
>>>
>>> The patch that I have makes sure that the parsing and setting of the
>>> variables in the recipe are done before executing the do_fetch command, and as a side effect the floating tag/branch protection is working as intended again.
>>>
>>> How does the recipe look like?
>>> devtool add kernel-module-hello-world https://git/.
>>> yoctoproject.org%2Fgit%2Fkernel-module-hello-world&data=05%7C02%7Cton
>>> y
>>> .rex%40ericsson.com%7Cde1ae2aceeda470b381608dddefdd730%7C92e84cebfbfd
>>> 4
>>> 7abbe52080c6b87953f%7C0%7C0%7C638911904005151487%7CUnknown%7CTWFpbGZs
>>> b
>>> 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIj
>>> o
>>> iTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=jyCicRQT%2FLtb1YxiFHKgw5
>>> B
>>> nNktN4t9IciiyxtsEwO4%3D&reserved=0
>>> The one I get looks like this:
>>>
>>> cat
>>> build/workspace/recipes/kernel-module-hello-world/kernel-module-hello
>>> -
>>> world_git.bb
>>> # Recipe created by recipetool
>>> # This is the basis of a recipe and may need further editing in order to be fully functional.
>>> # (Feel free to remove these comments when editing.)
>>>
>>> # WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best
>>> guesses - it is # your responsibility to verify that the values are complete and correct.
>>> #
>>> # The following license files were not able to be identified and are
>>> # represented as "Unknown" below, you will need to check them yourself:
>>> #   LICENSE
>>> LICENSE = "Unknown"
>>> LIC_FILES_CHKSUM = "file://LICENSE;md5=7b785be6433a2e4af6a641cc7f0330d1"
>>>
>>> SRC_URI = "git://git.yoctoproject.org/git/kernel-module-hello-world;protocol=https;branch=master"
>>>
>>> # Modify these as desired
>>> PV = "1.0+git"
>>> SRCREV = "b66f0f2bd559a1df81fc1bda240eba07a2ecdd2b"
>>>
>>> S = "${WORKDIR}/git"
>>>
>>> inherit module
>>>
>>> EXTRA_OEMAKE:append:task-install = " -C ${STAGING_KERNEL_DIR} M=${S}"
>>> EXTRA_OEMAKE += "KERNEL_DIR=${STAGING_KERNEL_DIR}"
>>>
>>> And it contains SRCREV = "b66f0f2bd559a1df81fc1bda240eba07a2ecdd2b"
>>>
>>> Tony
>>>
>>> -----Original Message-----
>>> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>>> Sent: Friday, 15 August 2025 11:26
>>> To: Tony Rex <tony.rex@ericsson.com>;
>>> openembedded-core@lists.openembedded.org
>>> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe
>>> parsing race issue
>>>
>>> [You don't often get email from mathieu.dubois-briand@bootlin.com.
>>> Learn why this is important at
>>> https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> On Thu Aug 14, 2025 at 7:23 PM CEST, Tony Rex via lists.openembedded.org wrote:
>>>> It seems that the race condition happens when doing do_fetch on
>>>> really small repos and it can be difficult to reproduce so below the
>>>> other case with floating tag/branch that is easier to verify.
>>>>
>>>> To verify the floating tag/branch issue have s simple recipe
>>>> hello_1.0.bb and set the SRC_URI to SRC_URI = "git://<repository>;protocol=https;user=${USER};branch=master;tag=v1.0"
>>>>
>>>> run command bitbake hello everything builds.
>>>>
>>>> Apply the patch
>>>>
>>>> run command bitbake hello
>>>> ERROR: hello-1.0-r1 do_fetch: Bitbake Fetcher Error:
>>>> FetchError("Recipe uses a floating tag/branch 'v1.0' for repo
>>>> '<repository>' without a fixed SRCREV yet doesn't call
>>>> bb.fetch2.get_srcrev() (use SRCPV in PV for OE).", None)
>>>> ERROR: Logfile of failure stored in:
>>>> hello/1.0/temp/log.do_fetch.3289932
>>>> ERROR: Task (hello/hello_1.0.bb:do_fetch) failed with exit code '1'
>>>>
>>>> Tony Rex (1):
>>>>   base.bbclass: Fix the recipe parsing race issue
>>>>
>>>>  meta/classes-global/base.bbclass | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>> Hi Tony,
>>>
>>> Thanks for your patch.
>>>
>>> It looks like this is breaking some builds with the following error:
>>>
>>> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testsdkext/environment-setup-core2-64-poky-linux > /dev/null; devtool add kernel-module-hello-world https://git.yoctoproject.org/git/kernel-module-hello-world;' returned non-zero exit status 1.
>>> ...
>>> ERROR: Bitbake Fetcher Error: FetchError("Recipe uses a floating
>>> tag/branch 'master' for repo
>>> 'git.yoctoproject.org/git/kernel-module-hello-world' without a fixed
>>> SRCREV yet doesn't call bb.fetch2.get_srcrev() (use SRCPV in PV for
>>> OE).", None)
>>>
>>> https://auto/
>>> builder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F68%2Fbuilds%2F
>>> 2
>>> 284&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda470b381608dd
>>> d
>>> efdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C6389119040052090
>>> 0
>>> 3%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCI
>>> s
>>> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=m
>>> P
>>> UXMdb%2FYOyGIm0rnncaWgcqtwkUIh8364IP3eYDPe4%3D&reserved=0
>>> https://auto/
>>> builder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F30%2Fbuilds%2F
>>> 2
>>> 199&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda470b381608dd
>>> d
>>> efdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C6389119040052274
>>> 3
>>> 2%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCI
>>> s
>>> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=R
>>> 0
>>> HFameGl2LmIVMT9ml%2BDMnj%2FMbG6SW0%2F3yNZHQu2js%3D&reserved=0
>>> https://auto/
>>> builder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F16%2Fbuilds%2F
>>> 2
>>> 247&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda470b381608dd
>>> d
>>> efdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C6389119040052453
>>> 8
>>> 7%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCI
>>> s
>>> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=N
>>> S
>>> FhEupwMkgqUAhpRgFbKnyFl%2FsY%2B4UJMhVQHhqOaNM%3D&reserved=0
>>>
>>> Can you have a look at this error please?
>>>
>>> Best regards,
>>> Mathieu
>>>
>>> --
>>> Mathieu Dubois-Briand, Bootlin
>>> Embedded Linux and Kernel engineering https://boot/
>>> lin.com%2F&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda470b3
>>> 8
>>> 1608dddefdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C638911904
>>> 0
>>> 05263327%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAu
>>> M
>>> DAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&
>>> s
>>> data=oyi7YWsXDVHn7QB4fDdG1sBp7gQsfGWcJTWtX1CjAw4%3D&reserved=0
>>>
>>>
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#222149):
>>> https://lis/
>>> ts.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F222149&data=0
>>> 5%7C02%7Ctony.rex%40ericsson.com%7C2de957deabb44811987008dddfd2db2e%7
>>> C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C638912818889885720%7CUnkn
>>> own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ
>>> XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=gDT0CZ9r
>>> SmJYVsVWQN2eMCrJvTBVS%2FHmPu20h6Olzuw%3D&reserved=0
>>> Mute This Topic:
>>> https://lis/
>>> ts.openembedded.org%2Fmt%2F114706197%2F6084445&data=05%7C02%7Ctony.re
>>> x%40ericsson.com%7C2de957deabb44811987008dddfd2db2e%7C92e84cebfbfd47a
>>> bbe52080c6b87953f%7C0%7C0%7C638912818889899266%7CUnknown%7CTWFpbGZsb3
>>> d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjo
>>> iTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=1%2BbrJUes0Q0HERH1%2F22%
>>> 2FpeuvSRqJiHS9MKZe8gtIzJE%3D&reserved=0
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:
>>> https://lis/
>>> ts.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=05%7C02%7Cto
>>> ny.rex%40ericsson.com%7C2de957deabb44811987008dddfd2db2e%7C92e84cebfb
>>> fd47abbe52080c6b87953f%7C0%7C0%7C638912818889915666%7CUnknown%7CTWFpb
>>> GZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIk
>>> FOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=tv1%2FYgsOKZRkU0KM8
>>> Cyqr3P%2FKjZsOBwcvPmz7ztR0f0%3D&reserved=0 [skandigraun@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


