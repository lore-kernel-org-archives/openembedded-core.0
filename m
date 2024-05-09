Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AFEC25B10
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:47:50 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.9231.1715258861536291169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FZulHOc1;
 spf=pass (domain: linaro.org, ip: 209.85.128.170, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-61b68644ab4so7816027b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715258860; x=1715863660; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NT9gTc3CJzLl7z0l2KaLandLBIYkIiID2qHyrGBqxGI=;
        b=FZulHOc1v7eF/UH7b573t5dgJl/R/Beijq0DnOklwz2VvBgT1h7I5WgPr/GyJ/vLdg
         QZNljKnQ4Lpud0vdwivh0TprNefxr5QJJj4F6tlFVFLH3CPekvlTojgsiNQswxsY4uGr
         RqjDFo2wz/R8T3b9spJHRR2/zsTbHoN7DSPDWtr7wxK4Yu6izf+XYeZpxythRSqwjUcW
         ZNIkCcxgdlgzM4da9CIqmCmZP1o9bkgjBILRm3dzYzbeMZl6sMgSBUGi9IYAKYUuzuql
         x+T44NbAQWqtKPTdF+Mtkr/38KL01Bg6ohTvqoWPMW9oFc/2QVc7pD8otLfHWeqMQ+Kr
         Bikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715258860; x=1715863660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NT9gTc3CJzLl7z0l2KaLandLBIYkIiID2qHyrGBqxGI=;
        b=qO9RM8K2vLH7JC/Wh4lPPxWNJph05s4s3xC1rnH3xtWmu3uNIPdZleHJ+IMonI7Vuv
         znYnp9XJO0f2YrpGlfeWLNbfkZMHPNAY2s+QmncMZjb+oCW7nQmyWNjgKV2BNOjH/iBK
         jnScpUD15K9tuKG8C65zDyQya/+SciziRJObmsFIFmJNLxTiFiYz8XUOKrCSZYL24697
         UQ+lsecAWfBnvDwrQGcPNGox8+q+kk4kqYX1SL9ljsRP7M3Vmlmbxw69EawM1IaY4D6E
         1RGFtMYg1dds0tLEvOuo6iq+CcvDY4+0w+NyAiQovnMj5jRzTOTjt6i5qk8nnO7r/Nkw
         ynog==
X-Forwarded-Encrypted: i=1; AJvYcCXoIRra92NqX9xRAtX4enw+t/2iAfuga99pZyz1LOLsnoI66Mh8+6Hb0dyz3Ry6kgw6qU5z3qtgAnPWyXpjeUrm43hWwGKC4vko/PmnYoeQ536UizNxMR1E
X-Gm-Message-State: AOJu0Yw4eVM0NXGf2DpdrUzW8NGDphKT2MHIZuhy6gc7anTlr5RWzoe8
	boT8+HdG6Om0EwtVftPAblDrhkldZ6XP+QPJhYexLyHcCy7sVjU8yc6soPdGHJ53ezHJPrPS8jm
	lzfxlK62awdbh6OWWYXb+4hNCHpscLjS+5JBwsw==
X-Google-Smtp-Source: AGHT+IFKSSw9l4ochQ/o50Dn5wCxsCL2Gavl+Py4waoqDDhjJazv88U/cDecyvroO8CFb47I6X4hSJ7E1KEnd122u8M=
X-Received: by 2002:a0d:ca07:0:b0:615:20db:4a4d with SMTP id
 00721157ae682-62085d371famr56746487b3.35.1715258859890; Thu, 09 May 2024
 05:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151827.1387077-1-ralph.siemsen@linaro.org>
 <e7b395f6-b9f6-4566-9237-42d5b7f9c9ce@cherry.de> <CAOSpxdZxkuaEwpPCWuvFjRm+qfbDxbW5Udk7-i95r89zEadGbA@mail.gmail.com>
 <17CD500B64E4E788.19123@lists.openembedded.org>
In-Reply-To: <17CD500B64E4E788.19123@lists.openembedded.org>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Thu, 9 May 2024 08:49:32 -0400
Message-ID: <CANp-EDY5rxAN98OV3BFYi=sHow0Q++c15xA_GMVTM6TjMpTSZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uboot-sign: fix loop in do_uboot_assemble_fitimage
To: Steve Sakoman <steve@sakoman.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, openembedded-core@lists.openembedded.org, 
	sean.anderson@seco.com, jamin_lin@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199172

On Tue, May 7, 2024 at 4:50=E2=80=AFPM Ralph Siemsen via
lists.openembedded.org
<ralph.siemsen=3Dlinaro.org@lists.openembedded.org> wrote:
>
> On Fri, May 3, 2024 at 1:36=E2=80=AFPM Steve Sakoman <steve@sakoman.com> =
wrote:
> >
> > Please submit a kirkstone patch once this hits the master branch.

I've just sent a patch for scarthgap, clean cherry-picked from master.
The same patch also works for nanbield.

No change is necessary on kirsksone, as it does not contain the
problematic line.

Ralph

