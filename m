Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42881C4828D
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 08:32:20 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.13699.1706949130816872815
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 00:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TY+3YVPs;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2046b2cd2d3so2066251fac.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 00:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706949130; x=1707553930; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ome+tHckeB6C4qSttTZRcSAm//srL5yj3NPiyP2otqM=;
        b=TY+3YVPsGwT+xN8WLscXTn8LFZqOpU83M/pPA8stBHrMAxzaiAzmhV5Qpbxo+dL2AS
         GgHnTnu5tP2KFkdVYuyGlKJCFqqVemXzypeS+kS7vQ37WjAOr7+O3XOgumA3PBEo5QWF
         cPb5CSJ9Ml3GRsoD8FtVQ9KDHaEZNYh6JNokYRGL/Ot+MDPUCR+vzSBxe81Vgv1H4jpu
         78YkIntowwd2dPIS8kkZM3ct2G6HWGcQ9K4g4288pXkwjgDWGdZr7l/vojlOmlgNJrht
         +VOb0xod8PAUn1qzIZV/OViQqT8A2dmJz+PIRdVhESyWPmKzdtXEz9FTgOw6TudlWJDY
         Hibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706949130; x=1707553930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ome+tHckeB6C4qSttTZRcSAm//srL5yj3NPiyP2otqM=;
        b=qWDc2BJZjsdo44u2eKMmW5j8cKo3Wlmj+Y58Wqx2VFqav9bOHmWPhVV8WLe1+opX5n
         uP9W2l0nzJ9cYYhOgvZVeXDCc1gLvft1qxZ9eNWYnH09jvFoa5MVIHpuVLlNhj9rcy1d
         SJs8Os4VzYNSd0ZvXo9Xvncs2VDS4Gf2yNJnDrHb+PSTMAK0r3dt+J/KcTp99ymd30Qm
         12qQn0XI9UtSeCMraagy58doYucGYJlmL56ssBHi88j61fTBm7MBIuK4+ZzRhGasCN+e
         FNLPDgyZKsl6kLMLAHQ2CtLiSyWXlerM+ySqfDee+I1Pc4WAmNOnUdWdge7totDMiPSO
         1K3A==
X-Gm-Message-State: AOJu0Yx+pj/a8d7sffHhGRTE/hj6KTz73P8mmd62pczb1NVwFEMpZZ1L
	MSLxwpVn57ACfzpMg4NzKgFfMYh4c3yUvhTSYxm2QETHeAmwiiFzKK9S4BMeDKmZPQy0LVO+uL3
	ukc+ntXzdGpIauJMnLJmRPc5tKl4=
X-Google-Smtp-Source: AGHT+IFDGyE6sEMFq1Pmj/CjQ8XgRekwgyuvcYW7zenStJhPuhtlo0m3vdncxFD3KtB5a8vsnvpoTKfUToKrnFB5A/E=
X-Received: by 2002:a05:6870:7d12:b0:218:4dd1:9de4 with SMTP id
 os18-20020a0568707d1200b002184dd19de4mr2666076oab.10.1706949129903; Sat, 03
 Feb 2024 00:32:09 -0800 (PST)
MIME-Version: 1.0
References: <20240201222401.565583-1-raj.khem@gmail.com> <e490accbe222726fba2d51fadb40040b0608a172.camel@linuxfoundation.org>
 <CAMKF1somo=Uma9ze-tiRw+iJkg6T0ikf3NDDyVvq4QtNEYjD3A@mail.gmail.com>
In-Reply-To: <CAMKF1somo=Uma9ze-tiRw+iJkg6T0ikf3NDDyVvq4QtNEYjD3A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Feb 2024 00:31:43 -0800
Message-ID: <CAMKF1sp2k0qXzV9FQ8bU75XNRwuicxYtcJhTOj7tTOGej_SLtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] glibc: Upgrade to 2.39
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 08:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194837

On Sat, Feb 3, 2024 at 12:15=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Fri, Feb 2, 2024 at 11:54=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2024-02-01 at 14:24 -0800, Khem Raj wrote:
> > > License-Update: Relicenses the IBM portions of resolv/base64.c and
> > > resolv/res_debug.c to a new license that does not have use-limited
> > > patent language [1]
> > >
> > > Upgrade localdef to get glibc 2.39 build fixes
> > > Details of release [2]
> > >
> > > Add fix for mips clone3 crash
> > >
> > > [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dae49a7b2=
9acc184b03c2a6bd6ac01b5e08efd54f
> > > [2] https://sourceware.org/glibc/wiki/Release/2.39
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > I think we may still have an n32 mips failure:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/8562/=
steps/27/logs/stdio
> >
> > #   error "_TIME_BITS=3D64 is allowed only with _FILE_OFFSET_BITS=3D64"
> >
> > although I haven't 100% confirmed it is this patch.
>
> most likely, I will take a look later.

The issue seems to be that assimp is vendoring zlib 1.2.x and there is
a fix to zlib for 64bit time_t [1] which is available in release 1.3.1
onwards
glibc headers have become more transparent which brings this issue to
front. So a fix is to patch the copy of zlib in assimp with the below
zlib patch
or perhaps use some other application in this self test. We have
deleted the assimp recipe already in YP 3.4 release onwards so maybe
we should
replace building it in self-test as well.

[1] https://github.com/madler/zlib/commit/a566e156b3fa07b566ddbf6801b517a9d=
ba04fa3
>
> >
> > Cheers,
> >
> > Richard

