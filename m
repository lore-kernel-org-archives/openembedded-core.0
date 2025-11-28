Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638D7CFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 14:00:50 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16446.1764338445323585670
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 06:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lNVGZCKu;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8804ca2a730so27294196d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764338444; x=1764943244; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jIx1wpJOLvzvIrBlpTq7dDztaQ55Ze790BE1jyTxh3A=;
        b=lNVGZCKuAdfUpC0VohqoSM7P4ubQZk2azgRkYTYsunAcdm0IgNfjF315PMN/vhRzvO
         VZ9ILYNYzhcVvyR1L0qy895iAyCobD7i3mOZDULJ6A/nzrFjL4J2n8ZYN1lTBZcConu7
         9Pq1uB5X81S5n/i9blevZDWwsQqZKXpelpWAG8I1WNc3nXbR9Kj7mRxWsI7IggR2mKOM
         UJbFzZkugUakKbwK6WOG1fyljnO5QtZxizhITLjSU7n6XCTd9U9Q1eSUb3cPE7pFUTKx
         ykcEhRgk5hOgz4dirLGJbfZkgSrCBaJ3XBV+GvXhU9f1fn3WvXzFdHfHBGzdPmeWDlRx
         gr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764338444; x=1764943244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIx1wpJOLvzvIrBlpTq7dDztaQ55Ze790BE1jyTxh3A=;
        b=qou1G5joqc8mQLEbxN4r9WLGJymuXQKrC2kBPTzDee5YPYmShExkkYhKBowUW34J5l
         yODf7+mj8Plu4wn9yitMqM7p0VYWy2n5Scspmsad5DJW1hsdSljTO4aQ+YSjLONlUAdz
         xAtGPHBE7Q/AgH4m3PVPQvlXHtIKGRBepSiC3FQKMYFYDSGrMaA0a2LZloFubJG88zVJ
         60QEpZ/OgBfzC/4cvWbbt69vmofJYBU6yUDvxGtg9UWk4JZOwcjJ09GU4R1PLQY7VRIT
         rEBkHnjdUlz2DtLmiJR0pmcw5OCfZUfLmnkHSwENNaavpMs4UEy9KmI5IhwtyIQNbtO6
         Bs7A==
X-Gm-Message-State: AOJu0YzPzM9aPbzOpwmiT5iW+kTYwfb0sLw0P1gEA6n6Ih3yYCq97+qQ
	h10JvAO/3vaFLbNCeY+YOQ68/HtPISU9j9D6CDaQOID4MPMQvB5nmRd3ZSN1gAf86wb2vyTp4s2
	QoaOMPO6Y+yshVL6D+PQK7DL1icuKSN6/TQ==
X-Gm-Gg: ASbGnctmKLOZ4ZKuzEB7IMqAKtCYtYGgqoZSC6Jb4FE023+x9jOfGH88I8BmL07rDN7
	rRlqFq67+RiSFNSnUuiog8X3X5Iz3im4KuRqtOnAysQFkMQkHw7K4bZ7PMGaG/nfZ38d+aCnvVo
	ouyXCE/VcOgZAtVxgVbpb/bUQCCb4ggTS8Rn3Sfi8nnwQ0J1Zj0FGGmNNFJlFzF1Q4z9zzp/JGt
	nNA/gHdN99xVU9qNgTwa8Px/fyDHYzgscZQSKIZ4SN0vZ1d10NyCZzVtfTl+2xKUT9qpumzxAgs
	o6PagkRHqe0LVlDtbmGcR/OyL0UW7g==
X-Google-Smtp-Source: AGHT+IG4ksvPC7Y5k+rH+Fo4G1zkQXYBDWA71JozlM6Ltrvznm9BXaCRAG2ncqXpGelDCvZwMQf+u2YY1gqcmChseac=
X-Received: by 2002:a05:6214:19c9:b0:880:49bd:e217 with SMTP id
 6a1803df08f44-8847c486a0bmr401837906d6.10.1764338442404; Fri, 28 Nov 2025
 06:00:42 -0800 (PST)
MIME-Version: 1.0
References: <20251128043221.3603223-1-Qi.Chen@windriver.com>
In-Reply-To: <20251128043221.3603223-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Nov 2025 15:00:31 +0100
X-Gm-Features: AWmQ_bmJ6VuLZLAZ1vkuQZyFbGVR_dyIARUbl_QHCAwdiLRuEuZ_BroyLhnrg5s
Message-ID: <CANNYZj-FZ0rrKbYU_ew8vpkppAhfdMiMJfRqc8UFS6j5yaaErw@mail.gmail.com>
Subject: Re: [OE-core][RESEND][PATCH v6 1/3] base-passwd: add clock group
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 14:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226914

I think we've had a discussion about why this can't be done from
systemd recipe but I don't remember the conclusion; can you add the
arguments to the commit message please?

Alex

On Fri, 28 Nov 2025 at 05:34, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> New systemd version (v258) introduces a new group, clock, to
> "enable applications like linuxptp to open clocks without root
> privileges".[1]
>
> This results in warning at do_rootfs time:
> WARNING: Group clock has never been defined
>
> Add group clock with gid 81 to fix this issue. The wheel group's
> gid is 80, so 81 is chosen.
>
> Note that Debian rejects this patch because they're using sysusers
> to handle such groups, including 'clock', 'kvm', 'sgx', etc. We're
> not relying on sysusers, so we have to add a patch here.
>
> [1] https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../base-passwd/0001-Add-clock-group.patch    | 34 +++++++++++++++++++
>  .../base-passwd/base-passwd_3.6.7.bb          |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
>
> diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
> new file mode 100644
> index 0000000000..af871949fa
> --- /dev/null
> +++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
> @@ -0,0 +1,34 @@
> +From 4b3a8f347179d7e2a1062eeed13a6474deb28728 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Thu, 16 Oct 2025 08:48:49 +0800
> +Subject: [PATCH] Add clock group
> +
> +The clock group is needed to "to enable applications like linuxptp
> +to open clocks without root privileges". See the link below:
> +https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd
> +
> +Note that this group is needed as long as people use udev from
> +systemd because 50-udev-default.rules needs it. See the above
> +commit.
> +
> +Upstream-Status: Denied [https://salsa.debian.org/debian/base-passwd/-/merge_requests/17]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + group.master | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/group.master b/group.master
> +index e54fd1d..6f84539 100644
> +--- a/group.master
> ++++ b/group.master
> +@@ -39,5 +39,6 @@ staff:*:50:
> + games:*:60:
> + shutdown:*:70:
> + wheel:*:80:
> ++clock:*:81:
> + users:*:100:
> + nogroup:*:65534:
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
> index 177927d674..e4e0890293 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
> @@ -13,6 +13,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
>             file://0005-Add-kvm-group.patch \
>             file://0007-Add-wheel-group.patch \
>             file://0001-base-passwd-Add-the-sgx-group.patch \
> +           file://0001-Add-clock-group.patch \
>             "
>
>  SRC_URI[sha256sum] = "cf869870fed7862b57bfa9e99cd5cd6f365e2349705a1b65af7fc182629bd1ab"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226880): https://lists.openembedded.org/g/openembedded-core/message/226880
> Mute This Topic: https://lists.openembedded.org/mt/116509588/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

