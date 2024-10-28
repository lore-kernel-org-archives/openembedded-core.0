Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411A2D3E2A2
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 18:53:04 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.693.1730141579135096792
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sy0Yqaqd;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so34437971fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 11:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730141577; x=1730746377; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrXnbiDg/2Ff4u78tqpvgku3D7nvN7KU5kS6q59mZlg=;
        b=Sy0YqaqdLzv33qrV5ZZQ0y6NGUcQe4xvIhMSuZ/NuCNIW2suZ/q05Ex1BbF7m6H8vh
         5SsXKiOTqTmh4Yj/wkjD27N1DKlVxtyPqdnVAaYq30Hl252Or7Q3f7dOXXaHPfiouHdf
         M1G2n62tpQzK9Sp06yRY4EbBKn8kVpA1HEqs69Iz549l/oHsBStsIQtx2U0ArDr7JfAL
         PYJUbGOkR5L4B7BE12Kh+elCm3ezqZmnYlOlxL15rP94dEpx5WVtAFiSESMWjXY24IE/
         R/6LMsbicEZIB2Q4SPfI8gbQqMI0TRazlZm+YXWkfmxlkwjkfO8aMrG0OznShq8TyvMm
         hGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730141577; x=1730746377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrXnbiDg/2Ff4u78tqpvgku3D7nvN7KU5kS6q59mZlg=;
        b=Mh/dV9Yx/EmRtqBZ8jgYIMTsRvOR7Wwo8kZ5iq8OHUXoL+qO3mEAAWudH0MvYl21sg
         gjAgrYg+mcEQrBibUOMKYjjYV/UlS9+y8RLPRUV8GJXHG7VPv2v9/SWo8teDfrbgl80y
         huJbmseOyjBS5OzmfYZA9rHdj2cbwyFRv//+X73tHgNw6F5QjwK2RuJQsUasCBC1BlJC
         HX3IEYoKTjVjHeYDk4Y6FahKDdAojEMMkOUdm64WaKUCM4XskHhSZ5UZWkqbPaPoyMAG
         kxYcYOb4+3w6T0hTsIFS+BZ8yp02+7zI2Ikci7GJIftlOpxwSGpnQdflP/UogehISZmx
         zpdQ==
X-Gm-Message-State: AOJu0YzQIdRGhZFc1Klrbyxq7YIlZnFMu7DRja7IgZd2DekcKLIT+tcR
	9vtFRNVoCG13NWLbjXbQEsAc+3/D8l096qQDwxb81FDlbH+gW3ZbHFU9EbQH2vjhH24qncf9rSV
	pAD1qb2DDtHAC+0D8h9BT5yniE0w=
X-Google-Smtp-Source: AGHT+IH0Ql+HxYo6p9PgusIMFS9XqHmlVkC14jcyFVlGTeWfBm74eFs5DKkWsVxruzFcqyNK1qIhGmJICaophLn6s4w=
X-Received: by 2002:a2e:a543:0:b0:2fa:cc50:41b with SMTP id
 38308e7fff4ca-2fcbdf5fa9amr37597971fa.5.1730141576615; Mon, 28 Oct 2024
 11:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20241025161627.3352-1-sreejith.ravi087@gmail.com>
 <CANNYZj8+5LwPXrQ4eda4muAdOmpfvkg5oo0GXzCG+HJJh65vDQ@mail.gmail.com> <CAFt4JuEdi+zFkN37vvvK-PNtqshncC_8dn44gU+FcKXpde-ynA@mail.gmail.com>
In-Reply-To: <CAFt4JuEdi+zFkN37vvvK-PNtqshncC_8dn44gU+FcKXpde-ynA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Oct 2024 19:52:45 +0100
Message-ID: <CANNYZj-Q_Y4X80o_mbA=uEQ3gQbfwNB3bPcnu5-xvsOaPjKCbg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_manager : Add configuration option to
 select filterbydependencies
To: Sreejith Ravi <sreejith.ravi087@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 18:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206455

On Fri, 25 Oct 2024 at 20:19, Sreejith Ravi <sreejith.ravi087@gmail.com> wr=
ote:
> We aim to use released IPK files from a previous release build instead of=
 building from source. During package processing, we skip all build tasks f=
or the package and copy it to the deploy directory, adjusting the feeds acc=
ordingly. With a customized opkg configuration, we can set the feeds either=
 from a remote server or the deploy directory. Since we are using the relea=
sed IPK files, there is no need to filter by dependencies, as this has alre=
ady been handled during the release of the IPK.
>
> This patch provides an additional option to use the deploy directory as a=
n IPK repository. By default, this option is disabled but can be enabled if=
 needed.

Unfortunately I am strongly against supporting this use case in
openembedded core, and I think many will agree. OE's main feature is
end to end builds from source that are also reproducible. Sstate is
the way to rebuild only what's needed, and you need to further explain
why it isn't being used instead. All code in rootfs creation assumes
that packages used to compose an image are produced through the
regular build process or come from sstate, and not imported from
elsewhere.

If you must do things differently then you need to implement your own
set of classes (perhaps subclassing what's there), and set
PACKAGES_CLASSES =3D "package_prebuilt_ipk" or similar.

Alex

