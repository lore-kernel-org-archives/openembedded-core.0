Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEE2C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 08:50:15 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.18490.1701420612770949529
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 00:50:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OMkUbbZW;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50bc39dcbcbso2609476e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 00:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701420611; x=1702025411; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AUm9mTEh0j9C9U13LNTHk5EgdJcyB3zxTqUr+0ccNlk=;
        b=OMkUbbZWdxZrtJVRohjR6C8mubAFxBn8lZuiNB4WM6TfXlyt13T5ZTLUs3WIryd/AH
         8gIkszihG0/SEIsiwHiaC+vizGpua51FOgHc8Yh4Dm2QHrnq1TlygOJ42rbpt3GckZMq
         MT/Z7IZ6EeEni+xVzFr6G/no1UJSknCPqVx/+94WuhQNNEJScmuUvATzj41VA7RLe5ei
         yu3XmoIaN4ScvDESu/idEH6A5U1M2sHXM3otiGtQ8uhCjIAmUG0WvRifDLXsEn2VENGA
         kvno55Xg5DmvuShbD2IP4jtpxYYIP3HIxSAKkBSvCGpNvqSQRsVlDZ3YQpzgzfMIhpqH
         LOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701420611; x=1702025411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUm9mTEh0j9C9U13LNTHk5EgdJcyB3zxTqUr+0ccNlk=;
        b=Yd1E+29nivv9Oo8+ZGhu8LpJRTHGDzhjQB9Nm/QBPAIR/0UBZTMtreu4dQfCwNEM0x
         54OQh+VyOlmEQDOxO4LUJyFY0+mdl1KXQYYtXzoe0nPTmwqfFLjjshWHs5a/X1FWXZwA
         VOBh9s1eJkQ5jhRVG1P7bsdr16/XLsz/JFzJ7Y7iErlGv0Pn4Nc+mrjPb870DrIu42MN
         yUUVqEH3PcUzbMBwqfQGh/CwFZQM6G8sO5JWXtjHAjbwTqjxo+ydM9fSoybg7tu133eh
         0A5/luuiio76u8CYwo4C4gldhXvQDNhVgWG2qxc55vQwkqB+SeCZERuoLY/e9cgZtd6o
         +1Kw==
X-Gm-Message-State: AOJu0YxGutxRuEAXH7j6T6F5NVAoVwsvc1KtCxlLXzZLZ75kX/RVOIb1
	cr0sCaF/kjvi0VL+EKlD/XieSKSYqQ4yueXLPPRuC3GA
X-Google-Smtp-Source: AGHT+IFxrK5bgjToR71/qyUnZf4g/PAoL7QN8pZMNyBIELyrvwMm8DKfGprSUfgvLzGqwGaYDlMEjbmmOYmRdrCaigk=
X-Received: by 2002:ac2:5982:0:b0:507:c872:7f84 with SMTP id
 w2-20020ac25982000000b00507c8727f84mr492355lfn.29.1701420610713; Fri, 01 Dec
 2023 00:50:10 -0800 (PST)
MIME-Version: 1.0
References: <20231130220156.726263-1-jstephan@baylibre.com>
In-Reply-To: <20231130220156.726263-1-jstephan@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Dec 2023 09:49:58 +0100
Message-ID: <CANNYZj-J4NXTqFaErdwhEpkPB4dmH+Nvy6Vzi3DFUt-v-we=rg@mail.gmail.com>
Subject: Re: [OE-core] [RFC] [PATCH 0/7] Several fixes around recipetool
 appendsrcfile(s) and oe.recipeutils.bbappend_recipe
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 08:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191563

Hello Julien,

thanks again for making devtool better. I don't think there are any
particularly strong opinions about the finer points; at this point you
know the code better than anyone else, and so I trust you make the
right calls :)

Alex

On Thu, 30 Nov 2023 at 23:02, Julien Stephan <jstephan@baylibre.com> wrote:
>
> Hi all,
>
> I was trying to use recipetool appendsrcfile to add a file to a recipe and I noticed several issues:
> * -m is not correctly supported
> * recipetool appendsrfile(s) are missing a usefull dry-run mode
> * appendsrc function relies on oe.recipeutils.bbappend_recipe but
>   duplicates some code: it constructs itself the new src_uri entry
>   although oe.recipeutils.bbappend_recipe is already doing it
> * we are lacking a mode to patch the recipe itself
>
> So this series tries to fix the issues above, fix the selftest
> accordingly and add new test for -m and for "patch mode" (update recipe)
> and also add a way to specify the name of the file to add
> (in oe.recipeutils.bbappend_recipe)
>
> There is still one point I would like to discuss:
> I skip test_recipetool_appendsrcfile_existing_in_src_uri_diff_params
> test because recipetool appendsrcfile(s) used to not add new src_uri entry
> if the entry already exist even with different parameters while
> oe.recipeutils.bbappend_recipe adds it if parameters are different. So
> we need to figure out if we want to keep the old behaviour and if we need
> to patch oe.recipeutils.bbappend_recipe, and update the test or remove
> it.
> I feel like if the parameters are different then we should add the new
> src_entry (so old behaviour was not correct) and remove old entry so
> either use "SRC_URI:remove" in bbapend file or completely remove the old
> entry in patch mode
>
> What do you think?
>
> Cheers
> Julien
>
> Julien Stephan (7):
>   recipetool: appendsrcfile(s): add dry-run mode
>   recipeutils: bbappend_recipe: fix undefined variable
>   recipetool: appendsrcfile(s): use params instead of extraline
>   recipeutils: bbappend_recipe: fix file not added to SRC_URI if name is
>     specified
>   recipeutils: bbappend_recipe: allow to patch the recipe itself
>   recipetool: appendsrcfile(s): add a mode to update the recipe itself
>   oeqa/selftest/recipetool: appendsrfile: add test for machine
>
>  meta/lib/oe/recipeutils.py                 | 51 +++++++++++-------
>  meta/lib/oeqa/selftest/cases/recipetool.py | 30 +++++++++--
>  scripts/lib/recipetool/append.py           | 60 ++++++++++++++++------
>  3 files changed, 103 insertions(+), 38 deletions(-)
>
> --
> 2.42.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191544): https://lists.openembedded.org/g/openembedded-core/message/191544
> Mute This Topic: https://lists.openembedded.org/mt/102903929/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

