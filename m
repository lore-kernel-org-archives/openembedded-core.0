Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.6886.1610443388437216292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 01:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PQBDnFvb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id a6so1252556wmc.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 01:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=qgdioImAj8y1O2rFhM3A7/clxvv9EZXPrz91gZQttu8=;
        b=PQBDnFvb9S/Lzt/h+0kMtBouHSYIUOZz0UGYArgC8IQGvWQE489OEy6EEqe22y8yma
         4zRzSB/EuonbH9ujKYMuPouc8hg0l/OAz/jY9aTHMLvB8IgxDXM6b6oaHN5lKOr2Ljjx
         /xsbQhHaWtKyY9mVB9fWmUEzq982AwFKUph9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qgdioImAj8y1O2rFhM3A7/clxvv9EZXPrz91gZQttu8=;
        b=NicVMWpYiNx0g7zQqF5Ej91sIPBk7v6qWx2b3XphxUF8xYC7RuluvYJzxh9GoDlL2g
         oDXCQPo/e6n9Q9TrnyLtgvRsQRx7XYmzrUE7vQG5hfes6KlUYCzEsHs8+AgARIhlnKxh
         FCeFg0ep6wmSqeRtTTN3gPzBMZfxzJBq1ietHqiVyWmKVkgBPc48mxjAohyRK62frO/K
         /aYsEsPbGc61UoRtqCKfks77+eyBrbEmEnWhmlIcOh56dkMF7QliMo/3Tg4NHaHA8qe/
         zxC/tWLm9v58BaMraFY9PUfptElJpQqymlI94yuR3a70BdesB1fOqriOgfjd+n3ztmZL
         AAng==
X-Gm-Message-State: AOAM532FZalZ+59CbC/AdNPBLgWG8PwtwLLip689HzipIfQLL60DLMua
	9zHSRpAKGl/vNUw9uVrZiNj/sQ==
X-Google-Smtp-Source: ABdhPJwS4zQ71KK2zG1Rrbe3hEx535nbKWHOUZVe1lHc4QfMsDjyyo8YIMesbiT3L2T8+nBTtSul9Q==
X-Received: by 2002:a1c:3d55:: with SMTP id k82mr2561267wma.57.1610443387047;
        Tue, 12 Jan 2021 01:23:07 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:281a:af36:8e71:af21? ([2001:8b0:aba:5f3c:281a:af36:8e71:af21])
        by smtp.gmail.com with ESMTPSA id h14sm3807318wrx.37.2021.01.12.01.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 01:23:06 -0800 (PST)
Message-ID: <2c1a44755df36e589420ae6c465442a3d9c9bf1b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [dunfell][PATCH] rootfs_ipk: allow do_populate_sdk in parallel to do_rootfs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Ho <Michael.Ho@bmw.de>, openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2021 09:23:05 +0000
In-Reply-To: <1610369166-221356-1-git-send-email-michael.ho@bmw.de>
References: <1610369166-221356-1-git-send-email-michael.ho@bmw.de>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-01-11 at 13:46 +0100, Michael Ho wrote:
> From: Michael Ho <Michael.Ho@bmw.de>
> 
> Switch do_populate_sdk for the ipk package manager to use a separate target
> opkg config file and separate the lockfiles restricting do_rootfs and
> do_populate_sdk from running in parallel.
> 
> This way if an image recipe includes a dependency to do_populate_sdk by
> default then it will run in parallel to do_rootfs saving time compared to the
> sequential execution.
> 
> Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
> ---
>  meta/classes/package_ipk.bbclass | 1 +
>  meta/classes/rootfs_ipk.bbclass  | 4 ++--
>  meta/lib/oe/sdk.py               | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)

Personally, I don't think this is a potentially problematic backport
candidate as we don't even know it works in master and it exposes
dunfell to lots of potential races...

Cheers,

Richard


