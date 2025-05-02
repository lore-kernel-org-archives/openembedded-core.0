Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0417BC3ABAC
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 20:23:13 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.9.1746217382813104122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 13:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c3wRIe40;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6065251725bso1471104eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 13:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746217382; x=1746822182; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUnpDxjNdpbP1cPHOrNezSJWjwNx80aTQOeIA3o/C7c=;
        b=c3wRIe40sFVpHhws7MF79hob3QgWY0FRJMpSoRxDfe/fErVHFFWO0dH2eomqENE6xm
         Mcxk8rgJV13qW7ADiTkYmBeMvOAbpT6kTrCV4/LgxUvMAlvusRr1LurPqglo+Bi+0eRp
         lNBFDlMfdQ//nV9F564ZCfbsSi7pUOKnpAQYQXNOCasEgcDrO71fNL2+AQewoEuLwzmF
         JjtEpQ2mKpcdb/t5xrdzx8xQb+TtIsSLVgHEVQPAvqLvnzoiCIWwMzQlTnct7vNTJkVC
         5wmx+vcVqlQLqDRDQ+pOIFRgPPzX4enGv2cpg/IZVaiyqPo4WbwRD8EjjL3R6EOcValo
         B43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746217382; x=1746822182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUnpDxjNdpbP1cPHOrNezSJWjwNx80aTQOeIA3o/C7c=;
        b=DzOvESrRqa0I+O3IOCg6dT+K9b8wk/eOHXFA1hqfkMOKwQbWouoh/z2gbDQCjdARkc
         kMun3+hjt02P4u1BT1qTktEjsKyxo5PPHNRYth4yEx4bJaZgMBYmWZcW6iqV5kN+PKQn
         7DjZ57zVb0Px57ggWOM+c3e3RK/P1apT1ca4OKGbsyR9wOLhD6TGRq/oii8NuWJt27RS
         KzzAOW7IwXg4W8k/QaiNvMHNxV5oSY+Nf6EzkSrpYbs9QV3SMw41+c0w5ndDGquZnaH4
         J7NAJwTsqHpxo6F4XP2mYC5WY+M2WlOXs1aF5jSRKoXBAya8W55Se8pvVCJHrD5c99h5
         Z+Zw==
X-Gm-Message-State: AOJu0Yy69nmGD/osZi1vl5ghLRwrIfT5jfNElt8Us2PysiQ/1vsbZ+pC
	glQIN8WqlXfOrTg3d6U2+IvkuHB9XkmhhiQDRVr2pkB4rqxsvxdZUdxnfcYtJRaW6vzsZGLG0sw
	tCwv8HhfkAmFAx7A79LcJpLjCJsD3BFBp
X-Gm-Gg: ASbGncs9F6X7CqYoQL0cZGHx/crabUjegFJuqeROfQEBD4OlHHFngzv6Hbtjn2o7AFd
	qnM4h5FxHYqb4Yg8LgmRUYpEQKk4KJuiyeqRLXTKygvkBvsJv+jwec7qoi5kCGaZxW0KSBXS5Vd
	AhJiOS/VgB+U0EGXHvY/pa
X-Google-Smtp-Source: AGHT+IG2E4afDXOT3rfNrQhj1XHPYumC134V6EzOcQ9EK4/HKEN3ri6qZMdmZL9O8hU2j8PWiezbNk4nQRlFofErhIw=
X-Received: by 2002:a05:6820:1f11:b0:606:6384:555c with SMTP id
 006d021491bc7-607ee86f612mr1965407eaf.8.1746217382019; Fri, 02 May 2025
 13:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com>
 <20250502-clang-merge-v6-3-00f2c2e9ff68@gmail.com> <coea7eqq4tekzubxffzhyom5vbhfl3fhh4fv25eht2inzpg2mn@nkb7tzza3fn3>
In-Reply-To: <coea7eqq4tekzubxffzhyom5vbhfl3fhh4fv25eht2inzpg2mn@nkb7tzza3fn3>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 May 2025 13:22:36 -0700
X-Gm-Features: ATxdqUG7VZxz50Rzo97vv2OIKoDYfNAxiJNdp1mduVu4bF-w1HYAUOmV4hZFa5M
Message-ID: <CAMKF1srM8uU=J58o6cGzuoaDhk-dVfrCPCOZ0egRaxa6Yn_-ng@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] mesa: Pass needed clang flags via BINDGEN_EXTRA_CLANG_ARGS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 20:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215921

On Fri, May 2, 2025 at 1:19=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, May 02, 2025 at 09:55:17AM -0700, Khem Raj wrote:
> > This is needed for clang to find the c++ headers when invoked via
> > bindgen
> >
> > Fixes
> > | /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/me=
sa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal e=
rror: 'cassert' file not found
> > | Unable to generate bindings: clang diagnosed error: /mnt/b/yoe/master=
/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroo=
t/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file no=
t found
> > |
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  meta/recipes-graphics/mesa/mesa.inc | 4 ++++
> >  1 file changed, 4 insertions(+)
>
> I still think that the attached patch is a proper solution.

I have apprehensions about doing it meson wide, while the need is just
for mesa and mesa
happens to use meson, its not other way around. So tooling a solution
for all meson packages
is sub-optimal here, unless we start getting many other meson packages
needing bindgen
I hope you understand.

>
> --
> With best wishes
> Dmitry

