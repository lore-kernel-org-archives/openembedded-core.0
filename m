Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9371ACED26B
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 10:03:19 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9061.1763460195134091226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 02:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IC22n//H;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-3d18422565eso3598794fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 02:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763460194; x=1764064994; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWeDzvRhq9c/Dw89D2c7zdFIKebdonH3v5puZQr8BHo=;
        b=IC22n//HyNwWmCJhpUiYAEOXezEIFMNZmNfpm1GmsNkDfhduMTs5JJuQQ+JktXLIbv
         dJWRkOgeTB25e0n/2MIiBPalmXTyJnm9ouwHfg3/o3PAk1WsytNeu3MVHq0FD3eD97Hh
         wDqBBHvN3aQUigH0/NCC+Sh90IyATJnhRYpGzCzC7LgD9hVCThWWZKPGgOQ7+WQGCW3R
         cxvAOWGHSz/aRD4qv0742GqmbNuAXnmNYM9fErFcNt384LECeg7bj+7wR3pq6v88NzUP
         UozVSf3S/qXybMZ4O2yw5grp/Z+XUQU7AaZYMqZ1z9Pcyrnhetbb+7Czfruzzvj7rRVN
         cjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460194; x=1764064994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWeDzvRhq9c/Dw89D2c7zdFIKebdonH3v5puZQr8BHo=;
        b=rk9cYJ/tOdLH7KtMZDOHn1PobaddTPMbN6GCrgU+X+ydXf7Q8gNKnn6GIyqBTs49NB
         ewJzAhVYGh8CMfNeGl1Xkphyi5thjpRJ3h21UPYjSk3+4LiepA6Ktw4y5FN7Lv3ZTlkG
         VyrI5Yh0F+OFlPaOc7+HnWtkmPf35hC4p9NR+5cRsHZljNPuFAyr3WU1J/JhRAK7/oCa
         tVHku18TA0jtoY6AfBj5rYdUFkLmiT9yv3m0JJErWYHHy5bKexGkRetc2umGUFAVKirz
         +L/3RgMo75X+pUnPGeosJBIqMPSHkp0DiApgtKC0VZ7kV8QeAX3zUgDgi6zlV/pizUdl
         nBRQ==
X-Gm-Message-State: AOJu0YxL/iNJgaieHcfl9x0EeJWaLFJSzPdOWLR2McAyuFbbfkNpBu+l
	yAi9ThKH4MpWIubUQE3A1apGNgn/xC6gEbNQWfLcOAcK85ourJus4t4R60y+ju/MCn29lhTFMIc
	641fIbH09vZH3dEgwXvISmKnJAOzd9B5eWw==
X-Gm-Gg: ASbGncsoJmzfXCwpaeX1bUNMbQMF87HIjbHiQGj96/vRbuM1IbM+ezVZHvK+6nWKMew
	hdsXk+Ol9FjBjSU2Xog1felHD69FrdixdDrUeNAwzOzGC6SaVn7t4BewuIQ4s/FoQMjQPq0S3ni
	Xr4nwHmpn93N8MzlWE5AfWcBNIjag5kmuCyHssjbkmnonwUVDasNVCYyGUz9R3tV57OKAes9xoF
	pMD8MTdN6cdIWUcqLnW96Diz8DuytIfQ3liBim0sH3czEglaeW0s1qMfZD5vxxP9Yx9Vxgw/Q==
X-Google-Smtp-Source: AGHT+IEmn4pI22P1qcNt8oea6nQBezgYOGx7bWONjr0yLY4NTeW7cyQPLcyhMRbFI5hCEfZpsIp9RG1adaDEAjvO5GQ=
X-Received: by 2002:a05:6870:2312:b0:31d:736d:ebdd with SMTP id
 586e51a60fabf-3e868f64cddmr6663456fac.13.1763460194233; Tue, 18 Nov 2025
 02:03:14 -0800 (PST)
MIME-Version: 1.0
References: <20251118041407.1024915-1-ankur.tyagi85@gmail.com> <DEBPZJ45X6YS.GBKWF9SBJFS0@bootlin.com>
In-Reply-To: <DEBPZJ45X6YS.GBKWF9SBJFS0@bootlin.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 18 Nov 2025 23:03:03 +1300
X-Gm-Features: AWmQ_bnf735GRNoB70xDJdkopo9DZtHGSOfc8uGJGw2MvvX_zhSLfenAsEnq0EM
Message-ID: <CADySD0HcnOvcC-FeNDeOBgF1NT78oeAZYYd1qT1umzuL5vUN_Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] nasm: upgrade 2.16.03 -> 3.01
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 10:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226517

On Tue, Nov 18, 2025 at 10:40=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Tue Nov 18, 2025 at 5:14 AM CET, Ankur Tyagi via lists.openembedded.or=
g wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > License-Update: Copyright year updated to 2025 and upstream replaced ve=
rbose copyright headers with SPDX tags
> >
> > Refreshed patches for the new version.
> >
> > Release Note:
> > https://www.nasm.us/docs/3.01/nasmac.html
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
>
> Hi Ankur,
>
> You are talking about license update, but I don't see the change in the
> recipe. Is it missing?
>

Sorry, I missed that change. Sent v2 which should fix the error.

> Anyway, it is failing to build on the autobuilder:
>
> ERROR: nasm-native-3.01-r0 do_populate_lic: QA Issue: nasm-native: The LI=
C_FILES_CHKSUM does not match for file://LICENSE;md5=3D90904486f8fbf1861cf4=
2752e1a39efe
> nasm-native: The new md5 checksum is 6178dc4f5355e40552448080e67a214b
> nasm-native: Here is the selected license text:
> vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
> NASM is now licensed under the 2-clause BSD license, also known as the
> simplified BSD license.
>
> SPDX-License-Identifier: BSD-2-Clause
>
>     Copyright 1996-2025 the NASM Authors - All rights reserved.
>
>     Redistribution and use in source and binary forms, with or without
>     modification, are permitted provided that the following
>     conditions are met:
> ...
>       MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
>       DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
>       CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
>       SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
>       NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
>       LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
>       HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
>       CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
>       OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
>       EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> nasm-native: Check if the license information has changed in /srv/pokybui=
ld/yocto-worker/qemux86-alt/build/build/tmp/work/x86_64-linux/nasm-native/3=
.01/sources/nasm-3.01/LICENSE to verify that the LICENSE value "BSD-2-Claus=
e" remains valid [license-checksum]
> ERROR: nasm-native-3.01-r0 do_populate_lic: Fatal QA errors were found, f=
ailing task.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2710
>
> Can you fix it?
>
> Thanks,
> Mathieu
>
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

