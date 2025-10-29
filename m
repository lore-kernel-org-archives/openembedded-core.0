Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3ABCCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 10:44:36 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.3631.1761734667801624380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 03:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fzrL1jlo;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-87c237eca60so58958576d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 03:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761734667; x=1762339467; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ah6A8QYjEzSPRtGb2yL7dEEeqGNXcvQCJ3SzJW8Y10Q=;
        b=fzrL1jloD6qCXPv57fejEjWjtnvAFxliTYwhhAM+5TxMtFc27bDa2r0oIKxMWxeBaU
         AfkKm9f21ZRqbBgebEW2StZvoo6NPgfz8DGgRqmm1ft3w69naBJmBmOFG2Kz1SFvIsBL
         20031BDN4zSU5YlnJJltxd3dOZzqD/Dk76+ELLZsmNgoucNAq1EMNqXk7fKYMgRQZCwY
         /DtxdFkdDQ5lGy+UzTmD99bi69J0AYOGJTfd3kZLeGgVEuRmAFyo0PyYjksKNJ+57hAA
         lgpdTN0f0LMEXGXyA4rWRVYiWxYHsXUi+IgEz0aRhiW6m5T+zPAMg8LlJctatU7SK8sF
         GSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761734667; x=1762339467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ah6A8QYjEzSPRtGb2yL7dEEeqGNXcvQCJ3SzJW8Y10Q=;
        b=uOQ5/i25Frj4zBn0nmQmnrSKn0/atIJt1+v9YePnpG0R02sA7irfYEPCipBAiADKIX
         58BT8/HODWjTD+A7FRGr92YOsJl50s8j+XjGjonMWRCX6aDbUfI7M/Fzarzu+C5SjEXh
         PK3xpHLUNggsczK8DkGBzThi5imNiZTSlQwDA/oOobMLO+QDi9bC0Fbcw6U9XUXrxprv
         AJaGJT3dJNB83TA41H/DmJ74E4deOcs/uIC2AF7XUjW5MliJ2t+468weBFkV6jxufLK2
         944tmpJF2QfTCuVSNogJniipEk882icaT9caEVe6Bai6J8TLeHR2cufDxKoD3vsHROD2
         ZmkA==
X-Gm-Message-State: AOJu0Yzc4QN5w5nu7CziZ/pyduDu4IRNyCq30sOOVX2vkwwx+MV6xQJH
	j7BlkaF0ZQ+eSoF17faoEkme9Pwf01JBPVYh0Ujin/yw9imr3l8z6i5+DtvssxFtLaUto70RF58
	s3v94qvE/eis0dWDGydmiNMEyURfxBrI=
X-Gm-Gg: ASbGncuYs0+NUK3h57Eh4r1EOYfZYLHOMe0yoOg5U0OWGq55is+fVbw36OGFvrOgLYN
	x62J5e/MaMohY87Tm2qt5vNjZrK80wNu67K8UxkzRHO/4OY2Kd5Yr2eHvNbjL4inOOps9HVFXi9
	RxK1kNdz3R74CJL8QzpKjretDhSx1IDax2sg/50KKsQ9hFp6ri5z7YE/6b4eG/YP0PMMrFBeYwR
	7JLWTIhmuHXX2jqMjrU7FIzh5IFK0jN1CatkfzFFLMsSQxg7jvO4vG3z3i+sUGHBcWWtFuMUS4M
	CvHQoqxQNEIJ63vzY+6uxYM7cB4fLU4GJEsV5EoLuoPKeSK7I5fw98TkkQcFBGmBFFClk2EJCjN
	mBitPZEQomDNtND6eyIoUWH5Ven9j
X-Google-Smtp-Source: AGHT+IGviYx/Sh45oaROeHjDsYSri7nBjQQRil4dXpXQ9zbR2rNbgo4mC4sw+S6QRNcJSi1apXedZCAr97Mc1FxedaM=
X-Received: by 2002:a05:6214:301e:b0:87d:cb55:823b with SMTP id
 6a1803df08f44-88009c2f720mr21870876d6.51.1761734666634; Wed, 29 Oct 2025
 03:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251029002918.3728797-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251029002918.3728797-1-dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Oct 2025 11:44:15 +0100
X-Gm-Features: AWmQ_bnXHmaEXIebY-6rEjjd3VmcS2WM-dnX99tSqXTqg1iW83NnAOPED75xxgA
Message-ID: <CANNYZj83omwdp2NNvBf5i_AVMSgWtT4F9_Gyq6HMsDhsNzyKDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] libconfig: import recipe from meta-oe
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 10:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225443

On Wed, 29 Oct 2025 at 01:29, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> +RECIPE_MAINTAINER:pn-libconfig = "Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>"

You don't have to do the below straight away, but there are a couple
possible cleanups.

> +UPSTREAM_CHECK_URI = "https://github.com/hyperrealm/libconfig/releases"
> +UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"

As the recipe is fetching from git, these have no effect.

> +inherit autotools-brokensep pkgconfig

Can you look into why building in a separate build directory is
broken? Maybe it used to be, but the issues have been since fixed?
It's much preferred to build separately, so the source tree doesn't
get cluttered (and autotools are very good at that).

Alex

