Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE93C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 07:39:33 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.6231.1742283565966033825
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 00:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UsRxod2S;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bfca745c7so54923831fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 00:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742283564; x=1742888364; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yDru2v5W2pbRdxedkM/uaEWPkQn8FkyNhP4rO3NJB8A=;
        b=UsRxod2S1Sd3yAqzFy4XpP0jo/gZmRz7XfFMS5/Hlu1fxtrkAYACTL+egNCisAWJjn
         1V4NKLHVzcD3YbeUUzGoXZWhf7SxiZyU6f/qL5psG0RS2Yhb0bDuRBah5fiky67eB37F
         nThYeUODQydDcvnYy933HIdgLPDDqTOMhUj8E2l1cQrgpP/cFbP5o5r1r6zNAkrJaCsW
         ySsw5xN+KbmGqwTdRQaUvoIvuybYbx5/lwl1Eggg8WyTq7UvLMSXKernK8erDXnndnoj
         n0CHuIhNPPhiSRuE9L/hJkGVZofBdm+7jfNtusgUcvgKEGTXd2F8l0sfwJLlfIw/bxEK
         m77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742283564; x=1742888364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDru2v5W2pbRdxedkM/uaEWPkQn8FkyNhP4rO3NJB8A=;
        b=e+MyK2eWy+PXTGiVZu2+QxNle4RyKs3BMpqjCIPPJwuA5a5zLVX2ovl1HlZbdeFIRA
         HHLpvs4QTw3PHdNEmDr0aNmBSNtmSzqFc3nBWKjV8+pFtc/cPPx2vrUc2Ar7JWJHk79B
         fFfg5UR5lRpLM0CGblu5h4B8rULCw/sKOycNeOTW0vLLzGfyzGzVSB3N+P3tlNGhO9hA
         q7+gidxGyo2lKuYHzGVATcnRkrnnDCS/o3KBbiajbIZUMn1xJW1nToSspAr7lX8EtwRR
         s0KWC7zhEbSdSvP4UN+RS6O03L4bGNOIQGdfKBZyFrtE2zZ/jiP3mDOm9ha2pm2FEnP+
         Rumg==
X-Gm-Message-State: AOJu0YzqcoMms4YWPkYNiyiqf/WXz4Q4HAsdvhfreW9EZugAvmAfiqiE
	1eHK1XkREMWmu4WvfQfHFgl86BaDfFx3IY1HPG68L3MrHB2BIYqQUTZQbL0puHM=
X-Gm-Gg: ASbGncuVHhFULpnkCAist6c1G2PmJp9Z0t/IT279Ct2gj3s3GLpXNrAPKF9y2ROdkN+
	uZUsF2TIr3ZRtcvjLVoztIYCu+9x2XNWRU2CSjJh7+4OZGcuvDB9VJhsHCmb8rTCoYFk2xtGG0g
	4fLwLQdulY2Rnb0TJWAxhdFLAO8B0LX3BSSTrx2dmZCFeLYh1MvPQZSOENoLu2Yq2cuks4OuZO6
	EqEsPKcRz/+N4YpBQR9iNiWlqsn2m4x7IBB3QRru2ThIzceASasiG40sWxL2IBr0uawKNbWL65z
	2nM8946S+RbpYlFpRLPfSk2qi2twxfwX5c9ZQI0AR1ZHl7sFsZK2g2ezfEq1jk0f5wxV78D3K6x
	d/wxLhdgQyA==
X-Google-Smtp-Source: AGHT+IF3piiTQzpMqh5Xokq2jJaCDEOR3wERmoQW5E1nBw2Z8aH4eQiHeMdXnnnN92IAMsFZ9eQctA==
X-Received: by 2002:a05:6512:3e16:b0:545:48c:6de2 with SMTP id 2adb3069b0e04-54a03b9061emr2447421e87.13.1742283563675;
        Tue, 18 Mar 2025 00:39:23 -0700 (PDT)
Received: from nuoska (85-76-49-158-nat.elisa-mobile.fi. [85.76.49.158])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a835dsm1598298e87.8.2025.03.18.00.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:39:21 -0700 (PDT)
Date: Tue, 18 Mar 2025 09:39:19 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 12/12] systemd: upgrade 257.3 -> 257.4
Message-ID: <Z9kjJzXOkfoHT9Gn@nuoska>
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
 <1742278912-2989-12-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1742278912-2989-12-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 07:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213183

Hi,

On Tue, Mar 18, 2025 at 02:21:52PM +0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...ystemd-boot-native_257.3.bb => systemd-boot-native_257.4.bb} | 0
>  .../systemd/{systemd-boot_257.3.bb => systemd-boot_257.4.bb}    | 0
>  meta/recipes-core/systemd/systemd.inc                           | 2 +-
>  .../recipes-core/systemd/{systemd_257.3.bb => systemd_257.4.bb} | 0
>  4 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/systemd/{systemd-boot-native_257.3.bb => systemd-boot-native_257.4.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd-boot_257.3.bb => systemd-boot_257.4.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd_257.3.bb => systemd_257.4.bb} (100%)

systemd-systemctl-native should be updated too. Or set the PV in .inc?

Cheers,

-Mikko

