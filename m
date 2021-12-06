Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648DAC433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 11:29:33 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.50113.1638790171334833229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=djeLRMML;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id c4so21670781wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=fyzXmg5+imazOBL6DdP1Cez9mDwA1ViCoCN++0FYt3U=;
        b=djeLRMMLyVOJQ5Jzd/NZZeLg7BdtkFznYtLCGxTV5z6IC0+TBNSgQHaCAEvSMvz/V8
         CHdRGZjCfYqPQ2Nw0tjzci4Q98eLrLQPBNZ/dIIHacVVlhAdq6W/hB3c0jplKvr9ZG8Q
         E+y+pyArr0V07I11DsU/BNrevWVjT4NlHyweE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fyzXmg5+imazOBL6DdP1Cez9mDwA1ViCoCN++0FYt3U=;
        b=gKfK1UQEkQN3JkzrIkJ1xaAehlxDEnSbcBmW7izbIsYMdJo8KULsIYJs8+faFyf/Eb
         MkGJrVkdKrwroYqEDGiHG3dSeMgZJBlsZd2XyCYdLuNhunsc5CZ0XTLDzzsL8zwuSUb3
         XJfjjLyMfToC8N5RncUirLMsjx7oCnMYrHzFE7I4UJFJZjP1MH08U6nX3dwl5dy8qvS9
         KchLyHvHWT4eo9YcCxrflkJ5c6ca4qe4UycLm5N0p/KUN/DBLqJx/Bh9F7oDLqkORiIR
         CYhIc80LQgQcF1r4RgA7y/MmtHKkcOnNsTrt4D1vEw9KCcZMSfJwAb9xcsQPEhk5T8iZ
         pW/w==
X-Gm-Message-State: AOAM533LgU8IBKukUu4Y8TUst3dst4lfhi1bwVlX8IYZevcK4AHznyBw
	BBBcoBmn9X0XXMSe5QmlRoY43A==
X-Google-Smtp-Source: 
 ABdhPJxAiwYOAn3bPEBkifi/83rQaRor0O7ugN+tTjRdXNNk6GtuyAPTK0of7vObvnjmkFC2MNvTig==
X-Received: by 2002:adf:eb42:: with SMTP id u2mr44158753wrn.521.1638790169541;
        Mon, 06 Dec 2021 03:29:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:50e7:dab5:2141:24aa?
 ([2001:8b0:aba:5f3c:50e7:dab5:2141:24aa])
        by smtp.gmail.com with ESMTPSA id
 v2sm10198598wmc.36.2021.12.06.03.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 03:29:29 -0800 (PST)
Message-ID: 
 <93f97ff5a539241b9267593387165845e6e28444.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] insane.bbclass: lock down pending patches
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross@burtonini.com>, OE-core
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>
Date: Mon, 06 Dec 2021 11:29:28 +0000
In-Reply-To: 
 <CANNYZj_0OA-CEfZbdm1V2mvJBbQWmuqf=+2q+w+kTH+NirrVTw@mail.gmail.com>
References: <20211206083629.2591982-1-alex@linutronix.de>
	 <CAAnfSTuCwTFgkKTSVXUtO3e7nT82yWpMO_h11EWE01Q+PgC9gA@mail.gmail.com>
	 <16BE263B28F8C771.1147@lists.openembedded.org>
	 <CANNYZj_0OA-CEfZbdm1V2mvJBbQWmuqf=+2q+w+kTH+NirrVTw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 11:29:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159223

On Mon, 2021-12-06 at 12:21 +0100, Alexander Kanavin wrote:
> On Mon, 6 Dec 2021 at 12:15, Alexander Kanavin via lists.openembedded.org
> <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
> > On Mon, 6 Dec 2021 at 11:24, Ross Burton <ross@burtonini.com> wrote:
> > > 
> > > As much as I hate pending patches, and I really do hate patches that
> > > sit in pending, there are situations where you know the problem, can
> > > work around it, but still want to push it upstream at some point
> > > pending further discussion.
> > > 
> > 
> > 
> > These situations are rare and you know it. Almost all of the time it's
> > laziness and abuse of pending so that submission can be avoided altogether
> > or pushed onto maintainers, e.g. me, not a 'need for further discussion'. 
> > 
> 
> 
> I want to add something: if there's truly a need for further discussion, that
> need is typically with upstream, and so the patch can be marked as
> Inappropriate [link to upstream discussion]. If the patch isn't that good,
> file a ticket instead and link to it.

Ross has a point here. If we go this route we'll just push people to mark
patches as Inappropriate instead. People will know Pending isn't acceptable so
they'll just use Inappropriate and we'll lose the ability to see things which
may be discussed with upstream and those which realistically never can. We'll
have to review patches marked as Inappropriate even more carefully.

We don't just want to reduce our Pending patches, my own aim is to reduce the
total of patches we have.

Backported patches eventually fall out the system so those don't worry me.
Submitted stand some chance. Pending are the unknowns but a high number of
Inappropriate will be the next issue.

We need to keep the end goal in sight here - not to carry patches at all
ideally.

Cheers,

Richard


