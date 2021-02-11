Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.7265.1613043831772197470
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 03:43:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZTmxB4Z8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id w4so5257152wmi.4
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 03:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=+1FZlPHSyNbAnLJy+qvScxAFbuImKpEg6d1W1UrFo0A=;
        b=ZTmxB4Z8VMB9LlSdFGJW3KLtIXCgz6w9y0b8QYrtdG1hOPa3xBTPE7Gqq4jR3TAXtH
         rlRM+RnABmNCKZmQAYrOuLUzDmhG93hfzwtlr8kK1auuI+Orf2SYawyC8SBvVcVyzlZu
         U8z+HtlLOH0ozbJr0vpttQXjp2WmTcof4ny4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+1FZlPHSyNbAnLJy+qvScxAFbuImKpEg6d1W1UrFo0A=;
        b=AHPOo/kSSZEKr30Z9DNBTnRQXSmDzISsbYgQ8dteAypPTYLhp7qRc747cGVs7Huqd3
         g0O2qDP7pkK4kKY+t0FAZKuN21wzzUWTq708IkFzr+W1/YyIHXujBzCZSxccpBViGV6l
         ej1y4P/8uXpO0Wx9FUYhMn3q7BhJLADcSl4yYcNd5f6u1tv7qRGvjbxb5clKN6+j8sL2
         PYxFyhgEAVWO90KSE8n2MMkaPU0KUzYX3I9o4XUMSWHQ5owk1r63BWAC9u26LtGSMAFL
         54RdL8I7i8rwNhBQTCoM+49F8G7Bh6BOasR8JhWXADIsm8Ijilbg/g8HPDM0GcuyKz6V
         dNDA==
X-Gm-Message-State: AOAM530KYK/G6SHI4EUx3ZhCtCr5SPAlKwpZQ0pnz7R+U1evabL33PU6
	T4sW3f74IjapBUdpi2RgaoY0Kg==
X-Google-Smtp-Source: ABdhPJxAzsrv9YRSCjZ4NJHHW0l/CG6dx1h5YWy3LnoS2HCYZ+p5QP2F7dYbXkqZQKQQjFaIi9ulvA==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr4750578wmi.69.1613043830337;
        Thu, 11 Feb 2021 03:43:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1f44:6379:818:1e61? ([2001:8b0:aba:5f3c:1f44:6379:818:1e61])
        by smtp.gmail.com with ESMTPSA id k205sm10453095wmf.23.2021.02.11.03.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 03:43:50 -0800 (PST)
Message-ID: <adeb07bdec1909082286a2dd6d16757adaf9098e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] insane: Add test for native/nativesdk inherit order
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org, tomasz.dziendzielski@gmail.com
Date: Thu, 11 Feb 2021 11:43:47 +0000
In-Reply-To: <AM9PR09MB46421810B3B2B59AAB545357A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
	 <AM9PR09MB46421810B3B2B59AAB545357A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-02-11 at 08:21 +0100, Konrad Weihmann wrote:
> After this patch got merged I notice some "noise" in my builds.
> 
> For bbappends which inherit unrelated classes I get a lot of warning like
> 
> Issue: nativesdk-openssh: native/nativesdk class is not inherited last, 
> this can result in unexpected behaviour. Classes inherited after 
> native/nativesdk: my-custom-class.bbclass [native-last]
> 
> First it doesn't give any hint that this is caused by the bbappend and
> secondly I have no idea how to fix that (if that is even possible).
> 
> So I would like to have at least an option to ignore these warnings for 
> classes I'm sure don't cause any conflict - something more granular then 
> just to deactivate this pretty useful check.
> 
> Thoughts?

This shouldn't be too common as most recently use BBCLASSEXTEND which
would ensure they're last. Which recipes are you running into this
with?

You really don't want your class coming after native/nativesdk, if you
understand what that code is doing you'll realise it is rather risky :(

You could turn off that warning for a set of recipes if you really
don't care but I'd prefer not to make that too easy.

Cheers,

Richard

