Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98524D41D58
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 15:23:13 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11737.1765466585144149840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 07:23:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s3LYmGHg;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42e2d5e119fso132356f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 07:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765466583; x=1766071383; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2wdl7eHmZcLkX9GRSc3Hfnce+YRCKNWgKEBjv8A/rM=;
        b=s3LYmGHgfgfBmfLJxpe/WWSquUmJyxzqECXBsPt/rw6aVLVMAgNrG2i18zhG93Ix5X
         ybxGJGPs5OgZHgFwsEK6+4mWYOgtWPhsM5R4hLjbk6rZ7K/mpAp5CYY8/fX2uPK9suVC
         7FbNSbew8GJsJO8DWOAcAhImFubOjqU27hq78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765466583; x=1766071383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l2wdl7eHmZcLkX9GRSc3Hfnce+YRCKNWgKEBjv8A/rM=;
        b=FyRvZmgh29/8xbEDhcVRFQNFNcHLct9qpuSftLRYt3B6la+H5DPskNWuzdKBjLa2Hk
         gL7to6hzHNqj8zgmlgR0RLrTJiWE1RDMjSsS821Zs9EBOCXuH1/W2NlwdfV9i3FBPD0e
         IJE7qVSff+Ga6R5IeemB91N8Stq+PHhxWc5JOFvtEXr0UcAvBOgUkvdY4RcRoKmjnz1E
         hXtXOL3uXkrSNfehtjZisRXmSIU1bu+UFbgWT5i5UKRqxkfaR0d0zTFOCmz7i6VIAAOG
         ODf7S6fEwVo8AWHDi2Odbm5T2lil5vxCwcEA+uquY9FV55aBnFuVrAng56KlEC0bfYjM
         01OA==
X-Gm-Message-State: AOJu0YwSWdS6GqPqi3EyBNTluqDEwsU5xOa+HEyEr/hoNoWrq/7wrvfY
	Q4Uu98pzOIppkuobCIBC0cDCWLndag7J6wak9F1CXnhKmnBuPWX0P+Ud/A4eJWsu1FLeSHsQj+F
	rwDiEInWuUmu4JKtD0J2Vw8q/uh0qEQCmP9+3NCK9tQ==
X-Gm-Gg: AY/fxX5ECpF5DlOBw7M5oSusxj73MC7H4VrANWRQogA73/BZAlEpiyRvMmBKuHHDcDo
	0EhKYgnwwxVnO9CMe38MI5HzXt7H7qZ1u/BA5AVtjcssZyU/m5ZCqyp5uNYNycUX777RPwm0zUe
	LvVR3ByrE10QFq7M5/M4bQcZAArD+45QmgNwYcCdclgbt0goUc/BKZBecSdB+qCutsayx/G1SAN
	AuCHsY5PZHMkAcb1VlaeHPdOOxOB/YjGvRjJ10J6gHlsFD2eqA5BKn+s3cs0pOjO156gu39wg3i
	328045UlVZnuk7Q7yVdzd10+vmR+
X-Google-Smtp-Source: AGHT+IH5WB3bHN1R+lOZkTDC4Nw5ZVW1c9rGdwidVc6HxYzX876rnnFr+DqOcZzjmNKeu2SY+KvwWVkN2hDHDevR/ws=
X-Received: by 2002:a05:6000:220c:b0:429:d0b8:3850 with SMTP id
 ffacd0b85a97d-42fa3b1884amr7041572f8f.48.1765466583406; Thu, 11 Dec 2025
 07:23:03 -0800 (PST)
MIME-Version: 1.0
References: <20251211144527.43224-1-amaury.couderc@est.tech>
In-Reply-To: <20251211144527.43224-1-amaury.couderc@est.tech>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 11 Dec 2025 16:22:37 +0100
X-Gm-Features: AQt7F2p4pISnUJux2Nmf7u-l25qub69lNUMDKFdaT_zJVrGce8WHZLQWx8d45eI
Message-ID: <CAMSfU+4L=O=Xj+UsO4VZO819uNZMORo5pE3ZY8RgfC4xiEB4Zg@mail.gmail.com>
Subject: Re: [review][OE-core][scarthgap][PATCH] procps: fixed large pid issue
 with top
To: amaury.couderc@est.tech
Cc: openembedded-core@lists.openembedded.org, david.nystrom@est.tech
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 15:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227546

Hello,

Le jeu. 11 d=C3=A9c. 2025 =C3=A0 15:46, amaury.couderc via
lists.openembedded.org
<amaury.couderc=3Dest.tech@lists.openembedded.org> a =C3=A9crit :
>
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> procps: fixed large pid issue with top
>
> top -b -n1 -H -p 92233720368547758071
> signal 11 (SEGV) was caught by top, please
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>

It looks like this patch is also applicable&needed on master (the
fixing patch has not been in a procps release yet).
Can you send it there, then, ask for a backport on scarthgap when it
gets merged?

Thanks!

> ---
>  .../procps/procps/top_large_pid_fix.patch     | 52 +++++++++++++++++++
>  meta/recipes-extended/procps/procps_4.0.4.bb  |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-extended/procps/procps/top_large_pid_fix=
.patch
>
> diff --git a/meta/recipes-extended/procps/procps/top_large_pid_fix.patch =
b/meta/recipes-extended/procps/procps/top_large_pid_fix.patch
> new file mode 100644
> index 0000000000..d7e3141e06
> --- /dev/null
> +++ b/meta/recipes-extended/procps/procps/top_large_pid_fix.patch
> @@ -0,0 +1,52 @@
> +From f21fc624d960d12afa399af7333d4f9193fb2ffb Mon Sep 17 00:00:00 2001
> +From: Jim Warner <james.warner@comcast.net>
> +Date: Tue, 16 Sep 2025 12:00:00 -0500
> +Subject: [PATCH] library: avoid possible segmentation fault, <pids> api
> +Upstream-Status: Backport
> +[https://gitlab.com/procps-ng/procps/-/commit/5461b50b1a85c5e556c4cd2739=
ca8ffdbc69399a]
> +
> +In the issue referenced below, that SEGV was caused by
> +passing a '-1' pid to the procps_pids_select function.
> +That value, in turn, is caused by providing a LONG_MAX
> +or greater number for what was assigned to an integer.
> +
> +So, this commit will help ensure we avoid a match when
> +we should fail plus skip some unproductive libc calls.
> +
> +[ the same problem occurs in that old 3.3.17 library ]
> +
> +Reference(s):
> +https://gitlab.com/procps-ng/procps/-/issues/394
> +
> +Signed-off-by: Jim Warner <james.warner@comcast.net>
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +
> +---
> + library/readproc.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/library/readproc.c b/library/readproc.c
> +index 2dfe4c9e..d0e039bf 100644
> +--- a/library/readproc.c
> ++++ b/library/readproc.c
> +@@ -1434,7 +1434,7 @@ static int listed_nextpid (PROCTAB *PT, proc_t *p)=
 {
> +   pid_t pid =3D *(PT->pids)++;
> +   char *path =3D PT->path;
> +
> +-  if (pid) {
> ++  if (pid > 0) {
> +     snprintf(path, PROCPATHLEN, "/proc/%d", pid);
> +     p->tid =3D p->tgid =3D pid;        // this tgid may be a huge fib |
> +
> +@@ -1546,7 +1546,7 @@ PROCTAB *openproc(unsigned flags, ...) {
> +         did_stat =3D 1;
> +     }
> +     PT->taskdir =3D NULL;
> +-    PT->taskdir_user =3D -1;
> ++    PT->taskdir_user =3D -2;
> +     PT->taskfinder =3D simple_nexttid;
> +     PT->taskreader =3D simple_readtask;
> +
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-extended/procps/procps_4.0.4.bb b/meta/recipes-=
extended/procps/procps_4.0.4.bb
> index ec8c4b0261..3c15f28a5b 100644
> --- a/meta/recipes-extended/procps/procps_4.0.4.bb
> +++ b/meta/recipes-extended/procps/procps_4.0.4.bb
> @@ -15,6 +15,7 @@ inherit autotools gettext pkgconfig update-alternatives
>  SRC_URI =3D "git://gitlab.com/procps-ng/procps.git;protocol=3Dhttps;bran=
ch=3Dmaster \
>             file://sysctl.conf \
>             file://pidfd.patch \
> +           file://top_large_pid_fix.patch \
>             "
>  SRCREV =3D "4ddcef2fd843170c8e2d59a83042978f41037a2b"
>
> --
> 2.50.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227538): https://lists.openembedded.org/g/openembedde=
d-core/message/227538
> Mute This Topic: https://lists.openembedded.org/mt/116729698/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yo=
ann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
Yoann Congal
Smile ECS

