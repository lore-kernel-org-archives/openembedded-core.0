Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69429C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 10:09:55 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.9374.1738145386205199494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 02:09:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DP2740J+;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso3929497f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 02:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738145384; x=1738750184; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BhbpyNWEjXhEiJkgjJE5mYOFv+slcwBm3E2+JN5vePo=;
        b=DP2740J+SCVHztg/GKz2XIz3HWFqfiIudO7CIK8cu1Y/GlK1/Bp+SGR9NwNKWX3lic
         g84O0cEwqRVIAtbWkYLKGqjXJ5Ydj2fqRssRVk6uX/n+BARgjW0nXU/98WSyMfgHmuoP
         fpc/o0lE9QZxrqO+aaC12oVank4JmFCeUhqaXtGOCWbM/Kai4PezbTWh8afa1orVr5OJ
         SnywtshiFM6nzHsKL8lPKBXJuWOzI1qTzscBs6Fl3evCgWpXk8aMzpWSPcnNJ7u2kUMq
         7gUeyf873hdDpnE2z8J7LfvmJOMWhf8eaRY20kYKzpRSGXvnAtvYvlCo4XkEmTdGWjW/
         u6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738145384; x=1738750184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhbpyNWEjXhEiJkgjJE5mYOFv+slcwBm3E2+JN5vePo=;
        b=AYdvy1Puc7SwSXhtR67RQK7LGEF27JBLwimvCBfuPqD4A/U468Rxlq52ifljiTVTBR
         Yy2n7QOPWYPknm1c7KmaDPramb5cl4KmZTMk1h20qI/Cv1BQkPtJUe/awBYB6GYC/ii9
         uIcnjFRPByRUo6obkDdqcYol+jjxTVinHv/4UlBtYk+w2W6phfDbXVoYdPP4u+0fbUA8
         DW8+Wo/o1I0NBcupjbTnKzps5DFQYd2sI0ZjTYvxN0gHP9GgUkwUfScxVYCZhg8dRb64
         JIqM5wmSKDs88i+xWYRH0dlY354j+7JjNg+hRja3J0lYjzxIz/G9VNagOcIV7YhAMBQm
         yqLQ==
X-Gm-Message-State: AOJu0YxVHGy51YkSmHS1JoV6ceZKFxXlcnT+ioV67S/7C1nOoFdn87Ba
	Wp2M4oNFCY5DJU0uNqe9PV/RYTI+DDsqWQgFeSeiar24DkP/81G6
X-Gm-Gg: ASbGncvRb+ogn1AdH9BLOzXz5Y37NaXH2ztWPW8y4hi4m94mzpMBOrFj7f5t1yayBHo
	0giC8SwxrfVwoLBD8jpRCtQ9F+X7WAIKJyIa6JdtA6RDs3B0XjOXue1kf7MgQgHhERrLNEA8K6f
	HmDFGO0lcyFQMjIEztySgCUW4RH09VdKsZtsvgeQxFRs5ltPfjiY58K0J7Sf67gJDzcTlcQKN7Y
	KwMRsz9AGJdObnmMbt3CVzoSWBrUhK2Goj/RCfMONkM1Jl4i9PImSAYq5W3U+Y91e2Gz4o6sBZQ
	5o0qA9XVBs54V3YYRXF3Bd5a3ahhdDtBvAwb7YAfnTPhdVRh
X-Google-Smtp-Source: AGHT+IG29247T/savQWl+qd/sy5GK/7Mih9uWWvtiOXqT4lBpedqqw/xQUEoQXQpe3MgWyQTIoXIrg==
X-Received: by 2002:a05:6000:4011:b0:385:e8b0:df13 with SMTP id ffacd0b85a97d-38c52095e20mr2124797f8f.40.1738145384417;
        Wed, 29 Jan 2025 02:09:44 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188673sm16221768f8f.46.2025.01.29.02.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 02:09:44 -0800 (PST)
Message-ID: <47dcd9af-18d9-4556-90b7-a33930df6e7b@gmail.com>
Date: Wed, 29 Jan 2025 11:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 2/3] rpm-sequoia: New recipe for version 1.6.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250129080902.1863054-1-zboszor@gmail.com>
 <20250129080902.1863054-2-zboszor@gmail.com>
 <CANNYZj-pUVu_vp7DERcSF__LcRWi3oA4hocfEqfKPW_KxmrGZg@mail.gmail.com>
 <1b6439a8-3688-4d45-90ab-0eef473eb347@gmail.com>
 <CANNYZj8Bx=VShWDBUX32rQYmjk=D3ExyXpCqNfXFDBWWVP=p9g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj8Bx=VShWDBUX32rQYmjk=D3ExyXpCqNfXFDBWWVP=p9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210362

2025. 01. 29. 10:29 keltezéssel, Alexander Kanavin írta:
> On Wed, 29 Jan 2025 at 10:20, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>>> +LICENSE = "LGPL-2.0-or-later & Apache-2.0 & BSL-1.0 & MIT & Unicode-DFS-2016 & (Apache-2.0 | MIT) & (MIT | Apache-2.0 | Zlib) & (Unlicense | MIT)"
>>> This is very elaborate, how was it determined? How to ensure it remains correct?
>> It was taken from the Fedora specfile license line verbatim.
>> IIRC, they (Red Hat) have a large contingent of lawyers
> I guess you could add a recipe comment pointing to the original specfile online.

The src rpm build from koji can be linked, I haven't found a link for
a separate specfile.

>
>>> Why can't we use upstream's standard install procedure? Also,
>>> cargo.bbclass has an install function, why is it completely replaced?
>> Because it fails with:
>>
>> | DEBUG: Python function extend_recipe_sysroot finished
>> | DEBUG: Executing shell function do_install
>> | ERROR: Did not find anything to install
> Yes, cargo_do_install only copies executables, you need to opt into
> libraries by setting CARGO_INSTALL_LIBRARIES.

It installs the library at the wrong location, but do_install:append
can still fix it so it matches the pkgconfig  file.

> But before that, presumably sequioa upstream has a standard
> installation procedure that we can try to use instead of copying files
> by hand?

It doesn't. It's README.md used LD_LIBRARY_PATH for
the example rpm build using it.

> I'm particularly interested in how ${S}/target/release/rpm-sequoia.pc
> is supposed to be installed.

It doesn't get installed, just generated.

I guess that's why the rust-rpm-sequoia specfile copies both
the so and the pc files explicitly in the correct location.


