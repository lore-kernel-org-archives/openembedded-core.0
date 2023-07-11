Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E3DEB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 16:50:37 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.1253.1689094231687136917
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 09:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=FMga5Y2Q;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b6a084a34cso91347701fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 09:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689094230; x=1691686230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4G1aMtr5JoNFw/4Svbv2mQAcWPllC/47sjBPw15SRk=;
        b=FMga5Y2QdxntP0c9cG1bo534GMJSw/nMtJSurNuOmq+b9/ERUmwN6Q5UKHfUmg9YGI
         /B7Gv56dU4E82T7a+7I8u8PJ3Hj8YDD9wdt0LI+U2uci+mNg6OAzHRGpxoxNtUi0Q3EN
         NkYbCpbyQzO/bRcxG8TVzqDnSkLyuFiYlWdGe2BmP0ZcmUmmJXekXunRKaI1Lm6MMwRU
         7fDXBi+9CdOBzkqTaoZXdWtsdhJ9tjmmqCmCLkPPp/Nn4ABwOwwkVnYtXqs2h8HtsCVV
         035vLfef917Y//toQLBN24IdKx2ieG+AosDVSjGX/S0F71gT6nVRlo9zdrYk2BdPZhtu
         vwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689094230; x=1691686230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4G1aMtr5JoNFw/4Svbv2mQAcWPllC/47sjBPw15SRk=;
        b=DTruwgvhehG+6BZiP82fOHCsIhyooj1naGl9cjx8H2cXWwWmJyAEe8RNPPc+EsNs/m
         S8L2+CnFYpKE4Pss3ViqzIw2YQwS4M8IszxWYKlDSK1N1XFB2uKGz69UVG6qiFvBhZWG
         GK2dejskDGnMPp1hJTyvQxdpBUg3RgsC+fe5lXsL4BBwYVd/U/9CYnaEN6a0DOKYO4I+
         ISSOZedCtJ7yDoq7LG5E2XjvPR3EYK3TsG+APPo0T8qZJ05BWG8COEoXuEnZ4MRNaeto
         m1VnrtzIZkDa5gsxghg7KUPvKbLInvgBuGvnCH7B4RDYy6HfqkrVQ8dfQ6K7g4zhoktT
         ut6A==
X-Gm-Message-State: ABy/qLZs2x89OgnexDkZZOevybxXVDxhRDgIEQYvU9+kKAYJvuuHQZKR
	Lo66GweAvpgA8Zsn1XpLYg7d0O1Ra1seShNxw6E=
X-Google-Smtp-Source: APBJJlHr/CIOfs32WC25RDH5IwS88S9k/kBnkYWrvQw9SGUCCq7szTBRPZRfFY5GZR66XJ/+f4752o2jy1Ue7YFZ5E8=
X-Received: by 2002:a2e:9c07:0:b0:2b6:e17c:151e with SMTP id
 s7-20020a2e9c07000000b002b6e17c151emr31575lji.48.1689094229418; Tue, 11 Jul
 2023 09:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
In-Reply-To: <20230710095800.2033309-1-p.lobacz@welotec.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Jul 2023 18:50:23 +0200
Message-ID: <CANNYZj8fmhzEn2tcHsYpwuMHUwEzXajGH9vYRfevsuh82+T0Gg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
To: =?UTF-8?Q?Piotr_=C5=81obacz?= <p.lobacz@welotec.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 16:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184147

On Mon, 10 Jul 2023 at 11:59, Piotr =C5=81obacz <p.lobacz@welotec.com> wrot=
e:
>  # Native distro features (will always be used for -native, even if they
>  # are not enabled for target)
> -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> +DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 ${@bb.utils.filter('DISTRO_FEATURE=
S', 'acl xattr', d)}"
>  DISTRO_FEATURES_NATIVESDK ?=3D "x11"
>
>  # Normally target distro features will not be applied to native builds:

... and the next lines after that are:
# Native distro features on this list will use the target feature value
DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod opengl way=
land"

So you can simply add acl/xattr to DISTRO_FEATURES_FILTER_NATIVE
instead, which is purpose-made for the use case.

Alex

