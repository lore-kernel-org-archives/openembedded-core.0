Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35344C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 16:04:34 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.2398.1746806671759424038
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 09:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Apd2sfeX;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.169, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70a2a42eb3eso25929017b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 09:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746806671; x=1747411471; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqYKqEGQTBV27at6IkFgVSmGbIExDvb330+QPxHM27g=;
        b=Apd2sfeXo4fzdelEzrSB2HqJwJxRui50ONlQk1yYG0MQGZwBwdSh0fDyl+nlNec11h
         /fBioxNVTpG626GsqgLot8zd4vtBqFfNuNDwhUaP5atd2aSah0673cdw5E4Zdb+oudox
         gMQZTE19bXqwqIIaCTsYiv5jh9rDVGQKLsTIfC1zEeIPhEt12qbCevx4Jcn6k66oPdOR
         p7sZ825JcT2vN4jk6UzRzR8UbHYVKJOyitQKpiOdDeEfrJbsTQDUM8ZQ6OY+rg3AuzGG
         0vJKG6dM87a9FRDObxVZhzKSNVx/KQ2HPzkC5Q/7LhnYm37KyglHcFI5exUrvsJPzyDO
         uxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806671; x=1747411471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqYKqEGQTBV27at6IkFgVSmGbIExDvb330+QPxHM27g=;
        b=YahEYVc5phsMrBUN3zO3aeikmVDsCqlxf/NAjfgBRdTA/yPBwCxLpLcS6oZUc37RMH
         eoAmpxyruUhwOorQvewcQ70Rp9R35Mwm6h/ls2IU9nSsrh9Fglla/4WD/2ev1d18DPsR
         L2wp7++OVspcSZFO0OrElzOnZk4/cYdzq5INrumd9duVemQdFuuYjlBHKra8gtIhlOvT
         O2BhRm2fkMWJd4hlYqKaubZwisuBtEEN0Y2uXVFvzrnRowPEvAFAek4S5Z9dQnjo4PRB
         +q37JGAhVlIYZY/UWruRCnhoXekYfP8ZNKx0fx+rnxp9VvcfIIZktTKPYJMuGhNo+tSt
         5XfQ==
X-Gm-Message-State: AOJu0Yy+B8WdQwQoQ+0+3e9xlBeKHEOOmfx4Toiz00MxHTbrysuLVgg9
	mbS70Bmihgor5ahvakfHGILNUlmQavt2x+SSXjYkjA3ubaZA0jiotBhf+aC/ARWuGGREnj38uzl
	+LNgxuogSYQIxCt2gfzByoDfa2bKb9HYNpAAn2ZlfbTRhTNES
X-Gm-Gg: ASbGncv7M4HFYFhRp6KISIyCuLmfgxiGZaOhTLGmsTC86nHn6K2uqqeBLbzA+4VALEe
	1D3AAfkn5ycjVKHVU1EZ86GK520S3XIohptKA02Pe9n0TGulXIJTnwTGxhmrtbCxwy5UvmV2WfC
	En4JH55hAAK6mHBtGFP0wo1bFFvGiXF+Cw91DbNEuAKMBtRR++5hoHLA==
X-Google-Smtp-Source: AGHT+IHcW0D4Pjpj7qJqJwjHA1mgUnU39T0hDHDrsNa2S8B4DVX8fHUI+CjV0bRXTbupBYKESV7QB3+E0ZkaIEnyTmo=
X-Received: by 2002:a05:690c:7091:b0:6f9:97af:b594 with SMTP id
 00721157ae682-70a3fa15c87mr56714867b3.10.1746806670701; Fri, 09 May 2025
 09:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250509102228.3422688-1-archana.polampalli@windriver.com> <20250509102228.3422688-4-archana.polampalli@windriver.com>
In-Reply-To: <20250509102228.3422688-4-archana.polampalli@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 9 May 2025 09:04:19 -0700
X-Gm-Features: AX0GCFu0Xe4c80cNMvsrWkz9EXhbZUa9b2sd9Dtcqmp4kdlv-648jEj722BgWVg
Message-ID: <CAOSpxdbktkdVESY0z3az=cO=V6-vhd3g2hdnA3u5O6WGr9DBDg@mail.gmail.com>
Subject: Re: [oe-core][Walnascar][PATCH 4/5] openssh: fix CVE-2025-32728
To: archana.polampalli@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 16:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216235

Hi Archana,

You'll need to send this patch for the master branch before I can take
it for walnascar.

Thanks!

Steve

On Fri, May 9, 2025 at 3:22=E2=80=AFAM Polampalli, Archana via
lists.openembedded.org
<archana.polampalli=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> In sshd in OpenSSH before 10.0, the DisableForwarding directive does not =
adhere to the
> documentation stating that it disables X11 and agent forwarding.
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../openssh/openssh/CVE-2025-32728.patch      | 43 +++++++++++++++++++
>  .../openssh/openssh_9.9p2.bb                  |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-32=
728.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.pat=
ch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch
> new file mode 100644
> index 0000000000..db47947b42
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch
> @@ -0,0 +1,43 @@
> +From fc86875e6acb36401dfc1dfb6b628a9d1460f367 Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Wed, 9 Apr 2025 07:00:03 +0000
> +Subject: [PATCH] upstream: Fix logic error in DisableForwarding option. =
This
> + option
> +
> +was documented as disabling X11 and agent forwarding but it failed to do=
 so.
> +Spotted by Tim Rice.
> +
> +OpenBSD-Commit-ID: fffc89195968f7eedd2fc57f0b1f1ef3193f5ed1
> +
> +Upstream-Status: Backport [https://github.com/openssh/openssh-portable/c=
ommit/fc86875e6acb36401dfc1dfb6b628a9d1460f367]
> +CVE: CVE-2025-32728
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + session.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/session.c b/session.c
> +index aa342e8..eb932b8 100644
> +--- a/session.c
> ++++ b/session.c
> +@@ -2191,7 +2191,8 @@ session_auth_agent_req(struct ssh *ssh, Session *s=
)
> +       if ((r =3D sshpkt_get_end(ssh)) !=3D 0)
> +               sshpkt_fatal(ssh, r, "%s: parse packet", __func__);
> +       if (!auth_opts->permit_agent_forwarding_flag ||
> +-          !options.allow_agent_forwarding) {
> ++          !options.allow_agent_forwarding ||
> ++          options.disable_forwarding) {
> +               debug_f("agent forwarding disabled");
> +               return 0;
> +       }
> +@@ -2586,7 +2587,7 @@ session_setup_x11fwd(struct ssh *ssh, Session *s)
> +               ssh_packet_send_debug(ssh, "X11 forwarding disabled by ke=
y options.");
> +               return 0;
> +       }
> +-      if (!options.x11_forwarding) {
> ++      if (!options.x11_forwarding || options.disable_forwarding) {
> +               debug("X11 forwarding disabled in server configuration fi=
le.");
> +               return 0;
> +       }
> +--
> +2.25.1
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.9p2.bb
> index 5191725796..8d3ea4d632 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
> @@ -25,6 +25,7 @@ SRC_URI =3D "https://ftp.openbsd.org/pub/OpenBSD/OpenSS=
H/portable/openssh-${PV}.ta
>             file://sshd_check_keys \
>             file://0001-regress-banner.sh-log-input-and-output-files-on-e=
rro.patch \
>             file://0001-regress-test-exec-use-the-absolute-path-in-the-SS=
H-e.patch \
> +           file://CVE-2025-32728.patch \
>             "
>  SRC_URI[sha256sum] =3D "91aadb603e08cc285eddf965e1199d02585fa94d994d6cae=
5b41e1721e215673"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216195): https://lists.openembedded.org/g/openembedde=
d-core/message/216195
> Mute This Topic: https://lists.openembedded.org/mt/112896255/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

