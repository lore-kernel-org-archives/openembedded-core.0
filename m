Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D706C31D97
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 13:38:06 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.50520.1720013878307246040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 06:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=C2+RLJcL;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.175, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e03a6c1741eso1313535276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 06:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720013877; x=1720618677; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wc+emlNC5ald+mzbEfoGxifRSSSklaWf5AX43oIsORs=;
        b=C2+RLJcLjs5Wl93n3bXUz/9UOZFRa6BlHo5un6jMRfj7YUtkPWkVz/7oul3r5iZCBw
         uyMQGSzrdWSYQM44ezOZ1KwCvTMghjqLKSaHTDjhPszz+rnX5/V8AIT5pFKv9Ix8Gnfn
         JHoJFPsecOoJdw5UTo4PIvD+p8Rgw4nV5WmvsGHw1oEDfGeb71jSAFqW0vDWjLuVpO2A
         Alx6rKlqFHoS3KpdGw6/k3FGOYgBv5fzhafiONB0rcEJJbQj076fuWUGsq8+4KFcxOK9
         krwdRiv9NV/gT81VLtpeC78ZJFUsqiJ5fbMNuqOQIOZ8+ryEi0BYb+2KxAzKBbomjMRy
         3ESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720013877; x=1720618677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wc+emlNC5ald+mzbEfoGxifRSSSklaWf5AX43oIsORs=;
        b=vhAJZWJym8YmUIdoSZPiFeFgwaEUwl2dKn04L02FBpFXdOx72+YeX0ofB8ikpYIa2U
         ybKSJhIJ2PhEFexbMoRxQgIyKMIwz4iQCRAa4g7gvuSYpEuLMCSw+6avzWD1z9VROGCy
         ezp2eOMF40EOKde19jsqGxSCupUcTxAR/7/AIgfiuMicgia/f2Oi3ndeQ9Nhdg4EDKU8
         +ZHS2mW7hiq9kMzm5qlND6stBchFxetE46LVUdQI/LP0uXbyLdZlP3y7QluhfJFlNtR2
         ZvzrfZ5j1zNwc7ZFYleQeJ8rBxm52raATY+kt2FPb5d0av8lLCT5NNxlL6D1M6DphAod
         FtHA==
X-Gm-Message-State: AOJu0YzLO2T7Fv0md53L2qct03FVcb3++zASdH46MghNjVFQnxCvbjDz
	HbdAenvesTB4fbyyF0f86zXDHLrRuwjjkxICglyBVyBFu1IDz/LAO6Fa3ulI82PnG4YyKeTgjgE
	3vG2Bw4HGk0dA5SWmyqep+O+l7PukEGlHf27Vrsanzh+dpIIG
X-Google-Smtp-Source: AGHT+IFI8zBzNoSlxdr8798pZ58X5REunEr7cfAHPa8ncWicwBJqAlK9g2Es/UZkedtjNN6ZTgrs2NVXD2yPbWPLmNs=
X-Received: by 2002:a81:f10d:0:b0:62f:945a:7bb1 with SMTP id
 00721157ae682-64c73226a28mr119861037b3.42.1720013877360; Wed, 03 Jul 2024
 06:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240703121701.175028-1-jose.quaresma@foundries.io>
In-Reply-To: <20240703121701.175028-1-jose.quaresma@foundries.io>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 3 Jul 2024 06:37:46 -0700
Message-ID: <CAOSpxdY6VC2ZH8DGVpvFV0tO5=O6pvHnL7LKhgnXnQQw1Hfc8A@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] openssh: fix CVE-2024-6387
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 13:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201476

On Wed, Jul 3, 2024 at 5:17=E2=80=AFAM Jose Quaresma via
lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
>
> sshd(8) in Portable OpenSSH versions 8.5p1 to 9.7p1 (inclusive).
> Race condition resulting in potential remote code execution.
> A race condition in sshd(8) could allow remote code execution as root on =
non-OpenBSD systems.
> This attack could be prevented by disabling the login grace timeout (Logi=
nGraceTime=3D0 in sshd_config)
> though this makes denial-of service against sshd(8) considerably easier.
> For more information, please refer to the release notes [1] and the
> report from the Qualys Security Advisory Team [2] who discovered the bug.
>
> [1] https://www.openssh.com/txt/release-9.8
> [2] https://www.qualys.com/2024/07/01/cve-2024-6387/regresshion.txt
>
> References:
> https://www.openssh.com/security.html
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  .../openssh/openssh/CVE-2024-6387.patch       | 27 +++++++++++++++++++
>  .../openssh/openssh_9.6p1.bb                  |  1 +
>  2 files changed, 28 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2024-63=
87.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patc=
h b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
> new file mode 100644
> index 0000000000..3e7c707100
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
> @@ -0,0 +1,27 @@
> +Description: fix signal handler race condition
> +Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/openssh/+bug/20704=
97
> +
> +CVE: CVE-2024-6387
> +
> +Upstream-Status: Backport
> +https://git.launchpad.net/ubuntu/+source/openssh/commit/?h=3Dapplied/ubu=
ntu/jammy-devel&id=3Db059bcfa928df4ff2d103ae2e8f4e3136ee03efc

Launchpad is not the upstream for openssh, please send a V2 that
references the actual upstream commit.

Thanks!

Steve

> +
> +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> +
> +--- a/log.c
> ++++ b/log.c
> +@@ -452,12 +452,14 @@ void
> + sshsigdie(const char *file, const char *func, int line, int showfunc,
> +     LogLevel level, const char *suffix, const char *fmt, ...)
> + {
> ++#if 0
> +       va_list args;
> +
> +       va_start(args, fmt);
> +       sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_FATAL,
> +           suffix, fmt, args);
> +       va_end(args);
> ++#endif
> +       _exit(1);
> + }
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.6p1.bb
> index d941664b41..3cdf0327b0 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> @@ -27,6 +27,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
>             file://add-test-support-for-busybox.patch \
>             file://0001-regress-banner.sh-log-input-and-output-files-on-e=
rro.patch \
>             file://0001-systemd-Add-optional-support-for-systemd-sd_notif=
y.patch \
> +           file://CVE-2024-6387.patch \
>             "
>  SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd8119dd536=
2de09385aa7a777c"
>
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201470): https://lists.openembedded.org/g/openembedde=
d-core/message/201470
> Mute This Topic: https://lists.openembedded.org/mt/107018061/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

