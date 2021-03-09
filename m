Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web12.4251.1615262724774346539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 20:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E3QQ4+kl;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id k7so5796024qvo.6
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 20:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JUHWNPhFLicZW3Kqrr9m0DPXy8hY64Sq7lTNJpFIuG8=;
        b=E3QQ4+klScuCJ503nGxQJpd+ns6UghIvJNVkOF30p8CYdEE051mxf16s5p1/2yavdR
         0izean4DyV3lBQY5IP0W3rNEUBtfNO7DoktPMqTdzHlxgxQfvIzB87UheIBx0rQo63tA
         +B5u68mV8HZb2PQVKsrBmnCqnS8B6rHi17+U0cNIQnIB0vNNepUmgl6i0Rb7MALJfQpM
         1/uVCwqBX5Bz7ah74b+KbzcR+pNYagEqNqHzjMzcPwwPO+Jnao14w7gE6q6Oqneyqth9
         DasTmDWW5Q8WXhCc1fW1hRwJs9PXUT/Ylpv00a/5ghE/8O0gOnAp9W6aJNvxQsLfXA6e
         C/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JUHWNPhFLicZW3Kqrr9m0DPXy8hY64Sq7lTNJpFIuG8=;
        b=NxqkjAOf8+zlqvWqJnmY60HlpRVoxI8fXxION0QJrI74aA60tthNymBwexOPNY7yks
         zrAGhrSgY6tSSlq0UmIFLXJyVJi/JP+sB+SEYFzSFWezql23slxVWM/NZ2HBWF9V68GM
         pl+zF9h3ayCbyzXIBTvb1DwpS8PvxBqQ71JGYwpquJQZ1RSM4ZGgaXODc/IwnDcpDsoJ
         hPMJqZPWFh/+iAHI3enP4q3QvR+7huhdbWtLRtvRgKeOjVSbPpukVk2g0+m1ViU4vyOU
         HtxTn3BUaxXFZNN/eiryW4eLtrMw0Wa+z2UtjaCVdaWVpAF3HZjo44GA4Z9nVJvktrzK
         gz9w==
X-Gm-Message-State: AOAM531Jo5+cwt5hyZkhlOdsh15pE/IR6oa0S4q8Q+Htf+5DjDiffE5M
	VzbCgwuqJyqb0tOmmU0WreReSiQruzJhjFEAGEk=
X-Google-Smtp-Source: ABdhPJyDbgQ/q7RHiVjLL1OEtWOMiTeWUj7+vcYYL396WHo7I0MTPN05wEQxE/JscVDRgNiP61w5E8dIT+L2FQXbwFQ=
X-Received: by 2002:a0c:e5c9:: with SMTP id u9mr24321863qvm.55.1615262723650;
 Mon, 08 Mar 2021 20:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20210308235953.2230531-1-raj.khem@gmail.com> <CANNYZj-bjpj0VFu-Db-x917m07nQLaVKNuvs-=UaLd=H-=h=VQ@mail.gmail.com>
In-Reply-To: <CANNYZj-bjpj0VFu-Db-x917m07nQLaVKNuvs-=UaLd=H-=h=VQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 8 Mar 2021 20:04:57 -0800
Message-ID: <CAMKF1sp7iP4sT4HWWeBhEPnanaEy4cEdoPP90sGYPe22dCFu=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Use linker options to reduce memory overhead during linking
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 8, 2021 at 7:50 PM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>
> Can you please explain the context for this? Why would we want to suppor=
t building webkit on such constrained machines? 8g of ram means they can=E2=
=
=80=99t run more than 4-6 gcc processes, so webkit builds will be unbearab=
ly slow anyway.
>

this helps to avoid unwanted build breaks since gcc crashes when
memory pressure is too high,
when doing parallel builds this can happen very often since there are
other tasks running in parallel, so these situations can arise often
we have seen this happen on machines with 16GB RAM
therefore saving some of the memory during linking helps reduce these
breakages. they can still happen if say machine was doing more than 1
builds in parallel but at least tools have done what they could.

> Alex
>
> On Tue 9. Mar 2021 at 1.00, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Helps builds on machines with less RAM ( 8G )
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../webkitgtk/reduce-memory-overheads.patch   | 22 +++++++++++++++++++
>>  meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  1 +
>>  2 files changed, 23 insertions(+)
>>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/reduce-memory-ov=
erheads.patch
>>
>> diff --git a/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads=
.patch b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
>> new file mode 100644
>> index 0000000000..0493150a91
>> --- /dev/null
>> +++ b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
>> @@ -0,0 +1,22 @@
>> +From: Alberto Garcia <berto@igalia.com>
>> +Subject: Reduce memory usage when not using the Gold linker
>> +Bug-Debian: https://bugs.debian.org/949621
>> +Forwarded: no
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +--- a/Source/cmake/OptionsCommon.cmake
>> ++++ b/Source/cmake/OptionsCommon.cmake
>> +@@ -95,6 +95,12 @@ option(GCC_OFFLINEASM_SOURCE_MAP
>> +   "Produce debug line information for offlineasm-generated code"
>> +   ${GCC_OFFLINEASM_SOURCE_MAP_DEFAULT})
>> +
>> ++# Pass --reduce-memory-overheads to the bfd linker in order to save m=
emory
>> ++if (NOT USE_LD_GOLD)
>> ++    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--reduc=
e-memory-overheads")
>> ++    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--re=
duce-memory-overheads")
>> ++endif ()
>> ++
>> + # Enable the usage of OpenMP.
>> + #  - At this moment, OpenMP is only used as an alternative implementa=
tion
>> + #    to native threads for the parallelization of the SVG filters.
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb b/meta/recipe=
s-sato/webkit/webkitgtk_2.30.5.bb
>> index 2928b8e55b..a1dd76ce81 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
>> @@ -18,6 +18,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN=
}-${PV}.tar.xz \
>>             file://0001-Fix-build-with-musl.patch \
>>             file://include_array.patch \
>>             file://include_xutil.patch \
>> +           file://reduce-memory-overheads.patch \
>>             "
>>  SRC_URI[sha256sum] =3D "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac8=
6eb23999bfed5a7f1f"
>>
>> --
>> 2.30.1
>>
>>
>>=20
>>
