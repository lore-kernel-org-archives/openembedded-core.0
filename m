Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0EB108B8E7
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:00:07 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9217.1774000806517601365
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 03:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K1gGrcfD;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-89c68b0763aso25890146d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 03:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774000805; cv=none;
        d=google.com; s=arc-20240605;
        b=SXC6b+BCtEqmIi72uhEceiFnQCG1NQSrUVz/iexb/Z9R14WMxY4n1zGBrSz3OR6MTg
         bAvppcmJWqBJQpmPoYM6Mn8T7jz1b5mxGyfKB60WvoXFeer7uYDFPW57p3joM7ehF7P7
         u6MjEB9UZ4wmDoJR0Twx6RFH8qsEDD3zQ/o493YKxIiGBet2z040dcBqRv6gono9iLGe
         qr1tTr3z5UJ4CeGH2U9JMFtPpBlC3+YxXQyxzglsN7Ds+ZV1o4pgQdc0HKU8C3FXdnQ/
         AodhxxXdAouD2ygDXG9xS0jILTJQU15QDHO5WmexrJYB5pd9Ykg73q3MQqvsvdbiNqrX
         rUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0zq7XA+WnbjDpt4II4lHZdiIUOAgQzd2awTaYr7l/80=;
        fh=QG0/1kl/iNDCWfShgAIKRpbEE7JIBRGbrVXnRZODZk4=;
        b=Y1OX6e+FG/MpH9t431Hf2osAkIy5C+cLm++TcLLn6u0w9Z7at68YqZ4C7sSsWNE+Mq
         CtF8UGBL2/hc8q0XHBEBGP4kN8e98Iqziq8GSt872LVb75WSgN9wc94aY8mXMFcHuwiK
         UDbFZu5Erahl0grfcG1loi+JiC4WyEEB4iVryL1870eYbI9zX3Mx4qogieZ5WTf00/ff
         /YVHtfW/8EaDGik3jiFlwmcfm8vLBSeHdxSHCbaHGhmC8HKhXMkuET03WBmJNUhrgw2D
         F3Dy3SwR/Kkt5zxNp3e9SrQ3FN1lkJSR7N0SOFMx6El4WtvA+XTO6zbjuVeUYjESlQ3t
         A0gQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774000805; x=1774605605; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0zq7XA+WnbjDpt4II4lHZdiIUOAgQzd2awTaYr7l/80=;
        b=K1gGrcfDk+uJbUOOtvGodjUtWzcz6uvtUzEgP08rVgYqwsPCf0ac2q5iRBNCGWp+ES
         i9hxFiE8pZY/eQWN8PhYpRwdfsNzbVQlElTg3djkry4gcD44SWvbtJvQrNRK8m19NtRX
         yazOCsKgtWTEeOryvi54jgQjVEpgC3ZWrhXJa8r5rG8zbVDag1cH/TzlGkJacdFbtmrT
         8KyxIKITnBYRLD6vvPm6FqahHav21rnBZic0M2pfuci1Atu08A9BuI5cvCZza387VOaE
         l4l8nNPRN7hCz4ZZXVdsuMpZp7CMThI56q1YTwQM6+LrHYj7CZtGZ8edOH750nG4bKMa
         oBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774000805; x=1774605605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zq7XA+WnbjDpt4II4lHZdiIUOAgQzd2awTaYr7l/80=;
        b=lyomR2N+mVdKJyT1DoiJMWNgL/UkgK2BoY8Y7CvY/YrgemfVswdXT2afnDOHrCm2tG
         Q0oxaBm0h8NGGdACvcPj6Fr+HKIPRBoH6SydM9wi2+EGjhQbZJ+KrQ3uS0TllAFXUYqH
         r4OzcxjSdHRBJ4zM43Bj5+jwJWAVPDMp3tV3rJa+tEir4w2rFd2iRASYMXBNMYE96jDF
         StLglcutVmsGchcUYYOH7+ypSxHyF9TdZeyDCf70HpcZHVANqJ0zM+CK6gWmc4ftHAkl
         hHd++qfPKw6j+IUU8fxVBcT0PbDk14qF9J6NybnGxdLTTEMrGV3spw1Itfu3Ow1KrbwH
         6dLA==
X-Gm-Message-State: AOJu0YzxMIYCvqOP7F2KixyS/sWFeREmHUiLPvGxczZ7wXoRICvzmxhv
	P+egnNRnHB2iDqO6Yxedvi0d7lG+X9Aqo/q1offOzXjYAAoT/NsHqBhxc9DUP7IPNbGVWf4+mbS
	Tb1fb+QfgmQ+2ioHKWqvDR9pURtSeLoelPnlp
X-Gm-Gg: ATEYQzxAMbX7F6WPquToPwQ+sVv1vc2rI5j3D/GKCNjO4Jcpe1fHBW0IJTxhstR5ye7
	cHJZODTyfKzhtKRXcpqDOdaLgV3nheUHz4wJoE81dnKNlMqWH8iFmNSFehQd/uzGrXKJoG2w/4r
	vORbH2VsEzGU/ticsNup0imthYAI6ukYlthes8fodfI7xi10fZSXMhGFAlHtbVsn/RBjxENiVf8
	kAz8sJxuidoS8/JAFnNQNqBayM95d++Fo/30TDQxboKRfA4NE6+e6k9harbTvfqDktnUS7DipXG
	C7+qLljHPwGdC6pZN1Di4tGWAwtBmJ3oqoaUUxdoRA==
X-Received: by 2002:a05:6214:470d:b0:89c:8a0f:566a with SMTP id
 6a1803df08f44-89c8a0f5ab3mr10057586d6.37.1774000805203; Fri, 20 Mar 2026
 03:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260319011815.13998-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260319011815.13998-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Mar 2026 10:59:53 +0100
X-Gm-Features: AaiRm53oKMkGUfyVn-5guEAEtV77GXOTBSkdfvNNpJu2KJs1MpgwBwHgRoCjh_0
Message-ID: <CANNYZj8ihti0bq3qtK2xag9U1TGKGaHyvpdgbTATSzAGc7MgdA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libsolv: upgrade 0.7.35-> 0.7.36
To: liuyd.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 10:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233593

On Thu, 19 Mar 2026 at 02:27, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
> 2.Remove 0001-utils-Conside-musl-when-wrapping-qsort_r.patch
>  as it is not compatible with 0.7.36

A better explanation is to say that the issue was fixed upstream with
this commit:
https://github.com/openSUSE/libsolv/commit/2d0718a4f2001c857d9af24398c68d676a98a3ca

Alex

