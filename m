Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066A1C761AF
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 18:56:04 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.28503.1679770553443218061
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 11:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SUTZkg2p;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id x20so4981906ljq.9
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 11:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679770551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qGay0ullRY/Lvrvjl1AEmrjTbq2AWJlgjDsLKSUMVtQ=;
        b=SUTZkg2pDvl7pcdlwT4PBZuJb6lXwRer2ZQWzgnwnyu16ElLxRXICia4AULCN07PUX
         /7ejUc6thhsAXwQ6j5sOHpzz36D8ol7lYlhKfuhf2HWrJcLW0Ma77//Or0C0PNFg1+GI
         5EHYelUC2VanfMkQz6Dzjm7vqTBigxwiTWGa3XY1CXoKgXg5O3PCK6iox1ZWnurXfyCn
         qgnIyA4UuSKsiqatSThNvwlFU5UAibrsYNb1tyc39RuS/rHUO4KSD+PJnFw4xTrOx6Hv
         0N6FsSZRssWbyFaZJccVY8FHc3JTWiP6At+kzv9SRZcaMHcKfFeE9PQkHyS0WV/wHw2Q
         yxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679770551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGay0ullRY/Lvrvjl1AEmrjTbq2AWJlgjDsLKSUMVtQ=;
        b=muvtR13lqtE0s2Xtg4V44kKgxrchtLXQRIlg+9ka9QzZuGwOx8aEpkmKpp+1Mco/O+
         xSy0h+bOt2nA7Q4/tMrna69LPkrF2iQFWuBijShghMk1jakQsy5x+6TKJGyUuGLyI7Yc
         jS5m1OcGmB/YFdOcB6sdnIenuc+oYdtdvz/LrDanC4eEWWwexCQWuNpxLEC2tFH7karh
         VRCOXGa04aHepzPRj89thjlfPd9h/4+t+feh29NXqKJ83Ef5hZsYGApreBQ3muBaHV7L
         Q4C+80YJR+2Td0CUalkJq12SFoS1sKmOlushGKGptRWPBgIR0zdYpmryo2R/XEt3pOTQ
         IieQ==
X-Gm-Message-State: AAQBX9fkFvGayXv0Zh+jlkvtPHIwl6WPn0k1/E64vIrBowxfbt5pJM9d
	2GkwL/BH8OFZwvIt5dpV/g2UTpJWLKq7yRok6kk=
X-Google-Smtp-Source: AKy350ZNdLLyrnhdGr/aROSuC6lA3MUGNmPhrkIGJOiDqcTihn/75UXuGUfTpJNTsVDeBbE2h+IgEipkuOz+VfAJCQo=
X-Received: by 2002:a2e:6a12:0:b0:29a:9053:ed22 with SMTP id
 f18-20020a2e6a12000000b0029a9053ed22mr2055171ljc.7.1679770551590; Sat, 25 Mar
 2023 11:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com> <b48dd61e593e57d7673b65a34a44cd304cb7b7b8.1679734210.git.frederic.martinsons@gmail.com>
In-Reply-To: <b48dd61e593e57d7673b65a34a44cd304cb7b7b8.1679734210.git.frederic.martinsons@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 25 Mar 2023 19:55:39 +0100
Message-ID: <CANNYZj9P1fAvs6kErzVogStEwuPvJOYRLHOWn6Q3PKaNFXu7PQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] devtool: add support for multiple git url
 inside a cargo based recipe
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alex.kiernan@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 18:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179103

On Sat, 25 Mar 2023 at 10:01, Frederic Martinsons
<frederic.martinsons@gmail.com> wrote:
> +            if url in cargo_git_deps:
> +                local_srcuri.append(url)
>
>          d.setVar('SRC_URI', ' '.join(local_srcuri))

What actually happens without this patch, and what does the patch
change? The commit message isn't making it clear.

Adding special cases based on custom variables is also not great; why
would git:// entries in rust recipes be treated differently than
git:// entries in other recipes?

Alex

