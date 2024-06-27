Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956B0C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 08:23:21 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.3300.1719476591542135055
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 01:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WB1hEw6r;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so117346101fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 01:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719476590; x=1720081390; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9K7Xtza4fe69YDgDSfu7/Z/ugHwn/K4+LsYZjRVZX0=;
        b=WB1hEw6rVj7W2eBn5a1sE+FodmhjsKW8XNeGFs5hvqqRuigHqdr4JS95nxTZybibS2
         OdttUBwphXfckxow+v8WobFLVQnlukEa2ySp9DtWLbowG5JQJmhEUMpt9n+wCZnWGXh6
         wrFijpmHRXFQnaCc0bOIGWMHB3ev/dcmac3Q/CkF4S4pRTa6309mhu3zgW6qm3GjPx7X
         RV3ptnfKStQvJPBWjI2qlVS7Qt/ObQrX6lzlJJzoCmDYIULFO67475/wGCrOPLH0aQWK
         mwlOU98lD9XpqFc6D1Kj/74GrBbPysTDT69j36/rS/84Gzl1t+jSzEw2iK55V0EBateu
         Q2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719476590; x=1720081390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9K7Xtza4fe69YDgDSfu7/Z/ugHwn/K4+LsYZjRVZX0=;
        b=vGWLi/B/q0E2/OnKjn6e5aDKSTQuLujk55qMNwJnBghAZfdulFQZq0Sb8zu63ySeAd
         r1jzUbY67ipZsLAwF7aT1uHImn6nnzxKEa5SMWHCRXW19urLA5d/5nLDsF211H/QDxMv
         /LXJjybcHwiOQOxnGNh1EE0EhuTuHjI4QzagNw/35Fbp+Ai8T5vs4tAQACn1a55lYWV2
         bi5AmzQAQXmoIAhkNHVkO1/fXp3WldoaAS9tGVjjOtXgA/SAtC6bFVKSJYyL/zlkvCpL
         5UCK8TrCtnThoVgsrRRTQdOiIVSecOPh6Xmb39ud3XiKzd542HfaDHVsy4BnrZdf0ud7
         CoEA==
X-Gm-Message-State: AOJu0Yz9Lrmw0VQ9vFWXOwUvF4tYpRRvGrLQAjmYqzEH4dMQNcaEUkn1
	cW83W3bbSZ9Y1aSYikTmQ9Nj5TJgAjXgX+l3VD75v/aZaypntm33pFgrPOf/yQFDA98ouXdNZfc
	yEPKTtxN8V+tZdt9jgCy6kK2ZmwU=
X-Google-Smtp-Source: AGHT+IG4iCX8wW4DwGywFPhb+wgjXJ6XSfC1M2zXHv/Q++q3TQ0cJ+KOqUljpViIX1VNKz+nDQBBgT6Dx+xdRW4RT7M=
X-Received: by 2002:a2e:9dc5:0:b0:2ec:4eea:5dd1 with SMTP id
 38308e7fff4ca-2ec5b339df6mr99675651fa.43.1719476589446; Thu, 27 Jun 2024
 01:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <6942.1719234931976014510@lists.openembedded.org> <10793.1719476241850570958@lists.openembedded.org>
In-Reply-To: <10793.1719476241850570958@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Jun 2024 10:22:57 +0200
Message-ID: <CANNYZj8sZMnMHPizVG1jt7-Su3B36WqQiEE6k_LH7BnqiViBVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-setuptools: drop python3-2to3 from RDEPENDS
To: gudnimar@noxmedical.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 08:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201196

Normally I'd say there's no need to worry and it's in a staging
branch, but I don't see it there this time:
https://git.yoctoproject.org/poky/log/?h=3Dmaster-next
https://git.yoctoproject.org/poky-contrib/log/?h=3Dabelloni/master-next

Alex

On Thu, 27 Jun 2024 at 10:17, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org
<gudnimar=3Dnoxmedical.com@lists.openembedded.org> wrote:
>
> I don=E2=80=99t mean to push but will this patch be accepted? It will be =
required anyway once Python 3.13 is released. The 2to3 module will be remov=
ed from the standard library in Python 3.13.
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201194): https://lists.openembedded.org/g/openembedde=
d-core/message/201194
> Mute This Topic: https://lists.openembedded.org/mt/106764629/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

