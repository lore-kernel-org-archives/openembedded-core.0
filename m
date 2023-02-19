Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DECC05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 21:12:21 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.5973.1676841136955099764
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 13:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=noCOipRz;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id x26so1497445lfd.12
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 13:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhkgKHqPdaadDbQbEN1OPBhCDiHYuSmRedwaerfMi80=;
        b=noCOipRzpSTDGs3R/C2ec7ifYqxEm57c/JPUclaO1XNheeYhDvXEGNweCmNjA4JBV5
         QYKLqN8eA1X568ph3ZdNqwtBA6RXKRjCyWMDMHneWmIae5iTlAKnMqu1BaUl61WmoYpj
         l7UzFA5PmfpzVWv3BVObIOsalsdZQEDC/O/KNhBtOWz41y/wvK2Vn433l5JQJ6Gvc1AF
         ORbZeKxDrjfWL/zsD4QEGq+fSOhYm8lL2hUBIWfxG4/I7v7KQRkb0ZBIqj1OC2QjhGsd
         zCFPjKFMfjSvspmfzXu89Rwhyqp4+plj2Ykd7hozCBCJ6AuKeURAGYWCfBXwVvrYHbUk
         ASIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhkgKHqPdaadDbQbEN1OPBhCDiHYuSmRedwaerfMi80=;
        b=sMLfIGCvBRDF4p9Nbrv9cyrvAfhO7ffSGP+pbifQb8fE4N947strDm0ursUHpR1a2S
         +pWHR2nSP/RI0PUYQXXOz+QUxISe34BaSKNp3HfjxBdqv1RBrYdAQuTl1DWQDdKbZhIL
         JWL0XaomiSRVslcBqR9dVq93Gze2sLN9CcU/eGiPt41urpZIefk6MxZb5kdKqaIc/gVU
         ORmYrxR6hEKxUBWfDTbEdwZhgq9CRi4xwzRXRMy+pb92CME9Erf2X7EQcCn1YWpgF9Wz
         hy8M+TaYOnq90rYjSxwaef6BB/9MmQokVyxZ3yOfKzzVn3cRKYBXw4E0X9nwVVLkknsA
         F+OQ==
X-Gm-Message-State: AO0yUKVPAkmCKiqucWRi629Be0ybk7DVLDgT5h9GMCv7rOk6mjjGAglx
	NP5bMzh0UI8Wbotp7o8p8Wut0vAFq32VnbBtTnA=
X-Google-Smtp-Source: AK7set/eixi6inWkXXdov85hxcf61hsG6nyTxLbylX65nCHlUyXtOXDyUxK9xIfBW4/bGhw6EmjDehQ0NoWYb5oo8YM=
X-Received: by 2002:a05:6512:340f:b0:4d5:ca32:6ed6 with SMTP id
 i15-20020a056512340f00b004d5ca326ed6mr72706lfr.4.1676841134449; Sun, 19 Feb
 2023 13:12:14 -0800 (PST)
MIME-Version: 1.0
References: <20230219112522.3391653-2-rich@richelberger.com>
 <CANNYZj_PtQ4yVdy1XspGKKAmZE4Mgfmm8D+5gf6D8mGMrc36ng@mail.gmail.com>
 <010001866a8456a4-0d51027d-5588-4b3e-af46-9e09b84cfe2f-000000@email.amazonses.com>
 <1e455822-8e68-5e30-72b8-c4c1d18acb48@richelberger.com> <CANNYZj8ejnyhpF9UBaHr6=CVZNxVNxjjQmpdxkut9oH0i33AjQ@mail.gmail.com>
 <010001866ae9a28c-9050cb24-ba3f-4a9b-b8c5-a00bc936efbf-000000@email.amazonses.com>
 <17454DD71A4E7B0B.32742@lists.openembedded.org> <2b4a87bc-d5ca-800f-852f-414070ed31ff@richelberger.com>
 <CANNYZj9+6uQjy=5+rWfYBBmzfwJQHB4YNWH3-DAEunB+mdrinw@mail.gmail.com>
 <010001866b5c73fa-530eb0cc-1137-4ccf-8ee7-aff4434b46ea-000000@email.amazonses.com>
 <eba0a002-efcb-3bde-e46d-d88c07bc9b2c@richelberger.com> <CANNYZj8kF=W8LBP7zyyYRrJiPUkxcaXqxc87PBiQCBXu1ksNTA@mail.gmail.com>
 <010001866b6d0a7c-d5d7db67-d8a0-421b-bdda-e1b7130bbaae-000000@email.amazonses.com>
 <5a8a36d3-d915-a111-d0a4-a74297596981@richelberger.com> <CANNYZj83GH1=vHN1D3PcdXDTnq45122_2BLrdgp7=o8cAjMLHA@mail.gmail.com>
 <010001866b728a08-b73e8eb7-d21f-4286-acbc-3573f7ad35e9-000000@email.amazonses.com>
In-Reply-To: <010001866b728a08-b73e8eb7-d21f-4286-acbc-3573f7ad35e9-000000@email.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 19 Feb 2023 22:12:02 +0100
Message-ID: <CANNYZj97xXtf+TBPg=0Hx3Mo5NB6h0jvsZjL6LJhG3YDA-Q4Hw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [YOCTO #13270] Refactor the docbook-xml recipe
 to use docbook.org packages rather than hacked up debian package
To: Richard Elberger <rich@richelberger.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 21:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177389

Smth. like
UPSTREAM_CHECK_REGEX =3D "docbook-xml-(?P<pver>4(\.\d+)+)\.zip"
will probably work.

Alex

On Sun, 19 Feb 2023 at 21:51, Richard Elberger <rich@richelberger.com> wrot=
e:
>
> It is working --- and I don't see how the prior one could have been
> upgraded at all because it was a debian snapshot package
>
>
> rpcme@proteus:~/elinux/oe-core/meta/recipes-devtools$ devtool
> latest-version docbook-xml-dtd4
> NOTE: Starting bitbake server...
> NOTE: Reconnecting to bitbake server...
> NOTE: Retrying server connection (#1)... (15:50:43.295558)
> Loading cache: 100% |############################################| Time:
> 0:00:00
> Loaded 1692 entries from dependency cache.
> --2023-02-19 15:50:45--  https://docbook.org/xml/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 3929 (3.8K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-8i8d6pca/wget-listing-8wiusk7e=E2=80=
=99
>
>
> 2023-02-19 15:50:45 (17.8 MB/s) -
> =E2=80=98/tmp/wget-index-8i8d6pca/wget-listing-8wiusk7e=E2=80=99 saved [3=
929/3929]
>
> --2023-02-19 15:50:45--  https://docbook.org/xml/4.1.2/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2092 (2.0K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-999ij1ye/wget-listing-_3t72jiq=E2=80=
=99
>
>
> 2023-02-19 15:50:45 (15.1 MB/s) -
> =E2=80=98/tmp/wget-index-999ij1ye/wget-listing-_3t72jiq=E2=80=99 saved [2=
092/2092]
>
> --2023-02-19 15:50:45--  https://docbook.org/xml/4.2/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2154 (2.1K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-s2n3hz3o/wget-listing-_f4795l_=E2=80=
=99
>
>
> 2023-02-19 15:50:45 (14.5 MB/s) -
> =E2=80=98/tmp/wget-index-s2n3hz3o/wget-listing-_f4795l_=E2=80=99 saved [2=
154/2154]
>
> --2023-02-19 15:50:45--  https://docbook.org/xml/4.3/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-raeil465/wget-listing-p6j4dk72=E2=80=
=99
>
>
> 2023-02-19 15:50:45 (15.2 MB/s) -
> =E2=80=98/tmp/wget-index-raeil465/wget-listing-p6j4dk72=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:46--  https://docbook.org/xml/4.3/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-3horis1c/wget-listing-fn4pbojo=E2=80=
=99
>
>
> 2023-02-19 15:50:46 (14.8 MB/s) -
> =E2=80=98/tmp/wget-index-3horis1c/wget-listing-fn4pbojo=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:46--  https://docbook.org/xml/4.3/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-dsnyvowx/wget-listing-uwt3tfa2=E2=80=
=99
>
>
> 2023-02-19 15:50:46 (10.2 MB/s) -
> =E2=80=98/tmp/wget-index-dsnyvowx/wget-listing-uwt3tfa2=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:46--  https://docbook.org/xml/4.3/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-x2f9ft64/wget-listing-vmk7cdck=E2=80=
=99
>
>
> 2023-02-19 15:50:46 (15.9 MB/s) -
> =E2=80=98/tmp/wget-index-x2f9ft64/wget-listing-vmk7cdck=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:46--  https://docbook.org/xml/4.3/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-b00vg6es/wget-listing-kgmlrhsa=E2=80=
=99
>
>
> 2023-02-19 15:50:46 (15.5 MB/s) -
> =E2=80=98/tmp/wget-index-b00vg6es/wget-listing-kgmlrhsa=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:47--  https://docbook.org/xml/4.3/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-5vc97isa/wget-listing-efpcncoh=E2=80=
=99
>
>
> 2023-02-19 15:50:47 (15.0 MB/s) -
> =E2=80=98/tmp/wget-index-5vc97isa/wget-listing-efpcncoh=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:47--  https://docbook.org/xml/4.3/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-xmml2m_y/wget-listing-bo6wqd4s=E2=80=
=99
>
>
> 2023-02-19 15:50:47 (9.54 MB/s) -
> =E2=80=98/tmp/wget-index-xmml2m_y/wget-listing-bo6wqd4s=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:47--  https://docbook.org/xml/4.3/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-am1fly7w/wget-listing-yqkw74hi=E2=80=
=99
>
>
> 2023-02-19 15:50:47 (11.1 MB/s) -
> =E2=80=98/tmp/wget-index-am1fly7w/wget-listing-yqkw74hi=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:47--  https://docbook.org/xml/4.4/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-staj0ksp/wget-listing-_u2l4jwn=E2=80=
=99
>
>
> 2023-02-19 15:50:48 (16.2 MB/s) -
> =E2=80=98/tmp/wget-index-staj0ksp/wget-listing-_u2l4jwn=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:48--  https://docbook.org/xml/4.4/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-gwqtkhi_/wget-listing-jtlali9r=E2=80=
=99
>
>
> 2023-02-19 15:50:48 (14.4 MB/s) -
> =E2=80=98/tmp/wget-index-gwqtkhi_/wget-listing-jtlali9r=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:48--  https://docbook.org/xml/4.4/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-2rclefoo/wget-listing-k4gmz4vo=E2=80=
=99
>
>
> 2023-02-19 15:50:48 (13.8 MB/s) -
> =E2=80=98/tmp/wget-index-2rclefoo/wget-listing-k4gmz4vo=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:48--  https://docbook.org/xml/4.4/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-hm3mgyno/wget-listing-kzbcd0pc=E2=80=
=99
>
>
> 2023-02-19 15:50:48 (3.01 MB/s) -
> =E2=80=98/tmp/wget-index-hm3mgyno/wget-listing-kzbcd0pc=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:48--  https://docbook.org/xml/4.4/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-df5n44fh/wget-listing-rughmkj5=E2=80=
=99
>
>
> 2023-02-19 15:50:49 (15.1 MB/s) -
> =E2=80=98/tmp/wget-index-df5n44fh/wget-listing-rughmkj5=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:49--  https://docbook.org/xml/4.4/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-73ik2ylt/wget-listing-sp6a189r=E2=80=
=99
>
>
> 2023-02-19 15:50:49 (15.2 MB/s) -
> =E2=80=98/tmp/wget-index-73ik2ylt/wget-listing-sp6a189r=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:49--  https://docbook.org/xml/4.4/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2202 (2.2K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-n8427qqd/wget-listing-rp7w_iim=E2=80=
=99
>
>
> 2023-02-19 15:50:49 (11.2 MB/s) -
> =E2=80=98/tmp/wget-index-n8427qqd/wget-listing-rp7w_iim=E2=80=99 saved [2=
202/2202]
>
> --2023-02-19 15:50:49--  https://docbook.org/xml/4.5/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2196 (2.1K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-7kg86ky5/wget-listing-pfq81o04=E2=80=
=99
>
>
> 2023-02-19 15:50:49 (15.7 MB/s) -
> =E2=80=98/tmp/wget-index-7kg86ky5/wget-listing-pfq81o04=E2=80=99 saved [2=
196/2196]
>
> --2023-02-19 15:50:49--  https://docbook.org/xml/4.5/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2196 (2.1K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-5kcb1cwx/wget-listing-y4s7rbeb=E2=80=
=99
>
>
> 2023-02-19 15:50:50 (14.7 MB/s) -
> =E2=80=98/tmp/wget-index-5kcb1cwx/wget-listing-y4s7rbeb=E2=80=99 saved [2=
196/2196]
>
> --2023-02-19 15:50:50--  https://docbook.org/xml/4.5/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2196 (2.1K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-e9uiwezl/wget-listing-gaak4fjf=E2=80=
=99
>
>
> 2023-02-19 15:50:50 (14.3 MB/s) -
> =E2=80=98/tmp/wget-index-e9uiwezl/wget-listing-gaak4fjf=E2=80=99 saved [2=
196/2196]
>
> --2023-02-19 15:50:50--  https://docbook.org/xml/4.5/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2196 (2.1K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-ijwig4kk/wget-listing-ubz8ihck=E2=80=
=99
>
>
> 2023-02-19 15:50:50 (13.9 MB/s) -
> =E2=80=98/tmp/wget-index-ijwig4kk/wget-listing-ubz8ihck=E2=80=99 saved [2=
196/2196]
>
> --2023-02-19 15:50:50--  https://docbook.org/xml/4.5/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2196 (2.1K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-23wg3ce1/wget-listing-po35ctnw=E2=80=
=99
>
>
> 2023-02-19 15:50:50 (10.7 MB/s) -
> =E2=80=98/tmp/wget-index-23wg3ce1/wget-listing-po35ctnw=E2=80=99 saved [2=
196/2196]
>
> --2023-02-19 15:50:50--  https://docbook.org/xml/5.0/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1935 (1.9K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-xbl8kski/wget-listing-lzoxc4q7=E2=80=
=99
>
>
> 2023-02-19 15:50:51 (12.9 MB/s) -
> =E2=80=98/tmp/wget-index-xbl8kski/wget-listing-lzoxc4q7=E2=80=99 saved [1=
935/1935]
>
> --2023-02-19 15:50:51--  https://docbook.org/xml/5.0.1/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1879 (1.8K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-1witmxd3/wget-listing-7rjy2_0c=E2=80=
=99
>
>
> 2023-02-19 15:50:51 (16.5 MB/s) -
> =E2=80=98/tmp/wget-index-1witmxd3/wget-listing-7rjy2_0c=E2=80=99 saved [1=
879/1879]
>
> --2023-02-19 15:50:51--  https://docbook.org/xml/5.1/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1670 (1.6K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-95v7zmwh/wget-listing-o2ffmje6=E2=80=
=99
>
>
> 2023-02-19 15:50:52 (9.94 MB/s) -
> =E2=80=98/tmp/wget-index-95v7zmwh/wget-listing-o2ffmje6=E2=80=99 saved [1=
670/1670]
>
> --2023-02-19 15:50:52--  https://docbook.org/xml/5.1/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1670 (1.6K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-j6t46pnp/wget-listing-234d878_=E2=80=
=99
>
>
> 2023-02-19 15:50:52 (11.5 MB/s) -
> =E2=80=98/tmp/wget-index-j6t46pnp/wget-listing-234d878_=E2=80=99 saved [1=
670/1670]
>
> --2023-02-19 15:50:52--  https://docbook.org/xml/5.1/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1670 (1.6K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-g3qisiyq/wget-listing-c6dbllr4=E2=80=
=99
>
>
> 2023-02-19 15:50:52 (7.47 MB/s) -
> =E2=80=98/tmp/wget-index-g3qisiyq/wget-listing-c6dbllr4=E2=80=99 saved [1=
670/1670]
>
> --2023-02-19 15:50:52--  https://docbook.org/xml/5.1/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1670 (1.6K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-x3___c7x/wget-listing-c5ect7a3=E2=80=
=99
>
>
> 2023-02-19 15:50:52 (10.2 MB/s) -
> =E2=80=98/tmp/wget-index-x3___c7x/wget-listing-c5ect7a3=E2=80=99 saved [1=
670/1670]
>
> --2023-02-19 15:50:52--  https://docbook.org/xml/5.1/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1670 (1.6K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-p4qpvb0k/wget-listing-e47qjey4=E2=80=
=99
>
>
> 2023-02-19 15:50:53 (10.6 MB/s) -
> =E2=80=98/tmp/wget-index-p4qpvb0k/wget-listing-e47qjey4=E2=80=99 saved [1=
670/1670]
>
> --2023-02-19 15:50:53--  https://docbook.org/xml/5.1/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1670 (1.6K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-7q9ewbfv/wget-listing-7uupe9yj=E2=80=
=99
>
>
> 2023-02-19 15:50:53 (12.6 MB/s) -
> =E2=80=98/tmp/wget-index-7q9ewbfv/wget-listing-7uupe9yj=E2=80=99 saved [1=
670/1670]
>
> --2023-02-19 15:50:53--  https://docbook.org/xml/5.1/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1670 (1.6K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-608vlaw2/wget-listing-94cdcy4s=E2=80=
=99
>
>
> 2023-02-19 15:50:53 (11.6 MB/s) -
> =E2=80=98/tmp/wget-index-608vlaw2/wget-listing-94cdcy4s=E2=80=99 saved [1=
670/1670]
>
> --2023-02-19 15:50:53--  https://docbook.org/xml/5.1/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1670 (1.6K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-7xlvffk3/wget-listing-t145lptl=E2=80=
=99
>
>
> 2023-02-19 15:50:53 (11.7 MB/s) -
> =E2=80=98/tmp/wget-index-7xlvffk3/wget-listing-t145lptl=E2=80=99 saved [1=
670/1670]
>
> --2023-02-19 15:50:53--  https://docbook.org/xml/5.1/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1670 (1.6K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-xoc60_3a/wget-listing-6tj2x2b2=E2=80=
=99
>
>
> 2023-02-19 15:50:53 (11.4 MB/s) -
> =E2=80=98/tmp/wget-index-xoc60_3a/wget-listing-6tj2x2b2=E2=80=99 saved [1=
670/1670]
>
> --2023-02-19 15:50:54--  https://docbook.org/xml/5.1/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1670 (1.6K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-c3ad8634/wget-listing-lif1thj_=E2=80=
=99
>
>
> 2023-02-19 15:50:54 (10.2 MB/s) -
> =E2=80=98/tmp/wget-index-c3ad8634/wget-listing-lif1thj_=E2=80=99 saved [1=
670/1670]
>
> --2023-02-19 15:50:54--  https://docbook.org/xml/5.1/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1670 (1.6K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-w95mnrrr/wget-listing-3y2adbj2=E2=80=
=99
>
>
> 2023-02-19 15:50:54 (11.5 MB/s) -
> =E2=80=98/tmp/wget-index-w95mnrrr/wget-listing-3y2adbj2=E2=80=99 saved [1=
670/1670]
>
> --2023-02-19 15:50:54--  https://docbook.org/xml/5.1/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1670 (1.6K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-q5kqy628/wget-listing-3puydl8g=E2=80=
=99
>
>
> 2023-02-19 15:50:54 (10.2 MB/s) -
> =E2=80=98/tmp/wget-index-q5kqy628/wget-listing-3puydl8g=E2=80=99 saved [1=
670/1670]
>
> --2023-02-19 15:50:54--  https://docbook.org/xml/5.1/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1670 (1.6K) [text/html]
> Saving to: =E2=80=98/tmp/wget-index-hb8by0i3/wget-listing-uag1u2jt=E2=80=
=99
>
>
> 2023-02-19 15:50:54 (11.3 MB/s) -
> =E2=80=98/tmp/wget-index-hb8by0i3/wget-listing-uag1u2jt=E2=80=99 saved [1=
670/1670]
>
> --2023-02-19 15:50:55--  https://docbook.org/xml/5.2/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2023-02-19 15:50:55 ERROR 404: Not Found.
>
> --2023-02-19 15:50:55--  https://docbook.org/xml/5.2/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2023-02-19 15:50:55 ERROR 404: Not Found.
>
> --2023-02-19 15:50:55--  https://docbook.org/xml/5.2/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2023-02-19 15:50:55 ERROR 404: Not Found.
>
> --2023-02-19 15:50:55--  https://docbook.org/xml/5.2/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2023-02-19 15:50:55 ERROR 404: Not Found.
>
> --2023-02-19 15:50:56--  https://docbook.org/xml/5.2/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2023-02-19 15:50:56 ERROR 404: Not Found.
>
> --2023-02-19 15:50:56--  https://docbook.org/xml/5.2/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2023-02-19 15:50:56 ERROR 404: Not Found.
>
> --2023-02-19 15:50:56--  https://docbook.org/xml/5.2/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2023-02-19 15:50:56 ERROR 404: Not Found.
>
> --2023-02-19 15:50:56--  https://docbook.org/xml/5.2/
> Resolving docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116
> Connecting to docbook.org (docbook.org)|18.213.222.111|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2023-02-19 15:50:56 ERROR 404: Not Found.
>
> INFO: Current version: 4.5
> INFO: Latest version: 412
> rpcme@proteus:~/elinux/oe-core/meta/recipes-devtools$ echo $?
> 0
>
>
> On 2/19/23 15:47, Alexander Kanavin wrote:
> > The version check is working fine with the existing recipe, and it
> > will stop working with your patch. So you need to get it fixed.
> >
> > Alex
> >
> > On Sun, 19 Feb 2023 at 21:45, Richard Elberger <rich@richelberger.com> =
wrote:
> >> I think doing this is out of scope of the bugfix. The latest-version
> >> check was not a constraint in the prior version.
> >>
> >> I suggest that we get the bug fixed and file another workitem for this
> >> particular ask.
> >>
> >> On 2/19/23 15:39, Alexander Kanavin wrote:
> >>> 412 can be specifically excluded as a 'bogus' version, examples exist
> >>> in oe-core.
> >>>
> >>> Version checks are used for manual upgrades too, as maintainers want
> >>> to be notified there's a new version, even if autoupgrade can't handl=
e
> >>> it. We just need to know if there's a 4.x release newer than 4.5, and
> >>> that can be covered by the check.
> >>>
> >>> Alex
> >>>
> >>> On Sun, 19 Feb 2023 at 21:27, Richard Elberger <rich@richelberger.com=
> wrote:
> >>>> I have been working on it, but after a while I realized that this
> >>>> version upgrade will not work anyway - even for 4.x
> >>>>
> >>>> The reason is they have a folder named "412" which is actually 4.1.2
> >>>> which I we probably still need to have in.
> >>>>
> >>>> Even though the tool cannot find 5.2 it still exits zero ... but sti=
ll,
> >>>> it thinks that 412 > 5.2
> >>>>
> >>>> I see one of two things a/ do not autoupgrade and somehow mark for
> >>>> manual cyclical update b/ somehow apply a map capability
> >>>>
> >>>> Also given that multiple versions must be delivered in the same vers=
ion
> >>>> I don't think that this falls under typical autoupgrade scenario.
> >>>>
> >>>> What are your thoughts?
> >>>>
> >>>> On 2/19/23 13:54, Alexander Kanavin wrote:
> >>>>> If the check goes over https://docbook.org/xml/ I guess you can set
> >>>>> the regex to 4.x versions only, as the recipe name itself pins it t=
o
> >>>>> 4.x. I'm not sure we're even going to need 5.x, ever.
> >>>>> You can grep for UPSTREAM_CHECK_REGEX in core for examples.
> >>>>>
> >>>>> Alex
> >>>>>
> >>>>> On Sun, 19 Feb 2023 at 19:40, Alexander Kanavin via
> >>>>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded=
.org>
> >>>>> wrote:
> >>>>>> It helps if you provide devtool's output. I think it's possible to
> >>>>>> exclude rc versions from the check with UPSTREAM_CHECK_REGEX.
> >>>>>>
> >>>>>> Alex
> >>>>>>
> >>>>>> On Sun, 19 Feb 2023 at 19:22, Richard Elberger <rich@richelberger.=
com> wrote:
> >>>>>>> I tried `devtool latest-version` and it failed on one version - 5=
.2 -
> >>>>>>> because it's still in RC.
> >>>>>>>
> >>>>>>> Note that there are massive breaking changes between Docbook 4x a=
nd 5x.
> >>>>>>> Given the defect I'm fixing is to change the upstream source - an=
d not
> >>>>>>> refactor the entire recipe - I believe the scope should keep to t=
hat and
> >>>>>>> another defect filed for future versions. Please confirm this is
> >>>>>>> reasonable.
> >>>>>>>
> >>>>>>> I did the other beatification changes per style guide and will re=
submit
> >>>>>>> once I get confirmation.
> >>>>>>>
> >>>>>>> On 2/19/23 12:31, Alexander Kanavin wrote:
> >>>>>>>> On Sun, 19 Feb 2023 at 17:31, Richard Elberger <rich@richelberge=
r.com> wrote:
> >>>>>>>>
> >>>>>>>>> For multiple assignment: the reason is maintainability. The sup=
ported
> >>>>>>>>> versions will change over time.
> >>>>>>>> You can still place them in a newline-separated single assignmen=
t,
> >>>>>>>> which is a lot more readable as the list of fetched items is the=
n in a
> >>>>>>>> single location in the recipe.
> >>>>>>>> This is how all recipes in oe-core are structured.
> >>>>>>>>
> >>>>>>>>> Please confirm if there are any other appreciations I must cove=
r - I was
> >>>>>>>>> unaware of this one and would like to batch them. If the apprec=
iations
> >>>>>>>>> are listed on a wiki please school me about that.
> >>>>>>>> For now I do not have any others. I'd like to see a v2 first, as=
 v1
> >>>>>>>> makes it hard to understand how the final recipe looks like with=
 the
> >>>>>>>> multiple SRC_URI approach. We used to have a bot that points out
> >>>>>>>> common issues but it's unmaintained and falled into disrepair.
> >>>>>>>>
> >>>>>>>> There are numerous pages on the wiki collecting style and messag=
e tips:
> >>>>>>>> https://www.openembedded.org/wiki/Styleguide
> >>>>>>>> https://www.openembedded.org/wiki/Commit_Patch_Message_Guideline=
s
> >>>>>>>> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenE=
mbedded
> >>>>>>>>
> >>>>>>>> Alex
> >>>>>>>>
> >>>>>>>>> On 2/19/23 10:52, Alexander Kanavin wrote:
> >>>>>>>>>> Can you please set SRC_URI with a single assignment; there is =
no
> >>>>>>>>>> reason to +=3D it multiple times.
> >>>>>>>>>>
> >>>>>>>>>> Verifying that 'devtool latest-version works' would be also ap=
preciated.
> >>>>>>>>>>
> >>>>>>>>>> Alex
> >>>>>>>>>>
> >>>>>>>>>> On Sun, 19 Feb 2023 at 12:25, Richard Elberger <rich@richelber=
ger.com> wrote:
> >>>>>>>>>>> ---
> >>>>>>>>>>>       .../docbook-xml/docbook-xml-dtd4_4.5.bb       | 74 ++++=
++++++++-------
> >>>>>>>>>>>       1 file changed, 49 insertions(+), 25 deletions(-)
> >>>>>>>>>>>
> >>>>>>>>>>> diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dt=
d4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> >>>>>>>>>>> index 2bec1442af..71aa8c14ec 100644
> >>>>>>>>>>> --- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.=
bb
> >>>>>>>>>>> +++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.=
bb
> >>>>>>>>>>> @@ -1,30 +1,54 @@
> >>>>>>>>>>>       SUMMARY =3D "Document type definitions for verification=
 of XML data files"
> >>>>>>>>>>>       DESCRIPTION =3D "Document type definitions for verifica=
tion of XML data \
> >>>>>>>>>>> -files against the DocBook rule set, it ships with the latest=
 DocBook 4.5 \
> >>>>>>>>>>> -XML DTD, as well as a selected set of legacy DTDs for use wi=
th older \
> >>>>>>>>>>> -documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"
> >>>>>>>>>>> -HOMEPAGE =3D "http://www.docbook.org/xml/"
> >>>>>>>>>>> +files against the DocBook rule set."
> >>>>>>>>>>> +HOMEPAGE =3D "https://docbook.org"
> >>>>>>>>>>>
> >>>>>>>>>>> -LICENSE =3D "OASIS"
> >>>>>>>>>>> -LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE-OASIS;md5=3D=
c608985dd5f7f215e669e7639a0b1d2e"
> >>>>>>>>>>> +inherit allarch
> >>>>>>>>>>> +BBCLASSEXTEND =3D "native"
> >>>>>>>>>>>
> >>>>>>>>>>> -# Note: the upstream sources are not distributed with a lice=
nse file.
> >>>>>>>>>>> -# LICENSE-OASIS is included as a "patch" to workaround this.=
 When
> >>>>>>>>>>> -# upgrading this recipe, please verify whether this is still=
 needed.
> >>>>>>>>>>> -SRC_URI =3D "http://snapshot.debian.org/archive/debian/20160=
728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \
> >>>>>>>>>>> -           file://LICENSE-OASIS \
> >>>>>>>>>>> -           file://docbook-xml-update-catalog.xml.patch \
> >>>>>>>>>>> -"
> >>>>>>>>>>> +# To support apps with xml schema backward compatibility, we=
 must
> >>>>>>>>>>> +# install a set of schemas. Install the latest based on PV a=
nd then
> >>>>>>>>>>> +# name any specific versions as required. TODO: Figure out a=
 mechanism
> >>>>>>>>>>> +# to filter exactly which versions are necessary, if that's =
even
> >>>>>>>>>>> +# possible.
> >>>>>>>>>>> +#
> >>>>>>>>>>> +# DocBook.org lists available packages at https://docbook.or=
g/xml/
> >>>>>>>>>>> +#
> >>>>>>>>>>> +# These packages are available as source but it requires the=
 ability
> >>>>>>>>>>> +# to use the Gradle build system to do so. It might be safer=
 to use
> >>>>>>>>>>> +# the source tree which would also enable proper SBOM genera=
tion
> >>>>>>>>>>> +# through the bitbake build system. https://github.com/docbo=
ok/docbook
> >>>>>>>>>>> +#
> >>>>>>>>>>>
> >>>>>>>>>>> -SRC_URI[md5sum] =3D "487b4d44e15cffb1f4048af23f98208e"
> >>>>>>>>>>> -SRC_URI[sha256sum] =3D "b0f8edcf697f5318e63dd98c9a931f3fee16=
7af0805ba441db372e0f17b2a44f"
> >>>>>>>>>>> +S =3D "${WORKDIR}"
> >>>>>>>>>>>
> >>>>>>>>>>> -UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/d/docbook-xml/=
"
> >>>>>>>>>>> +SRC_URI +=3D "https://docbook.org/xml/4.1.2/docbkx412.zip;na=
me=3Dpayload412;subdir=3Ddocbook-xml-4.1.2"
> >>>>>>>>>>> +SRC_URI[payload412.md5sum] =3D "900d7609fb7e6d78901b357e4acf=
bc17"
> >>>>>>>>>>> +SRC_URI[payload412.sha256sum] =3D "30f0644064e0ea71751438251=
940b1431f46acada814a062870f486c772e7772"
> >>>>>>>>>>>
> >>>>>>>>>>> -S =3D "${WORKDIR}/docbook-xml-4.5.c31424"
> >>>>>>>>>>> +SRC_URI +=3D "https://docbook.org/xml/4.2/docbook-xml-4.2.zi=
p;name=3Dpayload42;subdir=3Ddocbook-xml-4.2"
> >>>>>>>>>>> +SRC_URI[payload42.md5sum] =3D "73fe50dfe74ca631c1602f558ed89=
61f"
> >>>>>>>>>>> +SRC_URI[payload42.sha256sum] =3D "acc4601e4f97a196076b7e64b3=
68d9248b07c7abf26b34a02cca40eeebe60fa2"
> >>>>>>>>>>>
> >>>>>>>>>>> -inherit allarch
> >>>>>>>>>>> -BBCLASSEXTEND =3D "native"
> >>>>>>>>>>> +SRC_URI +=3D "https://docbook.org/xml/4.3/docbook-xml-4.3.zi=
p;name=3Dpayload43;subdir=3Ddocbook-xml-4.3"
> >>>>>>>>>>> +SRC_URI[payload43.md5sum] =3D "ab200202b9e136a144db1e0864c45=
074"
> >>>>>>>>>>> +SRC_URI[payload43.sha256sum] =3D "23068a94ea6fd484b004c5a73e=
c36a66aa47ea8f0d6b62cc1695931f5c143464"
> >>>>>>>>>>> +
> >>>>>>>>>>> +SRC_URI +=3D "https://docbook.org/xml/4.4/docbook-xml-4.4.zi=
p;name=3Dpayload44;subdir=3Ddocbook-xml-4.4"
> >>>>>>>>>>> +SRC_URI[payload44.md5sum] =3D "cbb04e9a700955d88c50962ef22c1=
634"
> >>>>>>>>>>> +SRC_URI[payload44.sha256sum] =3D "02f159eb88c4254d95e831c51c=
144b1863b216d909b5ff45743a1ce6f5273090"
> >>>>>>>>>>> +
> >>>>>>>>>>> +SRC_URI +=3D "https://docbook.org/xml/${PV}/docbook-xml-${PV=
}.zip;name=3DpayloadPV;subdir=3Ddocbook-xml-${PV}"
> >>>>>>>>>>> +SRC_URI[payloadPV.md5sum] =3D "03083e288e87a7e829e437358da7e=
f9e"
> >>>>>>>>>>> +SRC_URI[payloadPV.sha256sum] =3D "4e4e037a2b83c98c6c94818390=
d4bdd3f6e10f6ec62dd79188594e26190dc7b4"
> >>>>>>>>>>> +
> >>>>>>>>>>> +# The upstream sources are not distributed with a license fi=
le.
> >>>>>>>>>>> +# LICENSE-OASIS is included as a "patch" to workaround this.=
 When
> >>>>>>>>>>> +# upgrading this recipe, please verify whether this is still=
 needed.
> >>>>>>>>>>> +
> >>>>>>>>>>> +LICENSE =3D "OASIS"
> >>>>>>>>>>> +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE-OASIS;md5=3D=
c608985dd5f7f215e669e7639a0b1d2e"
> >>>>>>>>>>> +SRC_URI +=3D "file://LICENSE-OASIS"
> >>>>>>>>>>>
> >>>>>>>>>>>       do_configure (){
> >>>>>>>>>>>           :
> >>>>>>>>>>> @@ -34,19 +58,19 @@ do_compile (){
> >>>>>>>>>>>           :
> >>>>>>>>>>>       }
> >>>>>>>>>>>
> >>>>>>>>>>> +inherit xmlcatalog
> >>>>>>>>>>> +
> >>>>>>>>>>>       do_install () {
> >>>>>>>>>>>           install -d ${D}${sysconfdir}/xml/
> >>>>>>>>>>>           xmlcatalog --create --noout ${D}${sysconfdir}/xml/d=
ocbook-xml.xml
> >>>>>>>>>>>
> >>>>>>>>>>> -    for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do
> >>>>>>>>>>> +    for DTDVERSION in 4.1.2 4.2 4.3 4.4 4.5; do
> >>>>>>>>>>>               DEST=3D${datadir}/xml/docbook/schema/dtd/$DTDVE=
RSION
> >>>>>>>>>>>               install -d -m 755 ${D}$DEST
> >>>>>>>>>>> -        cp -v -R docbook-$DTDVERSION/* ${D}$DEST
> >>>>>>>>>>> -        xmlcatalog --verbose --noout --add nextCatalog unuse=
d file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml
> >>>>>>>>>>> +        cp -v -R docbook-xml-$DTDVERSION/* ${D}$DEST
> >>>>>>>>>>> +        xmlcatalog --verbose --noout --add nextCatalog unuse=
d \
> >>>>>>>>>>> +          file://$DEST/catalog.xml ${D}${sysconfdir}/xml/doc=
book-xml.xml
> >>>>>>>>>>>           done
> >>>>>>>>>>>       }
> >>>>>>>>>>>
> >>>>>>>>>>> -XMLCATALOGS =3D "${sysconfdir}/xml/docbook-xml.xml"
> >>>>>>>>>>> -inherit xmlcatalog
> >>>>>>>>>>> -
> >>>>>>>>>>>       FILES:${PN} =3D "${datadir}/* ${sysconfdir}/xml/docbook=
-xml.xml"
> >>>>>>>>>>> --
> >>>>>>>>>>> 2.34.1
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>>> Links: You receive all messages sent to this group.
> >>>>>> View/Reply Online (#177342): https://lists.openembedded.org/g/open=
embedded-core/message/177342
> >>>>>> Mute This Topic: https://lists.openembedded.org/mt/97064586/168648=
9
> >>>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/un=
sub [alex.kanavin@gmail.com]
> >>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>>>
>

