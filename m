Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048FBC0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 14:43:42 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.12629.1739457818577344093
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 06:43:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=diLewOQ3;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f26a82d1dso366589f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739457817; x=1740062617; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dDojF+kEkOpxU7UAs5OTS5e8Vl6x1HC50r/9Z8axD0Q=;
        b=diLewOQ3cVhr69NWxIVCd7CNGIPuyy7gWRTyARFxiVc0XxZat3MnXKzAl1uCx9S7a+
         2XdYKMjPFGXP8JlHtwNdW3xQZQ6usZgPOCt4vBnIHZqTK9rb6d/+NqhQUeTrHWLXAD3A
         sSpb6mnx7ODN/xycvrIHgmTrDtXK1jGAwkuvm0yDRhJAhtei0X3LCNkwjo/MJz1F/RxH
         zC9vjx/tAz2X5xg2Wt6jdRiSswBgtXbHiZ7wzhSs3rbAV98slhH+U4XiU+iwgIxpB6Sr
         YUlvBVmgzspRXdDLnVwxPvq28KSoqKKG9nvyuK/LU6EixOUADiWGW10SBycAFENAMdgp
         TNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457817; x=1740062617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dDojF+kEkOpxU7UAs5OTS5e8Vl6x1HC50r/9Z8axD0Q=;
        b=VQoZhN9nYv6/2RzIjZm8cyP9jWwYvYkhyMC2YKIPD5yXGQ9LWlvJu9ZuGKKPdft0qe
         YVVjiIZePsT0rqsXyCRM4d/mQlg9n7hgOQP+m/+tH5XAuHoFzm6ov0vtgnyEJGdmZwCJ
         lre0y/hNAK72Bq/9uasjOsna/erzD9VV+uWlc2KPDmcROdP2VRCk1H5lpgNAKpN0A5me
         D4STM7vCJ5KD/LqCMW4xiUdViNMwzH1W7e+exFRHF5eTDLybXHJdbx8FVN/X3gkCRFSr
         g6qkcfUyHRaOHgSh8KbE27pYLGtf8xWLw5zy0hqcWK7Pm4rvhztdSeLjMsHLQsYArBMX
         qFqg==
X-Forwarded-Encrypted: i=1; AJvYcCUnd/CZvscRUi1FqXIcjUq922cjT/qaxN4+EFRRPudIUYUn2yurUqTcZAPfkuMDtjbcW1vJrd6Tl0tCwH1nRUJQbw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVFgV+8WS3+W/u62IUS0Mn3NC7nY1MmpFNvH0fVrMKtD3IKoMU
	b7DiNFWxEfBhb/jb/nTPfpmpP38GuXMiUCkMztnqVPVoWYpyWleS
X-Gm-Gg: ASbGncv79j6hARcowbfj6zFEHcmt8sqoGmPrSPThrJJ37JMC7YmU/vVofKUgV1a9ypA
	hvRjMuTTvLvVpsEQxALbFxfJsr9UuoN1cQInN3zaL2cEOS86t8wU5Y2p/d9+AxNBTNBsylBjtR7
	jdD3HEZR56CqQ1p3YDK803QQSQBe2iRXOnvk2yDM9iJAi3oPs5yIjwdzNFcn4PuqeVYI5zC//LS
	BPHyscbA2mlH3eMWU53rTobvfidbwLVg0Yj4ADJSW/onr0CxaFnotJ9uIwJ4+te2CG3FlgJYiW2
	aHRqyLyHlouJLkWkw/5ZMQ5eqA66Iv4bltFfv4Ps82LAtC7W
X-Google-Smtp-Source: AGHT+IFYblA0wmfxTcZSjvayzSjvtOFhM+WJindjAqjhH/H79DBXmqZkAlIwG2IsSqsGKBPexFv2jg==
X-Received: by 2002:a05:6000:4008:b0:38d:b448:65c4 with SMTP id ffacd0b85a97d-38f2452943amr4254257f8f.55.1739457816632;
        Thu, 13 Feb 2025 06:43:36 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5c29sm2069181f8f.72.2025.02.13.06.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 06:43:36 -0800 (PST)
Message-ID: <ecec863d-30bc-430b-9705-1ab720117550@gmail.com>
Date: Thu, 13 Feb 2025 15:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v12 1/5] rpm-sequoia-crypto-policy: New recipe
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250212043532.1258912-1-zboszor@gmail.com>
 <D7RCWUM2L2UY.1XEGKH8ENRDW0@bootlin.com>
 <1823CA649EDDAA06.9844@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <1823CA649EDDAA06.9844@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 14:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211343

2025. 02. 13. 15:20 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2025. 02. 13. 14:36 keltezéssel, Mathieu Dubois-Briand írta:
>> On Wed Feb 12, 2025 at 5:35 AM CET, Zoltán Böszörményi wrote:
>>> This ships a crypto policy file for rpm-sequoia.
>>>
>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>> ---
>> Hi Zoltán,
>>
>> I believe we have a new issue with this version:
>>
>> | python/build-crypto-policies.py --reloadcmds policies output
>> | /tmp/tmpqvyryz80: line 5: Bad configuration option: pubkeyacceptedalgorithms
>> | /tmp/tmpqvyryz80: line 6: Bad configuration option: hostbasedacceptedalgorithms
>> | /tmp/tmpqvyryz80: line 8: Bad configuration option: requiredrsasize
>> | /tmp/tmpqvyryz80: terminating, 3 bad configuration options
>> | There is an error in OpenSSH server generated policy
>>
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/3/builds/1027/steps/11/logs/stdio 
>>
>>
>> Can you have a look at this error please?
>
> I tested the recipe on Fedora 41 with:
> * nss 3.107.0 installed with /usr/bin/nss-policy-check present, and
> * faking uninstalling it by renaming /usr/bin/nss-policy-check
>
> Both worked.
>
> Some of your build hosts where nss was not installed complained
> about executing nss-policy-check unconditionally, which is now fixed.
>
> I think this is on a build host with a very old nss version installed.
> Can you uninstall it?

I found an alternative solution but it involves patching out
most of the policy generators:

================================================
$ git diff python/policygenerators/__init__.py
diff --git a/python/policygenerators/__init__.py b/python/policygenerators/__init__.py
index 0e3013e..180fb2a 100644
--- a/python/policygenerators/__init__.py
+++ b/python/policygenerators/__init__.py
@@ -3,34 +3,8 @@
  # Copyright (c) 2019 Red Hat, Inc.
  # Copyright (c) 2019 Tomáš Mráz <tmraz@fedoraproject.org>

-from .bind import BindGenerator
-from .gnutls import GnuTLSGenerator
-from .java import JavaGenerator
-from .krb5 import KRB5Generator
-from .libreswan import LibreswanGenerator
-from .libssh import LibsshGenerator
-from .nss import NSSGenerator
-from .openssh import OpenSSHClientGenerator, OpenSSHServerGenerator
-from .openssl import (
-    OpenSSLConfigGenerator,
-    OpenSSLFIPSGenerator,
-    OpenSSLGenerator,
-)
-from .sequoia import RPMSequoiaGenerator, SequoiaGenerator
+from .sequoia import RPMSequoiaGenerator

  __all__ = [
-    'BindGenerator',
-    'GnuTLSGenerator',
-    'JavaGenerator',
-    'KRB5Generator',
-    'LibreswanGenerator',
-    'LibsshGenerator',
-    'NSSGenerator',
-    'OpenSSHClientGenerator',
-    'OpenSSHServerGenerator',
-    'OpenSSLConfigGenerator',
-    'OpenSSLFIPSGenerator',
-    'OpenSSLGenerator',
      'RPMSequoiaGenerator',
-    'SequoiaGenerator',
  ]
================================================

That should work with this old nss version according to
the log.do_compile output.

I can't see an easy way to make these imports and list conditional,
so the patch would be "Upstream-Status: Inappropriate".

Since it should only happen for the native build, the patch can be

SRC_URI:append:class-native = "..."

As far as I know, /usr/bin is filtered from target builds but not from
native builds.


