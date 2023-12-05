Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DC3C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 10:02:29 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.97133.1701770541650421410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 02:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C/pK5U6i;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c9fbb846b7so25709171fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 02:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701770540; x=1702375340; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XBhWbj+2r7ZjoLUC/dfPnOT0kXk4DFFeSIIAFscjYKM=;
        b=C/pK5U6iWicptOzXya0mK1JGAahxjA6aC+0CL32FLWfbxHL5VF85AucFH9OJLbrIcP
         8wSHweIGLQawQTsIdQTc3dUG1azmco3bel9SLOSL2Z1Vyj9YWeuFYxFHyvtcu1eWbE/D
         YnnLXZtYSl394Us2r+NCW9L8lfg1ATtik+GD9LsNExRyX1yajJFfhARPcOBxT7YHpQ36
         NfVyu2rVGekMGyMOf67qAh/EqnKD+fTTlkoSn65X3MDIZQct/cSeO1HApZXqA9xik3kN
         0miL0M847PyYPoq+rEWEbFugVmAP75TsLvmWu1Zv49kEG2w7luFigSlaHdwg+LHrhOWO
         R4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701770540; x=1702375340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBhWbj+2r7ZjoLUC/dfPnOT0kXk4DFFeSIIAFscjYKM=;
        b=QQXfFQ9FG/9KQED1OmbhRqLiT83OkGm5ZEVKKwZYUqhq9IEMbthEOmV1iCTqLm86b+
         JlHTxKCPQkfUHmOjmWgYvWh6rqEQf4rPCvcE6tEU4VytPj6yMAc/HyYnVJ2/h5PP67Xl
         6wzWEWJlt38rMCdu2gZNc21RAKahxTGl5jhmK1RFQW5xBRRryjagB6HCMhpGezq/GZKB
         G3p5WpPgRs4xO94NhfcyRLyBqNSAeJjMGN7LcgUEb+v8TRTUt7FOsrtmQHyIeucqNmLi
         JxtwTR+FY7cUuwpjQQ/l9q8CVYAyJZ0O6vIH1wc4LKSRnUSlxEiav6oCycQRK3cbSNaN
         FHuw==
X-Gm-Message-State: AOJu0YwtO+qFuSvlK3iCaOzmrYsH4sa9DyZxdv/zX56J09adhGBTp4fX
	PJViex7kdgJbi0kmEWGYXbpOiFwJ3Pk1uPJBsx4=
X-Google-Smtp-Source: AGHT+IGjDE6KtuHrmkEEHfhzBQa3hcD12s7uP0jYva1D7TyYCkdlxVB0y6VfqSgoOrdcWwHrvLVz7qtoN9Ozy+vgbPk=
X-Received: by 2002:a2e:8514:0:b0:2c9:fff8:2b85 with SMTP id
 j20-20020a2e8514000000b002c9fff82b85mr1375655lji.13.1701770539542; Tue, 05
 Dec 2023 02:02:19 -0800 (PST)
MIME-Version: 1.0
References: <20231201105359.409068-1-johannes.pointner@br-automation.com>
 <20231202151311e74fca40@mail.local> <CAHvQdo2FqMHUaKOpXHcOimVGQk40b=6A9xRXVh-zHwEQ_SvQwA@mail.gmail.com>
 <CANNYZj99HsYjDgWeKwK8KsU1=cZDZ8g3rtc7vGiY9NizdA+_7g@mail.gmail.com> <CAHvQdo1+2xLfA4DMHbS3x6MparmAT+EAGUUNwJ1p+kst9dUOug@mail.gmail.com>
In-Reply-To: <CAHvQdo1+2xLfA4DMHbS3x6MparmAT+EAGUUNwJ1p+kst9dUOug@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Dec 2023 11:02:08 +0100
Message-ID: <CANNYZj8rZ8Q+Wwz7bKsW6k+=8yvoGaKNMWq=aTrhdvvLFmBxEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ldconfig-native: Add usrmerge support
To: Johannes Pointner <h4nn35.work@gmail.com>
Cc: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 10:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191814

On Tue, 5 Dec 2023 at 10:44, Johannes Pointner <h4nn35.work@gmail.com> wrote:
> Thanks, I understand that, but ldconfig-native seemed very special to me, so
> I tried to take an example from the existing patches.
>
> So the next step would be a v2 with a better explanation and obviously a
> fixed sendemail.from?
> Or are there any other things I should change?

That should be ok. Note that any changes that fix issues which should
be exposed by the autobuilder testing, but aren't are seen with extra
suspicion: you need to explain why existing tests aren't exposing the
issue, and whether we need additional tests. All of it in the commit:
mailing list discussion would be lost in history.

Alex

