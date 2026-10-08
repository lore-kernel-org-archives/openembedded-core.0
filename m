Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE62BCA6011
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 17:41:35 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10083.1791444120684114325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 00:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=a6h7amp0;
 spf=pass (domain: baylibre.com, ip: 209.85.128.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49ff680331aso52329605e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 00:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791444119; x=1792048919; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:from:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UtM6n0PMfgKXtEYaHD0HTfi535gvE6cqmEyJeEsAdQ=;
        b=a6h7amp09U1gj6Koc2TcztfyMROxdXY36wdoc3wa5mhm5uHWsCPsVO/QWgd/GmMmrt
         I/cokcbDRqGZA6NKY4D6qxukpb3mGrkixtWSFF5yPaQ0pZ8zpto0GsQTsC3JqC6wDLpj
         BWl9uYaNFn9ZPWpmV4JLAYu4hYAIVyUGctbH73FXiVZLTCjScH83y7UE1AKIv/qDH1/x
         lnfaFEcnQSlzmpmHCLAwiBzTkOHukf6V9G0o4NmTYgPNYrZDllOWHCQ+uiX6ijEslA3P
         S44GOWPNtRN/hJQ9DJ4R2MUp8HZX+3fSwuIJecQKtKvGC05O8nx+8K7Nylll3KEnTCr2
         SSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444119; x=1792048919;
        h=in-reply-to:references:subject:from:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0UtM6n0PMfgKXtEYaHD0HTfi535gvE6cqmEyJeEsAdQ=;
        b=2LZLE+mRnjs8YGbZ75uli3y0+/JWcHCOOIOPdspW8YlUy93F2IkG2CxB5s49KqbqW6
         rSOtV1peHLMv9Y0aFVJtUjEMPwThi5SbDABO20PRVeq1Ox5/xvLlBj7U2IAngEG6xYRj
         a1L0iMeL3yCUWV//El4WHkFUAV9YLMtMyPja7tX3b70vVigk0/or4LBs+Wv5zbjG0lNc
         aMc/4A5jTH/dJEALEd8R6+GCIGJm1ba0ZsRb1u3jQCKRILVWwGw20x9+j+4CVHA7fGtt
         5NoevlzxmO2XWo738OztlWpIwTXS2EC+smrnJBhNVJcnX7lHi/mOTBnKi3gY/S+CWDS8
         n0xw==
X-Forwarded-Encrypted: i=1; AKwUvBwEr5+E3hSg5v6fBBRNct7NlX4xkGRMyeDCGIHYMmo1pJiGzffb7ae7S2GgBBd5xb8vAlFsh5AyUXGX2FWcxG949w==@lists.openembedded.org
X-Gm-Message-State: AFuF++nY37vma7V+9Hkyx/HF7kmLL95FfiwhNc/QY7CXZV0D/Yr35Y0c
	RldlT49PGRuPrIhocIyWWaGbRlZPsPkL/G6Jz6O0h3QQdhLyPDGWQ5x19fBuy4lzO1NRgHJ414T
	q3i5r9zY=
X-Gm-Gg: AYBFou27pFQpsLMMslZeMV5JlrbbO1/AOz2YSa2QemmNLnYIh/ubsyjxyvHGRlitQ85
	8miEW1E9K54EHuJX7BeLAnRopqM+VZ5SYQXy5ExoLopCRibcFJPoFpGcpTOdXmoyTsui9as98U3
	p4C6N5juo+f3MoILbUVLQ6z5DgWEampuXI2ZjZvVMy3GX8SCwz7RH6kyHt8pegw3Lw58IDFFWVh
	VeXbCWkJ9yazC/+RUKMw7ezRWFa3Y+piwK2jCzG7dSo4tpoMbs+Qe+B5vSWv0tBCUtk+5A9AIsE
	+mwdAtBlGDpVKih420IO6q/eTcGUELRPXAzBW1JULOY4cHX5HNWEHdOebUbnjZ5ZVtKOoP372Qb
	hWB3xt97X8Wew0Gw/fm8tgtxlhOycb7QDXUrHcU8fz7W87xnXiOhLjS1Fsm6uyDcZ7DUTHsDDg6
	QATz5rjqh/xgUV0W5bVtp9WId+EhNe41z5906tLzT9BVq5Z593DVGHI/vHi+YGgnS3RF09zu8C1
	kwpmNNWGyVrjBwdwb6TAIRG3QLZRUbSTyUL1O/d/piMSXvE
X-Received: by 2002:a05:600c:8b8b:b0:4a0:251f:dabd with SMTP id 5b1f17b1804b1-4a18064cd98mr70413305e9.16.1791444118666;
        Thu, 08 Oct 2026 00:21:58 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm9465877f8f.14.2026.10.08.00.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 00:21:58 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 08 Oct 2026 03:21:57 -0400
Message-Id: <DLZ9XUA08AGS.MQJTQRYHXTAP@baylibre.com>
To: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Jaipaul
 Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Subject: Re: [OE-core] [PATCH 5/6] python3-more-itertools: upgrade 10.8.0 -> 11.1.0
X-Mailer: aerc 0.22.0
References: <20261007055820.59633-1-jaipaul.cheernam@est.tech>
 <20261007055820.59633-5-jaipaul.cheernam@est.tech>
 <DLYOA1SGS44S.13W5W0AQMQTIH@bootlin.com>
In-Reply-To: <DLYOA1SGS44S.13W5W0AQMQTIH@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 17:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247439

On Wed Oct 7, 2026 at 10:23 AM EDT, Mathieu Dubois-Briand wrote:
> On Wed Oct 7, 2026 at 7:58 AM CEST, Jaipaul Cheernam wrote:
>> changeLog: https://more-itertools.readthedocs.io/en/stable/versions.html=
#id1
>>
>> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>> ---
>
> Hi Jaipaul,
>
> It looks like ptests for python3-more-itertools are failing on riscv64
> after this upgrade. It might be a timing issue, as usual.
>
> {'python3-more-itertools': 'START: ptest-runner\n'
> ...
>                            'tests/test_more.py:TestSynchronized.test_conc=
urrent_calls\n'
>                            'Timeout! System state:\n'
>                            'Collected system state:\n'
>
> Tried a few rebuilds, it did appear every times:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2563
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2564
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2565
>
> Can you have a look at the issue? Maybe we need to relax the timings or
> disable the test on riscv.

I will take a look at this next week if it isn't solved by then.
Trevor
>
> Thanks,
> Mathieu



