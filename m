Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C68C2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 14:59:02 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.9932.1720796332952015884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 07:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VeWIYqPY;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5c74f6e5432so1017927eaf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720796332; x=1721401132; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ug0h85dfFEAAZTXgwMb0w0Ww0FxxCg7ADZQ9KiE+QeU=;
        b=VeWIYqPYAikp9cJgpCobCeVuAJp47gJvvMfA/Q2NY/J5HKMHJmJMzp3tI9RRQZfP28
         8qngfHJuZ4nh73GsvTKQEM2b7FEODfoioaDTfahshLjaOqZCBEMnOjz86UvU4ouX5mZg
         igpx8rGAMII7h2XRyX6dJKE2l7m4CNcK9/bZ5m9bjg7DdzwkoAGF5tDd/vry8yN3GTde
         8XthijwLitLEFYEZkG6n4+eanxgAq0j8yeQ4CYwR7Nw9l13g8ybcHYh6aZ3vc32up4rZ
         H0qAcnEPbcUqqNUAZRWO1iKXt2gt7e9hh7BhBQLd8hxl02HOTT1VqLi0lJKTMz4P6nG0
         Ykzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720796332; x=1721401132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ug0h85dfFEAAZTXgwMb0w0Ww0FxxCg7ADZQ9KiE+QeU=;
        b=kjRUCKfTIVUhCopPS8MW6UxFIH8deilQP+4FX6XOQVOQ7KSmF1UtRl9Jvogk5DI+mi
         fHYPNPhD3l/l79a/ACJTG5HNalxUJVA2e3EFtPlXd1jNo1MI6AjdGVk5MfI1DCwjhlrQ
         Labbe+lE6F3sgRmDaXgwEx5eGITriC0B5cTzTDrc38FmD0xYOEyy4yNXg3Lxi+eCk0yf
         QIBa7czn4kE4EkJ2zmcXFM9qAp9xQBGl5k3WmGF1MwsFNwmPMR+r9UAZYCvGFj9wN7yE
         k9CvXry4fpEFKR+TkW1KoW96T8SgsGrH9f+6KUhMnEpUtvKnBNOSx7+QJanN/yzr+/Ka
         j4xg==
X-Gm-Message-State: AOJu0Yy1FsCbktjD88Tf/cUh0ZOAVsRmlSy67y47JR/gAMyRSp9bBNKn
	u5YgLexkyJGtuL3rE9sl5g6XcDeUkXQacOgnO2toe0M7J9WxpJM43ZAl2L1749ZqEwQXF8R8eFb
	JRsmS3pq1mUxcMvXhjE7gmVjAFVGOvMM3tyI=
X-Google-Smtp-Source: AGHT+IHVEmLT9YoKsfizE2oxff70n4tZV2UYOHbMXcgXfBWu5q0it1HHt0AERCXepR4MXxt/1BgDElABrbZek3/jlX0=
X-Received: by 2002:a05:6870:168c:b0:25d:6411:a0af with SMTP id
 586e51a60fabf-25eaec6d8a0mr9757902fac.49.1720796331921; Fri, 12 Jul 2024
 07:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240711234203.3841594-1-raj.khem@gmail.com> <CANNYZj8u7dMXZab6dHYfp0wdtRrimYBjeAdep+4n14KQEqJ7kA@mail.gmail.com>
In-Reply-To: <CANNYZj8u7dMXZab6dHYfp0wdtRrimYBjeAdep+4n14KQEqJ7kA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Jul 2024 07:58:26 -0700
Message-ID: <CAMKF1spdtbmpbyiGhthFDPqb=tDphR07FMJEgeio9cbqSewqbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] mesa: Add packageconfig knob to control
 tegra gallium driver
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 14:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201832

On Fri, Jul 12, 2024 at 2:04=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 12 Jul 2024 at 01:42, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> > +PACKAGECONFIG[tegra] =3D ""
> > +GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'tegra=
', ',tegra,nouveau', '', d)}"
>
> Why nouveau as well? It's already enabled elsewhere.

Its a direct dependency for tegra gallium driver, In its state
currently in mesa recipe its enabled when gallium-llvm packageconfig
is set.
That's not a prerequisite for tegra driver.

>
> Alex

