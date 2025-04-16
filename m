Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348E1C369C7
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 21:16:37 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.31383.1744838191420166404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 14:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GWyDUkD8;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c14016868so100506f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 14:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744838190; x=1745442990; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qyzFYVv1O/zvTwbI69lmjX+WGXL9Qx6SNSlHIzi8L8w=;
        b=GWyDUkD8eZ6qhJq+cO9AM5jw7ukpkXZi30u2ZgXVLJjz87OZzLdSwEhjRJnRV9PW2G
         jmRkdoOur+KedWLA77EarycakM269lOOlEtp0oSENFC24PXpNwLtgUbPTfJpuzMqfTaq
         nyIkx7gi/qyZIjEuhMwj4hCGF7H6cA20FOjU1YRmWjFFr5hEoTt1gQodHU3QB+sX4EwP
         YSQ28JUgk2Ii2DgnkwFjdPFf+SZqlhCZCVygVKMsij3JgmeEAExNkkS57hCT3bfQwFc1
         5CCNgCrDBSkCh8qvyUWNizyJqiJU/xK5ElPvzY0lgp7EYo3A01l8WKjnK4x9YQc8LPBD
         wOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744838190; x=1745442990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qyzFYVv1O/zvTwbI69lmjX+WGXL9Qx6SNSlHIzi8L8w=;
        b=T3Z1omMBZhhU/TOIeXcIbabuhsZxGWPCerfXl7okf2WP3c0DdmSkOE99Qrxen6+ISt
         Du0hoHtLfuwHRvE8+nNfJPLReF7wyQyymyY4VDhh8qV1o/JuoDNLKW0N4LDbQM0DIC/Z
         FzzucLoaece4izlr+TYmx/j6HoXm2y8fOeG9uzkxgvkiWKdBUUfQWlcLwBe1BKTu7jCe
         83q96M8J1Rl7BKzeo1JPC3FNLJi4XpLIBzI4TZ65bYBEgYMp9jVhte057LzxpbVCM8/g
         qYTVuY+2PZwoEk371GT3iDtNmuQSVvKxH+UQLRioB1M647cWklA1YioFaF42QeegqL1A
         xCdg==
X-Forwarded-Encrypted: i=1; AJvYcCWgJzFf3oK30XrEEbmn0uPWJngWIWRbguvQ1qdgbm0wHR2lWoeW4WtBWbBWYHQXGseSLFklErUcak1lVofErbTqFg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1yxEEyidGG+edgYF2tuusxd0P2u/zYeWpFaTOmifHVCvzu8pK
	to+GQd6S6gJ8U152t9frLC5ePelvbk/jk0iI2zPpTRtnLvrmKNc+
X-Gm-Gg: ASbGncs4dU4YWmYSG1Lhdqh7CmoMTM/i5z42yJ3qFEOmclsCQiQ/j7FajaUEYyM1w8n
	J896rLJ4kml4I1As8xUJYXx7hUzIZxwYCVSzh5wb0g1eycF6aMe+btMr0d0wFFeHCGkabyD6fQn
	XuPA+CdwPHYh4kKP8dNAVAhIZTJhfGAkODygXNfkROYWqDg3w11FojnvYN5E3W3e01dKltvvTYP
	1dHHdN2ywqSbO96vUe91LXrzAhekT1U1U9drK90EJhoqMSzgncwiuuuZj/K//FCRi18pTxgqu9X
	p8+dtt/edjW5keaR/k8CB5rXhDdoakOUjeA7fwFd5bNogzuM
X-Google-Smtp-Source: AGHT+IG8xvIxEyA76FEZ1JbNmPkZ/+xoJ20JI9SHbthVTGP+m24ZjRjtYjJROTHSPv84KrRa9g79Xw==
X-Received: by 2002:a05:6000:290e:b0:39c:cc7:3db6 with SMTP id ffacd0b85a97d-39ee5b18910mr2951071f8f.19.1744838189492;
        Wed, 16 Apr 2025 14:16:29 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43d053sm18293115f8f.68.2025.04.16.14.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 14:16:29 -0700 (PDT)
Message-ID: <7089cbb2-f297-47f6-bfa6-df0112d752ec@gmail.com>
Date: Wed, 16 Apr 2025 23:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] oeqa/sdk/sdktest: Add test discovery across
 layers
To: "Tran (US), Thune A" <thune.a.tran@boeing.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250416164134.399-1-thune.a.tran@boeing.com>
 <69747a29-2c7d-471f-8c2e-acbda9c3146c@gmail.com>
 <SA1P110MB22502577597BE3CD0A37FB9CB7BDA@SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <SA1P110MB22502577597BE3CD0A37FB9CB7BDA@SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 21:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215018

On 4/16/25 22:54, Tran (US), Thune A wrote:
>> The same issue is also present for sdkext - since you are already on
>> this, do you think you could make that work too?
> Thanks for pointing that out. A quick look at sdkext. It's possible to make 
> it work for it. I'm open to submitting a similar patch for sdkext. I'm not 
> immediately set up to test it. Would you be able to help verify the patch 
> for sdkext and also sign off on it?

[Just to have it here also, not only in private messages]

Yeah, I think I should be able to do that - I have an extensible sdk set
up, and some classes also that I can use for testing.


>> On 4/16/25 18:41, Thune Tran via lists.openembedded.org wrote:
>>> The testsdk task only loads SDK tests from the openembedded-core
>>> layer's meta/lib/oeqa/sdk/cases/.
>>>
>>> This patch implements test discovery to include SDK tests from all
>>> configured layers that mirror <LAYER_DIR>/lib/oeqa/sdk/cases/. The
>>> implementation mirrors get_runtime_paths() in meta/classes-
>>> recipe/testimage.
>>>
>>> Tested by:
>>>
>>> 1. Adding SDK test cases to <LAYER_DIR>/lib/oeqa/sdk/cases/ and
>>>    verifying they are discovered and executed with no errors. 2.
>>>    Verifying existing SDK test cases in openembedded-core layer are
>>>    discovered and executed with no errors.
>>> Signed-off-by: Thune Tran <thune.a.tran@boeing.com>
>>> Signed-off-by: Chuck Wolber <chuck.wolber@boeing.com>
>>> ---
>>>  meta/lib/oeqa/sdk/testsdk.py | 16 +++++++++++++++-
>>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>> diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
>>> index 518b09febb..505add8f8c 100644
>>> --- a/meta/lib/oeqa/sdk/testsdk.py
>>> +++ b/meta/lib/oeqa/sdk/testsdk.py
>>> @@ -31,6 +31,20 @@ class TestSDK(TestSDKBase):
>>>      context_class = OESDKTestContext
>>>      test_type = 'sdk'
>>> +    def get_sdk_paths(self, d):
>>> +        """
>>> +        Returns a list of paths where SDK test must reside.
>>> +
>>> +        SDK tests are expected in <LAYER_DIR>/lib/oeqa/sdk/cases/
>>> +        """
>>> +        paths = []
>>> +
>>> +        for layer in d.getVar('BBLAYERS').split():
>>> +            path = os.path.join(layer, 'lib/oeqa/sdk/cases')
>>> +            if os.path.isdir(path):
>>> +                paths.append(path)
>>> +        return paths
>>> +
>>>      def get_tcname(self, d):
>>>          """
>>>          Get the name of the SDK file
>>> @@ -114,7 +128,7 @@ class TestSDK(TestSDKBase):
>>>                  host_pkg_manifest=host_pkg_manifest, **context_args)
>>>              try:
>>> -                tc.loadTests(self.context_executor_class.default_cases)
>>> +                tc.loadTests(self.get_sdk_paths(d))
>>>              except Exception as e:
>>>                  import traceback
>>>                  bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
>>>
>>>
>

