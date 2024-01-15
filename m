Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E59C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 13:50:16 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.79948.1705326613028066670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 05:50:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S+OnzvMd;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e80d40a41so11109873e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 05:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705326611; x=1705931411; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onaaJuU4OeUQN8/NA+XYgEicz/3i8E7RUhnqxmsMRsU=;
        b=S+OnzvMdF0NSOtn0xTAKlw9o/A3upRFpEczd3nVXKkoMYSn+sp9Nxurdpb3T4Pjmh3
         jlXE7zLq/TYgUXiOsv08PIkMsVBDVuviMox2fkh2PFzfqIFRFYvdyg32ZcEAxHCLjtA+
         ySdnPs7Z5u/W4LlGiEd3y5932hdFCvULQ/aP97qfXG5JA2uE/irTjo+HbnCjx6Ev10F7
         ARw9pnH9Tv7SJrTS4uxF+DT0MnSOwjpYg1ayYh8kfQahPdiejVVorrnbAUSH3v7KHZqB
         X3Cr1QameU9ZkugeVxTlFBPMsboNwJoz78vc2jn/93IFr4bpVLyXCbn6diLilGzF2ckq
         gBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705326611; x=1705931411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onaaJuU4OeUQN8/NA+XYgEicz/3i8E7RUhnqxmsMRsU=;
        b=Fw03EVJ/EW4ltyeT1NM+aiGB3B4m1QjS5OtBp9r/OUbpfqE68Nh1eWdtFbCjv9gpdn
         LjRPndwMJ9U3QqX7eab59o68g7c682R47ILtX3OtcDY+sIOC5MNt/H+CuIRCj8rgtzvi
         2lL4GeyOF4sDuS367ZaX3H/XPx5tpJaGZKlWvNhJwf7jw0LKcQM+2YAFGnV1dmtTm7Vy
         v68AEZdk68SPLJ+FhAn9I2Q1lZd8kRaeowVHsmze+mvTDzZJNDiUXA5bKWd7grlXO5MI
         I/HdYbmn700M45q8FrzQD26Uhm0StAlbEYlCuUwAaVD2ddfQKzTP9T8MPuJuzPIkp45+
         0imQ==
X-Gm-Message-State: AOJu0YzIDypyUoDBKd8lpETcSELSO3UeL2+kzY3cOcKZLrrmYeFt4ww8
	5aNdY/MhGvevYSNzLYs0Ky8andCT+Yvu8NhYaV9y8eEg
X-Google-Smtp-Source: AGHT+IHFFjKwg+o6ORMQykYSNeBgnJpkh2Re66840o/WUZTi8HKseUYJ8qB0g2lLqUpw7YznmjX3Dq9vNZVKVdUCyrI=
X-Received: by 2002:a19:6442:0:b0:50e:bc9b:154 with SMTP id
 b2-20020a196442000000b0050ebc9b0154mr2750537lfj.35.1705326610797; Mon, 15 Jan
 2024 05:50:10 -0800 (PST)
MIME-Version: 1.0
References: <20240109192923.3183219-1-raj.khem@gmail.com> <3B3DBDDB-9E17-431A-B3E8-DC8E072066FC@arm.com>
In-Reply-To: <3B3DBDDB-9E17-431A-B3E8-DC8E072066FC@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jan 2024 14:49:59 +0100
Message-ID: <CANNYZj_oydN+0ODz_kCjus74uzF-wUhcZ1nfmYqrRo+BoupB4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] glib-networking: Fix ptest failures with
 openssl backend
To: Ross Burton <ross.burton@arm.com>
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 13:50:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193675

On Mon, 15 Jan 2024 at 14:41, Ross Burton <ross.burton@arm.com> wrote:
>
> On 9 Jan 2024, at 19:29, Khem Raj via lists.openembedded.org <raj.khem=3D=
gmail.com@lists.openembedded.org> wrote:
> > ++  #ifndef BACKEND_IS_OPENSSL
> > +   g_test_add ("/tls/" BACKEND "/connection/unclean-close-by-server", =
TestConnection, NULL,
> > +               setup_connection, test_unclean_close_by_server, teardow=
n_connection);
> > ++  #endif
>
> Personally, unless upstream say =E2=80=9Cyes this test doesn=E2=80=99t wo=
rk on openssl yet=E2=80=9D and mark it as such, this is still a test failur=
e that is failing for unknown reasons.
>
> We could #if 0 out every test that failed and rejoice in our 100% pass te=
st cases but that would be a terrible idea, so why is this different?

This is what we already do for intermittently failing ptests all over
the stack. Rejoice!

This issue is reported upstream, and the link is in the patch. Yes,
given sufficient time one can become an expert in intricacies of glib,
openssl, and their interaction, and then develop a real fix all by
themselves, but I think a more fair expectation is exactly what Khem
is doing: report upstream, add a reasonable workaround, follow up
upstream requests in the reported ticket.

Alex

