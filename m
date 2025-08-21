Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7A6CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 05:19:28 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.2340.1755753565929693838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 22:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OIexKbrB;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e934b5476a0so609920276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755753565; x=1756358365; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohGD1QIkyv3rEkAfiBTxkkpop1HM3EecJvZsIT+3VdI=;
        b=OIexKbrBN/cG0dUFhfviIi2EObuymgoiO9aRka0LcZ6H+R/l2nF5aIK5WuBoJxslqL
         Xqy9RY4uVLYLSgjluewyhNfZDMbBS8074+eWzB25ND7iWHlnRGaKmbdKUT7fMn7c3mWe
         HllTEESBji4cLItRxQmSoVneRTuFonsUBpaSe9pLIOvLanITKDeDoDCkkOTLp4/dWkaT
         MZhRISfOFv/TIOEdUjMyzKYXnD8nZSaiMR/QPEzIxNZr9N9uc2+FILaFdooV87rBRawh
         DBW5F4fhTJAPx+i2NPILRuSjKQscBbpDP5tKcQssuTZ7u2t+8sp1uzLhnLY9EcmspZhA
         FqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755753565; x=1756358365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohGD1QIkyv3rEkAfiBTxkkpop1HM3EecJvZsIT+3VdI=;
        b=TV5to2LYUsehKi0JJWd9LgUxIIhC12TwTtFxBNFh8La4fRU/+1GtgtNJicEyv3hsse
         yuWtGxKNOzG6t3bbzerdAAEy5N5L8fZwL/L1F9MWBCxGaLmlz/4V2KV2xq6KMoSfT0rE
         UCMQNqaWgvXLk8u7NTmyz3Fc1R+mAf4QpfNcQnd3xctEAEds0EjjWasK0kTAxyMd4owD
         tQZ6QzTlnYIeyUMRrlMCbAP2HGKj2CUw6H/yQ7KvTl6slHW9M/0jZY3BYIFqXdyGyIWQ
         XLdpWKljDE9QASB3g8k9lsbLtY588JGe8M2Wd7N/qSBLUKZt26wLvIFPa5I+BjJ2R79/
         Pbjw==
X-Gm-Message-State: AOJu0YzONGxrkxBlRDMZzA4QQ15J46T/J8lTDkTTqeyuKITG1ccVztYJ
	ImwGbLZpZblLJQxjEcMGmE49zGkl7nyscEFKQuHzsx9d6txf65rlT1dE3Cl5BNkM558v6SHVGVw
	kqAw2+BYRG2PupEKngzp9C3C556bHvuE=
X-Gm-Gg: ASbGncuHr/J19PE09y5he3YRqmE2F0bhGseawf9iycgUQgrfQqSY9Umjo5bAMRQO9v3
	chihwKtY86Ihb7Oxv/0E5HntWqieuTcP2Ql4h294wx6vsp4+q9Z6cv8WXBIH4r5zPxFCnLLZUtO
	KzGxtq5/194zD/O0/zA7Amc7loikkqVAEUVlVz0XX8oygU48aKDf3wnjZ8CcJnbU2bh/Yc1WuzR
	c0eAg==
X-Google-Smtp-Source: AGHT+IGCAVtB84/zq0h5kb/DubNMHdSUo9GIRj3zHu9N04AnrX6/bi15rXJ8fu19iRCfu4WuEKg2xTCC9lPH3ZIngN4=
X-Received: by 2002:a05:6902:2d03:b0:e94:f2ff:823 with SMTP id
 3f1490d57ef6-e95088e66a8mr1317551276.5.1755753564863; Wed, 20 Aug 2025
 22:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250821032424.92606-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20250821032424.92606-1-Harish.Sadineni@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Aug 2025 22:18:57 -0700
X-Gm-Features: Ac12FXzsOBDZ2hefVw_-gPKCTRkiKJmsQ87XAgSFvUKluPz8sXVGXuvtchDgLiw
Message-ID: <CAMKF1spGpNpN+2=2Y_1N9VOk+yCGZahpZja6HJfULqC-fRB0Vg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] gcc: Oe-selftest failure analysis - fix for
 pr90579.c test failures
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 05:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222204

looks good.

On Wed, Aug 20, 2025 at 8:25=E2=80=AFPM Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> When gcc build with PIE enabled the following tests
> were getting failed:
>  FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+40
>  FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+32
>  FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+24
>  FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+16
>
> Detailed bug info & upstream fix is here:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D118885
>
> Upstream Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=3D679e=
24f5a751663998ff7202149a749e0f7251f9]
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-15.2.inc        |  1 +
>  .../gcc/gcc/0026-fix-pr90579-testcases.patch  | 20 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testca=
ses.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-15.2.inc
> index 41e4c004dd..3583e40f55 100644
> --- a/meta/recipes-devtools/gcc/gcc-15.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-15.2.inc
> @@ -71,6 +71,7 @@ SRC_URI =3D "${BASEURI} \
>             file://0023-Fix-install-path-of-linux64.h.patch \
>             file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
>             file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
> +          file://0026-fix-pr90579-testcases.patch \
>  "
>
>  UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
> diff --git a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.pat=
ch b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
> new file mode 100644
> index 0000000000..bee147abc1
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
> @@ -0,0 +1,20 @@
> +Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=3D679=
e24f5a751663998ff7202149a749e0f7251f9]
> +
> +Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> +---
> + gcc/testsuite/gcc.target/i386/pr90579.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gcc/testsuite/gcc.target/i386/pr90579.c b/gcc/testsuite/gcc=
.target/i386/pr90579.c
> +index ab48a44063c..19081ec9fdf 100644
> +--- a/gcc/testsuite/gcc.target/i386/pr90579.c
> ++++ b/gcc/testsuite/gcc.target/i386/pr90579.c
> +@@ -1,5 +1,5 @@
> + /* { dg-do compile } */
> +-/* { dg-options "-O3 -mavx2 -mfpmath=3Dsse" } */
> ++/* { dg-options "-O3 -mavx2 -mfpmath=3Dsse -fno-pie" } */
> +
> + extern double r[6];
> + extern double a[];
> +--
> +2.49.0
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222200): https://lists.openembedded.org/g/openembedde=
d-core/message/222200
> Mute This Topic: https://lists.openembedded.org/mt/114812115/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

