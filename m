Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.8897.1604779098720172665
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2020 11:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UQ5bj9NT;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id b18so4421483qkc.9
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2020 11:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=irnEijoJYHL0VMobrDYQJ3JU6EdW2B/oLisWXqOzOg8=;
        b=UQ5bj9NTSQb7xsUrrdiSM09MdffCTb9d/rH5KC/HnNHS/9dJCv33BTqsnfD9RiFOOE
         EASBQhhxDxseP7o1dwxQtT4uGUwG+4nfcnzA+eAJvEL0AQ4qBV7tKmp4TOrH1Y6oTFVW
         vFuoZg9TmKVkokvpZJi+lk/P8i58Rx/KRx83Amg/VripS/tyykFsuwnHgKFkpGAfXJbI
         puZGDIivZqEgDOFOae5hvsb9dnUUZq2cjW+Y4BpehR/34noaodp8iqAN1r1kkbbPbdVL
         sDjnFG/Kj5EQA+TDGWNeszWnxIuO8VtFlATIoop75KDuJxLUEHPffHGNV+HYJ6QUUe2z
         wWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=irnEijoJYHL0VMobrDYQJ3JU6EdW2B/oLisWXqOzOg8=;
        b=OadN2zsdc8KcIuzW/s53taoSyydapYk7R3JGpTXhwzMVeuU5aMTUwVpO5sJIpSY2mA
         6+Eun2IyCthJbe56hqsO/YV1DZ0MlAp0dqv+XQIkzATgMlDL15vXYyqjsUR8pZEvovpn
         mBhNPZWP8VkZ8+zaMGVxR0/RCdO9YS+lrfZAE4qaHhHhTeUx3Zo4f2CDJWWin1zg2YS/
         XD/xDVc2OAZfYpsY4vhYDRiawfoYTRC+jaekBlEPFmN5diYfC1YbkFCN54rMK4L0QgN1
         jwMX77I6yKvi5yg9qhNOE8hgBdQ/DiwAkwi0c+07appFw8EzwxHr8+qVPkpP1KyG9YS5
         q78g==
X-Gm-Message-State: AOAM531IXrpZfkRBqrhhXSOffaNYAQl3yqKHCDM5uzBc8MYD13BtOwNH
	AXLUN9AwGu8G8aCqJgTOvnRT2VJ7Oxjyss0aSO0=
X-Google-Smtp-Source: ABdhPJwXGSbw551mG7b3SsfPdwfauGCFReL5/s1noHv01Bt0wCN5WQlI7TX1cy9O2QttTFFlcVcuGGE/5BdI7zJgulE=
X-Received: by 2002:a37:9441:: with SMTP id w62mr7435035qkd.474.1604779097795;
 Sat, 07 Nov 2020 11:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20201107184119.3033956-1-raj.khem@gmail.com> <CA+chaQemfW9vKrGvzpA1kKpvYhuv_5JqSOKupiT+AHwqwBSHiw@mail.gmail.com>
In-Reply-To: <CA+chaQemfW9vKrGvzpA1kKpvYhuv_5JqSOKupiT+AHwqwBSHiw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 7 Nov 2020 11:57:51 -0800
Message-ID: <CAMKF1spDpZukA0J5N_JzbacK+sGLY1hCuBJNxO+9nYcFg0=kXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 1/2] lto: Add global LTO distro policy file
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 7, 2020 at 10:49 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Does this actually work (I don't see lto added to OVERRIDES) and why is this needed?
>
> PACKAGE_DEBUG_SPLIT_STYLE_lto = "debug-without-src"

Right, it is a nop, which means it's not needed anymore, it was needed
in the past as packaging failed for some packages.
Let me remove it and do the image build and perhaps remove it in v3.

>
> On Sat, Nov 7, 2020 at 7:41 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Distros which want to enable LTO can utilize this file, it only covers
>> packages from OE-Core, other layers should include there own exclusion
>> list for recipe which dont work with LTO
>>
>> Document the needed changes in local.conf.extended
>>
>> debug file generator does  not generate debugsrc packages when lto is
>> enabled therefore disable it
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> v2: Include feeedback for adding DISTRO_FEATURE knob
>>
>>  meta/conf/distro/include/lto.inc     | 30 ++++++++++++++++++++++++++++
>>  meta/conf/local.conf.sample.extended |  4 ++++
>>  2 files changed, 34 insertions(+)
>>  create mode 100644 meta/conf/distro/include/lto.inc
>>
>> diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
>> new file mode 100644
>> index 0000000000..1f76ec7c16
>> --- /dev/null
>> +++ b/meta/conf/distro/include/lto.inc
>> @@ -0,0 +1,30 @@
>> +# To enable LTO, add following in local.conf
>> +# require conf/distro/include/lto.inc
>> +# DISTRO_FEATURES_append = " lto"
>> +#
>> +
>> +# Disable LTO for following packages
>> +LTO_pn-glibc = ""
>> +LTO_pn-gcc-runtime = ""
>> +LTO_pn-libgcc-initial = ""
>> +LTO_pn-libgcc = ""
>> +LTO_pn-libpam = ""
>> +LTO_pn-elfutils = ""
>> +LTO_pn-perl = ""
>> +LTO_pn-busybox = ""
>> +LTO_pn-libxcrypt = ""
>> +LTO_pn-curl = ""
>> +LTO_pn-libcap = ""
>> +LTO_pn-libproxy = ""
>> +LTO_pn-libbsd = ""
>> +
>> +# Override it for additional or different options if needed e.g.
>> +# with clang thin-lto might be better for compile speed
>> +LTO ?= "-flto"
>> +
>> +SELECTED_OPTIMIZATION_append = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
>> +TARGET_LDFLAGS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
>> +
>> +SELECTED_OPTIMIZATION[vardeps] += "LTO"
>> +
>> +PACKAGE_DEBUG_SPLIT_STYLE_lto = "debug-without-src"
>> diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
>> index 9aa226a2d0..2c4b8ad8cb 100644
>> --- a/meta/conf/local.conf.sample.extended
>> +++ b/meta/conf/local.conf.sample.extended
>> @@ -417,3 +417,7 @@
>>  # ERR_REPORT_UPLOAD_ALL = "1"
>>  #
>>  # INHERIT += "report-error"
>> +
>> +# Enable LTO Distro-wide
>> +# require conf/distro/include/lto.inc
>> +# DISTRO_FEATURES_append = " lto"
>> --
>> 2.29.2
>>
>>
>> 
>>
