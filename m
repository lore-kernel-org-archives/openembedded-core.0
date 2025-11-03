Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409D3CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 18:19:15 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4596.1762193950429942295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 10:19:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fF/Vu6ZM;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-63cf0df1abbso5050201d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 10:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762193949; x=1762798749; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKYUsr4ierLJ7a1f2UmlgcmidXQz28zcIWIoPWWfDuc=;
        b=fF/Vu6ZMw+L9fuL9ZClRcrQwubLIl3XLbYHOCfvGi931GabWPKcgExrQsrc7R4o4p9
         ZvDxWQbebRo+gQEaMr6n97cOOS8dPURq57Q0hVnQIiXBZyoA5v8I2kTKe1XQF/kQwplr
         tw1Dib2hKP5aaONoKeLunCnCYVhQJsmXZ2fhRReTOyC1l4ai6HRL67UlGSuqDThBeF8q
         DtGYmj3esyzfF+DBWBLwDKveUVhevz9mR5bo9KHFEpSeoctRaWhkUI2jpocH0FGsFfEJ
         Urkwwd4FT0DgnyZeLDGGiE2X0h0X1boYGFJLDy2ajIiu4kq0vctMsa+nwBoJH+MI7BYM
         jSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762193949; x=1762798749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKYUsr4ierLJ7a1f2UmlgcmidXQz28zcIWIoPWWfDuc=;
        b=j64jwS/A95m3b/H4koWqANZx8Kwp2hVHFFSWWHFf6S0m0TR2CjWMgYpgyJJwh3RFXO
         FurO5ugthkw627SL43MHd7Xw/kZn0TxPOKTSrsbq1rStW0X4hL+ws8or87vCF33FNHCg
         FnHsRoXZaYEHhM+CsbrJujAB3KdxXgo0VTg1aqt5rG2Q4oJUw6QuGNjnXvDHrOHnykfD
         PSysTwU95pCgeaEQVtNfVJdVfCSabFAk2g42FWasY69AHIXxM4NGGDDu4HSzcTPLf7La
         jALBdDvXn9eXqLwBnxC+nHRODw9ZLzhfwMRZiX6qz1PNKQQZzbJLiWfxFQHwFN8Q9JP7
         EETw==
X-Gm-Message-State: AOJu0Yw6NNOtThnliCjmwSka7AO7GbEnuKqXunlaaAzkBnoSmxxZ0jvU
	zh0Tbsw1NeNJsf2NUDq2JdIb3YNICWwNMnrKCbEFkJ5nXxKeW+iOudyJatFLcHD5IUnoP6ZhEU7
	616p0Anv4RjkxPpHU3itO+gZLVmdd5Zo=
X-Gm-Gg: ASbGncuqvGZKJEo5dGKCFAIrsvvLUJttW/g2/wVABJIkBS2aOgzVTC/GsRN8FPOGSBv
	yNpg0GI74AlT8a9Eyv5sMv8+jBcxJH5AVlDGE5RM5LvnzeyhSfd65haOdWVxfW+UNha3R1sdXP9
	ud9qj4DUEkGxxKAJH/W+1z41KKBGszI00IYGqkvvjvCMNeCDplWbttqRfSHQIhkNOjJMmAWygLL
	kkyN58eQnojfX+Ma/dVFUXBD3R/U5KjzWF3IaFMbg2DJq+9fadRkbd0Bt4AuUGldsVFTLZ0Gdl9
	AJMxJn4Quu2toqA9OHFOGwxjpZ+51mjOu2QTXVdrY3d+DUjk7jUhY2VEzzuHuBe9mvFLUTGe+O/
	StA==
X-Google-Smtp-Source: AGHT+IETiVFIeq4NvcOfWabaS49+tKkIArWeHEvkd9sfaWo3g0zQq63I/Nm34lPjrHjBH94/lAj2+NxfxaSf3e9g9SM=
X-Received: by 2002:a05:690c:2c09:b0:784:aec5:7039 with SMTP id
 00721157ae682-786483a2cc7mr103896567b3.9.1762193949381; Mon, 03 Nov 2025
 10:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20251103181409.3191690-1-joaohf@gmail.com>
In-Reply-To: <20251103181409.3191690-1-joaohf@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Nov 2025 10:18:43 -0800
X-Gm-Features: AWmQ_blf_s6bkY4afzsyvzIAKBl0wVXegP1QKGyiTCLehYp-wjpR9RwgEB0EaA4
Message-ID: <CAMKF1sokJt=FwHNr9C1AaJRNAXYuWb4Rcfqu1ha4v_L5Zc-08Q@mail.gmail.com>
Subject: Re: [PATCH v3] readline: backport a patch to fix for caller setting
 rl_prompt to NULL
To: =?UTF-8?Q?Jo=C3=A3o_Henrique_Ferreira_de_Freitas?= <joaohf@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <quaresma.jose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 18:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225688

LGTM

On Mon, Nov 3, 2025 at 10:14=E2=80=AFAM Jo=C3=A3o Henrique Ferreira de Frei=
tas
<joaohf@gmail.com> wrote:
>
> I've observed this issue affecting iwctl and connmanctl.
>
> Patching readline solves the issue.
>
> The original patch from [5] mixes many fixes in one commit. I've extract
> only what matters to solve the issues observed with connman and iwd. The
> final patch is the same patch sent by readline author to readline's mail =
list [6].
>
> References:
>
> 1: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/i=
ssues/1
> 2: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/c=
ommit/b30636dc66fc783a091af51b049dc5240f861dd0
> 3: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
> 4: https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@cold=
-front.org/
> 5: https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=
=3Ddevel&id=3D488d7edc22894d30b6de7f2d4190bf7403f63ffd
> 6: https://lists.gnu.org/archive/html/bug-readline/2025-07/txtmA7rksnmmi.=
txt
>
> Fixes [YOCTO #16047]
>
> CC: Jose Quaresma <quaresma.jose@gmail.com>
> CC: Khem Raj <raj.khem@gmail.com>
> CC  Paul Barker <paul@pbarker.dev>
> Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com>
> ---
>
> Notes:
>     changes in v3:
>     - remove unnecessary whitespace change
>     - keep notes for readline patch
>
>  ...for-caller-setting-rl_prompt-to-NULL.patch | 40 +++++++++++++++++++
>  meta/recipes-core/readline/readline_8.3.bb    |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-core/readline/readline/fix-for-caller-se=
tting-rl_prompt-to-NULL.patch
>
> diff --git a/meta/recipes-core/readline/readline/fix-for-caller-setting-r=
l_prompt-to-NULL.patch b/meta/recipes-core/readline/readline/fix-for-caller=
-setting-rl_prompt-to-NULL.patch
> new file mode 100644
> index 0000000000..a23e2f3bce
> --- /dev/null
> +++ b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_promp=
t-to-NULL.patch
> @@ -0,0 +1,40 @@
> +From a0a4c011c0c5e598c5b51cbf81d3b4501fa72e0c Mon Sep 17 00:00:00 2001
> +From: Chet Ramey <chet.ramey@case.edu>
> +Date: Thu, 30 Oct 2025 14:19:41 -0300
> +Subject: [PATCH] fix for caller setting rl_prompt to NULL
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The original patch came from [1, 2] and it has been integrated into
> +readline git repository, commit (488d7edc22894d30b6de7f2d4190bf7403f63ff=
d)
> +
> +This patch has only the fix needed to solve the follow issues [3,4].
> +
> +I added the original author as this patch has been sent through readline=
 mail
> +list.
> +
> +1: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
> +2: https://lists.gnu.org/archive/html/bug-readline/2025-07/txtmA7rksnmmi=
.txt
> +3: https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@col=
d-front.org/
> +4: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/=
issues/1
> +
> +Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/readli=
ne.git/commit/display.c?h=3Ddevel&id=3D488d7edc22894d30b6de7f2d4190bf7403f6=
3ffd]
> +Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com>
> +---
> + display.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/display.c b/display.c
> +index 9aa8c7b..edb525d 100644
> +--- a/display.c
> ++++ b/display.c
> +@@ -783,7 +783,7 @@ _rl_optimize_redisplay (void)
> +
> + /* Useful shorthand used by rl_redisplay, update_line, rl_move_cursor_r=
elative */
> + #define INVIS_FIRST() (local_prompt_invis_chars[0])
> +-#define WRAP_OFFSET(line, offset)  ((line <=3D prompt_last_screen_line)=
 ? local_prompt_invis_chars[line] : 0)
> ++#define WRAP_OFFSET(line, offset)  ((line <=3D prompt_last_screen_line =
&& local_prompt_invis_chars) ? local_prompt_invis_chars[line] : 0)
> +
> + #define W_OFFSET(line, offset) ((line) =3D=3D 0 ? offset : 0)
> + #define VIS_LLEN(l)   ((l) > _rl_vis_botlin ? 0 : (vis_lbreaks[l+1] - v=
is_lbreaks[l]))
> diff --git a/meta/recipes-core/readline/readline_8.3.bb b/meta/recipes-co=
re/readline/readline_8.3.bb
> index a2f23eb353..b425b78e1f 100644
> --- a/meta/recipes-core/readline/readline_8.3.bb
> +++ b/meta/recipes-core/readline/readline_8.3.bb
> @@ -2,6 +2,7 @@ require readline.inc
>
>  SRC_URI +=3D "file://norpath.patch \
>              file://fix-for-readline-event-hook.patch \
> +            file://fix-for-caller-setting-rl_prompt-to-NULL.patch \
>              "
>
>  SRC_URI[archive.sha256sum] =3D "fe5383204467828cd495ee8d1d3c037a7eba1389=
c22bc6a041f627976f9061cc"

