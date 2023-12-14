Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E117C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 17:28:50 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.28889.1702574926315995366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 09:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O8zy08QQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cc3dd2d897so21320111fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 09:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702574924; x=1703179724; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DUix3NmgN3G85xqgey67jfMOXIpQrFCviDnU6Y/H6ak=;
        b=O8zy08QQNmNdE6SJrdYG4wAjd3Gu/+gfE72eImX7oj0QbDqRfaDo8vRqD/uwJrsa9b
         dgH8zOPij+HblO8FZq4xdMk/FA/PoKjbbSsJQEYf9C3KqIEVnJnKIy+QLFm5UAgZn5gq
         lF6IanIUO+/TLe7Z7Ykc3hawy8K38VLJcR+K7Gq3yNZxXctX84kVLNnewesYttMgLJBZ
         7dQpfDT8fY4rnX1uOuT9KsK9XYjIH6/tVUIgaVb7xJ2NrGke0gKrUcBOHFONKIDA094z
         dg7L9FkX2pivP/HMJvutTf92WUgs+L2poi5m5060ln1h9QYVPzx15+2CaRnAtj6MwMG/
         GjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702574924; x=1703179724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUix3NmgN3G85xqgey67jfMOXIpQrFCviDnU6Y/H6ak=;
        b=L+VekhZCOTdw3dJjgJvsnSzKc82dbz+i/K9FA/22CfBq3aqNHz8D9D4QL/gCwQqApi
         tXWOFI95V02pZxBqvy/eJcI+JZrpVHiZNPeRfk2o4/n2sTk34W9btRGCG+b2i7eOrrv+
         lvtQKpZ6SbIUkkXKi1CY9PNn4Im4nJxp/Whx3lYWJcPft2qyZiLlLFFWMDM9D7TLxhi2
         XjMIikB5EYnhWSFt3ccwMTp4o/TFCsKBzKg/Jvi9JXywtwI5dvf1jkekFb8tduv0eidr
         xkwpuC2ZCSHtEuFdxj7875aVz8dFkTr9DtEzyGdc4db5Rx28h/6VfugiEpLXM1bS5zcs
         HxvA==
X-Gm-Message-State: AOJu0YyhsF7Z/hbqH6QKIggUqSwhCPK0uh9/za7MqKMh/e6fdiOMZZ6D
	WG6JB3EljYJiaKWqVfrmUPa/0XLAKTZ8q3wtiI0=
X-Google-Smtp-Source: AGHT+IFpH2p18S6PY//HSJ4J495sGWRqosaNXTYfDAQEjlUy0b8s4XA4f94IQmSS3EofSKNg3ziT2qR7j9XgzzXUkUk=
X-Received: by 2002:a2e:8041:0:b0:2ca:cb5:2ed8 with SMTP id
 p1-20020a2e8041000000b002ca0cb52ed8mr5107694ljg.103.1702574924099; Thu, 14
 Dec 2023 09:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20231214134528.1973602-1-alex@linutronix.de> <20231214134528.1973602-3-alex@linutronix.de>
 <bc4906880058d64446e62a2ff6f983b85246750b.camel@linuxfoundation.org>
In-Reply-To: <bc4906880058d64446e62a2ff6f983b85246750b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Dec 2023 18:28:32 +0100
Message-ID: <CANNYZj-3r41Ukp1GUGhChbbJK+ATh_eOBvpWJAhn90_UKBMBoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/9] bitbake/runqueue: initialize
 RunQueueExecute before printdiff rather than after
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 17:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192396

On Thu, 14 Dec 2023 at 15:39, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> I not entirely happy about this since start_worker() executes processes
> and isn't trivial. The code is careful enough to tear them down too at
> exit but it is all a bit of a waste of time.
>
> I had wondered if we can create RunQueueExecute() without the workers
> but as the code stands, it does poke things into them in a small
> isolated section. I think this code flow should be tweaked to stop
> RunQueueExecute needing the workers to be started and that would be a
> decent cleanup of the code anyway.
>
> I can take a look at that if it helps since I think I've been moving
> towards that refactor for a while anyway?

Yes please. I haven't noticed any regression in printdiff performance,
other than a couple of additional lines printed, but if you can make a
better patch, that'd be welcome.

Meanwhile I'd like to implement what I mentioned in note (1) in patch
4/9, as it's a real regression that I realized only today as I was
preparing the patchset for submission and now it's bothering me :)

Alex

