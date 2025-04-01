Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B92C36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 08:07:10 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.13932.1743494827190145868
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 01:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kQpsM5n5;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so41149596d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 01:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743494826; x=1744099626; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umRY7LmsKUFByrzneSxXc3Sjsvd2DpCiHa/x1+8B/7k=;
        b=kQpsM5n5oibjQD5nvmHeRD0z8qmC5OQXeU8ylsbBn8VbwnjidTpsuLFOBueHqIq2jH
         1ry8BOuiztCwHwGr5qQvagfRtEO5T4NGeprZpwMhep9bilvk5T2vyoY5tZVUr3qRs12i
         VHLLQ7/4fNuf9n4ze9LQi2FruSUHn/xc3EJlKZ42vshk0xw/UnWxPGJWfy/KBLe5thfz
         kB7Wgoy3hsgMjsrIHZUKkCyYx0jmHoeyBj/H+YTX8mzL7g/Q3afLelxX1YwCxq98DuYV
         bQ1H58orVU4fP5Vpei+LnMnYjSGL7WYEERme2qnCpnuhptpJhHoOLzF7o2UB69yZiw89
         Hjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743494826; x=1744099626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umRY7LmsKUFByrzneSxXc3Sjsvd2DpCiHa/x1+8B/7k=;
        b=ky/bJGVNKf8t1xqjaYIIOLWUjVWGza8CZjmEin3rSy9zT8dOece7HuiF3vkfr62HPF
         Bhxym1ksZ1exShkZwObN3me8f2CQIlAGauj4IhlGlwGJGBLFs5fZ1KgRPD0bVf2r3ie8
         b+LNHeM4qe/iRBfFVIDxfkuLfvUhLiEdDExDk0zZYDTUoXqVCluzrqDocXyuq0YtqM4l
         NtFP7IUxd3AMa30wyXesaoM8fNIbg9jwGo13EDtjPAYFQwxlKYGhHZg54FZjF1egsiw7
         fQpvbg5e+lXCCsEJx18+5NwiKhXcyYGSt5TvwXsoov4ghAqEL0j9gNDnl00sxRk0sU7U
         2Asw==
X-Forwarded-Encrypted: i=1; AJvYcCW1XcRw3dXFL7bU5qQxi3ltGksNeDzs/xnkk9ATQUvcqG20meqPpKFgI0FxUHQ9ep7ZiaDsZ8NzEl9feCiR0ftBCA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwuC9vjvpjSfY/yKEEK2Nx3d6Aci32/Lj1LPObi0I+/LsytFHTA
	4/I/4EioNx3s+eWOHVqRZKphx8t00sDS7HGmYszIOjFmhI9K0ovtxzWZUx2vL6MjG5TKrIHEch0
	zZVoRE9r2TsX67jkDQqrHmzZe/90=
X-Gm-Gg: ASbGncsULfUpdXnOcUl7j05D1Ahj5N5tsmxkkern+DWMT3LFZ4EVIU1ks+Je1SzJUCw
	QRtDTSpXFnNYhE0YeDXqCFYUvkxDOfMygkoPipZP/47TfaJ6XDF3uOkZ6Q0nwm3NwLdN95ZDVWU
	ciQlgorqrBcUgWFnu1itMLXSX2xa6OndaBCm9YrKUFVyKuSW/SZM2s1zuvFZUk
X-Google-Smtp-Source: AGHT+IHvJFsROiXuFVJikklWHfldmT1QhJlhBWsHnWiCyov5NOlPha+bErCKFlW4MG15PLNcpqdZvxfqxl4QfLfz5sU=
X-Received: by 2002:a05:6214:f6c:b0:6e8:8d15:2d3d with SMTP id
 6a1803df08f44-6eef5f02499mr24955576d6.40.1743494826144; Tue, 01 Apr 2025
 01:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com> <D8V4RQR2X3EF.46ET3A2PKUAL@bootlin.com>
In-Reply-To: <D8V4RQR2X3EF.46ET3A2PKUAL@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Apr 2025 10:06:54 +0200
X-Gm-Features: AQ5f1JoFHy0VGf7pdBA10YL0jazkcU0PpE3JOltJ_43b3LqtjWenYAR3rbWr4D4
Message-ID: <CANNYZj_YY8mx+KBYZziPZFPUN_LzKSLdHzGqX35uZXuetqQ=ZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 0/9] mesa: upgrade to 25.0.2
To: mathieu.dubois-briand@bootlin.com
Cc: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 08:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214007

On Tue, 1 Apr 2025 at 09:40, Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> wrote:
> It looks like we still have issues on the autobuilder, now during
> oe-selftests. I truncated a bit the logs below.
>
> ERROR: mesa-native-2_25.0.2-r0 do_compile: Execution of '/srv/pokybuild/y=
octo-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-linux/m=
esa-native/25.0.2/temp/run.do_compile.506477' failed with exit code 1
> ...
> | FAILED: src/intel/shaders/intel_gfx80_shaders.spv
> | /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp=
/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/clc/mesa_clc ../me=
sa-25.0.2/src/intel/shaders/libintel_shaders.h ../mesa-25.0.2/src/intel/sha=
ders/generate.cl ../mesa-25.0.2/src/intel/shaders/generate_draws.cl ../mesa=
-25.0.2/src/intel/shaders/generate_draws_iris.cl ../mesa-25.0.2/src/intel/s=
haders/query_copy.cl ../mesa-25.0.2/src/intel/shaders/util.cl -o src/intel/=
shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1 -DGFX_VERx10=3D80 -I/srv/po=
kybuild/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_6=
4-linux/mesa-native/25.0.2/mesa-25.0.2/src/intel/shaders/. -I/srv/pokybuild=
/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-linux=
/mesa-native/25.0.2/mesa-25.0.2/src/compiler/libcl -I/srv/pokybuild/yocto-w=
orker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-linux/mesa-na=
tive/25.0.2/mesa-25.0.2/src -I/srv/pokybuild/yocto-worker/oe-selftest-debia=
n/build/build-st-53842/tmp/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2=
/src/intel -I/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-=
53842/tmp/work/x86_64-linux/mesa-native/25.0.2/build/src/intel -I/srv/pokyb=
uild/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-l=
inux/mesa-native/25.0.2/mesa-25.0.2/src/intel/genxml
> | /bin/sh: 1: /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-=
st-53842/tmp/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/clc/me=
sa_clc: not found

The particular failing selftests are:

2025-03-31 21:57:27,426 - oe-selftest - INFO - RESULTS -
runtime_test.TestImage.test_testimage_virgl_headless: FAILED (348.30s)
2025-03-31 21:57:27,426 - oe-selftest - INFO - RESULTS -
sstatetests.SStateHashSameSigs.test_sstate_32_64_same_hash: FAILED
(88.63s)
2025-03-31 21:57:27,426 - oe-selftest - INFO - RESULTS -
sstatetests.SStateHashSameSigs.test_sstate_sdk_arch_same_hash: FAILED
(102.40s)

On Fedora mesa-native seems to build ok in the virgl_headless test,
but then there's a different error:

runqemu - ERROR - Failed to run qemu: MESA-LOADER: failed to open dri:
/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/x86_64-linux/me=
sa-native/25.0.2/recipe-sysroot-native/usr/lib/gbm/dri_gbm.so:
cannot open shared object file: No such file or directory (search
paths /srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/x86_64-li=
nux/mesa-native/25.0.2/recipe-sysroot-native/usr/lib/gbm,
suffix _gbm)

Alex

