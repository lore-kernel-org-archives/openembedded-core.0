Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.508.1605890023624648764
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 08:33:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dWIq4L59;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id h21so10334787wmb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 08:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=T1WZuM7Bo8Miu9Yzw6jRwDzZUzQ+63fM0PqNgv/smk8=;
        b=dWIq4L59WwNdNSdW5i30yutEhdvAqUCMfB3RskvkAk8b/xaRSkRYc6KrF2aSLA95ci
         AfECh8gk8+EZYfhIo9Ekcd39uNRv0BMq+PXqaoBB0o/P8mavUW2RoSNlSVTIT/QSvNoC
         6fsHi+00suL+1efencnNMD3x5Lp0soRS8QQQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=T1WZuM7Bo8Miu9Yzw6jRwDzZUzQ+63fM0PqNgv/smk8=;
        b=XCAh6OFoM95fhCMGVEhiru4aSohmZ37CYew3ajJoI8imG7ApaU98Bzmbp9YH9S5c+k
         AU1dvsWYtqTtm+nslTq+kuKuGP1rQQjHCpvXMYyWHvea4W9TRzpkqOi2xTH0YA2mIVUr
         rUQ+mxcs8ZmrbZ+09PllH9yF6meHVlbsRXeAx3NyT4N8lnM68iuXBj59my/r+TPmvDQn
         vxZud+XtOh8YWAvPaCYGm1T/QtXFgY8foqzmoE7KhrdzEQTBWHjreHqO/k32DeAo+Bw8
         LeC55mC6W9ge4kVzeNQ9oL6IFoiEGex/CIwKdZDKEYVKIwRiP8XqgUHcrvj65p2nBrPp
         qN4Q==
X-Gm-Message-State: AOAM531mcqsILkBs8b7wEygQSRbuhrg2rty0fD6uBANXWykwZSqP0EwQ
	8qVP3UtYzl0HU+XyAfi7EGYRWetZvePXAA==
X-Google-Smtp-Source: ABdhPJzlmUv5PcOnZk2IaQfEt5C4jivctAZDmU4ZkN4gZGhaRAov4W7kfCngrueB0R7e/gQBBDzKFw==
X-Received: by 2002:a1c:55ca:: with SMTP id j193mr10825932wmb.87.1605890022180;
        Fri, 20 Nov 2020 08:33:42 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6000:b209:4d60:3b8c])
        by smtp.gmail.com with ESMTPSA id o10sm5056908wma.47.2020.11.20.08.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 08:33:41 -0800 (PST)
Message-ID: <d17ba79683fc8058b9697c3bbd8e691c834a7a7f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] go: Update to 1.15.5
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2020 16:33:40 +0000
In-Reply-To: <20201120081520.1356830-1-raj.khem@gmail.com>
References: <20201120081520.1356830-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-11-20 at 00:15 -0800, Khem Raj wrote:
> Define CXX_FOR_TARGET and CC_FOR_TARGET for target go
> since we are cross building it, it helps in defining the compiler
> for cgo on target
> 
> Disable CGO_LDFLAGS for go-runtime since it confuses the linker
> 
> Fixes
> > Building std for target, linux/arm.
> > go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Fix go-runtime build

Various failures in world builds:

musl x86:
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2728
musl x86-64:
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/2731
no-x11:
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2729

Cheers,

Richard

