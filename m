Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.8256.1625474890642062581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 01:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jJ941U7o;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id c28so7720493lfp.11
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 01:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DD3agODxK3tJucLl5w1w8evKaQgANYWTql5k7DlT7JE=;
        b=jJ941U7oL632yFCwOw7lM3ti1JqhTE4SmtRnJgawQIvSLSzV2YAeOtbCJYmY97o2D8
         IPdYZhQtMXKxKtv5x+WMDnpKZ7NYrScXatHWk8rxMSfnGI4wTo9tw1yaPRPu2eCR3mfl
         9dHkLGNrBOaCnVA7lFXUefJmsZGrI2f6XUiYoyN2u7CJgT6XK2/mUoyd5pkWG6d4Q4uk
         Br2naBJ4FO+ExCOsx+hOeofvlHiKNV/k1kWcLuF7he9QgjcY2+R+ZX92AhQBfdnJJ6Ik
         8oS2Jr7xUqcPvfYzp3larRtSKWu/QcoU7Kzv2RqZkvrDoe/SsqR10bHqeFv0+78qkzxz
         PUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DD3agODxK3tJucLl5w1w8evKaQgANYWTql5k7DlT7JE=;
        b=fSubaf+Zrn6U6g33uYfoPCVN7D+knCmeIeXuufUeWmwAxUwOIoq+R7PAagZ9o9KwEs
         RSt1IMnZm5TmPSpgmZm0vZTCCWxdQK+mZ06GGN9FpnKpNdIg/U+P1qi3Ooqwl5urq3W5
         1bi+VYEtT+7pY0psd+AE3Ib3dthrPRGfq5hhvtwt8IqEWduVCl29dybhG8PNuGYQ6tgW
         OHWbBC9rw71jBT1kIf0bDL7FtBZ59+EtWycHEa5LItBcpTnZOIPgHT+AeUiJdqjVw6HL
         Xx+tHsdY2zNbz4/z5knSQIsB53srMXGPjNchwnvI7Tvkx2D57Nao89IHrAs2RkB0SCwo
         o3ww==
X-Gm-Message-State: AOAM532f9tDDdR+7EkxRNSSJ/Uzr1sSaSl6zStREnwKir43HeaGVuIqB
	7++KIaukjn5PU1z1FndR5LfDOWDETC3vybX0Hjc=
X-Google-Smtp-Source: ABdhPJyuwd3934rGXJXfUnFFXZc2uATm+euYu+n2u7VSrhwJvkkapSfPWFBzCo3zEvtRhZId1lgcCTZIp+BjIw3jkXc=
X-Received: by 2002:ac2:5619:: with SMTP id v25mr9505876lfd.434.1625474888479;
 Mon, 05 Jul 2021 01:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcU0ibVFbf5x0OzEunTymSd8+_chCD3432xa3CTeL7QzjA@mail.gmail.com>
 <20210704112159.150061-1-vinay.m.engg@gmail.com> <CANNYZj9_peVZSZNZX_aB_ETx6Hsnk1YK1Ok4Yc0vjSBNxFXxGw@mail.gmail.com>
In-Reply-To: <CANNYZj9_peVZSZNZX_aB_ETx6Hsnk1YK1Ok4Yc0vjSBNxFXxGw@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 5 Jul 2021 14:17:57 +0530
Message-ID: <CANUMPcX-_mC+b3Cf2bWR+iuE8Hfp+2XE7gQLk0OMf61=8y109Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc-package.inc: To fix build issue with glibc-testsuite.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <rwmacleod@gmail.com>, umesh kalappa0 <umesh.kalappa0@gmail.com>, 
	vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

Here is my analysis,

$bitbake -e glibc-testsuite
==============================
 2 # line: 222, file:
/ala-lpggp31/vinay/tcwrlgcc-399/poky/meta/recipes-core/glibc/glibc-package.inc
 3 stash_locale_cleanup() {
 4   cleanupdir=$1
 5   # Remove all files which do_stash_locale() copies
 6   for i in mtrace sotruss xtrace; do
 7     rm -f $cleanupdir/usr/bin/$i
 8   done
 9   rm -f $cleanupdir/usr/bin/localedef
10   rm -rf $cleanupdir/usr/share/i18n
11   rm -rf $cleanupdir/usr/lib/gconv
12   rm -rf $cleanupdir/usr/lib/locale
13   rm -rf $cleanupdir/usr/share/locale
14   rmdir --ignore-fail-on-non-empty $cleanupdir/usr/share
15
16   if [ "/usr/lib" != "/usr/lib" ] && [ "/lib" != "/usr/lib" ]; then
17     if [ -d "$cleanupdir/usr/lib" ]; then
18       if [ -z "" -o \
19            ! -e "$cleanupdir/usr/lib/" ]; then
20         # error out if directory isn't empty
21         # this dir should only contain locale dir
22         # which has been deleted in the previous step
23         rmdir $cleanupdir/usr/lib
24       fi
25     fi
26   fi
27 }
28
29 # line: 251, file:
/ala-lpggp31/vinay/tcwrlgcc-399/poky/meta/recipes-core/glibc/glibc-package.inc
30 stash_locale_package_cleanup() {
31   stash_locale_cleanup
/ala-lpggp31/vinay/tcwrlgcc-399/bld-arm/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/glibc-testsuite/2.33-r0/package
32 }
33
34 # line: 248, file:
/ala-lpggp31/vinay/tcwrlgcc-399/poky/meta/recipes-core/glibc/glibc-package.inc
35 stash_locale_sysroot_cleanup() {
36   stash_locale_cleanup
/ala-lpggp31/vinay/tcwrlgcc-399/bld-arm/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/glibc-testsuite/2.33-r0/sysroot-destdir
37 }
==============================

Its trying to remove "usr/share" at
"bld-arm/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/glibc-testsuite/2.33-r0/sysroot-destdir"
which does not exists in glibc-testsuite case.

Contents of "bld-arm/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/glibc-testsuite/2.33-r0/sysroot-destdir"
are
"sysroot-providers/glibc-testsuite"

$bitbake -e glibc
==============================
19167 # line: 222, file:
/ala-lpggp31/vinay/tcwrlgcc-399/poky/meta/recipes-core/glibc/glibc-package.inc
 1 stash_locale_cleanup() {
 2   cleanupdir=$1
 3   # Remove all files which do_stash_locale() copies
 4   for i in mtrace sotruss xtrace; do
 5     rm -f $cleanupdir/usr/bin/$i
 6   done
 7   rm -f $cleanupdir/usr/bin/localedef
 8   rm -rf $cleanupdir/usr/share/i18n
 9   rm -rf $cleanupdir/usr/lib/gconv
10   rm -rf $cleanupdir/usr/lib/locale
11   rm -rf $cleanupdir/usr/share/locale
12   rmdir --ignore-fail-on-non-empty $cleanupdir/usr/share
13
14   if [ "/usr/lib" != "/usr/lib" ] && [ "/lib" != "/usr/lib" ]; then
15     if [ -d "$cleanupdir/usr/lib" ]; then
16       if [ -z "" -o \
17            ! -e "$cleanupdir/usr/lib/" ]; then
18         # error out if directory isn't empty
19         # this dir should only contain locale dir
20         # which has been deleted in the previous step
21         rmdir $cleanupdir/usr/lib
22       fi
23     fi
24   fi
25 }
26
27 # line: 251, file:
/ala-lpggp31/vinay/tcwrlgcc-399/poky/meta/recipes-core/glibc/glibc-package.inc
28 stash_locale_package_cleanup() {
29   stash_locale_cleanup
/ala-lpggp31/vinay/tcwrlgcc-399/bld-arm/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/glibc/2.33-r0/package
30 }
31
32 # line: 248, file:
/ala-lpggp31/vinay/tcwrlgcc-399/poky/meta/recipes-core/glibc/glibc-package.inc
33 stash_locale_sysroot_cleanup() {
34   stash_locale_cleanup
/ala-lpggp31/vinay/tcwrlgcc-399/bld-arm/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/glibc/2.33-r0/sysroot-destdir
35 }
==============================

In case of "bitbake glibc" the same "usr/share" directory exists at
"bld-arm/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/glibc/2.33-r0/sysroot-destdir/"
so
no error occurs.

Regards,
Vinay

On Sun, Jul 4, 2021 at 10:33 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This looks like a workaround that does not fix the actual issue. Can you please look into what is causing the failure, if it is reproducible reliably, and at which point it regressed?
>
> Alex
>
> Alex
>
> On Sun, 4 Jul 2021 at 13:22, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> Added condition to check "$cleanupdir${datadir}" exists.
>>
>> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>> ---
>>  meta/recipes-core/glibc/glibc-package.inc | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
>> index 92e5dbac61..df3f612192 100644
>> --- a/meta/recipes-core/glibc/glibc-package.inc
>> +++ b/meta/recipes-core/glibc/glibc-package.inc
>> @@ -230,7 +230,9 @@ stash_locale_cleanup () {
>>         rm -rf $cleanupdir${libdir}/gconv
>>         rm -rf $cleanupdir${localedir}
>>         rm -rf $cleanupdir${datadir}/locale
>> +  if [ -d $cleanupdir${datadir} ]; then
>>         rmdir --ignore-fail-on-non-empty $cleanupdir${datadir}
>> +  fi;
>>
>>         if [ "${libdir}" != "${exec_prefix}/lib" ] && [ "${root_prefix}/lib" != "${exec_prefix}/lib" ]; then
>>                 if [ -d "$cleanupdir${exec_prefix}/lib" ]; then
>> --
>> 2.31.1
>>
>>
>> 
>>
