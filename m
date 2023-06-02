Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDA5C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:40:27 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.7983.1685695221319145305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IVDgpDrH;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f3b9c88af8so2394442e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 01:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685695219; x=1688287219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4r84CNI0m5NZEHXQxBBvlnuxkwQlvVr/TH0Cqj8pEK0=;
        b=IVDgpDrHCplyP1uw256ijh6yxsKWcqzs+KQ0h4sO75mu7COtYrt/tTI/Y/1PzRF75R
         u/EZeXIHnMHsGr7WlbyTuVUQP8aKWH49doLf8UG7/7zZki5jx8psBFHN5wG5xm7mrB7b
         +3Uiz1Lh8D+bq4fS21e1exFjhCkTPE8SMZTyyZQYMxSNuBpYcWyIG47bCIzbM640TbAd
         blGvcEkqWBKfrjCsk4LA3w8QtLfYR9emCBgjDpCNk5w+SQTAdCqPT5fVqnF+PggAvUER
         hdtZ8a+F+Hf/3umhMP7S6UHuX+GZps1kj3q0rsg9ATc1Dz4HHyMzrjo5XaHwIlC7e6C7
         AS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685695219; x=1688287219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4r84CNI0m5NZEHXQxBBvlnuxkwQlvVr/TH0Cqj8pEK0=;
        b=UnXq4UpWaz1VBuu4J2PWj/n5FBvpC8hNEJd0ZySc7LZh5JqlqUNilBHYIRW3Qf8gqZ
         0m735HolHCxLllhaVASEOOxzBMGxyvdtR95OHxDveyUr6TL+Dn/3U0AzQE/F6R4mUusq
         LeuoJdhXHK+GX+ugTfYuEmoKr9+aifyuMzngyxDLmTR5UUG9G2ZKqR9ahCVfO8n8eaWd
         i5E56qD4iJ93CQungEkq8WcDZ2LQhs+FZQ8qTcY/DHoReJVxUs42SfhoEpQrKM0rpeuK
         fFet3H2vTx0Sn3JZGpO5KnJKTmWMkphMDw7VWCP5UGXvd0ofHGqExi1HwwmKfT9C5YCZ
         KY7w==
X-Gm-Message-State: AC+VfDyfBDmfxZzfD9fIhGD2FPAb1hiqJ6RC0aHdijH/Xchv/m0ATyFW
	TcOjln4tVbKEvQhqRraENxvfl45p2bQRBfbJeS4=
X-Google-Smtp-Source: ACHHUZ67TNZESn3faVGv4Y8IFsYOj1MIZkc1caS6w/pMO1MyVAoPsI7gM+QRoLkbGB/dkY+F56ecBOdFzOG/odbmgoQ=
X-Received: by 2002:a2e:984e:0:b0:2af:8635:96b6 with SMTP id
 e14-20020a2e984e000000b002af863596b6mr980660ljj.42.1685695218528; Fri, 02 Jun
 2023 01:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj8hoBVZ78NE4kDk+ZRrUGSyBUkiTC7SZkq5VrKkr41=JQ@mail.gmail.com>
 <26137.1685693907253395335@lists.openembedded.org>
In-Reply-To: <26137.1685693907253395335@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Jun 2023 10:40:06 +0200
Message-ID: <CANNYZj-j7y6AqOs+1cN3yJKRU6_SAhhxkL+c-DkMEPMmnZMR-A@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH V1] xz: add ptest support
To: "duep.fnst@fujitsu.com" <duep.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182294

Thanks for clarification, please do the pull request as well. Patches
over email mean that any discussion about them with upstream is
visible only to you, and we can't see who says what and what is the
outcome.

Alex

On Fri, 2 Jun 2023 at 10:18, duep.fnst@fujitsu.com
<duep.fnst@fujitsu.com> wrote:
>
> I read the 'README' in https://github.com/tukaani-project/xz
> It is recommended to submit the patch via email to 'xz@tukaani.org'.
> Later I will try submitting a Pull request in 'https://github.com/tukaani-project/xz'
>
> duep
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182289): https://lists.openembedded.org/g/openembedded-core/message/182289
> Mute This Topic: https://lists.openembedded.org/mt/99259960/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

