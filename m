Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520C7D2B92E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 13:53:29 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.18351.1730814807515517631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 05:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ibf8QwIS;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.180, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e28fd83b5bbso5847539276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 05:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730814806; x=1731419606; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqL2I8EJpk4AOYRBSgIc6+hsObxx3jwCXlzFEEjtzE0=;
        b=ibf8QwISG5KbVLHboeSP2biepsOladPtLt+tDh1OD5PKfF2r/aJyEjOfQJiuYfliAR
         usixZGmn5kZb9wFbRFcpNHyDmsho/8JrDkKXg9u4qcM4aGrc/Kacymb62Jp6RkAhW87A
         Qq786C/xNmCn1YeRdvMJV7MoVStvTPl62UFWHQtIwNqLH7/See5Y2if5UptUdMW5vbyx
         cuO4Ji1/2Zy4wgxfBoIth6zQRbzFRfp6nBK21cxDQSODpE0mixaz2HBSzLqW0/pBPCVl
         DoCynZP3ApH4QTmcWcnuSFv1a8hwt/r+J8Cx1iYjR5jvR4Dmmtw9oFB9UUqvvAqsHENk
         hJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730814806; x=1731419606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqL2I8EJpk4AOYRBSgIc6+hsObxx3jwCXlzFEEjtzE0=;
        b=VdosPSPmtGqr/labIMf/5m8TDh+mZuxN98Nf8ZsURIOx48dRbhXQSDXWzMamwZdVOp
         LawMKVv+e4al7jDImvSTYLotCc0W/uyNw5WAuLvr5YWiSqRm4zNRSBS18NZTLUC4jMRs
         QZwndG20NwXQB5DNKUT8OUZkx7RCLKN0PLppPyv8K7eU3VAaG+EDJ7f8YaNA6+tmdxa5
         R1XkWb9e4ziSGsp7JtZUqtj3eKbBDTodnp8aAT0+8lcua68lv+K3dtY9jQ9U/1Xi4zDy
         /YPUppvjo9eO7hgqd95HqjKMWrBPCysXjGRZWNvzidovvRiRVGqw2SNis9/HORvFLhaQ
         3P0w==
X-Forwarded-Encrypted: i=1; AJvYcCUmcsB/8mhdFZ0baEMaAmyraLY+npUEVCbQ3r3snplY0j+RaCehwxhlVQDfsmAYH9oq6TAlfsBxUDjZKHs0bpJDJA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxbZKgtqml7yb9Z0uV/kQCrDs8sPH9kES299u4Ki63pvWFWQbV3
	c2hrRDQxdzI1bHgFPG49p1wtqLWjrqYDNSmOOOpACDZlDWGxkbW0op8WBjPRS8hN3isy0M3tshN
	egtryAZzATcjXtQIqWbmaFBcm/N+tTBPCJ/XoLw==
X-Google-Smtp-Source: AGHT+IFD0exqmlBN6tt4pQlqNst4mVOloZnmb23hXpgyCq3uV3Ev4vENV1YRG1wpLlK43aaBnnTT4K0dnTusmrPpBPE=
X-Received: by 2002:a05:6902:702:b0:e29:699:3ca5 with SMTP id
 3f1490d57ef6-e330256823amr13273040276.22.1730814806632; Tue, 05 Nov 2024
 05:53:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1723636705.git.steve@sakoman.com> <468a9077d9b3466d60ee8c5b6144529ea5e5c849.1723636705.git.steve@sakoman.com>
 <CAApg2=Q13Q7mHWMOuC4=oL2AJVMBJpHAOPV_3xCphiotCrVuMg@mail.gmail.com>
 <17EB9EED917D6CD6.10903@lists.openembedded.org> <CAOSpxdYkNiYFE3n2KBaAPH=Qrxu3DGxgnLuWaJkMQbwHkEmVAA@mail.gmail.com>
 <0ac8780b1703a929a085f732db8647e5f091d933.camel@linuxfoundation.org>
 <CAApg2=SBM7Bqmt7ZYTPOOan9T9FTdawoA1zt8+hqS+UAQzu9Ew@mail.gmail.com>
 <920805f21a597824d6acf2195a5434000599d83f.camel@linuxfoundation.org> <CAApg2=Rxw7TObeDWAfSCEa+9vGLBFYVNWPu7by1XxZp2kHwimg@mail.gmail.com>
In-Reply-To: <CAApg2=Rxw7TObeDWAfSCEa+9vGLBFYVNWPu7by1XxZp2kHwimg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 5 Nov 2024 05:53:15 -0800
Message-ID: <CAOSpxdYzSNHv0uDYtsvCDVmVxfRYmb+R8h5yPRWXJqni4xBwjA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 1/9] cve_check: Use a local copy of the
 database during builds
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 13:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206712

On Tue, Nov 5, 2024 at 3:55=E2=80=AFAM Marta Rybczynska <rybczynska@gmail.c=
om> wrote:
>
>
>
> On Wed, 30 Oct 2024, 07:40 Richard Purdie, <richard.purdie@linuxfoundatio=
n.org> wrote:
>>
>> On Fri, 2024-10-25 at 07:08 +0200, Marta Rybczynska wrote:
>> > To make a summary, this patch did not solve the issue on master, it
>> > was the change of the database path that did.
>>
>> Originally, I couldn't isolate the change to tell or not. Now, by
>> changing the database path we've shown the issue is occurring on the
>> branches without the patch.
>>
>> >  Is this correct? And we still do not know what the cause is? So,
>> > when we change the path on all branches, the issue is likely to come
>> > back ?
>>
>> I think if we move the database operations to the local filesystem and
>> out of DL_DIR, we're likely to stop seeing the issues. We know they're
>> isolated to something about the older releases.
>>
>> > My problem with this patch is that it changes names of variables that
>> > are in use. It should at least not fail silently for people who
>> > decide to use a pinned database.
>> >
>> > Do you see another solution than renaming the _DLDIR_ version to the
>> > old name?
>>
>> We either backport the patch as is and have the same functionality
>> across the branches, or we do some special version of the patch for the
>> LTS branches. In many ways I think it might be better to have things
>> consistent rather than doing something special with all the confusion
>> that can cause, even if people do have to actively adapt to the change.
>
>
> Well, I'm not happy with a change of variables in existing releases. Howe=
ver the split would be complicated either way.
>
> And as a bonus, I'm not able to reproduce on my systems (the lack of NFS =
might be a factor).
>
> So, I'll say go for this backport even if unhappy with it.

Thanks Marta, I will proceed with that.

Steve4

