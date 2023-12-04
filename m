Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D1DC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 10:54:50 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.66742.1701687282306187135
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 02:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QHMaFb0e;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c9f099cf3aso24506841fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 02:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701687280; x=1702292080; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3rj1pNQa3L9gvh6cjUwpO0Bg6xqZhPgeXDckHB3dWDg=;
        b=QHMaFb0eyHLtmOq8FcjjVMNi3s503JMC46lDtpa6IZnOlhz4DT0uzRugg/X29JpeaG
         Op9YzYB9hakg6U0Nsmywx8CGGlQhQDEMFgfMPDVmUTl3kn3JyN4pcpAAezxOzzi6P7GC
         3ByY94hiYWYQzpwCKfc6m9HAWINRiMvWVh3whOopXGIorPNZeyu8dknSBR1XLXsug2Di
         x97QhjR1BfR1tc0QF6GqgLD8Osd55MhTt0X0jUep422dlIsq8uFnSy61eKvurfLcVuVO
         spMOgCufZGhyU1FtobNUA4K7D8SdtaC5JMyyeK55kZWbZKdHCofKxf6qDLWaZDCJVgX/
         wSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701687280; x=1702292080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rj1pNQa3L9gvh6cjUwpO0Bg6xqZhPgeXDckHB3dWDg=;
        b=QKBuPE9K/ZahccrrXGu/CM9gAo40HzJh3JvTu5mwjoU84rIbGWbfWjitRqQjA3Vc4D
         kpZDkeEzBv557VkTm78zRU1r/3pedc7eRwph+tlWEI9dvjlwtoWBRsDgU8DpBrSz18bc
         xn/MZJKh2KJlBB2qihW96Q5ZiYxFlSTnI+IfUe0KkKS22RvIwQQmOca9Waj/AVQocDTr
         veRgXl8nlieEU6I+uyEuN8npeJiwm2KsRcNeA+lUSa31hUr7ieyCcnE33p3ZXNsPQKox
         eeoWxx2Lp1Nukr+Xfh2Lt5Ifxe4F2dv1D/Rdb0lL+ClvyT9YC4N+1PrQ7Y3iuFnPgyPl
         znrw==
X-Gm-Message-State: AOJu0Yxmlbt4NTECyN9N327Aubgold+kbMBubLG6gUhkpXFrQVHt5RnL
	rD6KDm3rfzUEbF3V7IxTje2K26maDPmgR6UvJ5w=
X-Google-Smtp-Source: AGHT+IFQAK+GRxXnnkKAZQEUH38oS26BVdvQbLFLBvpagDQAm9tGGTOGOuD2XrDYXjhqRxELDrNbBD98JMTGrDIyRPc=
X-Received: by 2002:a2e:9c14:0:b0:2ca:d14:96d0 with SMTP id
 s20-20020a2e9c14000000b002ca0d1496d0mr217108lji.71.1701687280020; Mon, 04 Dec
 2023 02:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20231122140811.1021807-1-lukas.funke-oss@weidmueller.com>
 <e784d0eeb3b0232f0df98b385ace92dfc625c191.camel@linuxfoundation.org> <8ca92320-0ab3-4679-9de1-74f38ad0f8a7@weidmueller.com>
In-Reply-To: <8ca92320-0ab3-4679-9de1-74f38ad0f8a7@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Dec 2023 11:54:28 +0100
Message-ID: <CANNYZj_kV6ZEnFa3-dnFQqhSUGUy7ZE6DyGU9fzqZwsKGw=6tg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/2] patch: reduce changes during patch refresh
To: Lukas Funke <lukas.funke-oss@weidmueller.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Lukas Funke <lukas.funke@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 10:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191733

On Mon, 4 Dec 2023 at 11:48, Lukas Funke
<lukas.funke-oss@weidmueller.com> wrote:
> Unfortunately, the patch indeed causes the tests to fail. The
> problamatic lines are in the 'lib\devtool\standard.py':
>
> if len(firstlineitems) > 1 and len(firstlineitems[1]) == 40:
>         if not firstlineitems[1] in changed_revs:
>                 continue
>
> When the commit-hash becomes all zero, there is no way for devtools to
> detect the change. I'm a little puzzled how to handle this situation.
> However, I still think the all zero hash is usefull since it will reduce
> the noise when developers review their changed in git(lab|hub). Maybe it
> would be for the best to remove the check?

It would help if you provide the context for that code snippet, so we
can see why is it there, and what is it trying to do, without having
to go and separately study the code ourselves. Patch review is hard,
please do not make it harder.

Alex

