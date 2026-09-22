Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F8EC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 16:50:02 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.650.1790095794331768151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 09:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mZi4+TiQ;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so91581f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790095792; x=1790700592; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCGxr0Fah4uhFyEg+C0yR9VrI0VQnk7NLu15C1xFUcQ=;
        b=mZi4+TiQKfroz1/9iW8LHASDUhTVE0oXmye96mKEZIHpcSGM4posxLQLFKC8gkV5uN
         PZHwgm4L8lnFaqGZC6ByFcTGkQw498K0163lMJT5GwP9nP2gj+36s5cTVTq5WqFG8d4O
         jKboslbBgwUXoBdYxCrBoSFBS5KLi/imBXLpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790095792; x=1790700592;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCGxr0Fah4uhFyEg+C0yR9VrI0VQnk7NLu15C1xFUcQ=;
        b=FL6OoBBzICUfLrhjT/Z8Y7SSF+qme9wKgFqE/zAhTmMkkXkWFnzrK6DT1kMolLWkZy
         UUdGxIMSuzx2OuBJ1UbFByr0R4T5TJZAjj0rSxaQ+G2KTtv/gx7zstGqTEXJBC8wTm8T
         WPmBqr4/W8ilN6BJPi0A5edVVvnZX1JUum8qz+ZqYrQxqjpUPNiygwJfaJiEIOHDz7Ht
         Rid7lvEhHKW6WhCRdi5Mg1zfvgJ6T9+hUUE5/CK+cmMvaO+bhsItIo0tuUCTqlDwsahd
         LJq5sgSkatTZAWH+g6qaznBOJ/XWcynY8Rzr3LXd46/0Fh/7kMWWLNXK8JK62+dD5wXP
         m/FA==
X-Forwarded-Encrypted: i=1; AKwUvBzcpX3rC/IMoSrmfmTDxHdUoZOJNC74TfUAWQjvuR/5mitxYLvIHVWaULPlhyu9p71RWbCov+xUV4Seeo3J3lh38g==@lists.openembedded.org
X-Gm-Message-State: AFuF++n6u+7JiciU6Pun2r0XMSwAz5DJr4V/w6sRs6VkOnxAbarV+Oyu
	DsaOF5NAu1QwWN32lZ8piOCcfcw0HLlklxBXajEy4BhdRCBkL/949EroMDeAJrjnqEc=
X-Gm-Gg: AYBFou2pECYMGN94f3RC4aPbzv6nAk/HhdmmZ7yQtv3xPz69U+s6bIfHgO/tiuLO1hA
	4coio0ZsMWtz1WkRI2su3xXXl0Vk6XNZxWIAwnmdN5ymEea5yuhwOXloyrxOxZ15KhFKp7pQMIR
	bFzE5QQKt37Y6AylndC5M45xjjoyEqjq9iQLQj51r4fxHh4P1Z4OckN0yuAvtg9googqCyEgZcR
	NR8URMvv+eds9gO6bE07XpU4Ad1M0NfgUhs2CL18Rde9UWP1bnafQS9fNY1Iv+pi+KI1LxKFguL
	1OG5Ioi6/f7/nt08WkmVAP5XlMaZpQku+cERGUbkb5pJI+ppYqjxe4bJYO4oIfHCI5ospUgQXY/
	ytEd98T+1fK2I0i1gFSAaJhPKILr8saFgD/AJyZjwjeDWrXdDFZTAxLJgaWg9e0kMilNpKkwW4R
	BP9tj84u6e8bzJszEiCZpkQFYy9UnmIugFOiWsSqIvbJptXdtXYjy854nV2KjREFkytGi9fnbpO
	3iBSuGaEqYDEYZGUO+EXIj8keFzh3RKy3OCZcz15wrJGhQSDvgu4mxWOIES
X-Received: by 2002:a5d:5e84:0:b0:486:f980:2367 with SMTP id ffacd0b85a97d-488670b8edemr258396f8f.48.1790095792229;
        Tue, 22 Sep 2026 09:49:52 -0700 (PDT)
Received: from localhost (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488626d29dasm6726746f8f.0.2026.09.22.09.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:49:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 18:49:50 +0200
Message-Id: <DLLZZXCT3K10.1PR6NH5N37YN4@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] gstreamer1.0-plugins-good: Fix for
 CVE-2026-3083, CVE-2026-3085
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260916084001.193028-1-hprajapati@mvista.com>
In-Reply-To: <20260916084001.193028-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 16:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246424

On Wed Sep 16, 2026 at 10:40 AM CEST, Hitendra Prajapati via lists.openembe=
dded.org wrote:
> Pick the patch from [1], also referenced in the Debian report [2] & [3].
>
> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/8349cdd35=
f85246e113b18e55fd11abf9cb248bf
> [2] https://security-tracker.debian.org/tracker/CVE-2026-3083
> [3] https://security-tracker.debian.org/tracker/CVE-2026-3085
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../CVE-2026-3083-CVE-2026-3085.patch         | 602 ++++++++++++++++++
>  .../gstreamer1.0-plugins-good_1.22.12.bb      |   1 +
>  2 files changed, 603 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/CVE-2026-3083-CVE-2026-3085.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
CVE-2026-3083-CVE-2026-3085.patch b/meta/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-good/CVE-2026-3083-CVE-2026-3085.patch
> new file mode 100644
> index 0000000000..095b511e2f
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-202=
6-3083-CVE-2026-3085.patch
> @@ -0,0 +1,602 @@
> +From 8349cdd35f85246e113b18e55fd11abf9cb248bf Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DBCller?=3D <tim@centricular.c=
om>
> +Date: Sun, 8 Feb 2026 16:09:04 +0000
> +Subject: [PATCH] rtpqdm2depay: remove element
> +
> +There is no plausible reason anyone should need this element in 2026
> +seeing that this was a streaming format produced by Darwin Streaming Ser=
ver
> +ca 2009 which hasn't been in active use for well over a decade.
> +
> +It is a maintenance burden and a security liability and there's no
> +good reason to keep it around.
> +
> +Fixes ZDI-CAN-28850, ZDI-CAN-28851, CVE-2026-3083, CVE-2026-3085, GST-SA=
-2026-0008.
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/10886>
> +
> +CVE: CVE-2026-3083 CVE-2026-3085
> +Upstream-Status: Backport [import from ubuntu gst-plugins-good1.0_1.20.3=
-0ubuntu1.5.debian.tar.xz
> +Upstream commit https://gitlab.freedesktop.org/gstreamer/gstreamer/-/com=
mit/8349cdd35f85246e113b18e55fd11abf9cb248bf]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + docs/gst_plugins_cache.json |  28 ---
> + gst/rtp/gstrtp.c            |   1 -
> + gst/rtp/gstrtpqdmdepay.c    | 411 ------------------------------------
> + gst/rtp/gstrtpqdmdepay.h    |  83 --------
> + gst/rtp/meson.build         |   1 -
> + 5 files changed, 524 deletions(-)
> + delete mode 100644 gst/rtp/gstrtpqdmdepay.c
> + delete mode 100644 gst/rtp/gstrtpqdmdepay.h

Hello,

This remove support for a format (this should have been mentionned in
the commit message!), per stable policy, this is not allowed.

Is there another way to fix these CVEs?

Regards,
--=20
Yoann Congal
Smile ECS


