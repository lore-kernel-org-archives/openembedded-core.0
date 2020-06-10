Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.1043.1591813505513183089
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 11:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=POBBbYXO;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id 205so3047145qkg.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 11:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DHE4JlrPJI9JCL9G5Z8Jz+LBIWD3zHEf7S0O+AtU7lQ=;
        b=POBBbYXO6vsR7T1nNGpj2/fR8bJ7s8FwAOboKMbqKmaILOmByEjAxAAZQcmJpzvacs
         3nprGQPEyij4/+yX5XtyX1QZUvvMBSVWLuX92KDjqxsSjWQhUO9onlCzgjodApU9rtwb
         bF3oT02H5MwQ22rfYIuwUdY1kVpMOp2T+AmTQUOksBalIBzGqf/HKeWmt3QElLgJ89p0
         LzrOBCR5n7i5mIpXJny6gaQn1vhvut7iBuRv71VfgyAE+o8jqhn2ZA0aAdbe+j9JJNJm
         KU7mMwA+wriAfwy878Auc8HXvlzOHPzLugDKClOdpwviMCmbS1R0yAYjuyJOOQYsJib5
         K3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DHE4JlrPJI9JCL9G5Z8Jz+LBIWD3zHEf7S0O+AtU7lQ=;
        b=luzUWWZunTPwvvZ/PPE8MN7tV3CfXIQ8W4NId1lST8SpdXz99DQU7gGcDJgnXVk0f5
         K7lIM6dSt4dULs+y60azc3J1pITLk95ShkE3NCJEjLQC74UFpRSvBjyaheY7cyuTbj20
         ymP9g7ga6WM1kTbc3OHxJx1ryAcFkHV22L+VfFubDv1/96BLDa2ZAjUMmwwZEs/zK04Z
         XfkZNq2zZ8BBTfQyjCaZ+ZP4+WYc1FNpWipxfvhMfUCmhsLW2nubSr3dwzqVSFEMwRfY
         dIYnbs/+UDMomJhPqucSnZTUIyRa8hyetDSs2vGyQBXDNY1R41K5RaIlAFsBl4iTNbNZ
         AfkQ==
X-Gm-Message-State: AOAM5313Pz4WRvxQAPgpmu6HnZePJu0IQc7W+9gAi0XLq5DBIL2k0Ra9
	CBYshVt+gq0xxHPI9qX5CfEPMHdYTcgwvgppaMw=
X-Google-Smtp-Source: ABdhPJwFckrjii/jmEF9XpLEutUxE/r9AM5ObKvTSMxQVLnyFuu7glXd/KD3/UllyW7fLSZb2XCZoSrU//S4iyE/h/M=
X-Received: by 2002:a37:e215:: with SMTP id g21mr4425799qki.165.1591813504293;
 Wed, 10 Jun 2020 11:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200526231037.2626327-1-raj.khem@gmail.com> <CAHMutrbae=hs4_0gzWzKZHmm0meTvT4WQYGr67bveo=whqxXSA@mail.gmail.com>
In-Reply-To: <CAHMutrbae=hs4_0gzWzKZHmm0meTvT4WQYGr67bveo=whqxXSA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 10 Jun 2020 11:24:38 -0700
Message-ID: <CAMKF1spDinrsMuEMw9zsVNcu4PECp_2jo+cKHt3AhTYjfX5fTA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] armv8/tunes: Set TUNE_PKGARCH_64 based on ARMPKGARCH
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 9, 2020 at 12:30 AM Alejandro Enedino Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> Hello Khem,
>
>
> On Tue, 26 May 2020 at 16:10, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> The setting is to modify TUNE_PKGARCH which is filled with
>> TUNE_PKGARCH_64 or TUNE_PKGARCH_32 in arm-arch64.inc
>> This lets higher up tune files for arm64 SOCs override them if needed,
>> this can help building multiple armv8 machines with different tunes in
>> same workspace.
>>
>> No need to set TUNE_PKGARCH in tune files as it is synthesized from ARMPKGARCH
>>
>> Add ARMPKGARCH for aarch64 tunes
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> v2: Differentiate triplet for crypto feature
>>
>>  meta/conf/machine/include/arm/arch-arm64.inc           | 4 +++-
>>  meta/conf/machine/include/tune-cortexa53.inc           | 5 +----
>>  meta/conf/machine/include/tune-cortexa55.inc           | 1 -
>>  meta/conf/machine/include/tune-cortexa57-cortexa53.inc | 1 -
>>  meta/conf/machine/include/tune-cortexa57.inc           | 4 +---
>>  meta/conf/machine/include/tune-cortexa72-cortexa53.inc | 4 +---
>>  meta/conf/machine/include/tune-cortexa72.inc           | 1 -
>>  meta/conf/machine/include/tune-cortexa73-cortexa53.inc | 4 +---
>>  8 files changed, 7 insertions(+), 17 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
>> index 53f4566815..6d5b22fff0 100644
>> --- a/meta/conf/machine/include/arm/arch-arm64.inc
>> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
>> @@ -12,6 +12,8 @@ ARMPKGARCH_tune-aarch64 ?= "aarch64"
>>  ARMPKGARCH_tune-aarch64_be ?= "aarch64_be"
>>  TUNE_FEATURES_tune-aarch64 = "aarch64"
>>  TUNE_FEATURES_tune-aarch64_be = "${TUNE_FEATURES_tune-aarch64} bigendian"
>> +TUNE_PKGARCH_64_tune-aarch64 = "aarch64"
>> +TUNE_PKGARCH_64_tune-aarch64_be = "aarch64_be"
>
>
>
> I'm trying to accommodate my machines to the TUNE_PKGARCH changes and I'm a bit confused by looking at the way these variables are now set.
>
> The way these overrides are behaving, is this meant to be desired behavior?
>
> # $TUNE_PKGARCH [9 operations]
> ...
> override[64_tune-aarch64]:set /poky/meta/conf/machine/include/arm/arch-arm64.inc:15
> #     "aarch64"
> #   override[64_tune-aarch64_be]:set /oky/meta/conf/machine/include/arm/arch-arm64.inc:16
> #     "aarch64_be"
>
> Is the 64_tune_aarch64 meant to be an override for TUNE_PKGARCH or is that supposed to be set for the TUNE_PKGARCH_64 variable instead?
>

TUNE_PKGARCH_64 is fed into TUNE_PKGARCH but we want to ensure that
TUNE_PKGARCH_64 can accommodate the SOC specific tune name.

> Cheers,
>
> Alejandro
>
>
>
>
>>
>>  BASE_LIB_tune-aarch64 = "lib64"
>>  BASE_LIB_tune-aarch64_be = "lib64"
>>
>> @@ -20,7 +22,7 @@ PACKAGE_EXTRA_ARCHS_tune-aarch64_be = "aarch64_be"
>>
>>  ARMPKGSFX_ENDIAN_64 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '_be', '', d)}"
>>  TUNE_ARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
>> -TUNE_PKGARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
>> +TUNE_PKGARCH_64 = "${ARMPKGARCH}${ARMPKGSFX_ENDIAN_64}"
>>  ABIEXTENSION_64 = ""
>>  TARGET_FPU_64 = ""
>>
>> diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
>> index b7327d00c4..c0bb28a19e 100644
>> --- a/meta/conf/machine/include/tune-cortexa53.inc
>> +++ b/meta/conf/machine/include/tune-cortexa53.inc
>> @@ -8,14 +8,11 @@ require conf/machine/include/arm/arch-armv8a.inc
>>  # Little Endian base configs
>>  AVAILTUNES += "cortexa53 cortexa53-crypto"
>>  ARMPKGARCH_tune-cortexa53             = "cortexa53"
>> -ARMPKGARCH_tune-cortexa53-crypto      = "cortexa53"
>> +ARMPKGARCH_tune-cortexa53-crypto      = "cortexa53-crypto"
>>  TUNE_FEATURES_tune-cortexa53          = "aarch64 cortexa53 crc"
>>  TUNE_FEATURES_tune-cortexa53-crypto   = "aarch64 cortexa53 crc crypto"
>>  PACKAGE_EXTRA_ARCHS_tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
>>  PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
>>
>> -TUNE_PKGARCH_tune-cortexa53 = "cortexa53"
>> -TUNE_PKGARCH_tune-cortexa53-crypto = "cortexa53-crypto"
>> -
>>  BASE_LIB_tune-cortexa53               = "lib64"
>>  BASE_LIB_tune-cortexa53-crypto        = "lib64"
>> diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
>> index 274944819e..89032b59ec 100644
>> --- a/meta/conf/machine/include/tune-cortexa55.inc
>> +++ b/meta/conf/machine/include/tune-cortexa55.inc
>> @@ -9,6 +9,5 @@ require conf/machine/include/arm/arch-armv8a.inc
>>  AVAILTUNES += "cortexa55"
>>  ARMPKGARCH_tune-cortexa55             = "cortexa55"
>>  TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crc crypto"
>> -TUNE_PKGARCH_tune-cortexa55           = "cortexa55"
>>  PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa55"
>>  BASE_LIB_tune-cortexa55               = "lib64"
>> diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
>> index b95d63e86b..ba4b073852 100644
>> --- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
>> +++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
>> @@ -11,6 +11,5 @@ require conf/machine/include/arm/arch-armv8a.inc
>>  AVAILTUNES += "cortexa57-cortexa53"
>>  ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
>>  TUNE_FEATURES_tune-cortexa57-cortexa53 = "aarch64 cortexa57-cortexa53"
>> -TUNE_PKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
>>  PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa57-cortexa53"
>>  BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
>> diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/tune-cortexa57.inc
>> index e8ddeb5786..0811d503cc 100644
>> --- a/meta/conf/machine/include/tune-cortexa57.inc
>> +++ b/meta/conf/machine/include/tune-cortexa57.inc
>> @@ -8,12 +8,10 @@ require conf/machine/include/arm/arch-armv8a.inc
>>  # Little Endian base configs
>>  AVAILTUNES += "cortexa57 cortexa57-crypto"
>>  ARMPKGARCH_tune-cortexa57             = "cortexa57"
>> -ARMPKGARCH_tune-cortexa57-crypto      = "cortexa57"
>> +ARMPKGARCH_tune-cortexa57-crypto      = "cortexa57-crypto"
>>  TUNE_FEATURES_tune-cortexa57          = "aarch64 cortexa57 crc"
>>  TUNE_FEATURES_tune-cortexa57-crypto   = "aarch64 cortexa57 crc crypto"
>>  PACKAGE_EXTRA_ARCHS_tune-cortexa57             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57"
>>  PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
>> -TUNE_PKGARCH_tune-cortexa57 = "cortexa57"
>> -TUNE_PKGARCH_tune-cortexa57-crypto = "cortexa57-crypto"
>>  BASE_LIB_tune-cortexa57               = "lib64"
>>  BASE_LIB_tune-cortexa57-crypto        = "lib64"
>> diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
>> index fd1ffeb177..e857f875ff 100644
>> --- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
>> +++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
>> @@ -10,13 +10,11 @@ require conf/machine/include/arm/arch-armv8a.inc
>>  # cortexa72.cortexa53 implies crc support
>>  AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
>>  ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
>> -ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53"
>> +ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53-crypto"
>>  TUNE_FEATURES_tune-cortexa72-cortexa53               = "aarch64 crc cortexa72-cortexa53"
>>  TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "aarch64 crc crypto cortexa72-cortexa53"
>>  PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
>>  PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
>> -TUNE_PKGARCH_tune-cortexa72-cortexa53                = "cortexa72-cortexa53"
>> -TUNE_PKGARCH_tune-cortexa72-cortexa53-crypto         = "cortexa72-cortexa53-crypto"
>>  BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
>>  BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
>>
>> diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
>> index 23640d5c1f..00f7745a22 100644
>> --- a/meta/conf/machine/include/tune-cortexa72.inc
>> +++ b/meta/conf/machine/include/tune-cortexa72.inc
>> @@ -10,5 +10,4 @@ AVAILTUNES += "cortexa72"
>>  ARMPKGARCH_tune-cortexa72             = "cortexa72"
>>  TUNE_FEATURES_tune-cortexa72          = "aarch64 cortexa72 crc crypto"
>>  PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
>> -TUNE_PKGARCH_tune-cortexa72           = "cortexa72"
>>  BASE_LIB_tune-cortexa72               = "lib64"
>> diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
>> index ab87c88747..ba2b9b1951 100644
>> --- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
>> +++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
>> @@ -10,13 +10,11 @@ require conf/machine/include/arm/arch-armv8a.inc
>>  # cortexa73.cortexa53 implies crc support
>>  AVAILTUNES += "cortexa73-cortexa53 cortexa73-cortexa53-crypto"
>>  ARMPKGARCH_tune-cortexa73-cortexa53                  = "cortexa73-cortexa53"
>> -ARMPKGARCH_tune-cortexa73-cortexa53-crypto           = "cortexa73-cortexa53"
>> +ARMPKGARCH_tune-cortexa73-cortexa53-crypto           = "cortexa73-cortexa53-crypto"
>>  TUNE_FEATURES_tune-cortexa73-cortexa53               = "aarch64 crc cortexa73-cortexa53"
>>  TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "aarch64 crc crypto cortexa73-cortexa53"
>>  PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
>>  PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
>> -TUNE_PKGARCH_tune-cortexa73-cortexa53                = "cortexa73-cortexa53"
>> -TUNE_PKGARCH_tune-cortexa73-cortexa53-crypto         = "cortexa73-cortexa53-crypto"
>>  BASE_LIB_tune-cortexa73-cortexa53                    = "lib64"
>>  BASE_LIB_tune-cortexa73-cortexa53-crypto             = "lib64"
>>
>> --
>> 2.26.2
>>
>> 
