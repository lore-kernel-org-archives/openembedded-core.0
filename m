Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.5623.1611740980246934284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 01:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RjjXlX/5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id c128so1042934wme.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 01:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=YdO9wjl493OK8gdroI6OQ6miYrhG4dxxSp10lW573w8=;
        b=RjjXlX/5fqoQMdtzUsgVB5HrO30YFW2JN3pj5bcJZBeO0mIWuDuNJ5z9P8YF6ndM/Y
         RVTy7IvZD5+mAfCOxbzF6hwiWeiUQRwj7iXfCfLTEobXOg+Cg/rWNSa9aqD7R3jHfpi9
         Tkmlf+2c/0HA1Vx42CqTLv6X9SXoN29gPTC3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YdO9wjl493OK8gdroI6OQ6miYrhG4dxxSp10lW573w8=;
        b=T6dFphHpLPRSxlT9FHDRXakB9oNq/p+59LX0mKkAA+/zmc6NaY5qE0OAicl9FM4yF1
         1XjOCol/4g8l1kAYox2CVgMVQhNsJKLAW92RWcOq3Em2wfxEXjHU0tpFJVcRX2q6i1Q+
         c9InhMuKN7IGm0s60wJ9gWhvBjqQN+b900UqJb9AWrPlVtiKb20ltf0ONT44D3Jn/2OR
         gcL4KMg++Z+mGYWQSPtRlfkMUsMjpHvY07C7L2hLc0pm9Nmq2AHgILUQIR7XBT9l26JB
         mx5I3+l6RVqOyJeydgg9bAabLsK0nwNyjYmcxQZwCIQQVkQvi5W3zjhvzb1wNfFtf46r
         PCVw==
X-Gm-Message-State: AOAM531wKe7c90FnA4GyxREfzjHRyNfQed0MPgcLj7nRbNxfHr0Y9zGD
	RsCQmm8a9bFF/+KP06ZvBrgaXQ==
X-Google-Smtp-Source: ABdhPJycXNTZcbBgVTSf+TcLKHpc2njjXYhVojCraSERHe5DMopZGbBhlMDaZsp7BnUop3w1+nuKfg==
X-Received: by 2002:a7b:c217:: with SMTP id x23mr3531200wmi.170.1611740978768;
        Wed, 27 Jan 2021 01:49:38 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc? ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id w14sm2185892wro.86.2021.01.27.01.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 01:49:38 -0800 (PST)
Message-ID: <423d07e79bdbbacc58d63ff64c8fa1bd8f70f9f9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: verify that user isn't building in PSEUDO_IGNORE_PATHS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>, Dorinda <dorindabassey@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2021 09:49:35 +0000
In-Reply-To: <4e6da54d-f6ef-9c04-4bdb-5af64807cbd7@windriver.com>
References: <20210125230811.21862-1-dorindabassey@gmail.com>
	 <77ad8e184576449791b56fe9c6e0fc872cc98a42.camel@linuxfoundation.org>
	 <4e6da54d-f6ef-9c04-4bdb-5af64807cbd7@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Wed, 2021-01-27 at 17:46 +0800, ChenQi wrote:
>  Is it possible to use an opposite way for pseudo path filtering?
>  Instead of ignoring paths, only take into consideration paths in
> something like PSEUDO_CONSIDER_PATHS.
>  The list should be short. ${D}, ${PKGD}, ${PKGDEST},
> ${IMAGE_ROOTFS}?

Its a good question, I was convinced by the pseudo authors that it was
a bad idea. The reason being that it isn't just the above paths but we
also need to catch calls where files are transiently in other
directories or in other parts of the filesystem such as /tmp/. Code
creates files in interesting and convoluted ways to preserve
permissions, for security reasons and so on and there was a worry that
masking just a specific list would cause a different set of problems.
It probably shouldn't be crossing filesystem boundaries doing it but I
know there were complications due to it.

That said, now that pseudo can support path filtering, it may be worth
an experiment to see how whether it could work better than what we're
doing now. The algorithm (whether its include or exclude) should be
relatively easy to test.

I can also say the above list would need expanding as some sstate
objects need to preserve ownership/permissions during creating and so
on. It probably would still be simpler than our current ignore list
though.

Cheers,

Richard 




