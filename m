Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D40D6ED1B
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 12:37:33 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.9686.1732192643071093922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 04:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MmjS7FM9;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b1474b1377so50117385a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 04:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732192642; x=1732797442; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yiPFjE+ZJvSH+cvuYzHQJ329sF0KIjZKw3zs7tnaVSo=;
        b=MmjS7FM9LIvS1uLXct4CLjDVNWQuqm7VR0iaW9hzC0/jQypb2urE5AvzBpjDbrcjpR
         /egAFcqq1E1/zMjBJ1h0osKrwcl2DWZJAthtGWMu89kcMCHcwLhUaFGuGFMVRl7XXKEi
         6S4Dq7V/R8G37TYhUOf8S2XEuMlYixybA34B7kpUjVikngAS1PYXNu+d7z/mXd5vaoxY
         9m+Ji/sgBNb3vScj6c4g2Zr8VHVEdAqbiw/XVKd/6DwEDsCK9dirO03or7C1/80jD404
         8NCSDSihFtyfraVrweP/ZD6deWvNPW8wei1YePcOwH4huXw9dP8Y+20nGsI6ypKENXZv
         BK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732192642; x=1732797442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiPFjE+ZJvSH+cvuYzHQJ329sF0KIjZKw3zs7tnaVSo=;
        b=Owi4XyHDaKr1GKe6H9IihqfRx4nVabF+kQ3A8mVr3OophYglppNC/+Mfuo5lnSfhwD
         cHvb3J2u9TKUrX9c4W2H3JjLbTgzVKpQroW1359/8viH798lSRSftC468qdClUfjMxHS
         0/pF0ObCv8HoNGwxyZE3s3qrckTF2WbTMhbde1aDrrvHJT4YaoAXnMMID/uSeH3+J0XN
         V663sjVq5b4wXtw5cxlp02K/Zhm6gxHSJUl6eg1CIhFr2DH9VF43vyBp+cqZkC12cZJr
         UZQY65mS7GBgVxXyqEfCbnmW+JrneHwMYVVC+E+uI3ZRrAknxTCLVb0H9CoiHC5idcP3
         6NAg==
X-Gm-Message-State: AOJu0Yysm2wb28Y++JXvfJAMWW92HRNVxHELHC6VzC99NH/4X7/CeNtA
	+sM4XEhD5uiDrCETNnAeIqS7F1kvrN3d4Nn8tT2F1kGFkeqLifxzzSPm6oU8F9ri5KzTPmRG6C+
	dKEY8xxsRrZKp0AdPkWC27Gvaccg=
X-Google-Smtp-Source: AGHT+IHQDh2u0dBwQmAyLqkx3d40vSvkfCP/aryYVHVczGSCd1vCclgBeQ0lTJc/6MFV6SGfiuAbpKVscGrrg3yQsEQ=
X-Received: by 2002:a05:6214:c25:b0:6d4:24cf:aaa4 with SMTP id
 6a1803df08f44-6d43779b203mr87158176d6.17.1732192642051; Thu, 21 Nov 2024
 04:37:22 -0800 (PST)
MIME-Version: 1.0
References: <20241120153205.2525735-1-alex.kanavin@gmail.com> <dcf7055f-cca2-4a01-95c0-da3936ce4fab@cherry.de>
In-Reply-To: <dcf7055f-cca2-4a01-95c0-da3936ce4fab@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Nov 2024 13:37:11 +0100
Message-ID: <CANNYZj8wNFUA1KcTnThVJa21zAAjmg9LaWTQLfdPJbw15ajFEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/3] bitbake.conf: make ZSTD_COMPRESSION_LEVEL
 a number rather than a dash-prefixed option
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 12:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207525

On Wed, 20 Nov 2024 at 16:48, Quentin Schulz <quentin.schulz@cherry.de> wrote:
> Sounds good to me except now we need to document this change in content
> format (if someone was modifying it, they need to put a number instead
> of the number prefixed with a dash) in the migration manual for
> walnascar, would you mind sending a patch to the docs for that (or at
> the very least open a bug ticket so it's tracked) once this gets merged?

I just sent a patch to docs@ for that.

Alex

