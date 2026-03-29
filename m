Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF82FC9814
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:43:09 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38678.1774824181190673459
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=my+LqvUC;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so45831165e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774824179; x=1775428979; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7htLlhXNfRM2tbHrIjdByzJN6gSllMUYQFRA0OXfifg=;
        b=my+LqvUCFNx9X+XtHbPjZLVaqDL2ROyivnIjo0rTnucaGlb5IRonqo9T9aBP6mjTjR
         eqHKtXz2ohyeD1QXnf6RevCs4BSbXRMVGKHmRFZdJuHnkKeJvhpYcpYuzkBEqs9awHqD
         esFaMT4aTQwvXm6emSwcsj+B2HusY7hImNN8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824179; x=1775428979;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7htLlhXNfRM2tbHrIjdByzJN6gSllMUYQFRA0OXfifg=;
        b=hPlGdHl5GP17ttHhnlU3SHyrzReoI0Q7kqp+D2h/WO/1C+YmeqsSFJrxTUEGIAqsZt
         2pXq6UN1UAfy7/+5uolHRYe9zYsABYi0rg0fBByjbR552bQ+TaWrSX/6iOUFgCs1yX4c
         kfWmON0EWLObK8OD/D/TsPUuhQZ1LWkfwUQzWhRKynOkMon3CuTYxufsyKh/A+ci6ill
         eWoGeYXgLZpQ4BqI4dAgZzfOsYRBTP03YQ+9bOeMSPcy2pSL4jxgkz0RPCo3V2rE6eh0
         i634b0I2YQyzcHj8jqBhJuDDJqSDcWLnLL/rsz1BvRby5ILWxYrqaEeStq5oQh8NkvyF
         yk+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTQH0NTGVbU+q9XQJdGbLszWuQzadm26SK6vYWKO7uZJ5us/uWFq1Z8V3Q54GwH+GHgv0LkeYXgTXXDmuKtQo5uA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyS1D+jUXUiw/zxLy6AB166wlkAVhbwHqJ3LqDszZuZZNsm3MPa
	eDbcfkCtVLoIOc1GA15FWGLF4eBxxWVmATj7CoLqOCm46lQafWSq/VxOhX3vnPZKC9w=
X-Gm-Gg: ATEYQzzm2BwHJ5EMl7BEnOMzERFU8YnXyijLUMLsAvte6nV9Xf2Sh9nNlRKzzkEYyXx
	i81mgAxU6q67RlBRexizTzVkPLNW4Dryku7dSRoSkzPelwEpoU3GoInEp2u/joNM9+CylT0nWQE
	eBn53iWHa2YyyuXZkBE0CYkirVaKHTz9Rg1RraaVYDz8mjQ4xEZDdImb1aEo2XkFbEvwzW/hp8U
	YBAp6ErKGZLuyV7dzkQ7P3OKmthm2xg0g994UZLJpdGv0jIA5rJupDZNImoOIOBdD0PMkq/L6ou
	RqJJxQ0GGUEcaUCQn5/4RVBpsfURGUNQWV/4jxbpWwCwcIKoQre/bo5dMgq5yTV/oAPj8G3dNzZ
	yPs6fsIL02xa/X7NLFuEuwbt3CHNsMWQljB+l7CG8b81Q1R5fXX33wpJA9annZsdOD+yxp0tCr/
	wQEHr0q7fcR8y+niaNC+xKgR8f1Erd8LoOHTKYCF3eAmm1ju5MQKSAGtulcb4ZHmU6X66Bg3XZ2
	UVueaol4QAESB0=
X-Received: by 2002:a05:600c:4685:b0:485:3fa9:358c with SMTP id 5b1f17b1804b1-48727eeac8bmr183376315e9.17.1774824179567;
        Sun, 29 Mar 2026 15:42:59 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873881c195sm30606415e9.9.2026.03.29.15.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 15:42:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 00:42:59 +0200
Message-Id: <DHFMNVW9ZVEV.29R24OVVFJNN4@smile.fr>
Subject: Re: [OE-core][scarthgap 13/16] systemd: backport patch to fix
 journal-file issue
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1774823430.git.yoann.congal@smile.fr>
 <5c63919aec50486f218123890585d791c0e45aab.1774823430.git.yoann.congal@smile.fr>
In-Reply-To: <5c63919aec50486f218123890585d791c0e45aab.1774823430.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234177

On Mon Mar 30, 2026 at 12:37 AM CEST, Yoann Congal wrote:
> From: sureshha <suresh.ha@bti.bmwgroup.com>
>
> Backport patch to fix systemd journal-file assertion on removed or corrup=
ted files
>
> Extracted from systemd MR:
> https://github.com/systemd/systemd/pull/40378
>
> Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---

I did not wanted to send that patch, please ignore.

>  ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-file-d=
o-not-trigger-assertion-on-removed-or-.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-t=
rigger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/0=
023-journal-file-do-not-trigger-assertion-on-removed-or-.patch
> new file mode 100644
> index 00000000000..5f5551870ac
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-=
assertion-on-removed-or-.patch
> @@ -0,0 +1,65 @@
> +From 1350f39db7e72116c3b2423db02da3ddc8e29082 Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Sun, 18 Jan 2026 19:15:31 +0900
> +Subject: [PATCH] journal-file: do not trigger assertion on removed or
> + corrupted journal file
> +
> +When a journal file is removed or corrupted, then the value `p`, which i=
s
> +read from Object.data.entry_offset, may be zero.
> +
> +Note, journal_file_move_to_object() checks the passed offset and return
> +-EBADMSG if it is invalid.
> +
> +Fixes the issue reported at
> +https://github.com/systemd/systemd/pull/40372#issuecomment-3762907261.
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/218=
5c30de333b09f46ef28b743b123f45e774738]
> +
> +Comment: Patch is refreshed as per codebase of v255
> +
> +Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
> +---
> + src/libsystemd/sd-journal/journal-file.c | 7 +++----
> + 1 file changed, 3 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/s=
d-journal/journal-file.c
> +index 08f3b82..633de5b 100644
> +--- a/src/libsystemd/sd-journal/journal-file.c
> ++++ b/src/libsystemd/sd-journal/journal-file.c
> +@@ -3305,7 +3305,9 @@ use_extra:
> +
> + static int test_object_offset(JournalFile *f, uint64_t p, uint64_t need=
le) {
> +         assert(f);
> +-        assert(p > 0);
> ++
> ++        if (p <=3D 0)
> ++                return -EBADMSG;
> +
> +         if (p =3D=3D needle)
> +                 return TEST_FOUND;
> +@@ -3341,7 +3343,6 @@ static int test_object_seqnum(JournalFile *f, uint=
64_t p, uint64_t needle) {
> +         int r;
> +
> +         assert(f);
> +-        assert(p > 0);
> +
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +@@ -3382,7 +3383,6 @@ static int test_object_realtime(JournalFile *f, ui=
nt64_t p, uint64_t needle) {
> +         int r;
> +
> +         assert(f);
> +-        assert(p > 0);
> +
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +@@ -3423,7 +3423,6 @@ static int test_object_monotonic(JournalFile *f, u=
int64_t p, uint64_t needle) {
> +         int r;
> +
> +         assert(f);
> +-        assert(p > 0);
> +
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +--
> +2.34.1
> diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-c=
ore/systemd/systemd_255.21.bb
> index 87e186bbfac..504d6cbef60 100644
> --- a/meta/recipes-core/systemd/systemd_255.21.bb
> +++ b/meta/recipes-core/systemd/systemd_255.21.bb
> @@ -29,6 +29,7 @@ SRC_URI +=3D " \
>             file://0002-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
>             file://0003-timedated-Respond-on-org.freedesktop.timedate1.Se=
tNT.patch \
>             file://0008-implment-systemd-sysv-install-for-OE.patch \
> +           file://0023-journal-file-do-not-trigger-assertion-on-removed-=
or-.patch \
>             "
> =20
>  # patches needed by musl


--=20
Yoann Congal
Smile ECS


