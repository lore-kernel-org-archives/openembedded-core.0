Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D832C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 19:17:53 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.54870.1674155871143746411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 11:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112 header.b=e+vC2xeU;
 spf=pass (domain: ossystems.com.br, ip: 209.85.161.45, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-oo1-f45.google.com with SMTP id c145-20020a4a4f97000000b004f505540a20so673681oob.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 11:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CM9yIKT0SF+O8+g8WMrDxRjQGemV6RXJnKRdS1o2iK4=;
        b=e+vC2xeU9IO5xaW30tYgyKKmPIvSXRTwhNUDFOPnR2N3pRQmH32VmexqsGE13o8yUe
         xkPBucEBjNdwQnIZ2JSTSxzA7MFVTQ4ckcKz8HTb3VlDg1pXpjMpW5glSXYQg5dTm6hz
         UTCdgVQum8/B/QUbr2bv8Zqr1zJM8kyiGnuguQWWm7fgEHxa0Xn/O0JXHPKIxmIxUh2S
         ncUyyYIhK8y8hi3QBlgNsdP7VOz15r6KNyE+gtMyn1O6pBY9ZZ5zJq8o+IrD0Tcnj7Oi
         tyViD6bU1h9zp0IO3PzVkEPZ9R4BumoaX4nla0iykFjhepdjEg62jY0Xs2EUH50t/3Bf
         TyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CM9yIKT0SF+O8+g8WMrDxRjQGemV6RXJnKRdS1o2iK4=;
        b=ff6TUote3sGSLVg5v8hJ1NhuzK6eavWj+slAe/AQgFzrIjOaGmiS8yJ4B9kPh+SEVK
         JCReU3FkfS/kXNQhi/uP8hqq1vrBKpixmqHHESEVlWhkWrH2PqmsPBT4lcaJzGIuwDQM
         B44recEmeiHfWV++wq63v6gqMKavrk3ff7bMU7H8wmdHWssTwlJ7PnN2jICqUOd+3aKz
         0BLc3BX0fDPn5ag3hFt5dcXGOuzBiViNkUMPj52HFFlq6zRhLKVczyV+uGE3Dstzq+OV
         gMmn8kptKcfoqc4CZd3k1N2NTosxOC+US1WlXafRQNnPVlOj/UCAa7vrTfpZMFG919bU
         Wk8w==
X-Gm-Message-State: AFqh2kpdnAkdg5Lj5DV7NF+l2VicGlSqM+0vFpvhLwNhyZevawHVRdqd
	vmGMhBECqXmaYCGv0dJ6kK9ABug+O1gFkiNDcGk=
X-Google-Smtp-Source: AMrXdXsSYUDwq8ZcOcgvmzS8TX5cZtQFjhLqw8qF3H48GB3EHOeIbL4YmbduYIeCtw9jx2EBy6hdMQ==
X-Received: by 2002:a4a:b2c9:0:b0:4a2:5f2:37c1 with SMTP id l9-20020a4ab2c9000000b004a205f237c1mr5057486ooo.9.1674155869971;
        Thu, 19 Jan 2023 11:17:49 -0800 (PST)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com. [209.85.167.169])
        by smtp.gmail.com with ESMTPSA id d144-20020a4a5296000000b004f269f9b8f3sm10998059oob.25.2023.01.19.11.17.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 11:17:49 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f169.google.com with SMTP id d188so2531791oia.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 11:17:49 -0800 (PST)
X-Received: by 2002:a05:6808:b34:b0:36c:cc25:8bb9 with SMTP id
 t20-20020a0568080b3400b0036ccc258bb9mr337999oij.288.1674155868991; Thu, 19
 Jan 2023 11:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20230119182643.1243247-1-festevam@gmail.com>
In-Reply-To: <20230119182643.1243247-1-festevam@gmail.com>
Date: Thu, 19 Jan 2023 16:17:37 -0300
X-Gmail-Original-Message-ID: <CAP9ODKocJpTvpeZOrQJpzidS+RTmgvQ=mayxP2u3ijV90pQ-CA@mail.gmail.com>
Message-ID: <CAP9ODKocJpTvpeZOrQJpzidS+RTmgvQ=mayxP2u3ijV90pQ-CA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] u-boot: Upgrade to 2023.01
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Fabio Estevam <festevam@denx.de>
Content-Type: multipart/alternative; boundary="000000000000deb81605f2a2c9ef"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 19:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176162

--000000000000deb81605f2a2c9ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 19 de jan. de 2023 =C3=A0s 15:26, Fabio Estevam <festevam@gmail.co=
m>
escreveu:

> +++ b/meta/recipes-bsp/u-boot/u-boot_2023.01.bb
> @@ -0,0 +1,5 @@
> +require u-boot-common.inc
> +require u-boot.inc
> +
> +DEPENDS +=3D "bc-native dtc-native python3-setuptools-native"
> +
>

python3-setuptools-native has been included in the common.inc so this
depends can be removed.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000deb81605f2a2c9ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qui., 19 de jan. de 2023 =C3=A0s 1=
5:26, Fabio Estevam &lt;<a href=3D"mailto:festevam@gmail.com">festevam@gmai=
l.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2023.01.bb" =
rel=3D"noreferrer" target=3D"_blank">u-boot_2023.01.bb</a><br>
@@ -0,0 +1,5 @@<br>
+require u-boot-common.inc<br>
+require u-boot.inc<br>
+<br>
+DEPENDS +=3D &quot;bc-native dtc-native python3-setuptools-native&quot;<br=
>
+<br></blockquote><div><br></div><div>python3-setuptools-native has been in=
cluded in the common.inc so this depends can be removed.<br></div></div><di=
v><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvad=
or =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=3D"_blank">htt=
p://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--000000000000deb81605f2a2c9ef--

