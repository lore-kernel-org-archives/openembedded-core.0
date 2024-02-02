Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92E9C47DB3
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 13:24:58 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.22437.1706880290648401935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 05:24:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dtW3cCkV;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5113ab4ef05so255464e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 05:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706880289; x=1707485089; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sy3dUGJqC//0CBkzpSPZ8ABTzWXNdQK4Omp/Gy1LXR8=;
        b=dtW3cCkVc2XwajqjiOFTm9OQlZ4yjilyITbWv0OW2P892URaH5i8dDvpowIJLzzvWw
         1pYgrEsZXFoJ4lUsdlmPhMsNxqINdc8Ymp0bpU8GUnY/vlMkMebbui3SPHGF5d2rDMUh
         kuW9e0eR6hHKL2hM6MZHbxqFvMH+3dREwSPFwsajjS2M2anxOtCD+XMb1a/qiDqSKU0F
         cxYVjYazRTTkK2aQg6/GxxhvRDUyvsLD+AxpEvrowaRhaBGFJ0DCQia0T6a5VFBQ5Dnu
         BGWVn3fopWIMujyT71pPWnEB4APzYUm6g/Zj73/V5Gy1LorHQjhtxWixVrsKjIRgYwew
         Rwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706880289; x=1707485089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sy3dUGJqC//0CBkzpSPZ8ABTzWXNdQK4Omp/Gy1LXR8=;
        b=TxXkjfeGzFu4jWywpB+n6AMMHlMadq2EP6vhT+cmEhSctX3pmc4twnAYfMKcofhjpm
         5UnEBtFnzj1pW7kjP28dXXfYrYzcTmQBi/MQtX/YLDnb0L2nUPm18KcvvoeKFbSV9ejw
         I46zrH1xJb9a+4Vr2E8r7pfG8V8UHHpxpXAxyHn3ASZ5rn6yUji71MZSDW1WpcLbkQ9Y
         TNdo1M7LdMHGMCDDJ96Yj7fmqnHmSyPQTXMFH2cHJB7JOwvSBORO0UNKLhL3nhNZ16mi
         dPOrZif4g+RKvCHERjBBMVXEOZ4GMJk3u0sQnldGDr8Gn+3FtdbjxBV8aQzSaRrLalsM
         //dQ==
X-Gm-Message-State: AOJu0YyWjo29ISDFkIeEGB8pXLdPvqBtaoth5kTfnXbUKDPyQZgZWeJm
	jNdCo9j6MRQ+3JN3KF3oeqYgdbcIVwx8LAW24LL4vZyTCxXtHpT3ZJYxgeQRAYml4xhF02DjHni
	XmFG1+HQMF2sCNsG40EX7cBw966Q=
X-Google-Smtp-Source: AGHT+IGfkH6dF/TVwqqrTOo3WgC+6i8k42wWZhOhXGHgII//MRPorxz3y+z2sgtQeHpN9EfhXEDKHu+51j1nH0H5k6w=
X-Received: by 2002:ac2:4343:0:b0:511:3bb7:1c94 with SMTP id
 o3-20020ac24343000000b005113bb71c94mr203984lfl.45.1706880288809; Fri, 02 Feb
 2024 05:24:48 -0800 (PST)
MIME-Version: 1.0
References: <20240202122708.2167891-1-alex@linutronix.de> <43529c06d19b5001bbd6938599b796d72d50d8dc.camel@linuxfoundation.org>
In-Reply-To: <43529c06d19b5001bbd6938599b796d72d50d8dc.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Feb 2024 14:24:37 +0100
Message-ID: <CANNYZj8DRr+XB=fbrw2jieYyavsiC9oYmXuOg6nwpe48RHLsrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm: depend on curl-native
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 13:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194797

On Fri, 2 Feb 2024 at 14:10, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Can we not just tell rpm it is "curl" or "/usr/bin/curl" explicitly?
> Adding dependencies increases build times and we really don't want to
> if we don't need to.

Yes, I've send a patch for that now.

Alex

