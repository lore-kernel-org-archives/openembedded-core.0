Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F891C433FE
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:52:36 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.37393.1634568755800268638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X0sb2Unw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id r7so41987068wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Em1X0IjuKCDctT6MADT5jJFXuaWNq4xJ+mimPEkIyv4=;
        b=X0sb2UnwEXJhzaCQcE+vDXFOgXKUfZOxOoa1vQfPRNjtV9dqd7J0hbCLvq4KZS9BmO
         GwkDR42LzpEEJETDZJxLuGv5hJs+1psdRIC7ekhw5TgKZgOGUHXg8fmvtfet3n2iT/cQ
         MQ/fwId8dME7ukHyxwZWUe7IiVc15PMKqXX2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Em1X0IjuKCDctT6MADT5jJFXuaWNq4xJ+mimPEkIyv4=;
        b=zq1syFY/5fYup7l4sVT04QqDqSYHkGg83AvILAfN5awN/c2fckCtMOi1q4xc3ZH541
         a1GQCkqDp+aiU/+WHD8Y4CCLf6oXZ66Sml7YnNGE71iHZ3P5RSjqUd5Z5uhGoh7hwl38
         14DAYHkMAn5bjDfuwPlJ4vGNPEkaLcQnfHZTS8bVlCvjHlfF4ECuEADhVEiJehvXC1+G
         kG4LAwNS3tu4xVN1McdMd3pnlONjKLFQDOv+bf4ZlJdF1jUm9zsNLAuSpljI7m+Dti09
         byaSpQaBoj08kHMBNU6kPrVqZVB3t+czaXdPQEp1169vRo5qdZvQxgIqcTLKSYkF0FQE
         bD/A==
X-Gm-Message-State: AOAM533p1vYUOOaxdA3xzuKTnJ8y/VtLvF6WivZwoBy1eIbxe3UY7SLv
	gc5O2kyBCK/M2Rk5DzIHHXb2cA==
X-Google-Smtp-Source: 
 ABdhPJzxzfcgqS8ijRsmFYBRW1ESag8a0GdBTxqrKfhcu1VnXV+rxroM+9yihItyQaFwLbLLl84ahA==
X-Received: by 2002:a05:6000:15cc:: with SMTP id
 y12mr36239012wry.333.1634568754241;
        Mon, 18 Oct 2021 07:52:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1325:5a42:b4ef:5218?
 ([2001:8b0:aba:5f3c:1325:5a42:b4ef:5218])
        by smtp.gmail.com with ESMTPSA id
 u2sm12339288wrr.35.2021.10.18.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 07:52:33 -0700 (PDT)
Message-ID: 
 <6149502653526ba43975b86936e6aa74415c9ac0.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] state/staging: Fix directory not deleted for race
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pgowda cve <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy MacLeod
	 <rwmacleod@gmail.com>, umesh.kalappa0@gmail.com
Date: Mon, 18 Oct 2021 15:52:33 +0100
In-Reply-To: 
 <CALY4985dAovpwtKHUTOAcAVW7TJr+cjTzJcssk8xr7MYTcm9pA@mail.gmail.com>
References: 
	<6473ab6832d9e7647a8921bd8a7735394379f12a.camel@linuxfoundation.org>
	 <20211001072440.18158-1-pgowda.cve@gmail.com>
	 <76aaa9e236f1d4519d84f770da9a6e101bf13f4f.camel@linuxfoundation.org>
	 <CALY4985dAovpwtKHUTOAcAVW7TJr+cjTzJcssk8xr7MYTcm9pA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 14:52:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157076

On Mon, 2021-10-18 at 19:17 +0530, pgowda cve wrote:
> Hi Richard,
> 
> Thanks for the review and suggestion.
> 
> > > I'm wondering if we should just add TCLIBC to PN unconditionally?
> 
> I didn't want to add TCLIBC to the code when using default GLIBC.
> Hence, I tried to keep the folder default for GLIBC.
> 
> However, if you suggest adding TCLIBC to PN unconditionally;
> I will modify the patch and submit.

Lets try that please.

There is a related issue Martin reported where the recipe is really TUNE_ARCH
specific and not really TARGET_ARCH specific. One step at a time I guess though.

Cheers,

Richard


