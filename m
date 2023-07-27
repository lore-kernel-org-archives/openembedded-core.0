Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634C6C001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 07:32:08 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.2376.1690443125909982107
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 00:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=f0DGfDar;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: zboszor@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7836164a08aso23660339f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 00:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690443125; x=1691047925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMaMtxXiqmnYXzOJvY7XkF7cB76dOhAsVSMjJRQ3xU0=;
        b=f0DGfDarmwmm+5NiUN5pLwvTQKjJvXDt8J7ByLs6OMN6+fTUI6ZirlE/G8oXy/pTs5
         FXsbt6Sw8zJpbcWcgavsMvdWNitE/1Er3hSjv1QxKIc6wy34MG/AC1ot/OjnmL1YHn01
         KxZcH86QGfQCE/sbhSG1wdjl4FGJfQsjD+LFyO5AtzZCkf4Eaoxqo3GM4DlS4KoZirM2
         fdqXstoUm0fXKaIMfgowDc3T+2GWC5oIBi8FRny3WYet8jW6Cca7N1MXs+ffppdATS7o
         z+y9zIHDk2YBw742TPEXvKpv81P/3m8zKstSLJfpPmBjWAI+jjWe0OiZ/O+1QauXsr01
         3GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690443125; x=1691047925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMaMtxXiqmnYXzOJvY7XkF7cB76dOhAsVSMjJRQ3xU0=;
        b=gNcUVUhjNCiX6YLD5THKIEh4OANAjsDchKyKQDasPfrUkVc+zqeDgGOQ1uQGiUQB8C
         BlVMhQEeeLFaW2zzNnpTsnh0M0Jm9UFWGP4ewSlx2Cwsmg9RN6HABV4NLPssnzahzRXw
         EMkXxqDiIkntS56IVsgVLYsvG7TPia+wZX/zU23B4/WgmhUu2YjMthJQ1bPvvAVVlFtE
         0Ky2N6zszAmw9PkkBvr12g3b9xHrfOqpSYAI9sEyYr0D0E1H3eZKbvt9wc3yW96yL4eF
         CijSdo0E6SM7UOFGUkfAlzRUNv+tQCvObTXlH+GAhEdZXjpyUgyGUblU8AAz2KlBZ2pA
         /TYw==
X-Gm-Message-State: ABy/qLava+Dheqjq3YOm89czAmpVBBX1yUqGfiREeqOvazJ12jh+x9ng
	xXzbzj42TusZ9gd0UV/iHAU=
X-Google-Smtp-Source: APBJJlHBABRfzgI10Rf2JlFkec294SAsUiJJZE1eqEfpxU3MtjeWnN9YWpuL4/sfXajTd4/QTWd2JQ==
X-Received: by 2002:a6b:6f19:0:b0:784:e618:e6cd with SMTP id k25-20020a6b6f19000000b00784e618e6cdmr4695945ioc.20.1690443125015;
        Thu, 27 Jul 2023 00:32:05 -0700 (PDT)
Received: from [192.168.2.51] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id l6-20020a02cce6000000b0042b15e54a2dsm240402jaq.170.2023.07.27.00.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 00:32:04 -0700 (PDT)
Message-ID: <dfbfb13e-208b-4a63-b0a6-339452184c9c@gmail.com>
Date: Thu, 27 Jul 2023 09:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH] rpm: Allow setting platform macro settings
 externally
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <Ross.Burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230725135719.388231-1-zboszor@gmail.com>
 <CANNYZj9_AbGN9YsahpHVHA8wqingZaKfv-DD_DPGURt4ezPn5Q@mail.gmail.com>
 <17756CA97DEFC46E.21334@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <17756CA97DEFC46E.21334@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184915

Patch approved with the requested changes.

I sent a v2 with using the approved patch and adding
the exports only to do_install:class-target because
that's where it's needed.

2023. 07. 26. 15:05 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2023. 07. 25. 18:30 keltezéssel, Alexander Kanavin írta:
>> I would want to hold this until we have a reaction from upstream.
>
> Now we have reaction. Both PRs were closed because they were not
> against master, my bad. Now reopened against master as
> https://github.com/rpm-software-management/rpm/pull/2585
>
> But there was some real comment here:
> https://github.com/rpm-software-management/rpm/pull/2580#issuecomment-1651647277
>
> The discussion may/should be taken to the issue at
> https://github.com/rpm-software-management/rpm/issues/2578
>
>> RPM_CUSTOM_* exports should go to specific tasks where they are needed.
>>
>> Alex
>>
>> On Tue, 25 Jul 2023 at 15:57, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>>> Feed platform settings to installplatform externally. Based on the patch
>>> submitted under https://github.com/rpm-software-management/rpm/pull/2579
>>>
>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>> ---
>>>   ...ng-plaform-macro-settings-externally.patch | 56 +++++++++++++++++++
>>>   meta/recipes-devtools/rpm/rpm_4.18.1.bb       | 17 ++++++
>>>   2 files changed, 73 insertions(+)
>>>   create mode 100644 
>>> meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch
>>>
>>> diff --git 
>>> a/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch 
>>> b/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch 
>>>
>>> new file mode 100644
>>> index 0000000000..8b3220f114
>>> --- /dev/null
>>> +++ 
>>> b/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch
>>> @@ -0,0 +1,56 @@
>>> +From 320f4f3861dad70342f065004311eac143d6522d Mon Sep 17 00:00:00 2001
>>> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
>>> + <zboszor@gmail.com>
>>> +Date: Tue, 25 Jul 2023 10:56:44 +0200
>>> +Subject: [PATCH] Allow setting plaform macro settings externally
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=UTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +Yocto has their own way to set the platform names via BSPs
>>> +(Board Support Packages). These names are more specific than
>>> +basic CPU architectures, and such a platform name ends up in
>>> +/etc/rpm/platform but the corresponding subdirectory under
>>> +/usr/lib/rpm/platform does not exist.
>>> +
>>> +Allow creating such custom platform subdirectory with feeding
>>> +the necessary data using external variables: RPM_CUSTOM_ARCH,
>>> +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
>>> +and RPM_CUSTOM_CANONCOLOR
>>> +
>>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>> +Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/2579]
>>> +---
>>> + installplatform | 9 ++++++++-
>>> + 1 file changed, 8 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/installplatform b/installplatform
>>> +index a5ad7c5b8..59f57697b 100755
>>> +--- a/installplatform
>>> ++++ b/installplatform
>>> +@@ -11,7 +11,7 @@ VENDOR="${4}"
>>> + OS="${5}"
>>> + RPMRC_GNU="${6}"
>>> +
>>> +-for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
>>> ++for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2` 
>>> ${RPM_CUSTOM_ARCH:+custom}; do
>>> +   RPMRC_OPTFLAGS="`sed -n 's/^optflags: '$ARCH' //p' $RPMRC`"
>>> +   RPMRC_OPTFLAGS="`echo $RPMRC_OPTFLAGS | sed -e 's, ,\ ,g'`"
>>> +   case $RPMRC_OPTFLAGS in
>>> +@@ -30,6 +30,13 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
>>> +   CANONCOLOR=
>>> +   FILTER=cat
>>> +   case "${ARCH}" in
>>> ++    custom)
>>> ++      ARCH=$RPM_CUSTOM_ARCH
>>> ++      ISANAME=$RPM_CUSTOM_ISANAME
>>> ++      ISABITS=$RPM_CUSTOM_ISABITS
>>> ++      CANONARCH=$RPM_CUSTOM_CANONARCH
>>> ++      CANONCOLOR=$RPM_CUSTOM_CANONCOLOR
>>> ++    ;;
>>> +     sparc64*)
>>> +       ISANAME=sparc
>>> +       ISABITS=64
>>> +--
>>> +2.41.0
>>> +
>>> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb 
>>> b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>> index 95a9e92f96..bc036fc843 100644
>>> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>> @@ -40,6 +40,7 @@ SRC_URI = 
>>> "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
>>> file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
>>>              file://fix-declaration.patch \
>>> file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
>>> + file://0001-Allow-setting-plaform-macro-settings-externally.patch \
>>>              "
>>>
>>>   PE = "1"
>>> @@ -103,6 +104,21 @@ WRAPPER_TOOLS = " \
>>>      ${libdir}/rpm/rpmdeps \
>>>   "
>>>
>>> +def rpm_isaname(d):
>>> +    import re
>>> +    arch = d.getVar('TARGET_ARCH')
>>> +    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
>>> +        return "x86"
>>> +    # Add more platform tweaks for ISANAME as needed
>>> +    return arch
>>> +
>>> +export RPM_CUSTOM_ARCH = "${MACHINE_ARCH}"
>>> +export RPM_CUSTOM_ISANAME = "${@rpm_isaname(d)}"
>>> +export RPM_CUSTOM_ISABITS = "${SITEINFO_BITS}"
>>> +export RPM_CUSTOM_CANONARCH = "${TARGET_ARCH}"
>>> +# CANONCOLOR determines whether /usr/lib or /usr/lib64 is used for a 64-bit platform
>>> +export RPM_CUSTOM_CANONCOLOR = "${@bb.utils.contains('DISTRO_FEATURES', 'multilib', 
>>> '3', '0', d)}"
>>> +
>>>   do_configure:prepend() {
>>>           mkdir -p ${S}/build-aux
>>>   }
>>> @@ -132,6 +148,7 @@ do_install:append:class-nativesdk() {
>>>   do_install:append:class-target() {
>>>       rm -rf ${D}/var
>>>   }
>>> +
>>>   do_install:append:class-nativesdk() {
>>>       rm -rf ${D}${SDKPATHNATIVE}/var
>>>       # Ensure find-debuginfo is located correctly inside SDK
>>> -- 
>>> 2.41.0
>>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184883): https://lists.openembedded.org/g/openembedded-core/message/184883
> Mute This Topic: https://lists.openembedded.org/mt/100350661/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


