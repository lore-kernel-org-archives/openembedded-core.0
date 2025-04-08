Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61722C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:15:39 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.71766.1744107338927799613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l/IPntrH;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso49763026d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 03:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744107338; x=1744712138; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YSGzygxnXjJGnjx6HMV9zNLnRfkiaq3Z+uS6ifKxscI=;
        b=l/IPntrHhE9exEjRcd7zLWkl+mDsXOwjwhebkbPAuMY4A24Tvo421P5NxEjYY9frXy
         t0K5lJyTekDd4lLlQrTDsvxVDIGgRipSz0dUuqZCc86+R/WwmCsiGLocS7AfRbctUK3+
         zOp6H2noGpkY/xMEaa7qLDGYLiVk4tKl5b/4egW/2jg9d+nh/qVkAF3Vs8HjCu5mYVr/
         VUcRpy7xQg7/IPUz8X21K7/812jcb4OeAFOtYolmhVFODskLABLU3j2YWJC5Q8/ydRnI
         FuvJAa7aB4y7I266veju2LeoDeNWNfRHBlNWnqJ942i/jMF2O7ZI1ekTOnMnrRt9FOJw
         c3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107338; x=1744712138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSGzygxnXjJGnjx6HMV9zNLnRfkiaq3Z+uS6ifKxscI=;
        b=elDwxgukjI/U3o8TxApbIadaiRcHuYnkJyDoVjpNqtfk28btX1a5Tu6KnmcFJwLzMm
         d1eXWZ9VkAcJ3nYPk1eYAD0/ph9rLGZjdppTI53+KaUSC6VfDwyQL8eFr07hHEasGQCD
         hE5UQXDr8yXqEMGNHHPpt8RXbzjFEk6/FGdpAsvojuT69J8ghrEuTZQWrsq5RsInVDt/
         KVg4WU3r1PJ3x4unJh6sv4MWH4qYN6EY4WVbzC+9JEg0LQdN4QkYJcJSY0BQqs6WHXAu
         YP7WhEP5NrbR8Y+Yi49VlRygcpMs36dnVnWTXbJamadywQTDcCYqYsZr9t2Pf850kli9
         JJwA==
X-Gm-Message-State: AOJu0Yw/x1+nx5dbvbuRl25zHJO/1SyHKdLhaXGY0/iLeVBG6xae9lxi
	ZG9gL2BazfC6kE+SN9qJsRzL30H10GB3SFdBd5fd11uagpY9BueTZdh3qfXLCgwnN3h0Uu/2i0d
	PM10NBPY9G5FCY+MLiSosz/l7fKI=
X-Gm-Gg: ASbGncv5LoJk5hdulqBIY8dfsCOXwJ/Qml8wP1nEtqvzhEya1cQRpjZcL1/xmv+dud5
	S1raZUPjSEJZ2Lyogdt8KDaROd/YH2dqHeeRYaRzpCaiFuKFHC22CgKRT4iWXK7G58GpYLCs1PH
	hPBiVuKkClW44rWW/cnQ/3aV3586ctcJX69T2AXuoRk62eCIdmkCI+4VwWYRyn
X-Google-Smtp-Source: AGHT+IGrIpbA0JHt9pH9lGhNhlN7in5kju/BPXb/LVHzDvrUDuRg/Z2kaBlVmjXlYHdKfjwG5VYjbXusfGUGkzbGldc=
X-Received: by 2002:a05:6214:ccc:b0:6eb:2e88:d47b with SMTP id
 6a1803df08f44-6f05845e55amr190533926d6.17.1744107337872; Tue, 08 Apr 2025
 03:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250408100945.111801-1-jaeyoon.jung@lge.com>
In-Reply-To: <20250408100945.111801-1-jaeyoon.jung@lge.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Apr 2025 12:15:25 +0200
X-Gm-Features: ATxdqUHqcv2nF8xUFneK_OlO-5wmJ36s0n9q9GXwH6ubMIXyGP1BhnEPV1-9bzY
Message-ID: <CANNYZj-0eA7Qwei1HRD-oVzZ7qU2BgNj4jqhAyzBryaCWMjqdw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] send-error-report: Allow to set server using an
 environment variable
To: jaeyoon.jung@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 10:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214523

On Tue, 8 Apr 2025 at 12:10, Jaeyoon Jung (LGE) via
lists.openembedded.org <jaeyoon.jung=lge.com@lists.openembedded.org>
wrote:
>
> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
>
> Check ERROR_REPORT_SERVER if -s or --server isn't set before falling back
> to the default errors.yoctoproject.org. It would be useful to alter the
> report server as needed without adding flags.

I don't understand. Why command line flags aren't suitable?

The problem with environment variables is lack of transparency; they
alter the behaviour in ways that are difficult to diagnoze. Command
line options tend to be more explicit and easy to discover and
understand.

Alex

