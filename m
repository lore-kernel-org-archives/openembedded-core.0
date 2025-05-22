Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F43C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 21:36:34 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.35263.1747949788264314535
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 14:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fQ8Lr4pb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so71336055e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747949787; x=1748554587; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fGrQ35rudstb0urdE7HPRFkfFLzS0ZGrfw3HX8i8uQE=;
        b=fQ8Lr4pbXTJkfRWR8GRGX7ZFGyTdTKT+KoImNMp+6kNwLMHyzZVfUaxCRSzj/2ky0X
         WsGxtpQur6yHXq4APzNWrLweL+yBMwry0vCDJ69EnPJbzc1sDQkwvEtF3tX4ujtyDJiG
         mge3J+tnMRR336qqQjIfVDtrltX4QEfEn9SDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747949787; x=1748554587;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGrQ35rudstb0urdE7HPRFkfFLzS0ZGrfw3HX8i8uQE=;
        b=Mc/WsusmEaXGvEN9SgVVZqaqZnt6qtltaMCkhBAbJP/dMXB010qEO1XFYYalzbQeqz
         oXano/gh/hpf+AGs+BUx0pVYPO8H5UUxOn4N91ky7vJiTjE4eRbZfGZAH1gdmX2qLwjf
         zqMvXsfaKjveTmi04ROl4V46kTB1/U22/TARr0n5vxq+koBQBgJeeLG+9Lq5hZo2WuaE
         wQ026UQFciW7w0ipdmX5aqbKRVVnWkoTZ/CwgFRenR2jZjr9HtPmn0AV5/UHBAu1lWV8
         XsJm1m5geBjCvycTE06z6VSXVdXGTLuFwNCa9ogU/NZCsv7f4olWj/n6iPSCHogbkWVE
         6DVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqP7mnGXVOn3brGrMhOS5oRU24UAsOPx53B4r9Jo5BzNiXo0ArvruScPk10T0eY3rPW0IH5zlkcsGpHtMmFe6UAw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzg6Pmpq8rXxPf3cVD8mvFxQveCyyrbPgBpOJ3ijGVeO9Kircsb
	s/bvgY/OG+7r+r4b5jAYeziikMHiDWjIsS9U2XxgAv77pNB3Us1QP1gSYmMesKSa2+Q=
X-Gm-Gg: ASbGncuitQ6DD/vLI6QAecC+7DiOtJAjH/o5l1AQncJsgmAIYQKcAXf+lGkw+MxBFVg
	nxs9RWP+6TuftQaVonRBz8rqlwMlpSNLh3ryHxePzed3CEh1HAGEAslFIvMv4okbhS++9Dztj3h
	Ew7ztV87Z4l6jcl29+MiZ2PmBy/9v/PHZXo5WCldiAjVCBl75B0DnHyUOKdk982z4MjZdYR8Quc
	eh2VGGCDiNFw+RuDkw2XmneQJmPu45Uje+2iqLS/mtmATkTU8U+p1OzXAzezjJiW+lFYnIg0arZ
	HhFkfYCHNlnHkuAiHngzdXn78yYv0xBI6gffeTx8CW32Erv6gRWcUZN9Pq27iuxJqq6Bl/3qCUN
	XIr8LQtFG2sHiOfEVlCsqUp/oxXNhWvz5VVWVnrnofgkXM3xuv8k=
X-Google-Smtp-Source: AGHT+IFwDuY5C3WcSN2aOfE8ZZnwgCATzxmQx9lXNsr2Qs1JeAeImkL974gB+Vv6EiGt+VVJ/+3YNg==
X-Received: by 2002:a05:600c:3114:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-442fd6445bdmr279969615e9.17.1747949786618;
        Thu, 22 May 2025 14:36:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cde6:bb40:ba97:80d8? ([2001:8b0:aba:5f3c:cde6:bb40:ba97:80d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23bfdd9sm115272225e9.18.2025.05.22.14.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 14:36:25 -0700 (PDT)
Message-ID: <d70b742de728cec73918552584a6374e688b420b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 00/16] FIT image improvements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Cc: marex@denx.de
Date: Thu, 22 May 2025 22:36:24 +0100
In-Reply-To: <20250519110838.82978-1-adrian.freihofer@siemens.com>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 21:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217152

On Mon, 2025-05-19 at 13:07 +0200, Adrian Freihofer via
lists.openembedded.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> This patch series re-writes the FIT image related code. The goal is
> to fix [YOCTO #12912] which is a long standing issue.

I ran this through testing and there was still one oe-selftest issue
remaining:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1610

oe-selftest -r distrodata.Distrodata.test_maintainers

should reproduce. I think there were challenges with the recipe
sometimes being buildable and sometimes not so this might not be an
entirely straight forward fix to work everywhere as I seem to remember
reporting this one before on an earlier version.

Cheers,

Richard

