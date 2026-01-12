Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B768D2505E
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 09:33:22 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29530.1768210396682369159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 01:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h7aK9HmY;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8804f1bd6a7so56245576d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 01:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768210396; x=1768815196; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dntFq0gdqOEBOIiaQRFioN09pij21FhbYThYDitWRbI=;
        b=h7aK9HmY/8ll9LKW5LLqLciPTdCV5rL7k9PYVN/G5wsHxR+1EyvflUZ0ZsPgLQGTGx
         HfJrvAF5ET90PKLzbWEAoS8o5ofORx+pJiXrjoG/h/Dz6Xo24H8a2xZT+64/dekq9jag
         MRC8od08yN5ueCQZr7o4DcXKAmJh8UpGRg3QLoIoIsEw1rHW3gwVLqckennXJJlHOyXZ
         KdNpgtshdKxeC2yTZl97FCSkRjkbSRZpzTpYSTy1fwH/YwgA06oeA6hqpsppowhg5n4u
         ndT+1XjU1mxyFKf/8WYIZ+s4TyAddrfpZG1/GuqVKNX1qSTGKPm9EjGdrJLoZsznCHSz
         kysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768210396; x=1768815196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dntFq0gdqOEBOIiaQRFioN09pij21FhbYThYDitWRbI=;
        b=RhEXQImHCEomRaVL/Oc1q3ycv+s/9krzwJzK9tzqZfQJaN0e0iFjgT4d1ZnV8gWnHi
         6p5dTt4ApKMtJ7OBOLYi5zclifxcVSfa8CmJnaPPzIP/hdndzyw1sdhXPqAlJ4p2IUF4
         pZAdW+J+c0xFx9to1FvBYrsnw3lPIoWeWttVCANTPsk/DWGmDOh8X3kI7urQ9j7dkMP3
         haln4M9YxC/x6/XoInX+F8mTUgJQD6scVud03DDbuSww8XorwIH3lScPfUzM8tGKzxPp
         fytsHfisESwA9sAoQCvWD34H1ikQmILAu8c9FbLJAjfVsVWN89gIBads/mOemLSpmCej
         SEng==
X-Forwarded-Encrypted: i=1; AJvYcCVgW8bcq1tTGYCqRJJplCZDpfuUr51Hzb57czv+ESxHBMKf7SYI/IhnSmnMeP+lLzk2BZv5AeqFsiTHZ3fpo4dStQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzwaiQT582CFvpfi79A8WYCU9JQMFimEltiNlcxk9pFJNbaW0cB
	bNlmSALnTo9/OX4HTOTMstjPUpHPj0mHi8jZgamSo8UZEkhi2D5jDqpzckMX98M53Ozav2wGO4S
	qVLPqvnfAWpdC2Dz5GzspXqDSn5eZFUo=
X-Gm-Gg: AY/fxX6DIeLA+YwBLN2kCPCe6CHMpjGlVKDcppyfyF44EKPG7ZlEYHRZnAC+4tN/cLo
	UJB5cTwFOy3rWnRMKJwDJpdnz6LkzeQHZh5UokPSCgWdXFbWxW/xhDbeqleuNyeKl42O9wvtgDs
	4f85HBbiqKtSAemntyxqZXYrEAnme+0wNz9zdyHks6ASqAWBOoTztLTP8XHZPrtI7qFKkvfnJpx
	Kf0gBcixQaASrb69aO2Xe1uLmhlCV2K4WXKRI9WOcwZQ+DNWlM1MXkdMCiwkIcDWJUwGQ==
X-Google-Smtp-Source: AGHT+IEwvGaPdLYr1W2tVuKXSVviTvr0BP/dpiKdZ/zqQvvCuKISHJq1kBz3xuo3sKEDTEKAvQwuFvS71fEvFYhdZw4=
X-Received: by 2002:ad4:5c87:0:b0:880:57b3:cd04 with SMTP id
 6a1803df08f44-890841750c8mr281449056d6.1.1768210395696; Mon, 12 Jan 2026
 01:33:15 -0800 (PST)
MIME-Version: 1.0
References: <20260108060842.3340603-1-changqing.li@windriver.com>
 <CANNYZj9YA+FNmcn4RiwK1CEvK909uDbgZcHYiHd+yZo00ciejQ@mail.gmail.com> <fc5d529f-0ca3-49e7-a050-62593305b128@windriver.com>
In-Reply-To: <fc5d529f-0ca3-49e7-a050-62593305b128@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Jan 2026 10:33:04 +0100
X-Gm-Features: AZwV_QgSJ8e21KXlCYurQnjhE7lSpErSJWT3WiUCRT1IfJdsxJCwat8UJoTsrJo
Message-ID: <CANNYZj9Yo19XZTpEdNER9ud5EUSq1fu8PLgRbLgRGHmfK4MX8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3] go.bbclass: set buildid to empty string to
 improve reproducibility
To: Changqing Li <changqing.li@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 09:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229196

On Mon, 12 Jan 2026 at 08:40, Changqing Li <changqing.li@windriver.com> wrote:
> There's go-helloworld in oe-core, which is reproducible as it is. How
> can the non-reproducibility that this patch is fixing be observed? Can
> we improve our tests for it?
>
> This moduleindex info only be used when GO111MODULE=on,  and the go-helloworld is compiled with
>
> GO111MODULE=off, so it is reproducible as it is. To improve test, we properly need to enable GO111MODULE

Can you do this please, and add the change to the patchset?

Alex

