Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC97C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 10:01:35 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.7737.1743156084171042393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 03:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TYe5d1X1;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so3704548a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 03:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743156082; x=1743760882; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+H3mIn+Iuzunx7lQK13NNvqhnfeAvF3a5dYf6+AnZY=;
        b=TYe5d1X1BqGeUYce/mcAJgW2vXtZLW6nCtN2pDnyugQHGVz3zD07LET1T7GfkKyNWd
         FWBA7qJZjq2GcGiY18vlOPZzcWmjRetxDWBESW90DvWHTeMLaZ/Ij+B7C2MxuBeM5H4+
         8vCmD+0sYbsVnQK+By9Yy7ODBw/WeA7t27wtYRleLELLatQULbyouXdqYzuRTLaYKF/J
         hWB9eHHzjY5EBfcpzWx/CNZDY569g1IhZdtmW2SD2Erch2LxHJFE+P/l7b2sq26ENfHv
         Ka4/NwWBhb1b4/MU+7GEpr1koqLghJ6jZbGKepO00e0fvF4MdaVDtjg9clgL+sk8dF8+
         BhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743156082; x=1743760882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+H3mIn+Iuzunx7lQK13NNvqhnfeAvF3a5dYf6+AnZY=;
        b=X0masGPgHF1m+6XMMVGKA5Kui43zBXMphspRXWaJooH2dN5tLZ2mxg1jJc09zFfQre
         ERyXYc0NCNRksJQS4VWpFkdV+cmkerJS/wMdGPmPjXDLFu543XoDorokUgrsv9j5EGvJ
         XSNxo8hMSCGkdR/yoGGwxlPhxiheFGrOOJ31s7YjhCsvCfYOypwKQprhFjfYHxbzPMVi
         X/oaHXYUAexS1h1ziLzoQGUoQgTI13TvXsJQgez6IwOoGjkgAaGfqr/tFBJrzTC+xd7d
         A/VelhqXElSvKjgaa62yVohFXGE3JxX2PPnEg5Npg0GZ9lAKC4XSBo9rC9+7+ASYX3z1
         TdZg==
X-Forwarded-Encrypted: i=1; AJvYcCUlqQkNXN38vTEP0PYxYQP3vseUedxbvN2Xi1WUIZm1tUjfciZ6LYSxF9ZkpIFXiLlVsUdPdECoFUbvyuiwP/8yfg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YySkuI1e2FMr9lzwCnjZYpBJKwe1wOi9eRzJOkf6tPnUFsUWcti
	b7DWjLsbL17Hx0wZhB63r+Ntk3+ffT6/h9rcNW33xhWNkjRdcXgM
X-Gm-Gg: ASbGnctuwiB2uy6XjSx3eSgug4P+9o3pO21QKUNK6skPzSNq0v/Sl4+LJRZw1U3xjPJ
	QwNKBHt3XA5LY1Cczf6PcjBF431vDFosZm8MnnkHPhp8tE95IsyHMFvuXgJQYHwTUsy+7DjN55c
	VwVPt8NTRjApYDrdIEHcbO0eThb4QTRQZdMoWhaQbX4D11YzeI1xOS6siAd3z9Xy5BL6U6gYPfO
	IJBnKe5X6x88zxocNJNSAcdvqAxRVZe1gTOhKddKWhdRRblnODhAMLO9X2/0a0dWFMD3fB/JUJB
	TtMcl+bI3snR3dHezKeRqyR5Z8t23izXkO+fW1DhTbwShCfcdb1U
X-Google-Smtp-Source: AGHT+IFhvu6yBc+WDZfpgEAfpOXnd/N/asfHYf7m7XiMxgL23qQLXQ4cEwzsvSMjcVQTmwcAoEwB/Q==
X-Received: by 2002:a05:6402:1d49:b0:5ed:6535:b6d2 with SMTP id 4fb4d7f45d1cf-5ed8e4a92bfmr6721367a12.15.1743156081742;
        Fri, 28 Mar 2025 03:01:21 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17b2214sm1105101a12.54.2025.03.28.03.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 03:01:21 -0700 (PDT)
Message-ID: <dd128a8c-71c1-40fb-87e9-d48b7a75a512@gmail.com>
Date: Fri, 28 Mar 2025 11:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap] [PATCH] qemu 8.2.7: ignore CVE-2023-1386
To: madmarri@cisco.com, openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
References: <20250325071248.882336-1-madmarri@cisco.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250325071248.882336-1-madmarri@cisco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 10:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213823

On 3/25/25 08:12, Madhu Marri via lists.openembedded.org wrote:
> - According to redhat[1] this CVE has closed as not a bug.
FWIW upstream qemu isn't rejecting it (though they are also not too
worried about it): https://gitlab.com/qemu-project/qemu/-/issues/2579

