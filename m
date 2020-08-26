Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.4757.1598475920137237983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 14:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GwKgWZT0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id x7so3291893wro.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 14:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1sDuWE2t05BEd8JI38yAQ0X0yQ9BYpyoji24cLsOdHU=;
        b=GwKgWZT0IezwP3hU22gvA2mLQGw4HZXzV92ha9WfJnN7GL2r0B1xQbWamOHcDxEE71
         0yuJy05r0v+GP3MAuiAFB+dn1HCioUHFtAM4/x6db0smXfP1vXf4YhbNVKT61/fbO0y8
         Vw1Ep/Ho/e4FTgZ9FBz5zvrEgaQY1paI8oLvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1sDuWE2t05BEd8JI38yAQ0X0yQ9BYpyoji24cLsOdHU=;
        b=fQ04Pv0C5tkUTbaK6weZexl7XGNwViYWUgEkK7/xPxHnwKVp5sLK0iaYiOQv2IGMPq
         ++vOR2D605qPg6oVBsrI5CIG01Zq1Hk2+pxzJ8wGWt8t7DELPl5JYj+SB1kj9IGevzn0
         ghCrUqDLvKkHQLvcMBz+PzRVlddWCgFdBdLfIFl7v1MA+SMgR7wyUVxweqi6Wl0vx8h3
         mxonI3MTQfrzfdSDTERI4jUmA8eSBGV1rkZF70TNInuq1EACf8Zxfk+GudwzUh18QmqE
         Su6+WKK4WB7kWMIsI+s8YNyvPl0V6edeTmTXM5keOVKgWDPVhSGraHOsjNrWLSl2Wspk
         QOrA==
X-Gm-Message-State: AOAM532DtS9Q0RCrQTv4hsWzs1+1JojFQPagqQG47ZFHfnTjerGOZyAv
	1zHmpqrEemBQgkvBwynTK4hjAg==
X-Google-Smtp-Source: ABdhPJydV8qu4V6Zo6Q3S86c+1XGjeFrc72r/Qhednx37Rk+CZ0jgMEZ7fkkybq+Eu0oXyOfHeGd8g==
X-Received: by 2002:adf:b442:: with SMTP id v2mr9410996wrd.213.1598475918302;
        Wed, 26 Aug 2020 14:05:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id g9sm634586wrw.63.2020.08.26.14.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 14:05:17 -0700 (PDT)
Message-ID: <569b250844bbf9091048e3514f2ff7f168015f5a.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/1] pseudo: fix renaming to self
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joe Slater <joe.slater@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Date: Wed, 26 Aug 2020 22:05:17 +0100
In-Reply-To: <20200826185857.24292-2-joe.slater@windriver.com>
References: <20200826185857.24292-1-joe.slater@windriver.com>
	 <20200826185857.24292-2-joe.slater@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-26 at 11:58 -0700, Joe Slater wrote:
> Pseudo tests for an item being renamed to itself only after
> information about it has been deleted.  Move the test to before
> we change the database.
> 
> Note that pseudo does not support renameat2(), but neither does
> glibc.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../pseudo/files/rename.patch                 | 73
> +++++++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 meta/recipes-devtools/pseudo/files/rename.patch

What I'll probably do is queue this to test, but then merge the patch
to the branch in the pseudo repo and we can just update the SRCREV
rather than more patches if things test ok.

Cheers,

Richard

