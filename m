Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CFBCCF9EB
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 07:34:45 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.9429.1761896077267163181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 00:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VZu47t8V;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-592f7733dd6so2159428e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 00:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761896075; x=1762500875; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sFBWSz6ccCbVQppxPwDrFVHLPOo3h3UGwbG8bbSj4HY=;
        b=VZu47t8VMlJoVh2h2D7kB8rXi2GpBp6v5c6CFR7KNmYvDW7gAGc5cFBGigH3xC+OLt
         izPNWT3JPE8M/nBDokHZmwSaO1/9vZlupQKGgWmnJpIAuoZOj3hl2jiii77a65h1byNF
         AQuJYOAUpXs9KmXw5kNn7j5Cxfnz/ruYptjz+gxLc02b63g1gEpCPfc/7MKsF4COjyad
         n9jswaZIwJwI7CiQeBu0DPCN4ZBmj+U68SBfa0iElsdJtMo/N/Vcjydw5XAq9N7vqqau
         GMi8/jTqCqXN6Lp2ho+TzK0nqp5CYNX6xtW4Cn9L3FHFEvFJhzz+Cu560zblTrxJBHtd
         Pk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761896075; x=1762500875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFBWSz6ccCbVQppxPwDrFVHLPOo3h3UGwbG8bbSj4HY=;
        b=dcgMBgo+tFScdFk6Fgj1BaKX/bWDtCpgmPoanaMwQ1Ov0ld4Xr9rLx4Ke+HJqA1o9f
         nFIMoMgBLOr9DGqNVJttGZYNTR7NtkAOGhFwldhCKWrnP5+d9vUrL6dmHcfgZKkt00mr
         p8EuyfvO6toFIUVGZo/v6X/7gktLD4QnF0MZTCCYN+fWWe7ps/Ou7mJAqyZSpmJXaziw
         oSvflOanFXRQS2Ahu1bbhpnbXDmyzD7NaeQBYSDQoe35XTx0mJ4tGJ+utmx6byfhqxjS
         ykMZX1WXeJGirfei1JCY9ojYfl+qU3SOBiePliLqkyWWC13JZE8Fqi1bTlC7O8jUmFqJ
         wX7g==
X-Forwarded-Encrypted: i=1; AJvYcCV7fqiQTReaCgkqwP0t4wGpReZ6zfALX29bGuFQCcmEk0wPQ90AWzLcCLgjuuW2fi06mkn+jBoWsAhvEgJejBG4GQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyszHN2Q2hub6eECIDUzBakQ799q7VuueNa98QJbcgLoKa9Ed+6
	9CkPP66YQJPeeTbgxxkbCr852STo1WgG95A8Lp26GA+9neNnI44EPJlHp6pq7uvCw30=
X-Gm-Gg: ASbGncuY7AnQx6yDedQhP+qTVtgPgcwXg99GCcSf7UCwsWLXbHDDsCUOdStz/Cbd78d
	YWcztmbHxy6yOco5xjmj7zyMAs9XEUt2widbDbkdauNIzoaShjsAp5ARvwl9KMtyxUFYDzO4EPu
	WyBwgmGEuHBixZ8gDk38Jm9bVCyOhcP2/IwZzIg/vgaIt5kFDuMKPvYPkuFY7wZdDYMAN+AFdag
	Q/D+v0PnQh4RGEXV71EqOtI6P8Y999G2VzKMxvoXImprp+WA6yDQX4m8kmKG152Ijg6JCjmqVdc
	WKz02FCygsVUXWHdxiEAAIyObKOX8HnhwdxMSDuYT5apgQoWH9uW829VpLPd6hsckSZiPx89E5Y
	cxUj7QYt6TtYk5AScle35+IU6DNUCmtO7Grr2AeUiVTyuJNtv2PJsMwE0VokcWdoJCw6/dEiuLu
	dEYvxHHQEE7Sjp5qLeNaOzd9idJeNTdCopYqnKAIInTMel
X-Google-Smtp-Source: AGHT+IHtupV9dkEMxoENIaYHr+OwAyrX2/rCa7ZetgOJSaKIFFuLVKFxN2FjEsUItb3DjvjoA/Q6gg==
X-Received: by 2002:a05:6512:3b89:b0:592:f5a4:ece6 with SMTP id 2adb3069b0e04-5941d50190amr954650e87.14.1761896075414;
        Fri, 31 Oct 2025 00:34:35 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5c2648sm314182e87.108.2025.10.31.00.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 00:34:34 -0700 (PDT)
Date: Fri, 31 Oct 2025 09:34:33 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 12/14] poky: make linux-yocto 6.17 the
 preferred version
Message-ID: <aQRmiYoqQbjFd00F@nuoska>
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
 <af06dcbe41bf640a6b3d23301a26b801f0fcd31e.1761844161.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af06dcbe41bf640a6b3d23301a26b801f0fcd31e.1761844161.git.bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 07:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225534

Hi,

This and the yocto-bsp patches should go to poky@lists.yoctoproject.org
list.

Cheers,

-Mikko

