Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5F5C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 14:10:05 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.51820.1638799803067075593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 06:10:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gy24DGzH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id v11so22645819wrw.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 06:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Jbwcpch5tS2jyxDY55eLnKjkngqF5sW7fts205iyIYI=;
        b=Gy24DGzHtXPivu4JXXqLSzZvSyGZA9W3PlUNIlUVPWF8aA1c/NZb8tKOOWUszJlunE
         qk9m4TsCLCPJ9bduiqNWp8kGvEzfg4ijyiFJyBpJnDECEqbcoaSedQ0xmevIsCvsgo2V
         wssv6hOYLrZqj1sKZPPaDKd8ybJD5gfOJNTGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Jbwcpch5tS2jyxDY55eLnKjkngqF5sW7fts205iyIYI=;
        b=Nye5gEPOXu2ofJ6Lp/vX/pHfr/nn8L2roFy66sy/CKBXCTCzMLkG9BWEAOjZjdo6/C
         YCt1LDc0Sv50KXsnJHFox1O7Qje/BJM4ph3gQq+fQEydo0tunHBIUPOQPSdboEXNEI2z
         bsRnqCF2KhKuz/phmYuCmeK62VX6mO1VvxCprxP60mGfNblgAOSasC9B3hFfKRX7Ecam
         tdAe+9Su2kJ/+Ln79Ost7XlViNYYM5AFm6orV8FKbw3HQKt4BFJ1uUce+3xBe+oCBTVo
         cM5CJqezPzAFzxhPEHirEn/zpgfRnemojNUoiDVlEzjjjdM9PxPU8cFSChmSCriTIKvh
         CuDw==
X-Gm-Message-State: AOAM532qUvBBTrwVTOmJGFJvdQcatuBm92Fz+vlPAxr4r60mm9CHY872
	xQ+ZZaSAXkrC6hgcfy+B3/EOOA==
X-Google-Smtp-Source: 
 ABdhPJxnE/GlNMVL3zoILzWytVixmEe9IhQzbCm1+Pf8BdBcRM2JSSk5hf9/+zowOq+3TXqjlsSjoQ==
X-Received: by 2002:a05:6000:1201:: with SMTP id
 e1mr45112521wrx.298.1638799801603;
        Mon, 06 Dec 2021 06:10:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:50e7:dab5:2141:24aa?
 ([2001:8b0:aba:5f3c:50e7:dab5:2141:24aa])
        by smtp.gmail.com with ESMTPSA id
 v8sm11343995wrd.84.2021.12.06.06.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 06:10:01 -0800 (PST)
Message-ID: 
 <cb258aec098d602b755b3a940a51be1692b541d8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] insane.bbclass: lock down pending patches
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross@burtonini.com>, OE-core
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>
Date: Mon, 06 Dec 2021 14:10:00 +0000
In-Reply-To: 
 <CANNYZj8LUPs3powyebzPJvVCM3Z+B3i-dOm502jwTGGMFQZBwA@mail.gmail.com>
References: <20211206083629.2591982-1-alex@linutronix.de>
	 <CAAnfSTuCwTFgkKTSVXUtO3e7nT82yWpMO_h11EWE01Q+PgC9gA@mail.gmail.com>
	 <16BE263B28F8C771.1147@lists.openembedded.org>
	 <CANNYZj_0OA-CEfZbdm1V2mvJBbQWmuqf=+2q+w+kTH+NirrVTw@mail.gmail.com>
	 <93f97ff5a539241b9267593387165845e6e28444.camel@linuxfoundation.org>
	 <CANNYZj8LUPs3powyebzPJvVCM3Z+B3i-dOm502jwTGGMFQZBwA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 14:10:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159231

On Mon, 2021-12-06 at 12:37 +0100, Alexander Kanavin wrote:
> On Mon, 6 Dec 2021 at 12:29, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Ross has a point here. If we go this route we'll just push people to mark
> > patches as Inappropriate instead. People will know Pending isn't acceptable
> > so
> > they'll just use Inappropriate and we'll lose the ability to see things
> > which
> > may be discussed with upstream and those which realistically never can.
> > We'll
> > have to review patches marked as Inappropriate even more carefully.
> 
> Right, but what can we do then to make it more clear that new Pending patches
> aren't welcome? I don't want them to keep slipping through into master, and I
> certainly do not want to argue with what is essentially laziness on the part
> of the submitter. I guess a mailing list nag-bot that spots those submissions
> could help here.

First, we should ask if we have a problem. Ross had some metrics/graphs which he
was kind enough to find and update:

http://www.burtonini.com/yoctometrics/

Whilst there are blips, it does clearly show that our number of patches in OE-
Core has steadily decreased over the last 5 years (~1900 -> 1266). Also, the
number in pending status had dropped from 816 to ~490 recently and thanks to the
recent push, 374 (and likely less again when more merges).

I have pushed occasionally to get things cleaned up and we are slowly winning as
the trend is downwards. I believe I have pushed back on Pending patches a bit
more over time and I think it is working. As we lower the numbers, it becomes
harder for people to justify adding them too.

Reproducibility did add to the patch backlog and we sometimes trade features for
patch overhead, it is all an inexact science but I think the overall picture is
promising.

We've also some known problem areas. I've long felt guilty about the state of
the libtool and gcc patchsets. Those are in a bit better state now and I know
many other areas are thanks to your work.

Finally, I'd add that the "pending" legacy was there from when we first started
to mark up the patches and their status as we simply couldn't handle every patch
when we started marking up patches. Many of the pending ones are old and badly
documented, we have significantly increased the patch documentation requirement
since then based upon experience. This should make it hard to end up in such a
mess again.

Cheers,

Richard




