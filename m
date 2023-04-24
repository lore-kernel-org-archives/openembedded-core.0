Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE38C7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 10:16:21 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.47252.1682331374272059945
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 03:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nUgvW0JG;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4edc114c716so4502639e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 03:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682331372; x=1684923372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OctzlZORPe8o64PM09AS0b6YDbTXpRNa4aoB3fVEQuI=;
        b=nUgvW0JGF28995TD8v7meYvT8XQfl+7Yw1H4FWL6zYBeYAN7NvEBaNu1g7HhLiUxio
         mk5aYlr3NPEE8+FoCBU7cnFZuv5w9YE5l5Qu1ekKiDba0lluWjnj2G/99M5Wi0rAgvhr
         8/HA0Z7AMVlqWtg8WV9h/VL2wzy5OnrCzvkR47dPYgnN94IOio26/zOhNtHGHAFQ9+ht
         IRuotL96igoz90NMGZGAQKApHeEgg1Zy7rpfu3miSzDObPOpAw5wfVzVQPMKnBgWf0ri
         1XM6vAa+8oT66XoDcbVTO6/xuwt7Lkdnuo7WkJJfS67RY5BFJ41k3wJ9tqD4V4BhmaOa
         KPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682331372; x=1684923372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OctzlZORPe8o64PM09AS0b6YDbTXpRNa4aoB3fVEQuI=;
        b=Y3rrP/faFwCLmW1AjH63NhMi6gTm00wbfzJlEEzooE72kQFpteqdRFZcRjhPM6j8Wk
         2rS8rmsOHwqMJLy3FmB1cMvVBJ6ZyyDUmZN6iPbGfWjvENu/LqVfojSwB0cnVTFwlgy9
         bkqksgusxY/qrGHiC7qnAFWpso293PvZt84/E4msrUEmFrz96I2oIlmuVGr2TalaY0EP
         UgeepI/k3qdDXj9DQ0+O3PUrTVUwVTZy0O9Hlyoo2LX2DsmWLuqRJVNsyS/QhzI/iaU4
         x9jeAqT3ydkGrESYLw43IsPoYXXIIf2LvkpOeIMi8bDh8gI8XbsYDgXYy/TUiQJwna+o
         3cOA==
X-Gm-Message-State: AAQBX9d77JgJO/J2dmXmu2/kPxwyChj+MpVqHX04sGOAeOCRDOv2PI1H
	uHz8DAbG0WCdG10VqESFTjXKnm5PdyfxH5y0DSs=
X-Google-Smtp-Source: AKy350bRFTul0gXJz6G00/7GmqoHa9apJWsgehdH10g16XNb28gdlHZSwsKbTQQYEmzhvRi0r9RdLgbJryK0GDvHdbQ=
X-Received: by 2002:ac2:5485:0:b0:4dd:a053:3baf with SMTP id
 t5-20020ac25485000000b004dda0533bafmr2710176lfk.35.1682331372053; Mon, 24 Apr
 2023 03:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1682178812.git.frederic.martinsons@gmail.com>
 <CANNYZj-z_nV55eatamXDzGh5Y0TzPX3=yOJ1UnL9qtOHgtpKbA@mail.gmail.com>
 <1758D12BE8A5C7D7.10313@lists.openembedded.org> <CA+cAker=3c7CYdq8WRnaVmr45n-Ja2Tt7p-0iMWKmDeAcZJUqQ@mail.gmail.com>
 <CANNYZj9hHYvzsVxXDYySxFX2kZD0Am9K_xEVg_hGcF7ACb+izg@mail.gmail.com>
In-Reply-To: <CANNYZj9hHYvzsVxXDYySxFX2kZD0Am9K_xEVg_hGcF7ACb+izg@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 24 Apr 2023 12:16:00 +0200
Message-ID: <CA+cAker7fpFGp_5VKCbR8paTuvXEwNEoaCGQ_NUDfKum3-vBPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Create class for building rust unit test
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d36b9c05fa124b65"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 10:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180348

--000000000000d36b9c05fa124b65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 24 avr. 2023, 11:53, Alexander Kanavin <alex.kanavin@gmail.com> a
=C3=A9crit :

> On Mon, 24 Apr 2023 at 11:44, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> > I looked again and python3-bcrypt is already in PTESTS_FAST , for
> zvariant , the recipe is in meta-selftest
> > so this layer is not always included, is this will be a problem to add
> zvariant into PTESTS_FAST ?
>
> zvariant could be skipped for now then. Are the newly expanded bcrypt
> tests still quick (under kvm)?
>
> Alex
>

Really quick since there are 0 test in the rust code ;)
But a test binary is guaranteed to be generated anyway.
I'll take another look to see if why python3-bcrypt was already in the test
suite and if I didn't overwrite something there.

--000000000000d36b9c05fa124b65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le lun. 24 avr. 2023, 11:53, Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, 24 Apr 2023 =
at 11:44, Fr=C3=A9d=C3=A9ric Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt; I looked again and python3-bcrypt is already in PTESTS_FAST , for zvar=
iant , the recipe is in meta-selftest<br>
&gt; so this layer is not always included, is this will be a problem to add=
 zvariant into PTESTS_FAST ?<br>
<br>
zvariant could be skipped for now then. Are the newly expanded bcrypt<br>
tests still quick (under kvm)?<br>
<br>
Alex<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Really quick since there are 0 test in the rust code ;)=C2=A0</div><div=
 dir=3D"auto">But a test binary is guaranteed to be generated anyway.=C2=A0=
</div><div dir=3D"auto">I&#39;ll take another look to see if why python3-bc=
rypt was already in the test suite and if I didn&#39;t overwrite something =
there.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000d36b9c05fa124b65--

