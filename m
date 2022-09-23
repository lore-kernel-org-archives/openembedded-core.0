Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DED6ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 16:25:24 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.9470.1663950314780289839
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Sep 2022 09:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=psmmwCMe;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id z2so954628edi.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Sep 2022 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=OzZbm6T9ByK6C3HJb4LVukFntuRh6VPVlayNOkUTi9Y=;
        b=psmmwCMe7fW/Tv4vSZp8AKqjjXwk/mCYhaWim3lI93bP7nTpkG5QpfR+ZXAXO3QOXm
         l4xFH1Ii46P9JsyDvoK2cIKDC0Luw3fcQIUL0MsP3UdCLtBd5cak7OIGGJYL9hlsuiEp
         IjG8X3imk2oTENFyxa+lEicvUyfkyG5jA0rKuHvAe/cvUHnlU9mBIyhSDSXh1VX60255
         SbCW20U8qeSNWkkmdi3rU6NXamLK6LZzlN0n5ds0XbViASihnXUrI32IAoHiXP28nPo7
         lzCVckMYgF3+0L7w+FWySRefcGzcPVTPLtlpqIATXObqE/iCM9PulkbRT7hNLKnaGkXA
         FzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OzZbm6T9ByK6C3HJb4LVukFntuRh6VPVlayNOkUTi9Y=;
        b=Cm+Cn9CYKjIqfV5R8mVlaKypzV+3ok1f93IEjOnbUUX8V4iJ6QwtYd5Hn8jiLlA9qz
         7lrZ3y67f9mE7btVUuvbPgKjLeb8aitKpCqKi2e51zIZCgs2q6KxUx1gj3LD/E0n0wLx
         t12VKOLEqXqj1jT8oEmS0e+J3s0/vqOBWRvW/VOJjKrkEUq3rbK4KB6263x8YFbyXFaI
         UdVvbrWP24GBYmyoAnqOuaec2xYmBy2H2C6f+Surm1nJYP2ZXFxorRpt6C6wAkpy6m5c
         GHCE+71T7XeliFHmarn1CgUUxx97p7BBip+r4SPqi/QXcdYW0El1Lbpd2xKcwfICQBgM
         g/nA==
X-Gm-Message-State: ACrzQf1fyT0eNuhZ6IChEof4IS1aUCr4aKrdEBKAR1K4mLNm8WM2qTGT
	ELYeVfC9yrgCDKQtgB2Xq/Pny54w9EGnUTKEeJIMzw==
X-Google-Smtp-Source: 
 AMsMyM7qoEcIyDsOyfPA8StvEzLxeFZxzzgFghkofnWzeKGQy2xoP6kt2UEXcSQUBO9G/ddbm0N299xoL9xnDMXXZnA=
X-Received: by 2002:a05:6402:289a:b0:453:ff16:1a8f with SMTP id
 eg26-20020a056402289a00b00453ff161a8fmr9386791edb.330.1663950312194; Fri, 23
 Sep 2022 09:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220921082444.8702-1-bhabu.bindu@kpit.com>
 <CAOSpxdbctABSHo7kUJS4=08sKnK=UYFgKRCX76xjPhq3geiheQ@mail.gmail.com>
 <PN3PR01MB6124539894A70606B05A46E895519@PN3PR01MB6124.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PN3PR01MB6124539894A70606B05A46E895519@PN3PR01MB6124.INDPRD01.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 23 Sep 2022 06:24:58 -1000
Message-ID: 
 <CAOSpxdb3FS_WNA_3ByuKeuMXCW9vt-Rdy6ER5hduZYxtrHe_bQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] qemu: Fix CVE-2021-3611
To: Bhabu Bindu <Bhabu.Bindu@kpit.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Sep 2022 16:25:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171001

On Thu, Sep 22, 2022 at 9:28 PM Bhabu Bindu <Bhabu.Bindu@kpit.com> wrote:

> Kindly find the patch file attached,and try to run the build.

Sorry, I am still getting the same error with the attached patch:

| FAILED: libcommon.fa.p/hw_audio_intel-hda.c.o
| gcc -m64 -mcx16 -Ilibcommon.fa.p -I../qemu-6.2.0/slirp
-I../qemu-6.2.0/slirp/src
-I/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/qem=
u-system-native/6.2.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/include/pixman-1
-I/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/qem=
u-system-native/6.2.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/include
-I/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/qem=
u-system-native/6.2.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/include/SDL2
-I/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/qem=
u-system-native/6.2.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/include/libmount
-I/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/qem=
u-system-native/6.2.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/include/blkid
-I/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/qem=
u-system-native/6.2.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/include/glib-2.0
-I/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/qem=
u-system-native/6.2.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/lib/glib-2.0/include
-I/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/qem=
u-system-native/6.2.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/include/gio-unix-2.0
-I/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/qem=
u-system-native/6.2.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/include/libdrm
-I/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/qem=
u-system-native/6.2.0-r0/recipe-sysroot-native/usr/share/pkgconfig/../../..=
/usr/include
-I/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/qem=
u-system-native/6.2.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/include/virgl
-fdiagnostics-color=3Dauto -Wall -Winvalid-pch -std=3Dgnu11 -O2 -g
-isystem /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-li=
nux/qemu-system-native/6.2.0-r0/qemu-6.2.0/linux-headers
-isystem linux-headers -iquote . -iquote
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/qemu-=
system-native/6.2.0-r0/qemu-6.2.0
-iquote /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-lin=
ux/qemu-system-native/6.2.0-r0/qemu-6.2.0/include
-iquote /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-lin=
ux/qemu-system-native/6.2.0-r0/qemu-6.2.0/disas/libvixl
-iquote /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-lin=
ux/qemu-system-native/6.2.0-r0/qemu-6.2.0/tcg/i386
-pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration
-Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
-Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
-Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2
-Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi
-fstack-protector-strong -O2 -pipe
-isystem/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-lin=
ux/qemu-system-native/6.2.0-r0/recipe-sysroot-native/usr/include
-O2 -fPIE -D_REENTRANT -Wno-undef -MD -MQ
libcommon.fa.p/hw_audio_intel-hda.c.o -MF
libcommon.fa.p/hw_audio_intel-hda.c.o.d -o
libcommon.fa.p/hw_audio_intel-hda.c.o -c
../qemu-6.2.0/hw/audio/intel-hda.c
| ../qemu-6.2.0/hw/audio/intel-hda.c: In function =E2=80=98intel_hda_respon=
se=E2=80=99:
| ../qemu-6.2.0/hw/audio/intel-hda.c:348:33: error: =E2=80=98MemTxAttrs=E2=
=80=99 {aka
=E2=80=98const struct MemTxAttrs=E2=80=99} has no member named =E2=80=98mem=
ory=E2=80=99
|   348 |     const MemTxAttrs attrs =3D { .memory =3D true };
|       |                                 ^~~~~~
| [1140/5210] Compiling C object libcommon.fa.p/hw_acpi_tco.c.o
| [1141/5210] Compiling C object libcommon.fa.p/hw_acpi_acpi-stub.c.o
| [1142/5210] Compiling C object libcommon.fa.p/hw_acpi_ipmi-stub.c.o
| [1143/5210] Compiling C object libcommon.fa.p/hw_acpi_piix4.c.o
| [1144/5210] Compiling C object libcommon.fa.p/hw_acpi_tpm.c.o
| [1145/5210] Compiling C object libcommon.fa.p/hw_acpi_ich9.c.o
| [1146/5210] Compiling C object libcommon.fa.p/hw_acpi_aml-build-stub.c.o
| [1147/5210] Compiling C object libcommon.fa.p/hw_acpi_ipmi.c.o
| [1148/5210] Compiling C object libcommon.fa.p/hw_audio_via-ac97.c.o
| [1149/5210] Compiling C object libcommon.fa.p/hw_acpi_acpi-x86-stub.c.o
| [1150/5210] Compiling C object libcommon.fa.p/hw_acpi_pcihp.c.o
| [1151/5210] Compiling C object
libcommon.fa.p/hw_acpi_acpi-cpu-hotplug-stub.c.o
| [1152/5210] Compiling C object
libcommon.fa.p/hw_acpi_acpi-mem-hotplug-stub.c.o
| [1153/5210] Compiling C object libcommon.fa.p/hw_acpi_aml-build.c.o
| [1154/5210] Compiling C++ object libcommon.fa.p/disas_nanomips.cpp.o
| ninja: build stopped: subcommand failed.
| ERROR: oe_runmake failed
| WARNING: /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-=
linux/qemu-system-native/6.2.0-r0/temp/run.do_compile.1092256:182
exit 1 from 'exit 1'

Steve

> ________________________________
> From: Steve Sakoman <steve@sakoman.com>
> Sent: 21 September 2022 23:00
> To: Bhabu Bindu <Bhabu.Bindu@kpit.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>; Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
> Subject: Re: [OE-core][kirkstone][PATCH] qemu: Fix CVE-2021-3611
>
> Caution: This email originated from outside of the KPIT. Do not click lin=
ks or open attachments unless you recognize the sender and know the content=
 is safe.
>
> On Tue, Sep 20, 2022 at 10:25 PM Bhabu Bindu via
> lists.openembedded.org <Bhabu.Bindu=3Dkpit.com@lists.openembedded.org>
> wrote:
> >
> > As per the ubuntu community [https://apc01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fubuntu.com%2Fsecurity%2FCVE-2021-3611&amp;data=3D=
05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C35394=
51eb46e4a26a242ff61502855c7%7C0%7C0%7C637993782811273348%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000%7C%7C%7C&amp;sdata=3DV%2F2eaDweptJwnjFNXZxtXZqaAJzZ5s8M58hr7j5cNeg%3D&=
amp;reserved=3D0]
> > To fix CVE-2021-3611 we need to backport the below support patches as w=
ell
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D41d5e8da3d5e0a143a9fb3=
97c9f34707ec544997&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811273348%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DP1IQLiLcOdX3ClK2SpQ=
T%2B7jQLq0W9SO4wkMtfjXEhsg%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D7ccb391ccd594b3f33de8d=
eb293ff8d47bb4e219&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811273348%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DM2PiZQU1%2FEexr%2BG=
2yZMkk95Efy8%2FDpIKmh6UoyfMCNI%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D7a36e42d9114474278ce30=
ba36945cc62292eb60&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811273348%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D8mta2KgQOtbAX5AuOaE=
KKiYgj6NzAg76ixKhHIAe0BM%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D4afd0f2f220ec3dc8518b8=
de0d66cbf8d2fd1be7&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811273348%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dc2iSsgogiF9kh%2BOQz=
O9rQnBTr9x5EPyhBTx34AQCG%2Fs%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D23faf5694ff8054b847e97=
33297727be4a641132&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811273348%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DnskpSdI3CR6EZhqkITc=
fb3sszvovogQVjN2sF8n8G%2B4%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3Dba06fe8add5b788956a731=
7246c6280dfc157040&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811273348%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DuSbMLYD2tlHEk7K2FND=
ISSCpdaNARw9W5nGzzLnj0R0%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3Da1d4b0a3051b3079c8db60=
7f519bc0fcb30e17ec&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811273348%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D5kkn93RSkQrV6FDwJlw=
sLOsVfociJfajfb68KSp08%2BQ%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3Dc0ee1527358474c7506799=
3d1bb233ad3a4ee081&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811273348%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DRzY7IaPbfHjy2yRxdiF=
4%2FeB6O4y1ZfdGH9PeBBG7Q2Q%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D5e468a36dcdd8fd5eb0428=
2842b72967a29875e4&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D848rujWamsba1mGuv%2=
FYiEYU3Jh8%2BER03wgfjGuRYDag%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3De2d784b67dc724a9b0854b=
49255ba0ee8ca46543&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DUyeMJDrddiJ3MvGKzVs=
%2BrRu5eG%2FWdSpx%2FA9j7%2BT%2FA9s%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D959384e74e1b508acc3af6=
e806b3d7b87335fc2a&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DcYocYQJOjPhemrmss1A=
pTJdI2gMKFtM34iIvk%2BsXSuc%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D392e48af3468d7f8e49db3=
3fdc9e28b5f99276ce&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DuBj1kCRVw9K2RxtaHn1=
Ms%2BzT%2BauQ8waFhshCCGVNEbU%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D1e5a3f8b2a976054da96cb=
bb9de6cbac7c2efb79&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Db96bxFvMZrY99sV5vz%=
2FqHF1t%2FVmRv1O4P1KNS%2FenRdU%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D292e13142d277c15bdd683=
31abc607e46628b7e1&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dz3aV5PFbDZRNYBWAYBT=
%2FsrarCSsl1A60r2C6IxWkarY%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D2280c27afc65bb2af95dd4=
4a88e3b7117bfe240a&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DngkoMk3GvPdvpDM4jUh=
Nb4rkZSenlCt5rhjHmgXYk%2BU%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D34cdea1db600540a5261dc=
474e986f28b637c8e6&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dc%2FuL85COZ6%2FqqxQ=
okd78aQV%2F7uplh6JjTB2bkHV9ITc%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D24aed6bcb6b6d266149591=
f955c2460c28759eb4&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D6ZP%2Brm6y8ahHieZbc=
EuebRJV52790IXkB6J1s0ZPYSo%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3Dcd1db8df7431edd2210ed0=
123e2e09b9b6d1e621&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DC%2B9on1RP1rLufNftY=
z4FafTfwPaCfcbjO0AtJ1MNWaY%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3Da423a1b523296f8798a585=
1aaaba64dd166c0a74&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DbX%2BY4YkMq6oyfBSdI=
YX1V1aUVWy5kz%2Bc6BsSIRYLzYg%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D398f9a84ac7132e38caf7b=
066273734b3bf619ff&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DOmSJB8iIQOBlf0s%2Bb=
zjVc5Y1JSTf9ctOyQ8yzI0lFlo%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D6bebb270731758fae3114b=
7d24c2b12b7c325cc5&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DDayVzBsWGAacJQuGBti=
r9ENqCbWSA4EhttvWOKOKiwA%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D4a63054bce23982b99f4d3=
c65528e47e614086b2&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e=
4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379937=
82811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DBGOuo0iQ3dpOWSWe%2B=
A4H%2F%2FXM6jfhmBafCzk2K89FdBo%3D&amp;reserved=3D0
> >
> > Add patches to fix CVE-2021-3611
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dpatch%3Bh%3Dbe5a8cf347d0c47ee3e933d=
de075526fd8bd5c40&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e4=
745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63799378=
2811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DpnEqcggPyuLtlKO3vhV9=
KRqCE%2BBcTZU2As7uIDcrn4g%3D&amp;reserved=3D0
> >       https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dpatch%3Bh%3D79fa99831debc9782087e83=
4382c577215f2f511&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e4=
745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63799378=
2811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D4ya8lLzVdCHG3S0S3zhA=
1gi40yWqpwoW%2Bmvw%2BxXC4rw%3D&amp;reserved=3D0
>
> Build fails with this patch:
>
> [1234/5210] Compiling C object libcommon.fa.p/hw_audio_intel-hda.c.o
> FAILED: libcommon.fa.p/hw_audio_intel-hda.c.o
> gcc -m64 -mcx16 -Ilibcommon.fa.p -I../qemu-6.2.0/slirp
> -I../qemu-6.2.0/slirp/src
> -ITOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/include/pixman-1
> -ITOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/include
> -ITOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/include/SDL2
> -ITOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/include/libmount
> -ITOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/include/blkid
> -ITOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/include/glib-2.0
> -ITOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/lib/glib-2.0/include
> -ITOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/include/gio-unix-2.0
> -ITOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/include/libdrm
> -ITOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-sysroot=
-native/usr/share/pkgconfig/../../../usr/include
> -ITOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/include/virgl
> -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -std=3Dgnu11 -O2 -g
> -isystem TOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/qemu-6.=
2.0/linux-headers
> -isystem linux-headers -iquote . -iquote
> TOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/qemu-6.2.0
> -iquote TOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/qemu-6.2=
.0/include
> -iquote TOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/qemu-6.2=
.0/disas/libvixl
> -iquote TOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/qemu-6.2=
.0/tcg/i386
> -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE
> -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
> -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
> -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration
> -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
> -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2
> -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi
> -fstack-protector-strong -O2 -pipe
> -isystemTOPDIR/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-s=
ysroot-native/usr/include
> -O2 -fPIE -D_REENTRANT -Wno-undef -MD -MQ
> libcommon.fa.p/hw_audio_intel-hda.c.o -MF
> libcommon.fa.p/hw_audio_intel-hda.c.o.d -o
> libcommon.fa.p/hw_audio_intel-hda.c.o -c
> ../qemu-6.2.0/hw/audio/intel-hda.c
> ../qemu-6.2.0/hw/audio/intel-hda.c: In function =E2=80=98intel_hda_respon=
se=E2=80=99:
> ../qemu-6.2.0/hw/audio/intel-hda.c:348:33: error: =E2=80=98MemTxAttrs {ak=
a
> const struct MemTxAttrs}=E2=80=99 has no member named =E2=80=98memory=E2=
=80=99
>      const MemTxAttrs attrs =3D { .memory =3D true };
>                                  ^~~~~~
>
> Full log:
>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Ferror=
s.yoctoproject.org%2FErrors%2FDetails%2F672106%2F&amp;data=3D05%7C01%7CBhab=
u.Bindu%40kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637993782811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&=
amp;sdata=3DA4dtHt4UCzdS3I%2Ff5USyDA1heSmK7n7TRKhkuSbaED0%3D&amp;reserved=
=3D0
>
> Steve
>
> > Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc           |   24 +
> >  ...32t-for-reply-queue-head-tail-values.patch |   83 +
> >  ...id_function_take_MemTxAttrs_argument.patch |   60 +
> >  ...et_function_take_MemTxAttrs_argument.patch |   98 ++
> >  ...ed_function_take_MemTxAttrs_argument.patch |   78 +
> >  ...rw_function_take_MemTxAttrs_argument.patch |  158 ++
> >  ...te_function_take_MemTxAttrs_argument.patch | 1453 +++++++++++++++++
> >  ...ap_function_take_MemTxAttrs_argument.patch |  227 +++
> >  ..._buf_rw_function_take_a_void_pointer.patch |   41 +
> >  ..._dma_buf_write_functions_take_a_void.patch |  167 ++
> >  ...rw_function_take_MemTxAttrs_argument.patch |   91 ++
> >  ...rw_function_take_MemTxAttrs_argument.patch |   65 +
> >  ...te_function_take_MemTxAttrs_argument.patch |  129 ++
> >  ...ad_function_take_MemTxAttrs_argument.patch |  222 +++
> >  ...uf_rw_function_propagate_MemTxResult.patch |   91 ++
> >  ...ma_function_take_MemTxAttrs_argument.patch |  120 ++
> >  ...ma_function_take_MemTxAttrs_argument.patch |  151 ++
> >  ...r_dma_function_propagate_MemTxResult.patch |   65 +
> >  ...r_dma_function_propagate_MemTxResult.patch |  175 ++
> >  ...ma_function_take_MemTxAttrs_argument.patch |  303 ++++
> >  ...ma_function_take_MemTxAttrs_argument.patch |  271 +++
> >  ...i_dma_function_propagate_MemTxResult.patch |   47 +
> >  ...i_dma_function_propagate_MemTxResult.patch |  296 ++++
> >  .../qemu/qemu/CVE-2021-3611_1.patch           |   74 +
> >  .../qemu/qemu/CVE-2021-3611_2.patch           |   43 +
> >  25 files changed, 4532 insertions(+)
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-use-uint32t-fo=
r-reply-queue-head-tail-values.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0002_let_dma_memory=
_valid_function_take_MemTxAttrs_argument.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0003_let_dma_memory=
_set_function_take_MemTxAttrs_argument.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0004_let_dma_memory=
_rw_relaxed_function_take_MemTxAttrs_argument.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0005_let_dma_memory=
_rw_function_take_MemTxAttrs_argument.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0006_let_dma_memory=
_read_write_function_take_MemTxAttrs_argument.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0007_let_dma_memory=
_map_function_take_MemTxAttrs_argument.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0008_have_dma_buf_r=
w_function_take_a_void_pointer.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0009_have_dma_buf_r=
ead_and_dma_buf_write_functions_take_a_void.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0010_let_pci_dma_rw=
_function_take_MemTxAttrs_argument.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0011_let_dma_buf_rw=
_function_take_MemTxAttrs_argument.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0012_let_dma_buf_wr=
ite_function_take_MemTxAttrs_argument.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0013_let_dma_buf_re=
ad_function_take_MemTxAttrs_argument.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0014_let_dma_buf_rw=
_function_propagate_MemTxResult.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0015_let_st_pointer=
_dma_function_take_MemTxAttrs_argument.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0016_let_ld_pointer=
_dma_function_take_MemTxAttrs_argument.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0017_let_st_pointer=
_dma_function_propagate_MemTxResult.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0018_let_ld_pointer=
_dma_function_propagate_MemTxResult.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0019_let_st_pointer=
_pci_dma_function_take_MemTxAttrs_argument.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0020_let_ld_pointer=
_pci_dma_function_take_MemTxAttrs_argument.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0021_let_st_pointer=
_pci_dma_function_propagate_MemTxResult.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0022_let_ld_pointer=
_pci_dma_function_propagate_MemTxResult.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3611_1.pat=
ch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3611_2.pat=
ch
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> > index a493ac8add..c8ca7c545c 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -43,6 +43,30 @@ SRC_URI =3D "https://apc01.safelinks.protection.outl=
ook.com/?url=3Dhttps%3A%2F%2Fdownload.qemu.org%2F%24&amp;data=3D05%7C01%7CB=
habu.Bindu%40kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637993782811429582%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&amp;sdata=3DcK4h%2FVO5AYTF%2BDYmJZ0ZPnX1qhlAydAwe%2FKx5IcwpZ4%3D&amp;res=
erved=3D0{BPN}-${PV}.tar.xz \
> >             file://CVE-2022-0358.patch \
> >             file://CVE-2022-0216_1.patch \
> >             file://CVE-2022-0216_2.patch \
> > +           file://0001-use-uint32t-for-reply-queue-head-tail-values.pa=
tch \
> > +           file://0002_let_dma_memory_valid_function_take_MemTxAttrs_a=
rgument.patch \
> > +           file://0003_let_dma_memory_set_function_take_MemTxAttrs_arg=
ument.patch \
> > +           file://0004_let_dma_memory_rw_relaxed_function_take_MemTxAt=
trs_argument.patch \
> > +           file://0005_let_dma_memory_rw_function_take_MemTxAttrs_argu=
ment.patch \
> > +           file://0006_let_dma_memory_read_write_function_take_MemTxAt=
trs_argument.patch \
> > +           file://0007_let_dma_memory_map_function_take_MemTxAttrs_arg=
ument.patch \
> > +           file://0008_have_dma_buf_rw_function_take_a_void_pointer.pa=
tch \
> > +           file://0009_have_dma_buf_read_and_dma_buf_write_functions_t=
ake_a_void.patch \
> > +           file://0010_let_pci_dma_rw_function_take_MemTxAttrs_argumen=
t.patch \
> > +           file://0011_let_dma_buf_rw_function_take_MemTxAttrs_argumen=
t.patch \
> > +           file://0012_let_dma_buf_write_function_take_MemTxAttrs_argu=
ment.patch \
> > +           file://0013_let_dma_buf_read_function_take_MemTxAttrs_argum=
ent.patch \
> > +           file://0014_let_dma_buf_rw_function_propagate_MemTxResult.p=
atch \
> > +           file://0015_let_st_pointer_dma_function_take_MemTxAttrs_arg=
ument.patch \
> > +           file://0016_let_ld_pointer_dma_function_take_MemTxAttrs_arg=
ument.patch \
> > +           file://0017_let_st_pointer_dma_function_propagate_MemTxResu=
lt.patch \
> > +           file://0018_let_ld_pointer_dma_function_propagate_MemTxResu=
lt.patch \
> > +           file://0019_let_st_pointer_pci_dma_function_take_MemTxAttrs=
_argument.patch \
> > +           file://0020_let_ld_pointer_pci_dma_function_take_MemTxAttrs=
_argument.patch \
> > +           file://0021_let_st_pointer_pci_dma_function_propagate_MemTx=
Result.patch \
> > +           file://0022_let_ld_pointer_pci_dma_function_propagate_MemTx=
Result.patch \
> > +           file://CVE-2021-3611_1.patch \
> > +           file://CVE-2021-3611_2.patch \
> >             "
> >  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu/0001-use-uint32t-for-reply=
-queue-head-tail-values.patch b/meta/recipes-devtools/qemu/qemu/0001-use-ui=
nt32t-for-reply-queue-head-tail-values.patch
> > new file mode 100644
> > index 0000000000..37e122f781
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0001-use-uint32t-for-reply-queue-=
head-tail-values.patch
> > @@ -0,0 +1,83 @@
> > +From 41d5e8da3d5e0a143a9fb397c9f34707ec544997 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Fri, 17 Dec 2021 22:43:05 +0100
> > +Subject: [PATCH] hw/scsi/megasas: Use uint32_t for reply queue head/ta=
il
> > + values
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +While the reply queue values fit in 16-bit, they are accessed
> > +as 32-bit:
> > +
> > +  661:    s->reply_queue_head =3D ldl_le_pci_dma(pcid, s->producer_pa)=
;
> > +  662:    s->reply_queue_head %=3D MEGASAS_MAX_FRAMES;
> > +  663:    s->reply_queue_tail =3D ldl_le_pci_dma(pcid, s->consumer_pa)=
;
> > +  664:    s->reply_queue_tail %=3D MEGASAS_MAX_FRAMES;
> > +
> > +Having:
> > +
> > +  41:#define MEGASAS_MAX_FRAMES 2048         /* Firmware limit at 6553=
5 */
> > +
> > +In order to update the ld/st*_pci_dma() API to pass the address
> > +of the value to access, it is simpler to have the head/tail declared
> > +as 32-bit values. Replace the uint16_t by uint32_t, wasting 4 bytes in
> > +the MegasasState structure.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
41d5e8da3d5e0a143a9fb397c9f34707ec544997&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DdQvB9VtpJlLSyyCNlGQZjwVmEJoeVDAvR70o0SMZwYU%3D&amp;reserved=3D0]
> > +
> > +Acked-by: Richard Henderson <richard.henderson@linaro.org>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-20-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/scsi/megasas.c    | 4 ++--
> > + hw/scsi/trace-events | 8 ++++----
> > + 2 files changed, 6 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> > +index 8f35784..14ec6d6 100644
> > +--- a/hw/scsi/megasas.c
> > ++++ b/hw/scsi/megasas.c
> > +@@ -109,8 +109,8 @@ struct MegasasState {
> > +     uint64_t reply_queue_pa;
> > +     void *reply_queue;
> > +     uint16_t reply_queue_len;
> > +-    uint16_t reply_queue_head;
> > +-    uint16_t reply_queue_tail;
> > ++    uint32_t reply_queue_head;
> > ++    uint32_t reply_queue_tail;
> > +     uint64_t consumer_pa;
> > +     uint64_t producer_pa;
> > +
> > +diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
> > +index 92d5b40..ae8551f 100644
> > +--- a/hw/scsi/trace-events
> > ++++ b/hw/scsi/trace-events
> > +@@ -42,18 +42,18 @@ mptsas_config_sas_phy(void *dev, int address, int =
port, int phy_handle, int dev_
> > +
> > + # megasas.c
> > + megasas_init_firmware(uint64_t pa) "pa 0x%" PRIx64 " "
> > +-megasas_init_queue(uint64_t queue_pa, int queue_len, uint64_t head, u=
int64_t tail, uint32_t flags) "queue at 0x%" PRIx64 " len %d head 0x%" PRIx=
64 " tail 0x%" PRIx64 " flags 0x%x"
> > ++megasas_init_queue(uint64_t queue_pa, int queue_len, uint32_t head, u=
int32_t tail, uint32_t flags) "queue at 0x%" PRIx64 " len %d head 0x%" PRIx=
32 " tail 0x%" PRIx32 " flags 0x%x"
> > + megasas_initq_map_failed(int frame) "scmd %d: failed to map queue"
> > + megasas_initq_mapped(uint64_t pa) "queue already mapped at 0x%" PRIx6=
4
> > + megasas_initq_mismatch(int queue_len, int fw_cmds) "queue size %d max=
 fw cmds %d"
> > + megasas_qf_mapped(unsigned int index) "skip mapped frame 0x%x"
> > + megasas_qf_new(unsigned int index, uint64_t frame) "frame 0x%x addr 0=
x%" PRIx64
> > + megasas_qf_busy(unsigned long pa) "all frames busy for frame 0x%lx"
> > +-megasas_qf_enqueue(unsigned int index, unsigned int count, uint64_t c=
ontext, unsigned int head, unsigned int tail, int busy) "frame 0x%x count %=
d context 0x%" PRIx64 " head 0x%x tail 0x%x busy %d"
> > +-megasas_qf_update(unsigned int head, unsigned int tail, unsigned int =
busy) "head 0x%x tail 0x%x busy %d"
> > ++megasas_qf_enqueue(unsigned int index, unsigned int count, uint64_t c=
ontext, uint32_t head, uint32_t tail, unsigned int busy) "frame 0x%x count =
%d context 0x%" PRIx64 " head 0x%" PRIx32 " tail 0x%" PRIx32 " busy %u"
> > ++megasas_qf_update(uint32_t head, uint32_t tail, unsigned int busy) "h=
ead 0x%" PRIx32 " tail 0x%" PRIx32 " busy %u"
> > + megasas_qf_map_failed(int cmd, unsigned long frame) "scmd %d: frame %=
lu"
> > + megasas_qf_complete_noirq(uint64_t context) "context 0x%" PRIx64 " "
> > +-megasas_qf_complete(uint64_t context, unsigned int head, unsigned int=
 tail, int busy) "context 0x%" PRIx64 " head 0x%x tail 0x%x busy %d"
> > ++megasas_qf_complete(uint64_t context, uint32_t head, uint32_t tail, i=
nt busy) "context 0x%" PRIx64 " head 0x%" PRIx32 " tail 0x%" PRIx32 " busy =
%u"
> > + megasas_frame_busy(uint64_t addr) "frame 0x%" PRIx64 " busy"
> > + megasas_unhandled_frame_cmd(int cmd, uint8_t frame_cmd) "scmd %d: MFI=
 cmd 0x%x"
> > + megasas_handle_scsi(const char *frame, int bus, int dev, int lun, voi=
d *sdev, unsigned long size) "%s dev %x/%x/%x sdev %p xfer %lu"
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0002_let_dma_memory_valid_=
function_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0=
002_let_dma_memory_valid_function_take_MemTxAttrs_argument.patch
> > new file mode 100644
> > index 0000000000..04a655315f
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0002_let_dma_memory_valid_functio=
n_take_MemTxAttrs_argument.patch
> > @@ -0,0 +1,60 @@
> > +From 7ccb391ccd594b3f33de8deb293ff8d47bb4e219 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Thu, 3 Sep 2020 09:28:49 +0200
> > +Subject: [PATCH] dma: Let dma_memory_valid() take MemTxAttrs argument
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Let devices specify transaction attributes when calling
> > +dma_memory_valid().
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
7ccb391ccd594b3f33de8deb293ff8d47bb4e219&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DdUqKAUAvOfJL3iHlh1bZIqLkjegh9bC4bUCXGzTY4Xw%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > +Reviewed-by: Li Qiang <liq3ea@gmail.com>
> > +Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> > +Message-Id: <20211223115554.3155328-2-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + include/hw/ppc/spapr_vio.h | 2 +-
> > + include/sysemu/dma.h       | 4 ++--
> > + 2 files changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
> > +index 4bea87f..4c45f15 100644
> > +--- a/include/hw/ppc/spapr_vio.h
> > ++++ b/include/hw/ppc/spapr_vio.h
> > +@@ -91,7 +91,7 @@ static inline void spapr_vio_irq_pulse(SpaprVioDevic=
e *dev)
> > + static inline bool spapr_vio_dma_valid(SpaprVioDevice *dev, uint64_t =
taddr,
> > +                                        uint32_t size, DMADirection di=
r)
> > + {
> > +-    return dma_memory_valid(&dev->as, taddr, size, dir);
> > ++    return dma_memory_valid(&dev->as, taddr, size, dir, MEMTXATTRS_UN=
SPECIFIED);
> > + }
> > +
> > + static inline int spapr_vio_dma_read(SpaprVioDevice *dev, uint64_t ta=
ddr,
> > +diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> > +index 3201e79..296f3b5 100644
> > +--- a/include/sysemu/dma.h
> > ++++ b/include/sysemu/dma.h
> > +@@ -73,11 +73,11 @@ static inline void dma_barrier(AddressSpace *as, D=
MADirection dir)
> > +  * dma_memory_{read,write}() and check for errors */
> > + static inline bool dma_memory_valid(AddressSpace *as,
> > +                                     dma_addr_t addr, dma_addr_t len,
> > +-                                    DMADirection dir)
> > ++                                    DMADirection dir, MemTxAttrs attr=
s)
> > + {
> > +     return address_space_access_valid(as, addr, len,
> > +                                       dir =3D=3D DMA_DIRECTION_FROM_D=
EVICE,
> > +-                                      MEMTXATTRS_UNSPECIFIED);
> > ++                                      attrs);
> > + }
> > +
> > + static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0003_let_dma_memory_set_fu=
nction_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/000=
3_let_dma_memory_set_function_take_MemTxAttrs_argument.patch
> > new file mode 100644
> > index 0000000000..f13707a407
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0003_let_dma_memory_set_function_=
take_MemTxAttrs_argument.patch
> > @@ -0,0 +1,98 @@
> > +From 7a36e42d9114474278ce30ba36945cc62292eb60 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Thu, 3 Sep 2020 10:28:32 +0200
> > +Subject: [PATCH] dma: Let dma_memory_set() take MemTxAttrs argument
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Let devices specify transaction attributes when calling
> > +dma_memory_set().
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
7a36e42d9114474278ce30ba36945cc62292eb60&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3Dy8nXCmVQtIQr0JAOrm0TWH4Yqi3Xh6nRp%2FITHXMi8Yg%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > +Reviewed-by: Li Qiang <liq3ea@gmail.com>
> > +Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> > +Message-Id: <20211223115554.3155328-3-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/nvram/fw_cfg.c          | 3 ++-
> > + include/hw/ppc/spapr_vio.h | 3 ++-
> > + include/sysemu/dma.h       | 3 ++-
> > + softmmu/dma-helpers.c      | 5 ++---
> > + 4 files changed, 8 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> > +index c06b30d..f7803fe 100644
> > +--- a/hw/nvram/fw_cfg.c
> > ++++ b/hw/nvram/fw_cfg.c
> > +@@ -399,7 +399,8 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
> > +              * tested before.
> > +              */
> > +             if (read) {
> > +-                if (dma_memory_set(s->dma_as, dma.address, 0, len)) {
> > ++                if (dma_memory_set(s->dma_as, dma.address, 0, len,
> > ++                                   MEMTXATTRS_UNSPECIFIED)) {
> > +                     dma.control |=3D FW_CFG_DMA_CTL_ERROR;
> > +                 }
> > +             }
> > +diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
> > +index 4c45f15..c90e74a 100644
> > +--- a/include/hw/ppc/spapr_vio.h
> > ++++ b/include/hw/ppc/spapr_vio.h
> > +@@ -111,7 +111,8 @@ static inline int spapr_vio_dma_write(SpaprVioDevi=
ce *dev, uint64_t taddr,
> > + static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t tad=
dr,
> > +                                     uint8_t c, uint32_t size)
> > + {
> > +-    return (dma_memory_set(&dev->as, taddr, c, size) !=3D 0) ?
> > ++    return (dma_memory_set(&dev->as, taddr,
> > ++                           c, size, MEMTXATTRS_UNSPECIFIED) !=3D 0) ?
> > +         H_DEST_PARM : H_SUCCESS;
> > + }
> > +
> > +diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> > +index 296f3b5..d23516f 100644
> > +--- a/include/sysemu/dma.h
> > ++++ b/include/sysemu/dma.h
> > +@@ -175,9 +175,10 @@ static inline MemTxResult dma_memory_write(Addres=
sSpace *as, dma_addr_t addr,
> > +  * @addr: address within that address space
> > +  * @c: constant byte to fill the memory
> > +  * @len: the number of bytes to fill with the constant byte
> > ++ * @attrs: memory transaction attributes
> > +  */
> > + MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
> > +-                           uint8_t c, dma_addr_t len);
> > ++                           uint8_t c, dma_addr_t len, MemTxAttrs attr=
s);
> > +
> > + /**
> > +  * address_space_map: Map a physical memory region into a host virtua=
l address.
> > +diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> > +index 7d766a5..1f07217 100644
> > +--- a/softmmu/dma-helpers.c
> > ++++ b/softmmu/dma-helpers.c
> > +@@ -19,7 +19,7 @@
> > + /* #define DEBUG_IOMMU */
> > +
> > + MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
> > +-                           uint8_t c, dma_addr_t len)
> > ++                           uint8_t c, dma_addr_t len, MemTxAttrs attr=
s)
> > + {
> > +     dma_barrier(as, DMA_DIRECTION_FROM_DEVICE);
> > +
> > +@@ -31,8 +31,7 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_add=
r_t addr,
> > +     memset(fillbuf, c, FILLBUF_SIZE);
> > +     while (len > 0) {
> > +         l =3D len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
> > +-        error |=3D address_space_write(as, addr, MEMTXATTRS_UNSPECIFI=
ED,
> > +-                                     fillbuf, l);
> > ++        error |=3D address_space_write(as, addr, attrs, fillbuf, l);
> > +         len -=3D l;
> > +         addr +=3D l;
> > +     }
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0004_let_dma_memory_rw_rel=
axed_function_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/q=
emu/0004_let_dma_memory_rw_relaxed_function_take_MemTxAttrs_argument.patch
> > new file mode 100644
> > index 0000000000..cacb12909c
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0004_let_dma_memory_rw_relaxed_fu=
nction_take_MemTxAttrs_argument.patch
> > @@ -0,0 +1,78 @@
> > +From 4afd0f2f220ec3dc8518b8de0d66cbf8d2fd1be7 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Thu, 3 Sep 2020 09:30:10 +0200
> > +Subject: [PATCH] dma: Let dma_memory_rw_relaxed() take MemTxAttrs argu=
ment
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +We will add the MemTxAttrs argument to dma_memory_rw() in
> > +the next commit. Since dma_memory_rw_relaxed() is only used
> > +by dma_memory_rw(), modify it first in a separate commit to
> > +keep the next commit easier to review.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
4afd0f2f220ec3dc8518b8de0d66cbf8d2fd1be7&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D2L%2Bcdn26P7jgMy1Nb3HvCWCwnViK3M5sL87Zd9aOOlw%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > +Reviewed-by: Li Qiang <liq3ea@gmail.com>
> > +Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> > +Message-Id: <20211223115554.3155328-4-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + include/sysemu/dma.h | 15 ++++++++++-----
> > + 1 file changed, 10 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> > +index d23516f..3be803c 100644
> > +--- a/include/sysemu/dma.h
> > ++++ b/include/sysemu/dma.h
> > +@@ -83,9 +83,10 @@ static inline bool dma_memory_valid(AddressSpace *a=
s,
> > + static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
> > +                                                 dma_addr_t addr,
> > +                                                 void *buf, dma_addr_t=
 len,
> > +-                                                DMADirection dir)
> > ++                                                DMADirection dir,
> > ++                                                MemTxAttrs attrs)
> > + {
> > +-    return address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED,
> > ++    return address_space_rw(as, addr, attrs,
> > +                             buf, len, dir =3D=3D DMA_DIRECTION_FROM_D=
EVICE);
> > + }
> > +
> > +@@ -93,7 +94,9 @@ static inline MemTxResult dma_memory_read_relaxed(Ad=
dressSpace *as,
> > +                                                   dma_addr_t addr,
> > +                                                   void *buf, dma_addr=
_t len)
> > + {
> > +-    return dma_memory_rw_relaxed(as, addr, buf, len, DMA_DIRECTION_TO=
_DEVICE);
> > ++    return dma_memory_rw_relaxed(as, addr, buf, len,
> > ++                                 DMA_DIRECTION_TO_DEVICE,
> > ++                                 MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
> > +@@ -102,7 +105,8 @@ static inline MemTxResult dma_memory_write_relaxed=
(AddressSpace *as,
> > +                                                    dma_addr_t len)
> > + {
> > +     return dma_memory_rw_relaxed(as, addr, (void *)buf, len,
> > +-                                 DMA_DIRECTION_FROM_DEVICE);
> > ++                                 DMA_DIRECTION_FROM_DEVICE,
> > ++                                 MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + /**
> > +@@ -124,7 +128,8 @@ static inline MemTxResult dma_memory_rw(AddressSpa=
ce *as, dma_addr_t addr,
> > + {
> > +     dma_barrier(as, dir);
> > +
> > +-    return dma_memory_rw_relaxed(as, addr, buf, len, dir);
> > ++    return dma_memory_rw_relaxed(as, addr, buf, len, dir,
> > ++                                 MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + /**
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0005_let_dma_memory_rw_fun=
ction_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0005=
_let_dma_memory_rw_function_take_MemTxAttrs_argument.patch
> > new file mode 100644
> > index 0000000000..e5daf966d5
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0005_let_dma_memory_rw_function_t=
ake_MemTxAttrs_argument.patch
> > @@ -0,0 +1,158 @@
> > +From 23faf5694ff8054b847e9733297727be4a641132 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Thu, 3 Sep 2020 09:37:43 +0200
> > +Subject: [PATCH] dma: Let dma_memory_rw() take MemTxAttrs argument
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Let devices specify transaction attributes when calling
> > +dma_memory_rw().
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
23faf5694ff8054b847e9733297727be4a641132&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811429582%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DrGl9%2F%2Bj2qSv5HeAdm%2FaqjJoJ8EB0YVrXNL6AFgRQduw%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > +Reviewed-by: Li Qiang <liq3ea@gmail.com>
> > +Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> > +Message-Id: <20211223115554.3155328-5-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/intc/spapr_xive.c  |  3 ++-
> > + hw/usb/hcd-ohci.c     | 10 ++++++----
> > + include/hw/pci/pci.h  |  3 ++-
> > + include/sysemu/dma.h  | 11 ++++++-----
> > + softmmu/dma-helpers.c |  3 ++-
> > + 5 files changed, 18 insertions(+), 12 deletions(-)
> > +
> > +diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> > +index 4ec659b..eae95c7 100644
> > +--- a/hw/intc/spapr_xive.c
> > ++++ b/hw/intc/spapr_xive.c
> > +@@ -1684,7 +1684,8 @@ static target_ulong h_int_esb(PowerPCCPU *cpu,
> > +         mmio_addr =3D xive->vc_base + xive_source_esb_mgmt(xsrc, lisn=
) + offset;
> > +
> > +         if (dma_memory_rw(&address_space_memory, mmio_addr, &data, 8,
> > +-                          (flags & SPAPR_XIVE_ESB_STORE))) {
> > ++                          (flags & SPAPR_XIVE_ESB_STORE),
> > ++                          MEMTXATTRS_UNSPECIFIED)) {
> > +             qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to access ES=
B @0x%"
> > +                           HWADDR_PRIx "\n", mmio_addr);
> > +             return H_HARDWARE;
> > +diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> > +index 1cf2816..56e2315 100644
> > +--- a/hw/usb/hcd-ohci.c
> > ++++ b/hw/usb/hcd-ohci.c
> > +@@ -586,7 +586,8 @@ static int ohci_copy_td(OHCIState *ohci, struct oh=
ci_td *td,
> > +     if (n > len)
> > +         n =3D len;
> > +
> > +-    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf, n, di=
r)) {
> > ++    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
> > ++                      n, dir, MEMTXATTRS_UNSPECIFIED)) {
> > +         return -1;
> > +     }
> > +     if (n =3D=3D len) {
> > +@@ -595,7 +596,7 @@ static int ohci_copy_td(OHCIState *ohci, struct oh=
ci_td *td,
> > +     ptr =3D td->be & ~0xfffu;
> > +     buf +=3D n;
> > +     if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
> > +-                      len - n, dir)) {
> > ++                      len - n, dir, MEMTXATTRS_UNSPECIFIED)) {
> > +         return -1;
> > +     }
> > +     return 0;
> > +@@ -613,7 +614,8 @@ static int ohci_copy_iso_td(OHCIState *ohci,
> > +     if (n > len)
> > +         n =3D len;
> > +
> > +-    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf, n, di=
r)) {
> > ++    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
> > ++                      n, dir, MEMTXATTRS_UNSPECIFIED)) {
> > +         return -1;
> > +     }
> > +     if (n =3D=3D len) {
> > +@@ -622,7 +624,7 @@ static int ohci_copy_iso_td(OHCIState *ohci,
> > +     ptr =3D end_addr & ~0xfffu;
> > +     buf +=3D n;
> > +     if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
> > +-                      len - n, dir)) {
> > ++                      len - n, dir, MEMTXATTRS_UNSPECIFIED)) {
> > +         return -1;
> > +     }
> > +     return 0;
> > +diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > +index e7cdf2d..4383f1c 100644
> > +--- a/include/hw/pci/pci.h
> > ++++ b/include/hw/pci/pci.h
> > +@@ -808,7 +808,8 @@ static inline MemTxResult pci_dma_rw(PCIDevice *de=
v, dma_addr_t addr,
> > +                                      void *buf, dma_addr_t len,
> > +                                      DMADirection dir)
> > + {
> > +-    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len, =
dir);
> > ++    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> > ++                         dir, MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + /**
> > +diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> > +index 3be803c..e8ad422 100644
> > +--- a/include/sysemu/dma.h
> > ++++ b/include/sysemu/dma.h
> > +@@ -121,15 +121,15 @@ static inline MemTxResult dma_memory_write_relax=
ed(AddressSpace *as,
> > +  * @buf: buffer with the data transferred
> > +  * @len: the number of bytes to read or write
> > +  * @dir: indicates the transfer direction
> > ++ * @attrs: memory transaction attributes
> > +  */
> > + static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t =
addr,
> > +                                         void *buf, dma_addr_t len,
> > +-                                        DMADirection dir)
> > ++                                        DMADirection dir, MemTxAttrs =
attrs)
> > + {
> > +     dma_barrier(as, dir);
> > +
> > +-    return dma_memory_rw_relaxed(as, addr, buf, len, dir,
> > +-                                 MEMTXATTRS_UNSPECIFIED);
> > ++    return dma_memory_rw_relaxed(as, addr, buf, len, dir, attrs);
> > + }
> > +
> > + /**
> > +@@ -147,7 +147,8 @@ static inline MemTxResult dma_memory_rw(AddressSpa=
ce *as, dma_addr_t addr,
> > + static inline MemTxResult dma_memory_read(AddressSpace *as, dma_addr_=
t addr,
> > +                                           void *buf, dma_addr_t len)
> > + {
> > +-    return dma_memory_rw(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE)=
;
> > ++    return dma_memory_rw(as, addr, buf, len,
> > ++                         DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIF=
IED);
> > + }
> > +
> > + /**
> > +@@ -166,7 +167,7 @@ static inline MemTxResult dma_memory_write(Address=
Space *as, dma_addr_t addr,
> > +                                            const void *buf, dma_addr_=
t len)
> > + {
> > +     return dma_memory_rw(as, addr, (void *)buf, len,
> > +-                         DMA_DIRECTION_FROM_DEVICE);
> > ++                         DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPEC=
IFIED);
> > + }
> > +
> > + /**
> > +diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> > +index 1f07217..5bf76ff 100644
> > +--- a/softmmu/dma-helpers.c
> > ++++ b/softmmu/dma-helpers.c
> > +@@ -305,7 +305,8 @@ static uint64_t dma_buf_rw(uint8_t *ptr, int32_t l=
en, QEMUSGList *sg,
> > +     while (len > 0) {
> > +         ScatterGatherEntry entry =3D sg->sg[sg_cur_index++];
> > +         int32_t xfer =3D MIN(len, entry.len);
> > +-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir);
> > ++        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir,
> > ++                      MEMTXATTRS_UNSPECIFIED);
> > +         ptr +=3D xfer;
> > +         len -=3D xfer;
> > +         resid -=3D xfer;
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0006_let_dma_memory_read_w=
rite_function_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/q=
emu/0006_let_dma_memory_read_write_function_take_MemTxAttrs_argument.patch
> > new file mode 100644
> > index 0000000000..1973e477f3
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0006_let_dma_memory_read_write_fu=
nction_take_MemTxAttrs_argument.patch
> > @@ -0,0 +1,1453 @@
> > +From ba06fe8add5b788956a7317246c6280dfc157040 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Thu, 3 Sep 2020 10:08:29 +0200
> > +Subject: [PATCH] dma: Let dma_memory_read/write() take MemTxAttrs argu=
ment
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Let devices specify transaction attributes when calling
> > +dma_memory_read() or dma_memory_write().
> > +
> > +Patch created mechanically using spatch with this script:
> > +
> > +  @@
> > +  expression E1, E2, E3, E4;
> > +  @@
> > +  (
> > +  - dma_memory_read(E1, E2, E3, E4)
> > +  + dma_memory_read(E1, E2, E3, E4, MEMTXATTRS_UNSPECIFIED)
> > +  |
> > +  - dma_memory_write(E1, E2, E3, E4)
> > +  + dma_memory_write(E1, E2, E3, E4, MEMTXATTRS_UNSPECIFIED)
> > +  )
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
ba06fe8add5b788956a7317246c6280dfc157040&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D458NtoYmh5FiNIbqstJuUrVodyptAmEa0lYTem%2BqTP8%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > +Reviewed-by: Li Qiang <liq3ea@gmail.com>
> > +Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> > +Message-Id: <20211223115554.3155328-6-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/arm/musicpal.c             | 13 +++++++------
> > + hw/arm/smmu-common.c          |  3 ++-
> > + hw/arm/smmuv3.c               | 14 +++++++++-----
> > + hw/core/generic-loader.c      |  3 ++-
> > + hw/dma/pl330.c                | 12 ++++++++----
> > + hw/dma/sparc32_dma.c          | 16 ++++++++++------
> > + hw/dma/xlnx-zynq-devcfg.c     |  6 ++++--
> > + hw/dma/xlnx_dpdma.c           | 10 ++++++----
> > + hw/i386/amd_iommu.c           | 16 +++++++++-------
> > + hw/i386/intel_iommu.c         | 28 +++++++++++++++++-----------
> > + hw/ide/macio.c                |  2 +-
> > + hw/intc/xive.c                |  7 ++++---
> > + hw/misc/bcm2835_property.c    |  3 ++-
> > + hw/misc/macio/mac_dbdma.c     | 10 ++++++----
> > + hw/net/allwinner-sun8i-emac.c | 18 ++++++++++++------
> > + hw/net/ftgmac100.c            | 25 ++++++++++++++++---------
> > + hw/net/imx_fec.c              | 32 ++++++++++++++++++++------------
> > + hw/net/npcm7xx_emc.c          | 20 ++++++++++++--------
> > + hw/nvram/fw_cfg.c             |  9 ++++++---
> > + hw/pci-host/pnv_phb3.c        |  5 +++--
> > + hw/pci-host/pnv_phb3_msi.c    |  9 ++++++---
> > + hw/pci-host/pnv_phb4.c        |  5 +++--
> > + hw/sd/allwinner-sdhost.c      | 14 ++++++++------
> > + hw/sd/sdhci.c                 | 35 ++++++++++++++++++++++------------=
-
> > + hw/usb/hcd-dwc2.c             |  8 ++++----
> > + hw/usb/hcd-ehci.c             |  6 ++++--
> > + hw/usb/hcd-ohci.c             | 18 +++++++++++-------
> > + hw/usb/hcd-xhci.c             | 18 +++++++++++-------
> > + include/hw/ppc/spapr_vio.h    |  6 ++++--
> > + include/sysemu/dma.h          | 20 ++++++++++++--------
> > + 30 files changed, 241 insertions(+), 150 deletions(-)
> > +
> > +diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> > +index 2d612cc..2680ec5 100644
> > +--- a/hw/arm/musicpal.c
> > ++++ b/hw/arm/musicpal.c
> > +@@ -185,13 +185,13 @@ static void eth_rx_desc_put(AddressSpace *dma_as=
, uint32_t addr,
> > +     cpu_to_le16s(&desc->buffer_size);
> > +     cpu_to_le32s(&desc->buffer);
> > +     cpu_to_le32s(&desc->next);
> > +-    dma_memory_write(dma_as, addr, desc, sizeof(*desc));
> > ++    dma_memory_write(dma_as, addr, desc, sizeof(*desc), MEMTXATTRS_UN=
SPECIFIED);
> > + }
> > +
> > + static void eth_rx_desc_get(AddressSpace *dma_as, uint32_t addr,
> > +                             mv88w8618_rx_desc *desc)
> > + {
> > +-    dma_memory_read(dma_as, addr, desc, sizeof(*desc));
> > ++    dma_memory_read(dma_as, addr, desc, sizeof(*desc), MEMTXATTRS_UNS=
PECIFIED);
> > +     le32_to_cpus(&desc->cmdstat);
> > +     le16_to_cpus(&desc->bytes);
> > +     le16_to_cpus(&desc->buffer_size);
> > +@@ -215,7 +215,7 @@ static ssize_t eth_receive(NetClientState *nc, con=
st uint8_t *buf, size_t size)
> > +             eth_rx_desc_get(&s->dma_as, desc_addr, &desc);
> > +             if ((desc.cmdstat & MP_ETH_RX_OWN) && desc.buffer_size >=
=3D size) {
> > +                 dma_memory_write(&s->dma_as, desc.buffer + s->vlan_he=
ader,
> > +-                                          buf, size);
> > ++                                 buf, size, MEMTXATTRS_UNSPECIFIED);
> > +                 desc.bytes =3D size + s->vlan_header;
> > +                 desc.cmdstat &=3D ~MP_ETH_RX_OWN;
> > +                 s->cur_rx[i] =3D desc.next;
> > +@@ -241,13 +241,13 @@ static void eth_tx_desc_put(AddressSpace *dma_as=
, uint32_t addr,
> > +     cpu_to_le16s(&desc->bytes);
> > +     cpu_to_le32s(&desc->buffer);
> > +     cpu_to_le32s(&desc->next);
> > +-    dma_memory_write(dma_as, addr, desc, sizeof(*desc));
> > ++    dma_memory_write(dma_as, addr, desc, sizeof(*desc), MEMTXATTRS_UN=
SPECIFIED);
> > + }
> > +
> > + static void eth_tx_desc_get(AddressSpace *dma_as, uint32_t addr,
> > +                             mv88w8618_tx_desc *desc)
> > + {
> > +-    dma_memory_read(dma_as, addr, desc, sizeof(*desc));
> > ++    dma_memory_read(dma_as, addr, desc, sizeof(*desc), MEMTXATTRS_UNS=
PECIFIED);
> > +     le32_to_cpus(&desc->cmdstat);
> > +     le16_to_cpus(&desc->res);
> > +     le16_to_cpus(&desc->bytes);
> > +@@ -269,7 +269,8 @@ static void eth_send(mv88w8618_eth_state *s, int q=
ueue_index)
> > +         if (desc.cmdstat & MP_ETH_TX_OWN) {
> > +             len =3D desc.bytes;
> > +             if (len < 2048) {
> > +-                dma_memory_read(&s->dma_as, desc.buffer, buf, len);
> > ++                dma_memory_read(&s->dma_as, desc.buffer, buf, len,
> > ++                                MEMTXATTRS_UNSPECIFIED);
> > +                 qemu_send_packet(qemu_get_queue(s->nic), buf, len);
> > +             }
> > +             desc.cmdstat &=3D ~MP_ETH_TX_OWN;
> > +diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > +index 0459850..e09b9c1 100644
> > +--- a/hw/arm/smmu-common.c
> > ++++ b/hw/arm/smmu-common.c
> > +@@ -193,7 +193,8 @@ static int get_pte(dma_addr_t baseaddr, uint32_t i=
ndex, uint64_t *pte,
> > +     dma_addr_t addr =3D baseaddr + index * sizeof(*pte);
> > +
> > +     /* TODO: guarantee 64-bit single-copy atomicity */
> > +-    ret =3D dma_memory_read(&address_space_memory, addr, pte, sizeof(=
*pte));
> > ++    ret =3D dma_memory_read(&address_space_memory, addr, pte, sizeof(=
*pte),
> > ++                          MEMTXATTRS_UNSPECIFIED);
> > +
> > +     if (ret !=3D MEMTX_OK) {
> > +         info->type =3D SMMU_PTW_ERR_WALK_EABT;
> > +diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > +index 01b60be..3b43368 100644
> > +--- a/hw/arm/smmuv3.c
> > ++++ b/hw/arm/smmuv3.c
> > +@@ -102,7 +102,8 @@ static inline MemTxResult queue_read(SMMUQueue *q,=
 void *data)
> > + {
> > +     dma_addr_t addr =3D Q_CONS_ENTRY(q);
> > +
> > +-    return dma_memory_read(&address_space_memory, addr, data, q->entr=
y_size);
> > ++    return dma_memory_read(&address_space_memory, addr, data, q->entr=
y_size,
> > ++                           MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + static MemTxResult queue_write(SMMUQueue *q, void *data)
> > +@@ -110,7 +111,8 @@ static MemTxResult queue_write(SMMUQueue *q, void =
*data)
> > +     dma_addr_t addr =3D Q_PROD_ENTRY(q);
> > +     MemTxResult ret;
> > +
> > +-    ret =3D dma_memory_write(&address_space_memory, addr, data, q->en=
try_size);
> > ++    ret =3D dma_memory_write(&address_space_memory, addr, data, q->en=
try_size,
> > ++                           MEMTXATTRS_UNSPECIFIED);
> > +     if (ret !=3D MEMTX_OK) {
> > +         return ret;
> > +     }
> > +@@ -285,7 +287,8 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t=
 addr, STE *buf,
> > +
> > +     trace_smmuv3_get_ste(addr);
> > +     /* TODO: guarantee 64-bit single-copy atomicity */
> > +-    ret =3D dma_memory_read(&address_space_memory, addr, buf, sizeof(=
*buf));
> > ++    ret =3D dma_memory_read(&address_space_memory, addr, buf, sizeof(=
*buf),
> > ++                          MEMTXATTRS_UNSPECIFIED);
> > +     if (ret !=3D MEMTX_OK) {
> > +         qemu_log_mask(LOG_GUEST_ERROR,
> > +                       "Cannot fetch pte at address=3D0x%"PRIx64"\n", =
addr);
> > +@@ -306,7 +309,8 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, u=
int32_t ssid,
> > +
> > +     trace_smmuv3_get_cd(addr);
> > +     /* TODO: guarantee 64-bit single-copy atomicity */
> > +-    ret =3D dma_memory_read(&address_space_memory, addr, buf, sizeof(=
*buf));
> > ++    ret =3D dma_memory_read(&address_space_memory, addr, buf, sizeof(=
*buf),
> > ++                          MEMTXATTRS_UNSPECIFIED);
> > +     if (ret !=3D MEMTX_OK) {
> > +         qemu_log_mask(LOG_GUEST_ERROR,
> > +                       "Cannot fetch pte at address=3D0x%"PRIx64"\n", =
addr);
> > +@@ -411,7 +415,7 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t =
sid, STE *ste,
> > +         l1ptr =3D (dma_addr_t)(strtab_base + l1_ste_offset * sizeof(l=
1std));
> > +         /* TODO: guarantee 64-bit single-copy atomicity */
> > +         ret =3D dma_memory_read(&address_space_memory, l1ptr, &l1std,
> > +-                              sizeof(l1std));
> > ++                              sizeof(l1std), MEMTXATTRS_UNSPECIFIED);
> > +         if (ret !=3D MEMTX_OK) {
> > +             qemu_log_mask(LOG_GUEST_ERROR,
> > +                           "Could not read L1PTR at 0X%"PRIx64"\n", l1=
ptr);
> > +diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> > +index d14f932..9a24ffb 100644
> > +--- a/hw/core/generic-loader.c
> > ++++ b/hw/core/generic-loader.c
> > +@@ -57,7 +57,8 @@ static void generic_loader_reset(void *opaque)
> > +
> > +     if (s->data_len) {
> > +         assert(s->data_len < sizeof(s->data));
> > +-        dma_memory_write(s->cpu->as, s->addr, &s->data, s->data_len);
> > ++        dma_memory_write(s->cpu->as, s->addr, &s->data, s->data_len,
> > ++                         MEMTXATTRS_UNSPECIFIED);
> > +     }
> > + }
> > +
> > +diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
> > +index 0cb4619..31ce01b 100644
> > +--- a/hw/dma/pl330.c
> > ++++ b/hw/dma/pl330.c
> > +@@ -1111,7 +1111,8 @@ static inline const PL330InsnDesc *pl330_fetch_i=
nsn(PL330Chan *ch)
> > +     uint8_t opcode;
> > +     int i;
> > +
> > +-    dma_memory_read(ch->parent->mem_as, ch->pc, &opcode, 1);
> > ++    dma_memory_read(ch->parent->mem_as, ch->pc, &opcode, 1,
> > ++                    MEMTXATTRS_UNSPECIFIED);
> > +     for (i =3D 0; insn_desc[i].size; i++) {
> > +         if ((opcode & insn_desc[i].opmask) =3D=3D insn_desc[i].opcode=
) {
> > +             return &insn_desc[i];
> > +@@ -1125,7 +1126,8 @@ static inline void pl330_exec_insn(PL330Chan *ch=
, const PL330InsnDesc *insn)
> > +     uint8_t buf[PL330_INSN_MAXSIZE];
> > +
> > +     assert(insn->size <=3D PL330_INSN_MAXSIZE);
> > +-    dma_memory_read(ch->parent->mem_as, ch->pc, buf, insn->size);
> > ++    dma_memory_read(ch->parent->mem_as, ch->pc, buf, insn->size,
> > ++                    MEMTXATTRS_UNSPECIFIED);
> > +     insn->exec(ch, buf[0], &buf[1], insn->size - 1);
> > + }
> > +
> > +@@ -1189,7 +1191,8 @@ static int pl330_exec_cycle(PL330Chan *channel)
> > +     if (q !=3D NULL && q->len <=3D pl330_fifo_num_free(&s->fifo)) {
> > +         int len =3D q->len - (q->addr & (q->len - 1));
> > +
> > +-        dma_memory_read(s->mem_as, q->addr, buf, len);
> > ++        dma_memory_read(s->mem_as, q->addr, buf, len,
> > ++                        MEMTXATTRS_UNSPECIFIED);
> > +         trace_pl330_exec_cycle(q->addr, len);
> > +         if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) {
> > +             pl330_hexdump(buf, len);
> > +@@ -1220,7 +1223,8 @@ static int pl330_exec_cycle(PL330Chan *channel)
> > +             fifo_res =3D pl330_fifo_get(&s->fifo, buf, len, q->tag);
> > +         }
> > +         if (fifo_res =3D=3D PL330_FIFO_OK || q->z) {
> > +-            dma_memory_write(s->mem_as, q->addr, buf, len);
> > ++            dma_memory_write(s->mem_as, q->addr, buf, len,
> > ++                             MEMTXATTRS_UNSPECIFIED);
> > +             trace_pl330_exec_cycle(q->addr, len);
> > +             if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) =
{
> > +                 pl330_hexdump(buf, len);
> > +diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
> > +index 03bc500..0ef13c5 100644
> > +--- a/hw/dma/sparc32_dma.c
> > ++++ b/hw/dma/sparc32_dma.c
> > +@@ -81,11 +81,11 @@ void ledma_memory_read(void *opaque, hwaddr addr,
> > +     addr |=3D s->dmaregs[3];
> > +     trace_ledma_memory_read(addr, len);
> > +     if (do_bswap) {
> > +-        dma_memory_read(&is->iommu_as, addr, buf, len);
> > ++        dma_memory_read(&is->iommu_as, addr, buf, len, MEMTXATTRS_UNS=
PECIFIED);
> > +     } else {
> > +         addr &=3D ~1;
> > +         len &=3D ~1;
> > +-        dma_memory_read(&is->iommu_as, addr, buf, len);
> > ++        dma_memory_read(&is->iommu_as, addr, buf, len, MEMTXATTRS_UNS=
PECIFIED);
> > +         for(i =3D 0; i < len; i +=3D 2) {
> > +             bswap16s((uint16_t *)(buf + i));
> > +         }
> > +@@ -103,7 +103,8 @@ void ledma_memory_write(void *opaque, hwaddr addr,
> > +     addr |=3D s->dmaregs[3];
> > +     trace_ledma_memory_write(addr, len);
> > +     if (do_bswap) {
> > +-        dma_memory_write(&is->iommu_as, addr, buf, len);
> > ++        dma_memory_write(&is->iommu_as, addr, buf, len,
> > ++                         MEMTXATTRS_UNSPECIFIED);
> > +     } else {
> > +         addr &=3D ~1;
> > +         len &=3D ~1;
> > +@@ -114,7 +115,8 @@ void ledma_memory_write(void *opaque, hwaddr addr,
> > +             for(i =3D 0; i < l; i +=3D 2) {
> > +                 tmp_buf[i >> 1] =3D bswap16(*(uint16_t *)(buf + i));
> > +             }
> > +-            dma_memory_write(&is->iommu_as, addr, tmp_buf, l);
> > ++            dma_memory_write(&is->iommu_as, addr, tmp_buf, l,
> > ++                             MEMTXATTRS_UNSPECIFIED);
> > +             len -=3D l;
> > +             buf +=3D l;
> > +             addr +=3D l;
> > +@@ -148,7 +150,8 @@ void espdma_memory_read(void *opaque, uint8_t *buf=
, int len)
> > +     IOMMUState *is =3D (IOMMUState *)s->iommu;
> > +
> > +     trace_espdma_memory_read(s->dmaregs[1], len);
> > +-    dma_memory_read(&is->iommu_as, s->dmaregs[1], buf, len);
> > ++    dma_memory_read(&is->iommu_as, s->dmaregs[1], buf, len,
> > ++                    MEMTXATTRS_UNSPECIFIED);
> > +     s->dmaregs[1] +=3D len;
> > + }
> > +
> > +@@ -158,7 +161,8 @@ void espdma_memory_write(void *opaque, uint8_t *bu=
f, int len)
> > +     IOMMUState *is =3D (IOMMUState *)s->iommu;
> > +
> > +     trace_espdma_memory_write(s->dmaregs[1], len);
> > +-    dma_memory_write(&is->iommu_as, s->dmaregs[1], buf, len);
> > ++    dma_memory_write(&is->iommu_as, s->dmaregs[1], buf, len,
> > ++                     MEMTXATTRS_UNSPECIFIED);
> > +     s->dmaregs[1] +=3D len;
> > + }
> > +
> > +diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
> > +index e33112b..f5ad1a0 100644
> > +--- a/hw/dma/xlnx-zynq-devcfg.c
> > ++++ b/hw/dma/xlnx-zynq-devcfg.c
> > +@@ -161,12 +161,14 @@ static void xlnx_zynq_devcfg_dma_go(XlnxZynqDevc=
fg *s)
> > +             btt =3D MIN(btt, dmah->dest_len);
> > +         }
> > +         DB_PRINT("reading %x bytes from %x\n", btt, dmah->src_addr);
> > +-        dma_memory_read(&address_space_memory, dmah->src_addr, buf, b=
tt);
> > ++        dma_memory_read(&address_space_memory, dmah->src_addr, buf, b=
tt,
> > ++                        MEMTXATTRS_UNSPECIFIED);
> > +         dmah->src_len -=3D btt;
> > +         dmah->src_addr +=3D btt;
> > +         if (loopback && (dmah->src_len || dmah->dest_len)) {
> > +             DB_PRINT("writing %x bytes from %x\n", btt, dmah->dest_ad=
dr);
> > +-            dma_memory_write(&address_space_memory, dmah->dest_addr, =
buf, btt);
> > ++            dma_memory_write(&address_space_memory, dmah->dest_addr, =
buf, btt,
> > ++                             MEMTXATTRS_UNSPECIFIED);
> > +             dmah->dest_len -=3D btt;
> > +             dmah->dest_addr +=3D btt;
> > +         }
> > +diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
> > +index 967548a..2d7eae7 100644
> > +--- a/hw/dma/xlnx_dpdma.c
> > ++++ b/hw/dma/xlnx_dpdma.c
> > +@@ -652,7 +652,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *=
s, uint8_t channel,
> > +         }
> > +
> > +         if (dma_memory_read(&address_space_memory, desc_addr, &desc,
> > +-                            sizeof(DPDMADescriptor))) {
> > ++                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPE=
CIFIED)) {
> > +             s->registers[DPDMA_EISR] |=3D ((1 << 1) << channel);
> > +             xlnx_dpdma_update_irq(s);
> > +             s->operation_finished[channel] =3D true;
> > +@@ -708,7 +708,8 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *=
s, uint8_t channel,
> > +                     if (dma_memory_read(&address_space_memory,
> > +                                         source_addr[0],
> > +                                         &s->data[channel][ptr],
> > +-                                        line_size)) {
> > ++                                        line_size,
> > ++                                        MEMTXATTRS_UNSPECIFIED)) {
> > +                         s->registers[DPDMA_ISR] |=3D ((1 << 12) << ch=
annel);
> > +                         xlnx_dpdma_update_irq(s);
> > +                         DPRINTF("Can't get data.\n");
> > +@@ -736,7 +737,8 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *=
s, uint8_t channel,
> > +                     if (dma_memory_read(&address_space_memory,
> > +                                         source_addr[frag],
> > +                                         &(s->data[channel][ptr]),
> > +-                                        fragment_len)) {
> > ++                                        fragment_len,
> > ++                                        MEMTXATTRS_UNSPECIFIED)) {
> > +                         s->registers[DPDMA_ISR] |=3D ((1 << 12) << ch=
annel);
> > +                         xlnx_dpdma_update_irq(s);
> > +                         DPRINTF("Can't get data.\n");
> > +@@ -754,7 +756,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *=
s, uint8_t channel,
> > +             DPRINTF("update the descriptor with the done flag set.\n"=
);
> > +             xlnx_dpdma_desc_set_done(&desc);
> > +             dma_memory_write(&address_space_memory, desc_addr, &desc,
> > +-                             sizeof(DPDMADescriptor));
> > ++                             sizeof(DPDMADescriptor), MEMTXATTRS_UNSP=
ECIFIED);
> > +         }
> > +
> > +         if (xlnx_dpdma_desc_completion_interrupt(&desc)) {
> > +diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> > +index 91fe34a..4d13d8e 100644
> > +--- a/hw/i386/amd_iommu.c
> > ++++ b/hw/i386/amd_iommu.c
> > +@@ -181,7 +181,7 @@ static void amdvi_log_event(AMDVIState *s, uint64_=
t *evt)
> > +     }
> > +
> > +     if (dma_memory_write(&address_space_memory, s->evtlog + s->evtlog=
_tail,
> > +-                         evt, AMDVI_EVENT_LEN)) {
> > ++                         evt, AMDVI_EVENT_LEN, MEMTXATTRS_UNSPECIFIED=
)) {
> > +         trace_amdvi_evntlog_fail(s->evtlog, s->evtlog_tail);
> > +     }
> > +
> > +@@ -376,7 +376,8 @@ static void amdvi_completion_wait(AMDVIState *s, u=
int64_t *cmd)
> > +     }
> > +     if (extract64(cmd[0], 0, 1)) {
> > +         if (dma_memory_write(&address_space_memory, addr, &data,
> > +-            AMDVI_COMPLETION_DATA_SIZE)) {
> > ++                             AMDVI_COMPLETION_DATA_SIZE,
> > ++                             MEMTXATTRS_UNSPECIFIED)) {
> > +             trace_amdvi_completion_wait_fail(addr);
> > +         }
> > +     }
> > +@@ -502,7 +503,7 @@ static void amdvi_cmdbuf_exec(AMDVIState *s)
> > +     uint64_t cmd[2];
> > +
> > +     if (dma_memory_read(&address_space_memory, s->cmdbuf + s->cmdbuf_=
head,
> > +-        cmd, AMDVI_COMMAND_SIZE)) {
> > ++                        cmd, AMDVI_COMMAND_SIZE, MEMTXATTRS_UNSPECIFI=
ED)) {
> > +         trace_amdvi_command_read_fail(s->cmdbuf, s->cmdbuf_head);
> > +         amdvi_log_command_error(s, s->cmdbuf + s->cmdbuf_head);
> > +         return;
> > +@@ -836,7 +837,7 @@ static bool amdvi_get_dte(AMDVIState *s, int devid=
, uint64_t *entry)
> > +     uint32_t offset =3D devid * AMDVI_DEVTAB_ENTRY_SIZE;
> > +
> > +     if (dma_memory_read(&address_space_memory, s->devtab + offset, en=
try,
> > +-        AMDVI_DEVTAB_ENTRY_SIZE)) {
> > ++                        AMDVI_DEVTAB_ENTRY_SIZE, MEMTXATTRS_UNSPECIFI=
ED)) {
> > +         trace_amdvi_dte_get_fail(s->devtab, offset);
> > +         /* log error accessing dte */
> > +         amdvi_log_devtab_error(s, devid, s->devtab + offset, 0);
> > +@@ -881,7 +882,8 @@ static inline uint64_t amdvi_get_pte_entry(AMDVISt=
ate *s, uint64_t pte_addr,
> > + {
> > +     uint64_t pte;
> > +
> > +-    if (dma_memory_read(&address_space_memory, pte_addr, &pte, sizeof=
(pte))) {
> > ++    if (dma_memory_read(&address_space_memory, pte_addr,
> > ++                        &pte, sizeof(pte), MEMTXATTRS_UNSPECIFIED)) {
> > +         trace_amdvi_get_pte_hwerror(pte_addr);
> > +         amdvi_log_pagetab_error(s, devid, pte_addr, 0);
> > +         pte =3D 0;
> > +@@ -1048,7 +1050,7 @@ static int amdvi_get_irte(AMDVIState *s, MSIMess=
age *origin, uint64_t *dte,
> > +     trace_amdvi_ir_irte(irte_root, offset);
> > +
> > +     if (dma_memory_read(&address_space_memory, irte_root + offset,
> > +-                        irte, sizeof(*irte))) {
> > ++                        irte, sizeof(*irte), MEMTXATTRS_UNSPECIFIED))=
 {
> > +         trace_amdvi_ir_err("failed to get irte");
> > +         return -AMDVI_IR_GET_IRTE;
> > +     }
> > +@@ -1108,7 +1110,7 @@ static int amdvi_get_irte_ga(AMDVIState *s, MSIM=
essage *origin, uint64_t *dte,
> > +     trace_amdvi_ir_irte(irte_root, offset);
> > +
> > +     if (dma_memory_read(&address_space_memory, irte_root + offset,
> > +-                        irte, sizeof(*irte))) {
> > ++                        irte, sizeof(*irte), MEMTXATTRS_UNSPECIFIED))=
 {
> > +         trace_amdvi_ir_err("failed to get irte_ga");
> > +         return -AMDVI_IR_GET_IRTE;
> > +     }
> > +diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > +index f584449..5b865ac 100644
> > +--- a/hw/i386/intel_iommu.c
> > ++++ b/hw/i386/intel_iommu.c
> > +@@ -569,7 +569,8 @@ static int vtd_get_root_entry(IntelIOMMUState *s, =
uint8_t index,
> > +     dma_addr_t addr;
> > +
> > +     addr =3D s->root + index * sizeof(*re);
> > +-    if (dma_memory_read(&address_space_memory, addr, re, sizeof(*re))=
) {
> > ++    if (dma_memory_read(&address_space_memory, addr,
> > ++                        re, sizeof(*re), MEMTXATTRS_UNSPECIFIED)) {
> > +         re->lo =3D 0;
> > +         return -VTD_FR_ROOT_TABLE_INV;
> > +     }
> > +@@ -602,7 +603,8 @@ static int vtd_get_context_entry_from_root(IntelIO=
MMUState *s,
> > +     }
> > +
> > +     addr =3D addr + index * ce_size;
> > +-    if (dma_memory_read(&address_space_memory, addr, ce, ce_size)) {
> > ++    if (dma_memory_read(&address_space_memory, addr,
> > ++                        ce, ce_size, MEMTXATTRS_UNSPECIFIED)) {
> > +         return -VTD_FR_CONTEXT_TABLE_INV;
> > +     }
> > +
> > +@@ -639,8 +641,8 @@ static uint64_t vtd_get_slpte(dma_addr_t base_addr=
, uint32_t index)
> > +     assert(index < VTD_SL_PT_ENTRY_NR);
> > +
> > +     if (dma_memory_read(&address_space_memory,
> > +-                        base_addr + index * sizeof(slpte), &slpte,
> > +-                        sizeof(slpte))) {
> > ++                        base_addr + index * sizeof(slpte),
> > ++                        &slpte, sizeof(slpte), MEMTXATTRS_UNSPECIFIED=
)) {
> > +         slpte =3D (uint64_t)-1;
> > +         return slpte;
> > +     }
> > +@@ -704,7 +706,8 @@ static int vtd_get_pdire_from_pdir_table(dma_addr_=
t pasid_dir_base,
> > +     index =3D VTD_PASID_DIR_INDEX(pasid);
> > +     entry_size =3D VTD_PASID_DIR_ENTRY_SIZE;
> > +     addr =3D pasid_dir_base + index * entry_size;
> > +-    if (dma_memory_read(&address_space_memory, addr, pdire, entry_siz=
e)) {
> > ++    if (dma_memory_read(&address_space_memory, addr,
> > ++                        pdire, entry_size, MEMTXATTRS_UNSPECIFIED)) {
> > +         return -VTD_FR_PASID_TABLE_INV;
> > +     }
> > +
> > +@@ -728,7 +731,8 @@ static int vtd_get_pe_in_pasid_leaf_table(IntelIOM=
MUState *s,
> > +     index =3D VTD_PASID_TABLE_INDEX(pasid);
> > +     entry_size =3D VTD_PASID_ENTRY_SIZE;
> > +     addr =3D addr + index * entry_size;
> > +-    if (dma_memory_read(&address_space_memory, addr, pe, entry_size))=
 {
> > ++    if (dma_memory_read(&address_space_memory, addr,
> > ++                        pe, entry_size, MEMTXATTRS_UNSPECIFIED)) {
> > +         return -VTD_FR_PASID_TABLE_INV;
> > +     }
> > +
> > +@@ -2275,7 +2279,8 @@ static bool vtd_get_inv_desc(IntelIOMMUState *s,
> > +     uint32_t dw =3D s->iq_dw ? 32 : 16;
> > +     dma_addr_t addr =3D base_addr + offset * dw;
> > +
> > +-    if (dma_memory_read(&address_space_memory, addr, inv_desc, dw)) {
> > ++    if (dma_memory_read(&address_space_memory, addr,
> > ++                        inv_desc, dw, MEMTXATTRS_UNSPECIFIED)) {
> > +         error_report_once("Read INV DESC failed.");
> > +         return false;
> > +     }
> > +@@ -2308,8 +2313,9 @@ static bool vtd_process_wait_desc(IntelIOMMUStat=
e *s, VTDInvDesc *inv_desc)
> > +         dma_addr_t status_addr =3D inv_desc->hi;
> > +         trace_vtd_inv_desc_wait_sw(status_addr, status_data);
> > +         status_data =3D cpu_to_le32(status_data);
> > +-        if (dma_memory_write(&address_space_memory, status_addr, &sta=
tus_data,
> > +-                             sizeof(status_data))) {
> > ++        if (dma_memory_write(&address_space_memory, status_addr,
> > ++                             &status_data, sizeof(status_data),
> > ++                             MEMTXATTRS_UNSPECIFIED)) {
> > +             trace_vtd_inv_desc_wait_write_fail(inv_desc->hi, inv_desc=
->lo);
> > +             return false;
> > +         }
> > +@@ -3120,8 +3126,8 @@ static int vtd_irte_get(IntelIOMMUState *iommu, =
uint16_t index,
> > +     }
> > +
> > +     addr =3D iommu->intr_root + index * sizeof(*entry);
> > +-    if (dma_memory_read(&address_space_memory, addr, entry,
> > +-                        sizeof(*entry))) {
> > ++    if (dma_memory_read(&address_space_memory, addr,
> > ++                        entry, sizeof(*entry), MEMTXATTRS_UNSPECIFIED=
)) {
> > +         error_report_once("%s: read failed: ind=3D0x%x addr=3D0x%" PR=
Ix64,
> > +                           __func__, index, addr);
> > +         return -VTD_FR_IR_ROOT_INVAL;
> > +diff --git a/hw/ide/macio.c b/hw/ide/macio.c
> > +index b03d401..f08318c 100644
> > +--- a/hw/ide/macio.c
> > ++++ b/hw/ide/macio.c
> > +@@ -97,7 +97,7 @@ static void pmac_ide_atapi_transfer_cb(void *opaque,=
 int ret)
> > +         /* Non-block ATAPI transfer - just copy to RAM */
> > +         s->io_buffer_size =3D MIN(s->io_buffer_size, io->len);
> > +         dma_memory_write(&address_space_memory, io->addr, s->io_buffe=
r,
> > +-                         s->io_buffer_size);
> > ++                         s->io_buffer_size, MEMTXATTRS_UNSPECIFIED);
> > +         io->len =3D 0;
> > +         ide_atapi_cmd_ok(s);
> > +         m->dma_active =3D false;
> > +diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> > +index 190194d..f15f985 100644
> > +--- a/hw/intc/xive.c
> > ++++ b/hw/intc/xive.c
> > +@@ -1246,8 +1246,8 @@ void xive_end_queue_pic_print_info(XiveEND *end,=
 uint32_t width, Monitor *mon)
> > +         uint64_t qaddr =3D qaddr_base + (qindex << 2);
> > +         uint32_t qdata =3D -1;
> > +
> > +-        if (dma_memory_read(&address_space_memory, qaddr, &qdata,
> > +-                            sizeof(qdata))) {
> > ++        if (dma_memory_read(&address_space_memory, qaddr,
> > ++                            &qdata, sizeof(qdata), MEMTXATTRS_UNSPECI=
FIED)) {
> > +             qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to read EQ @=
0x%"
> > +                           HWADDR_PRIx "\n", qaddr);
> > +             return;
> > +@@ -1311,7 +1311,8 @@ static void xive_end_enqueue(XiveEND *end, uint3=
2_t data)
> > +     uint32_t qdata =3D cpu_to_be32((qgen << 31) | (data & 0x7fffffff)=
);
> > +     uint32_t qentries =3D 1 << (qsize + 10);
> > +
> > +-    if (dma_memory_write(&address_space_memory, qaddr, &qdata, sizeof=
(qdata))) {
> > ++    if (dma_memory_write(&address_space_memory, qaddr,
> > ++                         &qdata, sizeof(qdata), MEMTXATTRS_UNSPECIFIE=
D)) {
> > +         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to write END dat=
a @0x%"
> > +                       HWADDR_PRIx "\n", qaddr);
> > +         return;
> > +diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> > +index 73941bd..76ea511 100644
> > +--- a/hw/misc/bcm2835_property.c
> > ++++ b/hw/misc/bcm2835_property.c
> > +@@ -69,7 +69,8 @@ static void bcm2835_property_mbox_push(BCM2835Proper=
tyState *s, uint32_t value)
> > +             break;
> > +         case 0x00010003: /* Get board MAC address */
> > +             resplen =3D sizeof(s->macaddr.a);
> > +-            dma_memory_write(&s->dma_as, value + 12, s->macaddr.a, re=
splen);
> > ++            dma_memory_write(&s->dma_as, value + 12, s->macaddr.a, re=
splen,
> > ++                             MEMTXATTRS_UNSPECIFIED);
> > +             break;
> > +         case 0x00010004: /* Get board serial */
> > +             qemu_log_mask(LOG_UNIMP,
> > +diff --git a/hw/misc/macio/mac_dbdma.c b/hw/misc/macio/mac_dbdma.c
> > +index e220f1a..efcc026 100644
> > +--- a/hw/misc/macio/mac_dbdma.c
> > ++++ b/hw/misc/macio/mac_dbdma.c
> > +@@ -94,7 +94,7 @@ static void dbdma_cmdptr_load(DBDMA_channel *ch)
> > +     DBDMA_DPRINTFCH(ch, "dbdma_cmdptr_load 0x%08x\n",
> > +                     ch->regs[DBDMA_CMDPTR_LO]);
> > +     dma_memory_read(&address_space_memory, ch->regs[DBDMA_CMDPTR_LO],
> > +-                    &ch->current, sizeof(dbdma_cmd));
> > ++                    &ch->current, sizeof(dbdma_cmd), MEMTXATTRS_UNSPE=
CIFIED);
> > + }
> > +
> > + static void dbdma_cmdptr_save(DBDMA_channel *ch)
> > +@@ -104,7 +104,7 @@ static void dbdma_cmdptr_save(DBDMA_channel *ch)
> > +                     le16_to_cpu(ch->current.xfer_status),
> > +                     le16_to_cpu(ch->current.res_count));
> > +     dma_memory_write(&address_space_memory, ch->regs[DBDMA_CMDPTR_LO]=
,
> > +-                     &ch->current, sizeof(dbdma_cmd));
> > ++                     &ch->current, sizeof(dbdma_cmd), MEMTXATTRS_UNSP=
ECIFIED);
> > + }
> > +
> > + static void kill_channel(DBDMA_channel *ch)
> > +@@ -371,7 +371,8 @@ static void load_word(DBDMA_channel *ch, int key, =
uint32_t addr,
> > +         return;
> > +     }
> > +
> > +-    dma_memory_read(&address_space_memory, addr, &current->cmd_dep, l=
en);
> > ++    dma_memory_read(&address_space_memory, addr, &current->cmd_dep, l=
en,
> > ++                    MEMTXATTRS_UNSPECIFIED);
> > +
> > +     if (conditional_wait(ch))
> > +         goto wait;
> > +@@ -403,7 +404,8 @@ static void store_word(DBDMA_channel *ch, int key,=
 uint32_t addr,
> > +         return;
> > +     }
> > +
> > +-    dma_memory_write(&address_space_memory, addr, &current->cmd_dep, =
len);
> > ++    dma_memory_write(&address_space_memory, addr, &current->cmd_dep, =
len,
> > ++                     MEMTXATTRS_UNSPECIFIED);
> > +
> > +     if (conditional_wait(ch))
> > +         goto wait;
> > +diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-em=
ac.c
> > +index ff611f1..ecc0245 100644
> > +--- a/hw/net/allwinner-sun8i-emac.c
> > ++++ b/hw/net/allwinner-sun8i-emac.c
> > +@@ -350,7 +350,8 @@ static void allwinner_sun8i_emac_get_desc(AwSun8iE=
macState *s,
> > +                                           FrameDescriptor *desc,
> > +                                           uint32_t phys_addr)
> > + {
> > +-    dma_memory_read(&s->dma_as, phys_addr, desc, sizeof(*desc));
> > ++    dma_memory_read(&s->dma_as, phys_addr, desc, sizeof(*desc),
> > ++                    MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + static uint32_t allwinner_sun8i_emac_next_desc(AwSun8iEmacState *s,
> > +@@ -402,7 +403,8 @@ static void allwinner_sun8i_emac_flush_desc(AwSun8=
iEmacState *s,
> > +                                             FrameDescriptor *desc,
> > +                                             uint32_t phys_addr)
> > + {
> > +-    dma_memory_write(&s->dma_as, phys_addr, desc, sizeof(*desc));
> > ++    dma_memory_write(&s->dma_as, phys_addr, desc, sizeof(*desc),
> > ++                     MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + static bool allwinner_sun8i_emac_can_receive(NetClientState *nc)
> > +@@ -460,7 +462,8 @@ static ssize_t allwinner_sun8i_emac_receive(NetCli=
entState *nc,
> > +                             << RX_DESC_STATUS_FRM_LEN_SHIFT;
> > +         }
> > +
> > +-        dma_memory_write(&s->dma_as, desc.addr, buf, desc_bytes);
> > ++        dma_memory_write(&s->dma_as, desc.addr, buf, desc_bytes,
> > ++                         MEMTXATTRS_UNSPECIFIED);
> > +         allwinner_sun8i_emac_flush_desc(s, &desc, s->rx_desc_curr);
> > +         trace_allwinner_sun8i_emac_receive(s->rx_desc_curr, desc.addr=
,
> > +                                            desc_bytes);
> > +@@ -512,7 +515,8 @@ static void allwinner_sun8i_emac_transmit(AwSun8iE=
macState *s)
> > +             desc.status |=3D TX_DESC_STATUS_LENGTH_ERR;
> > +             break;
> > +         }
> > +-        dma_memory_read(&s->dma_as, desc.addr, packet_buf + packet_by=
tes, bytes);
> > ++        dma_memory_read(&s->dma_as, desc.addr, packet_buf + packet_by=
tes,
> > ++                        bytes, MEMTXATTRS_UNSPECIFIED);
> > +         packet_bytes +=3D bytes;
> > +         desc.status &=3D ~DESC_STATUS_CTL;
> > +         allwinner_sun8i_emac_flush_desc(s, &desc, s->tx_desc_curr);
> > +@@ -634,7 +638,8 @@ static uint64_t allwinner_sun8i_emac_read(void *op=
aque, hwaddr offset,
> > +         break;
> > +     case REG_TX_CUR_BUF:        /* Transmit Current Buffer */
> > +         if (s->tx_desc_curr !=3D 0) {
> > +-            dma_memory_read(&s->dma_as, s->tx_desc_curr, &desc, sizeo=
f(desc));
> > ++            dma_memory_read(&s->dma_as, s->tx_desc_curr, &desc, sizeo=
f(desc),
> > ++                            MEMTXATTRS_UNSPECIFIED);
> > +             value =3D desc.addr;
> > +         } else {
> > +             value =3D 0;
> > +@@ -647,7 +652,8 @@ static uint64_t allwinner_sun8i_emac_read(void *op=
aque, hwaddr offset,
> > +         break;
> > +     case REG_RX_CUR_BUF:        /* Receive Current Buffer */
> > +         if (s->rx_desc_curr !=3D 0) {
> > +-            dma_memory_read(&s->dma_as, s->rx_desc_curr, &desc, sizeo=
f(desc));
> > ++            dma_memory_read(&s->dma_as, s->rx_desc_curr, &desc, sizeo=
f(desc),
> > ++                            MEMTXATTRS_UNSPECIFIED);
> > +             value =3D desc.addr;
> > +         } else {
> > +             value =3D 0;
> > +diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> > +index 25685ba..83ef0a7 100644
> > +--- a/hw/net/ftgmac100.c
> > ++++ b/hw/net/ftgmac100.c
> > +@@ -453,7 +453,8 @@ static void do_phy_ctl(FTGMAC100State *s)
> > +
> > + static int ftgmac100_read_bd(FTGMAC100Desc *bd, dma_addr_t addr)
> > + {
> > +-    if (dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd))=
) {
> > ++    if (dma_memory_read(&address_space_memory, addr,
> > ++                        bd, sizeof(*bd), MEMTXATTRS_UNSPECIFIED)) {
> > +         qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to read descriptor=
 @ 0x%"
> > +                       HWADDR_PRIx "\n", __func__, addr);
> > +         return -1;
> > +@@ -473,7 +474,8 @@ static int ftgmac100_write_bd(FTGMAC100Desc *bd, d=
ma_addr_t addr)
> > +     lebd.des1 =3D cpu_to_le32(bd->des1);
> > +     lebd.des2 =3D cpu_to_le32(bd->des2);
> > +     lebd.des3 =3D cpu_to_le32(bd->des3);
> > +-    if (dma_memory_write(&address_space_memory, addr, &lebd, sizeof(l=
ebd))) {
> > ++    if (dma_memory_write(&address_space_memory, addr,
> > ++                         &lebd, sizeof(lebd), MEMTXATTRS_UNSPECIFIED)=
) {
> > +         qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to write descripto=
r @ 0x%"
> > +                       HWADDR_PRIx "\n", __func__, addr);
> > +         return -1;
> > +@@ -554,7 +556,8 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uin=
t32_t tx_ring,
> > +             len =3D  sizeof(s->frame) - frame_size;
> > +         }
> > +
> > +-        if (dma_memory_read(&address_space_memory, bd.des3, ptr, len)=
) {
> > ++        if (dma_memory_read(&address_space_memory, bd.des3,
> > ++                            ptr, len, MEMTXATTRS_UNSPECIFIED)) {
> > +             qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to read packet=
 @ 0x%x\n",
> > +                           __func__, bd.des3);
> > +             s->isr |=3D FTGMAC100_INT_AHB_ERR;
> > +@@ -1030,20 +1033,24 @@ static ssize_t ftgmac100_receive(NetClientStat=
e *nc, const uint8_t *buf,
> > +             bd.des1 =3D lduw_be_p(buf + 14) | FTGMAC100_RXDES1_VLANTA=
G_AVAIL;
> > +
> > +             if (s->maccr & FTGMAC100_MACCR_RM_VLAN) {
> > +-                dma_memory_write(&address_space_memory, buf_addr, buf=
, 12);
> > +-                dma_memory_write(&address_space_memory, buf_addr + 12=
, buf + 16,
> > +-                                 buf_len - 16);
> > ++                dma_memory_write(&address_space_memory, buf_addr, buf=
, 12,
> > ++                                 MEMTXATTRS_UNSPECIFIED);
> > ++                dma_memory_write(&address_space_memory, buf_addr + 12=
,
> > ++                                 buf + 16, buf_len - 16,
> > ++                                 MEMTXATTRS_UNSPECIFIED);
> > +             } else {
> > +-                dma_memory_write(&address_space_memory, buf_addr, buf=
, buf_len);
> > ++                dma_memory_write(&address_space_memory, buf_addr, buf=
,
> > ++                                 buf_len, MEMTXATTRS_UNSPECIFIED);
> > +             }
> > +         } else {
> > +             bd.des1 =3D 0;
> > +-            dma_memory_write(&address_space_memory, buf_addr, buf, bu=
f_len);
> > ++            dma_memory_write(&address_space_memory, buf_addr, buf, bu=
f_len,
> > ++                             MEMTXATTRS_UNSPECIFIED);
> > +         }
> > +         buf +=3D buf_len;
> > +         if (size < 4) {
> > +             dma_memory_write(&address_space_memory, buf_addr + buf_le=
n,
> > +-                             crc_ptr, 4 - size);
> > ++                             crc_ptr, 4 - size, MEMTXATTRS_UNSPECIFIE=
D);
> > +             crc_ptr +=3D 4 - size;
> > +         }
> > +
> > +diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> > +index 9c7035b..0db9aaf 100644
> > +--- a/hw/net/imx_fec.c
> > ++++ b/hw/net/imx_fec.c
> > +@@ -387,19 +387,22 @@ static void imx_phy_write(IMXFECState *s, int re=
g, uint32_t val)
> > +
> > + static void imx_fec_read_bd(IMXFECBufDesc *bd, dma_addr_t addr)
> > + {
> > +-    dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd));
> > ++    dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd),
> > ++                    MEMTXATTRS_UNSPECIFIED);
> > +
> > +     trace_imx_fec_read_bd(addr, bd->flags, bd->length, bd->data);
> > + }
> > +
> > + static void imx_fec_write_bd(IMXFECBufDesc *bd, dma_addr_t addr)
> > + {
> > +-    dma_memory_write(&address_space_memory, addr, bd, sizeof(*bd));
> > ++    dma_memory_write(&address_space_memory, addr, bd, sizeof(*bd),
> > ++                     MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + static void imx_enet_read_bd(IMXENETBufDesc *bd, dma_addr_t addr)
> > + {
> > +-    dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd));
> > ++    dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd),
> > ++                    MEMTXATTRS_UNSPECIFIED);
> > +
> > +     trace_imx_enet_read_bd(addr, bd->flags, bd->length, bd->data,
> > +                    bd->option, bd->status);
> > +@@ -407,7 +410,8 @@ static void imx_enet_read_bd(IMXENETBufDesc *bd, d=
ma_addr_t addr)
> > +
> > + static void imx_enet_write_bd(IMXENETBufDesc *bd, dma_addr_t addr)
> > + {
> > +-    dma_memory_write(&address_space_memory, addr, bd, sizeof(*bd));
> > ++    dma_memory_write(&address_space_memory, addr, bd, sizeof(*bd),
> > ++                     MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + static void imx_eth_update(IMXFECState *s)
> > +@@ -474,7 +478,8 @@ static void imx_fec_do_tx(IMXFECState *s)
> > +             len =3D ENET_MAX_FRAME_SIZE - frame_size;
> > +             s->regs[ENET_EIR] |=3D ENET_INT_BABT;
> > +         }
> > +-        dma_memory_read(&address_space_memory, bd.data, ptr, len);
> > ++        dma_memory_read(&address_space_memory, bd.data, ptr, len,
> > ++                        MEMTXATTRS_UNSPECIFIED);
> > +         ptr +=3D len;
> > +         frame_size +=3D len;
> > +         if (bd.flags & ENET_BD_L) {
> > +@@ -555,7 +560,8 @@ static void imx_enet_do_tx(IMXFECState *s, uint32_=
t index)
> > +             len =3D ENET_MAX_FRAME_SIZE - frame_size;
> > +             s->regs[ENET_EIR] |=3D ENET_INT_BABT;
> > +         }
> > +-        dma_memory_read(&address_space_memory, bd.data, ptr, len);
> > ++        dma_memory_read(&address_space_memory, bd.data, ptr, len,
> > ++                        MEMTXATTRS_UNSPECIFIED);
> > +         ptr +=3D len;
> > +         frame_size +=3D len;
> > +         if (bd.flags & ENET_BD_L) {
> > +@@ -1103,11 +1109,12 @@ static ssize_t imx_fec_receive(NetClientState =
*nc, const uint8_t *buf,
> > +             buf_len +=3D size - 4;
> > +         }
> > +         buf_addr =3D bd.data;
> > +-        dma_memory_write(&address_space_memory, buf_addr, buf, buf_le=
n);
> > ++        dma_memory_write(&address_space_memory, buf_addr, buf, buf_le=
n,
> > ++                         MEMTXATTRS_UNSPECIFIED);
> > +         buf +=3D buf_len;
> > +         if (size < 4) {
> > +             dma_memory_write(&address_space_memory, buf_addr + buf_le=
n,
> > +-                             crc_ptr, 4 - size);
> > ++                             crc_ptr, 4 - size, MEMTXATTRS_UNSPECIFIE=
D);
> > +             crc_ptr +=3D 4 - size;
> > +         }
> > +         bd.flags &=3D ~ENET_BD_E;
> > +@@ -1210,8 +1217,8 @@ static ssize_t imx_enet_receive(NetClientState *=
nc, const uint8_t *buf,
> > +              */
> > +             const uint8_t zeros[2] =3D { 0 };
> > +
> > +-            dma_memory_write(&address_space_memory, buf_addr,
> > +-                             zeros, sizeof(zeros));
> > ++            dma_memory_write(&address_space_memory, buf_addr, zeros,
> > ++                             sizeof(zeros), MEMTXATTRS_UNSPECIFIED);
> > +
> > +             buf_addr +=3D sizeof(zeros);
> > +             buf_len  -=3D sizeof(zeros);
> > +@@ -1220,11 +1227,12 @@ static ssize_t imx_enet_receive(NetClientState=
 *nc, const uint8_t *buf,
> > +             shift16 =3D false;
> > +         }
> > +
> > +-        dma_memory_write(&address_space_memory, buf_addr, buf, buf_le=
n);
> > ++        dma_memory_write(&address_space_memory, buf_addr, buf, buf_le=
n,
> > ++                         MEMTXATTRS_UNSPECIFIED);
> > +         buf +=3D buf_len;
> > +         if (size < 4) {
> > +             dma_memory_write(&address_space_memory, buf_addr + buf_le=
n,
> > +-                             crc_ptr, 4 - size);
> > ++                             crc_ptr, 4 - size, MEMTXATTRS_UNSPECIFIE=
D);
> > +             crc_ptr +=3D 4 - size;
> > +         }
> > +         bd.flags &=3D ~ENET_BD_E;
> > +diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
> > +index 545b2b7..9a23289 100644
> > +--- a/hw/net/npcm7xx_emc.c
> > ++++ b/hw/net/npcm7xx_emc.c
> > +@@ -200,7 +200,8 @@ static void emc_update_irq_from_reg_change(NPCM7xx=
EMCState *emc)
> > +
> > + static int emc_read_tx_desc(dma_addr_t addr, NPCM7xxEMCTxDesc *desc)
> > + {
> > +-    if (dma_memory_read(&address_space_memory, addr, desc, sizeof(*de=
sc))) {
> > ++    if (dma_memory_read(&address_space_memory, addr, desc,
> > ++                        sizeof(*desc), MEMTXATTRS_UNSPECIFIED)) {
> > +         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read descriptor=
 @ 0x%"
> > +                       HWADDR_PRIx "\n", __func__, addr);
> > +         return -1;
> > +@@ -221,7 +222,7 @@ static int emc_write_tx_desc(const NPCM7xxEMCTxDes=
c *desc, dma_addr_t addr)
> > +     le_desc.status_and_length =3D cpu_to_le32(desc->status_and_length=
);
> > +     le_desc.ntxdsa =3D cpu_to_le32(desc->ntxdsa);
> > +     if (dma_memory_write(&address_space_memory, addr, &le_desc,
> > +-                         sizeof(le_desc))) {
> > ++                         sizeof(le_desc), MEMTXATTRS_UNSPECIFIED)) {
> > +         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to write descripto=
r @ 0x%"
> > +                       HWADDR_PRIx "\n", __func__, addr);
> > +         return -1;
> > +@@ -231,7 +232,8 @@ static int emc_write_tx_desc(const NPCM7xxEMCTxDes=
c *desc, dma_addr_t addr)
> > +
> > + static int emc_read_rx_desc(dma_addr_t addr, NPCM7xxEMCRxDesc *desc)
> > + {
> > +-    if (dma_memory_read(&address_space_memory, addr, desc, sizeof(*de=
sc))) {
> > ++    if (dma_memory_read(&address_space_memory, addr, desc,
> > ++                        sizeof(*desc), MEMTXATTRS_UNSPECIFIED)) {
> > +         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read descriptor=
 @ 0x%"
> > +                       HWADDR_PRIx "\n", __func__, addr);
> > +         return -1;
> > +@@ -252,7 +254,7 @@ static int emc_write_rx_desc(const NPCM7xxEMCRxDes=
c *desc, dma_addr_t addr)
> > +     le_desc.reserved =3D cpu_to_le32(desc->reserved);
> > +     le_desc.nrxdsa =3D cpu_to_le32(desc->nrxdsa);
> > +     if (dma_memory_write(&address_space_memory, addr, &le_desc,
> > +-                         sizeof(le_desc))) {
> > ++                         sizeof(le_desc), MEMTXATTRS_UNSPECIFIED)) {
> > +         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to write descripto=
r @ 0x%"
> > +                       HWADDR_PRIx "\n", __func__, addr);
> > +         return -1;
> > +@@ -366,7 +368,8 @@ static void emc_try_send_next_packet(NPCM7xxEMCSta=
te *emc)
> > +         buf =3D malloced_buf;
> > +     }
> > +
> > +-    if (dma_memory_read(&address_space_memory, next_buf_addr, buf, le=
ngth)) {
> > ++    if (dma_memory_read(&address_space_memory, next_buf_addr, buf,
> > ++                        length, MEMTXATTRS_UNSPECIFIED)) {
> > +         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read packet @ 0=
x%x\n",
> > +                       __func__, next_buf_addr);
> > +         emc_set_mista(emc, REG_MISTA_TXBERR);
> > +@@ -551,10 +554,11 @@ static ssize_t emc_receive(NetClientState *nc, c=
onst uint8_t *buf, size_t len1)
> > +
> > +     buf_addr =3D rx_desc.rxbsa;
> > +     emc->regs[REG_CRXBSA] =3D buf_addr;
> > +-    if (dma_memory_write(&address_space_memory, buf_addr, buf, len) |=
|
> > ++    if (dma_memory_write(&address_space_memory, buf_addr, buf,
> > ++                         len, MEMTXATTRS_UNSPECIFIED) ||
> > +         (!(emc->regs[REG_MCMDR] & REG_MCMDR_SPCRC) &&
> > +-         dma_memory_write(&address_space_memory, buf_addr + len, crc_=
ptr,
> > +-                          4))) {
> > ++         dma_memory_write(&address_space_memory, buf_addr + len,
> > ++                          crc_ptr, 4, MEMTXATTRS_UNSPECIFIED))) {
> > +         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bus error writing packet\=
n",
> > +                       __func__);
> > +         emc_set_mista(emc, REG_MISTA_RXBERR);
> > +diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> > +index f7803fe..9b91b15 100644
> > +--- a/hw/nvram/fw_cfg.c
> > ++++ b/hw/nvram/fw_cfg.c
> > +@@ -357,7 +357,8 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
> > +     dma_addr =3D s->dma_addr;
> > +     s->dma_addr =3D 0;
> > +
> > +-    if (dma_memory_read(s->dma_as, dma_addr, &dma, sizeof(dma))) {
> > ++    if (dma_memory_read(s->dma_as, dma_addr,
> > ++                        &dma, sizeof(dma), MEMTXATTRS_UNSPECIFIED)) {
> > +         stl_be_dma(s->dma_as, dma_addr + offsetof(FWCfgDmaAccess, con=
trol),
> > +                    FW_CFG_DMA_CTL_ERROR);
> > +         return;
> > +@@ -419,7 +420,8 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
> > +              */
> > +             if (read) {
> > +                 if (dma_memory_write(s->dma_as, dma.address,
> > +-                                    &e->data[s->cur_offset], len)) {
> > ++                                     &e->data[s->cur_offset], len,
> > ++                                     MEMTXATTRS_UNSPECIFIED)) {
> > +                     dma.control |=3D FW_CFG_DMA_CTL_ERROR;
> > +                 }
> > +             }
> > +@@ -427,7 +429,8 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
> > +                 if (!e->allow_write ||
> > +                     len !=3D dma.length ||
> > +                     dma_memory_read(s->dma_as, dma.address,
> > +-                                    &e->data[s->cur_offset], len)) {
> > ++                                    &e->data[s->cur_offset], len,
> > ++                                    MEMTXATTRS_UNSPECIFIED)) {
> > +                     dma.control |=3D FW_CFG_DMA_CTL_ERROR;
> > +                 } else if (e->write_cb) {
> > +                     e->write_cb(e->callback_opaque, s->cur_offset, le=
n);
> > +diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> > +index 9c4451c..c6e7871 100644
> > +--- a/hw/pci-host/pnv_phb3.c
> > ++++ b/hw/pci-host/pnv_phb3.c
> > +@@ -715,7 +715,8 @@ static bool pnv_phb3_resolve_pe(PnvPhb3DMASpace *d=
s)
> > +     bus_num =3D pci_bus_num(ds->bus);
> > +     addr =3D rtt & PHB_RTT_BASE_ADDRESS_MASK;
> > +     addr +=3D 2 * ((bus_num << 8) | ds->devfn);
> > +-    if (dma_memory_read(&address_space_memory, addr, &rte, sizeof(rte=
))) {
> > ++    if (dma_memory_read(&address_space_memory, addr, &rte,
> > ++                        sizeof(rte), MEMTXATTRS_UNSPECIFIED)) {
> > +         phb3_error(ds->phb, "Failed to read RTT entry at 0x%"PRIx64, =
addr);
> > +         /* Set error bits ? fence ? ... */
> > +         return false;
> > +@@ -794,7 +795,7 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace=
 *ds, hwaddr addr,
> > +             /* Grab the TCE address */
> > +             taddr =3D base | (((addr >> sh) & ((1ul << tbl_shift) - 1=
)) << 3);
> > +             if (dma_memory_read(&address_space_memory, taddr, &tce,
> > +-                                sizeof(tce))) {
> > ++                                sizeof(tce), MEMTXATTRS_UNSPECIFIED))=
 {
> > +                 phb3_error(phb, "Failed to read TCE at 0x%"PRIx64, ta=
ddr);
> > +                 return;
> > +             }
> > +diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c
> > +index 099d209..8bcbc2c 100644
> > +--- a/hw/pci-host/pnv_phb3_msi.c
> > ++++ b/hw/pci-host/pnv_phb3_msi.c
> > +@@ -53,7 +53,8 @@ static bool phb3_msi_read_ive(PnvPHB3 *phb, int srcn=
o, uint64_t *out_ive)
> > +         return false;
> > +     }
> > +
> > +-    if (dma_memory_read(&address_space_memory, ive_addr, &ive, sizeof=
(ive))) {
> > ++    if (dma_memory_read(&address_space_memory, ive_addr,
> > ++                        &ive, sizeof(ive), MEMTXATTRS_UNSPECIFIED)) {
> > +         qemu_log_mask(LOG_GUEST_ERROR, "Failed to read IVE at 0x%" PR=
Ix64,
> > +                       ive_addr);
> > +         return false;
> > +@@ -73,7 +74,8 @@ static void phb3_msi_set_p(Phb3MsiState *msi, int sr=
cno, uint8_t gen)
> > +         return;
> > +     }
> > +
> > +-    if (dma_memory_write(&address_space_memory, ive_addr + 4, &p, 1))=
 {
> > ++    if (dma_memory_write(&address_space_memory, ive_addr + 4,
> > ++                         &p, 1, MEMTXATTRS_UNSPECIFIED)) {
> > +         qemu_log_mask(LOG_GUEST_ERROR,
> > +                       "Failed to write IVE (set P) at 0x%" PRIx64, iv=
e_addr);
> > +     }
> > +@@ -89,7 +91,8 @@ static void phb3_msi_set_q(Phb3MsiState *msi, int sr=
cno)
> > +         return;
> > +     }
> > +
> > +-    if (dma_memory_write(&address_space_memory, ive_addr + 5, &q, 1))=
 {
> > ++    if (dma_memory_write(&address_space_memory, ive_addr + 5,
> > ++                         &q, 1, MEMTXATTRS_UNSPECIFIED)) {
> > +         qemu_log_mask(LOG_GUEST_ERROR,
> > +                       "Failed to write IVE (set Q) at 0x%" PRIx64, iv=
e_addr);
> > +     }
> > +diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> > +index 40b7932..1fbf732 100644
> > +--- a/hw/pci-host/pnv_phb4.c
> > ++++ b/hw/pci-host/pnv_phb4.c
> > +@@ -891,7 +891,8 @@ static bool pnv_phb4_resolve_pe(PnvPhb4DMASpace *d=
s)
> > +     bus_num =3D pci_bus_num(ds->bus);
> > +     addr =3D rtt & PHB_RTT_BASE_ADDRESS_MASK;
> > +     addr +=3D 2 * PCI_BUILD_BDF(bus_num, ds->devfn);
> > +-    if (dma_memory_read(&address_space_memory, addr, &rte, sizeof(rte=
))) {
> > ++    if (dma_memory_read(&address_space_memory, addr, &rte,
> > ++                        sizeof(rte), MEMTXATTRS_UNSPECIFIED)) {
> > +         phb_error(ds->phb, "Failed to read RTT entry at 0x%"PRIx64, a=
ddr);
> > +         /* Set error bits ? fence ? ... */
> > +         return false;
> > +@@ -961,7 +962,7 @@ static void pnv_phb4_translate_tve(PnvPhb4DMASpace=
 *ds, hwaddr addr,
> > +             /* Grab the TCE address */
> > +             taddr =3D base | (((addr >> sh) & ((1ul << tbl_shift) - 1=
)) << 3);
> > +             if (dma_memory_read(&address_space_memory, taddr, &tce,
> > +-                                sizeof(tce))) {
> > ++                                sizeof(tce), MEMTXATTRS_UNSPECIFIED))=
 {
> > +                 phb_error(ds->phb, "Failed to read TCE at 0x%"PRIx64,=
 taddr);
> > +                 return;
> > +             }
> > +diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
> > +index 9166d66..de5bc49 100644
> > +--- a/hw/sd/allwinner-sdhost.c
> > ++++ b/hw/sd/allwinner-sdhost.c
> > +@@ -311,7 +311,8 @@ static uint32_t allwinner_sdhost_process_desc(AwSd=
HostState *s,
> > +     uint8_t buf[1024];
> > +
> > +     /* Read descriptor */
> > +-    dma_memory_read(&s->dma_as, desc_addr, desc, sizeof(*desc));
> > ++    dma_memory_read(&s->dma_as, desc_addr, desc, sizeof(*desc),
> > ++                    MEMTXATTRS_UNSPECIFIED);
> > +     if (desc->size =3D=3D 0) {
> > +         desc->size =3D klass->max_desc_size;
> > +     } else if (desc->size > klass->max_desc_size) {
> > +@@ -337,23 +338,24 @@ static uint32_t allwinner_sdhost_process_desc(Aw=
SdHostState *s,
> > +         /* Write to SD bus */
> > +         if (is_write) {
> > +             dma_memory_read(&s->dma_as,
> > +-                            (desc->addr & DESC_SIZE_MASK) + num_done,
> > +-                            buf, buf_bytes);
> > ++                            (desc->addr & DESC_SIZE_MASK) + num_done,=
 buf,
> > ++                            buf_bytes, MEMTXATTRS_UNSPECIFIED);
> > +             sdbus_write_data(&s->sdbus, buf, buf_bytes);
> > +
> > +         /* Read from SD bus */
> > +         } else {
> > +             sdbus_read_data(&s->sdbus, buf, buf_bytes);
> > +             dma_memory_write(&s->dma_as,
> > +-                             (desc->addr & DESC_SIZE_MASK) + num_done=
,
> > +-                             buf, buf_bytes);
> > ++                             (desc->addr & DESC_SIZE_MASK) + num_done=
, buf,
> > ++                             buf_bytes, MEMTXATTRS_UNSPECIFIED);
> > +         }
> > +         num_done +=3D buf_bytes;
> > +     }
> > +
> > +     /* Clear hold flag and flush descriptor */
> > +     desc->status &=3D ~DESC_STATUS_HOLD;
> > +-    dma_memory_write(&s->dma_as, desc_addr, desc, sizeof(*desc));
> > ++    dma_memory_write(&s->dma_as, desc_addr, desc, sizeof(*desc),
> > ++                     MEMTXATTRS_UNSPECIFIED);
> > +
> > +     return num_done;
> > + }
> > +diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> > +index c9dc065..e0bbc90 100644
> > +--- a/hw/sd/sdhci.c
> > ++++ b/hw/sd/sdhci.c
> > +@@ -616,8 +616,8 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCI=
State *s)
> > +                     s->blkcnt--;
> > +                 }
> > +             }
> > +-            dma_memory_write(s->dma_as, s->sdmasysad,
> > +-                             &s->fifo_buffer[begin], s->data_count - =
begin);
> > ++            dma_memory_write(s->dma_as, s->sdmasysad, &s->fifo_buffer=
[begin],
> > ++                             s->data_count - begin, MEMTXATTRS_UNSPEC=
IFIED);
> > +             s->sdmasysad +=3D s->data_count - begin;
> > +             if (s->data_count =3D=3D block_size) {
> > +                 s->data_count =3D 0;
> > +@@ -637,8 +637,8 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCI=
State *s)
> > +                 s->data_count =3D block_size;
> > +                 boundary_count -=3D block_size - begin;
> > +             }
> > +-            dma_memory_read(s->dma_as, s->sdmasysad,
> > +-                            &s->fifo_buffer[begin], s->data_count - b=
egin);
> > ++            dma_memory_read(s->dma_as, s->sdmasysad, &s->fifo_buffer[=
begin],
> > ++                            s->data_count - begin, MEMTXATTRS_UNSPECI=
FIED);
> > +             s->sdmasysad +=3D s->data_count - begin;
> > +             if (s->data_count =3D=3D block_size) {
> > +                 sdbus_write_data(&s->sdbus, s->fifo_buffer, block_siz=
e);
> > +@@ -670,9 +670,11 @@ static void sdhci_sdma_transfer_single_block(SDHC=
IState *s)
> > +
> > +     if (s->trnmod & SDHC_TRNS_READ) {
> > +         sdbus_read_data(&s->sdbus, s->fifo_buffer, datacnt);
> > +-        dma_memory_write(s->dma_as, s->sdmasysad, s->fifo_buffer, dat=
acnt);
> > ++        dma_memory_write(s->dma_as, s->sdmasysad, s->fifo_buffer, dat=
acnt,
> > ++                         MEMTXATTRS_UNSPECIFIED);
> > +     } else {
> > +-        dma_memory_read(s->dma_as, s->sdmasysad, s->fifo_buffer, data=
cnt);
> > ++        dma_memory_read(s->dma_as, s->sdmasysad, s->fifo_buffer, data=
cnt,
> > ++                        MEMTXATTRS_UNSPECIFIED);
> > +         sdbus_write_data(&s->sdbus, s->fifo_buffer, datacnt);
> > +     }
> > +     s->blkcnt--;
> > +@@ -694,7 +696,8 @@ static void get_adma_description(SDHCIState *s, AD=
MADescr *dscr)
> > +     hwaddr entry_addr =3D (hwaddr)s->admasysaddr;
> > +     switch (SDHC_DMA_TYPE(s->hostctl1)) {
> > +     case SDHC_CTRL_ADMA2_32:
> > +-        dma_memory_read(s->dma_as, entry_addr, &adma2, sizeof(adma2))=
;
> > ++        dma_memory_read(s->dma_as, entry_addr, &adma2, sizeof(adma2),
> > ++                        MEMTXATTRS_UNSPECIFIED);
> > +         adma2 =3D le64_to_cpu(adma2);
> > +         /* The spec does not specify endianness of descriptor table.
> > +          * We currently assume that it is LE.
> > +@@ -705,7 +708,8 @@ static void get_adma_description(SDHCIState *s, AD=
MADescr *dscr)
> > +         dscr->incr =3D 8;
> > +         break;
> > +     case SDHC_CTRL_ADMA1_32:
> > +-        dma_memory_read(s->dma_as, entry_addr, &adma1, sizeof(adma1))=
;
> > ++        dma_memory_read(s->dma_as, entry_addr, &adma1, sizeof(adma1),
> > ++                        MEMTXATTRS_UNSPECIFIED);
> > +         adma1 =3D le32_to_cpu(adma1);
> > +         dscr->addr =3D (hwaddr)(adma1 & 0xFFFFF000);
> > +         dscr->attr =3D (uint8_t)extract32(adma1, 0, 7);
> > +@@ -717,10 +721,13 @@ static void get_adma_description(SDHCIState *s, =
ADMADescr *dscr)
> > +         }
> > +         break;
> > +     case SDHC_CTRL_ADMA2_64:
> > +-        dma_memory_read(s->dma_as, entry_addr, &dscr->attr, 1);
> > +-        dma_memory_read(s->dma_as, entry_addr + 2, &dscr->length, 2);
> > ++        dma_memory_read(s->dma_as, entry_addr, &dscr->attr, 1,
> > ++                        MEMTXATTRS_UNSPECIFIED);
> > ++        dma_memory_read(s->dma_as, entry_addr + 2, &dscr->length, 2,
> > ++                        MEMTXATTRS_UNSPECIFIED);
> > +         dscr->length =3D le16_to_cpu(dscr->length);
> > +-        dma_memory_read(s->dma_as, entry_addr + 4, &dscr->addr, 8);
> > ++        dma_memory_read(s->dma_as, entry_addr + 4, &dscr->addr, 8,
> > ++                        MEMTXATTRS_UNSPECIFIED);
> > +         dscr->addr =3D le64_to_cpu(dscr->addr);
> > +         dscr->attr &=3D (uint8_t) ~0xC0;
> > +         dscr->incr =3D 12;
> > +@@ -785,7 +792,8 @@ static void sdhci_do_adma(SDHCIState *s)
> > +                     }
> > +                     dma_memory_write(s->dma_as, dscr.addr,
> > +                                      &s->fifo_buffer[begin],
> > +-                                     s->data_count - begin);
> > ++                                     s->data_count - begin,
> > ++                                     MEMTXATTRS_UNSPECIFIED);
> > +                     dscr.addr +=3D s->data_count - begin;
> > +                     if (s->data_count =3D=3D block_size) {
> > +                         s->data_count =3D 0;
> > +@@ -810,7 +818,8 @@ static void sdhci_do_adma(SDHCIState *s)
> > +                     }
> > +                     dma_memory_read(s->dma_as, dscr.addr,
> > +                                     &s->fifo_buffer[begin],
> > +-                                    s->data_count - begin);
> > ++                                    s->data_count - begin,
> > ++                                    MEMTXATTRS_UNSPECIFIED);
> > +                     dscr.addr +=3D s->data_count - begin;
> > +                     if (s->data_count =3D=3D block_size) {
> > +                         sdbus_write_data(&s->sdbus, s->fifo_buffer, b=
lock_size);
> > +diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
> > +index e1d96ac..8755e9c 100644
> > +--- a/hw/usb/hcd-dwc2.c
> > ++++ b/hw/usb/hcd-dwc2.c
> > +@@ -272,8 +272,8 @@ static void dwc2_handle_packet(DWC2State *s, uint3=
2_t devadr, USBDevice *dev,
> > +
> > +         if (pid !=3D USB_TOKEN_IN) {
> > +             trace_usb_dwc2_memory_read(hcdma, tlen);
> > +-            if (dma_memory_read(&s->dma_as, hcdma,
> > +-                                s->usb_buf[chan], tlen) !=3D MEMTX_OK=
) {
> > ++            if (dma_memory_read(&s->dma_as, hcdma, s->usb_buf[chan], =
tlen,
> > ++                                MEMTXATTRS_UNSPECIFIED) !=3D MEMTX_OK=
) {
> > +                 qemu_log_mask(LOG_GUEST_ERROR, "%s: dma_memory_read f=
ailed\n",
> > +                               __func__);
> > +             }
> > +@@ -328,8 +328,8 @@ babble:
> > +
> > +         if (pid =3D=3D USB_TOKEN_IN) {
> > +             trace_usb_dwc2_memory_write(hcdma, actual);
> > +-            if (dma_memory_write(&s->dma_as, hcdma, s->usb_buf[chan],
> > +-                                 actual) !=3D MEMTX_OK) {
> > ++            if (dma_memory_write(&s->dma_as, hcdma, s->usb_buf[chan],=
 actual,
> > ++                                 MEMTXATTRS_UNSPECIFIED) !=3D MEMTX_O=
K) {
> > +                 qemu_log_mask(LOG_GUEST_ERROR, "%s: dma_memory_write =
failed\n",
> > +                               __func__);
> > +             }
> > +diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> > +index 6caa7ac..33a8a37 100644
> > +--- a/hw/usb/hcd-ehci.c
> > ++++ b/hw/usb/hcd-ehci.c
> > +@@ -383,7 +383,8 @@ static inline int get_dwords(EHCIState *ehci, uint=
32_t addr,
> > +     }
> > +
> > +     for (i =3D 0; i < num; i++, buf++, addr +=3D sizeof(*buf)) {
> > +-        dma_memory_read(ehci->as, addr, buf, sizeof(*buf));
> > ++        dma_memory_read(ehci->as, addr, buf, sizeof(*buf),
> > ++                        MEMTXATTRS_UNSPECIFIED);
> > +         *buf =3D le32_to_cpu(*buf);
> > +     }
> > +
> > +@@ -405,7 +406,8 @@ static inline int put_dwords(EHCIState *ehci, uint=
32_t addr,
> > +
> > +     for (i =3D 0; i < num; i++, buf++, addr +=3D sizeof(*buf)) {
> > +         uint32_t tmp =3D cpu_to_le32(*buf);
> > +-        dma_memory_write(ehci->as, addr, &tmp, sizeof(tmp));
> > ++        dma_memory_write(ehci->as, addr, &tmp, sizeof(tmp),
> > ++                         MEMTXATTRS_UNSPECIFIED);
> > +     }
> > +
> > +     return num;
> > +diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> > +index 56e2315..a93d6b2 100644
> > +--- a/hw/usb/hcd-ohci.c
> > ++++ b/hw/usb/hcd-ohci.c
> > +@@ -452,7 +452,8 @@ static inline int get_dwords(OHCIState *ohci,
> > +     addr +=3D ohci->localmem_base;
> > +
> > +     for (i =3D 0; i < num; i++, buf++, addr +=3D sizeof(*buf)) {
> > +-        if (dma_memory_read(ohci->as, addr, buf, sizeof(*buf))) {
> > ++        if (dma_memory_read(ohci->as, addr,
> > ++                            buf, sizeof(*buf), MEMTXATTRS_UNSPECIFIED=
)) {
> > +             return -1;
> > +         }
> > +         *buf =3D le32_to_cpu(*buf);
> > +@@ -471,7 +472,8 @@ static inline int put_dwords(OHCIState *ohci,
> > +
> > +     for (i =3D 0; i < num; i++, buf++, addr +=3D sizeof(*buf)) {
> > +         uint32_t tmp =3D cpu_to_le32(*buf);
> > +-        if (dma_memory_write(ohci->as, addr, &tmp, sizeof(tmp))) {
> > ++        if (dma_memory_write(ohci->as, addr,
> > ++                             &tmp, sizeof(tmp), MEMTXATTRS_UNSPECIFIE=
D)) {
> > +             return -1;
> > +         }
> > +     }
> > +@@ -488,7 +490,8 @@ static inline int get_words(OHCIState *ohci,
> > +     addr +=3D ohci->localmem_base;
> > +
> > +     for (i =3D 0; i < num; i++, buf++, addr +=3D sizeof(*buf)) {
> > +-        if (dma_memory_read(ohci->as, addr, buf, sizeof(*buf))) {
> > ++        if (dma_memory_read(ohci->as, addr,
> > ++                            buf, sizeof(*buf), MEMTXATTRS_UNSPECIFIED=
)) {
> > +             return -1;
> > +         }
> > +         *buf =3D le16_to_cpu(*buf);
> > +@@ -507,7 +510,8 @@ static inline int put_words(OHCIState *ohci,
> > +
> > +     for (i =3D 0; i < num; i++, buf++, addr +=3D sizeof(*buf)) {
> > +         uint16_t tmp =3D cpu_to_le16(*buf);
> > +-        if (dma_memory_write(ohci->as, addr, &tmp, sizeof(tmp))) {
> > ++        if (dma_memory_write(ohci->as, addr,
> > ++                             &tmp, sizeof(tmp), MEMTXATTRS_UNSPECIFIE=
D)) {
> > +             return -1;
> > +         }
> > +     }
> > +@@ -537,8 +541,8 @@ static inline int ohci_read_iso_td(OHCIState *ohci=
,
> > + static inline int ohci_read_hcca(OHCIState *ohci,
> > +                                  dma_addr_t addr, struct ohci_hcca *h=
cca)
> > + {
> > +-    return dma_memory_read(ohci->as, addr + ohci->localmem_base,
> > +-                           hcca, sizeof(*hcca));
> > ++    return dma_memory_read(ohci->as, addr + ohci->localmem_base, hcca=
,
> > ++                           sizeof(*hcca), MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + static inline int ohci_put_ed(OHCIState *ohci,
> > +@@ -572,7 +576,7 @@ static inline int ohci_put_hcca(OHCIState *ohci,
> > +     return dma_memory_write(ohci->as,
> > +                             addr + ohci->localmem_base + HCCA_WRITEBA=
CK_OFFSET,
> > +                             (char *)hcca + HCCA_WRITEBACK_OFFSET,
> > +-                            HCCA_WRITEBACK_SIZE);
> > ++                            HCCA_WRITEBACK_SIZE, MEMTXATTRS_UNSPECIFI=
ED);
> > + }
> > +
> > + /* Read/Write the contents of a TD from/to main memory.  */
> > +diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> > +index e017000..ed2b9ea 100644
> > +--- a/hw/usb/hcd-xhci.c
> > ++++ b/hw/usb/hcd-xhci.c
> > +@@ -487,7 +487,7 @@ static inline void xhci_dma_read_u32s(XHCIState *x=
hci, dma_addr_t addr,
> > +
> > +     assert((len % sizeof(uint32_t)) =3D=3D 0);
> > +
> > +-    dma_memory_read(xhci->as, addr, buf, len);
> > ++    dma_memory_read(xhci->as, addr, buf, len, MEMTXATTRS_UNSPECIFIED)=
;
> > +
> > +     for (i =3D 0; i < (len / sizeof(uint32_t)); i++) {
> > +         buf[i] =3D le32_to_cpu(buf[i]);
> > +@@ -507,7 +507,7 @@ static inline void xhci_dma_write_u32s(XHCIState *=
xhci, dma_addr_t addr,
> > +     for (i =3D 0; i < n; i++) {
> > +         tmp[i] =3D cpu_to_le32(buf[i]);
> > +     }
> > +-    dma_memory_write(xhci->as, addr, tmp, len);
> > ++    dma_memory_write(xhci->as, addr, tmp, len, MEMTXATTRS_UNSPECIFIED=
);
> > + }
> > +
> > + static XHCIPort *xhci_lookup_port(XHCIState *xhci, struct USBPort *up=
ort)
> > +@@ -618,7 +618,7 @@ static void xhci_write_event(XHCIState *xhci, XHCI=
Event *event, int v)
> > +                                ev_trb.status, ev_trb.control);
> > +
> > +     addr =3D intr->er_start + TRB_SIZE*intr->er_ep_idx;
> > +-    dma_memory_write(xhci->as, addr, &ev_trb, TRB_SIZE);
> > ++    dma_memory_write(xhci->as, addr, &ev_trb, TRB_SIZE, MEMTXATTRS_UN=
SPECIFIED);
> > +
> > +     intr->er_ep_idx++;
> > +     if (intr->er_ep_idx >=3D intr->er_size) {
> > +@@ -679,7 +679,8 @@ static TRBType xhci_ring_fetch(XHCIState *xhci, XH=
CIRing *ring, XHCITRB *trb,
> > +
> > +     while (1) {
> > +         TRBType type;
> > +-        dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE);
> > ++        dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE,
> > ++                        MEMTXATTRS_UNSPECIFIED);
> > +         trb->addr =3D ring->dequeue;
> > +         trb->ccs =3D ring->ccs;
> > +         le64_to_cpus(&trb->parameter);
> > +@@ -726,7 +727,8 @@ static int xhci_ring_chain_length(XHCIState *xhci,=
 const XHCIRing *ring)
> > +
> > +     while (1) {
> > +         TRBType type;
> > +-        dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE);
> > ++        dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
> > ++                        MEMTXATTRS_UNSPECIFIED);
> > +         le64_to_cpus(&trb.parameter);
> > +         le32_to_cpus(&trb.status);
> > +         le32_to_cpus(&trb.control);
> > +@@ -781,7 +783,8 @@ static void xhci_er_reset(XHCIState *xhci, int v)
> > +         xhci_die(xhci);
> > +         return;
> > +     }
> > +-    dma_memory_read(xhci->as, erstba, &seg, sizeof(seg));
> > ++    dma_memory_read(xhci->as, erstba, &seg, sizeof(seg),
> > ++                    MEMTXATTRS_UNSPECIFIED);
> > +     le32_to_cpus(&seg.addr_low);
> > +     le32_to_cpus(&seg.addr_high);
> > +     le32_to_cpus(&seg.size);
> > +@@ -2397,7 +2400,8 @@ static TRBCCode xhci_get_port_bandwidth(XHCIStat=
e *xhci, uint64_t pctx)
> > +     /* TODO: actually implement real values here */
> > +     bw_ctx[0] =3D 0;
> > +     memset(&bw_ctx[1], 80, xhci->numports); /* 80% */
> > +-    dma_memory_write(xhci->as, ctx, bw_ctx, sizeof(bw_ctx));
> > ++    dma_memory_write(xhci->as, ctx, bw_ctx, sizeof(bw_ctx),
> > ++                     MEMTXATTRS_UNSPECIFIED);
> > +
> > +     return CC_SUCCESS;
> > + }
> > +diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
> > +index c90e74a..5d2ea8e 100644
> > +--- a/include/hw/ppc/spapr_vio.h
> > ++++ b/include/hw/ppc/spapr_vio.h
> > +@@ -97,14 +97,16 @@ static inline bool spapr_vio_dma_valid(SpaprVioDev=
ice *dev, uint64_t taddr,
> > + static inline int spapr_vio_dma_read(SpaprVioDevice *dev, uint64_t ta=
ddr,
> > +                                      void *buf, uint32_t size)
> > + {
> > +-    return (dma_memory_read(&dev->as, taddr, buf, size) !=3D 0) ?
> > ++    return (dma_memory_read(&dev->as, taddr,
> > ++                            buf, size, MEMTXATTRS_UNSPECIFIED) !=3D 0=
) ?
> > +         H_DEST_PARM : H_SUCCESS;
> > + }
> > +
> > + static inline int spapr_vio_dma_write(SpaprVioDevice *dev, uint64_t t=
addr,
> > +                                       const void *buf, uint32_t size)
> > + {
> > +-    return (dma_memory_write(&dev->as, taddr, buf, size) !=3D 0) ?
> > ++    return (dma_memory_write(&dev->as, taddr,
> > ++                             buf, size, MEMTXATTRS_UNSPECIFIED) !=3D =
0) ?
> > +         H_DEST_PARM : H_SUCCESS;
> > + }
> > +
> > +diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> > +index e8ad422..522682b 100644
> > +--- a/include/sysemu/dma.h
> > ++++ b/include/sysemu/dma.h
> > +@@ -143,12 +143,14 @@ static inline MemTxResult dma_memory_rw(AddressS=
pace *as, dma_addr_t addr,
> > +  * @addr: address within that address space
> > +  * @buf: buffer with the data transferred
> > +  * @len: length of the data transferred
> > ++ * @attrs: memory transaction attributes
> > +  */
> > + static inline MemTxResult dma_memory_read(AddressSpace *as, dma_addr_=
t addr,
> > +-                                          void *buf, dma_addr_t len)
> > ++                                          void *buf, dma_addr_t len,
> > ++                                          MemTxAttrs attrs)
> > + {
> > +     return dma_memory_rw(as, addr, buf, len,
> > +-                         DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIF=
IED);
> > ++                         DMA_DIRECTION_TO_DEVICE, attrs);
> > + }
> > +
> > + /**
> > +@@ -162,12 +164,14 @@ static inline MemTxResult dma_memory_read(Addres=
sSpace *as, dma_addr_t addr,
> > +  * @addr: address within that address space
> > +  * @buf: buffer with the data transferred
> > +  * @len: the number of bytes to write
> > ++ * @attrs: memory transaction attributes
> > +  */
> > + static inline MemTxResult dma_memory_write(AddressSpace *as, dma_addr=
_t addr,
> > +-                                           const void *buf, dma_addr_=
t len)
> > ++                                           const void *buf, dma_addr_=
t len,
> > ++                                           MemTxAttrs attrs)
> > + {
> > +     return dma_memory_rw(as, addr, (void *)buf, len,
> > +-                         DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPEC=
IFIED);
> > ++                         DMA_DIRECTION_FROM_DEVICE, attrs);
> > + }
> > +
> > + /**
> > +@@ -239,7 +243,7 @@ static inline void dma_memory_unmap(AddressSpace *=
as,
> > +                                                             dma_addr_=
t addr) \
> > +     {                                                                =
   \
> > +         uint##_bits##_t val;                                         =
   \
> > +-        dma_memory_read(as, addr, &val, (_bits) / 8);                =
   \
> > ++        dma_memory_read(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSPE=
CIFIED); \
> > +         return _end##_bits##_to_cpu(val);                            =
   \
> > +     }                                                                =
   \
> > +     static inline void st##_sname##_##_end##_dma(AddressSpace *as,   =
   \
> > +@@ -247,20 +251,20 @@ static inline void dma_memory_unmap(AddressSpace=
 *as,
> > +                                                  uint##_bits##_t val)=
   \
> > +     {                                                                =
   \
> > +         val =3D cpu_to_##_end##_bits(val);                           =
     \
> > +-        dma_memory_write(as, addr, &val, (_bits) / 8);               =
   \
> > ++        dma_memory_write(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSP=
ECIFIED); \
> > +     }
> > +
> > + static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
> > + {
> > +     uint8_t val;
> > +
> > +-    dma_memory_read(as, addr, &val, 1);
> > ++    dma_memory_read(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
> > +     return val;
> > + }
> > +
> > + static inline void stb_dma(AddressSpace *as, dma_addr_t addr, uint8_t=
 val)
> > + {
> > +-    dma_memory_write(as, addr, &val, 1);
> > ++    dma_memory_write(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + DEFINE_LDST_DMA(uw, w, 16, le);
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0007_let_dma_memory_map_fu=
nction_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/000=
7_let_dma_memory_map_function_take_MemTxAttrs_argument.patch
> > new file mode 100644
> > index 0000000000..8dd0476953
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0007_let_dma_memory_map_function_=
take_MemTxAttrs_argument.patch
> > @@ -0,0 +1,227 @@
> > +From a1d4b0a3051b3079c8db607f519bc0fcb30e17ec Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Thu, 3 Sep 2020 11:00:47 +0200
> > +Subject: [PATCH] dma: Let dma_memory_map() take MemTxAttrs argument
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Let devices specify transaction attributes when calling
> > +dma_memory_map().
> > +
> > +Patch created mechanically using spatch with this script:
> > +
> > +  @@
> > +  expression E1, E2, E3, E4;
> > +  @@
> > +  - dma_memory_map(E1, E2, E3, E4)
> > +  + dma_memory_map(E1, E2, E3, E4, MEMTXATTRS_UNSPECIFIED)
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
a1d4b0a3051b3079c8db607f519bc0fcb30e17ec&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3Dx1MjDUTG3DXMBmIlBQbTdKEB2OctnPaHhx3tdIvh4SE%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > +Reviewed-by: Li Qiang <liq3ea@gmail.com>
> > +Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> > +Message-Id: <20211223115554.3155328-7-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/display/virtio-gpu.c | 10 ++++++----
> > + hw/hyperv/vmbus.c       |  8 +++++---
> > + hw/ide/ahci.c           |  8 +++++---
> > + hw/usb/libhw.c          |  3 ++-
> > + hw/virtio/virtio.c      |  6 ++++--
> > + include/hw/pci/pci.h    |  3 ++-
> > + include/sysemu/dma.h    |  5 +++--
> > + softmmu/dma-helpers.c   |  3 ++-
> > + 8 files changed, 29 insertions(+), 17 deletions(-)
> > +
> > +diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> > +index d78b970..c6dc818 100644
> > +--- a/hw/display/virtio-gpu.c
> > ++++ b/hw/display/virtio-gpu.c
> > +@@ -814,8 +814,9 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
> > +
> > +         do {
> > +             len =3D l;
> > +-            map =3D dma_memory_map(VIRTIO_DEVICE(g)->dma_as,
> > +-                                 a, &len, DMA_DIRECTION_TO_DEVICE);
> > ++            map =3D dma_memory_map(VIRTIO_DEVICE(g)->dma_as, a, &len,
> > ++                                 DMA_DIRECTION_TO_DEVICE,
> > ++                                 MEMTXATTRS_UNSPECIFIED);
> > +             if (!map) {
> > +                 qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map MMI=
O memory for"
> > +                               " element %d\n", __func__, e);
> > +@@ -1252,8 +1253,9 @@ static int virtio_gpu_load(QEMUFile *f, void *op=
aque, size_t size,
> > +         for (i =3D 0; i < res->iov_cnt; i++) {
> > +             hwaddr len =3D res->iov[i].iov_len;
> > +             res->iov[i].iov_base =3D
> > +-                dma_memory_map(VIRTIO_DEVICE(g)->dma_as,
> > +-                               res->addrs[i], &len, DMA_DIRECTION_TO_=
DEVICE);
> > ++                dma_memory_map(VIRTIO_DEVICE(g)->dma_as, res->addrs[i=
], &len,
> > ++                               DMA_DIRECTION_TO_DEVICE,
> > ++                               MEMTXATTRS_UNSPECIFIED);
> > +
> > +             if (!res->iov[i].iov_base || len !=3D res->iov[i].iov_len=
) {
> > +                 /* Clean up the half-a-mapping we just created... */
> > +diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
> > +index dbce3b3..8aad29f 100644
> > +--- a/hw/hyperv/vmbus.c
> > ++++ b/hw/hyperv/vmbus.c
> > +@@ -373,7 +373,8 @@ static ssize_t gpadl_iter_io(GpadlIter *iter, void=
 *buf, uint32_t len)
> > +
> > +             maddr =3D (iter->gpadl->gfns[idx] << TARGET_PAGE_BITS) | =
off_in_page;
> > +
> > +-            iter->map =3D dma_memory_map(iter->as, maddr, &mlen, iter=
->dir);
> > ++            iter->map =3D dma_memory_map(iter->as, maddr, &mlen, iter=
->dir,
> > ++                                       MEMTXATTRS_UNSPECIFIED);
> > +             if (mlen !=3D pgleft) {
> > +                 dma_memory_unmap(iter->as, iter->map, mlen, iter->dir=
, 0);
> > +                 iter->map =3D NULL;
> > +@@ -490,7 +491,8 @@ int vmbus_map_sgl(VMBusChanReq *req, DMADirection =
dir, struct iovec *iov,
> > +                 goto err;
> > +             }
> > +
> > +-            iov[ret_cnt].iov_base =3D dma_memory_map(sgl->as, a, &l, =
dir);
> > ++            iov[ret_cnt].iov_base =3D dma_memory_map(sgl->as, a, &l, =
dir,
> > ++                                                   MEMTXATTRS_UNSPECI=
FIED);
> > +             if (!l) {
> > +                 ret =3D -EFAULT;
> > +                 goto err;
> > +@@ -566,7 +568,7 @@ static vmbus_ring_buffer *ringbuf_map_hdr(VMBusRin=
gBufCommon *ringbuf)
> > +     dma_addr_t mlen =3D sizeof(*rb);
> > +
> > +     rb =3D dma_memory_map(ringbuf->as, ringbuf->rb_addr, &mlen,
> > +-                        DMA_DIRECTION_FROM_DEVICE);
> > ++                        DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECI=
FIED);
> > +     if (mlen !=3D sizeof(*rb)) {
> > +         dma_memory_unmap(ringbuf->as, rb, mlen,
> > +                          DMA_DIRECTION_FROM_DEVICE, 0);
> > +diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> > +index a94c6e2..8e77ddb 100644
> > +--- a/hw/ide/ahci.c
> > ++++ b/hw/ide/ahci.c
> > +@@ -249,7 +249,8 @@ static void map_page(AddressSpace *as, uint8_t **p=
tr, uint64_t addr,
> > +         dma_memory_unmap(as, *ptr, len, DMA_DIRECTION_FROM_DEVICE, le=
n);
> > +     }
> > +
> > +-    *ptr =3D dma_memory_map(as, addr, &len, DMA_DIRECTION_FROM_DEVICE=
);
> > ++    *ptr =3D dma_memory_map(as, addr, &len, DMA_DIRECTION_FROM_DEVICE=
,
> > ++                          MEMTXATTRS_UNSPECIFIED);
> > +     if (len < wanted && *ptr) {
> > +         dma_memory_unmap(as, *ptr, len, DMA_DIRECTION_FROM_DEVICE, le=
n);
> > +         *ptr =3D NULL;
> > +@@ -939,7 +940,8 @@ static int ahci_populate_sglist(AHCIDevice *ad, QE=
MUSGList *sglist,
> > +
> > +     /* map PRDT */
> > +     if (!(prdt =3D dma_memory_map(ad->hba->as, prdt_addr, &prdt_len,
> > +-                                DMA_DIRECTION_TO_DEVICE))){
> > ++                                DMA_DIRECTION_TO_DEVICE,
> > ++                                MEMTXATTRS_UNSPECIFIED))){
> > +         trace_ahci_populate_sglist_no_map(ad->hba, ad->port_no);
> > +         return -1;
> > +     }
> > +@@ -1301,7 +1303,7 @@ static int handle_cmd(AHCIState *s, int port, ui=
nt8_t slot)
> > +     tbl_addr =3D le64_to_cpu(cmd->tbl_addr);
> > +     cmd_len =3D 0x80;
> > +     cmd_fis =3D dma_memory_map(s->as, tbl_addr, &cmd_len,
> > +-                             DMA_DIRECTION_TO_DEVICE);
> > ++                             DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSP=
ECIFIED);
> > +     if (!cmd_fis) {
> > +         trace_handle_cmd_badfis(s, port);
> > +         return -1;
> > +diff --git a/hw/usb/libhw.c b/hw/usb/libhw.c
> > +index 9c33a16..f350eae 100644
> > +--- a/hw/usb/libhw.c
> > ++++ b/hw/usb/libhw.c
> > +@@ -36,7 +36,8 @@ int usb_packet_map(USBPacket *p, QEMUSGList *sgl)
> > +
> > +         while (len) {
> > +             dma_addr_t xlen =3D len;
> > +-            mem =3D dma_memory_map(sgl->as, base, &xlen, dir);
> > ++            mem =3D dma_memory_map(sgl->as, base, &xlen, dir,
> > ++                                 MEMTXATTRS_UNSPECIFIED);
> > +             if (!mem) {
> > +                 goto err;
> > +             }
> > +diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > +index ea7c079..e11a8a0d 100644
> > +--- a/hw/virtio/virtio.c
> > ++++ b/hw/virtio/virtio.c
> > +@@ -1306,7 +1306,8 @@ static bool virtqueue_map_desc(VirtIODevice *vde=
v, unsigned int *p_num_sg,
> > +         iov[num_sg].iov_base =3D dma_memory_map(vdev->dma_as, pa, &le=
n,
> > +                                               is_write ?
> > +                                               DMA_DIRECTION_FROM_DEVI=
CE :
> > +-                                              DMA_DIRECTION_TO_DEVICE=
);
> > ++                                              DMA_DIRECTION_TO_DEVICE=
,
> > ++                                              MEMTXATTRS_UNSPECIFIED)=
;
> > +         if (!iov[num_sg].iov_base) {
> > +             virtio_error(vdev, "virtio: bogus descriptor or out of re=
sources");
> > +             goto out;
> > +@@ -1355,7 +1356,8 @@ static void virtqueue_map_iovec(VirtIODevice *vd=
ev, struct iovec *sg,
> > +         sg[i].iov_base =3D dma_memory_map(vdev->dma_as,
> > +                                         addr[i], &len, is_write ?
> > +                                         DMA_DIRECTION_FROM_DEVICE :
> > +-                                        DMA_DIRECTION_TO_DEVICE);
> > ++                                        DMA_DIRECTION_TO_DEVICE,
> > ++                                        MEMTXATTRS_UNSPECIFIED);
> > +         if (!sg[i].iov_base) {
> > +             error_report("virtio: error trying to map MMIO memory");
> > +             exit(1);
> > +diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > +index 4383f1c..1acefc2 100644
> > +--- a/include/hw/pci/pci.h
> > ++++ b/include/hw/pci/pci.h
> > +@@ -875,7 +875,8 @@ static inline void *pci_dma_map(PCIDevice *dev, dm=
a_addr_t addr,
> > + {
> > +     void *buf;
> > +
> > +-    buf =3D dma_memory_map(pci_get_address_space(dev), addr, plen, di=
r);
> > ++    buf =3D dma_memory_map(pci_get_address_space(dev), addr, plen, di=
r,
> > ++                         MEMTXATTRS_UNSPECIFIED);
> > +     return buf;
> > + }
> > +
> > +diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> > +index 522682b..97ff6f2 100644
> > +--- a/include/sysemu/dma.h
> > ++++ b/include/sysemu/dma.h
> > +@@ -202,16 +202,17 @@ MemTxResult dma_memory_set(AddressSpace *as, dma=
_addr_t addr,
> > +  * @addr: address within that address space
> > +  * @len: pointer to length of buffer; updated on return
> > +  * @dir: indicates the transfer direction
> > ++ * @attrs: memory attributes
> > +  */
> > + static inline void *dma_memory_map(AddressSpace *as,
> > +                                    dma_addr_t addr, dma_addr_t *len,
> > +-                                   DMADirection dir)
> > ++                                   DMADirection dir, MemTxAttrs attrs=
)
> > + {
> > +     hwaddr xlen =3D *len;
> > +     void *p;
> > +
> > +     p =3D address_space_map(as, addr, &xlen, dir =3D=3D DMA_DIRECTION=
_FROM_DEVICE,
> > +-                          MEMTXATTRS_UNSPECIFIED);
> > ++                          attrs);
> > +     *len =3D xlen;
> > +     return p;
> > + }
> > +diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> > +index 5bf76ff..3c06a2f 100644
> > +--- a/softmmu/dma-helpers.c
> > ++++ b/softmmu/dma-helpers.c
> > +@@ -143,7 +143,8 @@ static void dma_blk_cb(void *opaque, int ret)
> > +     while (dbs->sg_cur_index < dbs->sg->nsg) {
> > +         cur_addr =3D dbs->sg->sg[dbs->sg_cur_index].base + dbs->sg_cu=
r_byte;
> > +         cur_len =3D dbs->sg->sg[dbs->sg_cur_index].len - dbs->sg_cur_=
byte;
> > +-        mem =3D dma_memory_map(dbs->sg->as, cur_addr, &cur_len, dbs->=
dir);
> > ++        mem =3D dma_memory_map(dbs->sg->as, cur_addr, &cur_len, dbs->=
dir,
> > ++                             MEMTXATTRS_UNSPECIFIED);
> > +         /*
> > +          * Make reads deterministic in icount mode. Windows sometimes=
 issues
> > +          * disk read requests with overlapping SGs. It leads
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0008_have_dma_buf_rw_funct=
ion_take_a_void_pointer.patch b/meta/recipes-devtools/qemu/qemu/0008_have_d=
ma_buf_rw_function_take_a_void_pointer.patch
> > new file mode 100644
> > index 0000000000..0876ef184d
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0008_have_dma_buf_rw_function_tak=
e_a_void_pointer.patch
> > @@ -0,0 +1,41 @@
> > +From c0ee1527358474c75067993d1bb233ad3a4ee081 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Thu, 16 Dec 2021 11:24:56 +0100
> > +Subject: [PATCH] dma: Have dma_buf_rw() take a void pointer
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +DMA operations are run on any kind of buffer, not arrays of
> > +uint8_t. Convert dma_buf_rw() to take a void pointer argument
> > +to save us pointless casts to uint8_t *.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
c0ee1527358474c75067993d1bb233ad3a4ee081&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D1klbDF8M8CNLYl%2F2rpAfwHE7yQ6WKs3A5Mbz1RB9ZLc%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-8-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + softmmu/dma-helpers.c | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> > +index 3c06a2f..09e2999 100644
> > +--- a/softmmu/dma-helpers.c
> > ++++ b/softmmu/dma-helpers.c
> > +@@ -294,9 +294,10 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
> > + }
> > +
> > +
> > +-static uint64_t dma_buf_rw(uint8_t *ptr, int32_t len, QEMUSGList *sg,
> > ++static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
> > +                            DMADirection dir)
> > + {
> > ++    uint8_t *ptr =3D buf;
> > +     uint64_t resid;
> > +     int sg_cur_index;
> > +
> > +--
> > +1.8.3.1
> > diff --git a/meta/recipes-devtools/qemu/qemu/0009_have_dma_buf_read_and=
_dma_buf_write_functions_take_a_void.patch b/meta/recipes-devtools/qemu/qem=
u/0009_have_dma_buf_read_and_dma_buf_write_functions_take_a_void.patch
> > new file mode 100644
> > index 0000000000..d65e0b4305
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0009_have_dma_buf_read_and_dma_bu=
f_write_functions_take_a_void.patch
> > @@ -0,0 +1,167 @@
> > +From 5e468a36dcdd8fd5eb04282842b72967a29875e4 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Thu, 16 Dec 2021 11:27:23 +0100
> > +Subject: [PATCH] dma: Have dma_buf_read() / dma_buf_write() take a voi=
d
> > + pointer
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +DMA operations are run on any kind of buffer, not arrays of
> > +uint8_t. Convert dma_buf_read/dma_buf_write functions to take
> > +a void pointer argument and save us pointless casts to uint8_t *.
> > +
> > +Remove this pointless casts in the megasas device model.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
5e468a36dcdd8fd5eb04282842b72967a29875e4&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DN%2FTg3jBXrB2UCy5aaDD9DVc1TX%2Fzz%2FGSQG1dNF2P94g%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-9-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/scsi/megasas.c     | 22 +++++++++++-----------
> > + include/sysemu/dma.h  |  4 ++--
> > + softmmu/dma-helpers.c |  4 ++--
> > + 3 files changed, 15 insertions(+), 15 deletions(-)
> > +
> > +diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> > +index 14ec6d6..2dae33f 100644
> > +--- a/hw/scsi/megasas.c
> > ++++ b/hw/scsi/megasas.c
> > +@@ -848,7 +848,7 @@ static int megasas_ctrl_get_info(MegasasState *s, =
MegasasCmd *cmd)
> > +                                        MFI_INFO_PDMIX_SATA |
> > +                                        MFI_INFO_PDMIX_LD);
> > +
> > +-    cmd->iov_size -=3D dma_buf_read((uint8_t *)&info, dcmd_size, &cmd=
->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -878,7 +878,7 @@ static int megasas_mfc_get_defaults(MegasasState *=
s, MegasasCmd *cmd)
> > +     info.disable_preboot_cli =3D 1;
> > +     info.cluster_disable =3D 1;
> > +
> > +-    cmd->iov_size -=3D dma_buf_read((uint8_t *)&info, dcmd_size, &cmd=
->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -899,7 +899,7 @@ static int megasas_dcmd_get_bios_info(MegasasState=
 *s, MegasasCmd *cmd)
> > +         info.expose_all_drives =3D 1;
> > +     }
> > +
> > +-    cmd->iov_size -=3D dma_buf_read((uint8_t *)&info, dcmd_size, &cmd=
->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -910,7 +910,7 @@ static int megasas_dcmd_get_fw_time(MegasasState *=
s, MegasasCmd *cmd)
> > +
> > +     fw_time =3D cpu_to_le64(megasas_fw_time());
> > +
> > +-    cmd->iov_size -=3D dma_buf_read((uint8_t *)&fw_time, dcmd_size, &=
cmd->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(&fw_time, dcmd_size, &cmd->qsg);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -937,7 +937,7 @@ static int megasas_event_info(MegasasState *s, Meg=
asasCmd *cmd)
> > +     info.shutdown_seq_num =3D cpu_to_le32(s->shutdown_event);
> > +     info.boot_seq_num =3D cpu_to_le32(s->boot_event);
> > +
> > +-    cmd->iov_size -=3D dma_buf_read((uint8_t *)&info, dcmd_size, &cmd=
->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -1006,7 +1006,7 @@ static int megasas_dcmd_pd_get_list(MegasasState=
 *s, MegasasCmd *cmd)
> > +     info.size =3D cpu_to_le32(offset);
> > +     info.count =3D cpu_to_le32(num_pd_disks);
> > +
> > +-    cmd->iov_size -=3D dma_buf_read((uint8_t *)&info, offset, &cmd->q=
sg);
> > ++    cmd->iov_size -=3D dma_buf_read(&info, offset, &cmd->qsg);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -1172,7 +1172,7 @@ static int megasas_dcmd_ld_get_list(MegasasState=
 *s, MegasasCmd *cmd)
> > +     info.ld_count =3D cpu_to_le32(num_ld_disks);
> > +     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_d=
isks);
> > +
> > +-    resid =3D dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
> > ++    resid =3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
> > +     cmd->iov_size =3D dcmd_size - resid;
> > +     return MFI_STAT_OK;
> > + }
> > +@@ -1221,7 +1221,7 @@ static int megasas_dcmd_ld_list_query(MegasasSta=
te *s, MegasasCmd *cmd)
> > +     info.size =3D dcmd_size;
> > +     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_d=
isks);
> > +
> > +-    resid =3D dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
> > ++    resid =3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
> > +     cmd->iov_size =3D dcmd_size - resid;
> > +     return MFI_STAT_OK;
> > + }
> > +@@ -1390,7 +1390,7 @@ static int megasas_dcmd_cfg_read(MegasasState *s=
, MegasasCmd *cmd)
> > +         ld_offset +=3D sizeof(struct mfi_ld_config);
> > +     }
> > +
> > +-    cmd->iov_size -=3D dma_buf_read((uint8_t *)data, info->size, &cmd=
->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(data, info->size, &cmd->qsg);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -1420,7 +1420,7 @@ static int megasas_dcmd_get_properties(MegasasSt=
ate *s, MegasasCmd *cmd)
> > +     info.ecc_bucket_leak_rate =3D cpu_to_le16(1440);
> > +     info.expose_encl_devices =3D 1;
> > +
> > +-    cmd->iov_size -=3D dma_buf_read((uint8_t *)&info, dcmd_size, &cmd=
->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -1465,7 +1465,7 @@ static int megasas_dcmd_set_properties(MegasasSt=
ate *s, MegasasCmd *cmd)
> > +                                             dcmd_size);
> > +         return MFI_STAT_INVALID_PARAMETER;
> > +     }
> > +-    dma_buf_write((uint8_t *)&info, dcmd_size, &cmd->qsg);
> > ++    dma_buf_write(&info, dcmd_size, &cmd->qsg);
> > +     trace_megasas_dcmd_unsupported(cmd->index, cmd->iov_size);
> > +     return MFI_STAT_OK;
> > + }
> > +diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> > +index 97ff6f2..0d5b836 100644
> > +--- a/include/sysemu/dma.h
> > ++++ b/include/sysemu/dma.h
> > +@@ -302,8 +302,8 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
> > + BlockAIOCB *dma_blk_write(BlockBackend *blk,
> > +                           QEMUSGList *sg, uint64_t offset, uint32_t a=
lign,
> > +                           BlockCompletionFunc *cb, void *opaque);
> > +-uint64_t dma_buf_read(uint8_t *ptr, int32_t len, QEMUSGList *sg);
> > +-uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg);
> > ++uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg);
> > ++uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg);
> > +
> > + void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
> > +                     QEMUSGList *sg, enum BlockAcctType type);
> > +diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> > +index 09e2999..7f37548 100644
> > +--- a/softmmu/dma-helpers.c
> > ++++ b/softmmu/dma-helpers.c
> > +@@ -317,12 +317,12 @@ static uint64_t dma_buf_rw(void *buf, int32_t le=
n, QEMUSGList *sg,
> > +     return resid;
> > + }
> > +
> > +-uint64_t dma_buf_read(uint8_t *ptr, int32_t len, QEMUSGList *sg)
> > ++uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
> > + {
> > +     return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE);
> > + }
> > +
> > +-uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg)
> > ++uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
> > + {
> > +     return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE);
> > + }
> > +--
> > +1.8.3.1
> > diff --git a/meta/recipes-devtools/qemu/qemu/0010_let_pci_dma_rw_functi=
on_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0010_le=
t_pci_dma_rw_function_take_MemTxAttrs_argument.patch
> > new file mode 100644
> > index 0000000000..8207058aca
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0010_let_pci_dma_rw_function_take=
_MemTxAttrs_argument.patch
> > @@ -0,0 +1,91 @@
> > +From e2d784b67dc724a9b0854b49255ba0ee8ca46543 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Wed, 15 Dec 2021 22:18:19 +0100
> > +Subject: [PATCH] pci: Let pci_dma_rw() take MemTxAttrs argument
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Let devices specify transaction attributes when calling pci_dma_rw().
> > +
> > +Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
e2d784b67dc724a9b0854b49255ba0ee8ca46543&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DlArGd43%2BsG2Lj1yaguW5uphpuqHsVUz7Ut1QR5IXIuk%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-10-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/audio/intel-hda.c |  3 ++-
> > + hw/scsi/esp-pci.c    |  2 +-
> > + include/hw/pci/pci.h | 10 ++++++----
> > + 3 files changed, 9 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
> > +index 8ce9df6..fb3d34a 100644
> > +--- a/hw/audio/intel-hda.c
> > ++++ b/hw/audio/intel-hda.c
> > +@@ -427,7 +427,8 @@ static bool intel_hda_xfer(HDACodecDevice *dev, ui=
nt32_t stnr, bool output,
> > +         dprint(d, 3, "dma: entry %d, pos %d/%d, copy %d\n",
> > +                st->be, st->bp, st->bpl[st->be].len, copy);
> > +
> > +-        pci_dma_rw(&d->pci, st->bpl[st->be].addr + st->bp, buf, copy,=
 !output);
> > ++        pci_dma_rw(&d->pci, st->bpl[st->be].addr + st->bp, buf, copy,=
 !output,
> > ++                   MEMTXATTRS_UNSPECIFIED);
> > +         st->lpib +=3D copy;
> > +         st->bp +=3D copy;
> > +         buf +=3D copy;
> > +diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
> > +index dac054a..1792f84 100644
> > +--- a/hw/scsi/esp-pci.c
> > ++++ b/hw/scsi/esp-pci.c
> > +@@ -280,7 +280,7 @@ static void esp_pci_dma_memory_rw(PCIESPState *pci=
, uint8_t *buf, int len,
> > +         len =3D pci->dma_regs[DMA_WBC];
> > +     }
> > +
> > +-    pci_dma_rw(PCI_DEVICE(pci), addr, buf, len, dir);
> > ++    pci_dma_rw(PCI_DEVICE(pci), addr, buf, len, dir, MEMTXATTRS_UNSPE=
CIFIED);
> > +
> > +     /* update status registers */
> > +     pci->dma_regs[DMA_WBC] -=3D len;
> > +diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > +index 1acefc2..a751ab5 100644
> > +--- a/include/hw/pci/pci.h
> > ++++ b/include/hw/pci/pci.h
> > +@@ -806,10 +806,10 @@ static inline AddressSpace *pci_get_address_spac=
e(PCIDevice *dev)
> > +  */
> > + static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
> > +                                      void *buf, dma_addr_t len,
> > +-                                     DMADirection dir)
> > ++                                     DMADirection dir, MemTxAttrs att=
rs)
> > + {
> > +     return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> > +-                         dir, MEMTXATTRS_UNSPECIFIED);
> > ++                         dir, attrs);
> > + }
> > +
> > + /**
> > +@@ -827,7 +827,8 @@ static inline MemTxResult pci_dma_rw(PCIDevice *de=
v, dma_addr_t addr,
> > + static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t add=
r,
> > +                                        void *buf, dma_addr_t len)
> > + {
> > +-    return pci_dma_rw(dev, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
> > ++    return pci_dma_rw(dev, addr, buf, len,
> > ++                      DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED=
);
> > + }
> > +
> > + /**
> > +@@ -845,7 +846,8 @@ static inline MemTxResult pci_dma_read(PCIDevice *=
dev, dma_addr_t addr,
> > + static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t ad=
dr,
> > +                                         const void *buf, dma_addr_t l=
en)
> > + {
> > +-    return pci_dma_rw(dev, addr, (void *) buf, len, DMA_DIRECTION_FRO=
M_DEVICE);
> > ++    return pci_dma_rw(dev, addr, (void *) buf, len,
> > ++                      DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFI=
ED);
> > + }
> > +
> > + #define PCI_DMA_DEFINE_LDST(_l, _s, _bits)                           =
   \
> > +--
> > +1.8.3.1
> > diff --git a/meta/recipes-devtools/qemu/qemu/0011_let_dma_buf_rw_functi=
on_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0011_le=
t_dma_buf_rw_function_take_MemTxAttrs_argument.patch
> > new file mode 100644
> > index 0000000000..4f7276ef8b
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0011_let_dma_buf_rw_function_take=
_MemTxAttrs_argument.patch
> > @@ -0,0 +1,65 @@
> > +From 959384e74e1b508acc3af6e806b3d7b87335fc2a Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Wed, 15 Dec 2021 22:59:46 +0100
> > +Subject: [PATCH] dma: Let dma_buf_rw() take MemTxAttrs argument
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Let devices specify transaction attributes when calling dma_buf_rw().
> > +
> > +Keep the default MEMTXATTRS_UNSPECIFIED in the 2 callers.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
959384e74e1b508acc3af6e806b3d7b87335fc2a&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D%2BPsMMbwy3Y4yNUy0YhXYHme8kZz9Xfu7xc6Evgne25A%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-11-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + softmmu/dma-helpers.c | 11 ++++++-----
> > + 1 file changed, 6 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> > +index 7f37548..fa81d2b 100644
> > +--- a/softmmu/dma-helpers.c
> > ++++ b/softmmu/dma-helpers.c
> > +@@ -295,7 +295,7 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
> > +
> > +
> > + static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
> > +-                           DMADirection dir)
> > ++                           DMADirection dir, MemTxAttrs attrs)
> > + {
> > +     uint8_t *ptr =3D buf;
> > +     uint64_t resid;
> > +@@ -307,8 +307,7 @@ static uint64_t dma_buf_rw(void *buf, int32_t len,=
 QEMUSGList *sg,
> > +     while (len > 0) {
> > +         ScatterGatherEntry entry =3D sg->sg[sg_cur_index++];
> > +         int32_t xfer =3D MIN(len, entry.len);
> > +-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir,
> > +-                      MEMTXATTRS_UNSPECIFIED);
> > ++        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
> > +         ptr +=3D xfer;
> > +         len -=3D xfer;
> > +         resid -=3D xfer;
> > +@@ -319,12 +318,14 @@ static uint64_t dma_buf_rw(void *buf, int32_t le=
n, QEMUSGList *sg,
> > +
> > + uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
> > + {
> > +-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE);
> > ++    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE,
> > ++                      MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
> > + {
> > +-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE);
> > ++    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE,
> > ++                      MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
> > +--
> > +1.8.3.1
> > diff --git a/meta/recipes-devtools/qemu/qemu/0012_let_dma_buf_write_fun=
ction_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0012=
_let_dma_buf_write_function_take_MemTxAttrs_argument.patch
> > new file mode 100644
> > index 0000000000..9837516422
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0012_let_dma_buf_write_function_t=
ake_MemTxAttrs_argument.patch
> > @@ -0,0 +1,129 @@
> > +From 392e48af3468d7f8e49db33fdc9e28b5f99276ce Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Wed, 15 Dec 2021 23:02:21 +0100
> > +Subject: [PATCH] dma: Let dma_buf_write() take MemTxAttrs argument
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Let devices specify transaction attributes when calling
> > +dma_buf_write().
> > +
> > +Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
392e48af3468d7f8e49db33fdc9e28b5f99276ce&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DGISFE35HPxKTLQpprl537AcSSq8L261aJNNFWWwouSo%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-12-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/ide/ahci.c         | 6 ++++--
> > + hw/nvme/ctrl.c        | 3 ++-
> > + hw/scsi/megasas.c     | 2 +-
> > + hw/scsi/scsi-bus.c    | 2 +-
> > + include/sysemu/dma.h  | 2 +-
> > + softmmu/dma-helpers.c | 5 ++---
> > + 6 files changed, 11 insertions(+), 9 deletions(-)
> > +
> > +diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> > +index 8e77ddb..079d297 100644
> > +--- a/hw/ide/ahci.c
> > ++++ b/hw/ide/ahci.c
> > +@@ -1381,8 +1381,10 @@ static void ahci_pio_transfer(const IDEDMA *dma=
)
> > +                             has_sglist ? "" : "o");
> > +
> > +     if (has_sglist && size) {
> > ++        const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > ++
> > +         if (is_write) {
> > +-            dma_buf_write(s->data_ptr, size, &s->sg);
> > ++            dma_buf_write(s->data_ptr, size, &s->sg, attrs);
> > +         } else {
> > +             dma_buf_read(s->data_ptr, size, &s->sg);
> > +         }
> > +@@ -1479,7 +1481,7 @@ static int ahci_dma_rw_buf(const IDEDMA *dma, bo=
ol is_write)
> > +     if (is_write) {
> > +         dma_buf_read(p, l, &s->sg);
> > +     } else {
> > +-        dma_buf_write(p, l, &s->sg);
> > ++        dma_buf_write(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
> > +     }
> > +
> > +     /* free sglist, update byte count */
> > +diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > +index 5f573c4..e1a531d 100644
> > +--- a/hw/nvme/ctrl.c
> > ++++ b/hw/nvme/ctrl.c
> > +@@ -1146,10 +1146,11 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *s=
g, uint8_t *ptr, uint32_t len,
> > +     assert(sg->flags & NVME_SG_ALLOC);
> > +
> > +     if (sg->flags & NVME_SG_DMA) {
> > ++        const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > +         uint64_t residual;
> > +
> > +         if (dir =3D=3D NVME_TX_DIRECTION_TO_DEVICE) {
> > +-            residual =3D dma_buf_write(ptr, len, &sg->qsg);
> > ++            residual =3D dma_buf_write(ptr, len, &sg->qsg, attrs);
> > +         } else {
> > +             residual =3D dma_buf_read(ptr, len, &sg->qsg);
> > +         }
> > +diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> > +index 2dae33f..79fd14c 100644
> > +--- a/hw/scsi/megasas.c
> > ++++ b/hw/scsi/megasas.c
> > +@@ -1465,7 +1465,7 @@ static int megasas_dcmd_set_properties(MegasasSt=
ate *s, MegasasCmd *cmd)
> > +                                             dcmd_size);
> > +         return MFI_STAT_INVALID_PARAMETER;
> > +     }
> > +-    dma_buf_write(&info, dcmd_size, &cmd->qsg);
> > ++    dma_buf_write(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED=
);
> > +     trace_megasas_dcmd_unsupported(cmd->index, cmd->iov_size);
> > +     return MFI_STAT_OK;
> > + }
> > +diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> > +index 77325d8..64a506a 100644
> > +--- a/hw/scsi/scsi-bus.c
> > ++++ b/hw/scsi/scsi-bus.c
> > +@@ -1423,7 +1423,7 @@ void scsi_req_data(SCSIRequest *req, int len)
> > +     if (req->cmd.mode =3D=3D SCSI_XFER_FROM_DEV) {
> > +         req->resid =3D dma_buf_read(buf, len, req->sg);
> > +     } else {
> > +-        req->resid =3D dma_buf_write(buf, len, req->sg);
> > ++        req->resid =3D dma_buf_write(buf, len, req->sg, MEMTXATTRS_UN=
SPECIFIED);
> > +     }
> > +     scsi_req_continue(req);
> > + }
> > +diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> > +index 0d5b836..e3dd74a 100644
> > +--- a/include/sysemu/dma.h
> > ++++ b/include/sysemu/dma.h
> > +@@ -303,7 +303,7 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
> > +                           QEMUSGList *sg, uint64_t offset, uint32_t a=
lign,
> > +                           BlockCompletionFunc *cb, void *opaque);
> > + uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg);
> > +-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg);
> > ++uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxA=
ttrs attrs);
> > +
> > + void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
> > +                     QEMUSGList *sg, enum BlockAcctType type);
> > +diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> > +index fa81d2b..2f1a241 100644
> > +--- a/softmmu/dma-helpers.c
> > ++++ b/softmmu/dma-helpers.c
> > +@@ -322,10 +322,9 @@ uint64_t dma_buf_read(void *ptr, int32_t len, QEM=
USGList *sg)
> > +                       MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > +-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
> > ++uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxA=
ttrs attrs)
> > + {
> > +-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE,
> > +-                      MEMTXATTRS_UNSPECIFIED);
> > ++    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE, attrs);
> > + }
> > +
> > + void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
> > +--
> > +1.8.3.1
> > diff --git a/meta/recipes-devtools/qemu/qemu/0013_let_dma_buf_read_func=
tion_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0013_=
let_dma_buf_read_function_take_MemTxAttrs_argument.patch
> > new file mode 100644
> > index 0000000000..4057caa8b0
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0013_let_dma_buf_read_function_ta=
ke_MemTxAttrs_argument.patch
> > @@ -0,0 +1,222 @@
> > +From 1e5a3f8b2a976054da96cbbb9de6cbac7c2efb79 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Wed, 15 Dec 2021 23:29:52 +0100
> > +Subject: [PATCH] dma: Let dma_buf_read() take MemTxAttrs argument
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Let devices specify transaction attributes when calling
> > +dma_buf_read().
> > +
> > +Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
1e5a3f8b2a976054da96cbbb9de6cbac7c2efb79&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DkDFaNdPiiJlGJCJPDKKLDhN%2FnjFF7K6fisjIJtXofoc%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-13-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/ide/ahci.c         |  4 ++--
> > + hw/nvme/ctrl.c        |  2 +-
> > + hw/scsi/megasas.c     | 24 ++++++++++++------------
> > + hw/scsi/scsi-bus.c    |  2 +-
> > + include/sysemu/dma.h  |  2 +-
> > + softmmu/dma-helpers.c |  5 ++---
> > + 6 files changed, 19 insertions(+), 20 deletions(-)
> > +
> > +diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> > +index 079d297..205dfdc 100644
> > +--- a/hw/ide/ahci.c
> > ++++ b/hw/ide/ahci.c
> > +@@ -1386,7 +1386,7 @@ static void ahci_pio_transfer(const IDEDMA *dma)
> > +         if (is_write) {
> > +             dma_buf_write(s->data_ptr, size, &s->sg, attrs);
> > +         } else {
> > +-            dma_buf_read(s->data_ptr, size, &s->sg);
> > ++            dma_buf_read(s->data_ptr, size, &s->sg, attrs);
> > +         }
> > +     }
> > +
> > +@@ -1479,7 +1479,7 @@ static int ahci_dma_rw_buf(const IDEDMA *dma, bo=
ol is_write)
> > +     }
> > +
> > +     if (is_write) {
> > +-        dma_buf_read(p, l, &s->sg);
> > ++        dma_buf_read(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
> > +     } else {
> > +         dma_buf_write(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
> > +     }
> > +diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > +index e1a531d..462f79a 100644
> > +--- a/hw/nvme/ctrl.c
> > ++++ b/hw/nvme/ctrl.c
> > +@@ -1152,7 +1152,7 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg,=
 uint8_t *ptr, uint32_t len,
> > +         if (dir =3D=3D NVME_TX_DIRECTION_TO_DEVICE) {
> > +             residual =3D dma_buf_write(ptr, len, &sg->qsg, attrs);
> > +         } else {
> > +-            residual =3D dma_buf_read(ptr, len, &sg->qsg);
> > ++            residual =3D dma_buf_read(ptr, len, &sg->qsg, attrs);
> > +         }
> > +
> > +         if (unlikely(residual)) {
> > +diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> > +index 79fd14c..091a350 100644
> > +--- a/hw/scsi/megasas.c
> > ++++ b/hw/scsi/megasas.c
> > +@@ -848,7 +848,7 @@ static int megasas_ctrl_get_info(MegasasState *s, =
MegasasCmd *cmd)
> > +                                        MFI_INFO_PDMIX_SATA |
> > +                                        MFI_INFO_PDMIX_LD);
> > +
> > +-    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMT=
XATTRS_UNSPECIFIED);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -878,7 +878,7 @@ static int megasas_mfc_get_defaults(MegasasState *=
s, MegasasCmd *cmd)
> > +     info.disable_preboot_cli =3D 1;
> > +     info.cluster_disable =3D 1;
> > +
> > +-    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMT=
XATTRS_UNSPECIFIED);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -899,7 +899,7 @@ static int megasas_dcmd_get_bios_info(MegasasState=
 *s, MegasasCmd *cmd)
> > +         info.expose_all_drives =3D 1;
> > +     }
> > +
> > +-    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMT=
XATTRS_UNSPECIFIED);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -910,7 +910,7 @@ static int megasas_dcmd_get_fw_time(MegasasState *=
s, MegasasCmd *cmd)
> > +
> > +     fw_time =3D cpu_to_le64(megasas_fw_time());
> > +
> > +-    cmd->iov_size -=3D dma_buf_read(&fw_time, dcmd_size, &cmd->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(&fw_time, dcmd_size, &cmd->qsg, M=
EMTXATTRS_UNSPECIFIED);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -937,7 +937,7 @@ static int megasas_event_info(MegasasState *s, Meg=
asasCmd *cmd)
> > +     info.shutdown_seq_num =3D cpu_to_le32(s->shutdown_event);
> > +     info.boot_seq_num =3D cpu_to_le32(s->boot_event);
> > +
> > +-    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMT=
XATTRS_UNSPECIFIED);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -1006,7 +1006,7 @@ static int megasas_dcmd_pd_get_list(MegasasState=
 *s, MegasasCmd *cmd)
> > +     info.size =3D cpu_to_le32(offset);
> > +     info.count =3D cpu_to_le32(num_pd_disks);
> > +
> > +-    cmd->iov_size -=3D dma_buf_read(&info, offset, &cmd->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(&info, offset, &cmd->qsg, MEMTXAT=
TRS_UNSPECIFIED);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -1100,7 +1100,7 @@ static int megasas_pd_get_info_submit(SCSIDevice=
 *sdev, int lun,
> > +     info->connected_port_bitmap =3D 0x1;
> > +     info->device_speed =3D 1;
> > +     info->link_speed =3D 1;
> > +-    resid =3D dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg);
> > ++    resid =3D dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg, MEMTXA=
TTRS_UNSPECIFIED);
> > +     g_free(cmd->iov_buf);
> > +     cmd->iov_size =3D dcmd_size - resid;
> > +     cmd->iov_buf =3D NULL;
> > +@@ -1172,7 +1172,7 @@ static int megasas_dcmd_ld_get_list(MegasasState=
 *s, MegasasCmd *cmd)
> > +     info.ld_count =3D cpu_to_le32(num_ld_disks);
> > +     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_d=
isks);
> > +
> > +-    resid =3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
> > ++    resid =3D dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UN=
SPECIFIED);
> > +     cmd->iov_size =3D dcmd_size - resid;
> > +     return MFI_STAT_OK;
> > + }
> > +@@ -1221,7 +1221,7 @@ static int megasas_dcmd_ld_list_query(MegasasSta=
te *s, MegasasCmd *cmd)
> > +     info.size =3D dcmd_size;
> > +     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_d=
isks);
> > +
> > +-    resid =3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
> > ++    resid =3D dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UN=
SPECIFIED);
> > +     cmd->iov_size =3D dcmd_size - resid;
> > +     return MFI_STAT_OK;
> > + }
> > +@@ -1271,7 +1271,7 @@ static int megasas_ld_get_info_submit(SCSIDevice=
 *sdev, int lun,
> > +     info->ld_config.span[0].num_blocks =3D info->size;
> > +     info->ld_config.span[0].array_ref =3D cpu_to_le16(sdev_id);
> > +
> > +-    resid =3D dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg);
> > ++    resid =3D dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg, MEMTXA=
TTRS_UNSPECIFIED);
> > +     g_free(cmd->iov_buf);
> > +     cmd->iov_size =3D dcmd_size - resid;
> > +     cmd->iov_buf =3D NULL;
> > +@@ -1390,7 +1390,7 @@ static int megasas_dcmd_cfg_read(MegasasState *s=
, MegasasCmd *cmd)
> > +         ld_offset +=3D sizeof(struct mfi_ld_config);
> > +     }
> > +
> > +-    cmd->iov_size -=3D dma_buf_read(data, info->size, &cmd->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(data, info->size, &cmd->qsg, MEMT=
XATTRS_UNSPECIFIED);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +@@ -1420,7 +1420,7 @@ static int megasas_dcmd_get_properties(MegasasSt=
ate *s, MegasasCmd *cmd)
> > +     info.ecc_bucket_leak_rate =3D cpu_to_le16(1440);
> > +     info.expose_encl_devices =3D 1;
> > +
> > +-    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
> > ++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMT=
XATTRS_UNSPECIFIED);
> > +     return MFI_STAT_OK;
> > + }
> > +
> > +diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> > +index 64a506a..2b5e9dc 100644
> > +--- a/hw/scsi/scsi-bus.c
> > ++++ b/hw/scsi/scsi-bus.c
> > +@@ -1421,7 +1421,7 @@ void scsi_req_data(SCSIRequest *req, int len)
> > +
> > +     buf =3D scsi_req_get_buf(req);
> > +     if (req->cmd.mode =3D=3D SCSI_XFER_FROM_DEV) {
> > +-        req->resid =3D dma_buf_read(buf, len, req->sg);
> > ++        req->resid =3D dma_buf_read(buf, len, req->sg, MEMTXATTRS_UNS=
PECIFIED);
> > +     } else {
> > +         req->resid =3D dma_buf_write(buf, len, req->sg, MEMTXATTRS_UN=
SPECIFIED);
> > +     }
> > +diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> > +index e3dd74a..fd8f160 100644
> > +--- a/include/sysemu/dma.h
> > ++++ b/include/sysemu/dma.h
> > +@@ -302,7 +302,7 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
> > + BlockAIOCB *dma_blk_write(BlockBackend *blk,
> > +                           QEMUSGList *sg, uint64_t offset, uint32_t a=
lign,
> > +                           BlockCompletionFunc *cb, void *opaque);
> > +-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg);
> > ++uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAt=
trs attrs);
> > + uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxA=
ttrs attrs);
> > +
> > + void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
> > +diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> > +index 2f1a241..a391773 100644
> > +--- a/softmmu/dma-helpers.c
> > ++++ b/softmmu/dma-helpers.c
> > +@@ -316,10 +316,9 @@ static uint64_t dma_buf_rw(void *buf, int32_t len=
, QEMUSGList *sg,
> > +     return resid;
> > + }
> > +
> > +-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
> > ++uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAt=
trs attrs)
> > + {
> > +-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE,
> > +-                      MEMTXATTRS_UNSPECIFIED);
> > ++    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE, attrs)=
;
> > + }
> > +
> > + uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxA=
ttrs attrs)
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0014_let_dma_buf_rw_functi=
on_propagate_MemTxResult.patch b/meta/recipes-devtools/qemu/qemu/0014_let_d=
ma_buf_rw_function_propagate_MemTxResult.patch
> > new file mode 100644
> > index 0000000000..571ce9cc9b
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0014_let_dma_buf_rw_function_prop=
agate_MemTxResult.patch
> > @@ -0,0 +1,91 @@
> > +From 292e13142d277c15bdd68331abc607e46628b7e1 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Wed, 15 Dec 2021 23:38:52 +0100
> > +Subject: [PATCH] dma: Let dma_buf_rw() propagate MemTxResult
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +dma_memory_rw() returns a MemTxResult type. Do not discard
> > +it, return it to the caller.
> > +
> > +Since dma_buf_rw() was previously returning the QEMUSGList
> > +size not consumed, add an extra argument where this size
> > +can be stored.
> > +
> > +Update the 2 callers.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
292e13142d277c15bdd68331abc607e46628b7e1&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DaTwd%2BDBGc0FAsJI27azYqntHnjr9hRpUhp8aOPZlnLg%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-14-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + softmmu/dma-helpers.c | 25 +++++++++++++++++++------
> > + 1 file changed, 19 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> > +index a391773..b0be156 100644
> > +--- a/softmmu/dma-helpers.c
> > ++++ b/softmmu/dma-helpers.c
> > +@@ -294,12 +294,14 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
> > + }
> > +
> > +
> > +-static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
> > +-                           DMADirection dir, MemTxAttrs attrs)
> > ++static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *resid=
p,
> > ++                              QEMUSGList *sg, DMADirection dir,
> > ++                              MemTxAttrs attrs)
> > + {
> > +     uint8_t *ptr =3D buf;
> > +     uint64_t resid;
> > +     int sg_cur_index;
> > ++    MemTxResult res =3D MEMTX_OK;
> > +
> > +     resid =3D sg->size;
> > +     sg_cur_index =3D 0;
> > +@@ -307,23 +309,34 @@ static uint64_t dma_buf_rw(void *buf, int32_t le=
n, QEMUSGList *sg,
> > +     while (len > 0) {
> > +         ScatterGatherEntry entry =3D sg->sg[sg_cur_index++];
> > +         int32_t xfer =3D MIN(len, entry.len);
> > +-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
> > ++        res |=3D dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, at=
trs);
> > +         ptr +=3D xfer;
> > +         len -=3D xfer;
> > +         resid -=3D xfer;
> > +     }
> > +
> > +-    return resid;
> > ++    if (residp) {
> > ++        *residp =3D resid;
> > ++    }
> > ++    return res;
> > + }
> > +
> > + uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAt=
trs attrs)
> > + {
> > +-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE, attrs)=
;
> > ++    uint64_t resid;
> > ++
> > ++    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_FROM_DEVICE, attrs=
);
> > ++
> > ++    return resid;
> > + }
> > +
> > + uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxA=
ttrs attrs)
> > + {
> > +-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE, attrs);
> > ++    uint64_t resid;
> > ++
> > ++    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_TO_DEVICE, attrs);
> > ++
> > ++    return resid;
> > + }
> > +
> > + void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0015_let_st_pointer_dma_fu=
nction_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/001=
5_let_st_pointer_dma_function_take_MemTxAttrs_argument.patch
> > new file mode 100644
> > index 0000000000..7f56dcb6eb
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0015_let_st_pointer_dma_function_=
take_MemTxAttrs_argument.patch
> > @@ -0,0 +1,120 @@
> > +From 2280c27afc65bb2af95dd44a88e3b7117bfe240a Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Fri, 17 Dec 2021 23:53:34 +0100
> > +Subject: [PATCH] dma: Let st*_dma() take MemTxAttrs argument
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Let devices specify transaction attributes when calling st*_dma().
> > +
> > +Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
2280c27afc65bb2af95dd44a88e3b7117bfe240a&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DYv2M3yC6CNOb%2FVxPd1OrE3Ac4klJwZnL%2FNnVqSYiCqo%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > +Reviewed-by: C=E8=83=92=E6=BC=8Fdric Le Goater <clg@kaod.org>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-16-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/nvram/fw_cfg.c          |  4 ++--
> > + include/hw/pci/pci.h       |  3 ++-
> > + include/hw/ppc/spapr_vio.h | 12 ++++++++----
> > + include/sysemu/dma.h       | 10 ++++++----
> > + 4 files changed, 18 insertions(+), 11 deletions(-)
> > +
> > +diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> > +index 9b91b15..e5f3c981 100644
> > +--- a/hw/nvram/fw_cfg.c
> > ++++ b/hw/nvram/fw_cfg.c
> > +@@ -360,7 +360,7 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
> > +     if (dma_memory_read(s->dma_as, dma_addr,
> > +                         &dma, sizeof(dma), MEMTXATTRS_UNSPECIFIED)) {
> > +         stl_be_dma(s->dma_as, dma_addr + offsetof(FWCfgDmaAccess, con=
trol),
> > +-                   FW_CFG_DMA_CTL_ERROR);
> > ++                   FW_CFG_DMA_CTL_ERROR, MEMTXATTRS_UNSPECIFIED);
> > +         return;
> > +     }
> > +
> > +@@ -446,7 +446,7 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
> > +     }
> > +
> > +     stl_be_dma(s->dma_as, dma_addr + offsetof(FWCfgDmaAccess, control=
),
> > +-                dma.control);
> > ++                dma.control, MEMTXATTRS_UNSPECIFIED);
> > +
> > +     trace_fw_cfg_read(s, 0);
> > + }
> > +diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > +index a751ab5..d07e970 100644
> > +--- a/include/hw/pci/pci.h
> > ++++ b/include/hw/pci/pci.h
> > +@@ -859,7 +859,8 @@ static inline MemTxResult pci_dma_write(PCIDevice =
*dev, dma_addr_t addr,
> > +     static inline void st##_s##_pci_dma(PCIDevice *dev,              =
   \
> > +                                         dma_addr_t addr, uint##_bits#=
#_t val) \
> > +     {                                                                =
   \
> > +-        st##_s##_dma(pci_get_address_space(dev), addr, val);         =
   \
> > ++        st##_s##_dma(pci_get_address_space(dev), addr, val, \
> > ++                     MEMTXATTRS_UNSPECIFIED); \
> > +     }
> > +
> > + PCI_DMA_DEFINE_LDST(ub, b, 8);
> > +diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
> > +index 5d2ea8e..e87f8e6 100644
> > +--- a/include/hw/ppc/spapr_vio.h
> > ++++ b/include/hw/ppc/spapr_vio.h
> > +@@ -118,10 +118,14 @@ static inline int spapr_vio_dma_set(SpaprVioDevi=
ce *dev, uint64_t taddr,
> > +         H_DEST_PARM : H_SUCCESS;
> > + }
> > +
> > +-#define vio_stb(_dev, _addr, _val) (stb_dma(&(_dev)->as, (_addr), (_v=
al)))
> > +-#define vio_sth(_dev, _addr, _val) (stw_be_dma(&(_dev)->as, (_addr), =
(_val)))
> > +-#define vio_stl(_dev, _addr, _val) (stl_be_dma(&(_dev)->as, (_addr), =
(_val)))
> > +-#define vio_stq(_dev, _addr, _val) (stq_be_dma(&(_dev)->as, (_addr), =
(_val)))
> > ++#define vio_stb(_dev, _addr, _val) \
> > ++        (stb_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED=
))
> > ++#define vio_sth(_dev, _addr, _val) \
> > ++        (stw_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIF=
IED))
> > ++#define vio_stl(_dev, _addr, _val) \
> > ++        (stl_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIF=
IED))
> > ++#define vio_stq(_dev, _addr, _val) \
> > ++        (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIF=
IED))
> > + #define vio_ldq(_dev, _addr) (ldq_be_dma(&(_dev)->as, (_addr)))
> > +
> > + int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
> > +diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> > +index fd8f160..009dd3c 100644
> > +--- a/include/sysemu/dma.h
> > ++++ b/include/sysemu/dma.h
> > +@@ -249,10 +249,11 @@ static inline void dma_memory_unmap(AddressSpace=
 *as,
> > +     }                                                                =
   \
> > +     static inline void st##_sname##_##_end##_dma(AddressSpace *as,   =
   \
> > +                                                  dma_addr_t addr,    =
   \
> > +-                                                 uint##_bits##_t val)=
   \
> > ++                                                 uint##_bits##_t val,=
   \
> > ++                                                 MemTxAttrs attrs)   =
   \
> > +     {                                                                =
   \
> > +         val =3D cpu_to_##_end##_bits(val);                           =
     \
> > +-        dma_memory_write(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSP=
ECIFIED); \
> > ++        dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
> > +     }
> > +
> > + static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
> > +@@ -263,9 +264,10 @@ static inline uint8_t ldub_dma(AddressSpace *as, =
dma_addr_t addr)
> > +     return val;
> > + }
> > +
> > +-static inline void stb_dma(AddressSpace *as, dma_addr_t addr, uint8_t=
 val)
> > ++static inline void stb_dma(AddressSpace *as, dma_addr_t addr,
> > ++                           uint8_t val, MemTxAttrs attrs)
> > + {
> > +-    dma_memory_write(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
> > ++    dma_memory_write(as, addr, &val, 1, attrs);
> > + }
> > +
> > + DEFINE_LDST_DMA(uw, w, 16, le);
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0016_let_ld_pointer_dma_fu=
nction_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/001=
6_let_ld_pointer_dma_function_take_MemTxAttrs_argument.patch
> > new file mode 100644
> > index 0000000000..a51451d343
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0016_let_ld_pointer_dma_function_=
take_MemTxAttrs_argument.patch
> > @@ -0,0 +1,151 @@
> > +From 34cdea1db600540a5261dc474e986f28b637c8e6 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Fri, 17 Dec 2021 22:18:07 +0100
> > +Subject: [PATCH] dma: Let ld*_dma() take MemTxAttrs argument
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Let devices specify transaction attributes when calling ld*_dma().
> > +
> > +Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
34cdea1db600540a5261dc474e986f28b637c8e6&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3Du3Gu27Zc1uJWliJ5GenRbAAzJpPgezdEIb1gkGiYZos%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > +Reviewed-by: C=E8=83=92=E6=BC=8Fdric Le Goater <clg@kaod.org>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-17-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/intc/pnv_xive.c         |  7 ++++---
> > + hw/usb/hcd-xhci.c          |  6 +++---
> > + include/hw/pci/pci.h       |  3 ++-
> > + include/hw/ppc/spapr_vio.h |  3 ++-
> > + include/sysemu/dma.h       | 11 ++++++-----
> > + 5 files changed, 17 insertions(+), 13 deletions(-)
> > +
> > +diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
> > +index ad43483..d9249bb 100644
> > +--- a/hw/intc/pnv_xive.c
> > ++++ b/hw/intc/pnv_xive.c
> > +@@ -172,7 +172,7 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive=
 *xive, uint32_t type,
> > +
> > +     /* Get the page size of the indirect table. */
> > +     vsd_addr =3D vsd & VSD_ADDRESS_MASK;
> > +-    vsd =3D ldq_be_dma(&address_space_memory, vsd_addr);
> > ++    vsd =3D ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UN=
SPECIFIED);
> > +
> > +     if (!(vsd & VSD_ADDRESS_MASK)) {
> > + #ifdef XIVE_DEBUG
> > +@@ -195,7 +195,8 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive=
 *xive, uint32_t type,
> > +     /* Load the VSD we are looking for, if not already done */
> > +     if (vsd_idx) {
> > +         vsd_addr =3D vsd_addr + vsd_idx * XIVE_VSD_SIZE;
> > +-        vsd =3D ldq_be_dma(&address_space_memory, vsd_addr);
> > ++        vsd =3D ldq_be_dma(&address_space_memory, vsd_addr,
> > ++                         MEMTXATTRS_UNSPECIFIED);
> > +
> > +         if (!(vsd & VSD_ADDRESS_MASK)) {
> > + #ifdef XIVE_DEBUG
> > +@@ -542,7 +543,7 @@ static uint64_t pnv_xive_vst_per_subpage(PnvXive *=
xive, uint32_t type)
> > +
> > +     /* Get the page size of the indirect table. */
> > +     vsd_addr =3D vsd & VSD_ADDRESS_MASK;
> > +-    vsd =3D ldq_be_dma(&address_space_memory, vsd_addr);
> > ++    vsd =3D ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UN=
SPECIFIED);
> > +
> > +     if (!(vsd & VSD_ADDRESS_MASK)) {
> > + #ifdef XIVE_DEBUG
> > +diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> > +index ed2b9ea..d960b81 100644
> > +--- a/hw/usb/hcd-xhci.c
> > ++++ b/hw/usb/hcd-xhci.c
> > +@@ -2062,7 +2062,7 @@ static TRBCCode xhci_address_slot(XHCIState *xhc=
i, unsigned int slotid,
> > +     assert(slotid >=3D 1 && slotid <=3D xhci->numslots);
> > +
> > +     dcbaap =3D xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
> > +-    poctx =3D ldq_le_dma(xhci->as, dcbaap + 8 * slotid);
> > ++    poctx =3D ldq_le_dma(xhci->as, dcbaap + 8 * slotid, MEMTXATTRS_UN=
SPECIFIED);
> > +     ictx =3D xhci_mask64(pictx);
> > +     octx =3D xhci_mask64(poctx);
> > +
> > +@@ -3437,8 +3437,8 @@ static int usb_xhci_post_load(void *opaque, int =
version_id)
> > +         if (!slot->addressed) {
> > +             continue;
> > +         }
> > +-        slot->ctx =3D
> > +-            xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid));
> > ++        slot->ctx =3D xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * s=
lotid,
> > ++                                           MEMTXATTRS_UNSPECIFIED));
> > +         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx=
));
> > +         slot->uport =3D xhci_lookup_uport(xhci, slot_ctx);
> > +         if (!slot->uport) {
> > +diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > +index d07e970..0613308 100644
> > +--- a/include/hw/pci/pci.h
> > ++++ b/include/hw/pci/pci.h
> > +@@ -854,7 +854,8 @@ static inline MemTxResult pci_dma_write(PCIDevice =
*dev, dma_addr_t addr,
> > +     static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,   =
   \
> > +                                                    dma_addr_t addr)  =
   \
> > +     {                                                                =
   \
> > +-        return ld##_l##_dma(pci_get_address_space(dev), addr);       =
   \
> > ++        return ld##_l##_dma(pci_get_address_space(dev), addr,        =
   \
> > ++                            MEMTXATTRS_UNSPECIFIED);                 =
   \
> > +     }                                                                =
   \
> > +     static inline void st##_s##_pci_dma(PCIDevice *dev,              =
   \
> > +                                         dma_addr_t addr, uint##_bits#=
#_t val) \
> > +diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
> > +index e87f8e6..d2ec9b0 100644
> > +--- a/include/hw/ppc/spapr_vio.h
> > ++++ b/include/hw/ppc/spapr_vio.h
> > +@@ -126,7 +126,8 @@ static inline int spapr_vio_dma_set(SpaprVioDevice=
 *dev, uint64_t taddr,
> > +         (stl_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIF=
IED))
> > + #define vio_stq(_dev, _addr, _val) \
> > +         (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIF=
IED))
> > +-#define vio_ldq(_dev, _addr) (ldq_be_dma(&(_dev)->as, (_addr)))
> > ++#define vio_ldq(_dev, _addr) \
> > ++        (ldq_be_dma(&(_dev)->as, (_addr), MEMTXATTRS_UNSPECIFIED))
> > +
> > + int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
> > +
> > +diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> > +index 009dd3c..d1635f5 100644
> > +--- a/include/sysemu/dma.h
> > ++++ b/include/sysemu/dma.h
> > +@@ -241,10 +241,11 @@ static inline void dma_memory_unmap(AddressSpace=
 *as,
> > +
> > + #define DEFINE_LDST_DMA(_lname, _sname, _bits, _end) \
> > +     static inline uint##_bits##_t ld##_lname##_##_end##_dma(AddressSp=
ace *as, \
> > +-                                                            dma_addr_=
t addr) \
> > ++                                                            dma_addr_=
t addr, \
> > ++                                                            MemTxAttr=
s attrs) \
> > +     {                                                                =
   \
> > +         uint##_bits##_t val;                                         =
   \
> > +-        dma_memory_read(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSPE=
CIFIED); \
> > ++        dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
> > +         return _end##_bits##_to_cpu(val);                            =
   \
> > +     }                                                                =
   \
> > +     static inline void st##_sname##_##_end##_dma(AddressSpace *as,   =
   \
> > +@@ -253,14 +254,14 @@ static inline void dma_memory_unmap(AddressSpace=
 *as,
> > +                                                  MemTxAttrs attrs)   =
   \
> > +     {                                                                =
   \
> > +         val =3D cpu_to_##_end##_bits(val);                           =
     \
> > +-        dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
> > ++        dma_memory_write(as, addr, &val, (_bits) / 8, attrs);        =
   \
> > +     }
> > +
> > +-static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
> > ++static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, Mem=
TxAttrs attrs)
> > + {
> > +     uint8_t val;
> > +
> > +-    dma_memory_read(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
> > ++    dma_memory_read(as, addr, &val, 1, attrs);
> > +     return val;
> > + }
> > +
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0017_let_st_pointer_dma_fu=
nction_propagate_MemTxResult.patch b/meta/recipes-devtools/qemu/qemu/0017_l=
et_st_pointer_dma_function_propagate_MemTxResult.patch
> > new file mode 100644
> > index 0000000000..3fc7b631a4
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0017_let_st_pointer_dma_function_=
propagate_MemTxResult.patch
> > @@ -0,0 +1,65 @@
> > +From 24aed6bcb6b6d266149591f955c2460c28759eb4 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Fri, 17 Dec 2021 23:56:14 +0100
> > +Subject: [PATCH] dma: Let st*_dma() propagate MemTxResult
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +dma_memory_write() returns a MemTxResult type. Do not discard
> > +it, return it to the caller.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
24aed6bcb6b6d266149591f955c2460c28759eb4&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D4bx4WkJGKGx09lxPJBxXYklFFCAhF%2ByixsupR6q0tMY%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > +Reviewed-by: C=E8=83=92=E6=BC=8Fdric Le Goater <clg@kaod.org>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-18-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + include/sysemu/dma.h | 20 ++++++++++----------
> > + 1 file changed, 10 insertions(+), 10 deletions(-)
> > +
> > +diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> > +index d1635f5..895044d 100644
> > +--- a/include/sysemu/dma.h
> > ++++ b/include/sysemu/dma.h
> > +@@ -248,13 +248,13 @@ static inline void dma_memory_unmap(AddressSpace=
 *as,
> > +         dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
> > +         return _end##_bits##_to_cpu(val);                            =
   \
> > +     }                                                                =
   \
> > +-    static inline void st##_sname##_##_end##_dma(AddressSpace *as,   =
   \
> > +-                                                 dma_addr_t addr,    =
   \
> > +-                                                 uint##_bits##_t val,=
   \
> > +-                                                 MemTxAttrs attrs)   =
   \
> > +-    {                                                                =
   \
> > +-        val =3D cpu_to_##_end##_bits(val);                           =
     \
> > +-        dma_memory_write(as, addr, &val, (_bits) / 8, attrs);        =
   \
> > ++    static inline MemTxResult st##_sname##_##_end##_dma(AddressSpace =
*as, \
> > ++                                                        dma_addr_t ad=
dr, \
> > ++                                                        uint##_bits##=
_t val, \
> > ++                                                        MemTxAttrs at=
trs) \
> > ++    { \
> > ++        val =3D cpu_to_##_end##_bits(val); \
> > ++        return dma_memory_write(as, addr, &val, (_bits) / 8, attrs); =
\
> > +     }
> > +
> > + static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, Mem=
TxAttrs attrs)
> > +@@ -265,10 +265,10 @@ static inline uint8_t ldub_dma(AddressSpace *as,=
 dma_addr_t addr, MemTxAttrs att
> > +     return val;
> > + }
> > +
> > +-static inline void stb_dma(AddressSpace *as, dma_addr_t addr,
> > +-                           uint8_t val, MemTxAttrs attrs)
> > ++static inline MemTxResult stb_dma(AddressSpace *as, dma_addr_t addr,
> > ++                                  uint8_t val, MemTxAttrs attrs)
> > + {
> > +-    dma_memory_write(as, addr, &val, 1, attrs);
> > ++    return dma_memory_write(as, addr, &val, 1, attrs);
> > + }
> > +
> > + DEFINE_LDST_DMA(uw, w, 16, le);
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0018_let_ld_pointer_dma_fu=
nction_propagate_MemTxResult.patch b/meta/recipes-devtools/qemu/qemu/0018_l=
et_ld_pointer_dma_function_propagate_MemTxResult.patch
> > new file mode 100644
> > index 0000000000..d8a136c47f
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0018_let_ld_pointer_dma_function_=
propagate_MemTxResult.patch
> > @@ -0,0 +1,175 @@
> > +From cd1db8df7431edd2210ed0123e2e09b9b6d1e621 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Fri, 17 Dec 2021 22:31:11 +0100
> > +Subject: [PATCH] dma: Let ld*_dma() propagate MemTxResult
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +dma_memory_read() returns a MemTxResult type. Do not discard
> > +it, return it to the caller.
> > +
> > +Update the few callers.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
cd1db8df7431edd2210ed0123e2e09b9b6d1e621&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DilUdVuyCO8xQLQjsFAWvT8NEMmeVqWXQRoPvdS9GAQ8%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > +Reviewed-by: C=E8=83=92=E6=BC=8Fdric Le Goater <clg@kaod.org>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-19-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/intc/pnv_xive.c         |  8 ++++----
> > + hw/usb/hcd-xhci.c          |  7 ++++---
> > + include/hw/pci/pci.h       |  6 ++++--
> > + include/hw/ppc/spapr_vio.h |  6 +++++-
> > + include/sysemu/dma.h       | 25 ++++++++++++-------------
> > + 5 files changed, 29 insertions(+), 23 deletions(-)
> > +
> > +diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
> > +index d9249bb..bb20751 100644
> > +--- a/hw/intc/pnv_xive.c
> > ++++ b/hw/intc/pnv_xive.c
> > +@@ -172,7 +172,7 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive=
 *xive, uint32_t type,
> > +
> > +     /* Get the page size of the indirect table. */
> > +     vsd_addr =3D vsd & VSD_ADDRESS_MASK;
> > +-    vsd =3D ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UN=
SPECIFIED);
> > ++    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSP=
ECIFIED);
> > +
> > +     if (!(vsd & VSD_ADDRESS_MASK)) {
> > + #ifdef XIVE_DEBUG
> > +@@ -195,8 +195,8 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive=
 *xive, uint32_t type,
> > +     /* Load the VSD we are looking for, if not already done */
> > +     if (vsd_idx) {
> > +         vsd_addr =3D vsd_addr + vsd_idx * XIVE_VSD_SIZE;
> > +-        vsd =3D ldq_be_dma(&address_space_memory, vsd_addr,
> > +-                         MEMTXATTRS_UNSPECIFIED);
> > ++        ldq_be_dma(&address_space_memory, vsd_addr, &vsd,
> > ++                   MEMTXATTRS_UNSPECIFIED);
> > +
> > +         if (!(vsd & VSD_ADDRESS_MASK)) {
> > + #ifdef XIVE_DEBUG
> > +@@ -543,7 +543,7 @@ static uint64_t pnv_xive_vst_per_subpage(PnvXive *=
xive, uint32_t type)
> > +
> > +     /* Get the page size of the indirect table. */
> > +     vsd_addr =3D vsd & VSD_ADDRESS_MASK;
> > +-    vsd =3D ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UN=
SPECIFIED);
> > ++    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSP=
ECIFIED);
> > +
> > +     if (!(vsd & VSD_ADDRESS_MASK)) {
> > + #ifdef XIVE_DEBUG
> > +diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> > +index d960b81..da5a407 100644
> > +--- a/hw/usb/hcd-xhci.c
> > ++++ b/hw/usb/hcd-xhci.c
> > +@@ -2062,7 +2062,7 @@ static TRBCCode xhci_address_slot(XHCIState *xhc=
i, unsigned int slotid,
> > +     assert(slotid >=3D 1 && slotid <=3D xhci->numslots);
> > +
> > +     dcbaap =3D xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
> > +-    poctx =3D ldq_le_dma(xhci->as, dcbaap + 8 * slotid, MEMTXATTRS_UN=
SPECIFIED);
> > ++    ldq_le_dma(xhci->as, dcbaap + 8 * slotid, &poctx, MEMTXATTRS_UNSP=
ECIFIED);
> > +     ictx =3D xhci_mask64(pictx);
> > +     octx =3D xhci_mask64(poctx);
> > +
> > +@@ -3429,6 +3429,7 @@ static int usb_xhci_post_load(void *opaque, int =
version_id)
> > +     uint32_t slot_ctx[4];
> > +     uint32_t ep_ctx[5];
> > +     int slotid, epid, state;
> > ++    uint64_t addr;
> > +
> > +     dcbaap =3D xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
> > +
> > +@@ -3437,8 +3438,8 @@ static int usb_xhci_post_load(void *opaque, int =
version_id)
> > +         if (!slot->addressed) {
> > +             continue;
> > +         }
> > +-        slot->ctx =3D xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * s=
lotid,
> > +-                                           MEMTXATTRS_UNSPECIFIED));
> > ++        ldq_le_dma(xhci->as, dcbaap + 8 * slotid, &addr, MEMTXATTRS_U=
NSPECIFIED);
> > ++        slot->ctx =3D xhci_mask64(addr);
> > +         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx=
));
> > +         slot->uport =3D xhci_lookup_uport(xhci, slot_ctx);
> > +         if (!slot->uport) {
> > +diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > +index 0613308..8c5f2ed 100644
> > +--- a/include/hw/pci/pci.h
> > ++++ b/include/hw/pci/pci.h
> > +@@ -854,8 +854,10 @@ static inline MemTxResult pci_dma_write(PCIDevice=
 *dev, dma_addr_t addr,
> > +     static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,   =
   \
> > +                                                    dma_addr_t addr)  =
   \
> > +     {                                                                =
   \
> > +-        return ld##_l##_dma(pci_get_address_space(dev), addr,        =
   \
> > +-                            MEMTXATTRS_UNSPECIFIED);                 =
   \
> > ++        uint##_bits##_t val; \
> > ++        ld##_l##_dma(pci_get_address_space(dev), addr, &val, \
> > ++                     MEMTXATTRS_UNSPECIFIED); \
> > ++        return val; \
> > +     }                                                                =
   \
> > +     static inline void st##_s##_pci_dma(PCIDevice *dev,              =
   \
> > +                                         dma_addr_t addr, uint##_bits#=
#_t val) \
> > +diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
> > +index d2ec9b0..7eae1a4 100644
> > +--- a/include/hw/ppc/spapr_vio.h
> > ++++ b/include/hw/ppc/spapr_vio.h
> > +@@ -127,7 +127,11 @@ static inline int spapr_vio_dma_set(SpaprVioDevic=
e *dev, uint64_t taddr,
> > + #define vio_stq(_dev, _addr, _val) \
> > +         (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIF=
IED))
> > + #define vio_ldq(_dev, _addr) \
> > +-        (ldq_be_dma(&(_dev)->as, (_addr), MEMTXATTRS_UNSPECIFIED))
> > ++        ({ \
> > ++            uint64_t _val; \
> > ++            ldq_be_dma(&(_dev)->as, (_addr), &_val, MEMTXATTRS_UNSPEC=
IFIED); \
> > ++            _val; \
> > ++        })
> > +
> > + int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
> > +
> > +diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> > +index 895044d..b3faef4 100644
> > +--- a/include/sysemu/dma.h
> > ++++ b/include/sysemu/dma.h
> > +@@ -240,14 +240,15 @@ static inline void dma_memory_unmap(AddressSpace=
 *as,
> > + }
> > +
> > + #define DEFINE_LDST_DMA(_lname, _sname, _bits, _end) \
> > +-    static inline uint##_bits##_t ld##_lname##_##_end##_dma(AddressSp=
ace *as, \
> > +-                                                            dma_addr_=
t addr, \
> > +-                                                            MemTxAttr=
s attrs) \
> > +-    {                                                                =
   \
> > +-        uint##_bits##_t val;                                         =
   \
> > +-        dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
> > +-        return _end##_bits##_to_cpu(val);                            =
   \
> > +-    }                                                                =
   \
> > ++    static inline MemTxResult ld##_lname##_##_end##_dma(AddressSpace =
*as, \
> > ++                                                        dma_addr_t ad=
dr, \
> > ++                                                        uint##_bits##=
_t *pval, \
> > ++                                                        MemTxAttrs at=
trs) \
> > ++    { \
> > ++        MemTxResult res =3D dma_memory_read(as, addr, pval, (_bits) /=
 8, attrs); \
> > ++        _end##_bits##_to_cpus(pval); \
> > ++        return res; \
> > ++    } \
> > +     static inline MemTxResult st##_sname##_##_end##_dma(AddressSpace =
*as, \
> > +                                                         dma_addr_t ad=
dr, \
> > +                                                         uint##_bits##=
_t val, \
> > +@@ -257,12 +258,10 @@ static inline void dma_memory_unmap(AddressSpace=
 *as,
> > +         return dma_memory_write(as, addr, &val, (_bits) / 8, attrs); =
\
> > +     }
> > +
> > +-static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, Mem=
TxAttrs attrs)
> > ++static inline MemTxResult ldub_dma(AddressSpace *as, dma_addr_t addr,
> > ++                                   uint8_t *val, MemTxAttrs attrs)
> > + {
> > +-    uint8_t val;
> > +-
> > +-    dma_memory_read(as, addr, &val, 1, attrs);
> > +-    return val;
> > ++    return dma_memory_read(as, addr, val, 1, attrs);
> > + }
> > +
> > + static inline MemTxResult stb_dma(AddressSpace *as, dma_addr_t addr,
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0019_let_st_pointer_pci_dm=
a_function_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu=
/0019_let_st_pointer_pci_dma_function_take_MemTxAttrs_argument.patch
> > new file mode 100644
> > index 0000000000..69101f308d
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0019_let_st_pointer_pci_dma_funct=
ion_take_MemTxAttrs_argument.patch
> > @@ -0,0 +1,303 @@
> > +From a423a1b523296f8798a5851aaaba64dd166c0a74 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Fri, 17 Dec 2021 22:39:42 +0100
> > +Subject: [PATCH] pci: Let st*_pci_dma() take MemTxAttrs argument
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Let devices specify transaction attributes when calling st*_pci_dma().
> > +
> > +Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
a423a1b523296f8798a5851aaaba64dd166c0a74&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DtZzescSXBuBUUREt4dSkVdlpU%2FLC7%2BMRCWsQvUa6jPw%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-21-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/audio/intel-hda.c | 10 ++++++----
> > + hw/net/eepro100.c    | 29 ++++++++++++++++++-----------
> > + hw/net/tulip.c       | 18 ++++++++++--------
> > + hw/scsi/megasas.c    | 15 ++++++++++-----
> > + hw/scsi/vmw_pvscsi.c |  3 ++-
> > + include/hw/pci/pci.h | 11 ++++++-----
> > + 6 files changed, 52 insertions(+), 34 deletions(-)
> > +
> > +diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
> > +index fb3d34a..3309ae0 100644
> > +--- a/hw/audio/intel-hda.c
> > ++++ b/hw/audio/intel-hda.c
> > +@@ -345,6 +345,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
> > +
> > + static void intel_hda_response(HDACodecDevice *dev, bool solicited, u=
int32_t response)
> > + {
> > ++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > +     HDACodecBus *bus =3D HDA_BUS(dev->qdev.parent_bus);
> > +     IntelHDAState *d =3D container_of(bus, IntelHDAState, codecs);
> > +     hwaddr addr;
> > +@@ -367,8 +368,8 @@ static void intel_hda_response(HDACodecDevice *dev=
, bool solicited, uint32_t res
> > +     ex =3D (solicited ? 0 : (1 << 4)) | dev->cad;
> > +     wp =3D (d->rirb_wp + 1) & 0xff;
> > +     addr =3D intel_hda_addr(d->rirb_lbase, d->rirb_ubase);
> > +-    stl_le_pci_dma(&d->pci, addr + 8*wp, response);
> > +-    stl_le_pci_dma(&d->pci, addr + 8*wp + 4, ex);
> > ++    stl_le_pci_dma(&d->pci, addr + 8 * wp, response, attrs);
> > ++    stl_le_pci_dma(&d->pci, addr + 8 * wp + 4, ex, attrs);
> > +     d->rirb_wp =3D wp;
> > +
> > +     dprint(d, 2, "%s: [wp 0x%x] response 0x%x, extra 0x%x\n",
> > +@@ -394,6 +395,7 @@ static void intel_hda_response(HDACodecDevice *dev=
, bool solicited, uint32_t res
> > + static bool intel_hda_xfer(HDACodecDevice *dev, uint32_t stnr, bool o=
utput,
> > +                            uint8_t *buf, uint32_t len)
> > + {
> > ++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > +     HDACodecBus *bus =3D HDA_BUS(dev->qdev.parent_bus);
> > +     IntelHDAState *d =3D container_of(bus, IntelHDAState, codecs);
> > +     hwaddr addr;
> > +@@ -428,7 +430,7 @@ static bool intel_hda_xfer(HDACodecDevice *dev, ui=
nt32_t stnr, bool output,
> > +                st->be, st->bp, st->bpl[st->be].len, copy);
> > +
> > +         pci_dma_rw(&d->pci, st->bpl[st->be].addr + st->bp, buf, copy,=
 !output,
> > +-                   MEMTXATTRS_UNSPECIFIED);
> > ++                   attrs);
> > +         st->lpib +=3D copy;
> > +         st->bp +=3D copy;
> > +         buf +=3D copy;
> > +@@ -451,7 +453,7 @@ static bool intel_hda_xfer(HDACodecDevice *dev, ui=
nt32_t stnr, bool output,
> > +     if (d->dp_lbase & 0x01) {
> > +         s =3D st - d->st;
> > +         addr =3D intel_hda_addr(d->dp_lbase & ~0x01, d->dp_ubase);
> > +-        stl_le_pci_dma(&d->pci, addr + 8*s, st->lpib);
> > ++        stl_le_pci_dma(&d->pci, addr + 8 * s, st->lpib, attrs);
> > +     }
> > +     dprint(d, 3, "dma: --\n");
> > +
> > +diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> > +index 16e95ef..83c4431 100644
> > +--- a/hw/net/eepro100.c
> > ++++ b/hw/net/eepro100.c
> > +@@ -700,6 +700,8 @@ static void set_ru_state(EEPRO100State * s, ru_sta=
te_t state)
> > +
> > + static void dump_statistics(EEPRO100State * s)
> > + {
> > ++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > ++
> > +     /* Dump statistical data. Most data is never changed by the emula=
tion
> > +      * and always 0, so we first just copy the whole block and then t=
hose
> > +      * values which really matter.
> > +@@ -707,16 +709,18 @@ static void dump_statistics(EEPRO100State * s)
> > +      */
> > +     pci_dma_write(&s->dev, s->statsaddr, &s->statistics, s->stats_siz=
e);
> > +     stl_le_pci_dma(&s->dev, s->statsaddr + 0,
> > +-                   s->statistics.tx_good_frames);
> > ++                   s->statistics.tx_good_frames, attrs);
> > +     stl_le_pci_dma(&s->dev, s->statsaddr + 36,
> > +-                   s->statistics.rx_good_frames);
> > ++                   s->statistics.rx_good_frames, attrs);
> > +     stl_le_pci_dma(&s->dev, s->statsaddr + 48,
> > +-                   s->statistics.rx_resource_errors);
> > ++                   s->statistics.rx_resource_errors, attrs);
> > +     stl_le_pci_dma(&s->dev, s->statsaddr + 60,
> > +-                   s->statistics.rx_short_frame_errors);
> > ++                   s->statistics.rx_short_frame_errors, attrs);
> > + #if 0
> > +-    stw_le_pci_dma(&s->dev, s->statsaddr + 76, s->statistics.xmt_tco_=
frames);
> > +-    stw_le_pci_dma(&s->dev, s->statsaddr + 78, s->statistics.rcv_tco_=
frames);
> > ++    stw_le_pci_dma(&s->dev, s->statsaddr + 76,
> > ++                   s->statistics.xmt_tco_frames, attrs);
> > ++    stw_le_pci_dma(&s->dev, s->statsaddr + 78,
> > ++                   s->statistics.rcv_tco_frames, attrs);
> > +     missing("CU dump statistical counters");
> > + #endif
> > + }
> > +@@ -833,6 +837,7 @@ static void set_multicast_list(EEPRO100State *s)
> > +
> > + static void action_command(EEPRO100State *s)
> > + {
> > ++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > +     /* The loop below won't stop if it gets special handcrafted data.
> > +        Therefore we limit the number of iterations. */
> > +     unsigned max_loop_count =3D 16;
> > +@@ -911,7 +916,7 @@ static void action_command(EEPRO100State *s)
> > +         }
> > +         /* Write new status. */
> > +         stw_le_pci_dma(&s->dev, s->cb_address,
> > +-                       s->tx.status | ok_status | STATUS_C);
> > ++                       s->tx.status | ok_status | STATUS_C, attrs);
> > +         if (bit_i) {
> > +             /* CU completed action. */
> > +             eepro100_cx_interrupt(s);
> > +@@ -937,6 +942,7 @@ static void action_command(EEPRO100State *s)
> > +
> > + static void eepro100_cu_command(EEPRO100State * s, uint8_t val)
> > + {
> > ++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > +     cu_state_t cu_state;
> > +     switch (val) {
> > +     case CU_NOP:
> > +@@ -986,7 +992,7 @@ static void eepro100_cu_command(EEPRO100State * s,=
 uint8_t val)
> > +         /* Dump statistical counters. */
> > +         TRACE(OTHER, logout("val=3D0x%02x (dump stats)\n", val));
> > +         dump_statistics(s);
> > +-        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa005)=
;
> > ++        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa005,=
 attrs);
> > +         break;
> > +     case CU_CMD_BASE:
> > +         /* Load CU base. */
> > +@@ -997,7 +1003,7 @@ static void eepro100_cu_command(EEPRO100State * s=
, uint8_t val)
> > +         /* Dump and reset statistical counters. */
> > +         TRACE(OTHER, logout("val=3D0x%02x (dump stats and reset)\n", =
val));
> > +         dump_statistics(s);
> > +-        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa007)=
;
> > ++        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa007,=
 attrs);
> > +         memset(&s->statistics, 0, sizeof(s->statistics));
> > +         break;
> > +     case CU_SRESUME:
> > +@@ -1612,6 +1618,7 @@ static ssize_t nic_receive(NetClientState *nc, c=
onst uint8_t * buf, size_t size)
> > +      * - Magic packets should set bit 30 in power management driver r=
egister.
> > +      * - Interesting packets should set bit 29 in power management dr=
iver register.
> > +      */
> > ++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > +     EEPRO100State *s =3D qemu_get_nic_opaque(nc);
> > +     uint16_t rfd_status =3D 0xa000;
> > + #if defined(CONFIG_PAD_RECEIVED_FRAMES)
> > +@@ -1726,9 +1733,9 @@ static ssize_t nic_receive(NetClientState *nc, c=
onst uint8_t * buf, size_t size)
> > +     TRACE(OTHER, logout("command 0x%04x, link 0x%08x, addr 0x%08x, si=
ze %u\n",
> > +           rfd_command, rx.link, rx.rx_buf_addr, rfd_size));
> > +     stw_le_pci_dma(&s->dev, s->ru_base + s->ru_offset +
> > +-                offsetof(eepro100_rx_t, status), rfd_status);
> > ++                offsetof(eepro100_rx_t, status), rfd_status, attrs);
> > +     stw_le_pci_dma(&s->dev, s->ru_base + s->ru_offset +
> > +-                offsetof(eepro100_rx_t, count), size);
> > ++                offsetof(eepro100_rx_t, count), size, attrs);
> > +     /* Early receive interrupt not supported. */
> > + #if 0
> > +     eepro100_er_interrupt(s);
> > +diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> > +index ca69f7e..1f2c79d 100644
> > +--- a/hw/net/tulip.c
> > ++++ b/hw/net/tulip.c
> > +@@ -86,16 +86,18 @@ static void tulip_desc_read(TULIPState *s, hwaddr =
p,
> > + static void tulip_desc_write(TULIPState *s, hwaddr p,
> > +         struct tulip_descriptor *desc)
> > + {
> > ++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > ++
> > +     if (s->csr[0] & CSR0_DBO) {
> > +-        stl_be_pci_dma(&s->dev, p, desc->status);
> > +-        stl_be_pci_dma(&s->dev, p + 4, desc->control);
> > +-        stl_be_pci_dma(&s->dev, p + 8, desc->buf_addr1);
> > +-        stl_be_pci_dma(&s->dev, p + 12, desc->buf_addr2);
> > ++        stl_be_pci_dma(&s->dev, p, desc->status, attrs);
> > ++        stl_be_pci_dma(&s->dev, p + 4, desc->control, attrs);
> > ++        stl_be_pci_dma(&s->dev, p + 8, desc->buf_addr1, attrs);
> > ++        stl_be_pci_dma(&s->dev, p + 12, desc->buf_addr2, attrs);
> > +     } else {
> > +-        stl_le_pci_dma(&s->dev, p, desc->status);
> > +-        stl_le_pci_dma(&s->dev, p + 4, desc->control);
> > +-        stl_le_pci_dma(&s->dev, p + 8, desc->buf_addr1);
> > +-        stl_le_pci_dma(&s->dev, p + 12, desc->buf_addr2);
> > ++        stl_le_pci_dma(&s->dev, p, desc->status, attrs);
> > ++        stl_le_pci_dma(&s->dev, p + 4, desc->control, attrs);
> > ++        stl_le_pci_dma(&s->dev, p + 8, desc->buf_addr1, attrs);
> > ++        stl_le_pci_dma(&s->dev, p + 12, desc->buf_addr2, attrs);
> > +     }
> > + }
> > +
> > +diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> > +index 091a350..b5e8b14 100644
> > +--- a/hw/scsi/megasas.c
> > ++++ b/hw/scsi/megasas.c
> > +@@ -168,14 +168,16 @@ static void megasas_frame_set_cmd_status(Megasas=
State *s,
> > +                                          unsigned long frame, uint8_t=
 v)
> > + {
> > +     PCIDevice *pci =3D &s->parent_obj;
> > +-    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, cmd_st=
atus), v);
> > ++    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, cmd_st=
atus),
> > ++                v, MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + static void megasas_frame_set_scsi_status(MegasasState *s,
> > +                                           unsigned long frame, uint8_=
t v)
> > + {
> > +     PCIDevice *pci =3D &s->parent_obj;
> > +-    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, scsi_s=
tatus), v);
> > ++    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, scsi_s=
tatus),
> > ++                v, MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + static inline const char *mfi_frame_desc(unsigned int cmd)
> > +@@ -542,6 +544,7 @@ static MegasasCmd *megasas_enqueue_frame(MegasasSt=
ate *s,
> > +
> > + static void megasas_complete_frame(MegasasState *s, uint64_t context)
> > + {
> > ++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > +     PCIDevice *pci_dev =3D PCI_DEVICE(s);
> > +     int tail, queue_offset;
> > +
> > +@@ -555,10 +558,12 @@ static void megasas_complete_frame(MegasasState =
*s, uint64_t context)
> > +          */
> > +         if (megasas_use_queue64(s)) {
> > +             queue_offset =3D s->reply_queue_head * sizeof(uint64_t);
> > +-            stq_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,=
 context);
> > ++            stq_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
> > ++                           context, attrs);
> > +         } else {
> > +             queue_offset =3D s->reply_queue_head * sizeof(uint32_t);
> > +-            stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,=
 context);
> > ++            stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
> > ++                           context, attrs);
> > +         }
> > +         s->reply_queue_tail =3D ldl_le_pci_dma(pci_dev, s->consumer_p=
a);
> > +         trace_megasas_qf_complete(context, s->reply_queue_head,
> > +@@ -572,7 +577,7 @@ static void megasas_complete_frame(MegasasState *s=
, uint64_t context)
> > +         s->reply_queue_head =3D megasas_next_index(s, tail, s->fw_cmd=
s);
> > +         trace_megasas_qf_update(s->reply_queue_head, s->reply_queue_t=
ail,
> > +                                 s->busy);
> > +-        stl_le_pci_dma(pci_dev, s->producer_pa, s->reply_queue_head);
> > ++        stl_le_pci_dma(pci_dev, s->producer_pa, s->reply_queue_head, =
attrs);
> > +         /* Notify HBA */
> > +         if (msix_enabled(pci_dev)) {
> > +             trace_megasas_msix_raise(0);
> > +diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
> > +index cd76bd6..59c3e8b 100644
> > +--- a/hw/scsi/vmw_pvscsi.c
> > ++++ b/hw/scsi/vmw_pvscsi.c
> > +@@ -55,7 +55,8 @@
> > +                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field=
)))
> > + #define RS_SET_FIELD(m, field, val) \
> > +     (stl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj,=
 \
> > +-                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field=
), val))
> > ++                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field=
), val, \
> > ++                 MEMTXATTRS_UNSPECIFIED))
> > +
> > + struct PVSCSIClass {
> > +     PCIDeviceClass parent_class;
> > +diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > +index 8c5f2ed..9f51ef2 100644
> > +--- a/include/hw/pci/pci.h
> > ++++ b/include/hw/pci/pci.h
> > +@@ -859,11 +859,12 @@ static inline MemTxResult pci_dma_write(PCIDevic=
e *dev, dma_addr_t addr,
> > +                      MEMTXATTRS_UNSPECIFIED); \
> > +         return val; \
> > +     }                                                                =
   \
> > +-    static inline void st##_s##_pci_dma(PCIDevice *dev,              =
   \
> > +-                                        dma_addr_t addr, uint##_bits#=
#_t val) \
> > +-    {                                                                =
   \
> > +-        st##_s##_dma(pci_get_address_space(dev), addr, val, \
> > +-                     MEMTXATTRS_UNSPECIFIED); \
> > ++    static inline void st##_s##_pci_dma(PCIDevice *dev, \
> > ++                                        dma_addr_t addr, \
> > ++                                        uint##_bits##_t val, \
> > ++                                        MemTxAttrs attrs) \
> > ++    { \
> > ++        st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
> > +     }
> > +
> > + PCI_DMA_DEFINE_LDST(ub, b, 8);
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0020_let_ld_pointer_pci_dm=
a_function_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu=
/0020_let_ld_pointer_pci_dma_function_take_MemTxAttrs_argument.patch
> > new file mode 100644
> > index 0000000000..7f9de244be
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0020_let_ld_pointer_pci_dma_funct=
ion_take_MemTxAttrs_argument.patch
> > @@ -0,0 +1,271 @@
> > +From 398f9a84ac7132e38caf7b066273734b3bf619ff Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Fri, 17 Dec 2021 23:45:06 +0100
> > +Subject: [PATCH] pci: Let ld*_pci_dma() take MemTxAttrs argument
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Let devices specify transaction attributes when calling ld*_pci_dma().
> > +
> > +Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
398f9a84ac7132e38caf7b066273734b3bf619ff&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D%2BGt5I8oUQaf5fjcMJo8rDXvWcfhumFQ0NSPq1TIi6Jg%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-22-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/audio/intel-hda.c |  2 +-
> > + hw/net/eepro100.c    | 19 +++++++++++++------
> > + hw/net/tulip.c       | 18 ++++++++++--------
> > + hw/scsi/megasas.c    | 16 ++++++++++------
> > + hw/scsi/mptsas.c     | 10 ++++++----
> > + hw/scsi/vmw_pvscsi.c |  3 ++-
> > + hw/usb/hcd-xhci.c    |  1 +
> > + include/hw/pci/pci.h |  6 +++---
> > + 8 files changed, 46 insertions(+), 29 deletions(-)
> > +
> > +diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
> > +index 3309ae0..e34b7ab 100644
> > +--- a/hw/audio/intel-hda.c
> > ++++ b/hw/audio/intel-hda.c
> > +@@ -335,7 +335,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
> > +
> > +         rp =3D (d->corb_rp + 1) & 0xff;
> > +         addr =3D intel_hda_addr(d->corb_lbase, d->corb_ubase);
> > +-        verb =3D ldl_le_pci_dma(&d->pci, addr + 4*rp);
> > ++        verb =3D ldl_le_pci_dma(&d->pci, addr + 4 * rp, MEMTXATTRS_UN=
SPECIFIED);
> > +         d->corb_rp =3D rp;
> > +
> > +         dprint(d, 2, "%s: [rp 0x%x] verb 0x%08x\n", __func__, rp, ver=
b);
> > +diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> > +index 83c4431..eb82e9c 100644
> > +--- a/hw/net/eepro100.c
> > ++++ b/hw/net/eepro100.c
> > +@@ -737,6 +737,7 @@ static void read_cb(EEPRO100State *s)
> > +
> > + static void tx_command(EEPRO100State *s)
> > + {
> > ++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > +     uint32_t tbd_array =3D s->tx.tbd_array_addr;
> > +     uint16_t tcb_bytes =3D s->tx.tcb_bytes & 0x3fff;
> > +     /* Sends larger than MAX_ETH_FRAME_SIZE are allowed, up to 2600 b=
ytes. */
> > +@@ -772,11 +773,14 @@ static void tx_command(EEPRO100State *s)
> > +             /* Extended Flexible TCB. */
> > +             for (; tbd_count < 2; tbd_count++) {
> > +                 uint32_t tx_buffer_address =3D ldl_le_pci_dma(&s->dev=
,
> > +-                                                            tbd_addre=
ss);
> > ++                                                            tbd_addre=
ss,
> > ++                                                            attrs);
> > +                 uint16_t tx_buffer_size =3D lduw_le_pci_dma(&s->dev,
> > +-                                                          tbd_address=
 + 4);
> > ++                                                          tbd_address=
 + 4,
> > ++                                                          attrs);
> > +                 uint16_t tx_buffer_el =3D lduw_le_pci_dma(&s->dev,
> > +-                                                        tbd_address +=
 6);
> > ++                                                        tbd_address +=
 6,
> > ++                                                        attrs);
> > +                 tbd_address +=3D 8;
> > +                 TRACE(RXTX, logout
> > +                     ("TBD (extended flexible mode): buffer address 0x=
%08x, size 0x%04x\n",
> > +@@ -792,9 +796,12 @@ static void tx_command(EEPRO100State *s)
> > +         }
> > +         tbd_address =3D tbd_array;
> > +         for (; tbd_count < s->tx.tbd_count; tbd_count++) {
> > +-            uint32_t tx_buffer_address =3D ldl_le_pci_dma(&s->dev, tb=
d_address);
> > +-            uint16_t tx_buffer_size =3D lduw_le_pci_dma(&s->dev, tbd_=
address + 4);
> > +-            uint16_t tx_buffer_el =3D lduw_le_pci_dma(&s->dev, tbd_ad=
dress + 6);
> > ++            uint32_t tx_buffer_address =3D ldl_le_pci_dma(&s->dev, tb=
d_address,
> > ++                                                        attrs);
> > ++            uint16_t tx_buffer_size =3D lduw_le_pci_dma(&s->dev, tbd_=
address + 4,
> > ++                                                      attrs);
> > ++            uint16_t tx_buffer_el =3D lduw_le_pci_dma(&s->dev, tbd_ad=
dress + 6,
> > ++                                                    attrs);
> > +             tbd_address +=3D 8;
> > +             TRACE(RXTX, logout
> > +                 ("TBD (flexible mode): buffer address 0x%08x, size 0x=
%04x\n",
> > +diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> > +index 1f2c79d..c76e486 100644
> > +--- a/hw/net/tulip.c
> > ++++ b/hw/net/tulip.c
> > +@@ -70,16 +70,18 @@ static const VMStateDescription vmstate_pci_tulip =
=3D {
> > + static void tulip_desc_read(TULIPState *s, hwaddr p,
> > +         struct tulip_descriptor *desc)
> > + {
> > ++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > ++
> > +     if (s->csr[0] & CSR0_DBO) {
> > +-        desc->status =3D ldl_be_pci_dma(&s->dev, p);
> > +-        desc->control =3D ldl_be_pci_dma(&s->dev, p + 4);
> > +-        desc->buf_addr1 =3D ldl_be_pci_dma(&s->dev, p + 8);
> > +-        desc->buf_addr2 =3D ldl_be_pci_dma(&s->dev, p + 12);
> > ++        desc->status =3D ldl_be_pci_dma(&s->dev, p, attrs);
> > ++        desc->control =3D ldl_be_pci_dma(&s->dev, p + 4, attrs);
> > ++        desc->buf_addr1 =3D ldl_be_pci_dma(&s->dev, p + 8, attrs);
> > ++        desc->buf_addr2 =3D ldl_be_pci_dma(&s->dev, p + 12, attrs);
> > +     } else {
> > +-        desc->status =3D ldl_le_pci_dma(&s->dev, p);
> > +-        desc->control =3D ldl_le_pci_dma(&s->dev, p + 4);
> > +-        desc->buf_addr1 =3D ldl_le_pci_dma(&s->dev, p + 8);
> > +-        desc->buf_addr2 =3D ldl_le_pci_dma(&s->dev, p + 12);
> > ++        desc->status =3D ldl_le_pci_dma(&s->dev, p, attrs);
> > ++        desc->control =3D ldl_le_pci_dma(&s->dev, p + 4, attrs);
> > ++        desc->buf_addr1 =3D ldl_le_pci_dma(&s->dev, p + 8, attrs);
> > ++        desc->buf_addr2 =3D ldl_le_pci_dma(&s->dev, p + 12, attrs);
> > +     }
> > + }
> > +
> > +diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> > +index b5e8b14..98b1370 100644
> > +--- a/hw/scsi/megasas.c
> > ++++ b/hw/scsi/megasas.c
> > +@@ -202,7 +202,9 @@ static uint64_t megasas_frame_get_context(MegasasS=
tate *s,
> > +                                           unsigned long frame)
> > + {
> > +     PCIDevice *pci =3D &s->parent_obj;
> > +-    return ldq_le_pci_dma(pci, frame + offsetof(struct mfi_frame_head=
er, context));
> > ++    return ldq_le_pci_dma(pci,
> > ++                          frame + offsetof(struct mfi_frame_header, c=
ontext),
> > ++                          MEMTXATTRS_UNSPECIFIED);
> > + }
> > +
> > + static bool megasas_frame_is_ieee_sgl(MegasasCmd *cmd)
> > +@@ -534,7 +536,8 @@ static MegasasCmd *megasas_enqueue_frame(MegasasSt=
ate *s,
> > +     s->busy++;
> > +
> > +     if (s->consumer_pa) {
> > +-        s->reply_queue_tail =3D ldl_le_pci_dma(pcid, s->consumer_pa);
> > ++        s->reply_queue_tail =3D ldl_le_pci_dma(pcid, s->consumer_pa,
> > ++                                             MEMTXATTRS_UNSPECIFIED);
> > +     }
> > +     trace_megasas_qf_enqueue(cmd->index, cmd->count, cmd->context,
> > +                              s->reply_queue_head, s->reply_queue_tail=
, s->busy);
> > +@@ -565,14 +568,14 @@ static void megasas_complete_frame(MegasasState =
*s, uint64_t context)
> > +             stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
> > +                            context, attrs);
> > +         }
> > +-        s->reply_queue_tail =3D ldl_le_pci_dma(pci_dev, s->consumer_p=
a);
> > ++        s->reply_queue_tail =3D ldl_le_pci_dma(pci_dev, s->consumer_p=
a, attrs);
> > +         trace_megasas_qf_complete(context, s->reply_queue_head,
> > +                                   s->reply_queue_tail, s->busy);
> > +     }
> > +
> > +     if (megasas_intr_enabled(s)) {
> > +         /* Update reply queue pointer */
> > +-        s->reply_queue_tail =3D ldl_le_pci_dma(pci_dev, s->consumer_p=
a);
> > ++        s->reply_queue_tail =3D ldl_le_pci_dma(pci_dev, s->consumer_p=
a, attrs);
> > +         tail =3D s->reply_queue_head;
> > +         s->reply_queue_head =3D megasas_next_index(s, tail, s->fw_cmd=
s);
> > +         trace_megasas_qf_update(s->reply_queue_head, s->reply_queue_t=
ail,
> > +@@ -637,6 +640,7 @@ static void megasas_abort_command(MegasasCmd *cmd)
> > +
> > + static int megasas_init_firmware(MegasasState *s, MegasasCmd *cmd)
> > + {
> > ++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > +     PCIDevice *pcid =3D PCI_DEVICE(s);
> > +     uint32_t pa_hi, pa_lo;
> > +     hwaddr iq_pa, initq_size =3D sizeof(struct mfi_init_qinfo);
> > +@@ -675,9 +679,9 @@ static int megasas_init_firmware(MegasasState *s, =
MegasasCmd *cmd)
> > +     pa_lo =3D le32_to_cpu(initq->pi_addr_lo);
> > +     pa_hi =3D le32_to_cpu(initq->pi_addr_hi);
> > +     s->producer_pa =3D ((uint64_t) pa_hi << 32) | pa_lo;
> > +-    s->reply_queue_head =3D ldl_le_pci_dma(pcid, s->producer_pa);
> > ++    s->reply_queue_head =3D ldl_le_pci_dma(pcid, s->producer_pa, attr=
s);
> > +     s->reply_queue_head %=3D MEGASAS_MAX_FRAMES;
> > +-    s->reply_queue_tail =3D ldl_le_pci_dma(pcid, s->consumer_pa);
> > ++    s->reply_queue_tail =3D ldl_le_pci_dma(pcid, s->consumer_pa, attr=
s);
> > +     s->reply_queue_tail %=3D MEGASAS_MAX_FRAMES;
> > +     flags =3D le32_to_cpu(initq->flags);
> > +     if (flags & MFI_QUEUE_FLAG_CONTEXT64) {
> > +diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> > +index f6c7765..ac9f4df 100644
> > +--- a/hw/scsi/mptsas.c
> > ++++ b/hw/scsi/mptsas.c
> > +@@ -172,14 +172,15 @@ static const int mpi_request_sizes[] =3D {
> > + static dma_addr_t mptsas_ld_sg_base(MPTSASState *s, uint32_t flags_an=
d_length,
> > +                                     dma_addr_t *sgaddr)
> > + {
> > ++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > +     PCIDevice *pci =3D (PCIDevice *) s;
> > +     dma_addr_t addr;
> > +
> > +     if (flags_and_length & MPI_SGE_FLAGS_64_BIT_ADDRESSING) {
> > +-        addr =3D ldq_le_pci_dma(pci, *sgaddr + 4);
> > ++        addr =3D ldq_le_pci_dma(pci, *sgaddr + 4, attrs);
> > +         *sgaddr +=3D 12;
> > +     } else {
> > +-        addr =3D ldl_le_pci_dma(pci, *sgaddr + 4);
> > ++        addr =3D ldl_le_pci_dma(pci, *sgaddr + 4, attrs);
> > +         *sgaddr +=3D 8;
> > +     }
> > +     return addr;
> > +@@ -203,7 +204,7 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSAS=
Request *req, hwaddr addr)
> > +         dma_addr_t addr, len;
> > +         uint32_t flags_and_length;
> > +
> > +-        flags_and_length =3D ldl_le_pci_dma(pci, sgaddr);
> > ++        flags_and_length =3D ldl_le_pci_dma(pci, sgaddr, MEMTXATTRS_U=
NSPECIFIED);
> > +         len =3D flags_and_length & MPI_SGE_LENGTH_MASK;
> > +         if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
> > +             !=3D MPI_SGE_FLAGS_SIMPLE_ELEMENT ||
> > +@@ -234,7 +235,8 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSAS=
Request *req, hwaddr addr)
> > +                 break;
> > +             }
> > +
> > +-            flags_and_length =3D ldl_le_pci_dma(pci, next_chain_addr)=
;
> > ++            flags_and_length =3D ldl_le_pci_dma(pci, next_chain_addr,
> > ++                                              MEMTXATTRS_UNSPECIFIED)=
;
> > +             if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
> > +                 !=3D MPI_SGE_FLAGS_CHAIN_ELEMENT) {
> > +                 return MPI_IOCSTATUS_INVALID_SGL;
> > +diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
> > +index 59c3e8b..33e16f9 100644
> > +--- a/hw/scsi/vmw_pvscsi.c
> > ++++ b/hw/scsi/vmw_pvscsi.c
> > +@@ -52,7 +52,8 @@
> > +
> > + #define RS_GET_FIELD(m, field) \
> > +     (ldl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj,=
 \
> > +-                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field=
)))
> > ++                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field=
), \
> > ++                 MEMTXATTRS_UNSPECIFIED))
> > + #define RS_SET_FIELD(m, field, val) \
> > +     (stl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj,=
 \
> > +                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field=
), val, \
> > +diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> > +index da5a407..14bdb89 100644
> > +--- a/hw/usb/hcd-xhci.c
> > ++++ b/hw/usb/hcd-xhci.c
> > +@@ -3440,6 +3440,7 @@ static int usb_xhci_post_load(void *opaque, int =
version_id)
> > +         }
> > +         ldq_le_dma(xhci->as, dcbaap + 8 * slotid, &addr, MEMTXATTRS_U=
NSPECIFIED);
> > +         slot->ctx =3D xhci_mask64(addr);
> > ++
> > +         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx=
));
> > +         slot->uport =3D xhci_lookup_uport(xhci, slot_ctx);
> > +         if (!slot->uport) {
> > +diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > +index 9f51ef2..7a46c1f 100644
> > +--- a/include/hw/pci/pci.h
> > ++++ b/include/hw/pci/pci.h
> > +@@ -852,11 +852,11 @@ static inline MemTxResult pci_dma_write(PCIDevic=
e *dev, dma_addr_t addr,
> > +
> > + #define PCI_DMA_DEFINE_LDST(_l, _s, _bits)                           =
   \
> > +     static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,   =
   \
> > +-                                                   dma_addr_t addr)  =
   \
> > ++                                                   dma_addr_t addr, \
> > ++                                                   MemTxAttrs attrs) =
\
> > +     {                                                                =
   \
> > +         uint##_bits##_t val; \
> > +-        ld##_l##_dma(pci_get_address_space(dev), addr, &val, \
> > +-                     MEMTXATTRS_UNSPECIFIED); \
> > ++        ld##_l##_dma(pci_get_address_space(dev), addr, &val, attrs); =
\
> > +         return val; \
> > +     }                                                                =
   \
> > +     static inline void st##_s##_pci_dma(PCIDevice *dev, \
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0021_let_st_pointer_pci_dm=
a_function_propagate_MemTxResult.patch b/meta/recipes-devtools/qemu/qemu/00=
21_let_st_pointer_pci_dma_function_propagate_MemTxResult.patch
> > new file mode 100644
> > index 0000000000..e52a45b90f
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0021_let_st_pointer_pci_dma_funct=
ion_propagate_MemTxResult.patch
> > @@ -0,0 +1,47 @@
> > +From 6bebb270731758fae3114b7d24c2b12b7c325cc5 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Fri, 17 Dec 2021 23:47:30 +0100
> > +Subject: [PATCH] pci: Let st*_pci_dma() propagate MemTxResult
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +st*_dma() returns a MemTxResult type. Do not discard
> > +it, return it to the caller.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
6bebb270731758fae3114b7d24c2b12b7c325cc5&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DhZ3xZnMeBLY3fHpSnLtPqFNhBQitlii3oHyirWelrBI%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-23-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + include/hw/pci/pci.h | 10 +++++-----
> > + 1 file changed, 5 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > +index 7a46c1f..c90cecc 100644
> > +--- a/include/hw/pci/pci.h
> > ++++ b/include/hw/pci/pci.h
> > +@@ -859,12 +859,12 @@ static inline MemTxResult pci_dma_write(PCIDevic=
e *dev, dma_addr_t addr,
> > +         ld##_l##_dma(pci_get_address_space(dev), addr, &val, attrs); =
\
> > +         return val; \
> > +     }                                                                =
   \
> > +-    static inline void st##_s##_pci_dma(PCIDevice *dev, \
> > +-                                        dma_addr_t addr, \
> > +-                                        uint##_bits##_t val, \
> > +-                                        MemTxAttrs attrs) \
> > ++    static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
> > ++                                               dma_addr_t addr, \
> > ++                                               uint##_bits##_t val, \
> > ++                                               MemTxAttrs attrs) \
> > +     { \
> > +-        st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
> > ++        return st##_s##_dma(pci_get_address_space(dev), addr, val, at=
trs); \
> > +     }
> > +
> > + PCI_DMA_DEFINE_LDST(ub, b, 8);
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0022_let_ld_pointer_pci_dm=
a_function_propagate_MemTxResult.patch b/meta/recipes-devtools/qemu/qemu/00=
22_let_ld_pointer_pci_dma_function_propagate_MemTxResult.patch
> > new file mode 100644
> > index 0000000000..6bd6350f44
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0022_let_ld_pointer_pci_dma_funct=
ion_propagate_MemTxResult.patch
> > @@ -0,0 +1,296 @@
> > +From 4a63054bce23982b99f4d3c65528e47e614086b2 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Fri, 17 Dec 2021 23:49:30 +0100
> > +Subject: [PATCH] pci: Let ld*_pci_dma() propagate MemTxResult
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +ld*_dma() returns a MemTxResult type. Do not discard
> > +it, return it to the caller.
> > +
> > +Update the few callers.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dcommit%3Bh%3D=
4a63054bce23982b99f4d3c65528e47e614086b2&amp;data=3D05%7C01%7CBhabu.Bindu%4=
0kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3Dhj2unNSvxm%2Bj1s9SYqEH0P8ymvJEgDRKjfs5n6i4gog%3D&amp;reserved=3D0]
> > +
> > +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211223115554.3155328-24-philmd@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/audio/intel-hda.c |  2 +-
> > + hw/net/eepro100.c    | 25 ++++++++++---------------
> > + hw/net/tulip.c       | 16 ++++++++--------
> > + hw/scsi/megasas.c    | 21 ++++++++++++---------
> > + hw/scsi/mptsas.c     | 16 +++++++++++-----
> > + hw/scsi/vmw_pvscsi.c | 16 ++++++++++------
> > + include/hw/pci/pci.h | 17 ++++++++---------
> > + 7 files changed, 60 insertions(+), 53 deletions(-)
> > +
> > +diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
> > +index e34b7ab..2b55d52 100644
> > +--- a/hw/audio/intel-hda.c
> > ++++ b/hw/audio/intel-hda.c
> > +@@ -335,7 +335,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
> > +
> > +         rp =3D (d->corb_rp + 1) & 0xff;
> > +         addr =3D intel_hda_addr(d->corb_lbase, d->corb_ubase);
> > +-        verb =3D ldl_le_pci_dma(&d->pci, addr + 4 * rp, MEMTXATTRS_UN=
SPECIFIED);
> > ++        ldl_le_pci_dma(&d->pci, addr + 4 * rp, &verb, MEMTXATTRS_UNSP=
ECIFIED);
> > +         d->corb_rp =3D rp;
> > +
> > +         dprint(d, 2, "%s: [rp 0x%x] verb 0x%08x\n", __func__, rp, ver=
b);
> > +diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> > +index eb82e9c..679f52f 100644
> > +--- a/hw/net/eepro100.c
> > ++++ b/hw/net/eepro100.c
> > +@@ -769,18 +769,16 @@ static void tx_command(EEPRO100State *s)
> > +     } else {
> > +         /* Flexible mode. */
> > +         uint8_t tbd_count =3D 0;
> > ++        uint32_t tx_buffer_address;
> > ++        uint16_t tx_buffer_size;
> > ++        uint16_t tx_buffer_el;
> > ++
> > +         if (s->has_extended_tcb_support && !(s->configuration[6] & BI=
T(4))) {
> > +             /* Extended Flexible TCB. */
> > +             for (; tbd_count < 2; tbd_count++) {
> > +-                uint32_t tx_buffer_address =3D ldl_le_pci_dma(&s->dev=
,
> > +-                                                            tbd_addre=
ss,
> > +-                                                            attrs);
> > +-                uint16_t tx_buffer_size =3D lduw_le_pci_dma(&s->dev,
> > +-                                                          tbd_address=
 + 4,
> > +-                                                          attrs);
> > +-                uint16_t tx_buffer_el =3D lduw_le_pci_dma(&s->dev,
> > +-                                                        tbd_address +=
 6,
> > +-                                                        attrs);
> > ++                ldl_le_pci_dma(&s->dev, tbd_address, &tx_buffer_addre=
ss, attrs);
> > ++                lduw_le_pci_dma(&s->dev, tbd_address + 4, &tx_buffer_=
size, attrs);
> > ++                lduw_le_pci_dma(&s->dev, tbd_address + 6, &tx_buffer_=
el, attrs);
> > +                 tbd_address +=3D 8;
> > +                 TRACE(RXTX, logout
> > +                     ("TBD (extended flexible mode): buffer address 0x=
%08x, size 0x%04x\n",
> > +@@ -796,12 +794,9 @@ static void tx_command(EEPRO100State *s)
> > +         }
> > +         tbd_address =3D tbd_array;
> > +         for (; tbd_count < s->tx.tbd_count; tbd_count++) {
> > +-            uint32_t tx_buffer_address =3D ldl_le_pci_dma(&s->dev, tb=
d_address,
> > +-                                                        attrs);
> > +-            uint16_t tx_buffer_size =3D lduw_le_pci_dma(&s->dev, tbd_=
address + 4,
> > +-                                                      attrs);
> > +-            uint16_t tx_buffer_el =3D lduw_le_pci_dma(&s->dev, tbd_ad=
dress + 6,
> > +-                                                    attrs);
> > ++            ldl_le_pci_dma(&s->dev, tbd_address, &tx_buffer_address, =
attrs);
> > ++            lduw_le_pci_dma(&s->dev, tbd_address + 4, &tx_buffer_size=
, attrs);
> > ++            lduw_le_pci_dma(&s->dev, tbd_address + 6, &tx_buffer_el, =
attrs);
> > +             tbd_address +=3D 8;
> > +             TRACE(RXTX, logout
> > +                 ("TBD (flexible mode): buffer address 0x%08x, size 0x=
%04x\n",
> > +diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> > +index c76e486..d5b6cc5 100644
> > +--- a/hw/net/tulip.c
> > ++++ b/hw/net/tulip.c
> > +@@ -73,15 +73,15 @@ static void tulip_desc_read(TULIPState *s, hwaddr =
p,
> > +     const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > +
> > +     if (s->csr[0] & CSR0_DBO) {
> > +-        desc->status =3D ldl_be_pci_dma(&s->dev, p, attrs);
> > +-        desc->control =3D ldl_be_pci_dma(&s->dev, p + 4, attrs);
> > +-        desc->buf_addr1 =3D ldl_be_pci_dma(&s->dev, p + 8, attrs);
> > +-        desc->buf_addr2 =3D ldl_be_pci_dma(&s->dev, p + 12, attrs);
> > ++        ldl_be_pci_dma(&s->dev, p, &desc->status, attrs);
> > ++        ldl_be_pci_dma(&s->dev, p + 4, &desc->control, attrs);
> > ++        ldl_be_pci_dma(&s->dev, p + 8, &desc->buf_addr1, attrs);
> > ++        ldl_be_pci_dma(&s->dev, p + 12, &desc->buf_addr2, attrs);
> > +     } else {
> > +-        desc->status =3D ldl_le_pci_dma(&s->dev, p, attrs);
> > +-        desc->control =3D ldl_le_pci_dma(&s->dev, p + 4, attrs);
> > +-        desc->buf_addr1 =3D ldl_le_pci_dma(&s->dev, p + 8, attrs);
> > +-        desc->buf_addr2 =3D ldl_le_pci_dma(&s->dev, p + 12, attrs);
> > ++        ldl_le_pci_dma(&s->dev, p, &desc->status, attrs);
> > ++        ldl_le_pci_dma(&s->dev, p + 4, &desc->control, attrs);
> > ++        ldl_le_pci_dma(&s->dev, p + 8, &desc->buf_addr1, attrs);
> > ++        ldl_le_pci_dma(&s->dev, p + 12, &desc->buf_addr2, attrs);
> > +     }
> > + }
> > +
> > +diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> > +index 98b1370..dc9bbdb 100644
> > +--- a/hw/scsi/megasas.c
> > ++++ b/hw/scsi/megasas.c
> > +@@ -202,9 +202,12 @@ static uint64_t megasas_frame_get_context(Megasas=
State *s,
> > +                                           unsigned long frame)
> > + {
> > +     PCIDevice *pci =3D &s->parent_obj;
> > +-    return ldq_le_pci_dma(pci,
> > +-                          frame + offsetof(struct mfi_frame_header, c=
ontext),
> > +-                          MEMTXATTRS_UNSPECIFIED);
> > ++    uint64_t val;
> > ++
> > ++    ldq_le_pci_dma(pci, frame + offsetof(struct mfi_frame_header, con=
text),
> > ++                   &val, MEMTXATTRS_UNSPECIFIED);
> > ++
> > ++    return val;
> > + }
> > +
> > + static bool megasas_frame_is_ieee_sgl(MegasasCmd *cmd)
> > +@@ -536,8 +539,8 @@ static MegasasCmd *megasas_enqueue_frame(MegasasSt=
ate *s,
> > +     s->busy++;
> > +
> > +     if (s->consumer_pa) {
> > +-        s->reply_queue_tail =3D ldl_le_pci_dma(pcid, s->consumer_pa,
> > +-                                             MEMTXATTRS_UNSPECIFIED);
> > ++        ldl_le_pci_dma(pcid, s->consumer_pa, &s->reply_queue_tail,
> > ++                       MEMTXATTRS_UNSPECIFIED);
> > +     }
> > +     trace_megasas_qf_enqueue(cmd->index, cmd->count, cmd->context,
> > +                              s->reply_queue_head, s->reply_queue_tail=
, s->busy);
> > +@@ -568,14 +571,14 @@ static void megasas_complete_frame(MegasasState =
*s, uint64_t context)
> > +             stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
> > +                            context, attrs);
> > +         }
> > +-        s->reply_queue_tail =3D ldl_le_pci_dma(pci_dev, s->consumer_p=
a, attrs);
> > ++        ldl_le_pci_dma(pci_dev, s->consumer_pa, &s->reply_queue_tail,=
 attrs);
> > +         trace_megasas_qf_complete(context, s->reply_queue_head,
> > +                                   s->reply_queue_tail, s->busy);
> > +     }
> > +
> > +     if (megasas_intr_enabled(s)) {
> > +         /* Update reply queue pointer */
> > +-        s->reply_queue_tail =3D ldl_le_pci_dma(pci_dev, s->consumer_p=
a, attrs);
> > ++        ldl_le_pci_dma(pci_dev, s->consumer_pa, &s->reply_queue_tail,=
 attrs);
> > +         tail =3D s->reply_queue_head;
> > +         s->reply_queue_head =3D megasas_next_index(s, tail, s->fw_cmd=
s);
> > +         trace_megasas_qf_update(s->reply_queue_head, s->reply_queue_t=
ail,
> > +@@ -679,9 +682,9 @@ static int megasas_init_firmware(MegasasState *s, =
MegasasCmd *cmd)
> > +     pa_lo =3D le32_to_cpu(initq->pi_addr_lo);
> > +     pa_hi =3D le32_to_cpu(initq->pi_addr_hi);
> > +     s->producer_pa =3D ((uint64_t) pa_hi << 32) | pa_lo;
> > +-    s->reply_queue_head =3D ldl_le_pci_dma(pcid, s->producer_pa, attr=
s);
> > ++    ldl_le_pci_dma(pcid, s->producer_pa, &s->reply_queue_head, attrs)=
;
> > +     s->reply_queue_head %=3D MEGASAS_MAX_FRAMES;
> > +-    s->reply_queue_tail =3D ldl_le_pci_dma(pcid, s->consumer_pa, attr=
s);
> > ++    ldl_le_pci_dma(pcid, s->consumer_pa, &s->reply_queue_tail, attrs)=
;
> > +     s->reply_queue_tail %=3D MEGASAS_MAX_FRAMES;
> > +     flags =3D le32_to_cpu(initq->flags);
> > +     if (flags & MFI_QUEUE_FLAG_CONTEXT64) {
> > +diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> > +index ac9f4df..5181b0c 100644
> > +--- a/hw/scsi/mptsas.c
> > ++++ b/hw/scsi/mptsas.c
> > +@@ -177,10 +177,16 @@ static dma_addr_t mptsas_ld_sg_base(MPTSASState =
*s, uint32_t flags_and_length,
> > +     dma_addr_t addr;
> > +
> > +     if (flags_and_length & MPI_SGE_FLAGS_64_BIT_ADDRESSING) {
> > +-        addr =3D ldq_le_pci_dma(pci, *sgaddr + 4, attrs);
> > ++        uint64_t addr64;
> > ++
> > ++        ldq_le_pci_dma(pci, *sgaddr + 4, &addr64, attrs);
> > ++        addr =3D addr64;
> > +         *sgaddr +=3D 12;
> > +     } else {
> > +-        addr =3D ldl_le_pci_dma(pci, *sgaddr + 4, attrs);
> > ++        uint32_t addr32;
> > ++
> > ++        ldl_le_pci_dma(pci, *sgaddr + 4, &addr32, attrs);
> > ++        addr =3D addr32;
> > +         *sgaddr +=3D 8;
> > +     }
> > +     return addr;
> > +@@ -204,7 +210,7 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSAS=
Request *req, hwaddr addr)
> > +         dma_addr_t addr, len;
> > +         uint32_t flags_and_length;
> > +
> > +-        flags_and_length =3D ldl_le_pci_dma(pci, sgaddr, MEMTXATTRS_U=
NSPECIFIED);
> > ++        ldl_le_pci_dma(pci, sgaddr, &flags_and_length, MEMTXATTRS_UNS=
PECIFIED);
> > +         len =3D flags_and_length & MPI_SGE_LENGTH_MASK;
> > +         if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
> > +             !=3D MPI_SGE_FLAGS_SIMPLE_ELEMENT ||
> > +@@ -235,8 +241,8 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSAS=
Request *req, hwaddr addr)
> > +                 break;
> > +             }
> > +
> > +-            flags_and_length =3D ldl_le_pci_dma(pci, next_chain_addr,
> > +-                                              MEMTXATTRS_UNSPECIFIED)=
;
> > ++            ldl_le_pci_dma(pci, next_chain_addr, &flags_and_length,
> > ++                           MEMTXATTRS_UNSPECIFIED);
> > +             if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
> > +                 !=3D MPI_SGE_FLAGS_CHAIN_ELEMENT) {
> > +                 return MPI_IOCSTATUS_INVALID_SGL;
> > +diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
> > +index 33e16f9..4d9969f 100644
> > +--- a/hw/scsi/vmw_pvscsi.c
> > ++++ b/hw/scsi/vmw_pvscsi.c
> > +@@ -50,10 +50,10 @@
> > + #define PVSCSI_MAX_CMD_DATA_WORDS \
> > +     (sizeof(PVSCSICmdDescSetupRings)/sizeof(uint32_t))
> > +
> > +-#define RS_GET_FIELD(m, field) \
> > +-    (ldl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj,=
 \
> > ++#define RS_GET_FIELD(pval, m, field) \
> > ++    ldl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, =
\
> > +                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field=
), \
> > +-                 MEMTXATTRS_UNSPECIFIED))
> > ++                 pval, MEMTXATTRS_UNSPECIFIED)
> > + #define RS_SET_FIELD(m, field, val) \
> > +     (stl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj,=
 \
> > +                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field=
), val, \
> > +@@ -249,10 +249,11 @@ pvscsi_ring_cleanup(PVSCSIRingInfo *mgr)
> > + static hwaddr
> > + pvscsi_ring_pop_req_descr(PVSCSIRingInfo *mgr)
> > + {
> > +-    uint32_t ready_ptr =3D RS_GET_FIELD(mgr, reqProdIdx);
> > ++    uint32_t ready_ptr;
> > +     uint32_t ring_size =3D PVSCSI_MAX_NUM_PAGES_REQ_RING
> > +                             * PVSCSI_MAX_NUM_REQ_ENTRIES_PER_PAGE;
> > +
> > ++    RS_GET_FIELD(&ready_ptr, mgr, reqProdIdx);
> > +     if (ready_ptr !=3D mgr->consumed_ptr
> > +         && ready_ptr - mgr->consumed_ptr < ring_size) {
> > +         uint32_t next_ready_ptr =3D
> > +@@ -323,8 +324,11 @@ pvscsi_ring_flush_cmp(PVSCSIRingInfo *mgr)
> > + static bool
> > + pvscsi_ring_msg_has_room(PVSCSIRingInfo *mgr)
> > + {
> > +-    uint32_t prodIdx =3D RS_GET_FIELD(mgr, msgProdIdx);
> > +-    uint32_t consIdx =3D RS_GET_FIELD(mgr, msgConsIdx);
> > ++    uint32_t prodIdx;
> > ++    uint32_t consIdx;
> > ++
> > ++    RS_GET_FIELD(&prodIdx, mgr, msgProdIdx);
> > ++    RS_GET_FIELD(&consIdx, mgr, msgConsIdx);
> > +
> > +     return (prodIdx - consIdx) < (mgr->msg_len_mask + 1);
> > + }
> > +diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > +index c90cecc..5b36334 100644
> > +--- a/include/hw/pci/pci.h
> > ++++ b/include/hw/pci/pci.h
> > +@@ -850,15 +850,14 @@ static inline MemTxResult pci_dma_write(PCIDevic=
e *dev, dma_addr_t addr,
> > +                       DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFI=
ED);
> > + }
> > +
> > +-#define PCI_DMA_DEFINE_LDST(_l, _s, _bits)                           =
   \
> > +-    static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,   =
   \
> > +-                                                   dma_addr_t addr, \
> > +-                                                   MemTxAttrs attrs) =
\
> > +-    {                                                                =
   \
> > +-        uint##_bits##_t val; \
> > +-        ld##_l##_dma(pci_get_address_space(dev), addr, &val, attrs); =
\
> > +-        return val; \
> > +-    }                                                                =
   \
> > ++#define PCI_DMA_DEFINE_LDST(_l, _s, _bits) \
> > ++    static inline MemTxResult ld##_l##_pci_dma(PCIDevice *dev, \
> > ++                                               dma_addr_t addr, \
> > ++                                               uint##_bits##_t *val, =
\
> > ++                                               MemTxAttrs attrs) \
> > ++    { \
> > ++        return ld##_l##_dma(pci_get_address_space(dev), addr, val, at=
trs); \
> > ++    } \
> > +     static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
> > +                                                dma_addr_t addr, \
> > +                                                uint##_bits##_t val, \
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3611_1.patch b/me=
ta/recipes-devtools/qemu/qemu/CVE-2021-3611_1.patch
> > new file mode 100644
> > index 0000000000..dc7990d1b7
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3611_1.patch
> > @@ -0,0 +1,74 @@
> > +From be5a8cf347d0c47ee3e933dde075526fd8bd5c40 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Sat, 18 Dec 2021 17:09:10 +0100
> > +Subject: [PATCH] hw/audio/intel-hda: Do not ignore DMA overrun errors
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Per the "High Definition Audio Specification" manual (rev. 1.0a),
> > +section "3.3.30 Offset 5Dh: RIRBSTS - RIRB Status":
> > +
> > +  Response Overrun Interrupt Status (RIRBOIS):
> > +
> > +  Hardware sets this bit to a 1 when an overrun occurs in the RIRB.
> > +  An interrupt may be generated if the Response Overrun Interrupt
> > +  Control bit is set.
> > +
> > +  This bit will be set if the RIRB DMA engine is not able to write
> > +  the incoming responses to memory before additional incoming
> > +  responses overrun the internal FIFO.
> > +
> > +  When hardware detects an overrun, it will drop the responses which
> > +  overrun the buffer and set the RIRBOIS status bit to indicate the
> > +  error condition. Optionally, if the RIRBOIC is set, the hardware
> > +  will also generate an error to alert software to the problem.
> > +
> > +QEMU emulates the DMA engine with the stl_le_pci_dma() calls. This
> > +function returns a MemTxResult indicating whether the DMA access
> > +was successful.
> > +Handle any MemTxResult error as "DMA engine is not able to write the
> > +incoming responses to memory" and raise the Overrun Interrupt flag
> > +when this case occurs.
> > +
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dpatch%3Bh%3Db=
e5a8cf347d0c47ee3e933dde075526fd8bd5c40&amp;data=3D05%7C01%7CBhabu.Bindu%40=
kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff6150285=
5c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D7EJxhzJ87Hgd3G3OGy9AVenjVg8rPY5boJAtZVPpuXs%3D&amp;reserved=3D0]
> > +
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Message-Id: <20211218160912.1591633-2-philmd@redhat.com>
> > +Signed-off-by: Thomas Huth <thuth@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/audio/intel-hda.c | 9 +++++++--
> > + 1 file changed, 7 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
> > +index 5f8a878..47a36ac 100644
> > +--- a/hw/audio/intel-hda.c
> > ++++ b/hw/audio/intel-hda.c
> > +@@ -350,6 +350,7 @@ static void intel_hda_response(HDACodecDevice *dev=
, bool solicited, uint32_t res
> > +     IntelHDAState *d =3D container_of(bus, IntelHDAState, codecs);
> > +     hwaddr addr;
> > +     uint32_t wp, ex;
> > ++    MemTxResult res =3D MEMTX_OK;
> > +
> > +     if (d->ics & ICH6_IRS_BUSY) {
> > +         dprint(d, 2, "%s: [irr] response 0x%x, cad 0x%x\n",
> > +@@ -368,8 +369,12 @@ static void intel_hda_response(HDACodecDevice *de=
v, bool solicited, uint32_t res
> > +     ex =3D (solicited ? 0 : (1 << 4)) | dev->cad;
> > +     wp =3D (d->rirb_wp + 1) & 0xff;
> > +     addr =3D intel_hda_addr(d->rirb_lbase, d->rirb_ubase);
> > +-    stl_le_pci_dma(&d->pci, addr + 8 * wp, response, attrs);
> > +-    stl_le_pci_dma(&d->pci, addr + 8 * wp + 4, ex, attrs);
> > ++    res |=3D stl_le_pci_dma(&d->pci, addr + 8 * wp, response, attrs);
> > ++    res |=3D stl_le_pci_dma(&d->pci, addr + 8 * wp + 4, ex, attrs);
> > ++    if (res !=3D MEMTX_OK && (d->rirb_ctl & ICH6_RBCTL_OVERRUN_EN)) {
> > ++        d->rirb_sts |=3D ICH6_RBSTS_OVERRUN;
> > ++        intel_hda_update_irq(d);
> > ++    }
> > +     d->rirb_wp =3D wp;
> > +
> > +     dprint(d, 2, "%s: [wp 0x%x] response 0x%x, extra 0x%x\n",
> > +--
> > +1.8.3.1
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3611_2.patch b/me=
ta/recipes-devtools/qemu/qemu/CVE-2021-3611_2.patch
> > new file mode 100644
> > index 0000000000..b79fadf3f6
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3611_2.patch
> > @@ -0,0 +1,43 @@
> > +From 79fa99831debc9782087e834382c577215f2f511 Mon Sep 17 00:00:00 2001
> > +From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
> > +Date: Sat, 18 Dec 2021 17:09:11 +0100
> > +Subject: [PATCH] hw/audio/intel-hda: Restrict DMA engine to memories (=
not MMIO
> > + devices)
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3Dutf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Issue #542 reports a reentrancy problem when the DMA engine accesses
> > +the HDA controller I/O registers. Fix by restricting the DMA engine
> > +to memories regions (forbidding MMIO devices such the HDA controller).
> > +
> > +Reported-by: OSS-Fuzz (Issue 28435)
> > +Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > +Signed-off-by: Philippe Mathieu-Daud=E8=83=92=E6=BC=8F <philmd@redhat.=
com>
> > +Reviewed-by: Thomas Huth <thuth@redhat.com>
> > +Resolves: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fgitlab.com%2Fqemu-project%2Fqemu%2F-%2Fissues%2F542&amp;data=3D05%7=
C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb=
46e4a26a242ff61502855c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000=
%7C%7C%7C&amp;sdata=3DLUSMR4n%2BOeB8wt%2BQRPp1q6b5W7GTToMZOsV9FEeA7Fg%3D&am=
p;reserved=3D0
> > +CVE: CVE-2021-3611
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgit.qemu.org%2F%3Fp%3Dqemu.git%3Ba%3Dpatch%3Bh%3D7=
9fa99831debc9782087e834382c577215f2f511&amp;data=3D05%7C01%7CBhabu.Bindu%40=
kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C3539451eb46e4a26a242ff6150285=
5c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3Ds79ZTxq17glcBd20Nnc%2FLvZNUk2BOlU9nUYAWf54f%2BQ%3D&amp;reserved=3D0]
> > +
> > +Message-Id: <20211218160912.1591633-3-philmd@redhat.com>
> > +Signed-off-by: Thomas Huth <thuth@redhat.com>
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +---
> > + hw/audio/intel-hda.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
> > +index 47a36ac..78a47bc 100644
> > +--- a/hw/audio/intel-hda.c
> > ++++ b/hw/audio/intel-hda.c
> > +@@ -345,7 +345,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
> > +
> > + static void intel_hda_response(HDACodecDevice *dev, bool solicited, u=
int32_t response)
> > + {
> > +-    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > ++    const MemTxAttrs attrs =3D { .memory =3D true };
> > +     HDACodecBus *bus =3D HDA_BUS(dev->qdev.parent_bus);
> > +     IntelHDAState *d =3D container_of(bus, IntelHDAState, codecs);
> > +     hwaddr addr;
> > +--
> > +1.8.3.1
> > --
> > 2.17.1
> >
> > This message contains information that may be privileged or confidentia=
l and is the property of the KPIT Technologies Ltd. It is intended only for=
 the person to whom it is addressed. If you are not the intended recipient,=
 you are not authorized to read, print, retain copy, disseminate, distribut=
e, or use this message or any part thereof. If you receive this message in =
error, please notify the sender immediately and delete all copies of this m=
essage. KPIT Technologies Ltd. does not accept any liability for virus infe=
cted mails.
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#170939): https://apc01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2F=
message%2F170939&amp;data=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e47=
45ccaa0808da9bf71124%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637993782=
811585354%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DdZPFWxpA4wylsnDj9kqD5=
DUNYjRGNM4%2B%2FLvJQzJrXjc%3D&amp;reserved=3D0
> > Mute This Topic: https://apc01.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Flists.openembedded.org%2Fmt%2F93822140%2F3620601&amp;data=3D0=
5%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C353945=
1eb46e4a26a242ff61502855c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3=
000%7C%7C%7C&amp;sdata=3D1SrmQutNAK7O%2FHEMRKBZ39af9EJ6LrduwEBoNI4obuA%3D&a=
mp;reserved=3D0
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=
=3D05%7C01%7CBhabu.Bindu%40kpit.com%7C286cadd03e4745ccaa0808da9bf71124%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637993782811585354%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000%7C%7C%7C&amp;sdata=3Dvy5qfcfJWY7wh6pknK1TzVwLauX74ifgqSnW6yprNfk%3D=
&amp;reserved=3D0 [steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.

