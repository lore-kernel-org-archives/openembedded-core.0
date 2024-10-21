Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1D9D15DA6
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 14:42:08 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.47607.1729521723973999993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 07:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kHPXsPcI;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.178, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso3752151276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 07:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729521723; x=1730126523; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUCip/z236gpRK9aRF0ryBz4agX8+A5VSJDrvrxpGTo=;
        b=kHPXsPcISby4qRDMym+7KaZ7cRbE6/J8glDc3COWQMGWVr/PCvYs9wIE+i0F+CsiMo
         vASF9kaJJpAHcAuHGiHyLMboNRyvN734of+OBxvym1yG97tnLBPAhJBiutGbh7ebNk+1
         MHd8VasUblz0YM+Koy2nC363FUkjWcjnDTYi4Mu7WyF4u5nbmJTyPxE4Q2wn8C+qLeAn
         4Gswoxm7LqV9gSr6MIOTxX2DnpUGCcmAuiWXsbEta8mXQpIgFG/jrcm5DMbPf7BdFIQR
         zSzIcSAO7JY0QTlvhhPLT3FtlncI73v2h73WCLja4JMFe9OK+3m3gbMiHClRdSMJ2dS4
         Swww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521723; x=1730126523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUCip/z236gpRK9aRF0ryBz4agX8+A5VSJDrvrxpGTo=;
        b=bDOGeXs/hNi6JTkDF/cL3Djrw/qzXVwY3YkEwPw+Fzih94OuWhYUvsBf7XGvnNy9Qz
         6DO85vnvIGJKLo+jfPL45VyrlqbwjpXQifOPXUoy390WhDBK98D7QYiUTfls+0XH8W+f
         o7MIGqjAdNNbUhVFUpPgWzp4y1a1BRKnP5VRXLNOkfmHfs4KDiSNRkwnV7p+s5AdIiEU
         A8TcWOhpgxh51x2HDe4HbnhFxrPAjT7Q7ctsftkRhfG+QuiO8KTE7CBYifERb4izjbpd
         Io6XLLggqVDXPtDy5HBqBQT1nm0UMarPn/yIbr1vfC9VbjN2Wyyl+md1jUqtk2ZDRIkZ
         DcoA==
X-Gm-Message-State: AOJu0Ywq8GKg8BmIdclEU88nSJ6aZ2N1saXizQCFFiXY7dEBmE/bKCuR
	Xfjg0lPBwWesJN/ax4/r+uywZUkfMt2FxRtcoG49R9VTZXPoWpb5PUN8K2eoK6ZcVbDSOFdKuy3
	Tk+Tqrtk5R7RcfE8qyXtR+PrVRaeCW164Yb1cAw==
X-Google-Smtp-Source: AGHT+IExwupuEdNyhKOcPhGWVWdzKCz6hbDZAh/n4UNkZHLRDxUfe9QCZkSu5x1JesrYwxniLu9ArEAF//fIRplte8k=
X-Received: by 2002:a05:6902:1101:b0:e29:20ad:8281 with SMTP id
 3f1490d57ef6-e2e22ee0e50mr214493276.33.1729521723143; Mon, 21 Oct 2024
 07:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <D51JZNT0Z0V4.2JRO6YCG6DMLR@gmail.com>
In-Reply-To: <D51JZNT0Z0V4.2JRO6YCG6DMLR@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 21 Oct 2024 07:41:52 -0700
Message-ID: <CAOSpxdZ9sLzRrXyKinvY0JUChtWHgNnRzd9WcnGGfMS8qZ_ZyQ@mail.gmail.com>
Subject: Re: [kirkstone] "overlayfs-etc: add option to skip creation of mount
 dirs" backport
To: =?UTF-8?Q?S=C3=A9bastien_RAILLET?= <sebastien.raillet@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 14:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206124

On Mon, Oct 21, 2024 at 7:28=E2=80=AFAM S=C3=A9bastien RAILLET
<sebastien.raillet@gmail.com> wrote:
>
> Hello,
>
> I would like to discuss the possibility of backporting commit
> 3d433d8559467d255bd19af2d0999c65ea24a48d [1] into the kirkstone
> branch.
>
> Currently, on the kirkstone branch, combining overlayfs-etc and
> read-only-rootfs in IMAGE_FEATURES results in the root filesystem
> being mounted as read-write during the startup phase. This behavior
> may not be what users expect when enabling read-only-rootfs in
> IMAGE_FEATURES. By backporting this commit, users would have the
> option to disable this behavior if needed.
>
> The commit I mentioned is conservative, as it preserves the current
> behavior by default.
>
> For your information, I have followed the Yocto contribution guide on
> how to request a backport in a stable branch. However, if a patch is
> preferred, I would be happy to propose one.

Since this is a simple cherry-pick there is no need to send a patch,
the above request is fine.

Thanks!

Steve

> [1]: https://git.openembedded.org/openembedded-core/commit/?id=3D3d433d85=
59467d255bd19af2d0999c65ea24a48d

