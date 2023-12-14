Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5484CC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 10:35:37 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.19066.1702550135232272309
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 02:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cYK5PK+D;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ca1e6a94a4so103936271fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 02:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702550133; x=1703154933; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a6kPWLQ+fYHwkoL9d9YUEyKeAXrNayQW5dflwifl1o8=;
        b=cYK5PK+DVBJbF8GSTlV7Geb3c3W3qu2IZdiWC2rluseS8XtqxeymQr7Zq5JJuKVOCB
         PlHuaKRV0/b6OhrFp8N70wi52Xfh3jWYR1BsBokCCsefLFgvjpISxzUevV/ibQ1GFYuI
         cowF9jKFQG4REfHucmn/y62T5igXZQ0DKwh2LwHImvGoTmoylB14kLB1YF/NNWWX8S0E
         5OGUyBKOP7ASBLkSH13PGtbA0JMPETdbl3FCzZ8i853nUxHIN+9zfVNZ0eVx9tQYxJvF
         NSFBwnVWm9DOcpabtFXvipDVTFcIzRpesHxYtopisYa/pIXOj9rHOc/at5MH3bAhCEzd
         Jy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550133; x=1703154933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6kPWLQ+fYHwkoL9d9YUEyKeAXrNayQW5dflwifl1o8=;
        b=Iy23GmBGpF0GzARfwHFfWiW9WcLSEnDWMNCnzgP+9Ezip6HrSp2p/AdtOV+wWoFPvc
         OwkI6+FV3f9aQHogkXvSawIPr4hGp7hPWyAUdnfrbwX7WE9C5QDIsc9PgMyth9w4jzVB
         o+ct3xbjs8Ecl/QIvmGxRG5YrQhwV8XPOvYQbJhQeWyZS0uQDyCifkVsnoVH5ZtzWO4+
         90sQTYE+tj5QbX4IOc7Rtuyy/PS8sDbFP9PqJ4yHY4JrN509sAcUH9sXUmqcdbrcFlD4
         JnK4xZnKzelwT/1of8S2oocuuDa4/yPYYbk/pMt3q5ONTHkfjtik/e+QZDUrcnORRjCe
         cJEg==
X-Gm-Message-State: AOJu0YwhS9zBeXw9AAczkbRuccS4xKAlANmmI7nMgFOfiMn7QwnWESG2
	o2/eZ42Z7UtTaltGWbjKJkwj7CoEi1tHISXvjio=
X-Google-Smtp-Source: AGHT+IF+CLARZIqLBKLei1TRwJWSQpWex7GZVRjI/MgwCiZ5evDI+j98Q5AxT/LFR18tP6Y1PAjN0VPzs+jflIuvD5Y=
X-Received: by 2002:a2e:a805:0:b0:2cc:1e83:65ee with SMTP id
 l5-20020a2ea805000000b002cc1e8365eemr5549835ljq.56.1702550133114; Thu, 14 Dec
 2023 02:35:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1702306082.git.liezhi.yang@windriver.com>
 <fbf5151e16f5c406e752c3e221d8ebdb5286c7be.1702306082.git.liezhi.yang@windriver.com>
 <08A00A79-3042-4BE0-B549-6D4395067DB3@arm.com> <6a650579-d140-4635-a9a3-db08a1dc7e4b@windriver.com>
In-Reply-To: <6a650579-d140-4635-a9a3-db08a1dc7e4b@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Dec 2023 11:35:21 +0100
Message-ID: <CANNYZj9rOLZyz0QZvq0pVt9sAsQwgosC1HOyEB_ceXztUd_Q6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/1] nfs-utils: Upgrade 2.6.3 -> 2.6.4
To: liezhi.yang@windriver.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192348

On Thu, 14 Dec 2023 at 10:44, Robert Yang via lists.openembedded.org
<liezhi.yang=windriver.com@lists.openembedded.org> wrote:
> >> +Upstream-Status: Pending
> >
> > Can you upstream this please?
>
> Submitted: https://marc.info/?l=linux-nfs&m=170254661824522&w=2

Thanks, please resubmit this patch with updated Upstream-Status.

Alex

