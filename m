Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F844D3B993
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 14:17:33 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.47012.1732630649864375195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 06:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HB5LIgSM;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d849a93088so16663036d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732630649; x=1733235449; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NlxSyTRWAmGgHY32UKWf2SnYEidCU4YFtuRL5YCDPDQ=;
        b=HB5LIgSM1kze0VGd0/d61+LnPNtA9d5eYuxiA2GWVOlm3UCcpVpSzYKW6AU4wrbNTa
         tLgdbWDZ81lT6GBVJyPhUtMgOD0DQex2kQxhEL6X4yrPxPEtRYRh3zg76D6L1/kUCMzd
         bFgTWKdB7YZUKU+khVBNxsn6TkDn9ljLqeYcMFM47oc0vvjs3886Eu591aJIfQcwAtIQ
         8GhuqzkMvQ9o2gCnSSyblaBLkAEy1ykKZjSKTRGZ24Rhj6RhRsM0usTVpn5OmPmtWuAa
         nhtYZFUlnNS4sNPqxshPrWX/q4qiD/C+rwNaBMonDjo4En8SIljGPHM7tQwuVmZMGzZu
         TgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732630649; x=1733235449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NlxSyTRWAmGgHY32UKWf2SnYEidCU4YFtuRL5YCDPDQ=;
        b=PWNjMgEmidDe6gGnfAzZp8HqZ2E5A3OJ8u/nbp4FlpLtjX4DIgMCoNT2wcBf7tdisO
         LQqGa+biKUpMOLnPeUkEWlFw0WSMfAP44bVz5Cms5hGdVZgS0ghukiZh4+IA3FKs5Xg6
         vKGMY2wPAr6fILO7JNQBiTJglIoagwWhq28k80Dx6M4lzyXw9GWFFxfc8sIYmic75Kv+
         GV4S4k0KBBm69Cl1+LRp7FU25vNxg8/xY1P3eS0x3NbInKWaM/YIwp0vSivRSTMi/FA+
         p62AwhW848lb21qa9Qbi9CjLqZUf926vuTHCy5KbbnAIbQE+zg9qUwMBCDx/KEP6E17H
         xBIw==
X-Gm-Message-State: AOJu0Yw8CYE7p91fQSoqDxPs9guoVb3I4/VOyoBA2QW1bNvQJtWNg0J7
	/Ncf4zmbjMS7XuUZEub7YuwFN30OOQQ8IosXnUGgJtq/50ROgNLRpcmxOGQKtj5BuMNV0xZoieJ
	83fp7oAOw/b9L62KcpeWImfWbPGg=
X-Gm-Gg: ASbGncvbFwsdRmCqKwgZMiGTS/iCd+VTBm7HjoaQiZy9nIi9Cwq8YsDaBTExN/ZSQq7
	G0gGPjIWaJR483ADowHlxb3JpITg+JXOG6d08vHObpPDWSsssIqQTH3SwPcKDs49S8w==
X-Google-Smtp-Source: AGHT+IHHDGccRVTeBnpt30d8EItvN/DtJ1BHpO1/lr3yxLfXkhOhVEOXAviiTU3ACGyQIoWcM0BoZYTnTqa6m50c93M=
X-Received: by 2002:a05:6214:626:b0:6d3:e839:aab8 with SMTP id
 6a1803df08f44-6d450fefea4mr323761206d6.25.1732630648917; Tue, 26 Nov 2024
 06:17:28 -0800 (PST)
MIME-Version: 1.0
References: <20241126141156.438193-1-thomas.perrot@bootlin.com>
In-Reply-To: <20241126141156.438193-1-thomas.perrot@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Nov 2024 15:17:17 +0100
Message-ID: <CANNYZj83QGK-=PAUcQepV905pVA3OQBTx+XdNFAjdaroOTxUEw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] tcl: resolve conflicts with tcl8's man pages
To: thomas.perrot@bootlin.com
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 14:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207855

On Tue, 26 Nov 2024 at 15:12, Thomas Perrot via lists.openembedded.org
<thomas.perrot=bootlin.com@lists.openembedded.org> wrote:
>  AUTOTOOLS_SCRIPT_PATH = "${S}/unix"
> -EXTRA_OECONF = "--disable-rpath --enable-man-suffix"
> +EXTRA_OECONF = "--disable-rpath --enable-man-suffix=tcl9"

For consistency reasons this tweak should be going to tcl8 recipe and
use tcl8 suffix, as that's where similar tweaks are collected.

Alex

