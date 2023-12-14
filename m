Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4761C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 14:39:38 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.23851.1702564778310941965
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 06:39:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UhDR8KzA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40b5155e154so93328155e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 06:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702564776; x=1703169576; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O9KeA6AESm6t+htkiRwZlejt/B1gZ4JpGbf8Lcqw9CA=;
        b=UhDR8KzAhQZO8CmHBuRLZ3kzP6D+8nfrQ2v81ebX6413IX31h9vFdnBFLfW1B9NluE
         HmzRRamRjmZC+BVIW+zbOuH5lEUpJbv1kXbMUTGXxRrm8HJ1+xsoCmEkgXFBzgxOAGJq
         IMVwS9un+edmwnMHX8M6zYuy+W3egnImRrTi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702564776; x=1703169576;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9KeA6AESm6t+htkiRwZlejt/B1gZ4JpGbf8Lcqw9CA=;
        b=AZHhbYO66DWSsVCiLSCwJF0rrl11rJvaqxqJ91hXNog/BokRCZQi8K9e+kKnqLmRtv
         h10HMTtIy2pFowHH8UBrh+YOffePwTHGBMfgeNO7IvHqd83auX13EjziaDM8arf4ykoL
         PAhR83ncjmHevhvszxuYwbdbAaZEZVezS1wqWc7wno7s/o8182jvHzYnfmbmf/1HFjry
         zdB8fWBmupAZk/qmKlEx5kkQ0h1/GPB5FqqhNj9n94htsQ9Ym+B5J+BrJ10/vT60Da6i
         mwEJ4ogSK3qMJufYK7XcMbUzGN7JkzgLTLoXgdA1hfx8qpIb9HccLvMrfsrM4M1iFdQA
         gABw==
X-Gm-Message-State: AOJu0YyIowoChFMTSzxnBhAn7cp/nAGN2g0cN6NwN0zfitZjlO03302V
	0EifbGCyTdCzE811HzeW6WNBPg==
X-Google-Smtp-Source: AGHT+IFH1kSeQ5aDzx4vDlqAvOy16tQZWZB4mXtCWEYb+laoJp8ZwSinwHs5JLTYP+AoLCxqW9ZLrg==
X-Received: by 2002:a05:600c:4296:b0:40c:3314:5bcd with SMTP id v22-20020a05600c429600b0040c33145bcdmr4553027wmc.204.1702564776663;
        Thu, 14 Dec 2023 06:39:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e972:7f32:1182:98d2? ([2001:8b0:aba:5f3c:e972:7f32:1182:98d2])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c468700b0040c420eda48sm18356306wmo.22.2023.12.14.06.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 06:39:36 -0800 (PST)
Message-ID: <bc4906880058d64446e62a2ff6f983b85246750b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/9] bitbake/runqueue: initialize
 RunQueueExecute before printdiff rather than after
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Thu, 14 Dec 2023 14:39:35 +0000
In-Reply-To: <20231214134528.1973602-3-alex@linutronix.de>
References: <20231214134528.1973602-1-alex@linutronix.de>
	 <20231214134528.1973602-3-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 14:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192386

On Thu, 2023-12-14 at 14:45 +0100, Alexander Kanavin wrote:
> printdiff needs setscene dependencies and they're available only
> through that object. Previously it was instantianted just after
> running printdiff, this moves the initilization to just prior.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  bitbake/lib/bb/runqueue.py | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
> index 864708ee4a5..1f59d18b71a 100644
> --- a/bitbake/lib/bb/runqueue.py
> +++ b/bitbake/lib/bb/runqueue.py
> @@ -1555,6 +1555,11 @@ class RunQueue:
>                                           ('bb.event.HeartbeatEvent',), d=
ata=3Dself.cfgData)
>                   self.dm_event_handler_registered =3D True
> =20
> +            self.rqdata.init_progress_reporter.next_stage()
> +            self.start_worker()
> +            self.rqdata.init_progress_reporter.next_stage()
> +            self.rqexe =3D RunQueueExecute(self)
> +
>              dump =3D self.cooker.configuration.dump_signatures
>              if dump:
>                  self.rqdata.init_progress_reporter.finish()
> @@ -1566,11 +1571,6 @@ class RunQueue:
>                  self.state =3D runQueueComplete
> =20
>          if self.state is runQueueSceneInit:
> -            self.rqdata.init_progress_reporter.next_stage()
> -            self.start_worker()
> -            self.rqdata.init_progress_reporter.next_stage()
> -            self.rqexe =3D RunQueueExecute(self)
> -
>              # If we don't have any setscene functions, skip execution
>              if not self.rqdata.runq_setscene_tids:
>                  logger.info('No setscene tasks')

I not entirely happy about this since start_worker() executes processes
and isn't trivial. The code is careful enough to tear them down too at
exit but it is all a bit of a waste of time.

I had wondered if we can create RunQueueExecute() without the workers
but as the code stands, it does poke things into them in a small
isolated section. I think this code flow should be tweaked to stop
RunQueueExecute needing the workers to be started and that would be a
decent cleanup of the code anyway.

I can take a look at that if it helps since I think I've been moving
towards that refactor for a while anyway?

Cheers,

Richard

