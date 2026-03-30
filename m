Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85136FC72A3
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 08:33:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46911.1774859621853728504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 01:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DpYxgigi;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so40802375e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 01:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774859620; x=1775464420; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tgzv7b0UNXbMO78eOHtTHIyUlMWbbihsZd4OuAVAbkY=;
        b=DpYxgigiwL485UPK0CI2itkMZxCG9KITzNi4wQVj/f/38VTRg8lW+N7yBz09RBpOPK
         WvI5d30+ZMpqG1y2L9TzLcACR39ef7B0l4baeMrUsX8643wQN4uWTMQi4iGxXdo6vt0j
         nn5b6TurJE06n4P76MXfsUR9+b/NL1qn7Au0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859620; x=1775464420;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tgzv7b0UNXbMO78eOHtTHIyUlMWbbihsZd4OuAVAbkY=;
        b=OWGjwTqpntXtHqBuLC/7rimYWIgrd+Qh53vLKzS5ny9kLmFguoHtXMySASxh0u4KII
         2tps1tW84DLPJdBMb+mlJ8oSu/kP6TANXwELxx2EFQQmTNWsHoQaNQin2oRW3ol4b934
         dHiaNE7emYnxvZb7xQ5x7J64Mp7DNGEGQS02+0uhNjga7kXj1WV2GsPiZLJAG4xRL8VZ
         KrM2j0RwningBV0JEwpdC9rTxNdf0bK5vXIY4h7Wt9HkOX7DTH0DUX4lz2rJjlAv29LR
         Hh7mNC8pwet1jI5dgjIwTWjmmYJSS6mL7ZJN3hEja6TnAPu4P3Xq0Dh17mqgskFORSGz
         vT4g==
X-Forwarded-Encrypted: i=1; AJvYcCVR2/9Rak3qW69mY8n0/67iG+JHlSnQoRtvUkEhTVq8e7NDU0QlUNDO2ghBpcxhfMlUn8vNaSwsCD2RVaSmxeat5g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxw3amYP8YWzbIRj2O6yHBfZJf8ibx0f3gQKIMWhKuEcX0sDEEJ
	2pbupLTU6R1HwYehyTwE7U+2MmreuS3RMNSoYcuJAAX0gPZT85hNCcQnj2Wbp+TmKhs=
X-Gm-Gg: ATEYQzwikGldiz29aEhyOAsXFmHwTiyFqXUp6AGUXiwySt4qG1x21Gdu/ITON+RvUaz
	eHPd+Q+yKd9cQSgaJESC5yr38QDGsYMex8FJxMt9vucIEk3hJYpsWKT8bMN6oI/trSMpnB/RD+3
	Ml8nQ0zh81htZrbsarERrr4M0OwqKP1bhcSHOZApVJNHaZZeqNU/Z3RKP2sHXg5NcFFetILLgXh
	/rMcyWIkF5AJrpCb3qjJfhGuo7q4c8pbbHEfQfDgYsAiXuYVk24BBRy7EBgBTYg1HkR4v2sLP8W
	HtY/5QboC+OPMRCnAsl1gcZmTKX2USQpl/UhlEmyO7Bbw96UVr4XOHMDL2W3XSH3QCdPDpvqRi6
	A+fh22DSqCgtPKHBxd76CAqa10RFVxf0bDJHnrVEXMIh8eApWEndxbhDi03Bq6uWqmACmgJ6bwk
	RkU3nZjNxTpViECtUzMzdb7fz51LMmdCEuCh4SyB1OpbaLHQn6oamn5pQFfgUyWGxXrzxCXetGE
	mnR78g+//k=
X-Received: by 2002:a05:600c:4e0b:b0:485:fbd2:f72 with SMTP id 5b1f17b1804b1-487290a9254mr169989475e9.1.1774859619939;
        Mon, 30 Mar 2026 01:33:39 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48739fac087sm110660055e9.1.2026.03.30.01.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 01:33:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 10:33:39 +0200
Message-Id: <DHFZ84VRDFEP.3M1OJMNYWS532@smile.fr>
Subject: Re: [OE-core] [scarthgap 02/11] python3-cryptography: Fix
 CVE-2026-26007
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <thond2009@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1774824253.git.yoann.congal@smile.fr>
 <80637cd1b9e2045e9f19fb8337704007fef67e41.1774824253.git.yoann.congal@smile.fr> <DHFYGZZDZ2YZ.2UZT8D03BWNPH@smile.fr> <656140.1774858797434807353@lists.openembedded.org>
In-Reply-To: <656140.1774858797434807353@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 08:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234205

On Mon Mar 30, 2026 at 10:19 AM CEST, Nguyen Dat Tho via lists.openembedded=
.org wrote:
> Hello,
>
> I just updated the patch as your comment.
> Could you help me check it?

Looks good. I took it in my branch.

Thanks!

>
> ---
> Tho


--=20
Yoann Congal
Smile ECS


