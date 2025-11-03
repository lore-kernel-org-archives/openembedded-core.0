Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D374CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 14:41:12 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22511.1762180869896702837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 06:41:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y5PLGPGS;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.171, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-786583618d8so20791327b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 06:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762180869; x=1762785669; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAv3caTYijYByWCe8I1tBDjwJ+5AzOxZgDX4jexMVqo=;
        b=y5PLGPGSjpvgwqbMu2D9ZJxtR/kqfUuv1VeOfBBI0S2ePL1/DfNloleHVKbqGVIJRg
         u4BouQTkpmRyn0NuOkyP8R3apcO6uZiCVGXfv5uplwlJrJFQUcNkdJF1I0Om/bajHwKh
         ccrbIRtHF9ece9hisMDQK4tb0IMtror9ftytqsAiNU7eprBengfNwJjIIX7WvPy0dvSo
         QlJR7c8It4J+DRxhArc0Cvl87oJTttQ0RlSHwY4fsr3zJ/wovVp3sIl/pgsd2uCl8bMe
         8sNzT+re3vajsViNrvv4oc0e72DgEh88xb5s52ZK6wt1jLvP5cEbaxtym6IQxan5AZMf
         gsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762180869; x=1762785669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAv3caTYijYByWCe8I1tBDjwJ+5AzOxZgDX4jexMVqo=;
        b=S/m451TLsVXNClEhUiAJujeNZ2VH1axYxyarlz1cLXeuXsp+5iV3Wcf5nKpZhmwtw7
         /+P+1+bULLEoxE7k/ttW0xkyAtZJr8ZznvDxQCbsF0EZFVfu0zYGCJkWZnx9pSlGCQ+u
         63GATTdafKLHpoTyr+4/doDFM5Kz8gWbJR8gxiZP+tUrTmvTl8nOZLRYzMPv3mOe60gE
         xDAbCpMg/laG9O99Wfb/v3S3AM7b/qFqJvH/LoznGI7e73KGLC+zBAAOMYeV4OlRb2bC
         40ZzSbX4hLS5JkNAEw8e0pldmjQQ4NIxgJdkIhvYQvgpVNx6xJBFrjql1g2nzeUlkdxC
         AZJA==
X-Gm-Message-State: AOJu0Yy7pdmCJyMegJYVDo6HZE+LwZtAAEOEg/2bTKEN0MAr7LWuspyU
	PK/1XGQWfQnbxJCdbQm/oMrDYD0WEmjL7T8ig75W+IL8qrCD6Q8J2u9eYndNSbqDQhDRpVQU4Ro
	cpiQRJRpylr1iDfgxvUP18PAj/31p2V4t1NLNQyIyn+EWkxxzAJCC+TNSog==
X-Gm-Gg: ASbGncuPeTOwWkabahTitURen2HGeygll3dxc1U6iXL65+F3XNbZ9P6FRxowfMS2Bzi
	C5o2yOY0ClsQHnHYDzSURwAtgRkiUfQn5+dBcrTTRBAuZoShIkLMNUZCRjp7280Vk4UOLkct7Hi
	Rf7K+A4Vx/elkX8mOjJog0ASRaGrI7Hc6rtx1m1s2EK98mC3MvCTIQ800rZws+Hhzi3A7/Gwucf
	ApzV5CrBbuvI87KTxaPdwDgDCyfKks4AIaTdzfK1wBNCwfE4E3kdJLB3lR6AvETswMtq9FjyO6y
	yHhu51thyPrEAdxeHKsiO+FrwAhAiNjqTx5M5g==
X-Google-Smtp-Source: AGHT+IEqmxNOSiABOAF4BthkLwQX6HHH+fNY332eh14I7HMExJqYKvtpMnPMLlkkt/nhAKWhPTKZP2/h2X5bKbzPoTI=
X-Received: by 2002:a05:690c:490f:b0:786:58c4:7a21 with SMTP id
 00721157ae682-78658c47adamr90730927b3.69.1762180868878; Mon, 03 Nov 2025
 06:41:08 -0800 (PST)
MIME-Version: 1.0
References: <20251103082021.1301034-2-joerg.sommer@navimatix.de>
In-Reply-To: <20251103082021.1301034-2-joerg.sommer@navimatix.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 3 Nov 2025 06:40:58 -0800
X-Gm-Features: AWmQ_bmZmr9NOzZoCWZxyI8kxpvFS7fDtEd69k8weLTk22bwA-Jh26B8JliHF-I
Message-ID: <CAOSpxdbD_PaQosWcJK1Bk6F6+Xb3KwcSio1vkXGk0EDdb7amcA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] Upgrade gtk+3 3.24.34 -> 3.24.51
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 14:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225661

Hi J=C3=B6rg,

Have you verified that all of these version bumps contain only
bug/security fixes, no features added or removed, and no API changes?

Thanks!

Steve

On Mon, Nov 3, 2025 at 12:21=E2=80=AFAM J=C3=B6rg Sommer via lists.openembe=
dded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>
> The current version 3.24.34 fails to build gtk+3-native with Debian 13:
>
> ../../gtk+-3.24.34/gtk/gtklabel.c: In function =E2=80=98gtk_label_style_u=
pdated=E2=80=99:
> ../../gtk+-3.24.34/gtk/gtklabel.c:4235:32: error: passing argument 1 of =
=E2=80=98gtk_widget_queue_resize=E2=80=99 from incompatible pointer type [-=
Wincompatible-pointer-types]
>  4235 |       gtk_widget_queue_resize (label);
>       |                                ^~~~~
>       |                                |
>       |                                GtkLabel * {aka struct _GtkLabel *=
}
> In file included from ../../gtk+-3.24.34/gtk/deprecated/gtkmisc.h:33,
>                  from ../../gtk+-3.24.34/gtk/gtklabel.h:32,
>                  from ../../gtk+-3.24.34/gtk/gtklabel.c:30:
> ../../gtk+-3.24.34/gtk/gtkwidget.h:663:65: note: expected =E2=80=98GtkWid=
get *=E2=80=99 {aka =E2=80=98struct _GtkWidget *=E2=80=99} but argument is =
of type =E2=80=98GtkLabel *=E2=80=99 {aka =E2=80=98struct _GtkLabel *=E2=80=
=99}
>   663 | void       gtk_widget_queue_resize        (GtkWidget           *w=
idget);
>       |                                            ~~~~~~~~~~~~~~~~~~~~~^=
~~~~~
>
> This was fixed somewhere between 3.24.34 and 3.24.51. Therefore, upgrade =
the
> recipe with the commits from master.
>
>  ...Do-not-try-to-initialize-GL-without-libGL.patch |  57 --
>  .../0003-Add-disable-opengl-configure-option.patch | 872 ---------------=
------
>  meta/recipes-gnome/gtk+/gtk+3/CVE-2024-6655.patch  |  39 -
>  meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch   |  19 -
>  meta/recipes-gnome/gtk+/gtk+3/opengl.patch         | 747 +++++++++++++++=
+++
>  meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb           |  18 -
>  .../gtk+/{gtk+3.inc =3D> gtk+3_3.24.51.bb}           |  66 +-
>  7 files changed, 782 insertions(+), 1036 deletions(-)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225614): https://lists.openembedded.org/g/openembedde=
d-core/message/225614
> Mute This Topic: https://lists.openembedded.org/mt/116094464/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

