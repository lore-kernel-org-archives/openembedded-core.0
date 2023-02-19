Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A84AC05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 21:01:01 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.5739.1676840451235479473
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 13:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lmK/ujVb;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id bp6so1771977lfb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 13:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vflJ08w98g865O173yVXK90JWe+e10iKVZpnaKlM6o=;
        b=lmK/ujVbhh3GV8YXUD9Xcv5GvHE4IYmsMQ2EbQDZ8CzVPgR6lVdlsdUq1QeLASeMa/
         YIgt+/iRdYNMBKP/kmaYqI4ejadT/e8V2udjgCKZoTvI+5Y8ljU9Qwx8L6lKPEBr1OG2
         fWywmGnpmQotFCZZIxyrLSGn/L02JIQR3Lbcq8r6Ko77qK2tW+2MemLpp4JKyoKyUecp
         eNEv3UG6K0jt12I5OFyLgPpKR3r9w73jaJakFQzbonhaBUFajo73ol7HezizdTTXUNbX
         B2/i2h8Zlc4hr+KtQ/o1b3TlRvYTWK3Yx7tu4CtuUT99w9hjckLNMQrrysNYS/T6eG0z
         mPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vflJ08w98g865O173yVXK90JWe+e10iKVZpnaKlM6o=;
        b=wRs7vUtdwtLXb99ERnAL80A1dlFindgV/Vhfk6RruP/gSbnKsL7yGwOt8ZALnP130c
         9qeLP3Ll9cScDi0GISFnqlf6VE2x4AKqZfXSgQECwHn0Efa65yH7tjGZN86vPPKjgz1O
         kI3V1JSDZVnCMCN5m/Xf79r1ZTtcbYHljs8xwokjUIacpvVKY/uOxNXjs7vthgcTcnGt
         Ph9gx3RbLnpEpM3T+uPO0Oa6n4fIBG9HGHq5FXe6Hb3pl5CG8eQRuRiuDx+6CZkU95BT
         HxZjysKTK17xZI3eCuGhTzZQqCvslMpuo+Xl4eqNaoWHPzc6Cu4fMQX0oCR7jGIPa0Yv
         4FDg==
X-Gm-Message-State: AO0yUKUcbt9fnGw6+cZPJNUNMMnxCkLI9waOiF8VQPNvJke4C8eIYXIC
	Q7W5zg5Bv9JJ+9Ui67YTPamY4m23NBA1WjmFZPE=
X-Google-Smtp-Source: AK7set8fjVargJQ1/QTyxHhqsqZTkuz2n47/ndHfTa1PRu1YCU5C6Qy0KluzACRvWz+9NxJAi7pA0ye2a8B4jM0ha7o=
X-Received: by 2002:ac2:53ba:0:b0:4db:5133:59a6 with SMTP id
 j26-20020ac253ba000000b004db513359a6mr7616lfh.13.1676840449038; Sun, 19 Feb
 2023 13:00:49 -0800 (PST)
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
Date: Sun, 19 Feb 2023 22:00:37 +0100
Message-ID: <CANNYZj-8MfyxRpcuuXVYPAT4+yzYBN-b2YWvY0_-dK3Tb+_6AQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [YOCTO #13270] Refactor the docbook-xml recipe
 to use docbook.org packages rather than hacked up debian package
To: Richard Elberger <rich@richelberger.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 21:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177388

On Sun, 19 Feb 2023 at 21:51, Richard Elberger <rich@richelberger.com> wrot=
e:
>
> It is working --- and I don't see how the prior one could have been
> upgraded at all because it was a debian snapshot package
...
> INFO: Current version: 4.5
> INFO: Latest version: 412

It's not working. 412 is a bogus version and needs to be excluded in
the version check regex. It would take you less time to fix the issue
than to argue that it's ok to break the check.

Existing recipe on the other hand does report the latest version
correctly, as it takes the tarball from a debian snapshot, but
performs the check against the latest debian source:
(note that it goes to
http://ftp.debian.org/debian/pool/main/d/docbook-xml/ as set by
UPSTREAM_CHECK_URI and not to the snapshot directory)

alex@Zen2:/srv/work/alex/poky/build-64-alt$ devtool latest-version
docbook-xml-dtd4
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (21:56:33.306884)
Loading cache: 100%
|##########################################################################=
###########################################################################=
##########################|
Time: 0:00:00
Loaded 1693 entries from dependency cache.
--2023-02-19 21:56:35--  http://ftp.debian.org/debian/pool/main/d/docbook-x=
ml/
Resolving ftp.debian.org (ftp.debian.org)... 146.75.118.132, 2a04:4e42:8d::=
644
Connecting to ftp.debian.org (ftp.debian.org)|146.75.118.132|:80... connect=
ed.
HTTP request sent, awaiting response... 200 OK
Length: 3564 (3.5K) [text/html]
Saving to: =E2=80=98/tmp/wget-index-9yjbq8kv/wget-listing-h7mcuzb7=E2=80=99


2023-02-19 21:56:35 (17.3 MB/s) -
=E2=80=98/tmp/wget-index-9yjbq8kv/wget-listing-h7mcuzb7=E2=80=99 saved [356=
4/3564]

INFO: Current version: 4.5
INFO: Latest version: 4.5


As I said, version checks aren't just for automated updates; if
auto-upgrader can't do it, at least it will send a notice that a new
version is available for a manual update.

Alex

