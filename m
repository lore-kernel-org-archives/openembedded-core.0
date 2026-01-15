Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B337BD41150
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 09:49:32 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32121.1768470564116657595
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 01:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GOBxCQKZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88fe44cce7eso7584786d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 01:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768470563; x=1769075363; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uxPJAaI08huWX3HJPQN6JasYtFjldiDlDQfiL+yGDhs=;
        b=GOBxCQKZPyyDJoEkamYI+xhvc8Z1puFeyZORipg0WbiBK4cE5gXfiwsR3pnlwZvPbT
         X/1FGBhhHDScq56yj/I1A/UkkEp9hO9tbNuhMHOAic+XfpvKOlVvfSr5kYdspJfags6H
         lt/R9TrooYLH5eSMYmA9CpHxs6LcLP4SEI0AELhP8572PZ9Nv9W3LYni2uiNmWmgEN+p
         irZ6Tb1UeB8udYWdbNlnyboyyUqvZyuICmXRj9ClRYyuLT+xodhZceToQ+I7018YoeER
         d01QCPDyuAfJtiOtn+EIEbwVhh2EGvJ/A1b9GNYqge5xiwTsxFNrYS+3Teou8HD6tJ1Y
         crIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768470563; x=1769075363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxPJAaI08huWX3HJPQN6JasYtFjldiDlDQfiL+yGDhs=;
        b=jhP6xRud80lEfi0mMrsZg6uvi/2q1tkUN4Mpx+aEfSX6Yqkx7tlDoSIBbef4EASVoW
         LjUngt9ZXRD1jZVVY72dnNNldNkJZLe19cVvpp9NldETIoY/auUIAF1KEA6wqcb+aNFf
         xMwP/Wk+Ta6wmBgxuz+Sc0wbIHR97ydz5xSf1+JVwz5lyGbLSvV8jfvg94s0xU9H8RJP
         JDvGtzEVatMonu3t+FY45Or/2v6//YWPk+XveM49qhyPdMoNYnOL+kDHbU4sYEUQagxB
         kuXYNSRSHHe5Fdnq1hby/zLrowDaPzsxUwmM9As5HXCYUTZWtdSD+Hhn9lmqNSNTF92r
         aXnA==
X-Gm-Message-State: AOJu0Yw1unbjrrtDNf2zi49KHcsrNhCAVTnuYAt9po+hN6JuBQwg7AOj
	qNWJNSw4/Sa0QqthMFCQcof7tI3JXrVFEiGKs7JMh9YcCKltgZBOeD3ROWhQHdKAvGYoGumTqHm
	yeJopfMWS/p4ztpZDR9ynfLpLXHDKbdrtR79B
X-Gm-Gg: AY/fxX48YiG7Z4kRVsW9FgFPZJbxn+8Eg3Ahso+xuzvShS0K785zMm4te5EuoT+L3Uj
	rp72lgrc5aowwzTRn572iyaBrdPlFzpQrY9nVNQuBQ+uVWQw2+/l03u04bV6bIYzaZLaO4bsxyb
	MosfKIw5E5j8Ep/4up8ODkvkECEwT8hECTQRcwacND5eEg0gGmKc21amUmDWyJdbNHiiRl4Mxy/
	RlwiNaFic1cb/e4P4KJsTdasVa2bqc5Pci2/SYI18S9Ealv8FJLqeBgpH23/jpdXi9TaOWl
X-Received: by 2002:a05:6214:21a1:b0:888:fc37:f9b7 with SMTP id
 6a1803df08f44-89274354caamr68011966d6.25.1768470562985; Thu, 15 Jan 2026
 01:49:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1768469892.git.liezhi.yang@windriver.com> <f69b7f8ddf584c045a6fa168f6add2850519e410.1768469892.git.liezhi.yang@windriver.com>
In-Reply-To: <f69b7f8ddf584c045a6fa168f6add2850519e410.1768469892.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Jan 2026 10:49:11 +0100
X-Gm-Features: AZwV_QgxqiyVG2BXlis-E_GIYrXOuG5u3gjGtf0_gZJ85Vi85UP5EBnEqhvVQE8
Message-ID: <CANNYZj-C+1htk4XR-uaSbsCw8OwE-bskmucyw0qLkD4TnNDbTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] rpm: 4.20.1 -> 6.0.1
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 09:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229396

On Thu, 15 Jan 2026 at 10:38, Robert Yang via lists.openembedded.org
<liezhi.yang=windriver.com@lists.openembedded.org> wrote:
> diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_6.0.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rpm/rpm_4.20.1.bb
> rename to meta/recipes-devtools/rpm/rpm_6.0.1.bb

This can't be right?

Alex

