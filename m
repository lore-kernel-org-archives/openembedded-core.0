Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF72C0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 05:51:28 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.5164.1690350685820436965
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 22:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iFSaZx6j;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: zboszor@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7835971026fso270073039f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 22:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690350685; x=1690955485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=549roygoSgEx6KFLA6ptRgiHolBdRSeVFC6RMsfG0+A=;
        b=iFSaZx6jXi8ThXWooE2nnrFDdL5wjjWaHRk2yhAZPKt4/v8aISCuc4Euo+h6qh2mok
         +JBZ2BEziX94a908XcXS0zFCgmmiFWyArp17F9Cc5emnj4PgACBZomOMkprBhtQ6NEec
         d2Gfwm2DXV5Sf0jP5pVej23bmlbBc+r8oLQipsEivH0Nu8BgOoC6/d+ZXZB0CcNjKLHN
         hJtEzUGoaNi2VWanG/4RfCM/limi/b8460hsVpWtZ9qnDvAFGHeBt6I9VF55k1sit3mJ
         qt6+pp5LOouzG4MwMDAPngR+xLvpYTeGtCdzbwVaMjw53sYh+C0SkHpz+Mtv2gQzkB4o
         7aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690350685; x=1690955485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=549roygoSgEx6KFLA6ptRgiHolBdRSeVFC6RMsfG0+A=;
        b=cSxyeAeI9IyVmzNTObg3rGDZSX/lm/zT7pDmoybyYdyN0Okl+PjgOyLQDN3F8CJ8Ur
         yjjl5x2BDwqbTR4LJPa8CNj+ejpA6VIviuCVQiCnWYP1OCrls0CNCS+VVmXCNBe28wKb
         Tu/nmrWbx0R2ByukwK0hI8xBUsTd7feMVoAUlwFMEoWBeygdgbjcySyWOwV5kWTP8j1E
         Uxfnqg9WFOGYuQP1rwnby62gKRnAYUttUS2E3itYQr/0aQYbZo42PiWEFUSDRpZgAIfJ
         kpyKQSYhWoqkf0Avmbi+cPZBPuYKj7MYzarpH8QQMl9/qOpOCKOrlF721UANTaU626UM
         XA8A==
X-Gm-Message-State: ABy/qLbwXsalB22J9iIFmHD73YcjTkXjWeksog5XrWzq2jcc3IYZrnlg
	HIRtC7IT39uv4jOVxqBO7gk=
X-Google-Smtp-Source: APBJJlHkcbHTvtI1ulHygj00SHSjck39D82/S6hA6L2zWnAYl+IC4H/sABvmo1mr+MHWzTrcHXb/0g==
X-Received: by 2002:a5e:a60c:0:b0:786:45f7:fb7e with SMTP id q12-20020a5ea60c000000b0078645f7fb7emr920619ioi.13.1690350684037;
        Tue, 25 Jul 2023 22:51:24 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id s25-20020a02cf39000000b0042b3bf0baacsm3934179jar.138.2023.07.25.22.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 22:51:23 -0700 (PDT)
Message-ID: <999bfb39-1c97-121e-1fa2-37bc81dbfe66@gmail.com>
Date: Wed, 26 Jul 2023 07:51:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] rpm: Allow setting platform macro settings externally
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <Ross.Burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230725135719.388231-1-zboszor@gmail.com>
 <CANNYZj9_AbGN9YsahpHVHA8wqingZaKfv-DD_DPGURt4ezPn5Q@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj9_AbGN9YsahpHVHA8wqingZaKfv-DD_DPGURt4ezPn5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 05:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184857

Sure, $SUBJECT should have been [RFC][PATCH].

Thanks.

2023. 07. 25. 18:30 keltezéssel, Alexander Kanavin írta:
> I would want to hold this until we have a reaction from upstream.
>
> RPM_CUSTOM_* exports should go to specific tasks where they are needed.
>
> Alex
>
> On Tue, 25 Jul 2023 at 15:57, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> Feed platform settings to installplatform externally. Based on the patch
>> submitted under https://github.com/rpm-software-management/rpm/pull/2579
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   ...ng-plaform-macro-settings-externally.patch | 56 +++++++++++++++++++
>>   meta/recipes-devtools/rpm/rpm_4.18.1.bb       | 17 ++++++
>>   2 files changed, 73 insertions(+)
>>   create mode 100644 meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch
>>
>> diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch b/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch
>> new file mode 100644
>> index 0000000000..8b3220f114
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch
>> @@ -0,0 +1,56 @@
>> +From 320f4f3861dad70342f065004311eac143d6522d Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
>> + <zboszor@gmail.com>
>> +Date: Tue, 25 Jul 2023 10:56:44 +0200
>> +Subject: [PATCH] Allow setting plaform macro settings externally
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Yocto has their own way to set the platform names via BSPs
>> +(Board Support Packages). These names are more specific than
>> +basic CPU architectures, and such a platform name ends up in
>> +/etc/rpm/platform but the corresponding subdirectory under
>> +/usr/lib/rpm/platform does not exist.
>> +
>> +Allow creating such custom platform subdirectory with feeding
>> +the necessary data using external variables: RPM_CUSTOM_ARCH,
>> +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
>> +and RPM_CUSTOM_CANONCOLOR
>> +
>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> +Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/2579]
>> +---
>> + installplatform | 9 ++++++++-
>> + 1 file changed, 8 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/installplatform b/installplatform
>> +index a5ad7c5b8..59f57697b 100755
>> +--- a/installplatform
>> ++++ b/installplatform
>> +@@ -11,7 +11,7 @@ VENDOR="${4}"
>> + OS="${5}"
>> + RPMRC_GNU="${6}"
>> +
>> +-for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
>> ++for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2` ${RPM_CUSTOM_ARCH:+custom}; do
>> +   RPMRC_OPTFLAGS="`sed -n 's/^optflags: '$ARCH' //p' $RPMRC`"
>> +   RPMRC_OPTFLAGS="`echo $RPMRC_OPTFLAGS | sed -e 's, ,\ ,g'`"
>> +   case $RPMRC_OPTFLAGS in
>> +@@ -30,6 +30,13 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
>> +   CANONCOLOR=
>> +   FILTER=cat
>> +   case "${ARCH}" in
>> ++    custom)
>> ++      ARCH=$RPM_CUSTOM_ARCH
>> ++      ISANAME=$RPM_CUSTOM_ISANAME
>> ++      ISABITS=$RPM_CUSTOM_ISABITS
>> ++      CANONARCH=$RPM_CUSTOM_CANONARCH
>> ++      CANONCOLOR=$RPM_CUSTOM_CANONCOLOR
>> ++    ;;
>> +     sparc64*)
>> +       ISANAME=sparc
>> +       ISABITS=64
>> +--
>> +2.41.0
>> +
>> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>> index 95a9e92f96..bc036fc843 100644
>> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>> @@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
>>              file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
>>              file://fix-declaration.patch \
>>              file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
>> +           file://0001-Allow-setting-plaform-macro-settings-externally.patch \
>>              "
>>
>>   PE = "1"
>> @@ -103,6 +104,21 @@ WRAPPER_TOOLS = " \
>>      ${libdir}/rpm/rpmdeps \
>>   "
>>
>> +def rpm_isaname(d):
>> +    import re
>> +    arch = d.getVar('TARGET_ARCH')
>> +    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
>> +        return "x86"
>> +    # Add more platform tweaks for ISANAME as needed
>> +    return arch
>> +
>> +export RPM_CUSTOM_ARCH = "${MACHINE_ARCH}"
>> +export RPM_CUSTOM_ISANAME = "${@rpm_isaname(d)}"
>> +export RPM_CUSTOM_ISABITS = "${SITEINFO_BITS}"
>> +export RPM_CUSTOM_CANONARCH = "${TARGET_ARCH}"
>> +# CANONCOLOR determines whether /usr/lib or /usr/lib64 is used for a 64-bit platform
>> +export RPM_CUSTOM_CANONCOLOR = "${@bb.utils.contains('DISTRO_FEATURES', 'multilib', '3', '0', d)}"
>> +
>>   do_configure:prepend() {
>>           mkdir -p ${S}/build-aux
>>   }
>> @@ -132,6 +148,7 @@ do_install:append:class-nativesdk() {
>>   do_install:append:class-target() {
>>       rm -rf ${D}/var
>>   }
>> +
>>   do_install:append:class-nativesdk() {
>>       rm -rf ${D}${SDKPATHNATIVE}/var
>>       # Ensure find-debuginfo is located correctly inside SDK
>> --
>> 2.41.0
>>


