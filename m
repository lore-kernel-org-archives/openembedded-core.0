Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72E1C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 07:57:37 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.5622.1721116651544813523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 00:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jmyrffRK;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ea1a69624so5428855e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 00:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721116650; x=1721721450; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d9VSwSSVBRpsfW+HEn07Ts24TnO6QkfmBkl9aw0moIg=;
        b=jmyrffRKAlbGBs6ckXzeu9f+zIOoIC2yPBk1VtLfhaX8Kr/C/7sPO6ijHAq6tOieqk
         5HyygxcGNDbmWCJGowF8lkN894uFLmtnNISCgRnKX/eGdBf5UtLTsK1AeC/G1B2Td3+v
         ia6rH/5U2b2kIoC86qpDrrBR4XIcRvXxpNXzXLyywVJcbsdUGBpc3mRhlOFGxxFvZf/Q
         12IDeUC7GpkxSB4+V06bYSjzwCWC1fEyr6m6fNbMbvpETisH5OGGs5RJwZys4SqrwZKV
         LBDTjqMfNAOS4rT8GM5s6fadTiEb3ITFyPvtXLxsxJP+tjAE0jJyF4KshSxpmTMBoUZ9
         Motg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721116650; x=1721721450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9VSwSSVBRpsfW+HEn07Ts24TnO6QkfmBkl9aw0moIg=;
        b=DfGA0lUhU5YEcigY88+Rukdjxo9Eszx8xi8ByHUgldpo5AVH9CN/m6sXMNjS/9yR1m
         z7mlBwjVhtMkWXLpHg5LxcYRj4TONwS7Tz7pVjM6X3OvNNvlP+SBTuvuQ9nEWojmLggj
         LKtPhtMCTmrzKBteRbI1bpaJIp56tkII7jY85mGXjsJ/TiFKpEJewyTQYvaYo0Il2Dhk
         ze0EqMaUaxFcJU6jQSNhz4fksV7u7OjxFhvUndZMRbDiMWMdj2YwjZfKwmU2iQYMGArP
         3H2oz0r92qLbZUHam7SBkhHE/zQSH/oXS2VoJWACCupcdLOzcjrPjMSMfRC+tTxhvSA1
         5AHg==
X-Gm-Message-State: AOJu0Yx+HyK/n53ZI64myjyGCt8ct8OyXTUDArd4AgA+79XEP9ymXQ9G
	ZJHcdqCK23OB6Vg8djKVepmoDTrP9mukuy0j2wV+SHAzPpcpHfCUgyJisckE6Lh/FmyB6gCx0O+
	jTUhCG0JGEe3cxeytwq/kGk6PDboOVGMV
X-Google-Smtp-Source: AGHT+IFQmSS2FXglLZzFITuT6HEqUgwFBCtfxnZOS3GTTDUs2DewU1c9qZzsxblbGXUcyVDW7jAHUlLUacGSmHpcuio=
X-Received: by 2002:a05:6512:3e05:b0:52e:a008:8f55 with SMTP id
 2adb3069b0e04-52edf030cb3mr768930e87.41.1721116649420; Tue, 16 Jul 2024
 00:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240715190738.32206-1-reatmon@ti.com>
In-Reply-To: <20240715190738.32206-1-reatmon@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jul 2024 09:57:18 +0200
Message-ID: <CANNYZj9DXbuFwHLHZa2p8asasehxkDaGYoH+PuMWEbfiHFx20g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] package: Add support for INSANE_SKIP for incompatible-license
To: reatmon@ti.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 07:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202085

On Mon, 15 Jul 2024 at 21:07, Ryan Eatmon via lists.openembedded.org
<reatmon=ti.com@lists.openembedded.org> wrote:
>
> With the move to make more warnings into errors it is inevitable that we
> will need more hooks to skip the errors on a recipe by recipe basis.
> This patch just adds INSANE_SKIP support for the incompatible-license check.

I do not think this is a good idea. This was a warning before, the
warning was never fixed, and now, instead of addressing the issue, the
error should be suppressed so that it's *never* going to be fixed?

You can still revert to a warning if you so wish, but in general,
global INCOMPATIBLE_LICENSE is essentialy deprecated in favour a
per-image one, is there a reason you are still using that?

Alex

