Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4B7C64EC4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 15:54:45 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.37235.1678118076004100700
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 07:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112 header.b=wyTv7KWT;
 spf=pass (domain: ossystems.com.br, ip: 209.85.167.173, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-oi1-f173.google.com with SMTP id bp19so7386722oib.4
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 07:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112; t=1678118075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRLyPUBl6DabrAFR1py5K4WhdWu+7LYWZPUgAzSDpPc=;
        b=wyTv7KWTY+dNROgSeV0vZe4V89my6qON3VftaONkmL76uyFH3BgYysDULJykoZjiK5
         nYdGTNW3uAykn6wn8ebPBJh1LRhaEtjIVjLF4z5D949S9eR63DDh13PtocvX7KDo4oCN
         lK7N4vUFOyxS4g/NvHIxvmglXJ/n5wdn3hZ7VD61LP+eR+xfRyg9Lv6kPisfWwnRyXrb
         q/R2Xz4d8m/5C5BBWtkuWI+DcUdZo8bwyYtKYXu6OaYOiU5QtL0WU1IRjTLlglJEobDu
         4Mkc7g6Hbu1L2guqnnbCtyuPJzVFUZXYop3uSHxYzLhWVw+iWcjylM7d336KxDt9wS9L
         noPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678118075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bRLyPUBl6DabrAFR1py5K4WhdWu+7LYWZPUgAzSDpPc=;
        b=MsHWBRxnwq/eTTt9BNyWr5vcUAI7I+fiK+fXbF6XFvUe6ar3TnJ8Bs/4o5Xm7KFP7K
         2Hebu2gAS2RXdhXbyQWA0T3/ZqztKrMtkBSCrf7dDZJYkY874rqt+Ho6LLJSM3tw0JaA
         xB5WxTPQ0miFK1Ea0BiXWeqW1v9nysJFdQIKRa0kSLTocXg9y1y1HttWEXhsqmMrTDCu
         bMJQNZN+sja9fIjTaThWjLB9MofS1JA+bdGyh+Z6ScBI1xFPdnli8/AVkQikm29/8+rE
         YfokcM/A7nPNTxj2RCbHjdHyvh3CS9ueFZMpyiCgBG0REES/m3iVKOXQ/gLmxXjnAN+f
         2Urg==
X-Gm-Message-State: AO0yUKXuxSIyVzSpNzGtag4sp5HsZlqDpjWWesYrF5wPlY1xLqhhFKEp
	s+O/MCb32BmUSF8Gmca2P5xkq7z85N5wLpy1ScqXpQ==
X-Google-Smtp-Source: AK7set+oWVKq4h+/k6TJBMLyjeQ4hte2Ep7qx2HUS1vqTlEz/irQVJuveoRJ1cGHWMhRlMWLOqQUtQ==
X-Received: by 2002:aca:1a07:0:b0:378:9c51:3ea2 with SMTP id a7-20020aca1a07000000b003789c513ea2mr5088937oia.36.1678118074921;
        Mon, 06 Mar 2023 07:54:34 -0800 (PST)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com. [209.85.160.48])
        by smtp.gmail.com with ESMTPSA id j65-20020acab944000000b00369a721732asm4057802oif.41.2023.03.06.07.54.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 07:54:34 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-17683b570b8so9090280fac.13
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 07:54:34 -0800 (PST)
X-Received: by 2002:a05:6870:d899:b0:176:2299:dce3 with SMTP id
 dv25-20020a056870d89900b001762299dce3mr3818165oab.10.1678118074112; Mon, 06
 Mar 2023 07:54:34 -0800 (PST)
MIME-Version: 1.0
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com> <20230306091108.3347363-2-zboszor@gmail.com>
In-Reply-To: <20230306091108.3347363-2-zboszor@gmail.com>
Date: Mon, 6 Mar 2023 12:54:22 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqgw7+wv9VWTHF6KrNmcVZzgdujKNTthWiM2zCxJZXKgw@mail.gmail.com>
Message-ID: <CAP9ODKqgw7+wv9VWTHF6KrNmcVZzgdujKNTthWiM2zCxJZXKgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/3] mesa, mesa-gl: 23.0.0
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton <Ross.Burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 15:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178077

Em seg., 6 de mar. de 2023 =C3=A0s 06:11, Zoltan Boszormenyi
<zboszor@gmail.com> escreveu:
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

