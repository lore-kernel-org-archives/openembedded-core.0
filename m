Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF78AE64AAF
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 14:06:34 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.20587.1733234793343386551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 06:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GHFq4n01;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4669eecd88dso44260641cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 06:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733234792; x=1733839592; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VzBcW4mjoU3hsiIpTgDcKGq2qWX0uzseW/dPjaMN+9E=;
        b=GHFq4n01MxgXT1luCdr6e/ooe7hVgLOfXXHTbhPe5ejjk87R0Swom8XW9msaAy0Rrt
         CL0x46oBhgcLjQPDn+7cunleS5OszN3gj3G3vUDm6hRKYDdfe5PNSg4JG9ODZVtsguM+
         an9xMDwvdDTpnHSPg9upGkQSozvunzVdHPW2iFAfzpskT+IpM7f9OMDQBmrh3ZzmIwnE
         oXES7Co4y3n0uJwkpj3nk4+UdUndZgnG6T0sYPVLuKi89nvw4E1m8Kasa1DpdVlyvP8j
         wZoQfqBmESquC+xFH2bjv1FZrmkB/Vgq64unYYKOQ5NqON+9a9aQ3b9O/woDzzEj5NV5
         Gc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733234792; x=1733839592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzBcW4mjoU3hsiIpTgDcKGq2qWX0uzseW/dPjaMN+9E=;
        b=xJwmdmtpmSiTEI30BAaxK/RH85xznrsGoLAFrZHLhV6ZldJIJZejJV7qzM8dYoyhT9
         Q732TSzRHI6wjo3LXCIXJgxLKeIAvxEEXu5Tux8p8NW+pRs4k9gHZQyA7fjoSDXHcDnv
         miMiCgxDZqU83BHXZOxbmdOQxIR/manOe76NB7l//ZCxx4awkNMy3braGMjxXHiaIBr6
         0nwUbiJnFmJoLJ2Qe8SuCtpu5aQe82Fqpg7YkbeDq4vBYxFtJsSH+q7CJUJHZlOlnFOj
         vdcx7PKS03UNkJz1mmZwBQDSpNMclHMkt48z8II81h7bOn9Yx2Du2BaPJvUFb7T9Bzpn
         rbjg==
X-Gm-Message-State: AOJu0YwXAb7Qfx6xHslAreiRJ7T08vinzsChFX/1skVqwrnnIFcg2NoK
	t142SQMpGqAPlqAx+VFO5f9UNpMjRqhfNNFSviQ2v3rsZlbVEi2HEwLy/e+UV230Nv1dU9FidOu
	7L0GAJaiV+hUqcMhm3nj4ADJctjs=
X-Gm-Gg: ASbGncvtOgUPVjycrPg3+YIKss7m6CesKvn2GK+UTcVeGUwI20mVIPSiqEA9fiiA1MI
	H1YHG+N8bToTK/ubTdxVTU270JmEAtmm9HVWeo44IDCXcZM3UY9UfG8P87JZH7y1cmw==
X-Google-Smtp-Source: AGHT+IH0G5+O7dL2UcQY/geejxNKQEBLOiQJ0mXLXc57O7+Og/87L8PFMtqAW3kMTuiTElpFaraSlX8CNDBlodx//u8=
X-Received: by 2002:a05:6214:ccb:b0:6d8:ab3c:5c8 with SMTP id
 6a1803df08f44-6d8b7457b96mr43340436d6.49.1733234790532; Tue, 03 Dec 2024
 06:06:30 -0800 (PST)
MIME-Version: 1.0
References: <20241203135613.1955725-1-f_l_k@t-online.de>
In-Reply-To: <20241203135613.1955725-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Dec 2024 15:06:19 +0100
Message-ID: <CANNYZj_9Ri731S32=AzWhN5o0Nmj5G_hYUpxoGpNfObxPZYrzA@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCHv2 1/2] libpam: add more PACKAGECONFIG options
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 14:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208214

Thanks, these look basically ok to me.

Alex

On Tue, 3 Dec 2024 at 14:56, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:
>
> Use ?= instead of ??=
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-extended/pam/libpam_1.7.0.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/pam/libpam_1.7.0.bb b/meta/recipes-extended/pam/libpam_1.7.0.bb
> index ec1c868d21..2c134c1378 100644
> --- a/meta/recipes-extended/pam/libpam_1.7.0.bb
> +++ b/meta/recipes-extended/pam/libpam_1.7.0.bb
> @@ -35,9 +35,14 @@ S = "${WORKDIR}/Linux-PAM-${PV}"
>
>  inherit meson gettext pkgconfig systemd ptest github-releases
>
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ?= ""
>  PACKAGECONFIG[audit] = "-Daudit=enabled,-Daudit=disabled,audit,"
> +PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
> +PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
> +PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux"
> +PACKAGECONFIG[systemd] = "-Dlogind=enabled,-Dlogind=disabled,systemd"
>  PACKAGECONFIG[userdb] = "-Dpam_userdb=enabled -Ddb=gdbm,-Dpam_userdb=disabled,gdbm,"
> +PACKAGECONFIG[xtests] = "-Dxtests=true,-Dxtests=false"
>
>  PACKAGES += "${PN}-runtime ${PN}-xtests"
>  FILES:${PN} = " \
> --
> 2.47.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208210): https://lists.openembedded.org/g/openembedded-core/message/208210
> Mute This Topic: https://lists.openembedded.org/mt/109899981/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

