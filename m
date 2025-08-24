Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22342CA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 09:12:10 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.13488.1756026724372030105
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 02:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PN2U2VKr;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-70d9a65c328so17556956d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 02:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756026723; x=1756631523; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6oE0Es8HpCT2+FQb3jRqcgJU0F0BFY+HTfOsB9cRImI=;
        b=PN2U2VKr+DQwUMRKsmTMp4RSt1OuSlA3Ps7j1gvuD2veSPpKsBweEcXfmKc1Ro324F
         QIC9E0T6yM0FTseT8mtF+t5i2kHGmcoktGRyGwxtTRsmhqyIYAlj0NqlKhPEbw7mPqEa
         LE5D53n3t9nG+zjInQ9m40K5GFI/1bzg/FZMJ34UrV1pH+oQEqNlGwM6jEcHyfzfxabn
         wOY1Fp9E8mHTL39A7tHaCUPPP48y9zylxA082zOJoJfuwaod/7ZebTDXcg1liltLopR7
         hNW67QD2TVPtJW0fMzQLar2SmgW2niuwgVoSJunKy/W4xhEXVOJuEmKKXm6LgWtt32W5
         kymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756026723; x=1756631523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oE0Es8HpCT2+FQb3jRqcgJU0F0BFY+HTfOsB9cRImI=;
        b=fxZSdqF4/Rn/HBHLrJU35V+mjWgf1q7xWHxloUJFwA4d8nTasi7SC3Bhq22sYCiHkb
         xHLAKo2xykckF3ayDsGEpsy3mZCNlXB4jtTLtUmhvJi3fbBeLqKGRRc1epxTUlZGIVy7
         Oll4XZx66Ibb9JRJr9BA8wAQ9MFiV8QM3STq49uyFyU20+JhQDYFjCiwC3VALZjA4Pmp
         QNstiaaRW9SK4jcRD2dAsdFP539Ub6lj3gnYS9G0VBI0tx39xj3Wut0og3uHDvgyfjeg
         hu/Hx16GE0DmLOHnXX7zvhHpvVPr+Ns20b1MNtX9Xln55xHYNKJCEZEtySPanNqsrTLD
         Pkgg==
X-Gm-Message-State: AOJu0YyxHo/Na94KzDsaARBIJ09VpCVAgcQCrar4ZFQtDensiALN6Mgg
	0d9kmetXAYyUjMsQVKAwg8r3Tj/jcMO0qdkBipxM+Ii01cccmLybbeoOBqsdjZF86ShR+OiPcsz
	3XqhS94/xJaWZ6Sf3pGNrvw5VXrREBk0=
X-Gm-Gg: ASbGnctH3xzlibC8uEMQIZSiJiCIJUOc1FfL4VeodBFwaY5sDoXUcM/ueHhG0evPAk4
	4pd289LirGgBElcKCwsbuOjXme0ECMcyoGfquQMuE6sLMYeOKkDiqu/TzpSiK5WaC/9DSTCscX3
	ML4LKBwBrH3xQtBlCcWMGjZWpMuyi/GuGUF/W+iXKHrR4dS3O7c06pLSc6AYSggOX6zblQvW8Ge
	FKG0tE=
X-Google-Smtp-Source: AGHT+IH/pxt9JhBqoTNxrB/aG2i+1BYeiwBaZiqBbDST10e4QOr7+EIU04d97uE3b8ucMew7xf3KF4uGSbHQQBlQsCg=
X-Received: by 2002:a05:6214:f0b:b0:700:be60:9515 with SMTP id
 6a1803df08f44-70d970973bamr90346106d6.9.1756026723251; Sun, 24 Aug 2025
 02:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250821064528.754633-1-raj.khem@gmail.com> <20250821064528.754633-7-raj.khem@gmail.com>
In-Reply-To: <20250821064528.754633-7-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 24 Aug 2025 11:11:53 +0200
X-Gm-Features: Ac12FXzOmnQXp5RKrgxRd-ydW8nah9O2RKZVgwWdwKAz19ojEIzWncxlXAoBtTY
Message-ID: <CANNYZj-xwx8OK=U7Fby8dW3kzOoEbV26q+gf9sgtQcGK1YWkCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/9] libc-test: Ignore fma math tests
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222363

This does need an upstream ticket.

Alex

On Thu, 21 Aug 2025 at 08:45, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-math-Delete-failing-tests.patch      | 291 ++++++++++++++++++
>  meta/recipes-core/musl/libc-test_git.bb       |   1 +
>  2 files changed, 292 insertions(+)
>  create mode 100644 meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch
>
> diff --git a/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch b/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch
> new file mode 100644
> index 00000000000..96ff279fa6c
> --- /dev/null
> +++ b/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch
> @@ -0,0 +1,291 @@
> +From c46b87834ad13c8e1b8f4ae1655773fc946c98e5 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 20 Aug 2025 12:41:26 -0700
> +Subject: [PATCH] math: Delete failing tests
> +
> +These tests are regularly failing due ot fenv
> +issue on musl but its not prioritized enough
> +in musl. Ignore them for now.
> +
> +Upstream-Status: Inappropriate [musl-specific]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/math/fma.c  | 47 --------------------------------------------
> + src/math/fmaf.c | 47 --------------------------------------------
> + src/math/fmal.c | 52 -------------------------------------------------
> + src/math/powf.c | 47 --------------------------------------------
> + src/math/yn.c   | 43 ----------------------------------------
> + 5 files changed, 236 deletions(-)
> + delete mode 100644 src/math/fma.c
> + delete mode 100644 src/math/fmaf.c
> + delete mode 100644 src/math/fmal.c
> + delete mode 100644 src/math/powf.c
> + delete mode 100644 src/math/yn.c
> +
> +diff --git a/src/math/fma.c b/src/math/fma.c
> +deleted file mode 100644
> +index 24b65c8..0000000
> +--- a/src/math/fma.c
> ++++ /dev/null
> +@@ -1,47 +0,0 @@
> +-#include <stdint.h>
> +-#include <stdio.h>
> +-#include "mtest.h"
> +-
> +-static struct ddd_d t[] = {
> +-#include "sanity/fma.h"
> +-#include "special/fma.h"
> +-};
> +-
> +-int main(void)
> +-{
> +-      #pragma STDC FENV_ACCESS ON
> +-      double y;
> +-      float d;
> +-      int e, i, err = 0;
> +-      struct ddd_d *p;
> +-
> +-      for (i = 0; i < sizeof t/sizeof *t; i++) {
> +-              p = t + i;
> +-
> +-              if (p->r < 0)
> +-                      continue;
> +-              fesetround(p->r);
> +-              feclearexcept(FE_ALL_EXCEPT);
> +-              y = fma(p->x, p->x2, p->x3);
> +-              e = fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);
> +-
> +-              /* do not check inexact by default */
> +-#if defined CHECK_INEXACT || defined CHECK_INEXACT_OMISSION
> +-              if (!checkexceptall(e, p->e, p->r)) {
> +-#else
> +-              if (!checkexceptall(e|INEXACT, p->e|INEXACT, p->r)) {
> +-#endif
> +-                      printf("%s:%d: bad fp exception: %s fma(%a,%a,%a)=%a, want %s",
> +-                              p->file, p->line, rstr(p->r), p->x, p->x2, p->x3, p->y, estr(p->e));
> +-                      printf(" got %s\n", estr(e));
> +-                      err++;
> +-              }
> +-              d = ulperr(y, p->y, p->dy);
> +-              if (!checkcr(y, p->y, p->r)) {
> +-                      printf("%s:%d: %s fma(%a,%a,%a) want %a got %a ulperr %.3f = %a + %a\n",
> +-                              p->file, p->line, rstr(p->r), p->x, p->x2, p->x3, p->y, y, d, d-p->dy, p->dy);
> +-                      err++;
> +-              }
> +-      }
> +-      return !!err;
> +-}
> +diff --git a/src/math/fmaf.c b/src/math/fmaf.c
> +deleted file mode 100644
> +index c4329a2..0000000
> +--- a/src/math/fmaf.c
> ++++ /dev/null
> +@@ -1,47 +0,0 @@
> +-#include <stdint.h>
> +-#include <stdio.h>
> +-#include "mtest.h"
> +-
> +-static struct fff_f t[] = {
> +-#include "sanity/fmaf.h"
> +-#include "special/fmaf.h"
> +-};
> +-
> +-int main(void)
> +-{
> +-      #pragma STDC FENV_ACCESS ON
> +-      float y;
> +-      float d;
> +-      int e, i, err = 0;
> +-      struct fff_f *p;
> +-
> +-      for (i = 0; i < sizeof t/sizeof *t; i++) {
> +-              p = t + i;
> +-
> +-              if (p->r < 0)
> +-                      continue;
> +-              fesetround(p->r);
> +-              feclearexcept(FE_ALL_EXCEPT);
> +-              y = fmaf(p->x, p->x2, p->x3);
> +-              e = fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);
> +-
> +-              /* do not check inexact by default */
> +-#if defined CHECK_INEXACT || defined CHECK_INEXACT_OMISSION
> +-              if (!checkexceptall(e, p->e, p->r)) {
> +-#else
> +-              if (!checkexceptall(e|INEXACT, p->e|INEXACT, p->r)) {
> +-#endif
> +-                      printf("%s:%d: bad fp exception: %s fmaf(%a,%a,%a)=%a, want %s",
> +-                              p->file, p->line, rstr(p->r), p->x, p->x2, p->x3, p->y, estr(p->e));
> +-                      printf(" got %s\n", estr(e));
> +-                      err++;
> +-              }
> +-              d = ulperrf(y, p->y, p->dy);
> +-              if (!checkcr(y, p->y, p->r)) {
> +-                      printf("%s:%d: %s fmaf(%a,%a,%a) want %a got %a ulperr %.3f = %a + %a\n",
> +-                              p->file, p->line, rstr(p->r), p->x, p->x2, p->x3, p->y, y, d, d-p->dy, p->dy);
> +-                      err++;
> +-              }
> +-      }
> +-      return !!err;
> +-}
> +diff --git a/src/math/fmal.c b/src/math/fmal.c
> +deleted file mode 100644
> +index 791d5d3..0000000
> +--- a/src/math/fmal.c
> ++++ /dev/null
> +@@ -1,52 +0,0 @@
> +-#include <stdint.h>
> +-#include <stdio.h>
> +-#include "mtest.h"
> +-
> +-static struct lll_l t[] = {
> +-#if LDBL_MANT_DIG == 53
> +-#include "sanity/fma.h"
> +-#include "special/fma.h"
> +-#elif LDBL_MANT_DIG == 64
> +-#include "sanity/fmal.h"
> +-#include "special/fmal.h"
> +-#endif
> +-};
> +-
> +-int main(void)
> +-{
> +-      #pragma STDC FENV_ACCESS ON
> +-      long double y;
> +-      float d;
> +-      int e, i, err = 0;
> +-      struct lll_l *p;
> +-
> +-      for (i = 0; i < sizeof t/sizeof *t; i++) {
> +-              p = t + i;
> +-
> +-              if (p->r < 0)
> +-                      continue;
> +-              fesetround(p->r);
> +-              feclearexcept(FE_ALL_EXCEPT);
> +-              y = fmal(p->x, p->x2, p->x3);
> +-              e = fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);
> +-
> +-              /* do not check inexact by default */
> +-#if defined CHECK_INEXACT || defined CHECK_INEXACT_OMISSION
> +-              if (!checkexceptall(e, p->e, p->r)) {
> +-#else
> +-              if (!checkexceptall(e|INEXACT, p->e|INEXACT, p->r)) {
> +-#endif
> +-                      printf("%s:%d: bad fp exception: %s fmal(%La,%La,%La)=%La, want %s",
> +-                              p->file, p->line, rstr(p->r), p->x, p->x2, p->x3, p->y, estr(p->e));
> +-                      printf(" got %s\n", estr(e));
> +-                      err++;
> +-              }
> +-              d = ulperrl(y, p->y, p->dy);
> +-              if (!checkcr(y, p->y, p->r)) {
> +-                      printf("%s:%d: %s fmal(%La,%La,%La) want %La got %La ulperr %.3f = %a + %a\n",
> +-                              p->file, p->line, rstr(p->r), p->x, p->x2, p->x3, p->y, y, d, d-p->dy, p->dy);
> +-                      err++;
> +-              }
> +-      }
> +-      return !!err;
> +-}
> +diff --git a/src/math/powf.c b/src/math/powf.c
> +deleted file mode 100644
> +index 4778c2f..0000000
> +--- a/src/math/powf.c
> ++++ /dev/null
> +@@ -1,47 +0,0 @@
> +-#include <stdint.h>
> +-#include <stdio.h>
> +-#include "mtest.h"
> +-
> +-static struct ff_f t[] = {
> +-#include "ucb/powf.h"
> +-#include "sanity/powf.h"
> +-#include "special/powf.h"
> +-
> +-};
> +-
> +-int main(void)
> +-{
> +-      #pragma STDC FENV_ACCESS ON
> +-      float y;
> +-      float d;
> +-      int e, i, err = 0;
> +-      struct ff_f *p;
> +-
> +-      for (i = 0; i < sizeof t/sizeof *t; i++) {
> +-              p = t + i;
> +-
> +-              if (p->r < 0)
> +-                      continue;
> +-              fesetround(p->r);
> +-              feclearexcept(FE_ALL_EXCEPT);
> +-              y = powf(p->x, p->x2);
> +-              e = fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);
> +-
> +-              if (!checkexcept(e, p->e, p->r)) {
> +-                      if (fabsf(y) < 0x1p-126f && (e|INEXACT) == (INEXACT|UNDERFLOW))
> +-                              printf("X ");
> +-                      else
> +-                              err++;
> +-                      printf("%s:%d: bad fp exception: %s powf(%a,%a)=%a, want %s",
> +-                              p->file, p->line, rstr(p->r), p->x, p->x2, p->y, estr(p->e));
> +-                      printf(" got %s\n", estr(e));
> +-              }
> +-              d = ulperrf(y, p->y, p->dy);
> +-              if (!checkulp(d, p->r)) {
> +-                      printf("%s:%d: %s powf(%a,%a) want %a got %a ulperr %.3f = %a + %a\n",
> +-                              p->file, p->line, rstr(p->r), p->x, p->x2, p->y, y, d, d-p->dy, p->dy);
> +-                      err++;
> +-              }
> +-      }
> +-      return !!err;
> +-}
> +diff --git a/src/math/yn.c b/src/math/yn.c
> +deleted file mode 100644
> +index 244dbb8..0000000
> +--- a/src/math/yn.c
> ++++ /dev/null
> +@@ -1,43 +0,0 @@
> +-#define _XOPEN_SOURCE 700
> +-#include <stdint.h>
> +-#include <stdio.h>
> +-#include "mtest.h"
> +-
> +-static struct di_d t[] = {
> +-#include "sanity/yn.h"
> +-#include "special/yn.h"
> +-};
> +-
> +-int main(void)
> +-{
> +-      #pragma STDC FENV_ACCESS ON
> +-      double y;
> +-      float d;
> +-      int e, i, err = 0;
> +-      struct di_d *p;
> +-
> +-      for (i = 0; i < sizeof t/sizeof *t; i++) {
> +-              p = t + i;
> +-
> +-              if (p->r < 0)
> +-                      continue;
> +-              fesetround(p->r);
> +-              feclearexcept(FE_ALL_EXCEPT);
> +-              y = yn(p->i, p->x);
> +-              e = fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);
> +-
> +-              if (!checkexcept(e, p->e, p->r)) {
> +-                      printf("%s:%d: bad fp exception: %s yn(%lld, %a)=%a, want %s",
> +-                              p->file, p->line, rstr(p->r), p->i, p->x, p->y, estr(p->e));
> +-                      printf(" got %s\n", estr(e));
> +-                      err++;
> +-              }
> +-              d = ulperr(y, p->y, p->dy);
> +-              if ((!(p->x < 0) && !checkulp(d, p->r)) || (p->x < 0 && !isnan(y) && y != -inf)) {
> +-                      printf("%s:%d: %s yn(%lld, %a) want %a got %a, ulperr %.3f = %a + %a\n",
> +-                              p->file, p->line, rstr(p->r), p->i, p->x, p->y, y, d, d-p->dy, p->dy);
> +-                      err++;
> +-              }
> +-      }
> +-      return !!err;
> +-}
> diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
> index 5ec307c25be..9d159ea9d27 100644
> --- a/meta/recipes-core/musl/libc-test_git.bb
> +++ b/meta/recipes-core/musl/libc-test_git.bb
> @@ -14,6 +14,7 @@ SRC_URI = " \
>      git://repo.or.cz/libc-test;branch=master;protocol=https \
>      file://0001-Fix-strptime-on-musl.patch \
>      file://0001-api-unistd-guard-optional-obsolete-_PC-_SC-constants.patch \
> +    file://0001-math-Delete-failing-tests.patch \
>      file://run-ptest \
>      file://run-libc-ptests \
>  "
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222215): https://lists.openembedded.org/g/openembedded-core/message/222215
> Mute This Topic: https://lists.openembedded.org/mt/114813656/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

