Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9844BC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 13:35:13 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.13052.1713447308786443041
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 06:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=m9+1c6fM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.45, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-22edcfcd187so322253fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 06:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713447308; x=1714052108; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QV9r8PCW7xGp/sARDAWQKoQmoeQm3K02YBPUl7OWTU=;
        b=m9+1c6fM1qwivO/92J9F4SL6D6dtBeXeqT034wZpWVHhqKTP2EamuKS2YxnPJrWSWa
         bHYMXz9NdMH34iVMt/MCbRfbPaVNPK5+Jrb+iQ6DuIU+1MrRpaQsLgy8JGCaXlVXrJ0O
         jUgb/K9UWiPeHxEgJsDMv28W9JPcYJ+d2LYB77m3tvSC/Jn7gV/Eu1fQg/MwkyylzHVj
         JUjFWeUKRiorsY0eHfFlDEb8TN8dhg9Wb0SnxQ2L/x+2qeNbkeS/QdbGc75263+NeGdC
         EgIWsn5yjhdZ4n5dHmfvnxxUj8yN+bqlAIRyPcsP2/xTsr1NWA2v7jXq2LkqE56kj2QL
         hc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713447308; x=1714052108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QV9r8PCW7xGp/sARDAWQKoQmoeQm3K02YBPUl7OWTU=;
        b=eAYtkGP88bSXkb7nNVX3ZBak79FmVUigBZODacPSUfvUhO/z0yd0nBjhanOXATQz7L
         vOZf5miBQuSiaReP1813cMvJvoJEl2rOJd858HHfYKv0PzKfPTeCPGEw4KnhpYdLo4Aa
         P9i29YRKPsHnZj8rOznIyjDFaObZ1bBRV1Ukbly4FwZi+WBaGXOsFqdLGWYc3wKThrpn
         KgVSINdkWko4U7vYbhJT3CL9k6XW6G7F3mnHrV2j6dh/wGzeAAauB9zcJoynwQWDjJYd
         TDICwFfMZMOG9GexxvM3YWmlTcAlbEVxRXhEL44yTTkvOZXI3bw36I4iVOKcUyMjqEEx
         iomw==
X-Gm-Message-State: AOJu0Ywyx84ewg0xOLCevWfkY5Iswb5vJ+6mXWzr64HqBFOLIyrNzxS5
	E+SIK2Zc5R3/9nUaSoaxJgVC8HQgFdgLDwdssYMy0SNV4z96el57/HRYXNK7SLOSERc5zlK41Ge
	T/riM/cBwMEZsvHoe6diEoubUhOawwzZmeCeq
X-Google-Smtp-Source: AGHT+IFMbzlYCFVUnfLkKgaGuZoo3ER1rdsCsaHGX0JHAvxsRN4OQtBkZiITeiWOo3ZtzG7x4GJF13Q/NfSgfw3j4kc=
X-Received: by 2002:a05:6871:608:b0:22f:bdb:6335 with SMTP id
 w8-20020a056871060800b0022f0bdb6335mr3875231oan.7.1713447308014; Thu, 18 Apr
 2024 06:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240417222826.3549176-1-jdmason@kudzu.us> <CA+chaQdwCJSSZ9vXw0VgbsWAMuRxt2F8St9Qz8d6GkNuKHy2+w@mail.gmail.com>
In-Reply-To: <CA+chaQdwCJSSZ9vXw0VgbsWAMuRxt2F8St9Qz8d6GkNuKHy2+w@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 18 Apr 2024 09:34:57 -0400
Message-ID: <CAPoiz9zPh2eX4-QDA2FznB2R5iGQO1tb24UAB-NbvkLH28og7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] liba52: update SRC_URI
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 13:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198517

On Thu, Apr 18, 2024 at 1:57=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> What is the difference between the tarballs that it requires checksum upd=
ate?

No idea, since I could not get the original tarballs because the
previous link doesn't work.  But given the comment on the other patch,
this recipe is being dropped anyway.  So..<shrug>

Thanks,
Jon

>
> On Thu, Apr 18, 2024 at 12:28=E2=80=AFAM Jon Mason via lists.openembedded=
.org
> <jdmason=3Dkudzu.us@lists.openembedded.org> wrote:
> >
> > The former SRC_URI was no longer working.  Update to one that is.  This
> > required updating the md5sum and sha256sum.  NOTE: SOURCEFORGE_MIRROR
> > (https://downloads.sourceforge.net) does not appear to be working for
> > liba52.
> >
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  meta/recipes-multimedia/liba52/liba52_0.7.4.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/reci=
pes-multimedia/liba52/liba52_0.7.4.bb
> > index 7a3b4a43c8d4..684dd590ca15 100644
> > --- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
> > +++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
> > @@ -10,11 +10,11 @@ SECTION =3D "libs"
> >
> >  inherit autotools
> >
> > -SRC_URI =3D "http://liba52.sourceforge.net/files/a52dec-${PV}.tar.gz \
> > +SRC_URI =3D "https://sourceforge.net/projects/liba52/files/a52dec-${PV=
}.tar.gz \
> >             file://buildcleanup.patch"
> >
> > -SRC_URI[md5sum] =3D "caa9f5bc44232dc8aeea773fea56be80"
> > -SRC_URI[sha256sum] =3D "a21d724ab3b3933330194353687df82c475b5dfb997513=
eef4c25de6c865ec33"
> > +SRC_URI[md5sum] =3D "1a2e77b4f7aacd858961a6b727710551"
> > +SRC_URI[sha256sum] =3D "c1931bc511dc48987fdba6888be577f3035e3f0b6b81d3=
ea3e766fca8d18e128"
> >
> >  UPSTREAM_CHECK_URI =3D "http://liba52.sourceforge.net/downloads.html"
> >
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#198488): https://lists.openembedded.org/g/openembed=
ded-core/message/198488
> > Mute This Topic: https://lists.openembedded.org/mt/105587757/3617156
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

