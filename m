Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18B8C79F9D
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 14:18:01 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64823.1767622681351235626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 06:18:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=bqaPFqBB;
 spf=pass (domain: baylibre.com, ip: 209.85.219.49, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8888546d570so209512936d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 06:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767622680; x=1768227480; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lOqte+xFnjwvUqYP1+KAOJB69rzh8pL3jHNTsrqsbho=;
        b=bqaPFqBBqqBqDT1jSqnXNWUH3nscueL6oghcjDZE+pAmxgBeaaNLqB+vnXo/wXziRF
         4tMUTCaYX8m5asSeRJPJWhSY0OV1zSlP/utWfHg9UlS6Wsz5uzHtaKPax2wb36eXxSuc
         pyeANf1rdQwaClayOeG+DrLtRCYcd8hEEiFbUd8KdGKpd7B2muSB+LKqwN2fGQ8xKmt/
         BYXhKTRbC0lNN1m9Suhi5/7Rt4uBW/3TKgS6dyaaWAnX7dgXfE2oknGdjQd3Gct2LQI4
         MT54Dy6HRWkNq/Z/3iYuIWj8oD3VsZ+1fLpKrNT0fbOHDE2GrV5baYSMzGw03tOSCBny
         51Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767622680; x=1768227480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOqte+xFnjwvUqYP1+KAOJB69rzh8pL3jHNTsrqsbho=;
        b=KuXBHsXBjlnry+B06TuL60iOAzMzbgyZmDwsctz2H8lrsyCbv2qdvvL1ov4WIoEWcr
         GGZ5zGovT4FSx1gkzr97CO5dh/MR75asb+9salk1gKzISN7FRARUHR7ZzXij+7dA7NRz
         7G66nstrc5LDAd8gBp1q//1xSGvU3Ob5/dgPnsolFZuv6Nh1qrqaYH1laYuLBiz5O491
         vWKndu+3+DsPDPLu76UvcM8cUL4Rfac7LUUEIfMaV76X00dsH0n0ABbbaxYvgRdI+YIJ
         wXyeXQHvkuoaoLkANgCOkekww/aL8pvAkDySn1c5kjoXYqSGZVz/QhD0mGpVJJ2Hul/i
         jrgA==
X-Forwarded-Encrypted: i=1; AJvYcCUTrK0VYcWLoxPqtc8gXiOuWCggqcO7YbpvLYA2sqznbiui27+RcnYYb6Var49QXVlD8QtTY4CEJC4/9Ooh8rIyGw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyuQiHuRAhAPsVSuk3vttENM75QouCfuKiN2dVuJL71ECoB16eT
	zxHgjjRiCYOAa5UrHXfM44u5nosB9IIEdfj6ylDtZE6wkZAVyv7KAfkatP8bXFQQPWE=
X-Gm-Gg: AY/fxX4kCwhUtfVRYdKo0hTDT4vsviQG1LAxM61v9qNfAzi7Gg8NdyCwKZZKFzSn3CO
	4D7GLozDVrMk3MSwQknYmjU5/mUyg2rnf3KXnHgZf6IqVWNYzYPfGI4QFyouLiRsNZBztwVo8ta
	oFlKZlU5pKgDpUj9KEMSeDrs1auXZYDh5T742J/dsfSRHSqQvBmUDsumM+NTZlNbvHzqvBG/89Y
	yHcrdcsq23a8TXYUfKWlujVN5jd0DhLWWIgIEcQHlNLNvmIvNAYL4N8WTHvzb9FjQifB254jusZ
	srdT2Nt5CkwN8+jQ+oj/+i0hQXFsiyG7QmJJ3ytkSYcmQvTJY1gAp7xB4x/iwSh7TR2LT1NMW2n
	4sxIUai16F4sTV9hjNmqs2Qod6x8+lOTvt2br4HpqZ5SOpL1xMRKDEiJ1rtcJXVz7+31svUnSxJ
	ceqo28AsMINGXO8hZitSkNuJms6T3DdpgHHqSt3OvoTB9XllvpLSiHNfFZx//MDJhl
X-Google-Smtp-Source: AGHT+IETaRpACoLYg518NJfJGYliHM63HIUeVWP5lQd3FDqJm11LQpFLX+6rnLga4dlrERlxCyHV5Q==
X-Received: by 2002:a05:6214:4699:b0:87f:fecf:17b2 with SMTP id 6a1803df08f44-88d881b9a37mr670737066d6.64.1767622680180;
        Mon, 05 Jan 2026 06:18:00 -0800 (PST)
Received: from ?IPV6:2001:1970:3847:e000:1977:be2f:4a71:2892? ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890753ed3cbsm59326d6.15.2026.01.05.06.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 06:17:59 -0800 (PST)
Message-ID: <4ec2fab7-4d1a-4d4e-9047-c62a45109341@baylibre.com>
Date: Mon, 5 Jan 2026 09:17:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 0/5 v2] python3: upgrade 3.13.9 -> 3.14.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org, Ross Burton <ross.burton@arm.com>,
 Tim Orling <tim.orling@konsulko.com>
References: <20251219134734.842422-1-tgamblin@baylibre.com>
 <DF4LE2CKH2GP.1O49L3MTHRQIG@bootlin.com>
 <adc441a8-e19a-4d61-a3bc-9ec0927b434f@baylibre.com>
 <CANNYZj9+DPHLoWUsNngX12JwA1ZntaVrRmyyOMqiH7mN_5_E6Q@mail.gmail.com>
 <60b08678-6380-4512-a1e6-0518ae4710c4@baylibre.com>
 <CANNYZj9zAxJpGZ=bZHOZh3FBwU_Mgw=89sR8rS53OC99tCvPvQ@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj9zAxJpGZ=bZHOZh3FBwU_Mgw=89sR8rS53OC99tCvPvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 14:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228869


On 2025-12-22 15:00, Alexander Kanavin wrote:
> On Mon, 22 Dec 2025 at 20:52, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
>> Maybe. I tried all of this locally (on a F43 system, which includes
>> 3.14.2 as of writing), and after I sourced the pokysdk script, the
>> interpreter on my path changed to version 3.13.4. Seems that the
>> install-buildtools script is (at least for me) resulting in a 3.13.4
>> version is getting pulled in. I'd think maybe something got contaminated
>> somehow from my cache, but there'd be newer 3.13.x versions for it to
>> grab if that were the case.
> install-buildtools brings in python 3.13 into PATH, as that's what is
> inside the buildtools tarball. That is expected and won't change until
> after 3.14 lands in core, and new buildtools is produced with it.
>
> The mystery is why the test first gets 3.14 from running python3 (that
> comes from the sdk installation), then right after that 3.13 from
> running maturin (that comes from buildtools).
Ross and/or Tim, any thoughts?
>
> Alex

