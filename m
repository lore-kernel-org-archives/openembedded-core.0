Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854D4CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 15:48:56 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.54974.1695052135473185169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 08:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bFtynzki;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99c136ee106so624165766b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 08:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695052134; x=1695656934; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NI5Uk87nqI96T0aSs9/F3zLWV4kN6BRGY/CH80NLQWY=;
        b=bFtynzki2xpwXhYvcfpglSqqW21Rn/1OTU1vde016k/Rr77WJ4GfVAXQTu6eVUyTFL
         ZiKshsZrnZt7gGg+cHt4tlXx5o3FnrWd0pzPiSb1Vyo5ZhJdmaDEqeEoNDAQHcFs4l3v
         ng5+rfByg6M89j3LgZXsiXsFP7+BoAwm4vf8fsqzTxlXTu4Em+UKS4ADOVXr/ZnAuisr
         jSotUQ3F15b4o6s17MoIngyj67yNs0JnDDSJlgCcOTegUCbwzzBjmCr/pd/pnkaN//YC
         C5wjpATzcZHM/f6C2lW+BLWcZNFBQ/LGVVqW430MReJbADYpyWqmwnXe7Hj20hFVClFE
         4gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052134; x=1695656934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NI5Uk87nqI96T0aSs9/F3zLWV4kN6BRGY/CH80NLQWY=;
        b=u1cnkMP8lDynxUqMh4lGpfLzu5W8LZVNHYQeJuo0vrLCgZsBPf0xulux58rJMNEYqt
         WC10BUju8ka6pGLompvJBYbmM8gwMhhpj/aOyWphatzic1FsFiJOdNayoUH+Cvs8Sf3r
         e2zvfLSbfjw7Lr1HOTwn+/HAGCxoiKSRT00zzEliC/AkkDeRi+EwQn2+Jbo3MMmpcbAZ
         1iYPmcANqdW6wtQnMWOJ0FC7Bsau2CTouapb7YgKP0cAExaLFbDKG4jya2wemE7gJP+q
         Pd9G7lJCxBADv+t3FJWJlR80EgnjcdtJf1i3uIY5a7o7KIlVOzWIg+grAei9rZa+GSuI
         zojA==
X-Gm-Message-State: AOJu0YyjrcQlkJEWEjfCgz3dppTMwUf7NrVtHMpiavoBkiSBE155agIh
	U7tEYyNq6QJiTboxPETLy85ZKP8CXtQEUIP3HyMwHw==
X-Google-Smtp-Source: AGHT+IEpZP99oBuTRvA9VM5XcDsjMuHMwgp+p3ay7zMEGvzfDxMKQXlM5Z0tJDO2ZntfckEGZygaK8mWfLqpVgxJVjQ=
X-Received: by 2002:a17:906:24b:b0:9ad:d084:a024 with SMTP id
 11-20020a170906024b00b009add084a024mr7565111ejl.35.1695052133513; Mon, 18 Sep
 2023 08:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230915204234.3547739-1-martin.jansa@gmail.com>
In-Reply-To: <20230915204234.3547739-1-martin.jansa@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 18 Sep 2023 05:48:42 -1000
Message-ID: <CAOSpxda40yQJrJCXhS-rtQ9T89auc52zwibD6qjCWYKSLZfB5g@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH] gcc: backport a fix for ICE caused
 by CVE-2023-4039.patch
To: Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 15:48:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187834

The CVE-2023-4039.patch was also submitted for kirkstone and dunfell.
Should I attempt to cherry-pick this fix for those branches too?

Steve

On Fri, Sep 15, 2023 at 10:42=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> * see:
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D111418
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D111411
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-12.3.inc        |   1 +
>  ...ch64-Fix-loose-ldpstp-check-PR111411.patch | 117 ++++++++++++++++++
>  2 files changed, 118 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-=
ldpstp-check-PR111411.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-12.3.inc b/meta/recipes-devtoo=
ls/gcc/gcc-12.3.inc
> index 5896f26e1a..5655b6f46d 100644
> --- a/meta/recipes-devtools/gcc/gcc-12.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-12.3.inc
> @@ -64,6 +64,7 @@ SRC_URI =3D "${BASEURI} \
>             file://prefix-map-realpath.patch \
>             file://hardcoded-paths.patch \
>             file://CVE-2023-4039.patch \
> +           file://0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch \
>  "
>  SRC_URI[sha256sum] =3D "949a5d4f99e786421a93b532b22ffab5578de7321369975b=
91aec97adfda8c3b"
>
> diff --git a/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-=
check-PR111411.patch b/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose=
-ldpstp-check-PR111411.patch
> new file mode 100644
> index 0000000000..a408a98698
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-check-P=
R111411.patch
> @@ -0,0 +1,117 @@
> +From adb60dc78e0da4877747f32347cee339364775be Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Fri, 15 Sep 2023 09:19:14 +0100
> +Subject: [PATCH] aarch64: Fix loose ldpstp check [PR111411]
> +
> +aarch64_operands_ok_for_ldpstp contained the code:
> +
> +  /* One of the memory accesses must be a mempair operand.
> +     If it is not the first one, they need to be swapped by the
> +     peephole.  */
> +  if (!aarch64_mem_pair_operand (mem_1, GET_MODE (mem_1))
> +       && !aarch64_mem_pair_operand (mem_2, GET_MODE (mem_2)))
> +    return false;
> +
> +But the requirement isn't just that one of the accesses must be a
> +valid mempair operand.  It's that the lower access must be, since
> +that's the access that will be used for the instruction operand.
> +
> +gcc/
> +       PR target/111411
> +       * config/aarch64/aarch64.cc (aarch64_operands_ok_for_ldpstp): Req=
uire
> +       the lower memory access to a mem-pair operand.
> +
> +gcc/testsuite/
> +       PR target/111411
> +       * gcc.dg/rtl/aarch64/pr111411.c: New test.
> +
> +Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3D2d38f45bcca62ca0c7afef4b579f82c5c2a01610]
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +---
> + gcc/config/aarch64/aarch64.cc               |  8 ++-
> + gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c | 57 +++++++++++++++++++++
> + 2 files changed, 60 insertions(+), 5 deletions(-)
> + create mode 100644 gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index 6118a3354ac..9b1f791ca8b 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -26154,11 +26154,9 @@ aarch64_operands_ok_for_ldpstp (rtx *operands, =
bool load,
> +   gcc_assert (known_eq (GET_MODE_SIZE (GET_MODE (mem_1)),
> +                       GET_MODE_SIZE (GET_MODE (mem_2))));
> +
> +-  /* One of the memory accesses must be a mempair operand.
> +-     If it is not the first one, they need to be swapped by the
> +-     peephole.  */
> +-  if (!aarch64_mem_pair_operand (mem_1, GET_MODE (mem_1))
> +-       && !aarch64_mem_pair_operand (mem_2, GET_MODE (mem_2)))
> ++  /* The lower memory access must be a mem-pair operand.  */
> ++  rtx lower_mem =3D reversed ? mem_2 : mem_1;
> ++  if (!aarch64_mem_pair_operand (lower_mem, GET_MODE (lower_mem)))
> +     return false;
> +
> +   if (REG_P (reg_1) && FP_REGNUM_P (REGNO (reg_1)))
> +diff --git a/gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c b/gcc/testsuite=
/gcc.dg/rtl/aarch64/pr111411.c
> +new file mode 100644
> +index 00000000000..ad07e9c6c89
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c
> +@@ -0,0 +1,57 @@
> ++/* { dg-do compile { target aarch64*-*-* } } */
> ++/* { dg-require-effective-target lp64 } */
> ++/* { dg-options "-O -fdisable-rtl-postreload -fpeephole2 -fno-schedule-=
fusion" } */
> ++
> ++extern int data[];
> ++
> ++void __RTL (startwith ("ira")) foo (void *ptr)
> ++{
> ++  (function "foo"
> ++    (param "ptr"
> ++      (DECL_RTL (reg/v:DI <0> [ ptr ]))
> ++      (DECL_RTL_INCOMING (reg/v:DI x0 [ ptr ]))
> ++    ) ;; param "ptr"
> ++    (insn-chain
> ++      (block 2
> ++      (edge-from entry (flags "FALLTHRU"))
> ++      (cnote 3 [bb 2] NOTE_INSN_BASIC_BLOCK)
> ++      (insn 4 (set (reg:DI <0>) (reg:DI x0)))
> ++      (insn 5 (set (reg:DI <1>)
> ++                   (plus:DI (reg:DI <0>) (const_int 768))))
> ++      (insn 6 (set (mem:SI (plus:DI (reg:DI <0>)
> ++                                    (const_int 508)) [1 &data+508 S4 A4=
])
> ++                   (const_int 0)))
> ++      (insn 7 (set (mem:SI (plus:DI (reg:DI <1>)
> ++                                    (const_int -256)) [1 &data+512 S4 A=
4])
> ++                   (const_int 0)))
> ++      (edge-to exit (flags "FALLTHRU"))
> ++      ) ;; block 2
> ++    ) ;; insn-chain
> ++  ) ;; function
> ++}
> ++
> ++void __RTL (startwith ("ira")) bar (void *ptr)
> ++{
> ++  (function "bar"
> ++    (param "ptr"
> ++      (DECL_RTL (reg/v:DI <0> [ ptr ]))
> ++      (DECL_RTL_INCOMING (reg/v:DI x0 [ ptr ]))
> ++    ) ;; param "ptr"
> ++    (insn-chain
> ++      (block 2
> ++      (edge-from entry (flags "FALLTHRU"))
> ++      (cnote 3 [bb 2] NOTE_INSN_BASIC_BLOCK)
> ++      (insn 4 (set (reg:DI <0>) (reg:DI x0)))
> ++      (insn 5 (set (reg:DI <1>)
> ++                   (plus:DI (reg:DI <0>) (const_int 768))))
> ++      (insn 6 (set (mem:SI (plus:DI (reg:DI <1>)
> ++                                    (const_int -256)) [1 &data+512 S4 A=
4])
> ++                   (const_int 0)))
> ++      (insn 7 (set (mem:SI (plus:DI (reg:DI <0>)
> ++                                    (const_int 508)) [1 &data+508 S4 A4=
])
> ++                   (const_int 0)))
> ++      (edge-to exit (flags "FALLTHRU"))
> ++      ) ;; block 2
> ++    ) ;; insn-chain
> ++  ) ;; function
> ++}
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187768): https://lists.openembedded.org/g/openembedde=
d-core/message/187768
> Mute This Topic: https://lists.openembedded.org/mt/101387993/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

