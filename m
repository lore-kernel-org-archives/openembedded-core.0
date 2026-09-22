Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6027DC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 11:52:45 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8247.1790077960200021381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 04:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3KGD7ap0;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so1690821f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 04:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790077958; x=1790682758; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l43Nc98f4aKHkySZuSVvpHQhJjuWBe7Qtnv0Al71/zw=;
        b=3KGD7ap0QDjGqTKefW6uBATFMDvgW/TBFc3E4B38/vBRPWNAV3jEpy8LrrdjafFLun
         AXAzPr2T7SdDqwxDTQtjywXASVYSlJblujuvZfbEXS8f9+s5uuyRH7ewuSjjgXicgXYV
         ylq0VYBWViH7aKlVidSB6CdLbCuCw0MElF30w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790077958; x=1790682758;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l43Nc98f4aKHkySZuSVvpHQhJjuWBe7Qtnv0Al71/zw=;
        b=Wy5xQNO5sihv73aBO8Lnd/RnM4OFgVnuqrHDjNSmfrT2m3f213B/QL5rwkezvoQfYj
         V43ZjoUzXfPcXW9sb2NOLDQBsZEvesCcrZLIHrz7kCbOwXi2uYYe8xlEgqZ80SlGfzje
         KsYcIznLUeQTsm7ghau3dvmazgEx2Je6Ij+h2E0GxYuMfdHYlnBX95n+rX2xlvFv9VrK
         3RRtVWqCeHCqmFDb10pCmuFTcUfuQSILFvIwIbPBcc9dDkRr5ziaOBFrk1NWa1N2vYoE
         XB/PQi/XsnxFuJu+ZfymT+f+p8fxlGkg1WxXNIooYmC/4Ox3w/9CvOasGTenu26rzeLD
         fslw==
X-Forwarded-Encrypted: i=1; AKwUvBwwIc4YX14o8Ygg1ku5NMdhtq4ZYaL+muBXuodLvjr5HVTk4z5wpR2KkDKtt0a3M/X+D9iAMD+agKS0JvqYEAkuyQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++lyRo1CpHBfv4fe3+cCu7AGWdGpm2jMsRiVTItkpCMe7k3ic0o/
	eDx9QfFg8hEb70Nm66xjN8mAjrLww0f6Tp0G5oESG+mnrfaY5+hnybrx6UHtOwYNyeo=
X-Gm-Gg: AYBFou1Nkwdy09RJqVZSdd5jf7ZszI37LJXe1DDqDbVNuHJenkYQY8oAQYOxBOeeKzk
	jsUiII1CJqwUf7U06+x6g9e2eFDFMdAsO1XKRF4Y28YfsyDyDcIDIyqye6MqEJpu7wuSBiYT89U
	KeDxz9LfN+e9VSAlqwUzZe3ajfvSMCcgRsrWTG+u2UWsZib+faSkIxWhWK4sLYTf7Y0kxcEAYJ7
	iqJ8qS4J9HQ9mY3zGDGGdPPswLiIVEs1IEDim3Xv+qUphJGWgT/73/Ukt0OIzJKFhx4SbYr9Z7n
	ZH/ScHIah757FpPhsRE3+BJ8XYTxKXyVE2Le2kqpogNgBvXorGzhsPF0iWlNGeW3b9tqyNL8d2h
	nqemRf+LGOjckjBNVqiUVjj4zyNOmYoth2tCLtMeB2FQi8158TULQHuUmzZPonGGCRFkGReNQS4
	ztlzJVpsx117wov7ZUH6LSgj0yqakA/C+CcD+qvn4IaaBXipr5FKq7TVD+us2ZtZM4oHEAokoXo
	9FtmfT9KbcgoZZnhm8qh4z1LoXO0dJWmT7IZZnAn336D4NIdG+b+h/sxiI=
X-Received: by 2002:a5d:5d88:0:b0:487:18ba:c0de with SMTP id ffacd0b85a97d-4871e269e9dmr22218226f8f.27.1790077957384;
        Tue, 22 Sep 2026 04:52:37 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862795232sm4533618f8f.32.2026.09.22.04.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:52:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 13:52:36 +0200
Message-Id: <DLLTOCN1XYN3.12L0QQ45RSBW8@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] fs-util: try AT_EMPTY_PATH for
 access_fd() first
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Suresh H A" <Suresh.HA@bmwtechworks.in>
To: <UpStream_IP-SH@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>, <suresh.ha@bmwtechworks.in>
X-Mailer: aerc 0.20.0
References: <20260902102403.4010166-1-UpStream_IP-SH@bmwtechworks.in>
In-Reply-To: <20260902102403.4010166-1-UpStream_IP-SH@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 11:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246406

Hello,

This is a patch for systemd, so the title should start with "systemd:".

On Wed Sep 2, 2026 at 12:24 PM CEST, Suresh H A via lists.openembedded.org =
wrote:
> From: Suresh H A <Suresh.HA@bmwtechworks.in>
>
> Backport a fix to try AT_EMPTY_PATH for access_fd() first

What issue does this patch fix?

> Fix is already available since systemd v257-rc1.
>
> Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
> ---
>  ...ry-AT_EMPTY_PATH-for-access_fd-first.patch | 37 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-fs-util-try-AT=
_EMPTY_PATH-for-access_fd-first.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0023-fs-util-try-AT_EMPTY_=
PATH-for-access_fd-first.patch b/meta/recipes-core/systemd/systemd/0023-fs-=
util-try-AT_EMPTY_PATH-for-access_fd-first.patch
> new file mode 100644
> index 0000000000..29dd86c850
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0023-fs-util-try-AT_EMPTY_PATH-fo=
r-access_fd-first.patch
> @@ -0,0 +1,37 @@
> +From 55453c9671934fc7ee369788eb0a1a9c8c850e8f Mon Sep 17 00:00:00 2001
> +From: Mike Yuan <me@yhndnzj.com>
> +Date: Mon, 20 May 2024 19:33:26 +0800
> +Subject: [PATCH] fs-util: try AT_EMPTY_PATH for access_fd() first
> +
> +Upstream-Status: Backport
> +[https://github.com/systemd/systemd/pull/32933/commits/c675851d5fd503c1a=
e5d244f041d43ae9e3ab79b]
Please don't split the line here.

This patch comes from a PR titled "fs-util: several cleanups": Cleanups
are not usually acceptable on stables. You will need to argue why we
need to merge this patch.

> +Comment: Patch is refreshed as per codebase of v255

I don't see any change with upstream. No need to add a comment like this
if there is no meaningful change.

> +Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
> +---
> + src/basic/fs-util.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
> +index ee38e0266a..0f65af1a07 100644
> +--- a/src/basic/fs-util.c
> ++++ b/src/basic/fs-util.c
> +@@ -664,6 +664,14 @@ int unlink_or_warn(const char *filename) {
> + int access_fd(int fd, int mode) {
> +         /* Like access() but operates on an already open fd */
> +=20
> ++        if (faccessat(fd, "", mode, AT_EMPTY_PATH) >=3D 0)
> ++                return 0;
> ++        if (errno !=3D EINVAL)
> ++                return -errno;
> ++
> ++        /* Support for AT_EMPTY_PATH is added rather late (kernel 5.8),=
 so fall back to going through /proc/
> ++         * if unavailable. */
> ++
> +         if (access(FORMAT_PROC_FD_PATH(fd), mode) < 0) {
> +                 if (errno !=3D ENOENT)
> +                         return -errno;

You can either:
- send a v2 with the missing justification for merging the patch
- discuss it here first.

Thanks,
--=20
Yoann Congal
Smile ECS


