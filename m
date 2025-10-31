Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA90DCCF9EB
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 07:39:05 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.9477.1761896341459452484
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 00:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eyrJGhRl;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-378d50e1cccso20617001fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 00:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761896339; x=1762501139; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Jf/aG8IfNSAS0mLi+mmatVXo82vXMYcFrAO/EE3/pU=;
        b=eyrJGhRleaMpTidFVvCHwPFsHkSUvlNYbcPa4zGsZvq/vDWkYEhkvk7qiDcLFhHZuq
         V2I5G+6bfVqHm3Tj/wtcOhh8f6WPf0m91Elwak9w4BtN9APXPDf3kr8r7STdf6YPgdhR
         xxIkAf0QpfpumfqrhLmtxVLnStn+rESK0tSKd5vTaxHWAd6cZ2G6KwBvNfRAkfWjGIat
         5ODRIf4L35OK7bdz4B522M+pTBuL4KyEj5vkstcvzAHfSz1MU4/6XxsBCiSjWkQv7KXA
         Rr+ihRMzRucR1dZIw72sn12B8wEtr832n/EfyZfj5fJaZ4NrbFOouJ3+AAP1VnK7qhpC
         9Yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761896339; x=1762501139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Jf/aG8IfNSAS0mLi+mmatVXo82vXMYcFrAO/EE3/pU=;
        b=p2bmC0hfCzb0l1FCPc5JnjfIzfO1jb+3HCq46QSEF3GmPCFRIbmFK0Y2yKnjfga3n4
         IcIc7XP1hBUlIoWDWC9i5RQDYTGpE9Bn4wcN3rVMv9msH/DOSuTg7WSpTLEE94y4GINQ
         8+4422cY2mDsNI8gPY2Rkp/lTNifvnMJjbuukidaQH1a6oSR++nLC9h+jFin8jAWSnxL
         XFxSQ4UMYcpr5ClS137s6/eKhte5Xp/o3juxz6LOZH5EpF8CrgHe6MHxMLeyla76eAS6
         k4ceP+RBUj46csXPJqxndHDG5wv7rdvGe8xrtkPkNsHyCxa38waxt1FkuRR/YeayG/cs
         WeBg==
X-Forwarded-Encrypted: i=1; AJvYcCXEo/TVamBFNacvGw544FEO1FJTEL6v5ssLmWILEL5qH1m6auo8eaPcW9t8+NBMX3rx26aSUJr+pRjnR2AogwaWSQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxyhj8aOkA0yPkq6j2+fA4PNOc6Y88/aCEuS/M97W1NUROvif/2
	Vm+Zr8yVfPKnvH8EJE9RSf4qlAjZ38TFWjMnVoSbaQGzZGv6z/lidsb+RQPtrjGdPsk=
X-Gm-Gg: ASbGncvzAtDVV/a/xOaB+uFR/kUbpUfFc5Ne2RWPDZFxhu64Vy0eV89Sl2kvn+sMJ5f
	EoS4XrzQWj7pfN9LejSlOk4LSxCLOFSrxE4cdwshK5YoUyn7oNCdcQ/RODXiktPCJ141pW9WS9w
	Nmv+osrRC0ZzauE+VXIkDqdcKy/ftcXAk2HzVBH+CuvwV8i97aABGnBZriFfX1W5Vw7PrGBcuIm
	rDYgombFyyQEsKc6WfsbWEIqhrklW5JhnltOT3PAFqKCsDKRHxkNFG9lWbzwOoRhdIt/hAk4pGL
	StgE6yMTYEgxc8IRbYgryMfr+HfcgT3rgDEGOODs6xiGDDPkYGsNQ2XPJR0ARx7AiQJW7BVNAsD
	7PR7JDnpTeup6cBDgkADirlB9maHNLPvDuSSHEkwzDcNSytrEW2ROlvbuDWgtQ72gKBbTGfQRwI
	43GDKXwo6HMgUe2VXBh7HXRcYD0pZKn0WqOSve80PKIVIg
X-Google-Smtp-Source: AGHT+IHl2aL8oITLMZBtkWdYGA/AHRUHzhYkE/jtl8gmGEzBqsxVfKF4eofKRiWHM1GSD784I9uUKQ==
X-Received: by 2002:a05:651c:4343:20b0:36b:f63:2785 with SMTP id 38308e7fff4ca-37a18dcd056mr7568641fa.27.1761896339218;
        Fri, 31 Oct 2025 00:38:59 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1bfc6f7bsm2196701fa.23.2025.10.31.00.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 00:38:58 -0700 (PDT)
Date: Fri, 31 Oct 2025 09:38:57 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 13/14] yocto-bsp/6.16: specify genericarm64
 SRCREV
Message-ID: <aQRnkadzjrcYDxO7@nuoska>
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
 <726ac598a129814be4cc8c7568a245fadfd7cb61.1761844161.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <726ac598a129814be4cc8c7568a245fadfd7cb61.1761844161.git.bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 07:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225535

Hi,

On Thu, Oct 30, 2025 at 01:12:26PM -0400, Bruce Ashfield via lists.openembedded.org wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> We had previously dropped the genericarm64 as it was using
> standard/base for builds. But we have some temporary serial
> patches only for these platforms, so we we are building out
> of standard/genericarm64 to isolate those patches.
> 
> As a result, we do need to set our SRCREV to ensure that
> the content is built on the branch.

[ YOCTO #15704 ]
Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15704

with 6.16 kernel.

> Note: we can also move these to the main linux-yocto recipes
> as genericarm64 has broad scope and is more than just an
> indidual hardware reference BSP.

Yes, I would prefer this so that changes would be in a single
mailing list and git repo.

Cheers,

-Mikko

