Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0689C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 17:15:34 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.517.1743441333589334085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 10:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZVWYwAq7;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e6405e4ab4dso4914719276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 10:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743441333; x=1744046133; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiikDC4/c/gUoiItHzRoKTtXs/uBvZ0IVF9Ihc06L2Q=;
        b=ZVWYwAq7/AbGeg+zPEZfP0UC06gGvGAJYFAsMj+7GiM32zr4QF9lofasfTIeUrTTGX
         /2gEmeDRBicUAlmA5RLJzqAN9GQDCBf8t506b1BYPfkPxXBFK8VnGnMV2nYKDDAvluLB
         2CjAXTD0qaTtnlybVvEusu586CwGiSacuqcfHp064b2Y+D0EGn/ZUceCcD6uGWO0yYAj
         jBulHzPPrnYYRz2ks4yYumWdKFLqrx6loV1dxtxfjten3NKc7Ctzp6oC/N2QSU+a+9Ta
         3hn4Bir8zRdKYvmgQxCjDkxPfNXbD8P9EQcm74brCXR7BhYAYuYSS/3ms9BBaMkz3LIm
         +i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743441333; x=1744046133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CiikDC4/c/gUoiItHzRoKTtXs/uBvZ0IVF9Ihc06L2Q=;
        b=reRWQZexToqiEuFp4wlf07OL+8oEMlZG8NE8ia8VFH7epcOERsAFdjrKrCp02dpj2Q
         8YzBVp0jca/6U/R/LpWCvaPXIQzinVztEtBQCeVXdJx3i5GqWPLekFEczVIERIwgBOht
         R5oqfvGs2nK5U2yBHfU2fodBRhwgOKW0kYLRLFg0PyKXwPY06HwIH8g2pZFIznqMzL8z
         TfwoD1pIxm+3ZvCSauUgZPno+n9hKMuQvOppDbx7izBpwi+ycvIubVG15J4axSf2pfvh
         KRf5Vi/TkowtdTP5osnZAhyTorn7OQ/GYCgxYh+n+CCfEzK7UdDnPh8/xGBOy4+Y0QiY
         Dmfg==
X-Gm-Message-State: AOJu0Yy1uJ97+/n0+AlnbxxxrDSS1MbDxkbYe6oIYlA2zIf5Psxj6J5m
	GtbxHIG07SdremdFTpsB6S1KEjtbyexmtdFZDY5JjBYCiFoj13imTDXlMfYy4UwfAMkxIYOjR1k
	A1GV8zIhsHIi294F0fqhPQ8bHL0uo4w==
X-Gm-Gg: ASbGncsZcNt7By6oO7NRN2sa9wmVbUOEgW7lNT+jCry1KB1PcXx0Ldjb4B1zOEgsndT
	OGgaXdg0oEKdSCzqM0cVfSRTdgm6s+EiwJRH52WeNAIgvpzAH/8k6U5EcDOr7bI9ZPRXtQzqEg3
	z1Vp+oIwtuFRX4HKhDe4f4fjLC6RMOIyAHzpV1qZU3Djh0OZW9xGh7xhdgSmc=
X-Google-Smtp-Source: AGHT+IEjESgXeeR+CvBhCjlqoLtTYfWN46yCS4FmladQUTjgAXaQRWsGVFDfWiWEQpJYmmv5FIJw8h6poZSo6SXrIhI=
X-Received: by 2002:a05:6902:a91:b0:e69:1efc:9ec9 with SMTP id
 3f1490d57ef6-e6b735473c0mr18079421276.1.1743441332594; Mon, 31 Mar 2025
 10:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250330130052.2664988-1-jan.vermaete@gmail.com> <D8UAZCO62KTS.2SUM8QYTTL1WF@bootlin.com>
In-Reply-To: <D8UAZCO62KTS.2SUM8QYTTL1WF@bootlin.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Mon, 31 Mar 2025 19:15:21 +0200
X-Gm-Features: AQ5f1JpIObGjqCGxngP9CUjJvMjbPZu5tQCq_WugYOvBlHAh2x0_Mc5AM3n-B0M
Message-ID: <CABF_=yhPD7WnLUhHrcx=b0ixH4K4BwuRKO5qvxwsLzSX0NupuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-exhale: new recipe (0.3.7)
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 17:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213992

Hi Mathieu,

This patch should not be applied to oe-core.  I corrected this later,
thanks to the remarks in the mailing list, to meta-openembedded.
Or is this warning from the patch applied to meta-openembedded and
should those recipes be added to the maintainers.inc file of meta-oe?

br

On Mon, Mar 31, 2025 at 10:19=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Sun Mar 30, 2025 at 3:00 PM CEST, Jan Vermaete via lists.openembedded.=
org wrote:
> > Automatic C++ library API documentation generator using Doxygen, Sphinx=
, and Breathe.
> > Exhale revives Doxygen's class, file, and page hierarchies in reStructu=
redText documents
> > to make these hierarchies available in Sphinx documented projects.
> >
> > No pytests are distributed in the pypi package.
> >
> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > ---
>
> Hi Jan,
>
> Thanks for your patch.
>
> We get the following warning on the autobuilder as no maintainer is
> defined, can you fix this please?
>
> WARNING: python3-exhale-0.3.7-r0 do_recipe_qa: QA Issue: Recipe python3-e=
xhale in /srv/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/pyt=
hon/python3-exhale_0.3.7.bb does not have an assigned maintainer. Please ad=
d an entry into meta/conf/distro/include/maintainers.inc. [missing-maintain=
er]
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1300/s=
teps/13/logs/stdio
>
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

