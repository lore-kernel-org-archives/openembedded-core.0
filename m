Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28338C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 19:11:23 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.36268.1719429080970175301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 12:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AFz3zzNp;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.170, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dff06b3f413so6639568276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 12:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719429080; x=1720033880; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXeC20HRsT8pdQ1WflSW2MepA77zASCbARFxdKMaZr4=;
        b=AFz3zzNpMLGcJbuxj+krM470rYy7cJo1eqYd0q+Rhy9+eXQ3+6i1oQt8GasGU37KLv
         6KXhx/C23Q1uYONoxGnAkAVEAFvTe5EX1NNOGOSyum/1aGVt9OXoAnf8Zogapt5pa5On
         8Tt8q7InQQX4N3mPQy3wl/slo+zpWmKKs+2Nka2rEGHFTEE6VI7w1u3SF3r2rHkMeKq4
         GW5hSrCrNJqZwxKadMsMc02jmVkBR8T0kijoKTBEO3577g835dlwa2SSXDXKS+ry/IM4
         CsOXQAAVz9IQqfOjWq3QBQt1xlephqPMVtJeEQ2gj/vaP4otXvJQFCKxqTqL1T69oPxg
         R7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719429080; x=1720033880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXeC20HRsT8pdQ1WflSW2MepA77zASCbARFxdKMaZr4=;
        b=inhiKwofNodANizhQ7KNb0Tym43injlvkgMMveS0jMPOx90FTeB4vFHVadfIfIrzem
         Ulp+R4boYpq/PmiwnctB25JtnMepUKyBZ+GhYvXrFI+UOVpXvbt2P3wy8F0cXQA3wPgE
         /1Qk0QF0sdhA76SPYrei8ApbxQOLLGXezdIfmhnKnNgrWRY+FZQ/xNxsvxeNHRLgW4nD
         xI8oSsjlpdABA7r056r6cCUj10YvwBCQaEC0bDH+u/LxSq44FYQYLHPe5tzPsFEBWp7e
         8aTmjmybSTea2sAVYSFEz0sD1Vi86wSlTfJjd0exjsncU3PuQYlcxsv+mnbm5jenVRri
         6vtw==
X-Gm-Message-State: AOJu0YzRUT4F24N+/TiHEy1HBPm6T1InsIkqO0pk021IeCX9WyYDJS5H
	MPT5wGmQJoVLlKr3vuNJ2E57V0tUNM2nF853x8LwOBmWdMrHhxtBap2HBdKt/Kv/GePmFpkZ5fU
	vP6kJmmosehNW7DRySsmc2FhiG5bqec8bJCHI/Q==
X-Google-Smtp-Source: AGHT+IFmsz5kKPbzSwPDdpwBc8rvRDZy37FO3pKJgY9qnL9v2ttcVhctAyurzJiJBhgvNtkel2jRRhD33FQhEz8+6oM=
X-Received: by 2002:a25:df82:0:b0:e02:b81d:9fd8 with SMTP id
 3f1490d57ef6-e0303fc0868mr10822349276.51.1719429080079; Wed, 26 Jun 2024
 12:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240626151743.21115-1-asharma@mvista.com> <22089.1719426123332569606@lists.openembedded.org>
In-Reply-To: <22089.1719426123332569606@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 26 Jun 2024 12:11:09 -0700
Message-ID: <CAOSpxdbdj8r74v3gQ8+zy467Q0kncUDyGY6SYknOv4jO6C28cw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] python3: Fix CVE-2024-4032
To: gudnimar@noxmedical.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 19:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201178

On Wed, Jun 26, 2024 at 11:22=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org
<gudnimar=3Dnoxmedical.com@lists.openembedded.org> wrote:
>
> Isn't this fixed in Python 3.12.4? gh-113171 is referenced in the release=
 notes: https://docs.python.org/3.12/whatsnew/changelog.html#python-3-12-4-=
final
>
>
> Python 3.12.4 has been merged into master, perhaps it can be backported t=
o Scarthgap as well. It contains some more security fixes.

This python upgrade is in my current scarthgap test queue, so I'll
only be taking the kirkstone version of this patch.

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201177): https://lists.openembedded.org/g/openembedde=
d-core/message/201177
> Mute This Topic: https://lists.openembedded.org/mt/106891335/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

