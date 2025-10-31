Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5A7CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:00 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.web10.2662.1761935756939659933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 11:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EgWFm/nU;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63f870cc79aso2186733d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 11:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761935756; x=1762540556; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kRgJya0ZuAi0WPHwmpH55RqPHIU+a2Sz3pjdsvypwQ=;
        b=EgWFm/nUzyabOxqCFfrSWsLrPa+3UHudXjxA3Y5dF771MbFdAfMLz77bj57AHTaRjY
         ylcEuEV2whhebX50tgwpVdJH+ifk0NW/yYCbjgpuVfdzvi0GES30peeRwx3SdQJjCiLL
         EMGtRk/bxNJ+Hghzp431DRiDZ2aJC6czri9ppAD6r7BtN+t6h2PUdWtnjDdASkHzwcPw
         /Kq25Zyy9fp/5Ija4n8V/tuwlWhKZdxJUGCcUJvuX5BRPK5ew+rGKVlg6CHRPv3GuSq3
         Fvf6H07UXdn/dSqguuoon4LfDZu8OT6Q6GMDvexeY14upkv5CjOfyh6HWN1n/jE5v2Sm
         AIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761935756; x=1762540556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kRgJya0ZuAi0WPHwmpH55RqPHIU+a2Sz3pjdsvypwQ=;
        b=WBwkszGqo/urNbDDurRuSpT0opD2+g1wrbxhEzbmyVsn9gR3nyksy8SW5hTAcdw3np
         YDq9a1oLhb37WkXEXQHaiJRyAnkgJiUofq8c2+Qio44iO5Z2SJ/5zBBU/FLj2beD1iYl
         90WJEtQ3xKgBdKbskb0OSiduV57Gaxl6JekdM9Uv77Y0caOAjJxHAPNA3XWGbRBPUCuo
         /2d1a4srUOC91vB7hDvkhcA9b+WcC1h+e/wjze4bwTHFY7+RNRP60z7Q4ZtepJG2KDzD
         RMvCREcfK5Fx+/ss6DqmG0IKczx9jTB977VgRVpWnPsE4THD/cesR0xY6abQ6xWEOSFc
         2aBQ==
X-Gm-Message-State: AOJu0Yx57tOolZ3lC5qWRdG6Z9bHU7nISpntvVjkJ5xW8Gm8HjoUYC7r
	nTOLUWAdHAUPyMgrRF/wC9GaO5bksNSYGYTuqjQ1XFka2TtQPuyd9Z3/rFEHFXBw5BwSv82re8t
	Sm6lyoCOomPVZ9+vWQsDheGZ1gRkRzQc=
X-Gm-Gg: ASbGnculjfD2CLs4SMxJ4YPHRmrYjVXTqKTdhRVwRqy5BmZC/D9n2VCLhKC/roo+d0X
	Ro19yQbmM+uSbssa7m6zDERDThKs4MoKC/b07IRtN75/a9sX03fYvmrz6b0ltmcYJkAZ6FQc3d2
	KITBVIFEhy+VLwNNUOfETpcwVI9q2Jub/d6Al7noVDI+Rc4pJ6rCXUPz42ipcAaVu1qCmdTqWZI
	/Ykx6nHM9Lm0L00Xw7hff1UrStvT4BR1a+wpBO4bD2e5GCUiPP42eapw4lgzR57qzYQfrlwZVSq
	h9juan7vAA9ny8XzL5IWLEZr8NaIsNhV5zYRkgxHjNDcQLvt7QE54nyokk2aDBWMbHm5wtoOBnm
	VafgAFTMS47nOLQ==
X-Google-Smtp-Source: AGHT+IFQ/z27qvNi5tDRrsf3eZikIu5rUZhNwVpbLgz4Fu5ygNNU2cyE3Vs7Si40LomAjnO4Wq9ZMiV5IsY1fjetDNs=
X-Received: by 2002:a05:690c:883:b0:782:d301:e1f2 with SMTP id
 00721157ae682-786483a3047mr38978027b3.3.1761935755074; Fri, 31 Oct 2025
 11:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20251031181228.3810813-1-joaohf@gmail.com>
In-Reply-To: <20251031181228.3810813-1-joaohf@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Oct 2025 11:35:28 -0700
X-Gm-Features: AWmQ_bmSFWVdyKluOQTZc_su7znqeSMztb4qz3LuFQ_q8tmxTQeiziSduG4vLDQ
Message-ID: <CAMKF1sqPE2Dc3NVqNyun+y9FH4SHtngc2xu2UeK1afo7tz-1Vg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] readline: backport a patch to fix for caller
 setting rl_prompt to NULL
To: joaohf@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <quaresma.jose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 18:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225559

looks ok.

On Fri, Oct 31, 2025 at 11:12=E2=80=AFAM Jo=C3=A3o Henrique Ferreira de Fre=
itas via
lists.openembedded.org <joaohf=3Dgmail.com@lists.openembedded.org>
wrote:
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
> Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com>
> ---
>
> Notes:
>     changes in v2:
>     - add readline fix author name
>     - add explanation why and where the original patch come from
>
>  ...for-caller-setting-rl_prompt-to-NULL.patch | 42 +++++++++++++++++++
>  meta/recipes-core/readline/readline_8.3.bb    |  5 ++-
>  2 files changed, 45 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/readline/readline/fix-for-caller-se=
tting-rl_prompt-to-NULL.patch
>
> diff --git a/meta/recipes-core/readline/readline/fix-for-caller-setting-r=
l_prompt-to-NULL.patch b/meta/recipes-core/readline/readline/fix-for-caller=
-setting-rl_prompt-to-NULL.patch
> new file mode 100644
> index 0000000000..c8ac712d56
> --- /dev/null
> +++ b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_promp=
t-to-NULL.patch
> @@ -0,0 +1,42 @@
> +From a0a4c011c0c5e598c5b51cbf81d3b4501fa72e0c Mon Sep 17 00:00:00 2001
> +From: Chet Ramey <chet.ramey@case.edu>
> +Date: Thu, 30 Oct 2025 14:19:41 -0300
> +Subject: [PATCH] fix for caller setting rl_prompt to NULL
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/readli=
ne.git/commit/display.c?h=3Ddevel&id=3D488d7edc22894d30b6de7f2d4190bf7403f6=
3ffd]
> +Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com>
> +---
> +
> +Notes:
> +    The original patch came from [1, 2] and it has been integrated into
> +    readline git repository, commit (488d7edc22894d30b6de7f2d4190bf7403f=
63ffd)
> +
> +    This patch has only the fix needed to solve the follow issues [3,4].
> +
> +    I added the original author as this patch has been sent through read=
line mail
> +    list.
> +
> +    1: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.=
html
> +    2: https://lists.gnu.org/archive/html/bug-readline/2025-07/txtmA7rks=
nmmi.txt
> +    3: https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder=
@cold-front.org/
> +    4: https://gitlab.archlinux.org/archlinux/packaging/packages/readlin=
e/-/issues/1
> +
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
> index a2f23eb353..8bc4477946 100644
> --- a/meta/recipes-core/readline/readline_8.3.bb
> +++ b/meta/recipes-core/readline/readline_8.3.bb
> @@ -1,7 +1,8 @@
>  require readline.inc
>
>  SRC_URI +=3D "file://norpath.patch \
> -            file://fix-for-readline-event-hook.patch \
> -            "
> +           file://fix-for-readline-event-hook.patch \
> +           file://fix-for-caller-setting-rl_prompt-to-NULL.patch \
> +           "
>
>  SRC_URI[archive.sha256sum] =3D "fe5383204467828cd495ee8d1d3c037a7eba1389=
c22bc6a041f627976f9061cc"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225558): https://lists.openembedded.org/g/openembedde=
d-core/message/225558
> Mute This Topic: https://lists.openembedded.org/mt/116053075/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

