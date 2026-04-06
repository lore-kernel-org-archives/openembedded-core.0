Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAB5EF4EDF
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 12:35:56 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53948.1775478954258662687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 05:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OhNlLN7z;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d02a71526so2228230f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 05:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775478952; x=1776083752; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CS+DIIqqbAxLAb0gp7aBIDJGUffGWFvPGJBZPiQIMl0=;
        b=OhNlLN7z4OVhm43ZKYaTDQbxB2vQp2usDtvqpBYUfGNLmybCJJwtwrbMM8lrX8vymn
         QTXLLBH/M1kLmGFJTSGaq0iGuipcWeAXn6urpYY2cCuZEBU2Nm+3dYxpFliO9lbBmLos
         PLb8y8gCvnp4SUY44lRtSVd+RVCV31np/r7RyPkut0/O+s0lcZ0Xels2sKeFptyMECIT
         l3rBN3ysd81dnZoM6VMctcMBF1iz6LACDO8eFkQeudzkB3uYDlUQeb5smAgEp31gypxb
         dNaHy1tzX/tyqHzaFX6j6zXmBOzLQvNrFMm7ImJ0Fe171fmeIvJ6qRlEnDVZfHDbuRp8
         R8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775478952; x=1776083752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CS+DIIqqbAxLAb0gp7aBIDJGUffGWFvPGJBZPiQIMl0=;
        b=SoIEyRHSfNkfFbM9Rq63SguezfS1NjXNmV6SGJITN0iphsCiw0f/Srhl0wcvhJFxPS
         adT0ErMYsxMlohzXx75o92FBZisMd+2WeaO+yGuQyl0tLVQHDO4z/MHQp4whKwVX2vil
         BRVeXkXsSdbb5Mq+jXxpg4ox+z2QnOqNGo9p4Frpb9NfDtd26AvvUjqO1z7lJS+1wBOD
         J43Zkkuyf+venKOiefSkoiYhm1kg+z21i47ckF56h5kq/OozrLFhWttyGZPzvhWrhUsA
         8fZ5PgbbC+KoxYyMuE8WIzHDXoTM9BevEw+bY90ECgIQ4nHNYXRX+g1yFyc9IPW+pb6f
         /JiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8VEYNXNtlfj6r/ZlrTe0LsGrXofCCx77HGB/s3rFbizk3fFQU2bVm/A8rakYWAhm1CilEALmDnqd4z773lAzx2w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxB6cOoNKGKBYdslvnwvdSsGq+zFaRWE+TAynMF+bOUzBnJnQ0z
	tD8oaQAAflf2Ud2QLe+4xLwPrna2pFRwwGhN6RRy9id/n00/vCskkaKS
X-Gm-Gg: AeBDiesE+u4xdueGV88Yf3oC4e+V8XJnx5drZaHBGamfmOeaq9YgeJS7WSh74q2XX8X
	Vf7guO7DKR70yPe0eD1MNbkCkGB+PZKVd8E6HpLiU9GRUYzoDtHhpjJB4mHbplSgWnI8iP6ctME
	QDPKE8LYIW5E0q4kS2AYNsV9hyaXTYJFaCVguw1Mx+RNzlkJDbZHNx+8aCdUUgRfnQLAFQVhvee
	uTQZ0aAZIrccz4Qrd3cd0WeJVlnr4iAK9wvliajQ7XrAyl4PMNUBTCRFvqNJtkPg9smZGvwDIXk
	Z+lJhH2ct8T6hk/Sue0BIo3x4xueQkkas/3HNvIUjfKRKMPKn/QCV7XeYQVSsXdhqEtoiAFkAx9
	2hTNDykxDdncC+dSXhybemLoGSzFM+QeZwi9Yhi7oVv/pUr6erqWxtdmJ9y7gvPOlGk1ZtKnRvK
	TfiuBNasr1UTqzG2rTvmFcW1rxjpf7Rwtr8tap5VQ8k0yM3kfnA6JWMA==
X-Received: by 2002:a5d:5d08:0:b0:43d:1c39:5937 with SMTP id ffacd0b85a97d-43d2930fc95mr18459330f8f.48.1775478952202;
        Mon, 06 Apr 2026 05:35:52 -0700 (PDT)
Received: from [192.168.2.122] (95C81E23.dsl.pool.telekom.hu. [149.200.30.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm38988074f8f.30.2026.04.06.05.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 05:35:51 -0700 (PDT)
Message-ID: <c58baed6-02ba-4c35-ad80-9a2cbac586bb@gmail.com>
Date: Mon, 6 Apr 2026 14:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 09/12] lttng-tools: Stop using PYTHON_ABI
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260327083055.12571-1-zboszor@gmail.com>
 <20260327083055.12571-9-zboszor@gmail.com>
 <DHE97CHEV2AH.1F608DBNYS3BA@bootlin.com>
 <cb2aef19-84ee-406d-ae1f-5bbf2ce2f9b9@gmail.com>
 <DHFGHK0ZXB9J.3LEH33RUE02U6@bootlin.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <DHFGHK0ZXB9J.3LEH33RUE02U6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 12:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234677

2026. 03. 29. 19:52 keltezéssel, Mathieu Dubois-Briand írta:
> On Sat Mar 28, 2026 at 9:56 AM CET, Böszörményi Zoltán wrote:
>> 2026. 03. 28. 8:57 keltezéssel, Mathieu Dubois-Briand írta:
>>> On Fri Mar 27, 2026 at 9:30 AM CET, Zoltan Boszormenyi via lists.openembedded.org wrote:
>>>> PYTHON_DIR now contains PYTHON_ABI, use it.
>>>>
>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>> ---
>>> Hi Zoltán,
>>>
>>> Thanks for your patch. It looks like lttng-tools build is now failing:
>>>
>>> ERROR: lttng-tools-2.15.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/genericarm64-alt/build/build/tmp/work/armv8a-poky-linux/lttng-tools/2.15.0/temp/run.do_configure.1174739' failed with exit code 1
>>> ...
>>> | configure: error: Package requirements (lttng-ust >= 2.15 lttng-ust < 2.16) were not met:
>>> |
>>> | Package dependency requirement 'lttng-ust >= 2.15' could not be satisfied.
>>> | Package 'lttng-ust' has version '2.14.0', required version is '>= 2.15'
>>> |
>>> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>>> | installed software in a non-standard prefix.
>>> |
>>> | Alternatively, you may set the environment variables UST_CFLAGS
>>> | and UST_LIBS to avoid the need to call pkg-config.
>>> | See the pkg-config man page for more details.
>>> | NOTE: The following config.log files may provide further information.
>>> | NOTE: /srv/pokybuild/yocto-worker/genericarm64-alt/build/build/tmp/work/armv8a-poky-linux/lttng-tools/2.15.0/build/config.log
>>> | ERROR: configure failed
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3489
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/3454
>>>
>>> Can you have a look at the issue?
>> I tested the build with my patches, there was no such issue.
>>
>> It's caused by another patch that updated lttng-tools without also updating lttng-ust.
>>
> Yes indeed, I confirm this errors does not come from your series.

I noticed that this series was dropped from master-next.
I thought it was too late for Yocto 6.0.
Should I rebase and resend early for 6.1?

There was another patch that was dropped, namely the one that fixes

   bitbake -c create_manifest python3

That is a separate issue and it was a separate patch, unrelated to this series.
Running "bitbake -c create_manifest python3" still fails in current master.
Unless it's stated that the manifest file must only be edited manually from this point.
Then do_create_manifest task can also be deleted.
Which is the preferred way?


