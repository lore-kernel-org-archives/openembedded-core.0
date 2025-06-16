Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC158C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 13:52:55 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.31007.1750081973791029245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 06:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gIhy5PMh;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fae04a3795so48377896d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 06:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750081973; x=1750686773; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xEPIk9ijpnOBRVRW0CpkPMkhNeFkiLWV8LKijmj3nYA=;
        b=gIhy5PMhlsdPa/sUCzgkFPfg/k0uZapet4dlmcd6q2WJhJZSf1GKMSjO9B8LbmFA/G
         13sziEPsg7peYZOM0g2NJxhdpCKfa4SVwMCxia+pW4LqX8ctuYTxZr9E5Yh6JFlYeQLK
         Z8UAzfxJi+8739aDLBQApcuyh39fTco3s5X2yPiiQmbXEgImA0X8hLuoIAeuJYIH32iV
         rpKMsJUwGLXMUX8q/fM5LWovocADqvGcyQdGlkk5WNb+sbS99jJ5DONVmrOTkQ5vjvLc
         nxt2V+yJlpO7wxZ4yffHauD3ezTUVuGVUaoOjHjO7DKbYElg9fRQo8MPGoss6XoI32TW
         Zg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750081973; x=1750686773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEPIk9ijpnOBRVRW0CpkPMkhNeFkiLWV8LKijmj3nYA=;
        b=JiwyRqhlClqAy3yzhOHiu1k03BsSnHfdI3Y+oVjih96Kki0LkuULTg1oJ007lqnPra
         ki3ZqgEy1dGegnwp9jB5VKvnjvMTb4mEkq6CsfAvhbta05HYB4w5MTE5HjRPqEo1tyV6
         LIYt7CyjAvpYaSx9QoQ5A0AcOfvYwIMZ3UR3cEltGrtR/38/exsX4zTQBeGEd2MX4TR7
         UzMkQ2oYlwtevQN9UngT6MqldjAJzlC00egP91/ZkADXijYTinOZaX2xHIQrnbBlbqxf
         JyAcEOGdy5j4bSilPteYuDYiYYQFT4uSU+7t343XgjFI4+7aEOJW2YmVNlBO9tsf5gGP
         VroA==
X-Gm-Message-State: AOJu0Yz0bjtUbE5Uo2c0CuKMwelkUc4mw+5W+0ZN+J5M6MvLkXV9nVSl
	pKkusOUrHLhOlXoQrxsHzB6OA6VxdMaPhYOgnv1hE8ehs//taDq3wVbbkkwon9ozXjTH5BflhNr
	QPNN0vgfJc7Q8IdqFn5gbRbyAxjNz3U4=
X-Gm-Gg: ASbGncv1GAyB/ODIAxVqsdnvTMJ8zTdQw9PpuQuggH1LNwaFf2PAGY3DLjINfjSqFVE
	MHDzCa1xgHaUYm95izgHygdLeFzhs9MRKeHvHzGMIP76D1vQ6aWGWFnVc22Dw1hGPj0erU6rkau
	CcTotpdAHRJyObvK/A3MfORpRK1Dxv/14IeL2Nc675y4dVhN6+9U8mO6vg/JlJhe0hHdIe1JMzq
	FJ9IARXBVkBmUjE
X-Google-Smtp-Source: AGHT+IEfa672iYQcrNsRP1TTmK53Ofz82fTrswQsGFp0txmQjV3WgWDZLwcN1uqilsBzNvk96hSI7JBsHLQHddy5PRc=
X-Received: by 2002:a0c:f205:0:b0:6fa:9d4b:fa10 with SMTP id
 6a1803df08f44-6fb4724ac41mr146950176d6.0.1750081972751; Mon, 16 Jun 2025
 06:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250616074341.32477-1-jimmy.ho@sifive.com>
In-Reply-To: <20250616074341.32477-1-jimmy.ho@sifive.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Jun 2025 15:52:41 +0200
X-Gm-Features: AX0GCFtjWdIbryH_SiF39XUff-cAW8nf4ws28RwATL5KtG7tJssd1hV2OhcxUWs
Message-ID: <CANNYZj-njPQU9VN3yxZSs1cRiWNvZ172nzV=abD2jVm0mGfpdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nfsrootfs: disable warning message if bootargs
 root parameter have not been defined
To: jimmy.ho@sifive.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 13:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218825

On Mon, 16 Jun 2025 at 13:56, Jimmy Ho via lists.openembedded.org
<jimmy.ho=sifive.com@lists.openembedded.org> wrote:
>  nfsrootfs_enabled() {
> -       if [ ${bootparam_root} != "/dev/nfs" ] || [ -z ${bootparam_nfsroot} ]; then
> +       if [ -z ${bootparam_root} ] || [ ${bootparam_root} != "/dev/nfs" ] || [ -z ${bootparam_nfsroot} ]; then
>                 return 1
>         fi
>         return 0

This needs a bit more explanation. What is the warning message, why
does it need to be disabled, and how does the above change achieve it?

Alex

