Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E6EEE498B
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 10:16:03 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.18587.1726049753821883408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 03:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eqs4jcWu;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f75d044201so7184451fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 03:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726049752; x=1726654552; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ne9bHsDdwSa8wjyT6Ebk8ZYkvTKVIZhNkqlj80J6xdM=;
        b=Eqs4jcWu5RMo08pSUZSLbkWx3Kqv9TA7zGHRqlnaPCppXBLfZ2JC4p6dP0OfmN0Ji0
         0bHZR9oHD+cDh9KivY1uVTdiWtv2kLubNOBoCqEHYscfr0s8+ZAzsMjF48dEh0wGqmTr
         t6ntAwJ+h8EwHkX4aSU0vyyohQkq0cKL0ynk3nvX9qc+JKLIapJPOIcINpnR2L/fVNtN
         BUcDThMXRgCzlhClEGBubN7PbYwwyWpKkOTdFw2KkYVZwOSJTWodcKwMLbKQpqmZoA+l
         jeXsmh/t4fCc7+rFxAokqNlfex69dMoT9hrcXcRmJeTjc22n0cN7qTE9ndY+scjrO9k3
         pU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049752; x=1726654552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ne9bHsDdwSa8wjyT6Ebk8ZYkvTKVIZhNkqlj80J6xdM=;
        b=HGGTgGBxCSKiheOS+FzdPiUMUClH5WNxMO4m4N/v/dpDfRow2OI7eOaPBroYDp3DkG
         hGb8Y/fa38LN/X4bdQfMrsHU4ZCWhXSIwVm5/PSFuO5U4jjz2FOaUcI8Tbs8J7Dt8m8S
         yyj8JO4E7ONjpa7+ieYWULiTkvwyiQ/4xqj3oWIwjPwaM3McLeTI9TtFvysqozvaC9Qg
         EkXFhVJnw+9hoEi3Dx+dWO/N7BTl+lsT336EWbKlDz1vz7ciHhAdPpJnB0kRlH8+KZuB
         52b8E1atNFzaukHicm6Ku0r+8QZFvWHkQkKTcuYvC2EPE4IYq2Mdxz5HiRVJ+ODvf2E3
         Hstg==
X-Gm-Message-State: AOJu0YyR9z0YDYfk5V+kX7+Lbg8oft+eJUKRxd8ZqzJi1KfAz1wpBDqt
	1bodwZ0r0gktwZKccJzJIium7SQ4Ssrkujv+mypWgWgvBZGZzLqc1Fbf3lz5LpNW3qxJGu1tkzR
	mU/WVi5bJ36ZrK6rKZUQUSea7qaA=
X-Google-Smtp-Source: AGHT+IEx3N/CF0ZlHYL6dJGaRT4xvm9UNS4twobksr7nVH3n2lqdlfQw7+plTQzzhjUz4rqHogX4y/sO6Be3YOK07DY=
X-Received: by 2002:a2e:b889:0:b0:2f6:6074:db9a with SMTP id
 38308e7fff4ca-2f7726199abmr20946131fa.7.1726049750854; Wed, 11 Sep 2024
 03:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240910184143.2820792-1-ejo@pengutronix.de> <20240910184143.2820792-2-ejo@pengutronix.de>
In-Reply-To: <20240910184143.2820792-2-ejo@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Sep 2024 12:15:39 +0200
Message-ID: <CANNYZj92yih_U+qQ=Ow8sOV6BZ2vWZFXmwajzT6e=bHe=ej6gQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 1/7] barebox: add initial support
To: ejo@pengutronix.de
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 10:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204378

On Tue, 10 Sept 2024 at 20:42, Enrico J=C3=B6rns via lists.openembedded.org
<ejo=3Dpengutronix.de@lists.openembedded.org> wrote:

> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/barebox_2024.08.0.bb
> @@ -0,0 +1,3 @@
> +require barebox.inc
> +
> +SRC_URI[sha256sum] =3D "b08a762da8d63dd18b4f2d9f5d0a8da001b6e608d1b3eff6=
dcebc6a2e575d535"

The checksum should be in barebox-common.inc, so it's not repeated in
barebox-tools.

Is there a reason to set S and B explicitly? They look like defaults to me.

Also, is there a need to keep barebox.inc separate? Why not merge that
into barebox.bb?

Alex

