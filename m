Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.32496.1613982248433057706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 00:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NvTa/9XX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id b3so18066704wrj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 00:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=IdWKgjbNcCtJ+1pQa6Hvp9WBANBleoTzr8N1vqkTDEU=;
        b=NvTa/9XX2EmGqD71ZXOrtVlP4DN7MLzjY5Ddjli9GAJJOBu+kziocX1hWldmjWLkKU
         jTF2sDwU024TaJ24juiXrXSd2iBUtPvlJ/H1YQxw0IxeZoBBs1asn39ul6qiP/JxMXG6
         v03kyYvy+heqbzT5A4Xb62vdWRDsI65cTPkWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IdWKgjbNcCtJ+1pQa6Hvp9WBANBleoTzr8N1vqkTDEU=;
        b=ljExjlBT1/mJ5OP2tqfejp7sOYy46lrNhbejsalBK55H0FYr9bmZCxjyLRwcH+c9wH
         BzyLI43YqH0yagDg2uRzrZQIjFew1J41MdzkeFKUA0iKdoz1MhGHH2X3uNCfaY3BfO9M
         RrctBGoDDpsPHiiacKEKBtCZedbE3g695lO5hOiLUoTc9RvsBs1ib6quD/LYLnIYUy2Z
         25kBi1+oFtwxAcjO51gCbMxwDI/croPZRKaLQsz4rrX76JPSQ5j71hZSK/fKJJYTo4VF
         XGSnaR9XSa1QniNbT7sLCEBL2J3yXVpVl9zGe8PAzJXdL8ULnZJcxCO/O3QwI7KIP9cn
         crqg==
X-Gm-Message-State: AOAM530Pq/+gkG8AwM4ZAr0/nO5h91ANavNuHbDLU9t68MP0PfDGoE5R
	9mFSxImJw7Bj7aJtT/ccASRSJQ==
X-Google-Smtp-Source: ABdhPJyIotAoG0V8QhjWjWqXoGl2HBI0TtSxyoYM6PC9Z5gWbmslBeBnxSsTyQGN9FlkAVVVEkI3CA==
X-Received: by 2002:adf:f192:: with SMTP id h18mr20847816wro.340.1613982246869;
        Mon, 22 Feb 2021 00:24:06 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6747:849:8224:46bc? ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id 7sm15776469wmi.27.2021.02.22.00.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 00:24:06 -0800 (PST)
Message-ID: <99b61172c516c71dadbc7342da4e20a064299110.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel-fitimage: Don't use unit addresses on FIT
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2021 08:24:04 +0000
In-Reply-To: <20210221192210.5070-1-klaus@linux.vnet.ibm.com>
References: <20210221192210.5070-1-klaus@linux.vnet.ibm.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-02-21 at 16:22 -0300, Klaus Heinrich Kiwi wrote:
> Das U-Boot 2021.4-rc1 has the following commit:
> 
>     commit 3f04db891a353f4b127ed57279279f851c6b4917
>     Author: Simon Glass <sjg@chromium.org>
>     Date:   Mon Feb 15 17:08:12 2021 -0700
> 
>         image: Check for unit addresses in FITs
> 
>         Using unit addresses in a FIT is a security risk. Add a check for
>         this and disallow it.
> 
>         CVE-2021-27138
> 
> Adjust the kernel-fitimage.bbclass accordingly to not use unit
> addresses. This changte is required before we can bump U-Boot to 2021.4.
> 
> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 40 ++++++++++++++--------------
>  1 file changed, 20 insertions(+), 20 deletions(-)

This caused some tests to fail:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1855/steps/15/logs/stdio

Do we need to update the tests as well?

Cheers,

Richard

