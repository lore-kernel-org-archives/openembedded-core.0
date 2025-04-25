Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EEEC369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 11:50:38 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.4760.1745581837551214986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 04:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U/+q8YpP;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54af20849bbso2372866e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745581836; x=1746186636; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tT6Snwiy2zV6zAqTau8AOmTpR9jXhH6cJoOnEgHsD0A=;
        b=U/+q8YpPWIiOXJACcNAu9o+hf5deeHlv747svVIiJPffsSFY1wuW13BL7lKKDPQuTN
         /mQK7XmRJ+shIJZICNd0q1IIUXzvR0DYvLukboOIKSc82sJta6BZ+H9G0VO2RMtdum5e
         G9EFuwSK6Vp6nqMCglRJ62GKlhiTUnnB5xwIgu27KM9L78CJRXDmqSL9hVAbzo3xPwpq
         rnNf4xdqOdYkAIgjaWpJdlwHrLtHFi+5GKGBUIc2DOnxDWt29aElK4vwQ+T38imfb8F1
         mWG0bSfefPCn+YEhfwzyZqb+TkC/DWvKdG5isthxeSLPognF2LT/stdRilIT7/wr4nHO
         uPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745581836; x=1746186636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tT6Snwiy2zV6zAqTau8AOmTpR9jXhH6cJoOnEgHsD0A=;
        b=cAAKQKg4eZjxFbU7UGter61TE6NNXBEW+qiu43ArcHT2izxOeowht3g2bpRCen64Ka
         ZZWKY8u2I8UY+hutZXJlopYov6li8JwEWzepqprQ6M9Jpe0Mn/9Jty5umv/tttEkQLHt
         VvABmtuu+51htK4ItmnzM8nBWiFwdyIhCIiSpNg5lpY1jC3DeUw3+Ms+ythcIvIydGSX
         l5MdHdNTD0xolm79dOuvl4K4EdWJIKbDQKV1iw1onCcv/YDpZyJhMk3y+UcUlKHQ+gTp
         k67U0bWgoiO0gfFXLdIzzxQOZMp3+aYDMUB/2sgmh/PRcZeniBj5rjVIxEXQg57VsunY
         B4JQ==
X-Gm-Message-State: AOJu0YyJVr88hyswjXhsE1j8nS9oHC3RD8UCMMeqCigoMyD28mTgMeOq
	EUdBrgeRlf6bF9wOBIdVNiSeNt7fC7s6OrHfAXaIYh3PQfCP2OgrXXrXV7NTDUuBDb1sZPAvP/q
	z8tRpCe3xRMFDRNokkp+/7g3RvrI=
X-Gm-Gg: ASbGncsGyh22K20nx+/xCL+isHqsMRUTmreraOaElkAwLKi0TwDHIC/VdK3sgf1IhXs
	7NeMFogtrr322fMBed+r5BQAgSAfnSK4TPwI+BUzp6IRwX49el5JB+g23mu3dZCiOIN5B7MwEEO
	HY+Ss95Csn/HFgJFvt0S3BFo77
X-Google-Smtp-Source: AGHT+IHs0A+HKOLVHAtgu80wYp0EokGLFZ+eE/wcU8zZiG66mAYdr8DBdkfwgM5EK4Q/TGhLzvToXmBPmYPL566Ow48=
X-Received: by 2002:a05:6512:4024:b0:549:7145:5d24 with SMTP id
 2adb3069b0e04-54e8cc066ecmr547638e87.46.1745581835516; Fri, 25 Apr 2025
 04:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250411122926.706371-1-adriaan.schmidt@siemens.com>
 <20250411122926.706371-2-adriaan.schmidt@siemens.com> <CA+chaQd9qFEXem+k9sbyWHU71k-ijTmZC-XHXUMHt8ibA_o8Kw@mail.gmail.com>
 <329FC220-EA62-40C3-B085-BA73A48FBB25@arm.com>
In-Reply-To: <329FC220-EA62-40C3-B085-BA73A48FBB25@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 25 Apr 2025 13:50:18 +0200
X-Gm-Features: ATxdqUH6Z-0EvCzLJnY3w4RT0eZnlKbIauVi50-lsnHjinxHm_1bSRAwdQCt9G0
Message-ID: <CA+chaQeJSWnEuhW9L3hMLawDDauv38_jx7V9JFNBLgSjvu_MUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/1] libunwind: 1.8.1
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215466

On Fri, Apr 25, 2025 at 1:44=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 25 Apr 2025, at 12:28, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Hi, with gcc-15 I'm seeing:
> >
> > In file included from ../../libunwind-1.8.1/tests/Ltest-nomalloc.c:4:
> > ../../libunwind-1.8.1/tests/Gtest-nomalloc.c: In function 'malloc':
> > ../../libunwind-1.8.1/tests/Gtest-nomalloc.c:49:12: error: too many
> > arguments to function 'func'; expected 0, have 1
> >   49 |     return func(s);
> >      |            ^~~~ ~
>
> I=E2=80=99ve sent a v2 of the libunwind series I sent earlier with what I=
 expect is the fix for this on the end, would you be able to verify this?

Thanks, will do.

