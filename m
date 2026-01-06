Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A149CEFCF8
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:23:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98326.1767727378100193871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 11:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=feS8QSpV;
 spf=pass (domain: baylibre.com, ip: 209.85.128.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47a8195e515so9443545e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 11:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767727376; x=1768332176; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuDro1AUgyM8yHw5LEP27MiC6idato9r+y9UxNcRHOI=;
        b=feS8QSpVWoQEGmLY7eeywUhlMvFO968cINgznpw85gqsHFWD7ldXT9IzD4x+FYWd0w
         Qd+5CPQFLl488zSXF95v3cjtABNdOdjzxWegrDi8PmvLTOXHaZRLWryMojPNZMbcyJJs
         zGcBz7C4AAb+53cw+ndUliUdefK5Sb9TIcZZFA9G9V8vi1GnbD7aiyU2dpu1wku+v7RJ
         HpnPE6H2E+VMwX9iQVnYwx7yqhO+Zupwlm2ZfLu60C16VqwZklboanBsw7PQ7zbhue3q
         qTlf0yGGu7H+9oE0nKrL8D1f+Oujp2rdSkyQRzCcYwLAHtnzw+1BkPElnFouMTBgSRsI
         v5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767727376; x=1768332176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuDro1AUgyM8yHw5LEP27MiC6idato9r+y9UxNcRHOI=;
        b=pl7Bh2HGlwwefc6jtUPpOzMp7BCutMjrpIXR3SS9wUfWxmd7XwV1miOj+KN3mAn8Ik
         4/km5eIJtVwuLfp1XtlpYAhnWpDsRjukrqc1WqJLbYj5e8FDYhbDQtOkiSQgIUgMpKtw
         lCFK02EiQqLSg1vUmZ0y6BGkn7G5IBsTy5G45GHglgC9tS9Fm/CHIW6gPEDboT+UYmpI
         PzGxViyzPiWZnR7s3Mk0DM00O5VFwlRyCyFeV0EtAGaFO1QfnZyMWMXjbkdNbjPJdXwI
         IzAFbIo0khMVE2TVuQaFOvu1FP67bYu+L4oJAWSO+Kvvjy5UWG4MOB52DNDSn48wKH3o
         FlrA==
X-Forwarded-Encrypted: i=1; AJvYcCWmINbsNNR1M+u+3sBuB7IooRRIRDebeO6lBE1D70If3rc2rwKt1aT2IZEIuQgbctaZogDfgcfFDl4V3UgOKPEUBQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxDiKU/IN6yhw6APSuxh8RfGYkC8vTECoLTLzDzlA2ukUVugmAT
	Z2GMiUGTuoAGaRRkqOcJc04ulZb1DHxT76bCRNXAVJke32uPId6z+QjGrIC1ortdN5E=
X-Gm-Gg: AY/fxX65+xx2zhzCORPxcv7GtyyuoKPrq5oxXuKcxiQpwsfNZczImI1JwHPLuZic0Oi
	cpwxrtwFstNL7aVknMq05xEj07erICM2JtD/lvGicGLPEfZC9KlhRR5xeUv0Mnt8+4/Y1cANSDE
	1h0esqNW9WJjvfIRr7BZl1aM4pk7HMpbSQRAxKXNUvx8YRYBazegGi3sr7zgR7NFLJdZ/qvsXdn
	5M5KL+X/eBYI/HlrrpT08P3odFnBXr/p1tLJtehe1dWdGFMBFX8OCtl0vOHihItTkmjxnKdpDaR
	a0Pmapv3J74I129T1SZdxd5oeAIuVsPxU7K18w0eSCqadlRhDcpEcXVoYTN0/x+Rq67uCOJhyEJ
	IFJUj+us9uiRgfvqDsLYa0/tUvxD4Yrj8b/zdnVzWkiWgCUst3pUNVVBelOikUVFvCKlzdRANu4
	hDaBYgURfkcGEKWlDSWkYx2cliCvKHkKraiEJR/IN+vuD2f+qPVpgabPh2J/e+GzJA
X-Google-Smtp-Source: AGHT+IHUiASELPjh0t/18+dCML+055pezyuNIPP+n0RzKDEwAUltqqOynAXwWFnlWmmWh4h7WZNMsA==
X-Received: by 2002:a05:600c:3b90:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-47d84b39890mr22585e9.26.1767727376112;
        Tue, 06 Jan 2026 11:22:56 -0800 (PST)
Received: from ?IPV6:2001:1970:3847:e000:1977:be2f:4a71:2892? ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5feaf8sm5923746f8f.39.2026.01.06.11.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 11:22:55 -0800 (PST)
Message-ID: <6db6625d-3b24-44b1-8902-5798f00bb9c6@baylibre.com>
Date: Tue, 6 Jan 2026 14:22:53 -0500
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
 <4ec2fab7-4d1a-4d4e-9047-c62a45109341@baylibre.com>
 <CANNYZj9=aiv5HU6i6aw0GfkXSM6qdNEHgHWQEMjej+xA07seGw@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj9=aiv5HU6i6aw0GfkXSM6qdNEHgHWQEMjej+xA07seGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 19:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228922


On 2026-01-06 04:39, Alexander Kanavin wrote:
> On Mon, 5 Jan 2026 at 15:18, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>>>> Maybe. I tried all of this locally (on a F43 system, which includes
>>>> 3.14.2 as of writing), and after I sourced the pokysdk script, the
>>>> interpreter on my path changed to version 3.13.4. Seems that the
>>>> install-buildtools script is (at least for me) resulting in a 3.13.4
>>>> version is getting pulled in. I'd think maybe something got contaminated
>>>> somehow from my cache, but there'd be newer 3.13.x versions for it to
>>>> grab if that were the case.
>>> install-buildtools brings in python 3.13 into PATH, as that's what is
>>> inside the buildtools tarball. That is expected and won't change until
>>> after 3.14 lands in core, and new buildtools is produced with it.
>>>
>>> The mystery is why the test first gets 3.14 from running python3 (that
>>> comes from the sdk installation), then right after that 3.13 from
>>> running maturin (that comes from buildtools).
>> Ross and/or Tim, any thoughts?
> I looked into it a bit. I believe the issue was outdated maturin, with
> the 1.9.4 -> 1.10.2 update having landed in master it goes away. This
> patchset can be re-taken into testing without modifications.
Thanks for looking at this again.

I did see that there was an upgrade submitted to move python from 3.13.9 
-> 3.13.11, so if that goes in first then I'll still need to rebase this.
>
> Alex

