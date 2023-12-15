Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81740C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 16:04:15 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.65897.1702656251855170029
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 08:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gGck6eve;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-336447100e9so780366f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 08:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702656250; x=1703261050; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=92A2tYVVX7A/aXpmg+fvAzus/XCeCoRPMeebcqnHw28=;
        b=gGck6evefhAmwqneK0m54ST3MzGigdc851TrEJsY7xHXolkL/1uc4eZvZ+vZcJ8Gwi
         plYCskOQF/KpAqGGSkon2vIzzvi1RehMyroDJV6n3JVCHeDKJznC/xToPT+c4HzU/Kgl
         I/SosX+0fzWP+2/prgncPM4de4juqKv4ADQVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702656250; x=1703261050;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92A2tYVVX7A/aXpmg+fvAzus/XCeCoRPMeebcqnHw28=;
        b=R6lqtVKVrO5VOk9gfbWXtWlxDjMv8g1XAFWOptvc9TO9F4PP4O3/OVxL/Ne5aGHfCE
         VluBAmb6wLRjgJAsQtbtThd64R955qszfOy24ux9szqDZsH4qY+KUaKUzQOqHJ87c426
         98TpceOoeMI71cwJ41z/20fxGy4Z6mtQIcEhRihXUSe2nOTzOfYNqvp+Ghxw597M5mJM
         QwVVaOTHeo7rLv2SJ+eeCm9ZJRTXYfhkDN1sBtg6oKUKcyrd1fUjIYp/7sHnsgRPu/N/
         yjGyZ0fBEOsV8ZXg+JkZ9sPvNdWG3PrNWLBnEIXgx25oGPaQP36I/wgJcretIeeZC8Uk
         8dDQ==
X-Gm-Message-State: AOJu0YxKYO0N78oxfAnpt9ITU4KxjSh438VQlW3v2WmPeTpUeKcZKtlh
	SL6zT0nezbSicCbE27WDOL8dXg==
X-Google-Smtp-Source: AGHT+IFOll89uZfdYALxIaha/ow8DkZScfQt/GDsaGwhfS5GLdRaeWEPpJK5+yMIzJ4oZ7+D8KFPVg==
X-Received: by 2002:a05:600c:2259:b0:40c:1d9f:aeb4 with SMTP id a25-20020a05600c225900b0040c1d9faeb4mr6217849wmm.220.1702656250283;
        Fri, 15 Dec 2023 08:04:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a04:9eb3:3437:42f8? ([2001:8b0:aba:5f3c:a04:9eb3:3437:42f8])
        by smtp.gmail.com with ESMTPSA id e7-20020adfa447000000b003365bf0544bsm98046wra.96.2023.12.15.08.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 08:04:09 -0800 (PST)
Message-ID: <70310808800e92bdb957f9f6fa7d937fcb1bc2f1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/9] bitbake/runqueue: initialize
 RunQueueExecute before printdiff rather than after
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Fri, 15 Dec 2023 16:04:09 +0000
In-Reply-To: <CANNYZj-3r41Ukp1GUGhChbbJK+ATh_eOBvpWJAhn90_UKBMBoQ@mail.gmail.com>
References: <20231214134528.1973602-1-alex@linutronix.de>
	 <20231214134528.1973602-3-alex@linutronix.de>
	 <bc4906880058d64446e62a2ff6f983b85246750b.camel@linuxfoundation.org>
	 <CANNYZj-3r41Ukp1GUGhChbbJK+ATh_eOBvpWJAhn90_UKBMBoQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 16:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192533

On Thu, 2023-12-14 at 18:28 +0100, Alexander Kanavin wrote:
> On Thu, 14 Dec 2023 at 15:39, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > I not entirely happy about this since start_worker() executes processes
> > and isn't trivial. The code is careful enough to tear them down too at
> > exit but it is all a bit of a waste of time.
> >=20
> > I had wondered if we can create RunQueueExecute() without the workers
> > but as the code stands, it does poke things into them in a small
> > isolated section. I think this code flow should be tweaked to stop
> > RunQueueExecute needing the workers to be started and that would be a
> > decent cleanup of the code anyway.
> >=20
> > I can take a look at that if it helps since I think I've been moving
> > towards that refactor for a while anyway?
>=20
> Yes please. I haven't noticed any regression in printdiff performance,
> other than a couple of additional lines printed, but if you can make a
> better patch, that'd be welcome.

Patch on the bitbake list for this which removes more code than
it=C2=A0adds. We had already set everything up to do this :)

> Meanwhile I'd like to implement what I mentioned in note (1) in patch
> 4/9, as it's a real regression that I realized only today as I was
> preparing the patchset for submission and now it's bothering me :)

Yes, it is and I do agree we need to fix that.

Cheers,

Richard

