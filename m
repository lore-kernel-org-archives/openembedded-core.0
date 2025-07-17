Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1500C83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 17:00:05 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.581.1752771596899143330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 09:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dRDUEc8Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70e64b430daso12288107b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752771596; x=1753376396; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTuWxO0Q46vLJw5ajfQeth5fEx2HlBZT35Q4ur4ulTM=;
        b=dRDUEc8YozdDO1bOjVQ46px2lvtjUE72LbInIMQpUB5I9zw2SDxtK+OJiQKKmHQ9EU
         00ObhvzlPm2zNDX7GI0cdPIdi/uSNfZKd+t9SFXSZWIuQH/x5SNBbnEFimabC1Hf2jAq
         a2DgzOsnXWyyBq590S6yyZ2MN8uPBDOHrHI7yaWCgv/QGbJ1W4D1luloJY2ctW1QrdWD
         E8C/Gu/AUt5PM7mbmLJyX1gHqCO2Dj4CfRkBdBiRMFxpdhLavDCRspjGyXK6pidRu6m2
         9c3xGRBVDPAHU0oENhrlCdr41AMNDzXs93eDfeapzDQQnf/l462j2T3ekcKIGMSc3otV
         Q/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752771596; x=1753376396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTuWxO0Q46vLJw5ajfQeth5fEx2HlBZT35Q4ur4ulTM=;
        b=NdxxFBTd1fKAin6g4ymWo//31HFS9bKChX3uwGb8FUM7/Sdpmn7/jcPJd8TmYVzs7m
         jRrqTE4B99N/fJhVX2ruK5GZu/GrPgcL9XKaaG9Y4OvIbrcgKbj1lWLN2qPXbfd2OXRW
         V6oeqZ2SPkBpE+wfFwGwGj8ELppfBrYS4kzSb+SaxSwSeKcXciao4C1ds5ZGBx0D0u0V
         AWJZdXyQVwuRTuTK409h2cI0/I6Z9iY0MQyaOGm+2D0GLqr7suKZXGc1yc7hWizTARtz
         woYxf8Qqmf80B//1GKirP1fr8ttSIgqEDKOLUYkXw52/ZS1jYm0UObOzPNOXMQrAp8eZ
         Ntwg==
X-Gm-Message-State: AOJu0YywGcZNHSDVv+LBp55KnddbEVGYu4xTVoA3kOV8WvPTryelbotj
	c0QVpMWbbq83ZxFESXkN/P39gVnDB3FIKzded9k8R23BbOk/Zfz4RVB6Ckw6r5KIdbFUy8nskmw
	0DRDDqRqTri/HSTLVX/Bw6DU0BixDvPg=
X-Gm-Gg: ASbGncvRns9qHci3IRstjEU+FXn7mnMeZfmk20qVt3SIhajKOdI98UDIbG+o8dmrzeA
	KpLO6LMzIaastpufCwixvc0YVh2qzt61C0Dbh1RSsPJEdDe8jWi0WKnXUttaXM5B3/3U4bXUxFD
	1TzKrYXeLZA3SrX7Sp9MH3sb6QxoC60UOUez+h2Z767NPQQrpmUWL6r6XjEwue4bBD5U2KW5elT
	pM0j42R5q5n4cIb
X-Google-Smtp-Source: AGHT+IGiZKQarYxAFxTubkPwCnW8mimtedEdH+Lb7SSMRQQ7F4VGNL8KiwCbGYwTaBfZZEf/2ayX7I3qQY9BUnIaPNQ=
X-Received: by 2002:a05:690c:2783:b0:70c:b534:868f with SMTP id
 00721157ae682-718374f08ddmr101186737b3.20.1752771595868; Thu, 17 Jul 2025
 09:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250717130938.169424-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250717130938.169424-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Jul 2025 09:59:29 -0700
X-Gm-Features: Ac12FXyQUUqNWvcG8dMVQxR9rbDJaxAn5zL4J48uqUH9ltx6LxXzt25dwzAhLLc
Message-ID: <CAMKF1sobGw5QO1bYw2yc1YK6_t+rLqUr9vq3joL4hsyLX-LD5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gst-examples: Fix buttons in gtk-play at runtime
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 17:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220556

On Thu, Jul 17, 2025 at 6:09=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> The media player buttons weren't working. At runtime there were warnings
> like:
>
> (gtk-play:824): Gtk-WARNING **: 12:37:53.946: Could not find signal handl=
er 'next_button_clicked_cb'.  Did you compile with -rdynamic?
>
> Add the missing linker option to make the buttons work.
>
> [YOCTO #15915]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb b/m=
eta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
> index 8835b7d97bc..df8fd4bd263 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
> @@ -18,6 +18,9 @@ S =3D "${UNPACKDIR}/${BP}/subprojects/gst-examples"
>
>  inherit meson pkgconfig features_check
>
> +# gtk-play has runtime errors otherwise
> +TARGET_LDFLAGS +=3D "-rdynamic"
> +

I wonder why other distros do not see this problem. Maybe its due to
OE defaulting to hidden visibility attribute in C++ compiler options

>  UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220542): https://lists.openembedded.org/g/openembedde=
d-core/message/220542
> Mute This Topic: https://lists.openembedded.org/mt/114202596/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

