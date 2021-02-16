Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.258.1613518433105202578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 15:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cvo3Kp/R;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id v3so8355537qtw.4
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 15:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iwRW2WUffoITR57KJ9cv/sg+DbWzuKF8mVQuCRNWJSg=;
        b=cvo3Kp/RRXU67enL8B83sO7nKFr01+CMar9f9AfZeOeh/Huk7j2D0jn2BmamgPIpxM
         JKbsiaRa3tcWm2+xcFQqxltGiSKu2oCOhbQI/44069UaXqF8RIhH91WUvaLeLWhP7rTa
         xkYaLiM6JwJwEylRDE+KCo7f5iUqVstJ14gjhqNzjL+jFVpR4wLi06LgEK2lpqg7GBFL
         QfytsMKyeeP8SP0Veel3C16s3g/OLpbi2huWlGaj72bb0y58XaxEWAWJ4fHOAMkW85z/
         fqADWpEYrVTgGwTqu2tR0F96rAbRhgIpgDTuYd41o4fpW1xguxN6lEUwvKrT0LHXC7D4
         RvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iwRW2WUffoITR57KJ9cv/sg+DbWzuKF8mVQuCRNWJSg=;
        b=VKfFmV7di4qcMzZaHdtIoRFc+OAImR4DHcKTlX5ygNhy0rNtly21Af2raUHrBVPzcP
         iH545t9yM9LckNuWGKxZUNWsJdjkvLCd+lQHOHXdC/GN1Q3N35GZmyIYQHkjJeFl41TU
         M8wpF0kqXNL6X+3LPSnP0j/ECmA9PzrPTLys9B/dVPkrPBC9MeBDZAGhIK+gxtpGHcFC
         M72R0xvsCtGuPqYN9EhMAzYDzIApv5nHbeOVoK6OiBXXjB5d768TDmpK0581fnsw/G7k
         tD12hDfC0BQULE69D5upMFubO/417iAIqbJl47CC9/t6NeRPWwBP02/jJYPSVmV0Fjjt
         Wt5Q==
X-Gm-Message-State: AOAM533skvZlLGCzIjkIyhULOr65Z+q1+5nNoYpFWD0139n5Vy6aEV+4
	lBxaxN2xi5sOE3xquyMR2NxdCPOarV1NlqEx5f0=
X-Google-Smtp-Source: ABdhPJyH1u5/270bdDvNbzhhsYnj0iUxTvRIpjfIJpHxJnCSo2yMOw10j/kcwg250LPCHMbrgkeLT5xJg40DiMvyinQ=
X-Received: by 2002:ac8:4d08:: with SMTP id w8mr21142283qtv.289.1613518432178;
 Tue, 16 Feb 2021 15:33:52 -0800 (PST)
MIME-Version: 1.0
References: <20210216230130.1516657-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210216230130.1516657-1-Martin.Jansa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 16 Feb 2021 15:33:26 -0800
Message-ID: <CAMKF1sqh0WEed86n+JGM3WHVxAM31xUZ6mR744CQpUE4Sa1ziQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] icu: backport fix for rare random genrb segmentation fault
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 16, 2021 at 3:01 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * sometimes I've seen it also reporting "Bus error" instead of segmentation fault
>
> * upstream bug report:
>   https://unicode-org.atlassian.net/browse/ICU-21175
>
> * on 80 core machine it failed 11 times in 1000 rebuilds of icu in various files:
>   icu.019.stderr.compile:make[1]: *** [out/build/icudt66l/windowsZones.res] Segmentation fault
>   icu.035.stderr.compile:make[1]: *** [out/build/icudt66l/supplementalData.res] Segmentation fault
>   icu.095.stderr.compile:make[1]: *** [out/build/icudt66l/plurals.res] Segmentation fault
>   icu.116.stderr.compile:make[1]: *** [out/build/icudt66l/curr/supplementalData.res] Segmentation fault
>   icu.313.stderr.compile:make[1]: *** [out/build/icudt66l/supplementalData.res] Segmentation fault
>   icu.415.stderr.compile:make[1]: *** [out/build/icudt66l/supplementalData.res] Segmentation fault
>   icu.476.stderr.compile:make[1]: *** [out/build/icudt66l/metadata.res] Segmentation fault
>   icu.495.stderr.compile:make[1]: *** [out/build/icudt66l/supplementalData.res] Segmentation fault
>   icu.496.stderr.compile:make[1]: *** [out/build/icudt66l/supplementalData.res] Segmentation fault
>   icu.505.stderr.compile:make[1]: *** [out/build/icudt66l/pluralRanges.res] Segmentation fault
>   icu.756.stderr.compile:make[1]: *** [out/build/icudt66l/numberingSystems.res] Segmentation fault
>
> * apply 0001-Fix-big-endian-build.patch in do_patch like this new patch
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...cnvalias-as-a-dependency-of-misc_res.patch | 24 +++++++++++++++++++
>  meta/recipes-support/icu/icu_66.1.bb          |  4 ++--
>  2 files changed, 26 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/icu/icu/0002-ICU-21175-Add-cnvalias-as-a-dependency-of-misc_res.patch
>
> diff --git a/meta/recipes-support/icu/icu/0002-ICU-21175-Add-cnvalias-as-a-dependency-of-misc_res.patch b/meta/recipes-support/icu/icu/0002-ICU-21175-Add-cnvalias-as-a-dependency-of-misc_res.patch
> new file mode 100644
> index 0000000000..d7ddf33bce
> --- /dev/null
> +++ b/meta/recipes-support/icu/icu/0002-ICU-21175-Add-cnvalias-as-a-dependency-of-misc_res.patch
> @@ -0,0 +1,24 @@
> +From f2bc064e0d70ac068de4539d069bfab6cdccc48d Mon Sep 17 00:00:00 2001
> +From: "Shane F. Carr" <shane@unicode.org>
> +Date: Fri, 10 Jul 2020 14:28:22 -0500
> +Subject: [PATCH] ICU-21175 Add cnvalias as a dependency of misc_res
> +
> +Upstream-Status: Backport [https://github.com/unicode-org/icu/commit/ee2d8b01034c3101de2bd58f9328daa076995e9e]
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + data/BUILDRULES.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/data/BUILDRULES.py b/data/BUILDRULES.py
> +index 2338afd1f7..63b6e09273 100644
> +--- a/data/BUILDRULES.py
> ++++ b/data/BUILDRULES.py
> +@@ -361,7 +361,7 @@ def generate_misc(config, io, common_vars):
> +         RepeatedExecutionRequest(
> +             name = "misc_res",
> +             category = "misc",
> +-            dep_targets = [],
> ++            dep_targets = [DepTarget("cnvalias")], # ICU-21175
> +             input_files = input_files,
> +             output_files = output_files,
> +             tool = IcuTool("genrb"),
> diff --git a/meta/recipes-support/icu/icu_66.1.bb b/meta/recipes-support/icu/icu_66.1.bb
> index 08254648e4..6ba88595df 100644
> --- a/meta/recipes-support/icu/icu_66.1.bb
> +++ b/meta/recipes-support/icu/icu_66.1.bb
> @@ -21,10 +21,11 @@ BASE_SRC_URI = "https://github.com/unicode-org/icu/releases/download/release-${I
>  DATA_SRC_URI = "https://github.com/unicode-org/icu/releases/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip"
>  SRC_URI = "${BASE_SRC_URI};name=code \
>             ${DATA_SRC_URI};name=data \
> +           file://0001-Fix-big-endian-build.patch;patchdir=${WORKDIR} \

why this change ?

> +           file://0002-ICU-21175-Add-cnvalias-as-a-dependency-of-misc_res.patch;patchdir=${WORKDIR} \
>             file://filter.json \
>             file://icu-pkgdata-large-cmd.patch \
>             file://fix-install-manx.patch \
> -           file://0001-Fix-big-endian-build.patch;apply=no \
>             file://0001-icu-Added-armeb-support.patch \
>             file://CVE-2020-10531.patch \
>             "
> @@ -47,7 +48,6 @@ do_make_icudata_class-target () {
>      cd ${S}
>      rm -rf data
>      cp -a ${WORKDIR}/data .
> -    patch -p1 < ${WORKDIR}/0001-Fix-big-endian-build.patch
>      ${@bb.utils.contains('PACKAGECONFIG', 'make-icudata', '', 'exit 0', d)}
>      AR='${BUILD_AR}' \
>      CC='${BUILD_CC}' \
> --
> 2.27.0
>
>
> 
>
