Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.305.1610042223109566580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 09:57:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M7i5f9yf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id a12so6485484wrv.8
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 09:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=g/bDP2RjF/6vcFkD08H9wQ+3Q/DBNwNjtVz5917o18Q=;
        b=M7i5f9yffw/6wjEPlOoz27KbGUFPkVg28500K8QmOfqE1act4psV1sy1QdsjQVPvVH
         gDGs7g/i/cJ13n7xK7IBTaZ1So8m4fm0cTcpuP6Ar98sNa6NAqEiG2TJqsy8fEuEE/Ky
         Llxkm3c8KVHohIbw1cSysrzl5sUtuzZqx167U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=g/bDP2RjF/6vcFkD08H9wQ+3Q/DBNwNjtVz5917o18Q=;
        b=QqAaufyH7uqhbpqw/ji5kWyldIi3Pq7vuhEjCQW6yJUyBRDb2LNF52ZA9Zkm+aCaEs
         z5Cvnn4j4G9izUVfxN4q75Wd88+44NfnA1LOHv4QnoPYyfkA4DJgRDevuRYd53F6pqhw
         vC1aZQB02IG7NTJHsoPea4AjLP8EAUgYypxtDxCrleROcULqTGD16OURWCJVJaQbz0RT
         9xCkLFOoOxpKk/H2kVJV87ok4QdNPAZQ+vRDMwzyqjkqOxaPGrw8e+W9R+NfRgsu7WEK
         N/23syauCweAukXnuQUvpnG2mXJR1J0pTh/33BX8AqLQv/c0T3wYuS86CzA5zH77112b
         r9cQ==
X-Gm-Message-State: AOAM531+m8CJQV36LRAbw6m4mJQyYifX/uN2CxFnna4bGv08xFLsryGm
	inDlIFla7MRQ2jKFraorZEZJTA==
X-Google-Smtp-Source: ABdhPJwiKIk6Rmw6l3xm0dTaRHg/JGhuI/Eo3o5W1RmxENhZ9RL5fuNnkSKKgh4dxcwekbEkp7ngyA==
X-Received: by 2002:adf:dd09:: with SMTP id a9mr9992199wrm.90.1610042221577;
        Thu, 07 Jan 2021 09:57:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f082:51:8822:ee14? ([2001:8b0:aba:5f3c:f082:51:8822:ee14])
        by smtp.gmail.com with ESMTPSA id 67sm9384860wmb.47.2021.01.07.09.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 09:57:01 -0800 (PST)
Message-ID: <1b8809a765eb36211ecc39a9e096ac207178884d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 13/22] bash: update 5.0 -> 5.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Jan 2021 17:57:00 +0000
In-Reply-To: <20201228200436.78130-13-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
	 <20201228200436.78130-13-alex.kanavin@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-12-28 at 21:04 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-extended/bash/bash.inc           |   1 +
>  .../bash/bash/CVE-2019-18276.patch            | 386 ------------------
>  .../bash/bash/build-tests.patch               |  16 +-
>  meta/recipes-extended/bash/bash_5.0.bb        |  80 ----
>  meta/recipes-extended/bash/bash_5.1.bb        |  30 ++
>  5 files changed, 40 insertions(+), 473 deletions(-)
>  delete mode 100644 meta/recipes-extended/bash/bash/CVE-2019-18276.patch
>  delete mode 100644 meta/recipes-extended/bash/bash_5.0.bb
>  create mode 100644 meta/recipes-extended/bash/bash_5.1.bb

There is a reproducibility issue in bash 5.1:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210107-8jzr3hc5/packages/diff-html/

looks like the issue in in redir.c and I think at a really quick
glance, the computation of PIPESIZE. Seems to tbe 0x1000 on some
systems and 0x10000 on others.

bash 5.1 hasn't merged yet and is in master-next. 

If nobody else gets to it I will dig further when I have time but
wanted to mention it.

Cheers,

Richard



