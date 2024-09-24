Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425EFCF9C72
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 05:27:21 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.7000.1727155631700778415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 22:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U6R9jnyv;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-710e1a47b40so1272531a34.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 22:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727155631; x=1727760431; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSnl1FvOVSOV7ETllPaYJg2tobkso8VK5+QLbbOx0vA=;
        b=U6R9jnyvjxJDd1X3T8rB1l/rBThNu3cNcHStHziBt0gv1aaOyQMkU8HTN3n2jnw5f/
         JxRhX/U1q7N+6I6aGPYrp2tyEbRjIafz0VysA2OlroD9lZzSX6WVCVYHAzaqF0NP9MO4
         yM14hBBJvq7FEjcX+FwDTSaKHtES442HFvNYUqicvj/u6E/RgloUbkvie3PvFThWusHq
         Cpfq1MQCj1uACFVvdrZbj5M0CATpK+YK8mNhfr5g7rPaErMORF5KR/CwFC43/zYuNkUo
         yPBAARE9xskW+V5ywBClvuV0WpNU/6U3FFVgdW5RBGQAv9W75OieNlZG19cxUG/lzKBq
         tiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727155631; x=1727760431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSnl1FvOVSOV7ETllPaYJg2tobkso8VK5+QLbbOx0vA=;
        b=TC8F1hd+p2ROGoVKneEv0evgBwOC08Q7Sl3UtLU9yivJWaOQ5cqKzCuSb22KYVf6wx
         hRlImvb1MwPsPNEu7OvuA1GCFAzBj6LIfDuu3h6I3Q20ci/e+8tc/LlJQSQbhjgs3CLe
         32ZNaUGHDC/oXXK3KURjvZas1l6dyC61E1E3aqpQb31+IemCVmG+MykOZChoCKQsVpgs
         sBqLYxWbCuFEf1f4CtEMfki/oSIvX9gKChvXXNjq2jgnmF3rKNXQA29y/aLNBXDQf1Pn
         wpbLmpnxVeWNpPc7HCTgWPqSfNKq6vDCIunfgW7Ftd6rik2BYpCio6g3gPyGduwclWTo
         is4w==
X-Gm-Message-State: AOJu0Yypwmt/YJh+whoZXx2XWCLH+0KpNm62egBU46FhBvtkGduJ2yB3
	iui/PkcHGJ6p7Hei1u1wb/EJN1EdH55hr75+u9y0s8heM1ptH+2KWkUkmOieuIRZdLAX192cZfe
	6cxUglFwi1smInqmKEziTA97CI50=
X-Google-Smtp-Source: AGHT+IF2okXjPvccOMnqwr7vVYI7jpp5+18EHP4WCVebqy0irUwXd9PMeQHWXdRsXk7iYYO+fcdhGtud6B+BYcU5wj4=
X-Received: by 2002:a05:6808:130d:b0:3e0:6db0:fd84 with SMTP id
 5614622812f47-3e271b61b71mr8636007b6e.6.1727155630761; Mon, 23 Sep 2024
 22:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240923234336.3978188-1-raj.khem@gmail.com> <CANNYZj9jZywpqjYRZhtxPZTE6g8T=G2gsF2K86MwPxNXoVdnAQ@mail.gmail.com>
In-Reply-To: <CANNYZj9jZywpqjYRZhtxPZTE6g8T=G2gsF2K86MwPxNXoVdnAQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Sep 2024 22:26:45 -0700
Message-ID: <CAMKF1srvUpsSATHsf-YPrVg8umGPJR44aPOr6bGKukFBdAXTyg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vte: Upgrade to 0.78.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 05:27:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204834

On Mon, Sep 23, 2024 at 9:18=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> How can the crash be reproduced? This must be specified. Could it be spec=
ific to your setup? Qemu usermode is pretty robust with standard poky.
>
It could be my setup but I could see it with clang and gcc and I left it th=
ere.
Its a bit convoluted to reproduce since its in generated program which
is called via another wrapper over qemu usermode,
here is the cmdline which can be used. After do_compile task is run for vte=
.
https://snips.sh/f/sREktUGD0f

> Alex
>
> On Tue 24. Sep 2024 at 1.43, Khem Raj via lists.openembedded.org <raj.khe=
m=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> - Needed for Gnome-47 components e.g. gnome-console
>> - Disable GI_DATA on arm, it uses qemu usermode and qemu-user crashes
>>   while running qemu_Vte-3.91
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-support/vte/{vte_0.76.3.bb =3D> vte_0.78.0.bb} | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-support/vte/{vte_0.76.3.bb =3D> vte_0.78.0.bb} (94%=
)
>>
>> diff --git a/meta/recipes-support/vte/vte_0.76.3.bb b/meta/recipes-suppo=
rt/vte/vte_0.78.0.bb
>> similarity index 94%
>> rename from meta/recipes-support/vte/vte_0.76.3.bb
>> rename to meta/recipes-support/vte/vte_0.78.0.bb
>> index 515ff228fd4..f44d39ac451 100644
>> --- a/meta/recipes-support/vte/vte_0.76.3.bb
>> +++ b/meta/recipes-support/vte/vte_0.78.0.bb
>> @@ -15,11 +15,11 @@ DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 libpcre2=
 libxml2-native gperf-native i
>>
>>  GIR_MESON_OPTION =3D 'gir'
>>  GIDOCGEN_MESON_OPTION =3D "docs"
>> -
>> +GI_DATA_ENABLED:armv7ve =3D "False"
>>  inherit gnomebase gi-docgen features_check upstream-version-is-even gob=
ject-introspection systemd vala
>>
>>  SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.pa=
tch"
>> -SRC_URI[archive.sha256sum] =3D "f678e94c056f377fd0021214adff5450cb172e9=
a08b160911181ddff7b7d5d60"
>> +SRC_URI[archive.sha256sum] =3D "07f09c6228a8bb3c1599dd0f5a6ec797b30d301=
0c3ac91cf21b69d9635dfaf7c"
>>
>>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#204827): https://lists.openembedded.org/g/openembedd=
ed-core/message/204827
>> Mute This Topic: https://lists.openembedded.org/mt/108619476/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

