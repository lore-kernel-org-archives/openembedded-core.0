Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EF5C00528
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 11:13:17 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.12122.1691061194154225073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 04:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=o5Yam581;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-522462d8416so1025424a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691061192; x=1691665992;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vobNXubE+VNwKWugrHLfSDyVx85ByT38KY5GorVEqlU=;
        b=o5Yam5819vud7GcGTkdz4DexOmtf1iKi8xNBgWKqVDDi9wOueBwKDlPueaPwsExrFz
         1/axkeLUrQQWcoKgN9rjFP7c3MKsIzxeyrOsfA+zcq04Y7rBHoajkz2cg1Q2biuHOwLV
         0vs6Ap8O76TRG4XgszisoNeFX3/gYu7gCNLusJsFS6xwZwbgQwiEmpzvPEp7tQQ7QtEN
         +JkdWk3q1Y2WFj6HlwpUkC656SQljf8NNWvScACeT+Lh2eK6XNovi7vtD3agMl6eytcq
         3Ibwsfp/w3KDQqWyI+8nuLA8hghlDZFal0wWcRH3og9Ukuy7WapV8p7g1Q66FXKUvA+j
         rKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691061192; x=1691665992;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vobNXubE+VNwKWugrHLfSDyVx85ByT38KY5GorVEqlU=;
        b=Uj0U8vFuk+yscXL+/yARXLZ1zw3+aQn8FIALxr7ZROP35ptpiapPXBEwW08pj+0c01
         RSuJklJPov06+PX+Atr8GJ+CGXMPOc868XPuTqAudg/fgzjtQCc80v117JnHnj1r2ZYV
         O7+3OAx9bjeBrENtZ3D2rd1YJ1D7DFF1AtfLwmyDPmJtQCk/xY5h+Ewo0I9VJa+WwOzY
         pa1IGLdgC/0+14fKI3yzk0wMX7BmIqYxseS37d73B/dcGi/HotXlsXQrnXjOoKD1JoHn
         epGiBhcCB9EFc4cwF2Aie4jTC6/cur3yXdHPqnm+kYqZxhlf5LWV7JxSK4rbSYhQHYtB
         Tr8A==
X-Gm-Message-State: ABy/qLYSTDyiuneW9m81flYF7yqiaiOj9qXPDoU6MnWMCL6O+dWHTRxV
	ZaUGDIuTIzlkvesHYFmo9GY=
X-Google-Smtp-Source: APBJJlGwqyIuUEaJDO7xLktcYODwbCzHjoHicJhF1LuCenkb++uIITXi034rYvCj6SPjoc210d0IHA==
X-Received: by 2002:aa7:de0e:0:b0:522:560d:d691 with SMTP id h14-20020aa7de0e000000b00522560dd691mr7317778edv.25.1691061192320;
        Thu, 03 Aug 2023 04:13:12 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id f26-20020a056402069a00b005224d960e66sm9938777edy.96.2023.08.03.04.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 04:13:12 -0700 (PDT)
Message-ID: <6543fbe2-602a-6b78-089b-49569a891fae@gmail.com>
Date: Thu, 3 Aug 2023 13:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH v6] rpm: Allow setting platform macro settings
 externally
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 openembedded-core@lists.openembedded.org, Ross Burton <Ross.Burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230801132957.401557-1-zboszor@gmail.com>
 <20230802134131db3e0b1e@mail.local>
 <e4dcb013-25f0-63f8-4713-8d4b71757cb4@gmail.com>
 <CANNYZj_WpBs=f0thUNdEgBi9G-VepAF-_hf2gxsRP1mOjD1vtA@mail.gmail.com>
 <ffd0b874-711a-abc8-0445-2884e24f8a3b@gmail.com>
 <1777D06DC603E04E.27883@lists.openembedded.org>
 <1777D3B13579ECA3.27883@lists.openembedded.org>
 <CANNYZj-bUm8oW1b1UwE1QDry-89_WEMKMy12SpTVLt409cY=aA@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-bUm8oW1b1UwE1QDry-89_WEMKMy12SpTVLt409cY=aA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 11:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185472

2023. 08. 03. 12:19 keltezéssel, Alexander Kanavin írta:
> Ok, sorry for rapid-fire. The more I think about this, the more I'm
> convinced the target platform macro needs to go to
> platform/<arch>-<vendor>-<os>/macros, e.g. include the vendor. That
> way we can install into x86_64-poky-linux, and it would neither clash
> with upstream macros,

This would be okay.

>   nor make rpm recipe machine-specific (this is a
> tough sell at best, and likely a hard no).

I thought so.

> Unfortunately making it all work and pass all the tests may not be easy.

I am happy to have been able to point out such a hard problem. :-D
(Even if only superficially. Even after using it for 8 years, I am still learning Yocto.)

> Alex
>
> On Thu, 3 Aug 2023 at 10:55, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
>> A couple more observations:
>> the content of usr/lib/rpm/platform/qemux86_64-linux/macros is not at
>> all specific to qemu. In fact, the only significant difference with
>> upstream's x86_64-linux/macros is where the libraries go (lib vs
>> lib64).
>>
>> So the machine name is needed only for the file location, and
>> therefore we can install it somewhere else where it would be picked up
>> without having to rely on MACHINE_ARCH. There's a whole menu of
>> options in lib/rpmrc.c:
>>
>>          macrofiles = rstrscat(NULL, confdir, "/macros", ":",
>>                                  confdir, "/macros.d/macros.*", ":",
>>                                  confdir, "/platform/%{_target}/macros", ":",
>>                                  confdir, "/fileattrs/*.attr", ":",
>>                                  confdir, "/" RPMCANONVENDOR "/macros", ":",
>>                                  etcconfdir, SYSCONFDIR "/rpm/macros.*", ":",
>>                                  etcconfdir, SYSCONFDIR "/rpm/macros", ":",
>>                                  etcconfdir, SYSCONFDIR
>> "/rpm/%{_target}/macros", ":", NULL);
>>
>> I think placing the macros into one of those should work. Can you verify?
>>
>> Alex
>>
>> On Thu, 3 Aug 2023 at 09:55, Alexander Kanavin via
>> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
>> wrote:
>>> I applied the patch and checked what the difference in install tree
>>> is. I see that the only difference is addition of
>>> usr/lib/rpm/platform/qemux86_64-linux/macros
>>>
>>> I'd like to step back for a bit, and clarify:
>>>
>>> What is the mechanism at runtime for finding that file? How does rpm
>>> tooling arrive at the path it needs to read? How is 'qemux86_64-linux'
>>> computed? Are there alternative locations that macros are also taken
>>> from?
>>>
>>> And once that is clarified, the next question would be:
>>> Can we instruct rpm to read macros from a default location for a
>>> self-hosted target?
>>>
>>> You might also just teach that developer who is unwilling to learn new
>>> stuff to write recipes. It's about the same amount of effort as
>>> writing rpm .spec files :)
>>>
>>> Alex
>>>
>>>
>>>
>>> On Thu, 3 Aug 2023 at 08:09, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>>> 2023. 08. 02. 21:54 keltezéssel, Alexander Kanavin írta:
>>>>> I think the culprit is the usage of MACHINE_ARCH. You can't have that
>>>>> in regular recipes, as that makes them machine-specific, rather than
>>>>> tune (i.e. architecture) specific.
>>>> So, how to fix it?
>>>>
>>>> Would putting this into the rpm recipe be enough and acceptable?
>>>>
>>>> PACKAGE_ARCH = "${MACHINE_ARCHJ}"
>>>>
>>>> Reasoning: the patch that makes rpm carry the
>>>> $MACHINE_ARCH}-linux platform specific macros file
>>>> does make rpm machine-specific.
>>>>
>>>>> Alex
>>>>>
>>>>> On Wed, 2 Aug 2023 at 21:28, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>>>>> Some clues please. What does this error mean? How to solve it?
>>>>>>
>>>>>> 2023. 08. 02. 15:41 keltezéssel, Alexandre Belloni írta:
>>>>>>> Hello,
>>>>>>>
>>>>>>> This causes
>>>>>>> sstatetests.SStateHashSameSigs3.test_sstate_sametune_samesigs to fail:
>>>>>>>
>>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5572/steps/14/logs/stdio
>>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5538/steps/14/logs/stdio
>>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5547/steps/15/logs/stdio
>>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5495/steps/14/logs/stdio
>>>>>>>
>>>>>>> On 01/08/2023 15:29:57+0200, Zoltan Boszormenyi wrote:
>>>>>>>> Feed platform settings to installplatform externally. Based on the patch
>>>>>>>> submitted under https://github.com/rpm-software-management/rpm/pull/2585
>>>>>>>>
>>>>>>>> Patch against INSTALL was backported for rpm 4.18.1
>>>>>>>>
>>>>>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>>>> ---
>>>>>>>>     ...atform-macro-settings-externally-258.patch | 119 ++++++++++++++++++
>>>>>>>>     meta/recipes-devtools/rpm/rpm_4.18.1.bb       |  20 +++
>>>>>>>>     2 files changed, 139 insertions(+)
>>>>>>>>     create mode 100644 meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
>>>>>>>>
>>>>>>>> diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000000..a32ce38533
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
>>>>>>>> @@ -0,0 +1,119 @@
>>>>>>>> +From e58c607dcdb303ff3ba1b22fd23eb20e374b6ed3 Mon Sep 17 00:00:00 2001
>>>>>>>> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
>>>>>>>> + <zboszor@gmail.com>
>>>>>>>> +Date: Fri, 28 Jul 2023 12:16:56 +0200
>>>>>>>> +Subject: [PATCH] Allow setting platform macro settings externally (#2585)
>>>>>>>> +MIME-Version: 1.0
>>>>>>>> +Content-Type: text/plain; charset=UTF-8
>>>>>>>> +Content-Transfer-Encoding: 8bit
>>>>>>>> +
>>>>>>>> +* Allow setting platform macro settings externally
>>>>>>>> +
>>>>>>>> +By default, rpm installs a series of default platforms based on
>>>>>>>> +the CPU architecture names in subdirectories called
>>>>>>>> +
>>>>>>>> +    /usr/lib/platform/<arch>-<os>
>>>>>>>> +
>>>>>>>> +This is enough for regular Linux distributions. However, some
>>>>>>>> +distributions may use more specific platform names that refer to
>>>>>>>> +particular computer systems, like SBCs or specific CPU tuning when
>>>>>>>> +compiling.
>>>>>>>> +
>>>>>>>> +If the platform subdirectory does not exist in /usr/lib/platform
>>>>>>>> +then rpmbuild does not work.
>>>>>>>> +
>>>>>>>> +Allow creating such custom platform subdirectory with feeding
>>>>>>>> +the necessary data using external variables: RPM_CUSTOM_ARCH,
>>>>>>>> +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
>>>>>>>> +and RPM_CUSTOM_CANONCOLOR
>>>>>>>> +
>>>>>>>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>>>> +Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/fde03ae33d55b160a31a6c54946880dcdf8fd0d6]
>>>>>>>> +
>>>>>>>> +---------
>>>>>>>> +
>>>>>>>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>>>> +Co-authored-by: Florian Festi <ffesti@redhat.com>
>>>>>>>> +---
>>>>>>>> + INSTALL         | 37 +++++++++++++++++++++++++++++++++++++
>>>>>>>> + installplatform |  9 ++++++++-
>>>>>>>> + 2 files changed, 45 insertions(+), 1 deletion(-)
>>>>>>>> +
>>>>>>>> +diff --git a/INSTALL b/INSTALL
>>>>>>>> +index 13d0d8a83..5e035cf6a 100644
>>>>>>>> +--- a/INSTALL
>>>>>>>> ++++ b/INSTALL
>>>>>>>> +@@ -148,6 +148,43 @@ and then install with:
>>>>>>>> +
>>>>>>>> +     make install
>>>>>>>> +
>>>>>>>> ++
>>>>>>>> ++By default, rpm installs a series of default platforms based on the CPU
>>>>>>>> ++architecture names in subdirectories called
>>>>>>>> ++
>>>>>>>> ++    /usr/lib/platform/<arch>-<os>
>>>>>>>> ++
>>>>>>>> ++This is enough for many distributions. However, some distributions
>>>>>>>> ++may use more specific platform names that refer to particular computer
>>>>>>>> ++systems, like SBCs or specific CPU tuning when compiling. Examples of such
>>>>>>>> ++platform names are: "genericx86_64", "intel_skylake_64", "raspberrypi_armv7",
>>>>>>>> ++"raspberrypi_armv8", etc.
>>>>>>>> ++
>>>>>>>> ++If the platform name is put into /etc/rpm/platform, then rpmbuild uses it
>>>>>>>> ++and the only macros file rpmbuild looks for is
>>>>>>>> ++
>>>>>>>> ++    /usr/lib/platform/`cat /etc/rpm/platform`-<os>/macros
>>>>>>>> ++
>>>>>>>> ++If this file does not exist, many rpm macros will not have their expected
>>>>>>>> ++values set and e.g. %configure will fail when trying to run rpmbuild.
>>>>>>>> ++
>>>>>>>> ++To allow creating the macros file for such a custom platform, the shell
>>>>>>>> ++variables listed below must be set. If RPM_CUSTOM_ARCH is not set, the rest
>>>>>>>> ++is ignored.
>>>>>>>> ++
>>>>>>>> ++    export RPM_CUSTOM_ARCH=genericx86_64
>>>>>>>> ++    export RPM_CUSTOM_ISANAME=x86
>>>>>>>> ++    export RPM_CUSTOM_ISABITS=64
>>>>>>>> ++    export RPM_CUSTOM_CANONARCH=x86_64
>>>>>>>> ++    export RPM_CUSTOM_CANONCOLOR=0 # to use /usr/lib for %_libdir
>>>>>>>> ++    export RPM_CUSTOM_CANONCOLOR=3 # to use /usr/lib64 for %_libdir
>>>>>>>> ++
>>>>>>>> ++    make install
>>>>>>>> ++
>>>>>>>> ++This also creates and installs the new platform file e.g.
>>>>>>>> ++/usr/lib/platform/genericx86_64-linux/macros
>>>>>>>> ++
>>>>>>>> ++
>>>>>>>> + Rpm comes with an automated self-test suite. The test-suite relies heavily
>>>>>>>> + on fakechroot (https://github.com/dex4er/fakechroot/) and cannot be executed
>>>>>>>> + without it. Provided that fakechroot was found during configure,
>>>>>>>> +diff --git a/installplatform b/installplatform
>>>>>>>> +index a5ad7c5b8..59f57697b 100755
>>>>>>>> +--- a/installplatform
>>>>>>>> ++++ b/installplatform
>>>>>>>> +@@ -11,7 +11,7 @@ VENDOR="${4}"
>>>>>>>> + OS="${5}"
>>>>>>>> + RPMRC_GNU="${6}"
>>>>>>>> +
>>>>>>>> +-for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
>>>>>>>> ++for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2` ${RPM_CUSTOM_ARCH:+custom}; do
>>>>>>>> +   RPMRC_OPTFLAGS="`sed -n 's/^optflags: '$ARCH' //p' $RPMRC`"
>>>>>>>> +   RPMRC_OPTFLAGS="`echo $RPMRC_OPTFLAGS | sed -e 's, ,\ ,g'`"
>>>>>>>> +   case $RPMRC_OPTFLAGS in
>>>>>>>> +@@ -30,6 +30,13 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
>>>>>>>> +   CANONCOLOR=
>>>>>>>> +   FILTER=cat
>>>>>>>> +   case "${ARCH}" in
>>>>>>>> ++    custom)
>>>>>>>> ++   ARCH=$RPM_CUSTOM_ARCH
>>>>>>>> ++   ISANAME=$RPM_CUSTOM_ISANAME
>>>>>>>> ++   ISABITS=$RPM_CUSTOM_ISABITS
>>>>>>>> ++   CANONARCH=$RPM_CUSTOM_CANONARCH
>>>>>>>> ++   CANONCOLOR=$RPM_CUSTOM_CANONCOLOR
>>>>>>>> ++    ;;
>>>>>>>> +     sparc64*)
>>>>>>>> +    ISANAME=sparc
>>>>>>>> +    ISABITS=64
>>>>>>>> +--
>>>>>>>> +2.41.0
>>>>>>>> +
>>>>>>>> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>>>>>>> index 95a9e92f96..0b8ebebb51 100644
>>>>>>>> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>>>>>>> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>>>>>>> @@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
>>>>>>>>                file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
>>>>>>>>                file://fix-declaration.patch \
>>>>>>>>                file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
>>>>>>>> +           file://0001-Allow-setting-platform-macro-settings-externally-258.patch \
>>>>>>>>                "
>>>>>>>>
>>>>>>>>     PE = "1"
>>>>>>>> @@ -128,10 +129,29 @@ do_install:append:class-nativesdk() {
>>>>>>>>        EOF
>>>>>>>>     }
>>>>>>>>
>>>>>>>> +def rpm_isaname(d):
>>>>>>>> +    import re
>>>>>>>> +    arch = d.getVar('TARGET_ARCH')
>>>>>>>> +    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
>>>>>>>> +        return "x86"
>>>>>>>> +    # Add more platform tweaks for ISANAME as needed
>>>>>>>> +    return arch
>>>>>>>> +
>>>>>>>> +# Add the custom BSP platform "macros" file
>>>>>>>> +do_install:prepend:class-target() {
>>>>>>>> +    export RPM_CUSTOM_ARCH="${MACHINE_ARCH}"
>>>>>>>> +    export RPM_CUSTOM_ISANAME="${@rpm_isaname(d)}"
>>>>>>>> +    export RPM_CUSTOM_ISABITS="${SITEINFO_BITS}"
>>>>>>>> +    export RPM_CUSTOM_CANONARCH="${TARGET_ARCH}"
>>>>>>>> +    # CANONCOLOR determines whether /usr/lib or /usr/lib64 is used for a 64-bit platform
>>>>>>>> +    export RPM_CUSTOM_CANONCOLOR="${@bb.utils.contains('DISTRO_FEATURES', 'multilib', '3', '0', d)}"
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>     # Rpm's make install creates var/tmp which clashes with base-files packaging
>>>>>>>>     do_install:append:class-target() {
>>>>>>>>         rm -rf ${D}/var
>>>>>>>>     }
>>>>>>>> +
>>>>>>>>     do_install:append:class-nativesdk() {
>>>>>>>>         rm -rf ${D}${SDKPATHNATIVE}/var
>>>>>>>>         # Ensure find-debuginfo is located correctly inside SDK
>>>>>>>> --
>>>>>>>> 2.41.0
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>
>>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#185467): https://lists.openembedded.org/g/openembedded-core/message/185467
>> Mute This Topic: https://lists.openembedded.org/mt/100483574/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


