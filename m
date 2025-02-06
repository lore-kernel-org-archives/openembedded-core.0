Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DCFC02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 11:49:24 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.38689.1738842557353646815
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 03:49:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V4EqgGcm;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so7878205e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 03:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738842556; x=1739447356; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Spq6d4AktrEBnA191CDiLa/FG/VeVmwVoM6gUNLz5Y=;
        b=V4EqgGcmTZYDdaMRMnZ1lwrzwAd9rjrAJhEEdlZ+Gw4G+0uKKVG93eidS3KM/H+EUS
         rtkVRiI8gprGOVtJyO5eeWxtKDvOM8gDd42jnYu6jY4Yq6E268+EQpZYvMS85+kiXSDo
         BhYcI9RKpI3jV4pAVDgpz5MhYvjc/RR2N4NPyXfpqHazuWFfmtE4IPAJGzq7NB0A4J4y
         MKzZ+Mvh0NOs2i8VU1CQeJpwcis8xkJRrgzchThZaOR5KCf3gU/ZCmMNjIKw+Jfm+sCE
         vtpS6p0aaTmuBuiv9ELwHwOBkfp4voS9MpC+MlQg4c3edV2sp10uPsVMbkfd/9A9PjfP
         30KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842556; x=1739447356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Spq6d4AktrEBnA191CDiLa/FG/VeVmwVoM6gUNLz5Y=;
        b=nwuuHMbjl1zuD+M4/KX0mCfc6qKiJCFHtF7PCBLHWVwdYMum+VDmUMnzqZ8HmE3xfO
         cSnt/rpCOfyCV2PJoqkNzhuyT2kVrM9s4F6x/o1/Rg8VUuBu7UJBpnF047JyP7GWN2Ns
         HO4niquxNqNXnYnvfrMp1wf64Jm9rntV0mPew4H9+52pgKoA3fwuxKoKrUFcHF8wrGx9
         SJoEV8DiHDKu2RsoTrX1PMyXoSNnzXxw5jlqllV5NUeiy3tnmU4j5npwC+M5rbN8cZUK
         VE7qCZIEbycqu5AAsQTkxRPtBRjJ5iWKKYriofQAYMDWmORbrxlQHLub8R4Z6HNnc2br
         0REA==
X-Forwarded-Encrypted: i=1; AJvYcCX1N+rG3mD15BN8atmmL4PMa006MLexvvnIGz3OWQ5waYmh0o2uPpjMW9dJPBCrFmfGUoc2DAXbaOmCALeoMDur1A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwDJuTZLKU377l7aoCLhd1buuWbxNG7x34WwnJx4B8/sf3Syvdx
	q79/vejOSCDweZsGL3vkimMPISxUGPTUr2XE4kcBiF4NnjM/ZOTF
X-Gm-Gg: ASbGnct4nZpD12ncbtwN++Wr02zJbuzYcXsqAsDcE1OIllTEjWtI7IlMf7WbfxNdC1O
	DqfX+2j17uy+ui222IsPcUoKihEYMxcVdSGRV4IeqOG+ESNsAR5FRbG0XWg7zhwiSsLD4bYF5OL
	v+J62Lxzge/hYOJhzsrj+m2hVSk2e0aeEBznDykzJqpJSfqQAVrgzUvcDJTEqMcA8Luzns+dKRV
	YcBvOgkWysaxBm+nZIr4lM0Sfm5I8+br0KwDlJw06XUksC+V0hdW80C2zBTxGrYFaL/d17HABFK
	qwFnQTRgW9VKOUo/jgBUWD8Md5xMr8VpyckH/GC+Wl6Icelu
X-Google-Smtp-Source: AGHT+IEWY1nGTDZ+e/r8E2w+WdFtxzHmh3GJcMjiNoz9biplVJdJHyowUAyXnjRbYCUIS26ZBKwPyw==
X-Received: by 2002:a05:600c:35cb:b0:434:a30b:5455 with SMTP id 5b1f17b1804b1-4390d56c34amr51874205e9.27.1738842555454;
        Thu, 06 Feb 2025 03:49:15 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db1150csm53028285e9.39.2025.02.06.03.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 03:49:15 -0800 (PST)
Message-ID: <90e2e812-27e3-4828-b6c7-6d374e3cfe34@gmail.com>
Date: Thu, 6 Feb 2025 12:49:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v8 1/5] rpm-sequoia-crypto-policy: New recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250206055222.3319167-1-zboszor@gmail.com>
 <D7LA9XGPGG5H.287DBDA93AM2K@bootlin.com>
 <07b393e5-06c0-45c2-8864-9a9251eef30d@gmail.com>
 <182198F3C56EC291.752@lists.openembedded.org>
 <CANNYZj_BrS8MMwzqrxehg91SFp6OFHEjOyfzcxdZ4wnH2TV7Vg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj_BrS8MMwzqrxehg91SFp6OFHEjOyfzcxdZ4wnH2TV7Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 11:49:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210924

2025. 02. 06. 11:53 keltezéssel, Alexander Kanavin írta:
>> This would work too. Those aren't trivial dependencies to fulfill, and
>> they're unnecessary for us at the same time.
> If you're making a patch, don't just patch out the documentation lines
> in Makefile. Make it conditional to a variable, so we can set that in
> the recipe, and offer the patch upstream.

I patched the Makefile in a way that's already in its mindset.
asciidoc can already be overridden, I just made the same with xlstproc.
The PR against the upstream sources was created, it's referenced
in the patches in the recipe.

I just sent the v9 series with the two patches, hopefully it will work now.


