Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684F3C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 04:44:47 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9052.1738212286667594454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 20:44:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dO6NL/1p;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38a8b35e168so148010f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 20:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738212285; x=1738817085; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gacBcvswnQZdSG63g7tf0qlrhRyQ85zbQ34JkPIG/C4=;
        b=dO6NL/1pRQ52LICZMDjX5YN4KqIlVJmZR52WJfyXJng1wZlAXJxfEgTXf+hIkN6Uev
         PqwTh7Es3bcahBxY4Uv+tWRHpd0VX4FpjtgsuiIE6xcwDNHtlUV/ug9JZMBWESXDRbDp
         56d/qhhdYc7DGddMjJ+huV9WeaiXqupUx/rLkvRiHllqhIGhpciq2VkdFTv119odRkG2
         XzyQ3y92Qh47HvBO3LfVB3hnddSmpogiO1TKOU/OjqBfOWnWU8RhCB/4KTaqgREugJkf
         VqFR7t8oSMx8mOwRDURUkarHtecA2I8dcOTw7gxBpQfEAgncRJ0/ZlIqUVThSGWfTSwK
         vWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738212285; x=1738817085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gacBcvswnQZdSG63g7tf0qlrhRyQ85zbQ34JkPIG/C4=;
        b=jdtK74StT9gtdPT4Y+mDHW9r/Jj0ww6U03P1OSXNeZos2MxC9yYBwh3u3+Y7XAvs+t
         n7+fk8U0HKMvoAvhcx3HrcQ1EuDxFEmuYbfIALXsFI/6UDPc4/P9UjIdOYvubQk88rG9
         a8G8zz3scw2BQOvVvN5zapkoVTC+SpjLbEaNdNmRL0IEQZ2avsqd3/+HC7CnVG0ZYNtQ
         8ZptAHpu+2HcIWlIGaJ8ElumJ0gE96rti1CFJXIBPIFo22z5TzVOPy4pheQuxIj+t5E+
         v1VjhHmkvokPmRDW6PPR1nQkjJSkKWY98DRy3tu+iaoBDgu+AsR9/gKw3YeSuiwNHXeY
         5aKw==
X-Gm-Message-State: AOJu0YzhpMvaTq2wm/CjppdY1uF0T1HaYfdmcD4Z/YA/U+/6mLyzkqlm
	ucv126TKbxCU+osEy7MQ+pPUSdUUU9dzRCpR2qJkhgsXJasTsx1R
X-Gm-Gg: ASbGncvOKmP8cogMKI+l0Z4eZKcBcOaY7ujk672OqHWfZmHIeA5LGt26R7xmApCbgvB
	BM7LG63jNh5AfUUkD1ONDjdrWlRVEAkBDyrC6YlDMe6UlujvT8DGwlEom6g4/NBre0nCn7JZPC2
	k/AsxZ6h7CQP3cXLusjEelbuqxH2QoRcwAzteUYtqeBZ4x9JjRbxADXlI4ph/DnKr8EN9VslA6w
	iVLsttEwS5ynUbbtD8fTdbO8GPWACJY466TsnzNcMUpol1sMma7qkGxBG/WWv4BXsU/zFk0p3hP
	bolUK0ZMsd+gaF2z9f/7qx2wZWsoKqvRPjG+W+3vKtj06UjT
X-Google-Smtp-Source: AGHT+IHHxdr+jVlP0A7iurQojU3+dcM+VeabiwnBlAEy+h8pL7oVUzsDFjLunwPfsnRbwxogoSP/LA==
X-Received: by 2002:adf:e2cd:0:b0:385:e328:8908 with SMTP id ffacd0b85a97d-38c5a9c0e91mr881191f8f.29.1738212284779;
        Wed, 29 Jan 2025 20:44:44 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf571sm722036f8f.82.2025.01.29.20.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 20:44:44 -0800 (PST)
Message-ID: <0d346993-c869-46c2-a05a-c1a57a2fda67@gmail.com>
Date: Thu, 30 Jan 2025 05:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v3 2/2] oeqa/selftest/cases/signing.py: Re-enable
 self-test
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250129124741.4115324-1-zboszor@gmail.com>
 <20250129124741.4115324-2-zboszor@gmail.com>
 <CANNYZj-123Mqr8zyCjmtqyE6BYD2R=wVRy+5NMACu18KAdidSQ@mail.gmail.com>
 <181F2E043A3A6FB9.31881@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <181F2E043A3A6FB9.31881@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 04:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210435

2025. 01. 29. 14:49 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2025. 01. 29. 14:05 keltezéssel, Alexander Kanavin írta:
>> On Wed, 29 Jan 2025 at 13:47, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>>
>>> +        feature += 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
>>> +        feature += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
>> This and the other patch are now fine, and can go into testing. But:
>>
>> - bonus points for updating the signing section in
>> yocto-docs/dev-manual/packages.rst to mention the above
>> - extra bonus points for updating the 5.2 migration guide in the same
>> repo under documentation/migration-guides/.
>
> I am on it.
>
> In the meantime, I am running "oe-selftest -r signing"
> with the patches on my box in poky.

It has finished successfully:

zozo@localhost:~/poky-5.2/poky/build$ oe-selftest -r signing
2025-01-29 14:39:37,552 - oe-selftest - INFO - Adding layer libraries:
2025-01-29 14:39:37,552 - oe-selftest - INFO - /home/zozo/poky-5.2/poky/meta/lib
2025-01-29 14:39:37,552 - oe-selftest - INFO - /home/zozo/poky-5.2/poky/meta-yocto-bsp/lib
2025-01-29 14:39:37,552 - oe-selftest - INFO - /home/zozo/poky-5.2/poky/meta-selftest/lib
2025-01-29 14:39:37,553 - oe-selftest - INFO - Checking base configuration is valid/parsable
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (14:39:38.171905)
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (14:39:38.171905)
NOTE: Retrying server connection (#1)... (14:39:38.171905)
NOTE: Starting bitbake server...
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint:
hint:     git config --global init.defaultBranch <name>
hint:
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint:
hint:     git branch -m <name>
2025-01-29 14:39:39,242 - oe-selftest - INFO - Adding: "include selftest.inc" in 
/home/zozo/poky-5.2/poky/build-st/conf/local.conf
2025-01-29 14:39:39,243 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2025-01-29 14:39:39,243 - oe-selftest - INFO - test_locked_signatures 
(signing.LockedSignatures.test_locked_signatures)
2025-01-29 15:05:04,921 - oe-selftest - INFO -  ... ok
2025-01-29 15:05:04,922 - oe-selftest - INFO - test_signing_packages 
(signing.Signing.test_signing_packages)
2025-01-29 16:28:24,928 - oe-selftest - INFO - Keepalive message
2025-01-29 17:02:06,060 - oe-selftest - INFO -  ... ok
2025-01-29 17:02:06,062 - oe-selftest - INFO - test_signing_sstate_archive 
(signing.Signing.test_signing_sstate_archive)
2025-01-29 17:05:45,812 - oe-selftest - INFO -  ... ok
2025-01-29 17:08:41,521 - oe-selftest - INFO - 
----------------------------------------------------------------------
2025-01-29 17:08:41,522 - oe-selftest - INFO - Ran 3 tests in 8942.537s
2025-01-29 17:08:41,522 - oe-selftest - INFO - OK
2025-01-29 17:08:48,132 - oe-selftest - INFO - RESULTS:
2025-01-29 17:08:48,132 - oe-selftest - INFO - RESULTS - 
signing.LockedSignatures.test_locked_signatures: PASSED (1525.68s)
2025-01-29 17:08:48,132 - oe-selftest - INFO - RESULTS - 
signing.Signing.test_signing_packages: PASSED (7021.14s)
2025-01-29 17:08:48,132 - oe-selftest - INFO - RESULTS - 
signing.Signing.test_signing_sstate_archive: PASSED (219.75s)
2025-01-29 17:08:48,133 - oe-selftest - INFO - SUMMARY:
2025-01-29 17:08:48,133 - oe-selftest - INFO - oe-selftest () - Ran 3 tests in 8942.538s
2025-01-29 17:08:48,134 - oe-selftest - INFO - oe-selftest - OK - All required tests 
passed (successes=3, skipped=0, failures=0, errors=0)


