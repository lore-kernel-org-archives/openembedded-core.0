Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0FFE7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 10:06:42 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.7270.1733393199212943470
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 02:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WgfG0bwX;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so6436006d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 02:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733393198; x=1733997998; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3/Y0mxuqD/ew/V5uSnB+6ju0IRfx6SZ9XdQ2xdwagSY=;
        b=WgfG0bwXmJJx2RaSDDhpb3EvTtyzaHkqcbfh8ZBwk+z4ltF+YzwkwqoAeLLcvZUHDi
         yEhHQqMR0mK19IbyzOetJw/htPj6FJfx8C0I9yVMMq0WvsR4wX/5h+C6FvUSdA45PkKS
         VbQPvDhaSzZPZsf9VWYsIpB/vrRzWp3WxBpSPWDBHVhbTnRpKTg30q+jF+COvNn/ql2H
         m5sd7NysIlAr30jw9Cx7u93mq0WWIM0Xy8kXeXQQQm8kTE06NOLfS4CyD/1T1W+EQ2Sh
         skJkbaCAspcs5XCQ+4DXRzfIaRu95v9HTfTphBPOFFaBPRWQjTQtL+Nnnbpzqbq4Yqns
         wTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733393198; x=1733997998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/Y0mxuqD/ew/V5uSnB+6ju0IRfx6SZ9XdQ2xdwagSY=;
        b=p4UGXicHg9nPBDHlOAGgm7c1ATFJJTtbHHk5PG3KuQM3d41PVEjLNIDHIu5k1Hp4/q
         gyBJxBvTXDYnNPe4zhzWqZiKkB/YeIUk5EaVdU9FqEm/mHLYLceLZ+QLvIWR+bIbkj94
         9gD77ZwRMqZViesbNacZfNpbHkDDGljtQYhWCcFWBKInysoLN+WvlLRVuuy3FrZjHw3H
         BhC7CKlhbNHHHO2swI2MSPteyhZ9CYYtwTtaQqQJB5zwHFHfY2gSVZPVaIf8HACRH8A8
         ypPVuZI9bOca0+okULrIrQe6L8bK+IxVLz5/18Zdp8mm0x42lkVP2c/H8a9FC9NbxIUr
         LuBA==
X-Gm-Message-State: AOJu0YwZaSGGCIjxPHR6P4Xj/Jb4iXbLLPs9KDa7c5KyII5gMchHcFSG
	nZ6IREV/W+9s5AbFDrONqCSRPhWoKVs7RPBfUbsXNlKrxBWo5IqO/N2TQ0n34hiJyFIWi9avGbZ
	7WeOxr+rVrkPLYcXw4cgPZlRkYTs=
X-Gm-Gg: ASbGnctdZx0n3JxGczp5oJnIdEMOQCWGJ+avYkTdjRobUc2W7ZpVlcDTE8+pEyDc3MQ
	z5FJiC4Np7wPmfwzVlwuGoX4VSBqiiP/eHZp987lO7tcgAn51NGkuvHJFjFcXug6v1A==
X-Google-Smtp-Source: AGHT+IG+VafiDAted9QzxfAOVezsTUPbZzL6FvMDQCPDXqjco1GDCrb8dA1oqo5pA5Z2ZuPXaMw2DMXYF7Lhe5LbOcQ=
X-Received: by 2002:a05:6214:4106:b0:6d8:9832:75d0 with SMTP id
 6a1803df08f44-6d8b737be0cmr163566576d6.17.1733393198262; Thu, 05 Dec 2024
 02:06:38 -0800 (PST)
MIME-Version: 1.0
References: <20241204120838.141829-1-alex.kanavin@gmail.com> <D63O0ZMCX6IJ.2V08S8OIMA8KS@bootlin.com>
In-Reply-To: <D63O0ZMCX6IJ.2V08S8OIMA8KS@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Dec 2024 11:06:27 +0100
Message-ID: <CANNYZj_P=3e++=WSGrCEA_6C02H5M5fp2p=cQ4Mad_7a_xexNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] librsvg: update 2.58.2 -> 2.59.2
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 10:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208372

On Thu, 5 Dec 2024 at 10:39, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
> Sorry but we still have the same error. Looking at the patch, I believe
> it did not change from the previous version. Maybe some issue while
> sending the v2 ?
>
> https://valkyrie.yoctoproject.org/#/builders/65/builds/595/steps/11/logs/stdio

The difference is that one of the patches needs to be applied to a
file in the source tree with CRLF line endings.

v2 does this correctly in my build, but maybe somewhere on the way to
you it still got corrupted. Can you cherry pick from
akanavin/package-version-updates on poky-contrib please?
(I just force pushed there so do a git fetch first)

Alex

