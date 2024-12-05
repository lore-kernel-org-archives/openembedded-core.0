Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13766E7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 15:20:24 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.13581.1733412020131652623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 07:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=N+hFe9hd;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53df1d1b726so1060999e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 07:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733412018; x=1734016818; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CSrsEiQy1FAcj0t4ODlOMN5hzyyFI7cmDaX9LqmHiOc=;
        b=N+hFe9hdq6PgdLoVHHh9/E6wPUEDYoHZZSEQLt2HPaJ6NWCCBEK1iXLl6s61batB9z
         PYNYrTH1hDMwihfsaQ1eWQXy67BPvcMWeD8GZuc6U/3BxYIwOd6QRkZ+sovh92QyWho4
         VGLY+BxibWND/FsbI7uD5DxqFu/GBU3LdffDLhGkYFNaTY6LHigTRuU+4/rrmxoDiv2U
         kmfNhuHDay+orFoZqO8kwdtDTVAmtBxY8ddi5j9tE8hBPjxG3N2otYnZ6GZkrU8Z84Gr
         Q6IYj4CFkVeR/duw2hAg1TVX8ZvS+0Wn8bpTdF4XBkHZJ12vSYzvIPLU+zs64FtMkzdN
         E9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733412018; x=1734016818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSrsEiQy1FAcj0t4ODlOMN5hzyyFI7cmDaX9LqmHiOc=;
        b=WW6mj1waBWboHxpd2w7QR36MB0z6G/z4U9QHQUS2hbIzHecFpSiGNru2WyPVXGKExe
         c0+VfetMhdClbJs1z/SHJKDTRk9qE70TuZ4NQgTxL0tROKRmZS8Qg77Mbr86zuiBCdf4
         8dd4pLNUxGVPZfNOxj8Z9l0YMkH2+e/hMI7R/O3E2q8Eu7oA1lapLF8n47IJFZaQtoh9
         y3DCdu09UD8/m3kVTt8n3Ub5o9eLOlpeuN4sDiztXaXIGfsQaM0fFo5U8GLUk1ddwpmo
         3FG2mENMl3JqWCtKhw+Wf7H5sm69jzjPbAM7r4xO4iFEdCW5MXiwe32iVBvEPmavUUiv
         t5Zw==
X-Gm-Message-State: AOJu0YwYUPUhM0xnqrdhhJJ/qUH0X7/vSz/m5c/AEUZf6wQmXHvJDORj
	LXaxN82GvA+C91zPZ2IQbkThT1N9IQqZ9nO4xR0ZfZXaXtVANgQxa8f94/azylQ=
X-Gm-Gg: ASbGncsnIMTC9gUfyHOcL2ZMvaYsT4p26kKFKJ1W4W/ba7J3lykF6OOx8S36Gz6KcGo
	sYqpXw64HNYBjjgo6o3beAVAc0kT943iEDzSI/cEgUAJ5NlCB1fCUC31fh4023//StY4M99Oaa+
	+QaEExhRI4yWxZWy/Z7AhNZYb8IVLZ3er6LWKWhOCXsEee4/0benW15uhN3qD0DiAQONYuity2E
	4iuVqcCEvH9VnsdOqX/Zcq+zO2RPNMNMBQBMqDnGxQlvlrb60gwTzlwa4Bc/ilFF8DDHRaHZDKm
	ExE=
X-Google-Smtp-Source: AGHT+IF7aD7SmH7GA36HlFmy4aPejuFl9m3JPdn4xb5nxUdWRYzYstwLDPbv94YdC/3B4f8BwhLZ7Q==
X-Received: by 2002:a05:6512:2301:b0:535:82eb:21d1 with SMTP id 2adb3069b0e04-53e12a2906emr6145295e87.57.1733412018277;
        Thu, 05 Dec 2024 07:20:18 -0800 (PST)
Received: from nuoska (2001-14ba-490-c700--133.rev.dnainternet.fi. [2001:14ba:490:c700::133])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ba809sm262760e87.161.2024.12.05.07.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 07:20:16 -0800 (PST)
Date: Thu, 5 Dec 2024 17:20:12 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/3] swig: update from 4.2.1 to 4.3.0
Message-ID: <Z1HErIEPITTL1V-C@nuoska>
References: <20241205093237.333818-1-mikko.rapeli@linaro.org>
 <Z1HBy3LORw20GLOv@nuoska>
 <CANNYZj_qrKCoYdtw-Khg7p9JL4GuNOJhcb+WPXhsSSfkhEms_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_qrKCoYdtw-Khg7p9JL4GuNOJhcb+WPXhsSSfkhEms_A@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 15:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208384

Hi,

On Thu, Dec 05, 2024 at 04:13:39PM +0100, Alexander Kanavin wrote:
> It would still help to rebase your patches on top of mine. Sometimes
> those duplicate commits contain additional useful tweaks that would
> otherwise be lost.

I checked the details, commits are the same :)

Cheers,

-Mikko

