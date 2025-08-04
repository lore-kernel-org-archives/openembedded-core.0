Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FC2C87FDA
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 05:54:42 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.11532.1754286880199825295
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Aug 2025 22:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c5wX3tR6;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71b71a8d5f0so28088657b3.3
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 22:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754286879; x=1754891679; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVij3pB1pozLW+zAR2CAfeoh5AdY8lC5VM49+eJPdco=;
        b=c5wX3tR6zPUR1VFAgE2pGOkGaHKYybDnKmRI9+rMY7+UT0zAI69TiW+0XTM4Fzgdvi
         ZNP9T1HWLQ/YW6qLTltw/xrb8HtpAYHsdM+cJbMF9QY+YiVK8xaBuqCfP0/QSv7vJc3Q
         SoNj9CYUvmKmM6IP6t+hHWPw0z6GVoZAODC6seEwyVehSCdIa0Nv/nselvnvFFPx+OL8
         0gNZGTfHzL/Xh2kYx0TJeISPjy0u77g+gq1z/BQbgRUhsybkVJ58uM4YVitDnT+/REaK
         FGvuUkRbBA7DYsSRB1fzYZ56FexfC4t86o8A85xg4GOmuuHwTmD5xqdaicdEH96nZZG4
         KuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754286879; x=1754891679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVij3pB1pozLW+zAR2CAfeoh5AdY8lC5VM49+eJPdco=;
        b=Dh7CVstl6Oz41kUeyN5Gb3Qts8dRskvlrgLBYDKu3TCOwEXTfeaCN5xY+Fix7XhYpA
         RSbi96WT2r+eeOnTin7JgUdfd8cwNycHzbcnr2OGuus47t5SJJkyRA/AHFdFfeAKDr9x
         ERWfviih1QheLxKs+iCv6gURTm1t6CIJWLoJdXIAEV9itC85JLLG002VuB9aBQFX7yZH
         YYx4aIv2Qet2LWTnBKTFYRvO/7iF1ADboOPPBnWk6Hkz+PODGNr7x9cKN3YhYJoMPnRv
         3R6LmrKeWe7aJDKPaWuvoAi3HDB+wJJL4sTdXyLkyOEyWBmwx1gnjrPYeFJnv1zPbws6
         l69w==
X-Gm-Message-State: AOJu0YzVt5tQSgylZfAkLwIcREWp4hJVZ4CLV6sm4OmWT1QPaC9p5dzA
	ueKZ/rkoJBfFqMcTgAr95mNhdqYilxMyIjFs26FZRHiMwYCJRGFgvV6UzFZWhjMwL6zwYcHoZ4m
	rd51vUfNXE9zeRlSk94MXdQb3tnQQ4IjWaa3osMGbrw==
X-Gm-Gg: ASbGncuENmLh2UevLGpST9nC444hnL1EvGtaYXG6DjX8ODG3IhjB3I0dmyqabpVR4Nf
	TJPP7cvu7cNcKq15fu72hGBpeBa9PB5yFDL2m9LOLH2yIMxB7yGS5CjSnKHekaTRyX9sId7G5jf
	VdNXAQQexLO+xwSu+0Ylzq/nsS6lsK8SgN1vmVII6CpMXykpLNKhT2ebRjAvk+ZafnhKCFjodN8
	Yj2gIuUi6/D1p3h+zburFO7vNL7T+6/PnxNJEQ=
X-Google-Smtp-Source: AGHT+IHTilS69nctWNKCPhaXsdWYUV2flEUrTBwMdw3FXGU/fNYICg8WqKRhx2Hnq7ROD539OkGenGcsH7fncCLLZXM=
X-Received: by 2002:a05:690c:660c:b0:71a:1b78:a335 with SMTP id
 00721157ae682-71b7f5689e0mr92583887b3.42.1754286879153; Sun, 03 Aug 2025
 22:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <8b79c84e-99df-4b5b-a43a-467dc65364bc@windriver.com> <CAMKF1spU5YnX9qyG8yhs6yv+-EeczaKQy9KtkA2M+3hNVUtmXw@mail.gmail.com>
In-Reply-To: <CAMKF1spU5YnX9qyG8yhs6yv+-EeczaKQy9KtkA2M+3hNVUtmXw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Aug 2025 22:54:13 -0700
X-Gm-Features: Ac12FXwWPWXcih-oSlvPaU5knKIPTZ97D1rN1KQHHPK5USYYFbGHIf2fIOt8sXo
Message-ID: <CAMKF1sprmXPtNy1F9pEq2Aq5ALJW_0ZSQ=EGAeUX4D2SiXd2iw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Clang_Testsuite_Integration_=E2=80=93_Initial_Progress?=
	=?UTF-8?Q?_and_Next_Steps?=
To: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 05:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221416

btw take a look at https://github.com/llvm/llvm-test-suite.git as
well. it would be good to add this to test matrix once tests are
working.

On Sun, Aug 3, 2025 at 10:51=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Sun, Aug 3, 2025 at 9:53=E2=80=AFPM Sundeep KOKKONDA
> <Sundeep.Kokkonda@windriver.com> wrote:
> >
> > Hello,
> >
> > We're currently working on integrating the Clang testsuite into the Yoc=
to Project. As a first step, we've implemented an oe-selftest for clang-nat=
ive (we understand this isn't the final goal).
> >
> > The changes are available here:
> > =F0=9F=94=97 https://git.yoctoproject.org/poky-contrib/log/?h=3Dskokkon=
da/clang-native
> >
> > We are now working on enabling support for testing on target systems. B=
ased on our initial analysis:
> >
> > The lit framework used by Clang doesn't natively support SSH-based remo=
te execution, unlike DejaGnu which provides built-in support for remote tes=
ting. So, additional customization is required to enable remote test execut=
ion.
> >
> > To enable remote testing, a lit.site.cfg file must be generated and con=
figured with SSH access details and target-specific parameters.
> >
>
> This approach seems right to me. something like below might work for
> ssh'ing into target and running tests.
>
> ssh_cmd =3D f"ssh ..."
> config.substitutions.append(('%run', ssh_cmd))
>
>
> > Currently, QEMU is not launching after the build completes within oe-se=
lftest, which is a blocker we=E2=80=99re investigating.
> >
>
> like ssh case you should be able to run with
> config.substitutions.append(('%run', launch_qemu))
>
> > Once QEMU is successfully launched, we'll establish SSH connectivity an=
d begin running tests on the target. This will help identify any missing ru=
ntime dependencies or other causes of test failures.
> >
> >
> > We welcome any suggestions or guidance from the community on this appro=
ach.
> >
> >
> > Thanks,
> >
> > Sundeep KOKKONDA.

