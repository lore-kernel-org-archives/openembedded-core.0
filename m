Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE63C48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 10:43:41 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.39025.1707907420119424997
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 02:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VuggarZp;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5119cfaec3dso560917e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 02:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707907418; x=1708512218; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yYEYPDhkuttMPx7iyv739IYiQJ2YovYa7/qLIo7ONig=;
        b=VuggarZpAZ0kvb/c5cKy3IwvCbCD/OvonHF2S0jWnhkK5lB4DXPOPMJRJzEsRjNrQR
         CbsJPZwV1PnR9D+V+9A4f963e6jtFfbj9rDJEH4RNjh1+kzUoSmNOlhWGP7KvhdgI9Is
         O6KJSiBaTfDmfxaYL7i/uR6bHRLu3AhDUV5MbNWtKhHc+L2/OSbxSE41rtqdTgg0MexV
         TLY57I4zZJLsoZtnfWkSAT8d/H7k1J4nydIdCEkL2pVMUu6bTTbR1bDfp1uxv7aLrF2q
         pqzmEZWvh2GBQsIi7KH+cxo9aDh238QgjQM265IAicIR6AvdG5KTpt4EEWqRG5RZeU3R
         Vfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707907418; x=1708512218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYEYPDhkuttMPx7iyv739IYiQJ2YovYa7/qLIo7ONig=;
        b=Epm88oZPcOqZC+gtNBUYq2e8Zqki+pLSqqeIuZmvnT49UNa6mn+250VJm3BcY2o7Ub
         gcZzUe52A5SlYG/zc0kDOEBdu1QqwrJlQlX+nK2rYlBx6fiLcss3ccVvuHA5cHIc9pHy
         wWKf5X6SZIP/Ybj/yF28wvbeXOdQHLl9LJtdDP1qGRCxhP+wacvlra/Dd/m1jb0tBoWe
         Ut9G8OHl+IIza+5qyg/zw9hJYOxo8PcSOvxWf4Y/4NMa+HUTn4/S7JhUteAa+S/uetBR
         kUD2zmvbtENtJGaawv0TTi5/hvrKh5hJG0J1zJ9dV5swOKrRi+/Zfm+d83YjmlHPFWMG
         6HXg==
X-Gm-Message-State: AOJu0YztEuM8oTMgLvmU6BKvOflGId5ai+GXKzTfxI4WBEt1VpTBkXVG
	dDIijxekXHRq9smR8G8DoZJPATXdkkgDdiWlZfhlUch8qu0CBaXFwNE3nLmijcNY0MU00ikN7Eu
	rI41M8kpxZSejdeliuX3ZIUJEMzs=
X-Google-Smtp-Source: AGHT+IGSRj8qZ22CUJzrHx0Fm/H3G9rw3Uqw9senoa0JB77boQfYL23cxAS9wIqc44TgvJ0BZXD0o8ts7K5YrP9v9ss=
X-Received: by 2002:a05:6512:4c2:b0:511:6bbb:71ca with SMTP id
 w2-20020a05651204c200b005116bbb71camr555884lfq.27.1707907417937; Wed, 14 Feb
 2024 02:43:37 -0800 (PST)
MIME-Version: 1.0
References: <20240213221846.109260-1-adrian.freihofer@siemens.com> <20240213221846.109260-4-adrian.freihofer@siemens.com>
In-Reply-To: <20240213221846.109260-4-adrian.freihofer@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Feb 2024 11:43:26 +0100
Message-ID: <CANNYZj-tLg+OXvsu83wPgxnNnQSoh5aXr8SB-8ot0irfGOrVfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/4] oe-init-build-env: generate .vscode from template
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 10:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195463

On Tue, 13 Feb 2024 at 23:19, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
> +    "bitbake.pathToBitbakeFolder": "##OEROOT##/bitbake",

I wonder what in vscode needs this path, and why? The reason I ask is
that bitbake executable itself is already in PATH, and hardcoding the
path to bitbake folder like that is problematic in setups that use
separate checkouts for oe-core and bitbake, where  bitbake can be
anywhere.

I'd suggest using ##BITBAKEROOT## replacement and have BITBAKEROOT set
by vscode-specific setup script (as suggested elsewhere) from parent
dir of 'which bitbake'.

Alex

