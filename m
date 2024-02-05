Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B97C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 14:10:47 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.63694.1707142246441127212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 06:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KSKqrlKK;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5114b1e8819so1800068e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 06:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707142244; x=1707747044; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NI/knKZkS01yxhQzapXnQOb42/aEVcEj2guTes+i7k8=;
        b=KSKqrlKKexTXjVfUA4cV+sGO7yWJ9f2qFKY6Zlpg4t57EWOh23k2StfTkTSvUiTgOf
         c3tMnV/teFygL0kxB3AljluXV0Eav38pTtIj88fl4P7vNrtoh2DlB4M/9Rkp0Uz94GtG
         FO7ha6QetN1Om1WErRVXphMcBlUPxHUfZyvUIFY5/pT/2DMro/PF1qeOM8WfKISutKYX
         qQWwCVbzAg/AcydMDiJBr+T+yA854uikdlNF3NDuXvopZqAoeq67urDEX6qy+JqsZkjD
         XC7EgrqOEqxytnPQ9z1cT0f2gSEX5mlCR1fW28JD6YTfuDhgF1W7nX52zJSfDvomvKcY
         rPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707142244; x=1707747044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NI/knKZkS01yxhQzapXnQOb42/aEVcEj2guTes+i7k8=;
        b=qMnlACCKs3/ciz2AOSAHXQaM6P8MPtPMPEAf3tt7RLMeuHdOzBVP3talt2zaZF+rUk
         mmGdjUH+dWPi+H8uIMMR2mqJ84TDppUmu4OiE/nZ0MF6h6RKyIpgbzGuRS2EiKn2llgG
         DmvAo8W9syVRoh1UFD5BDgzRHnGSTI8DOVNHEY1F29QAJb8QzOeJZlcaqp1rDKihHjmg
         L6zT/Om9QBIQ3cMf44cOCcMEnMuVNzqajy70NzzvVQ2YbvoJyCAhts9HNPCdXRIwwxiC
         jjshbW/P1Y7C07wSP03KxuwcmtZzbENbHood6YzHF/9LRfI0bbvLW+6ri0EtayRd6uq6
         q7ZA==
X-Gm-Message-State: AOJu0YxtQY4oURVqtGl2QjNJ7kbN09riwo6D0Ce/Kfy5mXUvXH8iPbuE
	2ytLrHQeokrz01YQpKFiWmkz8p3+qD2yJHz+OBNmSGs/KXStK4QPSosw6dMrU3U6lGeST2+nUOW
	huasfvNcLiXpnF9cnrUCU/Ojkvio=
X-Google-Smtp-Source: AGHT+IEhXc80hBw7FphephG/Is/t6a5T8Mu3UtQs+ota+6nFx7SqW5Fo9V7Qt2ByVDBMO8k+kiEcueeBJQ7KzhzKUT0=
X-Received: by 2002:a05:6512:1593:b0:511:47cf:d09d with SMTP id
 bp19-20020a056512159300b0051147cfd09dmr4767576lfb.3.1707142244145; Mon, 05
 Feb 2024 06:10:44 -0800 (PST)
MIME-Version: 1.0
References: <20240205135528.45112-1-matthias.schmitz@port4949.net>
In-Reply-To: <20240205135528.45112-1-matthias.schmitz@port4949.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 5 Feb 2024 15:10:32 +0100
Message-ID: <CANNYZj_o9-jdpCr_F_OmZ4T-C33XUqvdGmmvrPPqngSXkZcZgQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rsync: Fix rsync hanging when used with --relative
To: Matthias Schmitz <matthias.schmitz@port4949.net>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 14:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194938

You need to specify which release of oe-core this is for in the email subject.

Alex

On Mon, 5 Feb 2024 at 14:55, Matthias Schmitz
<matthias.schmitz@port4949.net> wrote:
>
> Fixes [YOCTO #15383]
>
> This bug was introduced into upstream when fixing CVE-2022-29154. It was
> later discovered and fixed upstream but this fix didn't make it into
> poky yet.
> The added patch is taken from upstreams git repository:
> https://github.com/WayneD/rsync/commit/fabef23bea6e9963c06e218586fda1a823e3c6bf
>
> Signed-off-by: Matthias Schmitz <matthias.schmitz@port4949.net>
> ---
>  ...lative-when-copying-an-absolute-path.patch | 28 +++++++++++++++++++
>  meta/recipes-devtools/rsync/rsync_3.1.3.bb    |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch
>
> diff --git a/meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch b/meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch
> new file mode 100644
> index 0000000000..ccfaf8463a
> --- /dev/null
> +++ b/meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch
> @@ -0,0 +1,28 @@
> +From fabef23bea6e9963c06e218586fda1a823e3c6bf Mon Sep 17 00:00:00 2001
> +From: Wayne Davison <wayne@opencoder.net>
> +Date: Mon, 8 Aug 2022 21:30:21 -0700
> +Subject: [PATCH] Fix --relative when copying an absolute path.
> +
> +---
> + exclude.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/exclude.c b/exclude.c
> +index 2394023f..ba5ca5a3 100644
> +--- a/exclude.c
> ++++ b/exclude.c
> +@@ -434,8 +434,10 @@ void add_implied_include(const char *arg)
> +                               *p++ = *cp++;
> +                               break;
> +                         case '/':
> +-                              if (p[-1] == '/') /* This is safe because of the initial slash. */
> ++                              if (p[-1] == '/') { /* This is safe because of the initial slash. */
> ++                                      cp++;
> +                                       break;
> ++                              }
> +                               if (relative_paths) {
> +                                       filter_rule const *ent;
> +                                       int found = 0;
> +--
> +2.39.2
> +
> diff --git a/meta/recipes-devtools/rsync/rsync_3.1.3.bb b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
> index a5c20dee34..c744503227 100644
> --- a/meta/recipes-devtools/rsync/rsync_3.1.3.bb
> +++ b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
> @@ -17,6 +17,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
>             file://CVE-2016-9842.patch \
>             file://CVE-2016-9843.patch \
>             file://CVE-2022-29154.patch \
> +           file://0001-Fix-relative-when-copying-an-absolute-path.patch \
>  "
>
>  SRC_URI[md5sum] = "1581a588fde9d89f6bc6201e8129afaf"
> --
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194935): https://lists.openembedded.org/g/openembedded-core/message/194935
> Mute This Topic: https://lists.openembedded.org/mt/104176037/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

