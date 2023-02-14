Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B346C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 08:46:33 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.2330.1676364390945040923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 00:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nVys4qyJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id bp15so22430155lfb.13
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 00:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4aherxQtqivFn6JLbfFV/R7ao6Ap0vGfV9R9muSG6dM=;
        b=nVys4qyJxOgEp4xUGXpC/pLU1VvAYGeGokllkAtsSoGCR3O8KvN9lc834f6E+3zjmK
         Rr/Ii7jcv6zCjc+1tcYitDgJYIKZV/7iL+ayLIaJYyXI3WIa50EhsKrK3HXKRoPmBndo
         3dJ/S7/+6XTRzY3Sz9Dh627DaVzfN/bzBDjNY5GRDTtkHCAsFthRhPu3mDkt2pHRIcmm
         vmPZ6Pf2ooCbdkHiI76oIfrgGE4E8QmYYrtJFP1AQpTV/3jh9OoPOzsqtie+C5NjAsIg
         Djkh9U2MFNADoXzran2uyScXui/EO6evm775ihxo+vQqvGpZcMUDrug/cV3pbhceAXnN
         3m/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aherxQtqivFn6JLbfFV/R7ao6Ap0vGfV9R9muSG6dM=;
        b=FpfQ5R28qyzzAvI2aTd1qraOTKwPLuTtQXiwANTzrh9ASnLUzGzb3J4q0DF2/YXUPW
         nDXqd9U7Odm7bB4j6m1lkJTXNtKzKMsKFyRld39RZcJZMTgQ7Oh6Em2aHZh6wW8wpouU
         jNrUHDk04qhYH7yjyE272nmgL8UayNHcE8n8w5aJi//Oa2D8dLZ64XFUe4v26lBrfE0k
         iYB+W/CQu/P6XEXZLaYFYCb0/TNwZEKNhc5oFhabXW506G3ks2pJh1UVpcE/IiiTHab0
         3605t8druSpVMT+Jk2HsSurjSR76stPAPOLT28dxfJLJXGmGFvP8SyxI70nnmbDxLtN8
         k6iw==
X-Gm-Message-State: AO0yUKXNo3wvsWFsTHTFJTm6yN/0wzSrhwslLsP0pc/Yc1K5WYz1tMIb
	JgFelFDKr7CYowJ5SrXhAkKenF06a9gKnZKHDIw=
X-Google-Smtp-Source: AK7set/N3jLzukEPdRj5Egl30TU2rE1GQLXAHhtOjlHaOmH+EgbTa4SWNGKzn6JKxz++ziHIQOYbbBz+rHCmGp+5PhI=
X-Received: by 2002:ac2:568d:0:b0:4d8:5137:a89d with SMTP id
 13-20020ac2568d000000b004d85137a89dmr100390lfr.176.1676364388796; Tue, 14 Feb
 2023 00:46:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1676363203.git.liezhi.yang@windriver.com> <6d40f0d943ede3088c8a3f77ef2ee1b7442ddda3.1676363203.git.liezhi.yang@windriver.com>
In-Reply-To: <6d40f0d943ede3088c8a3f77ef2ee1b7442ddda3.1676363203.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Feb 2023 09:46:17 +0100
Message-ID: <CANNYZj_0LP2wtFkh281=Vp67nqdCfTW1UMCYvFfXvPek5VyANw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] rootfs.py: Set PACKAGE_FEED_ARCHS when it
 is not defined
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177130

On Tue, 14 Feb 2023 at 09:28, Robert Yang <liezhi.yang@windriver.com> wrote:
>              self.pm.insert_feeds_uris(self.d.getVar('PACKAGE_FEED_URIS') or "",
>                  self.d.getVar('PACKAGE_FEED_BASE_PATHS') or "",
> -                self.d.getVar('PACKAGE_FEED_ARCHS'))
> +                self._get_feed_archs())

I have to say no to this. All three package manager-specific
implementations of this function already handle the case of
PACKAGE_FEED_ARCHS not being set. Are they doing the right thing? If
they do, then this should not be necessary. If they do not, then the
code in those implementations should be fixed,but not overriden like
the patch does.

Also, rootfs.py should not be mentioning any specific packaging
format, that's what those classes are for.

Alex

