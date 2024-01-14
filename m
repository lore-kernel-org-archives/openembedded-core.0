Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4E8C4706C
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 02:11:25 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.32753.1705198280014894667
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jan 2024 18:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0d2fzhg+;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.49, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e9e5c97e1so9578994e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jan 2024 18:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705198278; x=1705803078; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZhiOIxHeFFffqvBd9QfPkK7e488QOeMjNyb5AD88R0=;
        b=0d2fzhg+oW8MNqznc1gDjq8qioq8cbbsAzeOhmYtnQG8jaFyqZ9YshGMbobIkePq/l
         cGdkMYEIPQElFBhQtTNEJlUzhAzxoH6+G/wMDwQKIHkG/5PD0qw2yLWiHrN9yVcC3zAL
         9DmHkaFLNrE94LFVg5iq8GGh6ALB0hmhOK/OcGXBOfeGGELVwg0Ca7SUKvt4NuEUE/nD
         +eeUJliTuwWvWsm5v+JmgeVXZzIphja67mXopxrMSSg3ipZpbTGYh+NdECYwUo9qbim9
         WBpZhW7+H84ucSq8lz8QWfRmrkugtv4jF/qfTKeBoiS37NHjUk34B4vYF6Xyzb1CY0oR
         0mZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705198278; x=1705803078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZhiOIxHeFFffqvBd9QfPkK7e488QOeMjNyb5AD88R0=;
        b=EeFu26foipK30ksaj/jTfbsCAZpWT7wDjagpGypVtVmArl0rm37UvwQ9KeCxoIk9UU
         40BK3M3qNN1LfwFyzh/SCbwIkTfpXzgYdpR6nUV2URBGvgR5p2m6ZLAPzpq8a0ZIcrdZ
         KmWMN5wrCBKOmmfcHthARsa9sv47ytqjWZU3X5vsO2nn1Eo0hxeJsEhU0AsxOgDb3A1V
         KQibKwnY/v3EXyW/0XWN+uAGZaqOVWHkkDscd2p3IHesnYyg+gYZ7wCWvQFxN/0++SO6
         rTzPhiOLlRWGQrMZpVNfRgikushrIjMqs2ZCNKV1OtP5iyuMZfqmQHoCPeXjldeCc2AT
         uO9A==
X-Gm-Message-State: AOJu0Yz/w7jpu5ZtwNYZsH4E+KS4XugxftgyaqQChvJszF9/UiuwF4mI
	zFOzvr9IUlf3OY+/xkWhcbfYAR8wg7bktA0VoESnaTO/EFZpczsjf/r4zzPe4do=
X-Google-Smtp-Source: AGHT+IHq1CL/eCO8e5VgGPlHBEkxTpGEt2BRrGMrfxw932dMF4E6sparkQ+jrH0T9+VpzM5acpAkRyxnNX7X4BMM9X4=
X-Received: by 2002:ac2:42d5:0:b0:50e:5c71:51f1 with SMTP id
 n21-20020ac242d5000000b0050e5c7151f1mr1335766lfl.62.1705198276987; Sat, 13
 Jan 2024 18:11:16 -0800 (PST)
MIME-Version: 1.0
References: <20240112041206.4901-1-hprajapati@mvista.com>
In-Reply-To: <20240112041206.4901-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 13 Jan 2024 16:11:04 -1000
Message-ID: <CAOSpxdZqKUJDURHM7i3Fmzr+tTsXhgBrGDpJ5qjv6wu13QP7Gw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] systemd: fix CVE-2023-7008
To: hprajapati@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 02:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193610

On Thu, Jan 11, 2024 at 6:12=E2=80=AFPM Hitendra Prajapati via
lists.openembedded.org <hprajapati=3Dmvista.com@lists.openembedded.org>
wrote:
>
> Upstream-Status: Backport from https://github.com/systemd/systemd/commit/=
3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../systemd/systemd/CVE-2023-7008.patch       | 40 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_250.5.bb    |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-7008.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/CVE-2023-7008.patch b/meta=
/recipes-core/systemd/systemd/CVE-2023-7008.patch
> new file mode 100644
> index 0000000000..e2296abc49
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/CVE-2023-7008.patch
> @@ -0,0 +1,40 @@
> +From 3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1 Mon Sep 17 00:00:00 2001
> +From: Michal Sekletar <msekleta@redhat.com>
> +Date: Wed, 20 Dec 2023 16:44:14 +0100
> +Subject: [PATCH] resolved: actually check authenticated flag of SOA
> + transaction
> +
> +Fixes #25676
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/3b4=
cc1437b51fcc0b08da8cc3f5d1175eed25eb1]
> +CVE: CVE-2023-7008
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/resolve/resolved-dns-transaction.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/resolve/resolved-dns-transaction.c b/src/resolve/resolv=
ed-dns-transaction.c
> +index f937f9f7b5..7deb598400 100644
> +--- a/src/resolve/resolved-dns-transaction.c
> ++++ b/src/resolve/resolved-dns-transaction.c
> +@@ -2761,7 +2761,7 @@ static int dns_transaction_requires_rrsig(DnsTrans=
action *t, DnsResourceRecord *
> +                         if (r =3D=3D 0)
> +                                 continue;
> +
> +-                        return FLAGS_SET(t->answer_query_flags, SD_RESO=
LVED_AUTHENTICATED);
> ++                        return FLAGS_SET(dt->answer_query_flags, SD_RES=
OLVED_AUTHENTICATED);
> +                 }
> +
> +                 return true;
> +@@ -2788,7 +2788,7 @@ static int dns_transaction_requires_rrsig(DnsTrans=
action *t, DnsResourceRecord *
> +                         /* We found the transaction that was supposed t=
o find the SOA RR for us. It was
> +                          * successful, but found no RR for us. This mea=
ns we are not at a zone cut. In this
> +                          * case, we require authentication if the SOA l=
ookup was authenticated too. */
> +-                        return FLAGS_SET(t->answer_query_flags, SD_RESO=
LVED_AUTHENTICATED);
> ++                        return FLAGS_SET(dt->answer_query_flags, SD_RES=
OLVED_AUTHENTICATED);
> +                 }
> +
> +                 return true;
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-co=
re/systemd/systemd_250.5.bb
> index c35557471a..889473ee1f 100644
> --- a/meta/recipes-core/systemd/systemd_250.5.bb
> +++ b/meta/recipes-core/systemd/systemd_250.5.bb

Did you mean this patch for kirkstone instead of dunfell?  Dunfell
systemd is version 244.5, not 250.5

Steve

> @@ -32,6 +32,7 @@ SRC_URI +=3D "file://touchscreen.rules \
>             file://CVE-2022-4415-2.patch \
>             file://0001-network-remove-only-managed-configs-on-reconfigur=
e-o.patch \
>             file://0001-nspawn-make-sure-host-root-can-write-to-the-uidma=
ppe.patch \
> +           file://CVE-2023-7008.patch \
>             "
>
>  # patches needed by musl
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193569): https://lists.openembedded.org/g/openembedde=
d-core/message/193569
> Mute This Topic: https://lists.openembedded.org/mt/103677352/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

