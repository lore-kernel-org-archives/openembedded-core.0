Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4E7C369C4
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 17:23:25 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.25454.1744824200307126378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 10:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ej/dCb08;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso1429416666b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 10:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744824199; x=1745428999; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OYLZrUPfSKsuDMAOI8Srk2C5y8ku4cJno++JlX/+pCo=;
        b=ej/dCb083QNtgRAdCgniRByfQY2Kcjs5olSHv8xeEjG0kijxRPqdc+8Mqatak6PUGE
         atLkNMDou2yIwlFr/96qYKSM83gASi+XYf+QqWwRErWJmkwqVNptoT6nd03b4NM90a2A
         JdTgZWfAXOjqgu++Bw+m7ShVOhEo19gzwtbs5FQoaHQptSINYk5BqpJuvuF+BYNREmGb
         kBzoMHpFhsUgQNjfvvPH/CfNFsAVBLOCVFSWeewkbaq6mv2Jm64cdhfA35rW3zeMA9rA
         S0S9cwzWOGNpKNWLz6xD+ynXSWZjU8OIeLkyapMbRAT++7+VK3VQSzD48HlIjZsqKoha
         QDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744824199; x=1745428999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OYLZrUPfSKsuDMAOI8Srk2C5y8ku4cJno++JlX/+pCo=;
        b=lv0WpwuFSw4r3MPur6xU8FDExDS2Ak0rJxS2DB6aNyNWyNveowbmzI3U48NxqpxcjZ
         AxOoZAYzcp0VHcKRLeqI0zH9Lk1mExALaIoWnZ67vEem12hnxi++WXTrBmMlFNEmibdK
         hdbQSKdEUqOnpMCkdyzihFJ5yi35JFNNfYYSkkdUAEFjAJVWFawVexO8N9VmvNZQyHLq
         In5+S3DoRWMzrcE+HCUGggAjfilCBTLQGAzcoUtQzxdvpGAJmljz3/GOe03stF1Q21km
         945CvSC4Zudvty4Ah/sn8f0IEowqcH8JDRwUOu/HfHYss+fD4Sbgfdoa34gZU0UkdhDU
         SRng==
X-Gm-Message-State: AOJu0YyT8OseuUCxeDCLeSKPD9qyOJ+VJKSGt9HfBPeRvRa5VPJ7X7XY
	H2PgPFnWBh5oz4D02WuG98t+VGZX/pS0MmCppMGVkdNk0nxez5VbWJAiUw==
X-Gm-Gg: ASbGncv3qve2O4YCG8fbX7qfRttVGtiq+ji+7bw0paQpHN149C8W1S5amEpm01ySlJj
	V2ZtRGg6xEx0xu3OYJTheFELY4zC9y5nap9l7elM4dbE6GJFyaUrbSJwQpgmww7IAHhgV5CL5yi
	dxsDgx2k8Sxt50NOG/Y3XMhDZLmtnOBLsrmYRE6MspN6RPhgCKpL/39WMkbLfilTvCrldLpVDqs
	tz2pampPip2FF8IShxmtrMMqHp22OMOnXdLN1sQJr6DHshdaNQi32TlOtjV8ZFeElkUgVO0JiU5
	4PmkRas4CnFoL0G0s0oVhVQsnsaiL+rxE/9VjKXNBHyLzcUS
X-Google-Smtp-Source: AGHT+IFyb9N27ciVu1qfiykdeJQQoNLWYPnfswQJH3jBx2KWGPn7r53BUcdU5AOoKWZvT2dwnxnixA==
X-Received: by 2002:a17:907:8693:b0:ac2:6910:a12f with SMTP id a640c23a62f3a-acb42b29a2dmr273743966b.46.1744824197921;
        Wed, 16 Apr 2025 10:23:17 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d12893dsm162392166b.93.2025.04.16.10.23.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 10:23:17 -0700 (PDT)
Message-ID: <69747a29-2c7d-471f-8c2e-acbda9c3146c@gmail.com>
Date: Wed, 16 Apr 2025 19:23:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] oeqa/sdk/sdktest: Add test discovery across
 layers
To: openembedded-core@lists.openembedded.org
References: <20250416164134.399-1-thune.a.tran@boeing.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250416164134.399-1-thune.a.tran@boeing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 17:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215005

The same issue is also present for sdkext - since you are already on
this, do you think you could make that work too?

On 4/16/25 18:41, Thune Tran via lists.openembedded.org wrote:
> The testsdk task only loads SDK tests from the openembedded-core
> layer's meta/lib/oeqa/sdk/cases/.
>
> This patch implements test discovery to include SDK tests from all
> configured layers that mirror <LAYER_DIR>/lib/oeqa/sdk/cases/. The
> implementation mirrors get_runtime_paths() in meta/classes-recipe/testimage.
>
> Tested by:
>
> 1. Adding SDK test cases to <LAYER_DIR>/lib/oeqa/sdk/cases/ and
>    verifying they are discovered and executed with no errors.
> 2. Verifying existing SDK test cases in openembedded-core layer
>    are discovered and executed with no errors.
>
> Signed-off-by: Thune Tran <thune.a.tran@boeing.com>
> Signed-off-by: Chuck Wolber <chuck.wolber@boeing.com>
> ---
>  meta/lib/oeqa/sdk/testsdk.py | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
> index 518b09febb..505add8f8c 100644
> --- a/meta/lib/oeqa/sdk/testsdk.py
> +++ b/meta/lib/oeqa/sdk/testsdk.py
> @@ -31,6 +31,20 @@ class TestSDK(TestSDKBase):
>      context_class = OESDKTestContext
>      test_type = 'sdk'
>  
> +    def get_sdk_paths(self, d):
> +        """
> +        Returns a list of paths where SDK test must reside.
> +
> +        SDK tests are expected in <LAYER_DIR>/lib/oeqa/sdk/cases/
> +        """
> +        paths = []
> +
> +        for layer in d.getVar('BBLAYERS').split():
> +            path = os.path.join(layer, 'lib/oeqa/sdk/cases')
> +            if os.path.isdir(path):
> +                paths.append(path)
> +        return paths
> +
>      def get_tcname(self, d):
>          """
>          Get the name of the SDK file
> @@ -114,7 +128,7 @@ class TestSDK(TestSDKBase):
>                  host_pkg_manifest=host_pkg_manifest, **context_args)
>  
>              try:
> -                tc.loadTests(self.context_executor_class.default_cases)
> +                tc.loadTests(self.get_sdk_paths(d))
>              except Exception as e:
>                  import traceback
>                  bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215001): https://lists.openembedded.org/g/openembedded-core/message/215001
> Mute This Topic: https://lists.openembedded.org/mt/112298220/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

