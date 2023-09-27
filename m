Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760DCE7F145
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 13:02:22 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.16866.1695819734913406699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 06:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=LQYhzCzL;
 spf=pass (domain: baylibre.com, ip: 209.85.218.49, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9adb9fa7200so2454094766b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695819733; x=1696424533; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5C0KPySKKpxOEQoL5XUm8asKoIPbz6lbNvT58Uru2A=;
        b=LQYhzCzLmjNjo0xGhX58y+qiOr+UoyGvqze45A6N1whFNKzxnbRW87oiSKbNUyH9q3
         KNIS0xNd1vBx1durzb5gQXV4a9YBJoQfDIylUZ7S+jzrRmcgiNOungoEAg9pzUfegysc
         7amiZkG4MlPS3n2+niRPTkRE3zHA1Ntndtx03iRzg+7hc1+PAxRjc+VT2NjBAvxqbKz7
         SgbFF4UqBIfugY2pRqJl9ieHHC/No0oVbR7aAEkx+nMzbsBXQ0tL+W9lIDsyHURDJyS2
         qoKwCQPEyC6kKRN48Arzvab8i5wso8Pv3CI04uDsuImSIi6dXe/XpGT/tOqxSr4KB+4S
         5xLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695819733; x=1696424533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5C0KPySKKpxOEQoL5XUm8asKoIPbz6lbNvT58Uru2A=;
        b=CDDhw6JxFRktmLpBYGyVw1XkGeZwKR3+J6cTbSUL7lRAh5WtLNwzhV+nbBYAdBkC7D
         8VJarWTjwbc58Ts5g9CG38yaJ3Ho/BMT32DX9XHOgrimBE5LW80lF1fXEpeilrj8l95O
         pR3a0goZhCnoJ931CtKYk6ohE3UX3Ft33YQANsx3REIxJRoAP8OrA/EW1UfWNqMVWa+w
         vog+O3BQqxeon3tegC0QS2VtPsTPSqV6RfPE6v3JFa8IP5W2w3Fp0aL5J1guvI3C9YPW
         VdWakliMFRIhi8ipbXWTxyDTidyG8aPgbQedaYx9jTszdCA5bMSB0sWC3izn0MU7Icfi
         drGw==
X-Gm-Message-State: AOJu0YyM1ac7pk2pM9ms+IZuUR7I2NDzGzTpDzEh9ulBPPQaRjD5Dclo
	YrmvjggvkozQEl1V1v54dQnREbCSKialHC1P0AG5ZA==
X-Google-Smtp-Source: AGHT+IGTu1r5aEXNHbHB3GdO9n3b46ewpF0ciNeYPkI23adss3/cp931MIBEPkjcurhwKerhcBaYQWGPDHdnFBtfhFU=
X-Received: by 2002:a17:907:3ea7:b0:9a5:962c:cb6c with SMTP id
 hs39-20020a1709073ea700b009a5962ccb6cmr8354763ejc.31.1695819733364; Wed, 27
 Sep 2023 06:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230925080452.803540-1-jstephan@baylibre.com>
 <20230927101614dd0d974d@mail.local> <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
 <CANNYZj89k7MbA0zBKb3s6LF0Lz65Yv-q9Qp5igimgSqeiWu6+Q@mail.gmail.com>
In-Reply-To: <CANNYZj89k7MbA0zBKb3s6LF0Lz65Yv-q9Qp5igimgSqeiWu6+Q@mail.gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 27 Sep 2023 15:02:00 +0200
Message-ID: <CAEHHSvZkyZaRXSzhV8X=-xH8UY9TnaBxQjGQmLivxAx+wmNuVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/5] Add bblock helper scripts
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 13:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188317

Le mer. 27 sept. 2023 =C3=A0 14:59, Alexander Kanavin
<alex.kanavin@gmail.com> a =C3=A9crit :
>
> You need to scroll up. The failure is in lines 557 to 609.

Hmm stange ctrl-f didn't work. I can see it now. Thank you, I'll look at it

Julien
>
> Alex
>
>
> On Wed, 27 Sept 2023 at 14:48, Julien Stephan <jstephan@baylibre.com> wro=
te:
> >
> > Le mer. 27 sept. 2023 =C3=A0 12:16, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> a =C3=A9crit :
> > >
> > > Hello,
> > >
> > > I had a build were all the tests passed, then I had this failure:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/581=
2/steps/14/logs/stdio
> > >
> >
> > Hi Alexandre,
> > I only see
> >
> >    bblock.BBLock.test_lock_single_recipe_all_tasks: FAILED
> >
> > but I can't see the actual error :( Is it possible to have it somewhere=
?
> >
> > Cheers
> > Julien
> >
> > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#188313): https://lists.openembedded.org/g/openembed=
ded-core/message/188313
> > Mute This Topic: https://lists.openembedded.org/mt/101570279/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

