Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C0EC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 17:37:57 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.1925.1750268275183663415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 10:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eJtrTkYh;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6097de2852aso3983567a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 10:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750268273; x=1750873073; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XpRPO8+g9EEasjA1Ej3L72PTvBwC7ybS6snY2+VCus4=;
        b=eJtrTkYhvhhRXoTF6uAusSICMih0nLkrUaHvWXXXbmATZCKR4GFDJaefB6Atp4hnXv
         lVFweVJ4kjDH9KoCvhRTj9XU/p/xMfaIqS8Fz4rzmZ6Y6i6HdHSssXDcFWZQoe0c8OQ9
         p3Gg+/sLaJ8hAZaa66h2PuPKdHvvi3R9Z8uN5eOY6E6QH2ZyJMShZs3TeumSWEnqvmlq
         78sGQU3s42QbqKaXTQ/xCeQuKRPijptbljl8EM79IzOgwjIp2wvRYxdXyGC1SoJ8O7xG
         YNKdbZnqnRoitkunvJxuRGgqEQiLhWctVVC1hXJZkWjZWGwH2YMl/wx8DbwSnE87N4Jt
         NK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268273; x=1750873073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XpRPO8+g9EEasjA1Ej3L72PTvBwC7ybS6snY2+VCus4=;
        b=Safy3PnpuAf/plAcoQ4SNvJyHeNn/Eh1rWcM2QhbM5qyLKDYOLz8FY6wj0ooU1OvTv
         8CBGXEPheSSJVpRSFTzJUbrG0SzkwrT6bDj8RaPl3Y83DVBcgdJmi42jg3bPIIlTkKO2
         7iXw2+WeH/65unf1YYZjl7xGKqxpZMmkQhB4JBDxUxg8iOZUFGlDu7r7HQdUOIJYBFqQ
         DsDXJJlTPwr0QCweTpXgtZzry+ZqvcIbBNN+J0gt3OsgNX4cOl6yIbR/LupDxr+XKXKq
         kowGuOmSCBxS/I9qcuteYIz1p0d3Q4mlwYzVOxXbGLO0O1fqWu4fiDweKps343IGHIjs
         SKCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ZU0M33lY3ZDVIyXeN0JAjW9r5oD1oX229eYdRt+hyUtZnBv6xts0yCMC9FyBkYPINRdtmWGcui9w4YihFeAwqQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwpQ0Vflx5h8B0GEbLc0BTZxatS4v++2VdvfVofc811XogoxhUl
	0AXlKqkxma8VcrhFMZcA2afAfEI30zsmeZWutMBbEJn8G+sh2llwqFHu
X-Gm-Gg: ASbGnctn630r8QH2W0zGdHQphMa2jJ+EujjsFDuTPXJEA+5xzY2q+Ogr6XGmN3T0AdJ
	QuLXpKNNNBS5PODBURP9kEXmmbYlgzA7x7SELTKsxF/YnxiV50RFxvFm0HfGMLMFNA/+T+T0EJx
	GtepuGLm0ncNtOvQOoBwXJAH1cdm5xIg1rLq1vYP2Z+TIImnEDEq8RgEXWlkcnWtVApTNkf8mtW
	lmXGqIxMALGLVdsPXBPfKEtPVUtuCOg5WQPHhPKDeQCGfTgB7A2sqjUXKFF1bGIpQ4TdZQGQURe
	IshDb/d+IqH80od+yokgNFFROPbocKTVx8/Fk1L2oeb7VyuCDTJadxw4giTIQ58yGGz1qA==
X-Google-Smtp-Source: AGHT+IH7x2wTsttuDKo4RXSYqrx9E+W046ngI0ZbOm82yCLtHAZ4BNY0k5+kdiLCv/3pPKMOSvtFHA==
X-Received: by 2002:a05:6402:4316:b0:602:f026:7cfa with SMTP id 4fb4d7f45d1cf-608d08b6989mr17443565a12.13.1750268273397;
        Wed, 18 Jun 2025 10:37:53 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5e6dbsm9991439a12.51.2025.06.18.10.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:37:52 -0700 (PDT)
Message-ID: <ff7d6019-9983-4bfb-b625-2ea3163cbaff@gmail.com>
Date: Wed, 18 Jun 2025 19:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: stable 2.39 branch updates
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
References: <20250618172131.2131228-1-peter.marko@siemens.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250618172131.2131228-1-peter.marko@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 17:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219028

On 6/18/25 19:21, Peter Marko via lists.openembedded.org wrote:
>  SRCBRANCH ?= "release/2.41/master"
>  PV = "2.41+git"
>
The subject made me scratch my head a bit until I noticed that it
doesn't look correct: it should be 2.41 instead of 2.39

