Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CC3C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 09:37:48 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.12028.1738229866893496846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 01:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=njIVKzeq;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d8edad9932so4375626d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 01:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738229866; x=1738834666; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtx06buuZ0T+S4ciZteex7XcYEdmSalGQcOSX8BUVjw=;
        b=njIVKzeqahvf+jZtY7s+eFF9ROJdNlpCoiZE+GcnvQ+yPDA/ZhdkJqzmwMiBNeJMI8
         bTbMDW6GVIb54Ks/lTZrGeWOP+xDe4Dxb0Sanm5gchCpdKNJZ8BlBbcTC/wma5ubqwxD
         s5IzgwxJ1p7QqjuM75LZBSC5d7ZeTio72vkwW42m4RDFntuFMP+OT09X/1/22QyyTO+6
         DqkEgSD5OukSWblCBK70XVwZRuQ/8+NqGEp/V8Bb5qBC0f7GphQR+XTd7DfOvVf/TrLp
         mqtiBpSFBIRT6UaabuHRlqYi9Xiq+f6DvPyZg+uNtFJtyJ/BrU+uid806oVMEYqNTVyl
         cH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738229866; x=1738834666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtx06buuZ0T+S4ciZteex7XcYEdmSalGQcOSX8BUVjw=;
        b=gEjKJ29BFQ4B8VW0PBZUbRq9QiUr+ctySgdRN80pxLlHyIkfQMKjHyOK0uS29DuZDx
         bvZM+g69bqV3Dyaky84MNqw22DTXB+9dsT8Dac4hE94ZWAa+860TWxRpYbzpuB183VgY
         lBfclI+VEBbQeU4FwR3CSa0f2CxRb3O2BqlUwob8vncAHOrwoMTTlWGD5w5nsrNmn5tS
         QibZ8hSoD5IbLy1Uv5XWSaRXFjRQKPN0TaAos9+c4TYr/x/tiX0DiSeoxkmujNgNOOTq
         ZcgsRqcuXd2whk6ZI+dwJyWF5crp56VtaAIeG+VSx8X6gmeu2SWe5fttQtBPMe+K+8kY
         kPew==
X-Gm-Message-State: AOJu0YxwoVlwpdA7hJ8LU6LPK5BsNkgG+DBC02lABF5Zv6IG71Kqi3US
	mJcTLqSsZ8HD9ELhcBn5uaiuorRWb6LQ0Y55G8X/+6Jkn5HGC4EF+CBIXO3RoqBioT8QsIMvLb1
	gr6CZSQJZWSP7DK8KKnOntSG24pU=
X-Gm-Gg: ASbGncuqLs1SwkeiD/yG9lr+jbHb4clLScH82pcTFavFaaFxnYT+DaIriGIbgr/C5QV
	+qSotzEsLAUJLwWv1uin1dUl86owSGofcRtI7VTfXtZegH/2bmd94HnMrYNR2qySU3jT8sZMhQ2
	0iM5o0AXH2LydxuEYdaaCn/yMC0st2+uU=
X-Google-Smtp-Source: AGHT+IHPoTFscKMMVJmYcriWoKdcMZsMxjcCHLAHztHTAFbTFj2dkNq4ZJPBcjLLT9yQYp/C4T6D0mn9MePretxvDHw=
X-Received: by 2002:a05:6214:5985:b0:6dd:84b7:dd86 with SMTP id
 6a1803df08f44-6e243c80546mr125368946d6.36.1738229865821; Thu, 30 Jan 2025
 01:37:45 -0800 (PST)
MIME-Version: 1.0
References: <CAOSpxdZXZvG2XcXDeDXV8wKC1sDHchOihQFk4PVnKS_M5+xqwA@mail.gmail.com>
 <26150.1738174267176371567@lists.openembedded.org>
In-Reply-To: <26150.1738174267176371567@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Jan 2025 10:37:34 +0100
X-Gm-Features: AWEUYZkkTdnGK9EM49zkyTS4kHqpsrCjgGv02BxndJulJGYm-cPE6fvAhrevuII
Message-ID: <CANNYZj8q8xVV1cxuLAk1pHe4vdemziRJqdBuQw4B74RJ0Mb7pQ@mail.gmail.com>
Subject: Re: [OE-core] [styhead][PATCH 0/3] Cherry pick commits from master to
 sync styhead's gnupg recipe.
To: gudni.m.g@gmail.com, hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 09:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210437

Sadly we made a mistake in updating gnupg recipe to 2.5.0 which is a
development release, and further 2.5.x releases do add new features.

Gnupg follows the odd-even scheme, as seen here:
https://www.gnupg.org/download/index.html

or here:
https://dev.gnupg.org/source/gnupg/branches/master/

Updating to point releases in stable 2.4.x or 2.2.x series would've
been fine, but this isn't.

Alex

On Wed, 29 Jan 2025 at 19:11, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Looks like we need to cherry pick this also: https://git.openembedded.org=
/openembedded-core/commit/meta/recipes-support/libgpg-error/libgpg-error_1.=
51.bb?id=3Dd6d4ddf023dcda0345e0ca646d6774c964c7917c
>
> I=E2=80=99ll send a v2 once I have tested locally. Sorry for the trouble.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210403): https://lists.openembedded.org/g/openembedde=
d-core/message/210403
> Mute This Topic: https://lists.openembedded.org/mt/110808443/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

