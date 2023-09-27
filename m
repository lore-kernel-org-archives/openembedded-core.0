Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63840E810DD
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 12:48:22 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.16572.1695818892760643422
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 05:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=M/v3/txV;
 spf=pass (domain: baylibre.com, ip: 209.85.208.176, mailfrom: jstephan@baylibre.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso183896831fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 05:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695818891; x=1696423691; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DL68C3tVwAWDAu1hka6HP5iTNsy7jwg8uv3/tFCkYWk=;
        b=M/v3/txVjR5IMltawQGEUVFTLsqV1dtq5R/Cl1oZM29V187/yYk0T15Q6w1EE94nOC
         ilxVfqDfip7nYW6Bmxsrevbq3/28/GcgYyadelR3EzY1cmkGPZ3sgg8Gvtw9H5FR+EeW
         zt8OgxTnasi+bgjn/klFGRFPef20bOU6L4lVijBTk3vCLjYlbqZG4IUEZ38LX0WsB88E
         RFo75HR/SSn54fFYnexCtasGV7POSyiOtm3d+kbLl4tOMWMp6K1Ka8HVV0b9UCc4lHfN
         P96fUFNdKsm1aInrY0xMlDyvwKTuKknHaJZkXEp+vcWwJUBDlEWWhlpTyMwd+eCDoB9t
         lwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818891; x=1696423691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DL68C3tVwAWDAu1hka6HP5iTNsy7jwg8uv3/tFCkYWk=;
        b=N4YGFB6I8nyiA+D0443bmJnUgI90g0EiribBuqYmh5ppMP2bHghVDGQGSf8uqiW1St
         H078aAHv0ZWBYwba5pZtnIJDzt0ksO9c5MN0jDARuraWk6y7XEwsIw8N3Qayg03llhnB
         YH+idDdKFu1oyMr7tFwPZ5UVqJu3V744Q52mHkyQPNSUztg/YrJpDG5xyUvio6de52WG
         XuLBhOUR8sTUjeRPbSSbhkIP0klt62VKeWz4cCcDwrNQf2VvVtlNoz59z/o4a3j8a10S
         +ZZ2LKceKUMaftjgV+44Ikzk91qCWLFzChfT268YkpXNk8zpTOILH6cuAg/n+Lq8ho+L
         WwXQ==
X-Gm-Message-State: AOJu0Yyk5ji3WyGvWzC1oHBsHw/4Yykzz1WQdBXq2l/xZpCNFYbCtMs+
	bFxOy2g77dtA/C0U3QHCti3c5JxYJEqlIJ1RY0ps9g==
X-Google-Smtp-Source: AGHT+IHQt0jTuZywPY1rWNV4oLYgek4Rn8fZ4i2g9PE0kwQZOVD0J/rkeL1mKtDR34TkKJdZ6QOFNnVfbXpB+p1EHxQ=
X-Received: by 2002:a2e:818a:0:b0:2c0:298d:32d0 with SMTP id
 e10-20020a2e818a000000b002c0298d32d0mr1852646ljg.43.1695818890867; Wed, 27
 Sep 2023 05:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230925080452.803540-1-jstephan@baylibre.com> <20230927101614dd0d974d@mail.local>
In-Reply-To: <20230927101614dd0d974d@mail.local>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 27 Sep 2023 14:47:57 +0200
Message-ID: <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/5] Add bblock helper scripts
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 12:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188313

Le mer. 27 sept. 2023 =C3=A0 12:16, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
> Hello,
>
> I had a build were all the tests passed, then I had this failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5812/st=
eps/14/logs/stdio
>

Hi Alexandre,
I only see

   bblock.BBLock.test_lock_single_recipe_all_tasks: FAILED

but I can't see the actual error :( Is it possible to have it somewhere?

Cheers
Julien

>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

