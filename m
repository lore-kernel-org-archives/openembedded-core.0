Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B758C4707B
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 10:45:50 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.8881.1704969947057527289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 02:45:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mkzAoAsl;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ccbc328744so62039881fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 02:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704969945; x=1705574745; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UIPlMr5LRjDt/eHVcG1DjOVzKpnvJhU8sX8keeZVsBQ=;
        b=mkzAoAsls3kPu6Wm26attueppvJYcUkTYM72nCLQyL3rGauUbzL+iZzDjXX9vqghDU
         etH/5IwFfWT1Mk4Y0bDsICyVSFboZCSxtOCBw8bNc4okoV8MaubB8+8oMnp2tmyX8H3W
         wfu/0OnAjBugLepS9iWLwPFXN0Zg7cPkrdHRtdakHrGLYXjwyw0pa4+G+sv3IpRPnJ7r
         PobZfEUiCXmwvwM5PbzUe6xjFn7jPWvm/Nj8ojScRXIfGWXLHbMQspiB4uCd6yA7W0XR
         VX6AYSHKTFckrPGqgah7R8HEStkYWRbsxhbN2QVaIDionMIqadeziohLI3KQuLsoMWUO
         6Fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704969945; x=1705574745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIPlMr5LRjDt/eHVcG1DjOVzKpnvJhU8sX8keeZVsBQ=;
        b=fXvlMCfDl7SMTN59AlNbXirWuh3jhetAKJLv2CIXlABW8xAvtY3fKipjjilPxju/lW
         ZiBUqurO3gRVT5mH9vDMLVrmkvCU/9BgDKTXm+Tgi9g69FVfOIvQCBqoDeSqYvpMADR7
         B2GpHi8/7o0MogW/XEVPKEpkd3I5VwHwu+UbfdqyfXIe+n6Zx4obqolQUZd+fBdhMkTk
         Mt9rDFlSfkKJSx5wdF9ihx8m7coCPDjWl6gF8FeKKM6pwOq9H1/WEcDFJ7XyVS7QKAbe
         4CXJEQ0eXH6KfJnaIcI/yuJfXyFU90S7/go6auMiYHXoAuv6qtNQ+ZccajSfxJG9eTQY
         Qvyg==
X-Gm-Message-State: AOJu0YwgDJOLW2WPlrYpEKQEwOqVnjhnXE3iObRMWvP+5rFSAETdB5NR
	mOPOXMEATmzJHm34C1wFrf21EeV+jAATGAQG1x8MKYnM
X-Google-Smtp-Source: AGHT+IHC1djT5S2PJoebhmi5BolVh7SfQoCtqnWpzT0nOe8Df2FLxBA/pbtfOKGVKYXNSzQXiVZEpL5juCCm3Snaljs=
X-Received: by 2002:a2e:b70a:0:b0:2cc:de09:ee92 with SMTP id
 j10-20020a2eb70a000000b002ccde09ee92mr259854ljo.27.1704969944898; Thu, 11 Jan
 2024 02:45:44 -0800 (PST)
MIME-Version: 1.0
References: <20240110211203.1471586-1-joe.slater@windriver.com> <9de219cb-2f81-41ff-899b-9b65543e9502@windriver.com>
In-Reply-To: <9de219cb-2f81-41ff-899b-9b65543e9502@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Jan 2024 11:45:33 +0100
Message-ID: <CANNYZj9Aj-6v0ib1YpSSyQ+jWJSU3OfYQecorqVessZJ+Q0f9Q@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] eudev: modify predictable network if name search
To: randy.macleod@windriver.com
Cc: joe.slater@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 10:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193539

On Wed, 10 Jan 2024 at 22:54, Randy MacLeod via lists.openembedded.org
<randy.macleod=windriver.com@lists.openembedded.org> wrote:
> +++ b/meta/recipes-core/udev/eudev/netifnames.patch
> @@ -0,0 +1,17 @@
> +eudev: consider ID_NET_NAME_MAC as an interface name
> +
> +eudev might not create names based on slot or path.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>

Please submit upstream first, or provide a reason for Pending (and it
better be good).

Alex

