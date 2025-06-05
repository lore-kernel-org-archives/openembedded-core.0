Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD73C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 16:15:42 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.11945.1749140142410636080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 09:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MR9Yqye5;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.177, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e817b40d6e7so1176831276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 09:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749140141; x=1749744941; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeR9jWANL4S+gn/4+YqZTSU/UmW4oXsIYSHkocLZ2Y4=;
        b=MR9Yqye50DclGTFj+um/JsaX1Pdf6hBX0wUayaT45+lA4UQ4bJuxgUu99PO8tgF3r8
         azCs/3Uo5v4NwTXGdAVr9y5wRwuZepIaPq36mB49P/XHC+vbWaoHGId3hsv3SIVLCu14
         e29i1PQr7nlc+Qxl1cjaBZILqMsjUrwSQ1t6gDUmTVvW99FGjfWKkBNQW3KsYF2j+0DB
         zyGzoe58m4aEaILTh4rw82MP6l/c1OcvqwYwU3B+RMgQWP8jZiZjbfQ1RrwBu+vAuXS1
         AU8PZ6gUuUyV5jIHr3hm3oWSt2BNMbDLHuplHzB/emuikYxEIQce8sVcyWk5fQbKoTHJ
         7Rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749140141; x=1749744941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeR9jWANL4S+gn/4+YqZTSU/UmW4oXsIYSHkocLZ2Y4=;
        b=tfVLLXirJnYkN5jRNSbn9vGaUf8RjFKRUVuulbGFKQA1ZFRJR9ej5XD5B/QJ+QDk0E
         +JZ6wQmUgDU+IxHc7AFv74tyByX7lR5C0b1itp6FEOuBZFE9CZZW+ZW5wT2A7JQAy4/F
         9DFVhkO5anR/eZ2PV9gZ7/xlAYXZ8EFY+pkJw87+E9ERdiK3sH6HAjaK9NK3aRQvWFpo
         2Z+DJaZbpuI3bFu/iataRN/sV5A/qygQqbFGbkBfQERu+f3YVxoAcD9Gqp5JWWh8v7Jk
         78bx3kn6HKomvjJLikeqk9QzxZLVqXUuGAw8I+LegsxaEHtXHT3fA765jjPiaW13v7yl
         UR2A==
X-Gm-Message-State: AOJu0Yy0zyiHmh/UHVaGEYlePhFQjSow5QSRX0eVtuY41UUxeyfThU6f
	6kyL1KOoySA9XbgX16gNASrq5LLL7OurDhPeM/diSQ4U9DrWMDLlPNe8F8mDwZfUuJKflCOA19n
	TQ60MEYDOOq5xrLbx6TIHNCqik8QEc5NmMLqh5QOwmmbEfeE1qyNFRyk=
X-Gm-Gg: ASbGncvkQVKh5iEVB58pYN8Oj6GAy02vMQZTU0fglTH6m1Ctn3aWxbC7WFWQMmRz4Qg
	L8/BB+4U4n3LfVU5RkbmDn0weC5rr+YY4Qbvs5odF9dVpxhAvFHBNDS/8I3PntfIg19NxKvi4Y4
	gzWpfYIjn2NAadVeubhTNr8CVnpjLONvW9ycaki19jE7PJlE0zFT/kjJWH94XpYrS8zXmLjz09A
	A==
X-Google-Smtp-Source: AGHT+IF8ZS/K/YAKw4dfBaLcWEX6TPc/lnLDxRY7aD98qT+Wsw8d307RMaQr8fp/kpZo2QHrl9MgRHgikkbsSC9Gn0E=
X-Received: by 2002:a05:6902:2d07:b0:e81:a00d:e57b with SMTP id
 3f1490d57ef6-e81a21d121dmr505659276.41.1749140141347; Thu, 05 Jun 2025
 09:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250604113426.464818-1-changqing.li@windriver.com>
In-Reply-To: <20250604113426.464818-1-changqing.li@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 5 Jun 2025 09:15:30 -0700
X-Gm-Features: AX0GCFs14nfWAOX6vXyQG3T85U8xX72ZiQA7OFwKXVS33F6i3MsiKfJm3YAY90M
Message-ID: <CAOSpxdaHeb0Etg6w4A8ZuYJo9u4TNA-rVSSpk45g7x1+EVb41w@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH V2 00/14] fix several CVE for libsoup/libsoup-2.4
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 16:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218072

This series doesn't apply in full, it seems to fall apart at
"libsoup-2.4: fix CVE-2025-4969":

Applying: libsoup-2.4: fix CVE-2025-32052
Using index info to reconstruct a base tree...
M meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
.git/rebase-apply/patch:34: space before tab in indent.
  guint index_pattern =3D 0;
.git/rebase-apply/patch:35: space before tab in indent.
  gboolean skip_row =3D FALSE;
.git/rebase-apply/patch:36: trailing whitespace.

.git/rebase-apply/patch:39: space before tab in indent.
         (index_pattern <=3D type_row->pattern_length)) {
.git/rebase-apply/patch:40: space before tab in indent.
  /* Skip insignificant white space ("WS" in the spec) */
warning: squelched 3 whitespace errors
warning: 8 lines add whitespace errors.
Falling back to patching base and 3-way merge...
Auto-merging meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
Applying: libsoup: fix CVE-2025-32052
Applying: libsoup: fix CVE-2025-32051
Applying: libsoup-2.4: fix CVE-2025-32050
Applying: libsoup: fix CVE-2025-32050
Applying: libsoup-2.4: fix CVE-2025-46421
Applying: libsoup: fix CVE-2025-46421
Applying: libsoup-2.4: fix CVE-2025-4948
Applying: libsoup: fix CVE-2025-4948
Applying: libsoup-2.4: fix CVE-2025-4969
error: sha1 information is lacking or useless
(meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb).
error: could not build fake ancestor
Patch failed at 0010 libsoup-2.4: fix CVE-2025-4969

Perhaps send a V3 that will apply cleanly to the stable/scarthgap-nut
branch in poky-contrib

Thanks!

Steve

On Wed, Jun 4, 2025 at 4:34=E2=80=AFAM Changqing Li via lists.openembedded.=
org
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Changqing Li (14):
>   libsoup-2.4: fix CVE-2025-32052
>   libsoup: fix CVE-2025-32052
>   libsoup: fix CVE-2025-32051
>   libsoup-2.4: fix CVE-2025-32050
>   libsoup: fix CVE-2025-32050
>   libsoup-2.4: fix CVE-2025-46421
>   libsoup: fix CVE-2025-46421
>   libsoup-2.4: fix CVE-2025-4948
>   libsoup: fix CVE-2025-4948
>   libsoup-2.4: fix CVE-2025-4969
>   libsoup: fix CVE-2025-4969
>   libsoup-2.4: fix CVE-2025-4476
>   libsoup-2.4: fix CVE-2025-2784
>   libsoup: fix CVE-2025-2784
>
>  .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++++
>  .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ++++
>  .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ++++
>  .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 +++++
>  .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  48 ++++++
>  .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 +++++
>  .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  37 +++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |   7 +
>  .../libsoup/libsoup-3.4.4/CVE-2025-2784.patch | 137 +++++++++++++++++
>  .../libsoup-3.4.4/CVE-2025-32050.patch        |  29 ++++
>  .../libsoup-3.4.4/CVE-2025-32051-1.patch      |  29 ++++
>  .../libsoup-3.4.4/CVE-2025-32051-2.patch      |  57 +++++++
>  .../libsoup-3.4.4/CVE-2025-32052.patch        |  31 ++++
>  .../libsoup-3.4.4/CVE-2025-46421.patch        | 139 ++++++++++++++++++
>  .../libsoup/libsoup-3.4.4/CVE-2025-4948.patch |  97 ++++++++++++
>  .../libsoup/libsoup-3.4.4/CVE-2025-4969.patch |  78 ++++++++++
>  meta/recipes-support/libsoup/libsoup_3.4.4.bb |   8 +
>  17 files changed, 890 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-278=
4.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
50.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
52.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-447=
6.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-464=
21.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-494=
8.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-496=
9.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2=
784.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2050.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2051-1.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2051-2.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2052.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4=
6421.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4=
948.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4=
969.patch
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217926): https://lists.openembedded.org/g/openembedde=
d-core/message/217926
> Mute This Topic: https://lists.openembedded.org/mt/113464301/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

