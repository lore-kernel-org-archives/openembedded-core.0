Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F3DC7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 07:04:51 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.8162.1679295883886335286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 00:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LQMO+xmG;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id s8so13344263lfr.8
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 00:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679295882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gH3te5RB+HXXJY9Cr63AGyIubHxNQA4o++qxeHCJSVQ=;
        b=LQMO+xmGSOzKYl9TB/883vOBQkECWBBMvYoJNjFgFcKLbIKhUGHkqjLGMcfIo+cpRj
         IDpyE0gFXgfcEbGqNdsPIOmE9pJSdl2kGH3ly8IiJqyAAoSALVUATqEcTOu9IBGVhyAG
         3RsU5IvDvdvHcpumHBsF4IdtZ9VJ7c4hma8hfT0gMPmvzdO2pU3uNGjchBML04k+8Mq8
         WVIfoDQhhHRzZmX4zy/CRpMmBSSqH5GF25BCaFtBXq5CzDk3ArDR3sL1+EJk/h1DSnhX
         oB6fJFzoUd6lFBOtf/0L2U/ungC/9cNiJVzST94VYjzHDtX6YZBqX6DQmEdX6FNqEDy0
         IJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679295882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gH3te5RB+HXXJY9Cr63AGyIubHxNQA4o++qxeHCJSVQ=;
        b=ypa5/Xu8bHXGhoYrub1lAxZme5seu+35oR0KUGILMm0TP7jvBVF7ar8+FReSF7jWbW
         QWv8RyhxxRLFtLZxSALALjWoSjffV9yIgTcVXizJGgy5xzHTFjFWPJ7FxQvc1YMKt/jz
         j72+CnnQ+khl1mswu2r7quPZ8vJtJ87pZiZZLXmujVMAMwVtB0VepV+k6EZDs6YqxXwb
         OdwTIZzS3OXWbXQpdbFXfDiXgdmk5pFZzOOxrayEJABUDhltR6j6EUyaDGxtqQGNYS9I
         lKFAyK6I+mLERoNRSnQH3ok/HAnBRbwDOOzVbgf18a9XFexJ+RJpMiyTVNttTqEzLj3Q
         OOfw==
X-Gm-Message-State: AO0yUKWAwOlwIGbugj34khj24PfR6ftfvSwMwvsAcnwMXqyab4WE4sRm
	7UuaUtsQqJvlEeVu2ZsJBEzW3O3yqLwLKErSF7I=
X-Google-Smtp-Source: AK7set9SRujY83gBM3pouEzwVNDCZBMzpeg4bzKaYNGLl8P8zQQnShintX7XRuWU/u1IhGCXABdErUl/rTpnXXIOwBE=
X-Received: by 2002:a19:7610:0:b0:4e9:bcf5:a0b6 with SMTP id
 c16-20020a197610000000b004e9bcf5a0b6mr1037400lff.11.1679295881750; Mon, 20
 Mar 2023 00:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230317100923.3295331-1-mikko.rapeli@linaro.org>
 <CANNYZj_RVtE=Ud1Tmcr5H0_zQZS_SK+5CT1ro4oanudVdTfBWQ@mail.gmail.com>
 <ZBRWmcQjRoq631S8@nuoska> <CANNYZj-bB4DUWL0HqkAmJyKm7WHEdDatXZZC=EqRVuAfuFwJfw@mail.gmail.com>
 <ZBf6FVpE022lf/NA@nuoska>
In-Reply-To: <ZBf6FVpE022lf/NA@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Mar 2023 08:04:30 +0100
Message-ID: <CANNYZj8AnY5z=b0eOO4n0autJrKRvvgd3iNWJhwMhhGy_+D=Cg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] e2fsprogs: switch from master to debian/master
 branch to fix compatibility
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Jerome Forissier <jerome.forissier@linaro.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 07:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178800

On Mon, 20 Mar 2023 at 07:15, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > But then we should put e2fsprogs into buildtools-tarball(-extended). It=
=E2=80=99s
> > not any different to providing compatible gcc, when one from the host
> > distro is too old.
>
> I think this one is a bit different. At flashing/install step people
> frequently manipulate rootfs images coming out of yocto builds to match
> what HW and various boards actually have, like extending the file system
> to fill full EMMC/SD cards. Like dd the .wic out of a build but extend
> the file system for the full disk before first boot on the system.

Sorry Mikko, I'm putting my foot down on this. Yocto does not promise
that random tools 'from the host' are going to work for its artefacts,
and should not start making that promise. We are not Debian, and we do
not promise compatibility with Debian or anyone else beyond what is
allowed in HOSTTOOLS.

You can instruct developers in your organization to install the
tarball and use tools from it for those manipulations. You can also
just carry the needed custom patches for e2fsprogs in your builds.

Alex

