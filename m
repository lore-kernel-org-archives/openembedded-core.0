Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7A1C001B0
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 13:05:20 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.10492.1690376710194329859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 06:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FoWbVoNx;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: zboszor@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-78847bb8940so337877539f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690376709; x=1690981509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1qRLqIaEXpuVh5g5RFz9/RDsbfvHpLvi1Zqf6q2z2U=;
        b=FoWbVoNxYRyoV9TRfsRg6XMfKag5gD2ywB6s8jtL/zuihKzngw2k5mHGExDgwBF13g
         gva5elH3+DR2f/9YBw7WU9WIm6XU5gse+3GJzgX31pZBB1wPs8gKT6no+odEhvsT1ngv
         UEDyupR/+nCpI5GgKHm4A940/SSzNH/jdPr+ZNqqMdc0kJ5diiOiSx5v4vDxu+fiPbkh
         SLmXq5rOiLDS+JmbitJL9RcqxOcSdcJMVF9y4uKKYCzjtzwYT84NvPbvH0mKOXRq1MS0
         c2+84Pi3HPKae/AR7k/Vs/O4SwF16NvMN2HLWUkVXMKMYLOh51j17tNV0a4lbWTWznDF
         2AOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690376709; x=1690981509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1qRLqIaEXpuVh5g5RFz9/RDsbfvHpLvi1Zqf6q2z2U=;
        b=V6dJPJE/ukSTg7LSZaFKw3lpysoCbi1U9E7ZZWsJOokIWCg8OLSW11DhTNMnq0Uqfv
         CS9LOiyD483LSH0d66d5Ju2mgZ0alZ8zYy0npT79MVUKho7TNwYQiIbwaCWmvUPdPcYF
         L8VJm3cq95gnWb71fpSXgZlo0RVALAAuCHHNM1v+ILmU6hI6aYGX7Eyx2/nWZkY9FF5f
         Rh/4T4kUEDdQmnqCZmzwX3PPSF2WaxoEjlhXANlv6GiD1XQlXOWYEabN9TGM8LHdQT+I
         RkRo4HQt8Tz5ODmFu6D5JzQshVhsigp6lk3PAfNJ9k+VJpi//3zNdOxTu0H4sCb8ZZ5z
         2+5g==
X-Gm-Message-State: ABy/qLbrjpffivWBG6dA5TXoc7eN+GdLbVWEbhcLt4U/R/4Zf7iU1lKX
	m9soCJEE+JWc09MdZvUYFgA=
X-Google-Smtp-Source: APBJJlHX+XtcxPSSCQaZdOf/U1+WbnB87h0gTaJQESrbg9ltbKKb2m5ZrWMuGdgeqQD7awKKPiUqBA==
X-Received: by 2002:a5e:c242:0:b0:783:62af:fbdf with SMTP id w2-20020a5ec242000000b0078362affbdfmr1950174iop.14.1690376709305;
        Wed, 26 Jul 2023 06:05:09 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id w20-20020a029694000000b0042bb7d0f904sm4127414jai.39.2023.07.26.06.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 06:05:08 -0700 (PDT)
Message-ID: <4077da0c-20c3-4470-0110-b9233f578f5e@gmail.com>
Date: Wed, 26 Jul 2023 15:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] rpm: Allow setting platform macro settings externally
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <Ross.Burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230725135719.388231-1-zboszor@gmail.com>
 <CANNYZj9_AbGN9YsahpHVHA8wqingZaKfv-DD_DPGURt4ezPn5Q@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj9_AbGN9YsahpHVHA8wqingZaKfv-DD_DPGURt4ezPn5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 13:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184883

2023. 07. 25. 18:30 keltezéssel, Alexander Kanavin írta:
> I would want to hold this until we have a reaction from upstream.

Now we have reaction. Both PRs were closed because they were not
against master, my bad. Now reopened against master as
https://github.com/rpm-software-management/rpm/pull/2585

But there was some real comment here:
https://github.com/rpm-software-management/rpm/pull/2580#issuecomment-1651647277

The discussion may/should be taken to the issue at
https://github.com/rpm-software-management/rpm/issues/2578

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


