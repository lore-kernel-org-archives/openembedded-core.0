Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695FEC54E90
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:42:54 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.4952.1747809772260754187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mnaohM2p;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad564b7aea9so623857566b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747809771; x=1748414571; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OOsWhdZXRc16gtXE65iaXPRQekSSTA1cEF7H7TTAiz8=;
        b=mnaohM2psxd++Ui9vFQPcUnbhBguRaJPAcHz6xS0xtmkI2WDvS3z4Pl0uGz/DHcrWO
         7FoVWrYptJUBrEYhi6fsGx0FrlXjPFnVmX/CpJt9uFtSBCH1NyALV3ktUDeVgZX99LPo
         yaDiF8dhf4vfhNIuwrAfLdt208Jo9AY5IXEkRVT0XRmEg5av6DFEQFVKK8o81zxwD3L8
         A6qitFL00uaU5BdhfO0xJO4osOakdLAfGsPjFis0zIL07wvnbGJpjlPAnbaMKpwIuM2V
         ysLTF4C9+WeLIlc0rkm1fjbm8hNY72KaCDkWReSoPxHa9S7xGDVQZoHlmbAwIOncXfPM
         1FEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747809771; x=1748414571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOsWhdZXRc16gtXE65iaXPRQekSSTA1cEF7H7TTAiz8=;
        b=gHsG2lwM0sr8/dctKkXI+pTaxP1IYryfCRHBlMsLVMVTj7o2tnzJlxH7/MnjV/fiv5
         fWcImhTh5gysDjO54EV35itQyGCpYHKxjSVT3K2Iy+g4bqa1h4I09n/lOF5yLk6XCBzF
         IyrevgkW+FP7PfJJ3NCqODBw1N/ec5X1b7wb2SRUqXyIhiEP/QSi+kkEDiPDSuyIBfm+
         Zoz+MxUVHNOWhrWCBWup4lrfHX8QxijIYE+CinBPEun/6JPnyURhkChNaSMgt/qnVYP0
         TuZfKLEh94lvTMjFi6lFJ271gNl8W7MTg5q/KvXNl7heB9FbDu7q7haIDlSkDVs8I6NN
         uF4w==
X-Forwarded-Encrypted: i=1; AJvYcCUW60A8ToYv0xFU/y72cVPfEfX2DMpATpoD6hFCLws9cxmYSnT8Zbb+2ltFd+m1wi7aDvUfSvDYogz22LGKQXZl0w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyrd46WkQA6eCpC0F0fSgLTvJpTdVWIv6UwatmPoCckQD3l3GXv
	HN7aH+q82AK/ZGIk1SQniAW2100U843dBYJvdj+b93TXfZLXsqx99KVI797Fgg==
X-Gm-Gg: ASbGnctVb/SbMXZJgp/ZmeKdWSV1JjL90c6pM5G/hji3eQUwDT0CmUaaywuIVfut/6g
	VJPbJsSCqyzwLmpYkRLRqpe5UozG7Bhc4uV0SF8Sg7I0jTfleCx3gSE6GZfX70kqXbVKXR2VulV
	dilQ1du77TLqADvv8LRiRGVInlsIRZgje7Q1t05wmBYqq7Fs1WlYZRX3CcPBCxbZElcUTV5dAjl
	CjRFjw9bwq7K4U1J0QhOw4n9LghfhMqpSyvN2seWJamYmLVANhQVJUueZn6fywWQ+OgakKnNAeh
	OZq/Xm5HXlivAVtNVgXYeEpJft+Hig0C2fBgejqqaNClmtAebu3rXrEPjm0=
X-Google-Smtp-Source: AGHT+IFHI/OY0bZpe4Zw+GvrYZxJB2HZyxrfhSL/eZKDPIrab146SAF5mMyaY94ELyzR5ns2SL7xIA==
X-Received: by 2002:a17:906:5ad8:b0:ad5:3ce3:72f7 with SMTP id a640c23a62f3a-ad53ce4e34bmr1404254966b.7.1747809770349;
        Tue, 20 May 2025 23:42:50 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e816sm839914466b.23.2025.05.20.23.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 23:42:49 -0700 (PDT)
Message-ID: <852cb6c6-86cf-4f24-a334-5d92cb56425f@gmail.com>
Date: Wed, 21 May 2025 08:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][walnascar 4/8] openssh: Upgrade 9.9p2 -> 10.0p1
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
References: <cover.1747770224.git.steve@sakoman.com>
 <f1653e02abc2fe88fa33cb0956e43312c6c2cc25.1747770224.git.steve@sakoman.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <f1653e02abc2fe88fa33cb0956e43312c6c2cc25.1747770224.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216997

Isn't this an overly big version bump for a stable branch? Not that
bothers me personally, just asking.

