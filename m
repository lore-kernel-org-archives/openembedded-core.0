Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01098E6FE52
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 15:44:49 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.955.1695397486135016771
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 08:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c0+skkGT;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.51, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-401b393ddd2so23959645e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 08:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695397484; x=1696002284; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klVUKHMKYAKtSbL1o7T7S2aD9y+khIt5SL+qpVHJyUY=;
        b=c0+skkGT2GsKZdd29kyfoHUC1jE1kt3bN57ZdE+Kqy9Br3ZJS5tLj708J1HCXtAcTG
         utIGu1EF8J1MwpDPzAy2vnmRCDpihTdENz/gyVfQlxAyJhYdnlWZVzuHQ3HURE9XoVUF
         Tc4q2CJmyq6QLWrmE8rSpnsGU0iIs5OEn0DwBBDestVQufOa+uaHeAqA2encbxPTpPHt
         VH8UO8SwHAknyqZqpPdcFTpZ3pHE8uit9PzCWUSgOxQaSsTS+byADm7e5+wxkB5wWuz6
         f0HbhB9MG6/aX1OSHVNZ2T6kuAYXkAH5fN5YmUxo5wxQ/+MUBGRpxjztbzs4o5l8e9s7
         ziFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695397484; x=1696002284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klVUKHMKYAKtSbL1o7T7S2aD9y+khIt5SL+qpVHJyUY=;
        b=vH0Nr1eFuqv/JYw+LNLg+W5hbik0Bq7V9BEB0Oex5Yt/04963u9JybaEOuZwev3rKW
         ZJpevPYR0cL+QSqFAFB9iouiS4Fgfo2JafESpZWZixiQcZ/emlm0VGP0MNqA5zD/9DMl
         nx3UsmIaxAW0+ayLL6Qo5pI517MPl6Cb3SYV092t8BpDuJsXzA8+oW9KD6g7Boli6vUT
         xmKqO2jilw8h7S81HLNkBqvyBOMMjnHl5Msi1Q5Uv3w7eFr+SmbXSTOyeUqvo/oPdPNX
         zy7vII+dLbqhW1/oUlkOvSekFQTV6jASj4bTZ4umOTrlXZiwd3oa4Eo0OGKqNZYvM9EK
         /KUg==
X-Gm-Message-State: AOJu0YyLeb597YYZC9/S7o9O7R1J+Gtxr7bHjwOwE272jUK24dDXa12T
	kCIFF2AKacA8Dsj84hLH3JieJdXFGxjF/ifyuapSOQ==
X-Google-Smtp-Source: AGHT+IFX9iSI5ZQElDuTr+TTfgW9V+88R2J1fcmY4muLcwFu/jtGtmQwNAPSqTQXitBsCawCQFCU2+moocLMAv76HgQ=
X-Received: by 2002:adf:e288:0:b0:31f:e1b4:583d with SMTP id
 v8-20020adfe288000000b0031fe1b4583dmr41364wri.56.1695397484353; Fri, 22 Sep
 2023 08:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230922102506.1341353-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20230922102506.1341353-1-michael.opdenacker@bootlin.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 22 Sep 2023 05:44:33 -1000
Message-ID: <CAOSpxdZ2rP2EtWgaW9P9OFzQ0Z2SzLZBjYYq2buz4Q9n8n-qww@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] flac: fix CVE-2020-22219
To: michael.opdenacker@bootlin.com
Cc: openembedded-core@lists.openembedded.org, 
	Meenali Gupta <meenali.gupta@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 15:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188125

On Fri, Sep 22, 2023 at 12:25=E2=80=AFAM Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=3Dbootlin.com@lists.openembedded.org> wrote:
>
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Buffer Overflow vulnerability in function bitwriter_grow_ in flac before
> 1.4.0 allows remote attackers to run arbitrary code via crafted input to
> the encoder.
>
> Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Tested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> ---
>  meta/recipes-multimedia/flac/flac_1.3.3.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/flac/flac_1.3.3.bb b/meta/recipes-mu=
ltimedia/flac/flac_1.3.3.bb
> index cb6692aedf..ca04f36d1a 100644
> --- a/meta/recipes-multimedia/flac/flac_1.3.3.bb
> +++ b/meta/recipes-multimedia/flac/flac_1.3.3.bb
> @@ -15,6 +15,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.FDL;md5=3Dad1419ec=
c56e060eccf8184a87c4285f \
>  DEPENDS =3D "libogg"
>
>  SRC_URI =3D "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
> +           file://CVE-2020-22219.patch \

You'll need to add the patch file to the commit too :-)

Steve
>  "
>
>  SRC_URI[md5sum] =3D "26703ed2858c1fc9ffc05136d13daa69"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188093): https://lists.openembedded.org/g/openembedde=
d-core/message/188093
> Mute This Topic: https://lists.openembedded.org/mt/101518444/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

