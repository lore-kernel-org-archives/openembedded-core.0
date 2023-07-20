Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0713DEB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 18:44:54 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.1256.1689878688046743728
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 11:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=G0Sb67c8;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso1806962e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689878686; x=1690483486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71oz2YIoYBrOKDB03xYm5shnOM/gqhKTIAhq/qncm6g=;
        b=G0Sb67c8OxqmjERRW60jhMPChD+c0gisJ1wd9MbPlx3uqf7F//mOQVD2IdMJCmiFIe
         bGUUgeiJfU1ojiwhDYXKetVickv/zDrhACmeUXe9p4qYb1KZEBoElsZK2+Hd1mFfTVhK
         +muwP0J7X4yxUU8Q/8iAUGrvrLb1rM8wE3IhooFsiIXVAO/wbOpGXzKoaBbhNzeZYjvE
         HW+4e0GiQkDDO1b+mPizEyvTPH+NY1hY7IeBqSMWupjBYGbP8s0x0Jas5wkm927ixI7m
         2pSVHuyw/J4TTWHwV+D6exbQ3BLpEo4u1SCJ983hqPZbgWEs5H717mbfgDnX9lVs0JYn
         qgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689878686; x=1690483486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71oz2YIoYBrOKDB03xYm5shnOM/gqhKTIAhq/qncm6g=;
        b=F6C7gqWxogUudOjjIlZr577MfMa0ncr/tBcrbVTpPUu/CIt0WFeK6gr8m9R9OUFQDk
         m60g3WKCbaAm19HYxIlHzl3+RVZzKtON2h0s729TmjBWIyBJxCxukZ7zfLn0mlNS5R0M
         h3x1bpAFCNDeDoFhZDDdZ+uCeOEihxPVYqeuIitQQUJhD2Jd5zPkwSh5vNR8UqzFXgpv
         UXQMrFsruzqFUdvP4xwzRqoAB5FKUx/6DZXWWjkB1exvWE6c6unPq7OWHPS8YsKHgLCS
         JnWbNs1AUsOwi9tDUt4m3OMfkFd9b4o5rm1V7rX0odgtKEBY2PFBXM0nE/VGdYaknoNe
         N9Cg==
X-Gm-Message-State: ABy/qLbbXa44A+uPLKp4kHpZQwnb32NbnP7zRB3ofT1dwdl0NLUxUBdU
	l2eoc1ViNPHDA4RA2k77G58d6wQ7E2v6Wu5rROg=
X-Google-Smtp-Source: APBJJlEbOiQw0LZvdnOtqrdzGBNbD93LKKVqB4rQIwb4/nB/LWbf0HnbsLbNCN2jou8+lZOBQEbYtL8yLMxGYRT0+8s=
X-Received: by 2002:a05:6512:3c87:b0:4fd:c715:5667 with SMTP id
 h7-20020a0565123c8700b004fdc7155667mr2531335lfv.20.1689878685946; Thu, 20 Jul
 2023 11:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230720133655.1266273-1-r.czerwinski@pengutronix.de>
In-Reply-To: <20230720133655.1266273-1-r.czerwinski@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Jul 2023 20:44:34 +0200
Message-ID: <CANNYZj8jB0bA3eQs2ULb40Ox1q2NE_W4LOs8Ch0HVOWS6fhF2g@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH] json-c: disable -Werror for x86-64
To: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, 
	Rouven Czerwinski <rcz@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 18:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184653

This needs to be reported upstream and the ticket linked (ideally,
develop a patch to fix the issue). The tweak needs to be :class-native
only.

Alex

On Thu, 20 Jul 2023 at 15:37, Rouven Czerwinski
<r.czerwinski@pengutronix.de> wrote:
>
> From: Rouven Czerwinski <rcz@pengutronix.de>
>
> Disable -Werror using OECMAKE_C_FLAGS on x86-64. This ensures that json-c=
 can
> build on newer distributions where the host compiler is new enough to tre=
at
> implicit fallthrough warnings as errors:
>   | NOTE: VERBOSE=3D1 cmake --build /=E2=80=A6/work/x86_64-linux/json-c-n=
ative/0.15-r0/build --target all --
>   | [1/34] /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/recipe-sysr=
oot-native/usr/bin/ice/gcc -D_GNU_SOURCE -Djson_c_EXPORTS -I/=E2=80=A6/work=
/x86_64-linux/json-c-native/0.15-r0/json-c-0.15 -I/=E2=80=A6/work/x86_64-li=
nux/json-c-native/0.15-r0/build -isystem/=E2=80=A6/work/x86_64-linux/j
>   son-c-native/0.15-r0/recipe-sysroot-native/usr/include -O2 -pipe -ffunc=
tion-sections -fdata-sections -Werror -Wall -Wcast-qual -Wno-error=3Ddeprec=
ated-declarations -Wextra -Wwrite-strings -Wno-unused-parameter -Wstrict-pr=
ototypes -g -fPIC -D_REENTRANT -MD -MT CMakeFiles/json-c.dir/linkhash.c.o -=
MF CMakeFiles/json-c.dir/linkhash.c.o.d -o CMakeFiles/json-c.dir/linkhash.c=
.o -c /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c
>   -0.15/linkhash.c
>   | FAILED: CMakeFiles/json-c.dir/linkhash.c.o
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/recipe-sysroot-nat=
ive/usr/bin/ice/gcc -D_GNU_SOURCE -Djson_c_EXPORTS -I/=E2=80=A6/work/x86_64=
-linux/json-c-native/0.15-r0/json-c-0.15 -I/=E2=80=A6/work/x86_64-linux/jso=
n-c-native/0.15-r0/build -isystem/=E2=80=A6/work/x86_64-linux/json-c-n
>   ative/0.15-r0/recipe-sysroot-native/usr/include -O2 -pipe -ffunction-se=
ctions -fdata-sections -Werror -Wall -Wcast-qual -Wno-error=3Ddeprecated-de=
clarations -Wextra -Wwrite-strings -Wno-unused-parameter -Wstrict-prototype=
s -g -fPIC -D_REENTRANT -MD -MT CMakeFiles/json-c.dir/linkhash.c.o -MF CMak=
eFiles/json-c.dir/linkhash.c.o.d -o CMakeFiles/json-c.dir/linkhash.c.o -c /=
=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/l
>   inkhash.c
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c: In function 'hashlittle':
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:367:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:368:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:372:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:373:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:376:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:377:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:380:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:381:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:383:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:384:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:420:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:421:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:421:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:422:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:422:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:423:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:423:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:424:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:424:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:425:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:425:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:426:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:426:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:427:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:427:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:428:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:428:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:429:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:429:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:430:3: note: here
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:430:13: error: this statement may fall through [-Werror=3Dimplicit-fal=
lthrough=3D]
>   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/linkha=
sh.c:431:3: note: here
>   | cc1: all warnings being treated as errors
>
> Passing -Wno-error x86-64 is the minimal invasive fix for older kirkstone
> releases.
>
> Signed-off-by: Rouven Czerwinski <rcz@pengutronix.de>
> ---
>  meta/recipes-devtools/json-c/json-c_0.15.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb b/meta/recipes-d=
evtools/json-c/json-c_0.15.bb
> index 7cbed55b3b..749eb078f8 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.15.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.15.bb
> @@ -18,6 +18,8 @@ RPROVIDES:${PN} =3D "libjson"
>
>  inherit cmake ptest
>
> +OECMAKE_C_FLAGS:append:x86-64 =3D " -Wno-error"
> +
>  do_install_ptest() {
>      install -d ${D}/${PTEST_PATH}/tests
>      install ${B}/tests/test* ${D}/${PTEST_PATH}/tests
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184639): https://lists.openembedded.org/g/openembedde=
d-core/message/184639
> Mute This Topic: https://lists.openembedded.org/mt/100255913/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

