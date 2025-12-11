Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982D2D41D57
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 15:20:03 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11670.1765466397826364987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 07:19:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nRLuW1dV;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88056cab4eeso1506926d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 07:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765466397; x=1766071197; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGJgrcHN2RVObO4FdyZCViVTVuOa987vNEe9CYW1F1A=;
        b=nRLuW1dVjsW5pBZdSMROxPtYHdGlMU8gZaCtlkFpBUDlaJ3tlZmNeh4+Ab/7l8iFXB
         3Np3v2P/8/p/HcSEXrj20c70wi/XWiQ2XBrTdm55fYGFm3iNWcZfmGVf+1LsqWybtMMZ
         iOiKaZuBh1AgCenuR4YkUGgK6lkCzM556/BPnfLcKE4KE93LBtheIYRzjjUXneqj4iMj
         D4Skmv7kZ0e7mHNuRI/TL1/8ly2TO8YLXOIMeyw+d8kKzlEg/H4wRpOo9wRhALDkwGpj
         0ZgENeO7HmjKVQ8ZBnNc9VCG9IHEOlOnVapRTKOKISDho4FN4y2kK//jBWyB25zRar5d
         BP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765466397; x=1766071197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GGJgrcHN2RVObO4FdyZCViVTVuOa987vNEe9CYW1F1A=;
        b=aB6Fc1aBe3rqRYYsDlKCv0CDNgsLBR+1NwvT0T3ZqhVE5W1l/skrxQn7H7Gqn5X+Ka
         HiyoI4VBFwcd05v+oN7G7pkKWxfNPIvPI1LLLNiiNIMnQL4lUjKAN5EwVYtMFCkOcCiF
         bVTgbmwHt6TIUssRZyvmszktReZ68QT9UeE39SR1yZjdc/i6tIQHCHhvVa3V7dfl4ceG
         C2SMqFZz1mAkokf1py/uj6tZTAEHtBmmwGFZI4uHt41o3bbs7+KjuS8klu/QcIucjcBv
         InAfsVQzUruvzAdClUVl8M9mnEFyxaPhI9GpNIXmolU79rUQ/v30IrHrLmHc1pIFi+4H
         s8/A==
X-Gm-Message-State: AOJu0YyCwR4OK+ULkj0nMQvGB6I4IEdNjQuPvQi5HNDW82Hqc2g/FigR
	OcIK5DWx135IZyIcji/dVpwQ1UBbdhChmNDt69yLrQyA2clWrJwnpSv/m1f0VP3HcOFxLrK4HRc
	9b8lrC/FMHqTb4AUMkgYGist4INlvyn8=
X-Gm-Gg: AY/fxX6lBCpdF8xjZU79w5z9jnHQS9BcufnLWk7uCj8j5FMSxQeHb/HotYBx5E2PxNX
	a7BPYcWYcAWY+FXIflD6XHvmA5U2yQ2pluU96SmimMGpGpDMdkSWwTY8v9b9QciJXwTLGif1cQF
	2tL4UiaFdTbvbhAzbUUmOC3+h+8aayMPGrbcYthIjvafMi94DSBAKpD3NRbma7y/ddp4erflRcJ
	3sliDub0eFHKqY1pDjQeynDj5Mdp9oicmbiRPoTNIZAsKKpRq5YyK4/hXrVJLMIj/Zrz1e9d8wG
	XcD+O4ZfP4B4YSznNin4D0tF69AJCQ==
X-Google-Smtp-Source: AGHT+IEJ0argT9oepRehApIYPUdicuxaS3evXXPwAMqN0waYJ7Db6yfJg/AklQVJZ3UE72GzzpFKcn99xQLTNV0QMYs=
X-Received: by 2002:a05:6214:1309:b0:880:477f:88eb with SMTP id
 6a1803df08f44-88863ad4edfmr107013106d6.66.1765466396692; Thu, 11 Dec 2025
 07:19:56 -0800 (PST)
MIME-Version: 1.0
References: <20251209132208.402718-1-pascal.weisser.ext@karlstorz.com>
 <9bc6fecf-3234-4b46-8bad-84d93a5e030f@cherry.de> <952C109B-6A6C-4388-B937-6200BFE718E1@arm.com>
 <120671.1765463343248308488@lists.openembedded.org>
In-Reply-To: <120671.1765463343248308488@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Dec 2025 16:19:45 +0100
X-Gm-Features: AQt7F2rBv_OZINk2LM0bBzjT7l2_8Yly9Zgyyo6AEPbF-ZzZc7QcwoypSatHlrc
Message-ID: <CANNYZj8eLa=GtnkdxmriVmzRt-kh832c2sx_FsJgSef-HcrOLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Add HOMEPAGE variable to several recipes.
To: Pascal.Weisser.ext@karlstorz.com, 
	Quentin Schulz <quentin.schulz@cherry.de>, Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 15:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227545

On Thu, 11 Dec 2025 at 15:29, Weisser, Pascal.ext via
lists.openembedded.org
<Pascal.Weisser.ext=3Dkarlstorz.com@lists.openembedded.org> wrote:
>
> There are several reasons for this change:
>
> First, according to the recipe style guide, HOMEPAGE is a required variab=
le and should be contained in all recipes:
>
> https://docs.yoctoproject.org/dev/contributor-guide/recipe-style-guide.ht=
ml#required-variables
>
> Second, the recipe linter oelint-adv also wants HOMEPAGE to be set.

Sadly the docs are somewhat inconsistent there. The section says
'required', but on the other hand 'should' is usually interpreted as a
recommendation, but not a strict requirement.

The actual enforced requirements are in the recipe_qa task, and from
what I just checked, only SUMMARY must be always present, while
HOMEPAGE is required only when SRC_URI is fetching from external
sources on the network.

oelint-adv is a 3rd party linter, and things it suggests when using
its default configuration should not be taken as guidelines for
oe-core contributions.

> Third, the HOMEPAGE is included in the SBOM if it is set. It would be gre=
at, if every component would contain the HOMEPAGE to be consistent.

The issue is that following this principle mechanically clutters
recipes, packages, and various other derived items (such as sboms)
with entries that aren't actually useful or helpful to humans. So I'd
rather not do it.

> I checked what other recipes are doing when they just provide local files=
. The recipes mini-x-session or python3-dtschema-wrapper also set HOMEPAGE =
to "https://yoctoproject.org", so I thought that would be the accepted way =
to have a HOMEPAGE for recipes that only provide local files.
>

This patchset has now merged (no one made objections in the patch
review, and RP took it), so if any interested parties feel strongly
about further tweaks, they should make them on top of master.

Alex

