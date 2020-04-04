Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.2283.1586022266213213180
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=taktiiu7;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id g7so9265279qtj.13
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2020 10:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9bSNZdlVUZX5II8xYr7M2m2atLOaw2WYtHqe/k3jy1k=;
        b=taktiiu7MOxMTDMZfxU7HTmfevBHtIGFkoFXyu20YVuig4U92UwxTgr1GUMCsU4usO
         b4Db3Zl0sVKDG5pMM+V1toiTV/w1TRqn5DwBxx/UVNvU1sK59vLzW2ZLmtzP8Rw9ljvb
         vlac0itbDuG74QhKQ+CplgFr7frzT+nX0iTgTgP78cI5Df2hj4jlGDLgJqdlgVZ/vWNy
         nrH88XCVahZRr/YLb/CeBk08wcl7tsBTETd70qth01e/jb/ALvaBv7+jhsKbnGa3Tr9P
         s4xeae1PpfMa/hpe+F7WSbkWVRw/tq/FyXu+XjlnaGUmme8VtVtLcbDhTv8kFSZ9cL9n
         q2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9bSNZdlVUZX5II8xYr7M2m2atLOaw2WYtHqe/k3jy1k=;
        b=HYZPnnjVS5RckWth/1e0NldxEI3n1tCW/2ymT5w95JIDeziBJ/2Mn8PFzPufigvUFC
         OlmaTYS/AwC7LcMh1c0Iy5ft/KHaL8AGgm8Vz+iF7htoHdQVP0NLwwZ/Md5sQ7I50PXq
         syxLwRJkhZTHJ8ulP6UFSVhAK2GuT23MTcCU4nYz5BFZw/pqYn6f2JI0ryhHEf6/04rZ
         IgdFAvOyhfR59TIRtY9SOXTCdiQSUvYxxypEJ5TXUyX4EKl997h3vUx5YfvmDogqob5n
         Zz1ypmZLjIfWt/PwVF7Wv4QoAmTIg1500egLX0lqAA/ciNJF/ty9RI/uOOzqA8kHHoVw
         bCfw==
X-Gm-Message-State: AGi0PuYvXjMil9G3DSDUjIO3QeM+abuyeAXN4NcZsrR5Kc3JsE7daGit
	VLR+TVaHc5jbmTo5L/+hBe7sip44HFovlSJBS+pHNpAE
X-Google-Smtp-Source: APiQypKa2FfHGOdomTOlMeHSqwKuOSPepWwroZgrE7vTvVsGlok0Hu4cCd59xSAD6oKNhEGOvSyp1WQC/A1DvAR8yFA=
X-Received: by 2002:ac8:17f9:: with SMTP id r54mr13659281qtk.285.1586022264882;
 Sat, 04 Apr 2020 10:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200404172012.2978960-1-raj.khem@gmail.com>
In-Reply-To: <20200404172012.2978960-1-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 4 Apr 2020 10:43:58 -0700
Message-ID: <CAMKF1sqmT_hFHN3XOYWGnWDx8oNP4UBfviwodSqu8vooqG7SNQ@mail.gmail.com>
Subject: Re: [PATCH V4] icu: Add knobs to generate a subset of ICU data
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Wouter Meek <w.meek@metrological.com>
Content-Type: text/plain; charset="UTF-8"

ignore this one

On Sat, Apr 4, 2020 at 10:19 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Recent versions of ICU (64+) provides a tool for configuring ICU
> locale data file with finer granularity [1]
>
> Default generated size for libicudata.so.66.1 is ~27M, which is quite
> large for embedded systems and all of them may not even need all locale
> data.
>
> This patch calls the icudata buildtool during configure on the icudata
> and utilizes a filter called 'filter.json` ( empty by default) to
> create the data, default behavior should remain same but someone can
> add a filter.json in own layer to configure this data, e.g.
>
> {
>   "localeFilter": {
>     "filterType": "language",
>     "whitelist": [
>       "en",
>       "de",
>       "it"
>     ]
>   }
> }
>
> would only generate the locale data for english/german/italian
>
> This would reduce the size of libicudata.so.66.1 to 12M
>
> Ensure that icudata is generated using host-tools so it can deal with
> endianness correctly, when host and target systems have different
> endianness
>
> install the icudtata file back into in/ folder so that main build
> can now pickup this data file instead of regenerating it and wiping
> out the filter changes that are expected to take effect
>
> [1] https://github.com/unicode-org/icu/blob/master/docs/userguide/icu_data/buildtool.md
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Suggested-by: Wouter Meek <w.meek@metrological.com>
> ---
> v2: Fix build for BE systems
> v3: Unset AR and RANLIB too
> v4: Install fresh icudata back into data/in folder
>
>  meta/recipes-support/icu/icu/filter.json |  2 ++
>  meta/recipes-support/icu/icu_66.1.bb     | 26 +++++++++++++++++++++---
>  2 files changed, 25 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-support/icu/icu/filter.json
>
> diff --git a/meta/recipes-support/icu/icu/filter.json b/meta/recipes-support/icu/icu/filter.json
> new file mode 100644
> index 0000000000..2c63c08510
> --- /dev/null
> +++ b/meta/recipes-support/icu/icu/filter.json
> @@ -0,0 +1,2 @@
> +{
> +}
> diff --git a/meta/recipes-support/icu/icu_66.1.bb b/meta/recipes-support/icu/icu_66.1.bb
> index 5018464c14..736bec4605 100644
> --- a/meta/recipes-support/icu/icu_66.1.bb
> +++ b/meta/recipes-support/icu/icu_66.1.bb
> @@ -18,7 +18,10 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
>  ARM_INSTRUCTION_SET_armv5 = "arm"
>
>  BASE_SRC_URI = "https://github.com/unicode-org/icu/releases/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-src.tgz"
> -SRC_URI = "${BASE_SRC_URI} \
> +DATA_SRC_URI = "https://github.com/unicode-org/icu/releases/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip"
> +SRC_URI = "${BASE_SRC_URI};name=code \
> +           ${DATA_SRC_URI};name=data \
> +           file://filter.json \
>             file://icu-pkgdata-large-cmd.patch \
>             file://fix-install-manx.patch \
>             file://0001-Fix-big-endian-build.patch \
> @@ -28,8 +31,25 @@ SRC_URI = "${BASE_SRC_URI} \
>  SRC_URI_append_class-target = "\
>             file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
>            "
> -SRC_URI[md5sum] = "b33dc6766711517c98d318447e5110f8"
> -SRC_URI[sha256sum] = "52a3f2209ab95559c1cf0a14f24338001f389615bf00e2585ef3dbc43ecf0a2e"
> +SRC_URI[code.sha256sum] = "52a3f2209ab95559c1cf0a14f24338001f389615bf00e2585ef3dbc43ecf0a2e"
> +SRC_URI[data.sha256sum] = "8be647f738891d2beb79d48f99077b3499948430eae6f1be112553b15ab0243e"
>
>  UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
>  UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
> +
> +do_make_icudata_class-target () {
> +    rm -rf ${S}/data
> +    cp -a ${WORKDIR}/data ${S}
> +    cd ${S}
> +    unset AR CC CPP CXX RANLIB CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +    ICU_DATA_FILTER_FILE=${WORKDIR}/filter.json \
> +    ./runConfigureICU Linux --with-data-packaging=archive
> +    oe_runmake ${PARALLEL_MAKE}
> +    install -Dm644 ${S}/data/out/icudt${ICU_MAJOR_VER}l.dat ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
> +}
> +
> +do_make_icudata() {
> +    :
> +}
> +
> +addtask make_icudata before do_configure after do_patch
> --
> 2.26.0
>
