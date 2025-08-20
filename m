Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E65ACA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 10:18:11 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.16680.1755685088146324819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 03:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=acOAi/44;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad681so8783579a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 03:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755685086; x=1756289886; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8j8cnTpHqV0JXPIYxbJYyWuBorjBuU0ubyCbQt1enT0=;
        b=acOAi/44aJFT0W5MTPrerkA3MNonRBlfG4tf4nTgxFYYIs5Wja3yFUxyyeFe3GfSM2
         PN7rSx5xOtRK3kamLc+dOhV04Xvu+27M5/vsZLzzS1U/pmGO8DR1Q+Ac0IuKWhc+QpQB
         SMMIwo17JLiZZL+6l4tr5H+JIiezbL7izoNFbfrlWIEx1dsnXfTPZ8jO5/QRF/O05sKt
         M0x+sd6yARkru8fKsMuvXyXqZ11GcRpJVegtTLGXLqsrQOeIu5f8UIWhxtN1JixL6Gpe
         8j9MFat7UnyajaSnaxHFUx3D7orQehUbyNG2fsoqWW9BAHYwKWBxPgXGrHTqEG1xq8K5
         nhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755685086; x=1756289886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8j8cnTpHqV0JXPIYxbJYyWuBorjBuU0ubyCbQt1enT0=;
        b=ed0zYX4dwIoyG1uSD5qYSD/ZD23RBqr2BPuzLBi7dYKFykQsoolSF+/DxUA+lD4mHU
         BK0zp8E5AXzKSgW7nxjVOnBlticOGYgv/iSBGwQw2Gd8QNrL/iVwCDMfBc/vwZSUfv5+
         SqcGQYg6qvRrrLB4CHWiv593LneYOtzn+NMRO66zhy7pyHl+fj+MHf53cX7vWP1W3tQk
         Hp9RvEEOKLhNqCr+Z8ky+3pu/4ulqNYldVYQTg7cfVIQNWxXL7gh2OAM6M190QWUQ2VY
         T17WU3p863fbzmn6Bv6ZJlIhcGcCfG779to6D68/1xiXkEBvmqL+HKAexHL+KflPdJlZ
         pRSA==
X-Forwarded-Encrypted: i=1; AJvYcCXgwN/g0cq5lFnu0NcnkJTQyjmNHvl8hhjh2no3OiqOfHmeB4stYcqdUJN8m+5uRctOkIPTHQGVpYWrtDOiSW/Ljg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxI6glIyJK28GkO+6EQQh+Jyuo/jQHxOn9t5QdU62lXYkSXKuyy
	4ECoiV58BMdUQt+XA/+TZIzYTzqMarbdDi14DCJLJVicyufXuCc7aqgT
X-Gm-Gg: ASbGncstvEzzkyUFyRgx87HRK1crrHpbQatsY/yV+o0InUGbh88AYVJROfNjYovo5Z6
	pTqNDvHIFmsnaioMgIOtPbT6si/w81dcWsvnT839NFRykbJ6n/ruHkhrhBmMYavFrZbrT9ldlU7
	1KWu4LPeLaVVQmAdDMHE//tP9/r3X37NXT6PyKDhgFABpzLCTYsOxdKdJ9JSgru0aR+Cu5apTop
	99I3tfyTCJx7pfR5dHYQrEeNdGkkBS2Cu++Ye8oqyJjZcdBPTsLcLguhHBgCG9d683CJWyS1cdr
	842jytdfiSjMkTLlL7FD/lfwf/wL2Ch6iSuNeF2d7IuY2GhHwaQs8ZhEyaRTq2OadUXmE6jW53M
	1GoZFWkPsyEuCtjVmjr6WPY0Ei3DC+mI=
X-Google-Smtp-Source: AGHT+IFS5XQnLiFItMWzdKQ1CMli1+ZQifU2gT6YNwoFx8VrTGXIVk0c1ew7hE6qVaM/Emxb/FrtTQ==
X-Received: by 2002:a17:907:1ca2:b0:af9:495b:99e4 with SMTP id a640c23a62f3a-afdf027fd7cmr181554666b.60.1755685085981;
        Wed, 20 Aug 2025 03:18:05 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdfa887a90sm37648566b.11.2025.08.20.03.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 03:18:05 -0700 (PDT)
Message-ID: <2583ed72-5988-4d0c-8403-eab3eac4bcac@gmail.com>
Date: Wed, 20 Aug 2025 12:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race
 issue
To: tony.rex@ericsson.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250814172348.3882586-1-tony.rex@ericsson.com>
 <DC2W6ED7YCUS.1V4VLCIHMFF17@bootlin.com>
 <PAXPR07MB8470CECE924BE2127902BAF3E434A@PAXPR07MB8470.eurprd07.prod.outlook.com>
 <CANNYZj_DaekmJt8W1g-nc+QsB7TnY-yyWwmGSR_GOYRORLhRCw@mail.gmail.com>
 <PAXPR07MB847086B08E52F2405CB530B3E430A@PAXPR07MB8470.eurprd07.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <PAXPR07MB847086B08E52F2405CB530B3E430A@PAXPR07MB8470.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 10:18:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222168

On 8/19/25 23:10, Tony Rex via lists.openembedded.org wrote:
> Hi Alex and Mathieu!
>
> Ok, so the patch fixes a bug and then the floating tag/branch function is in place again.
> The floating tag/branch function is broken due to the bug and the patch fixes it.
>
> The mail from Mathieu below might not fully reflect the issue here, since it seems to create a recipe with the help of devtool.
>
> To verify:
> 1. add layers/oe-core/meta-selftest to conf/bblayers.conf
> 2. run bitbake gitrepotest -c fetch
> result:
> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
> 3. run bitbake gitrepotest -c cleanall
> 4. edit ../layers/oe-core/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
> add tag=2.12 in SRC_URI
> SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;tag=2.12;protocol=https \
> and comment out SRCREV
> #SRCREV = "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
> 5. run bitbake gitrepotest -c fetch
> result:
> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
> The fetch goes through although this is not allowed according to the floating tag/branch error statement if not d.getVar("__BBSRCREV_SEEN"): in git.py.

Could you point to a commit/email/etc about this "no floating tags
allowed" statement? AFAIK tags without specifying revision is allowed
and supported. Not recommended, due to mandatory network access, and
because git tags are not immutable, but I'm surprised to hear that they
are not supposed to work (which of course can also mean that I just
missed a memo)

> 6. run bitbake gitrepotest -c cleanall
> 7. apply patch 0001-base.bbclass-Fix-the-recipe-parsing-race-issue.patch
> 8. run bitbake gitrepotest -c fetch
> result:
> ERROR: gitrepotest-1.0-r0 do_fetch: Bitbake Fetcher Error: FetchError("Recipe uses a floating tag/branch '2.12' for repo 'git.yoctoproject.org/git/matchbox-panel-2' without a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev() (use SRCPV in PV for OE).", None)
> ERROR: Logfile of failure stored in: .../build/tmp-glibc/work/cortexa53-wrs-linux/gitrepotest/1.0/temp/log.do_fetch.1254999
> ERROR: Task (.../layers/oe-core/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb:do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
>
> Error is the expected result when only having a tag set.
>
> Tony
>
> -----Original Message-----
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Tuesday, 19 August 2025 10:53
> To: Tony Rex <tony.rex@ericsson.com>
> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race issue
>
> [You don't often get email from alex.kanavin@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> You need to make things a little bit easier for maintainers and try to save their time.
>
> I would suggest that you provide clear steps to observe the issue.
> Attach the recipe file that would demonstrate the issue, and provide clear steps to trigger it. What is confusing right now is that you say here's a recipe that builds ok, but then you 'apply the patch' and then there's some kind of failure. So which patch needs to be applied?
>
> Alex
>
> On Fri, 15 Aug 2025 at 17:29, Tony Rex via lists.openembedded.org <tony.rex=ericsson.com@lists.openembedded.org> wrote:
>> Hi Mathieu!
>>
>> I think that this is how it is intended to work, bitbake does not allow floating tag/branch anymore.
>> Please correct me if I'm wrong @Richard Purdie (who implemented this
>> for security reasons I think.)
>>
>> The patch that I have makes sure that the parsing and setting of the
>> variables in the recipe are done before executing the do_fetch command, and as a side effect the floating tag/branch protection is working as intended again.
>>
>> How does the recipe look like?
>> devtool add kernel-module-hello-world
>> https://git/.
>> yoctoproject.org%2Fgit%2Fkernel-module-hello-world&data=05%7C02%7Ctony
>> .rex%40ericsson.com%7Cde1ae2aceeda470b381608dddefdd730%7C92e84cebfbfd4
>> 7abbe52080c6b87953f%7C0%7C0%7C638911904005151487%7CUnknown%7CTWFpbGZsb
>> 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjo
>> iTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=jyCicRQT%2FLtb1YxiFHKgw5B
>> nNktN4t9IciiyxtsEwO4%3D&reserved=0
>> The one I get looks like this:
>>
>> cat
>> build/workspace/recipes/kernel-module-hello-world/kernel-module-hello-
>> world_git.bb
>> # Recipe created by recipetool
>> # This is the basis of a recipe and may need further editing in order to be fully functional.
>> # (Feel free to remove these comments when editing.)
>>
>> # WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best
>> guesses - it is # your responsibility to verify that the values are complete and correct.
>> #
>> # The following license files were not able to be identified and are #
>> represented as "Unknown" below, you will need to check them yourself:
>> #   LICENSE
>> LICENSE = "Unknown"
>> LIC_FILES_CHKSUM = "file://LICENSE;md5=7b785be6433a2e4af6a641cc7f0330d1"
>>
>> SRC_URI = "git://git.yoctoproject.org/git/kernel-module-hello-world;protocol=https;branch=master"
>>
>> # Modify these as desired
>> PV = "1.0+git"
>> SRCREV = "b66f0f2bd559a1df81fc1bda240eba07a2ecdd2b"
>>
>> S = "${WORKDIR}/git"
>>
>> inherit module
>>
>> EXTRA_OEMAKE:append:task-install = " -C ${STAGING_KERNEL_DIR} M=${S}"
>> EXTRA_OEMAKE += "KERNEL_DIR=${STAGING_KERNEL_DIR}"
>>
>> And it contains SRCREV = "b66f0f2bd559a1df81fc1bda240eba07a2ecdd2b"
>>
>> Tony
>>
>> -----Original Message-----
>> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> Sent: Friday, 15 August 2025 11:26
>> To: Tony Rex <tony.rex@ericsson.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe
>> parsing race issue
>>
>> [You don't often get email from mathieu.dubois-briand@bootlin.com.
>> Learn why this is important at
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On Thu Aug 14, 2025 at 7:23 PM CEST, Tony Rex via lists.openembedded.org wrote:
>>> It seems that the race condition happens when doing do_fetch on
>>> really small repos and it can be difficult to reproduce so below the
>>> other case with floating tag/branch that is easier to verify.
>>>
>>> To verify the floating tag/branch issue have s simple recipe
>>> hello_1.0.bb and set the SRC_URI to SRC_URI = "git://<repository>;protocol=https;user=${USER};branch=master;tag=v1.0"
>>>
>>> run command bitbake hello everything builds.
>>>
>>> Apply the patch
>>>
>>> run command bitbake hello
>>> ERROR: hello-1.0-r1 do_fetch: Bitbake Fetcher Error:
>>> FetchError("Recipe uses a floating tag/branch 'v1.0' for repo
>>> '<repository>' without a fixed SRCREV yet doesn't call
>>> bb.fetch2.get_srcrev() (use SRCPV in PV for OE).", None)
>>> ERROR: Logfile of failure stored in:
>>> hello/1.0/temp/log.do_fetch.3289932
>>> ERROR: Task (hello/hello_1.0.bb:do_fetch) failed with exit code '1'
>>>
>>> Tony Rex (1):
>>>   base.bbclass: Fix the recipe parsing race issue
>>>
>>>  meta/classes-global/base.bbclass | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> Hi Tony,
>>
>> Thanks for your patch.
>>
>> It looks like this is breaking some builds with the following error:
>>
>> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testsdkext/environment-setup-core2-64-poky-linux > /dev/null; devtool add kernel-module-hello-world https://git.yoctoproject.org/git/kernel-module-hello-world;' returned non-zero exit status 1.
>> ...
>> ERROR: Bitbake Fetcher Error: FetchError("Recipe uses a floating
>> tag/branch 'master' for repo
>> 'git.yoctoproject.org/git/kernel-module-hello-world' without a fixed
>> SRCREV yet doesn't call bb.fetch2.get_srcrev() (use SRCPV in PV for
>> OE).", None)
>>
>> https://auto/
>> builder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F68%2Fbuilds%2F2
>> 284&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda470b381608ddd
>> efdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C63891190400520900
>> 3%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs
>> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=mP
>> UXMdb%2FYOyGIm0rnncaWgcqtwkUIh8364IP3eYDPe4%3D&reserved=0
>> https://auto/
>> builder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F30%2Fbuilds%2F2
>> 199&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda470b381608ddd
>> efdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C63891190400522743
>> 2%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs
>> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=R0
>> HFameGl2LmIVMT9ml%2BDMnj%2FMbG6SW0%2F3yNZHQu2js%3D&reserved=0
>> https://auto/
>> builder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F16%2Fbuilds%2F2
>> 247&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda470b381608ddd
>> efdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C63891190400524538
>> 7%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs
>> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=NS
>> FhEupwMkgqUAhpRgFbKnyFl%2FsY%2B4UJMhVQHhqOaNM%3D&reserved=0
>>
>> Can you have a look at this error please?
>>
>> Best regards,
>> Mathieu
>>
>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://boot/
>> lin.com%2F&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda470b38
>> 1608dddefdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C6389119040
>> 05263327%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuM
>> DAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&s
>> data=oyi7YWsXDVHn7QB4fDdG1sBp7gQsfGWcJTWtX1CjAw4%3D&reserved=0
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#222149): https://lists.openembedded.org/g/openembedded-core/message/222149
>> Mute This Topic: https://lists.openembedded.org/mt/114706197/6084445
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


