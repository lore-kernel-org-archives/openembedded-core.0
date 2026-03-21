Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E8F1094462
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 09:19:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8003.1774084745278903493
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 02:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CVEZYuan;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486ff201041so10301625e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 02:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774084743; x=1774689543; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81xT0OQG01GIwQBRTvVWNvCOdGOXXacmOwJMYUXVAyI=;
        b=CVEZYuan9jizYflQMMGubf/I75E7lSm4ThWYDuJEvsF5Rcu1rNFfU6TrfsK6i3/rUk
         lXjUkONiNUjNJUvS/8FcpJGpcRZJqg2LEjpLJydYZGUkBTkYBHvRZiUTDy3815/oRCtX
         ehxNGdw2/c+tAVMGzv94OPZ5ZNt5qDfcFfd+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774084743; x=1774689543;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=81xT0OQG01GIwQBRTvVWNvCOdGOXXacmOwJMYUXVAyI=;
        b=ibfmj/Aeu2Ct2d3BdYJFsyjbnH/c3vPL8KPwmtqOtYzcOd321UWdOFO0Q3j4CKeB1i
         AGEuMEFqYNK2epstYNSoIbWGPAnpsOd0y+2OdFpImM5useFBPUaSXwUv+YQtCrctAMv5
         j4AiaeCRfzL6WBc8UFcWA2Tx3X1AvpF4ACiLac4ElwN/ceDO0QWIVckTeFA/geks3h3k
         6+D4bj+QvPPoZXlq965rgoZ8R2qreO0B7Wbb95JUWPzZlCrAi7JZxEHPkdFkPpq21pbm
         Pp6kyGaIRQQwBjAwCQW/bYf7GHkt2VfzH67Q9o80Xyk7mWunraXHuRpJYPqbls9sR1T4
         KWxw==
X-Forwarded-Encrypted: i=1; AJvYcCW8GVzSEyDL0Z5FDQAL9JQd+0p+pmKYXD+5iykyco4U1kW2f9G1f21q58Qyubrm76Vsp6AJAJbrSeWyfb5+xDT7Lg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzooGHP0AK+kJRApu4VGNoCJcggS7TV7I9MiYSZmAzWLWRRlp2U
	3u8sJGoZjYzbBcoNug+tlV/heedgVrDlFdK2L5DgCIxHWREyQ0U4ji9ie2usLRkgOBw=
X-Gm-Gg: ATEYQzxAc1nQX43Vmt1K6XdTF36yrRKuo3JD9cnKfvBgdqOntN1+x1BXzXsyL0klNLq
	nRFwqTnC8Emt8kgKfBKNwxFK+Kv0ZHNk/of9teDFJIe0b9cXE64ndqfi8RFn/eZljFbPgX5AQT6
	KWKLADZumaLZfcXZjUxZo19dVZDmzAuGDeoxHpuf+jYBtqS8iFysHbxNhHWZFZ0lLgLTSR6VR5J
	iufqEyQebx5uqztYC/jIXHk48Krft8T6twwUajbuaOCcB08dZQXkaohKUcx4yfk1LrZRhm5zCcl
	5kmbyOpAEg2XdlmoJVzdq0OLSBeox1105WPJXPM0ai0IyfNuH8oakCMgBhJMUvlctYyd0gE9eWb
	H5fUMTU/rLvJgzSK2xcxat15Fe8DBkqZefo6HW+xlS6gsys4E34VRz2v1o0nF/fhdEvaiKHJdQo
	qAfCvjRZYP+Y/NRm5yh1HDQNiIlXVrPuQp/Od5jLy1OsaQOxc9iX1EyBT0YTUDPqOJKYEKw38Bn
	H/FN82uW7YPTl0=
X-Received: by 2002:a05:600c:c167:b0:486:fc5f:1ab9 with SMTP id 5b1f17b1804b1-486fedcbeb7mr81400795e9.14.1774084743388;
        Sat, 21 Mar 2026 02:19:03 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm186298845e9.5.2026.03.21.02.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 02:19:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 10:19:00 +0100
Message-Id: <DH8CJYGCGVWY.CKRVLGTIY6JG@smile.fr>
Subject: Re: [OE-core] [whinlatter][PATCH 0/4] gn: upgrade to latest
 revision
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <zboszor@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260321073820.1403645-1-zboszor@gmail.com>
In-Reply-To: <20260321073820.1403645-1-zboszor@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 09:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233651

On Sat Mar 21, 2026 at 8:36 AM CET, Zoltan Boszormenyi via lists.openembedd=
ed.org wrote:
>
> The latest revision of gn is needed to build Chromium 145
> for whinlatter. Nothing else.
>
> See https://github.com/OSSystems/meta-browser/pull/963
>
> Please merge these into whinlatter.

Hello,

Sorry but general upgrades like this are not acceptable for stable.

Is there a verifiable stability promise from gn upstream that would
somehow make that acceptable? Note that I'm not familiar with it.

Regards,

>
> Thanks in advance,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi


--=20
Yoann Congal
Smile ECS


