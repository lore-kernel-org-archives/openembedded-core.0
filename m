Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2ACC433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 14:00:21 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.8659.1652450413562058047
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 07:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q2JUszlb;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id u23so14706198lfc.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 07:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=R+FXVKmjj3kYOmDF7ciPICrFoujUJkkaAO7MOLDGvQU=;
        b=Q2JUszlbLFtXXSsyd/x6QmI5qqolbQmVBCNan6sBDSgtgsChLPFXJwCkKXaQ2QROYH
         53ZtQBa+pJFQ5R5CtCZSzZ8g0ZQl5i141nZC+UNPj/+jO+2sLyMUs3sIT+1ObqlwYtua
         jamCJ4FkqmEEsHcIuAelAzT03Y9S1gwC905OKv31+U5pL0/bo0aYJyWkquzZrrn8qLBB
         a6R7j4n3gBzWYGxPtFCPZoN5H4k/lMyIUFyQUJzd3KPb3lNeu8RyCxhx5M5eVfDTUkNC
         VZ8OouhBa1NlTjxCVkHN364u2N7RUs9zCw4Ex4wOCjJZP/AUMyd67y16eFNz79+rBMAw
         pc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R+FXVKmjj3kYOmDF7ciPICrFoujUJkkaAO7MOLDGvQU=;
        b=JBOb1/J/DvFgS0aRvV+PrpF7ShCD9wHGECA4in3e3JyDfIInGTbCwlEKXLbTmlhc2r
         fVzPrRxZQ498ycj6VckE9LW39vpo5u6wQJ3jOK+rdAzbyBxT5B+0W1he6BOgZ05Gob7H
         JyxImE4mIHLKHBmO2e5y/49BpNCqcJWBLWD4MBSGXVlSYzadGjT09aynI79BnyPJpjRR
         L2ANb9Ok95K5PV0FQa/2XzJCzMs8tcBDrryuC8Fk2WDr2k5fwzlHpYvNSjXgdQrcJoT5
         XFBoAbXft0kfN/C9xOtoL919tAi1m+uQBYh1Q4VAYkrX+vt/tI2vfJjPw3MTHcVUTiMd
         VJnw==
X-Gm-Message-State: AOAM530zV6WSkxHLh0XXPJSzBuHxmHUGNw9gR43/ZgG2hJGPfQ5TJdCE
	nK9YE0VgsWYYvd+J5mWfIITQzKMNftCzRekxljw=
X-Google-Smtp-Source: 
 ABdhPJwnP8ExqeHTuFnA1c3LTU3Wuc0sLajCXrVztc1D/KAP8EML0yKFDyWHPbXUx3+TdOVL5K+rc8PqE5A1F7J6OZQ=
X-Received: by 2002:a19:504a:0:b0:473:b6da:52ee with SMTP id
 z10-20020a19504a000000b00473b6da52eemr3362974lfj.665.1652450411509; Fri, 13
 May 2022 07:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220513134829.1895574-1-zboszor@pr.hu>
 <20220513134829.1895574-2-zboszor@pr.hu>
 <CANNYZj-xfo4PQLRQdtTfcY-8UFONNuX=6dHQF7kgn0afMqfWpw@mail.gmail.com>
 <b47fd784-6d1d-4c89-a61a-d517210ac41a@gmail.com>
In-Reply-To: <b47fd784-6d1d-4c89-a61a-d517210ac41a@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 May 2022 16:00:00 +0200
Message-ID: 
 <CANNYZj9Z6FXD1qv+fuirELOdkZtJtrXBZFizBfhMPo5oM8keEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] npm.bbclass: Fix file permissions before
 opening it for writing
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 14:00:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165569

I think you should just add the needed permissions, not re-set them
fully: u+rw or similar.

Alex

On Fri, 13 May 2022 at 15:58, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
>
> 2022. 05. 13. 15:52 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> > Apologies, 666 is not right. You shouldn't grant rights to 'others'.
> > Besides, 6 is 110, which is rw-, no?
>
> Reading the file is also important so the r and w permissions
> should be there.
>
> But 664 or 644 is definitely better security-wise.
>
> I will re-send a v2.
>
> >
> > Alex
> >
> > On Fri, 13 May 2022 at 15:49, Zoltan Boszormenyi via
> > lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
> >> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> >>
> >> Some node module archives in npmjs.org contain wrong permissions.
> >> I found a case with package.json in the archive being r-xr-xr-x
> >> for which open(..., "w") fails. Set the manifest file permissions
> >> to 0666 just in case.
> >>
> >> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
> >> ---
> >>   meta/classes/npm.bbclass | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> >> index ba50fcac20..7f52ec6061 100644
> >> --- a/meta/classes/npm.bbclass
> >> +++ b/meta/classes/npm.bbclass
> >> @@ -202,6 +202,7 @@ python npm_do_configure() {
> >>           if has_shrinkwrap_file:
> >>               _update_manifest("devDependencies")
> >>
> >> +    os.chmod(cached_manifest_file, 0o666)
> >>       with open(cached_manifest_file, "w") as f:
> >>           json.dump(cached_manifest, f, indent=3D2)
> >>
> >> --
> >> 2.36.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#165565): https://lists.openembedded.org/g/openembe=
dded-core/message/165565
> >> Mute This Topic: https://lists.openembedded.org/mt/91080992/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

