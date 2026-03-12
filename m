Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C352106703B
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:24:52 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22899.1773325484305716588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ybyu9l9v;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ad79dfb6eso1344396d50.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 07:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773325483; cv=none;
        d=google.com; s=arc-20240605;
        b=brIZA30+QC22KrJ8MMmXI4OWGoH7RVRK6m53vu7VJpeiUV6bwkg/+rSYbWjGXOBr4X
         q3Dr+YYmFEKlad6h19nljNK0SuuWbxZlAEnL/rqAFEefq6s3Jeor1KJK7ghYDcqCt5bi
         tjoQQUwiGY0chRO5vq7qN8UpnJtunLzBa3/CDxUUuT3SNf0kv7CEmuQX5rn9qMTe7XP6
         jB70f04Dv0+zULyK1l5CibBeRNlqgsKDYli3J6KD1hkBrciAZUHkgSB7B6+qop46fW3z
         cVf60ZOVVJExoRptfK3zakSqYdc6uWE87DMjv/WiiQUCRRDZzlxe4dnXHvTaw9W9R8g+
         3VSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZvOUFemvLm+pwEW6fRvfJ1MnyNowCH5MgaqARB5PLNk=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=OSCEN10m1p8hCSm5IteiAyJ9jomwB1F6MQx9baiSEURdc6FVat+rkc17EyCQqEceJb
         dk7JAgk4o+d8Ysdgr/Ro66C9RwRZ9p0Rekk6brNlHxiEGlEv/emWJcH/SlYgJyOA41jp
         Woey3mhCMs66ahvdHmz2qxL3Fj3jzHLnmLvjFfJDGpF+mOVP7I/jlYfA5FZCN6+zGgnZ
         aD1NVJ6B2EvOrouaHdiKEhwh5+YHJfnu3MR2Opb0CjZMP4yAvefCE+Wr+7Om595CqAwL
         4CVQyp/iNoQ7HVpk/Ybf5/wvi2pr+JgAGvAjHzTWazoZBGdRG0Elp1ysNPOXLLGDiDZT
         XJVQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773325483; x=1773930283; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvOUFemvLm+pwEW6fRvfJ1MnyNowCH5MgaqARB5PLNk=;
        b=Ybyu9l9vHgFKjjBy6gDtqVsMZrb2iXFzRNeEBI3s26AyfFWF8sf2FqrR3ARiHezgPD
         ffZgHpwkX+n7ZhNj3sYQw9rhiEoft6lWqdrcHF0uFnjPBwnWcwNDs4YEP1ZS1mkOSKw2
         YP8W1zrzQMeylso3wc9mn9m9VBsp9fgr5hQhXKaH+Gd6o7YDLEPNU4VH3SYggRIxxsNh
         hboGYnTZo5Ie7DkOG0D/JZ7gVT0cIdYpQkeKg1Nqes5ZBWv5BFhdjMsf2sCsxo9YBAt+
         0L+s1dTJaDaEfDRFTSoe9yiGZg1pKtztpKhDlE05JoB9BMwxMl/gdxxj3BlSFFifyf0M
         hclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773325483; x=1773930283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZvOUFemvLm+pwEW6fRvfJ1MnyNowCH5MgaqARB5PLNk=;
        b=aPVGkzqdvLGsMIGQbD8DGCR394n9UJzlmCR21uWoO1KIj6BmEp0Um2ORQt682xRRw0
         anx8U4Le/JnAWi64AOkbPEx0+6ad+EzirzVVRlEgFHkYc3DvU5DKNdBfPT+w53ISNISM
         m/PbuxABZrShko8G/GUxHtYmtDGvOyGmqWl5KMFxwmHngkPhVhm58MWwlHYvGscIjgR+
         FRkGYsN7IFV5HUoR3UKh4npwHnknXCNAdRQYDH6TfaAa1+yF6xciLm3XuXqMw+o83cYF
         3ZvowFzeKc7xApEtdOjuRFgSZz8AzcRhgeYGRDdN/CvdDQFSvmqBAsxoqf8vYhaMgRoN
         drpg==
X-Gm-Message-State: AOJu0Yweh2pzcMmAjtvNTSRkxFdreuSJn1P5XhY7G1kb4iiy9LcOG0JQ
	ziC4vHU8eoXG32/hidh1ZjroE6nkv/tb85CgtfxnLX/1gJWGe9zcmyd9Uuo8DrtF0GWvQ39AMNA
	AZ86aOIWJRsLhTWKJP+bFTtc62rTiyfs=
X-Gm-Gg: ATEYQzxUFVy30p4iyf8zmmpukR7Uef2wAm+KbxnYpxX/rWOoMDVjZCgvXuz9AHMs2v2
	zb8H36RAhsMA6XShynJI2BXrXynL/rvSgOmbr5HVk/zlKeOp7OjEQW1Qt5xTls5X8hOWpeMOc5N
	x6Jv76gUZPJr7DfhLs0WcGUkaD6B0pQYJTFgEdUGt3oEcDcJeseRqc9eurs5g0zd8QaVvMDXk/A
	2yOI7wRr8nl+Jnz0yb+NJ8OFFLopmoV+CVzN4jcpDeLbeNxy5bxKtPzKmo+Mr6nX3y7M1wRzWJx
	v1XH6o7brNwIjvu6vHLvwA==
X-Received: by 2002:a53:cec1:0:b0:64c:4f97:e8b0 with SMTP id
 956f58d0204a3-64d657d206amr4729199d50.61.1773325483428; Thu, 12 Mar 2026
 07:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com> <20260310184058.533343-11-JPEWhacker@gmail.com>
 <a437698a4d24a835440e282d0d744f5b3ff669a3.camel@linuxfoundation.org>
In-Reply-To: <a437698a4d24a835440e282d0d744f5b3ff669a3.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 12 Mar 2026 08:24:32 -0600
X-Gm-Features: AaiRm50vGas9AIlKAvHCtAPygbKCgd4YFvSxowlL_AtHJJtbBxO9j98hew5jdXk
Message-ID: <CAJdd5GYvTS71yZ7OfgH3d2Ouam8H-2y4hZmgJurLXC9t3CA9fg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 10/15] dummy-sdk-package: Disable SPDX
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232972

On Thu, Mar 12, 2026 at 5:59=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembedded.org=
 wrote:
> > The dummy SDK packages do not need SPDX support, and since they play
> > some games with allarch that cause problems, it's simplest to disable
> > their SPDX output.
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/recipes-core/meta/dummy-sdk-package.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipe=
s-core/meta/dummy-sdk-package.inc
> > index bf453cac9b..71e788b0b9 100644
> > --- a/meta/recipes-core/meta/dummy-sdk-package.inc
> > +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
> > @@ -4,6 +4,7 @@ LICENSE =3D "MIT"
> >  PACKAGE_ARCH =3D "all"
> >
> >  inherit allarch
> > +inherit nospdx
> >
> >  INHIBIT_DEFAULT_DEPS =3D "1"
>
> I know why you did this, but after thinking about this, I'm worried and
> I'm not sure this is the right move.
>
> The SDK dummy packages are "odd" but they are actual package files that
> are generated and would be present in manifests and as such, if they're
> missing from the SPDX manifests and docs, this is going to raise
> questions. I appreciate they don't have content and their main use is
> their 'provides'.
>
> Taking a step back, we do support generic/multiple levels of package
> arch and since we support that, the SPDX code does need to handle that
> too. I'm therefore starting to worry that SPDX can't cope with the
> multiple package levels. Can you remind me what the issue is with the
> "all" arch here?

The problem is specifically the anonymous python that does:

    d.setVar('PACKAGE_ARCH', '${DUMMYARCH}')

Which seems specifically intended to bypass the allarch logic in a
weird way. It's specifically doing this to put the package in a place
no-one can find it (this includes SPDX); I didn't think it provided
much value hence disabling it, but looking closer, I think we can do:

SSTATE_MULTILIB_SSTATE_ARCHS:append =3D " ${SDK_PACKAGE_ARCH}"

in create-spdx-sdk-3.0.bbclass and that should fix it. I'll try it.

>
> Cheers,
>
> Richard
>

