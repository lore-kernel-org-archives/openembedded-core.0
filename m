Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9074BC7EE29
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 09:21:06 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.4157.1686129657943216115
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 02:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Pge7Aln6;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b203360d93so3428161fa.3
        for <Openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686129656; x=1688721656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QioR6A2iTTxjKGO07NxrZxZItI5c6ZBJJYYyEAX5b0k=;
        b=Pge7Aln6OODdcKqZ2xCDdUVCce0yu66iuR4ajGZ8YK78i7vy1q79DlZEodmqf6cEnl
         p9k1qD9/SuxlJqSe9GfOqEzhgLodnSX8liaNBuXs8WAksH11BL0csViVfWPplzUJ2C1U
         UOeIIRawirNzJV8HbzYH50CW266sOIwHyz1dYwlbno6cNX3aelCrEFjrjY7AHkz7rYKv
         flkadm/wR6stM6KoGZ5Ed7sw/X3UmZ58hJbeqhgHD1pIcr5NtinxlDOtgRl2JmCe6b1v
         7CZyr4Efy8hkcM3Ea1MKReiHNgsUJO5jViZFOeqdMBCOb/ZGg20SLczcS48fo9YBEFFK
         ZJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686129656; x=1688721656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QioR6A2iTTxjKGO07NxrZxZItI5c6ZBJJYYyEAX5b0k=;
        b=ETxm9MwPZgNLmzh0xpwjjwgEN7kyEiJfb5HJtSBfnPrljndZdFhhBXrqABFsYSkDZf
         et0K9QwQyKR+mChFdditp5RFed7iUdORZXtyyx/b7ZO2DOS8dRCzJp0G7FHhUgF1zhs1
         pb8ALDxCsx6qlfDDKdjUmNwhUEbfFirpAqWML8jFsTH2leIH/m6k30EQ8wHWGT/JrSsC
         590yl9sPieA7kUc2skqfYXyhorIRK5rrQP9nDe2z6Dx0tEpl5FCw20LtB9L5SXgaB1Ly
         Xklr2uJQgPI60uU8oztsqYbr8F88TewK9XmwykuTQCn5AU6Wv7Z/qa+GE8eQFS14dVdq
         XYuA==
X-Gm-Message-State: AC+VfDzudHh7CRj7Q8XR1ktYMRCRclnN5PrWMTJ82s0iZ8i1fXBf0LwK
	ZLTjwU64HfCnxT+UTxYmXDJCqNKRsKgcuTGZbxU=
X-Google-Smtp-Source: ACHHUZ4p9M8ehzsXuBdFhnP/KDiKbLBUQp64sk4MPz19m4WFF0v2Wjspi4D5W08KyryGiVo1mO4PIVniVgiRJaIRZ0Q=
X-Received: by 2002:a2e:b614:0:b0:2b1:be84:5496 with SMTP id
 r20-20020a2eb614000000b002b1be845496mr2349524ljn.12.1686129655819; Wed, 07
 Jun 2023 02:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230607083015.20760-1-alexis.lothore@bootlin.com>
 <20230607083015.20760-3-alexis.lothore@bootlin.com> <b8e4b45e013ed8fdfb2c6075336b388bb9904b7c.camel@linuxfoundation.org>
In-Reply-To: <b8e4b45e013ed8fdfb2c6075336b388bb9904b7c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Jun 2023 11:20:44 +0200
Message-ID: <CANNYZj_84WzoPgCLGE2wpKqmn=H5+3WxZV3u3vaH9_iYGCP-Ww@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2 2/2] testimage: implement test artifacts
 retriever for failing tests
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: alexis.lothore@bootlin.com, Openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 09:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182466

What might work better without code complications is testimage.bbclass
setting only the minimum set (no ptests):

+TESTIMAGE_FAILED_QA_ARTIFACTS ??=3D "\
+    ${localstatedir}/log \
+    ${sysconfdir}/version \
+    ${sysconfdir}/os-release \
"


Then core-image-ptest.bb should append "${libdir}/{MCNAME}/ptest" to
that. As that same image recipe installs only a single ptest via
IMAGE_INSTALL:append, and the artifacts are retrieved only if that
ptest would fail, this would achieve the same outcome. Other images
(which can potentially include many ptests) can then set what
artifacts to retrieve themselves as they please.

Alex

On Wed, 7 Jun 2023 at 10:49, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-06-07 at 10:30 +0200, Alexis Lothor=C3=A9 via
> lists.openembedded.org wrote:
> > Add a basic artifacts retrievers in testimage class which:
> > - triggers when at least one runtime test fails but tests execution
> >   encountered no major issue
> > - reads a list of paths to retrieve from TESTIMAGE_FAILED_QA_ARTIFACTS
> > - checks for artifacts presence on target
> > - retrieve those files over scp thanks to existing ssh class
> > - store those files in an "artifacts" directory in "tmp/log/oeqa/<image=
>"
> >
> > This implementation assumes that the SSH or Qemu target has run and
> > finished gracefully. If tests do not finish because of an exception,
> > artifacts will not be retrieved
> >
> > Bring partial solution to [YOCTO #14901]
> >
> > Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> > ---
> > Changes since v1:
> > - only gather artifacts in nominal case (ie qemu runs without any raise=
d
> >   exception)
> > - list artifacts directly in variable instead of using external file
> > - use standard variables in artifacts paths
> > - allow glob patterns usage in artifacts paths
> > - expand/filter artifacts list on target before retrieving them
> > - tune default artifacts list
> > ---
> >  meta/classes-recipe/testimage.bbclass | 49 +++++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >
> > diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recip=
e/testimage.bbclass
> > index b48cd96575d2..c6ce74a9e7a8 100644
> > --- a/meta/classes-recipe/testimage.bbclass
> > +++ b/meta/classes-recipe/testimage.bbclass
> > @@ -18,6 +18,16 @@ inherit image-artifact-names
> >
> >  TESTIMAGE_AUTO ??=3D "0"
> >
> > +# When any test fails, TESTIMAGE_FAILED_QA ARTIFACTS will be parsed an=
d for
> > +# each entry in it, if artifact pointed by path description exists on =
target,
> > +# it will be retrieved onto host
> > +
> > +TESTIMAGE_FAILED_QA_ARTIFACTS ??=3D "\
> > +    ${localstatedir}/log \
> > +    ${sysconfdir}/version \
> > +    ${sysconfdir}/os-release \
> > +    ${libdir}/*/ptest"
>
> I know Alex Kanavin asked for this but I'm really not sure
> ${libdir}/*/ptest is a great idea. This will effectively copy the
> entire ptest package files for every ptest on the image. Now we split
> ptests to different images it is less of an issue but it is still
> potentially rather large. Could we at least limit it to failing ptests?
>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182462): https://lists.openembedded.org/g/openembedde=
d-core/message/182462
> Mute This Topic: https://lists.openembedded.org/mt/99380468/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

