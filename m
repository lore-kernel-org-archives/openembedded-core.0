Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CE1C54E60
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 16:06:46 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.35.1710432402709029626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 09:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PuFx0Jaw;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33ec8aac149so431407f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 09:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710432401; x=1711037201; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmlnS9lY/twxqbpcrESWENk7LpRkIEekyDHynlWtESM=;
        b=PuFx0JawzTjOJnThS3nBc+O+b3mhIHJBR0H5vhyqg826JPZix8v8eivNq6XNAUJI80
         s/VijAHgquEDsSOtZ33XCWCbxYrSxRj04HvlTEy9scija0WZDTfOrQdvGOO5n4cL2yaa
         okrkYRMUMWE8JaCru9nyAHZZZE1w7gHr3ZU90V0/mAgQkRoCoY38Olo1AbbdkUtsbOWa
         Vf8fnbJrfNgJyy20DGN2PxzPdcvzzdUzoCMnkCuksJO+X1ADDGS8kCxZ4mNhyOFC5tNN
         j3AudTlgVZqWlo/Sn4nas4RKlxMr29sxk30E6YFDN72YgI6Dn8e4uZg3Hx7+SXy4jE5n
         XPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710432401; x=1711037201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmlnS9lY/twxqbpcrESWENk7LpRkIEekyDHynlWtESM=;
        b=GYG+BG7qwLVNF3y43Qe7So4xSwJe/iX3i7DUWN6/sDdoejch+SXyr8qvGwMF36VdxJ
         o+druRMSoCnqw8+UUAhi8GjO3bI3hzEJ66X1y2QfXnPNgU8coq8bmemm9mEcRiwWTHZF
         vChS11G54uRFm1HeeXgmfUchi+qEv8Csq2EKmk55vyC1wKRYvDm4YOnzS+K/Q88hBink
         k9te9LO4SRoBNhXIAizJlgOBusOju0JAhPcDRhb8MOKI+xu9Q4w6wmbX5dEUuqRTXQ1X
         rHl7ZRuBcKQuMbdSB/gYHxXY+wE1gtdTnw2gKXsjNTrWk1tSn3vQov49RV2wFxX3nNNV
         Bz3Q==
X-Gm-Message-State: AOJu0YxKhhXZpKh+Ar+rEeTcGMdx2iYKpSGTK5HSVBB469vQAT7beR0O
	NsQAuhLZ5/TRRoMsvoS+mSJOBVeucRsgMHbdn5abnlXM+Edw/q2CXBnOx6O3C1+4iyvzyQa4Y7T
	ldXHWUJ+jrPSYgBsLYdmZXrn5Cps=
X-Google-Smtp-Source: AGHT+IEJO+USuN1d4QPRfnya5aNYwlHpytfY+Zu+mZLrjPdT2ZJFbiwBk5gq1v6KEKSaaKuO9JNiCFSEXmB1zq0PIZg=
X-Received: by 2002:a05:6000:714:b0:33e:c97c:ccff with SMTP id
 bs20-20020a056000071400b0033ec97cccffmr1813118wrb.68.1710432400793; Thu, 14
 Mar 2024 09:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240314070903.83765-1-martin.jansa@gmail.com> <697FEB04-7741-41E1-B093-AB7E7BA733D7@arm.com>
In-Reply-To: <697FEB04-7741-41E1-B093-AB7E7BA733D7@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Mar 2024 17:06:22 +0100
Message-ID: <CA+chaQfQaKk-Rnc7VwpfmhPP4_oR8EspNZrT4Wa5J9=p864svA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] insane: add patch-status to default ERROR_QA
 for all layers
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 16:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197113

On Thu, Mar 14, 2024 at 4:32=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 14 Mar 2024, at 07:09, Martin Jansa via lists.openembedded.org <Martin=
.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > * it's enabled for patches in oe-core for very long time and I was usin=
g
> >  it for many other layers as well, so most layers should be in good
> >  shape
> >
> > * it's also possible to disable it for individual layer as shown
> >  by oe-core in:
> >  https://git.openembedded.org/openembedded-core/commit/meta/classes-glo=
bal/insane.bbclass?h=3Dscarthgap&id=3D61a881fdbe8b5a21c6276b8a5d06cc30486b1=
eb3
>
> This is quite a =E2=80=9Cstrong=E2=80=9D change in policy, especially for=
 so late in the release cycle (post-M3).  I=E2=80=99m on the fence but lean=
 towards letting layers opt-in, instead of forcing it on them and having to=
 opt out.

I was expecting some response like that :/.

Other layers don't have to release at the same time as oe-core, right?
And oe-core itself won't be affected much as it was already applied
there. It's easy to resolve (even if it is by adding Pending to
.patches without any Upstream-Status) or to opt-out if they really
don't care to run one-liner to at least add Pending. Easier than
resolving build failures caused by boost upgrade this late in cycle
:).

Also if we don't add it now, then we might not add it early in next
cycle as well, because the layers opposing to fix it, won't probably
add it in master branch shortly after branching for scarthgap as well.

I'm using this for over a year and regularly sending patches to layers
I sometimes build (and when I do I use scripts/contrib/patchreview.py
to catch it in all the .patch files, not just the recipes I've built).

I don't have strong opinion, I was thinking about sending this only as
RFC, but IMHO it's worth considering.

Cheers,

