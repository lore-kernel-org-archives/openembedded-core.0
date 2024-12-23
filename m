Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCC6E7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 16:50:35 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.16825.1734972632170480153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 08:50:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W6n+8aeV;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2a8690dcb35so87234fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 08:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734972631; x=1735577431; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMzJb9Tn4pE4Hv0o5qoU9C9zZWiWIhVk2MNXiZ2ckUE=;
        b=W6n+8aeVLHB8ZPL71R+/p2ObBgCPYg9WfRMMKLv767oPJ7gDbsgG0UJP4oQkKIjULK
         aV2KQCHNLfcZcf73UhQXyY9evMQE9xQtcSNIBN7cdMsVM6ZY1GUJHKTeRMY4GbXsH0s3
         Ywzk2W4f3JDNvV/CBoff96x7UO5phNQdz0qHVhqtJG76tu2VLnVX3VdQToBbPaJ35L/3
         nStZOKGYkd7VG5tyK79EBXzz38au02tQYvRvBV6ybR5g4qw4BS0Auyvjr1WT9BREeh5W
         cLmjR8HJdfOrzY00O1NeMY9K0V3x3BwCGLyEQDALs2/4lfSSZvo8sOmec2iJ1toqXQTQ
         p5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734972631; x=1735577431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMzJb9Tn4pE4Hv0o5qoU9C9zZWiWIhVk2MNXiZ2ckUE=;
        b=C2lpQSbvr4L6KBv0xi8L+9/UUQWFbAglnqW3jYVt2O76OKh4Y9c2giWQe5K0BEwXs0
         SYy6TwGF/QUPkRYHxGLQiBabh+nT1eUEEQZZlDVRLMN2ZN2GPdDd8L382dDD4crqnuFx
         3SA7/lbdCkv09nEZWDiQCKn9+BDSSemX/ri4UnZaayvZp/o3iSgmHCVEQUDDeXEphLWl
         zoj97QqMMUXjfqATmZuOBCjlI53vBncYF6uzBqEXlviiYUe7HvwoMklIfSpF36tLtiXC
         ph2RPvZ5H/xN4TTj6mLF6hjRpNfSdd1xvzHFrL24vsgMuI3vHPgMP/aQEwncDSYNJ7lC
         LjlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNbkUdCjSiFRm5MlE0TkRpLW6OLivduEK+CVh5v9lzQguM6hW8LRU2Su+NR7OXT7V8D7K9Bn8ls7O3jpW/hgdJ0A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyooLpJic0AQ3V49BiwD1N8FCgms1xu7bvL2egHsr3+6iOELg/e
	jJ8CAkG++FFMo82aprlBAWbJi2DZ1dstb0UKEVZwFXxk86NWs0snBS2s2Oyd2q/QKiXqPkow1Tw
	YIjNANaxinIW5f/OfuS69150Zo8gG1A==
X-Gm-Gg: ASbGnctpNwX80D4ZrvDVYLFxOznTA+MpD32s8EIfuuU56czUepqj3PtxB7WuInCqkM7
	6x4nRtBe/GR9hSVYsMsInmyu6E7FOwtm28iIvpC2xvaZN4wGPOD3D
X-Google-Smtp-Source: AGHT+IEqA/Z675rcXkoYnelzDDaxOXU8WJVnfk4WIXxdJW0qoCngacH4J9esZLUgzrRiSNeEOv8Zo6pHJiBvrQc1y/A=
X-Received: by 2002:a05:6871:5e17:b0:29e:20c4:2217 with SMTP id
 586e51a60fabf-2a7fb34686amr6700823fac.33.1734972631322; Mon, 23 Dec 2024
 08:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20241223090642.959439-1-jiaying.song.cn@windriver.com> <e47ab30e-725f-4054-9f41-35f0888a8b0f@windriver.com>
In-Reply-To: <e47ab30e-725f-4054-9f41-35f0888a8b0f@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Dec 2024 08:50:05 -0800
Message-ID: <CAMKF1socVyXmYUqja5veh=58PXaW4FanrCN5G9dbM7p0UidKBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tcl: Fix issue causing tcl-ptest to fail
To: liezhi.yang@windriver.com
Cc: Jiaying.Song.CN@windriver.com, openembedded-core@lists.openembedded.org, 
	changqing.li@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 16:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209047

On Mon, Dec 23, 2024 at 1:40=E2=80=AFAM Robert Yang via lists.openembedded.=
org
<liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>
>
>
> On 12/23/24 17:06, Song, Jiaying (CN) via lists.openembedded.org wrote:
> > From: Jiaying Song <jiaying.song.cn@windriver.com>
> >
> > Modify the TCL_LIBRARY to the correct value to resolve the following er=
ror:
> >
> > application-specific initialization failed: Cannot find a usable init.t=
cl in the following directories:
> >      /usr/lib/tcl/ptest/library {} /usr/lib64/tcl9.0 /usr/lib64/tcl/lib=
/tcl9.0 /usr/lib64/lib/tcl9.0 /usr/lib64/tcl/library /usr/lib64/library /us=
r/lib64/tcl9.0/library /usr/lib64/tcl9.0.0/library /usr/tcl9.0.0/library
> >
> > Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> > ---
> >   meta/recipes-devtools/tcltk/tcl/run-ptest | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-d=
evtools/tcltk/tcl/run-ptest
> > index 8a9f611b0f..0842ca320d 100644
> > --- a/meta/recipes-devtools/tcltk/tcl/run-ptest
> > +++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
> > @@ -1,6 +1,6 @@
> >   #!/bin/sh
> >
> > -export TCL_LIBRARY=3D/usr/lib/tcl/ptest/library
> > +export TCL_LIBRARY=3D/usr/lib64/tcl/ptest/library
>
> Please hold on the patch, I guess it doesn't work when multilib is not en=
abled.
>

Right, it needs to substitute with ${libdir} instad of hardcoding the
path to /usr/lib or /usr/lib64 during install time

> // Robert
>
> >   export ERROR_ON_FAILURES=3D1
> >   export LANG=3Den-US.UTF-8
> >
> >
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209038): https://lists.openembedded.org/g/openembedde=
d-core/message/209038
> Mute This Topic: https://lists.openembedded.org/mt/110254947/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

