Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C54CA0FED
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 09:57:31 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.11079.1756288645102468623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 02:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jmKHN6sm;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-70de1230e87so2884366d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 02:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756288644; x=1756893444; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZkI0GWzj7GtzF4ldTz012XjR8F6YnLMu2XtZguFx4w=;
        b=jmKHN6smodafl9ycURXb89XPO5gnmxnaFuH7AbysK/QQuqDi/umPTqFeTx8C+Zs+wa
         c2JJsz0RdKsEdObGFuFoNRNEfCtvUZnGnm+Ls5HmZP58mKjhI8m14vHf0/ke7AFyHo5A
         AIUUgryQCEwqu9iqUJwXScwiIYPqXPukpIvl81lvAugLSFllzopLC0xx7mbNJ80y5rIB
         jQdf0mWvyH8NpaYWDetDPqYUS+nicjNkwr12riYM/Kf/9oVGagB6UZdHhoLO1AuSYzbC
         +1bIw6ckqC6RWkoXoMq5zCk90LO/OvDzgXMVCFqqb7EQBcRPvaf9gcb79sj4s4o1hVvO
         5rIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756288644; x=1756893444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZkI0GWzj7GtzF4ldTz012XjR8F6YnLMu2XtZguFx4w=;
        b=as7Nv9OCeO1z5Dl24ruJCuEIL4diJp5yzhjak3o1eKJb7ViIBpzW9KFLevTQ9kuM18
         HmH5/iFwquFk0e2/CubO5pFDD2C8pkNSRGR7fvy/lXe3gcRawxtnt0HpfpmX+2iix4/u
         bnwP6h6U1lBlk5RRDoMTFuToRXryvWa60EhcZDN8OqtjgCLh9DBDLWdwXOkp+UpiCuug
         79Z8sRzccvMAHkXbLnDShg/S3OCPHQBmb0gPPUe1batcZRbB6RMZExjRAEj7DsGepvEX
         GTau8Xn049aZbQtQkwzzhJ4iPKSnreRu2Hq1Yy1T1zUnlRJGrAIV3r08lcvdTq6uatRV
         8Sqg==
X-Gm-Message-State: AOJu0Yyz66Dir4K9KyzVmODWsszmqfCWw3B2tz/gLG9Cdez165jWcbJQ
	pLaqfzsUBKsbUQFbHz0EA8cXLLBoxlUMIYWX82EhAZdQYgmBl0tlmXgfVUI+2ZZ5nW3+wotNPxW
	KgYaJv1E5YF42cvNHsOnzNS4WdiAgQJw=
X-Gm-Gg: ASbGnctBoxChkAbdbaSwKsSEp4MPB0S1BU2Ezta6vMt1nEnt7D6K01PD9Yvt+aqxJy0
	GupINsfa8miXZRxlDetWBlOAVrK/+Kp0rDy6lU7h7hdcLyS8hv2wJFeXMeLTTek+T7KOo4UbNEg
	gjLRFdWWQ/671jU/B912IOcxEXjxDxT7kd/0jSB9kjL45nr+oNhPXnQtWdYMneFNEXxsLg6diao
	oQYMyz9wtsihnoPrSgH
X-Google-Smtp-Source: AGHT+IHbg3W1YySaksxQArEdoR33wqLuayWQcSAE85LFSi+ELkYIEyYaMYkz+hlUgIvkXkaEkuPXtdIdmJXhVtxOCik=
X-Received: by 2002:ad4:5bc5:0:b0:70d:749f:177 with SMTP id
 6a1803df08f44-70d9738f13cmr181073746d6.33.1756288643778; Wed, 27 Aug 2025
 02:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250827095313.1915-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20250827095313.1915-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Aug 2025 11:57:12 +0200
X-Gm-Features: Ac12FXwA9YF2mkzQTvOLTIRZx2gJbHEvjrglqbwyeeVxy3777AoX8jckkIxxBG8
Message-ID: <CANNYZj_ZyNinZ12M-6gP=9EybfUNQQFvtx3FUpA+UZf_6BkB3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] readline: backport a patch to fix issue that
 readline can't work with samba
To: Liu Yiding <liuyd.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 09:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222504

Thanks, the sign-off-by is now correct.

Alex

On Wed, 27 Aug 2025 at 11:53, Liu Yiding <liuyd.fnst@fujitsu.com> wrote:
>
> smbclient can't accept input after readline upgrade to 8.3
> | root # smbclient //192.168.2.16/test -N
> |       Try "help" to get a list of possible commands.
> |       smb: \>
>
> similar issue has been reported:
> https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00011.html
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  .../fix-for-readline-event-hook.patch         | 55 +++++++++++++++++++
>  meta/recipes-core/readline/readline_8.3.bb    |  1 +
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta/recipes-core/readline/readline/fix-for-readline-event-hook.patch
>
> diff --git a/meta/recipes-core/readline/readline/fix-for-readline-event-hook.patch b/meta/recipes-core/readline/readline/fix-for-readline-event-hook.patch
> new file mode 100644
> index 0000000000..f2ec506f5c
> --- /dev/null
> +++ b/meta/recipes-core/readline/readline/fix-for-readline-event-hook.patch
> @@ -0,0 +1,55 @@
> +From 15970c431517a046099d8294c91d778b1da9b29d Mon Sep 17 00:00:00 2001
> +From: Chet Ramey <chet.ramey@case.edu>
> +Date: Fri, 11 Jul 2025 11:51:15 -0400
> +Subject: Readline-8.3 patch 1: fix for readline event hook
> +
> +
> +Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/?id=15970c431517a046099d8294c91d778b1da9b29d]
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + input.c    | 6 +++++-
> + patchlevel | 2 +-
> + 2 files changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/input.c b/input.c
> +index e6a39e2..3383edb 100644
> +--- a/input.c
> ++++ b/input.c
> +@@ -261,13 +261,16 @@ rl_gather_tyi (void)
> +   input = 0;
> +   tty = fileno (rl_instream);
> +
> +-  /* Move this up here to give it first shot, but it can't set chars_avail */
> ++  /* Move this up here to give it first shot, but it can't set chars_avail,
> ++     so we assume a single character is available. */
> +   /* XXX - need rl_chars_available_hook? */
> +   if (rl_input_available_hook)
> +     {
> +       result = (*rl_input_available_hook) ();
> +       if (result == 0)
> +         result = -1;
> ++      else
> ++        chars_avail = 1;
> +     }
> +
> + #if defined (HAVE_PSELECT) || defined (HAVE_SELECT)
> +@@ -285,6 +288,7 @@ rl_gather_tyi (void)
> + #endif
> +       if (result <= 0)
> +       return 0;       /* Nothing to read. */
> ++      result = -1;    /* there is something, so check how many chars below */
> +     }
> + #endif
> +
> +diff --git a/patchlevel b/patchlevel
> +index d8c9df7..fdf4740 100644
> +--- a/patchlevel
> ++++ b/patchlevel
> +@@ -1,3 +1,3 @@
> + # Do not edit -- exists only for use by patch
> +
> +-0
> ++1
> +--
> +cgit v1.2.3
> +
> diff --git a/meta/recipes-core/readline/readline_8.3.bb b/meta/recipes-core/readline/readline_8.3.bb
> index ff5dec6c0a..a2f23eb353 100644
> --- a/meta/recipes-core/readline/readline_8.3.bb
> +++ b/meta/recipes-core/readline/readline_8.3.bb
> @@ -1,6 +1,7 @@
>  require readline.inc
>
>  SRC_URI += "file://norpath.patch \
> +            file://fix-for-readline-event-hook.patch \
>              "
>
>  SRC_URI[archive.sha256sum] = "fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc"
> --
> 2.43.0
>

