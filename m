Return-Path: <gijs.peskens@munisense.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDB1CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 09:56:24 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.5113.1761126978362090930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 02:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@munisense.com header.s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e header.b=AM1Y7ywu;
 spf=pass (domain: munisense.com, ip: 209.85.218.41, mailfrom: gijs.peskens@munisense.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3c2db014easo1451584366b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=munisense.com; s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e; t=1761126976; x=1761731776; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LkOHcQV2liV/BM05mxtnEjNTOp31HtDAGyhnxINStg=;
        b=AM1Y7ywu8Rz20XkapVDoUZfhfELS9g81QmH+ZbYxpxAXen8mRs+grgo9CA+elfZEoz
         AQnaW1ze2S9GkJA0YWwN0OJS0XQiuZe1ChOfgwA5WzcVDwDFnZaEifbU0PsCt1yS7Vx8
         Dsk2coOKjaHg+zlq0+p/oy8J1LwDfqhuXxqNfQxFWAYFWpQM7/TWk0075SiC1ipoelM6
         NGbZK58AIC1SBdjWs+hDRkqgQYmnxALMxEusoDMRRGYcn8dBtrbtWcHcmXz+tGC6Gs2Y
         Ym65PMNIvpR/yQmnfIGMGcyD41UmX87W4q5MgtzSkgvTlVlmHWW2BxR8k7ZLdNzMuE4a
         E9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761126976; x=1761731776;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0LkOHcQV2liV/BM05mxtnEjNTOp31HtDAGyhnxINStg=;
        b=I0wNIO88jYRlCwdfBI9PShthlIY9GIJp6w8Fyt+8wj+FX1igisdREIAKFbD0GOOYpw
         ZqGrYT79matRKsPnfaNYSsgu/+9fcbp08YMXFnwwsHw8gN3z+m9FkIdYfALplNahTAOe
         891MLaohmRS7wvUCyXEx00GDvsn+b3ylH7mtpw8EBDrr5TFa+RVsHMlP3RQI4ZEI6BZr
         D8WDtXsj/1lhGoYw+rCMNXZLqYdl0YjUujF3lnbkC5p7Q0uNvK1dr7STamikumWFZf3w
         Bbw3yMAQ5ustXdcbkSEoZD7Vjl0wjmF58Lrp+/orJG5tn5phw2Fy81551bJr/aKJcXyE
         DZsA==
X-Gm-Message-State: AOJu0YyotFyBt6qeInMQMcUMrYTYQyF/TXHDUIw+OebokZ9sXqVguscH
	Yw7bC84yCLjpOuMBiKWNJn5rcSABwW2u+nvkXP1tsGTqt+I8lo74KRwn4ajSQ1PsOlxcQ8nmIdI
	/7KLeXU8=
X-Gm-Gg: ASbGnctzCj0x+uy2BtJUzrxICkXKV7YrXjnNkO7KrkMMSHtCSzOS0N5RoSSiTa2eXW5
	rW1dyi5s9sN6MOXr4ja66sq2lHohSj8knSqh9uWeRfdhqcS2TT9HBLGaTbGC3qqN++KWXxxB8gk
	G6WiEANMNhptftare1YjLD5UBIbAlJUX+h+jzAa1PjglndxTWet4vHuNDnF/rZ2afpRvkwIIvb0
	StUoXfZ5/jv3mK32DjsjvFZRCbbB6uqAa/LTeRtA+M+su40wDrk+w8RRpuPBymKkMt+Cd78u5g3
	4VN+zOBfX0yWUaigFSx+J9hue5UwQ5CuKrV/kUthPlRxfjTxCcYZ8sxG8cRCncIDIa+8F0K4PWT
	0WndsREpn4lhHqekfnSrmVUGHq9Pp6Q9haJGM48CbIAaeRCop3mo6lEzQGuCh3rsYwgSHtrlgZ6
	vj01dbXash6sMl/Z50nNSVHByVoo9cl+RUGzCvoolvl4A98EGgWG/RT9p4
X-Google-Smtp-Source: AGHT+IEST2GYp9L1hib9XOLfs7uTMBJgook7rnI8aIm3Mjsd893iteuAgLXQrZ0MhpZjm+1sSshZDQ==
X-Received: by 2002:a17:906:7f93:b0:b5b:3ab0:a5b4 with SMTP id a640c23a62f3a-b6474f18313mr1781954566b.49.1761126976133;
        Wed, 22 Oct 2025 02:56:16 -0700 (PDT)
Received: from [10.0.1.30] (154-25-172-82.ftth.glasoperator.nl. [82.172.25.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb52603fsm1315025166b.57.2025.10.22.02.56.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 02:56:15 -0700 (PDT)
Message-ID: <567bf317-620c-4f00-827c-50a511d431c7@munisense.com>
Date: Wed, 22 Oct 2025 11:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
From: Gijs Peskens <gijs.peskens@munisense.com>
Subject: Ubuntu 25.10: base-passwd fails to chown. (pseudo issue)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 09:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225182

I'm just posting this here as a reference so others who run into this 
can hopefully find it, as it took me a while to figure out what was 
happening ;)

Ubuntu 25.10 obviously isn't supported, so I'm aware I'm on my own....

On Ubuntu 25.10 packages will fail to chown, this is due to Ubuntu 
having moved away from gnu coreutils to the rust based uutils coreutils. 
I'm presuming that Pseudo works by overriding libC provided functions, 
and thus intercepting the syscalls, and that the rust based coreutils do 
their syscalls directly (without a libC), which breaks pseudo and will 
result in failure to chown errors (and possibly other errors as well).

As a work-around, on 25.10, it's still possible to switch back to 
gnu-coreutils:
sudo apt-get remove --allow-remove-essential coreutils-from-uutils

(at your own risk)

Hope it helps others who run into this! :)

(and perhaps some thought must be given to this before 26.04 comes out, 
if the intention is to support that LTS).

Gijs Peskens


