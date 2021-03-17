Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.513.1616012889795381343
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 13:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hfHWPMEh;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id f12so2456536qtq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 13:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FFmkxYrGn5Xp/4giBLWvhHZCYs7oTR7LeShPb4KloQ4=;
        b=hfHWPMEh96NcXdJywvAcl4kMK30slh5s8WhN47ekBtVuZ10YjeU7NR5Ihql9f0JU6T
         xA/+Lwy1ZeYrQk/M05I3BluWRW4zq87CvrJ1N/X2nb73l+vL8HZcpKnLkTKJJnpPGWF6
         yfGM+r2s+qc12yYWdKPneYdPNPpbINGJH1m+r11ep6LYvXZOLnsnkNa/j8tBdBr2w5VW
         vuLXLwESCDzVCnmGr0fxhx7mpoe3JBgLOdHe/Mf0t84LvuYzm5vIJZezmtuAsTYG5A/+
         z+a67Te9wgREHsr4Cv7QxlQY645hFn417Wrcnk8auR1oYHAxhgFnrPuETemxCHBcl5jf
         rNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FFmkxYrGn5Xp/4giBLWvhHZCYs7oTR7LeShPb4KloQ4=;
        b=gFA6CKF1wv5gCvelfnQyHvl740BXiRvRmBXbfotdKtZfpcx6TXM/AFyR53lgYRm7J5
         tQQEfQiD6mDon4J9Lwr62QhnnMIXzUHuCLPb3cSSXwmH7iydlwCXbfZbJX+zVtXgNCzC
         WLeOEObxgbdBypYqtCLQhjWxi3ps+rnyreDM8DBVxMMwNHvWg9hbJXO/fgyHxspGts+k
         btBn9G6As90esoVJzB1xv4plVh31QpjiLvvW/C3iI4mDQLZ4fHD5xenwulQon4sv1FRJ
         t6s0UXm2Ld6Ca4r1DpMzPfYXiJhajH1eVcyeDkUqEDKjZzmjjDlhIjp/mLwK1uGJ83Ih
         mGCg==
X-Gm-Message-State: AOAM5312hrjm7w7SUZNAVKvNeQJ7tOQzLl/KyjfgSyFvHI7/KTblMvN9
	7M7heQ5OsC4XxAZiO1LMLB1iFxH4PUWBo5Vz7s4=
X-Google-Smtp-Source: ABdhPJyuCtIzMH5fCRuCR2ODg3hH8kYuwYhl+yfEXiBYTYPsYHJiE2//BgQ54d84S62iweDBo8oZEUmiPnqvaXUuazM=
X-Received: by 2002:ac8:5a46:: with SMTP id o6mr764646qta.289.1616012888714;
 Wed, 17 Mar 2021 13:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210317003155.1368207-1-raj.khem@gmail.com> <CANNYZj9LrYwcTP2vswRmwiM7FYMR8DZ8CZuciTJAJ1WTQvyhzg@mail.gmail.com>
In-Reply-To: <CANNYZj9LrYwcTP2vswRmwiM7FYMR8DZ8CZuciTJAJ1WTQvyhzg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Mar 2021 13:27:42 -0700
Message-ID: <CAMKF1sqe4RouDR669z1RePCVXDBCAdB69i-8zAoMx_aVEbaiiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Reduce stack and heap sizes for jsc on musl
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Andrei Gherzan <andrei@gherzan.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 17, 2021 at 4:10 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Please Khem, send these patches upstream first.
>

its widely discussed problem in webkit and musl circuits, the patch
here is carried by almost all musl distros in some form.
see https://bugs.webkit.org/show_bug.cgi?id=187485
unfortunately, there is no final solution yet which is acceptable
upstream as such.

> Alex
>
> On Wed, 17 Mar 2021 at 01:32, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Fixes
>>
>> [YOCTO #14281]
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Andrei Gherzan <andrei@gherzan.com>
>> ---
>>  .../webkitgtk/musl-lower-stack-usage.patch    | 51 +++++++++++++++++++
>>  meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  1 +
>>  2 files changed, 52 insertions(+)
>>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
>>
>> diff --git a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
>> new file mode 100644
>> index 0000000000..3d66766d9a
>> --- /dev/null
>> +++ b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
>> @@ -0,0 +1,51 @@
>> +reduce thread stack and heap usage for javascriptcore on musl
>> +
>> +default sizes for musl are smaller compared to glibc, this matches
>> +to musl defaults, avoid stack overflow crashes in jscore
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +--- a/Source/JavaScriptCore/runtime/OptionsList.h
>> ++++ b/Source/JavaScriptCore/runtime/OptionsList.h
>> +@@ -75,6 +75,18 @@ constexpr bool enableWebAssemblyStreamin
>> + // On instantiation of the first VM instance, the Options will be write protected
>> + // and cannot be modified thereafter.
>> +
>> ++#if OS(LINUX) && !defined(__GLIBC__)
>> ++// non-glibc options on linux ( musl )
>> ++constexpr unsigned jscMaxPerThreadStack = 80 * KB;
>> ++constexpr unsigned jscSoftReservedZoneSize = 32 * KB;
>> ++constexpr unsigned jscReservedZoneSize = 16 * KB;
>> ++#else
>> ++//default
>> ++constexpr unsigned jscMaxPerThreadStack = 4 * MB;
>> ++constexpr unsigned jscSoftReservedZoneSize = 128 * KB;
>> ++constexpr unsigned jscReservedZoneSize = 64 * KB;
>> ++#endif
>> ++
>> + #define FOR_EACH_JSC_OPTION(v)                                          \
>> +     v(Bool, useKernTCSM, defaultTCSMValue(), Normal, "Note: this needs to go before other options since they depend on this value.") \
>> +     v(Bool, validateOptions, false, Normal, "crashes if mis-typed JSC options were passed to the VM") \
>> +@@ -90,9 +102,9 @@ constexpr bool enableWebAssemblyStreamin
>> +     \
>> +     v(Bool, reportMustSucceedExecutableAllocations, false, Normal, nullptr) \
>> +     \
>> +-    v(Unsigned, maxPerThreadStackUsage, 5 * MB, Normal, "Max allowed stack usage by the VM") \
>> +-    v(Unsigned, softReservedZoneSize, 128 * KB, Normal, "A buffer greater than reservedZoneSize that reserves space for stringifying exceptions.") \
>> +-    v(Unsigned, reservedZoneSize, 64 * KB, Normal, "The amount of stack space we guarantee to our clients (and to interal VM code that does not call out to clients).") \
>> ++    v(Unsigned, maxPerThreadStackUsage, jscMaxPerThreadStack, Normal, "Max allowed stack usage by the VM") \
>> ++    v(Unsigned, softReservedZoneSize, jscSoftReservedZoneSize, Normal, "A buffer greater than reservedZoneSize that reserves space for stringifying exceptions.") \
>> ++    v(Unsigned, reservedZoneSize, jscReservedZoneSize, Normal, "The amount of stack space we guarantee to our clients (and to interal VM code that does not call out to clients).") \
>> +     \
>> +     v(Bool, crashOnDisallowedVMEntry, ASSERT_ENABLED, Normal, "Forces a crash if we attempt to enter the VM when disallowed") \
>> +     v(Bool, crashIfCantAllocateJITMemory, false, Normal, nullptr) \
>> +@@ -601,7 +613,7 @@ public:
>> +     bool init(const char*);
>> +     bool isInRange(unsigned);
>> +     const char* rangeString() const { return (m_state > InitError) ? m_rangeString : s_nullRangeStr; }
>> +-
>> ++
>> +     void dump(PrintStream& out) const;
>> +
>> + private:
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
>> index d0a41f48c7..36d33f550d 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
>> @@ -20,6 +20,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>>             file://include_xutil.patch \
>>             file://reduce-memory-overheads.patch \
>>             file://0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch \
>> +           file://musl-lower-stack-usage.patch \
>>             "
>>
>>  SRC_URI[sha256sum] = "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
>> --
>> 2.31.0
>>
>>
>> 
>>
