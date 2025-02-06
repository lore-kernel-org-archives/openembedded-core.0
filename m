Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5342CC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 10:43:04 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.37515.1738838580465374978
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 02:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z1BPsU1Z;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38db34a5c5fso318600f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 02:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738838579; x=1739443379; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKCLEIN5nBo99NvfV/23B3vkmoWNtynJCOepB7yuhm4=;
        b=Z1BPsU1Zftey8u+6mp1bY+VZG2P/zkW9aZVeVjlozA9YK8JyiPLzSxXTfV0if0YkVA
         q7BePhOSAa/3s7H+pLl60NKNO5Lj5SpAB+4+0CRfg2HkdAsWiPTL2ZIYLA7wbx0ndS+v
         wBWz++1bOZzxIUApRFfWQB2ajZXR1SFOVu1pDQxp0E4jGpcZ1A8B5MNO7rSx1YO2Qfto
         Zs7HEoz6nFZZ2dsQtX6svXPeTmghdUIQYE964kVOFVuGy8FkeJ9KcVVMin773yc6rQf6
         GXsR8E0zNEXeKQifYWwR2VvYcEQqoYS9EiSXFV2IGMLOPcsMM5vA9viF/biP9WiyGT5l
         ovfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738838579; x=1739443379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKCLEIN5nBo99NvfV/23B3vkmoWNtynJCOepB7yuhm4=;
        b=gt1/Yg0phG6xKwwFDMg8hHeIA2UDe8pLKiWihhLa27VA3IF33SsX0fGkr9cv3vBIm5
         f0IYJ8ezdgw5vQtloc8a990CfTpVFJ6TTxdlTakX0bFOJ/ggJ5cYV8OcOvqmLVwF5APY
         Wg+rYbcXbmKGYV44+V3xyvBBov6mIpGFhItdBwKkiq9j/x2G30kY9SllUDU8tyefn1gn
         ZPkykEK2e/rbyNNr+huKhk9cHykb2803gcbQYA2MSTuSs7fDvEzOJPO1YlVl44JLzEUU
         6zFaXaYU4JcFdqJzyIIPcN3/WsLeKstU7xjzL3tALOox6xqfVk2pkvP4SCuFKGeuTM+g
         Aocw==
X-Forwarded-Encrypted: i=1; AJvYcCXWep9XTJVnSjvU+InrN/Qn8dzveExyL12Lw/+OcH0wuCmPoBiCQlT/Qvs2ldad5fP8zfyu+8HDmMkgWguzEIxhgA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxyPUCO/QUBeAe1daiX9bfT1YLZVvQryoXhJ3p3c/mkO6fOW2Sg
	x9N9ncZg0Slre+bq9PsbG2+f7FspIbfk6NbRtM/aQJa5GCV0Gai9
X-Gm-Gg: ASbGnct4NjC/9COqv4FDugHWXIkiIy3Bc+tXEmwih43BYRl9T+d8vV9D47S6MXJVunP
	I5EnbafTwkw0m+Sjzuz5WsKfnoCgvLrn2ZqjJ/FVINioWzZ4yowOJmDyRmS0rexkaqUUTs7KR1x
	XCPNM9sDpSGfrcAD7FTvW8UgiCdU8qMcdx0DdwM6V7JXX7DPNsw4zw2ZZdpnVaZ9n1oiQH5exWq
	6bhImiIAhcMUkhCaz6UGUHgxneRfP6B+l3lv8kT2zNqQrEiLxO13SGSKbpms0gh3z22ZeI/5eGd
	3s7MvG9uX+tYtajYXF1ZbyyRNOIkBB6BWKjd4PqieGpCS+Vg
X-Google-Smtp-Source: AGHT+IHnDodMKHJ8NgVXKTu4NIqSLAVWWISC4VpxRnxepwSbGcJH/nliTOg6N55y8Bm8QFkfLwC4xA==
X-Received: by 2002:a05:6000:11c3:b0:38c:617c:ee22 with SMTP id ffacd0b85a97d-38db48e8e74mr3712146f8f.54.1738838578584;
        Thu, 06 Feb 2025 02:42:58 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd35e88sm1353305f8f.26.2025.02.06.02.42.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 02:42:58 -0800 (PST)
Message-ID: <07b393e5-06c0-45c2-8864-9a9251eef30d@gmail.com>
Date: Thu, 6 Feb 2025 11:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v8 1/5] rpm-sequoia-crypto-policy: New recipe
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250206055222.3319167-1-zboszor@gmail.com>
 <D7LA9XGPGG5H.287DBDA93AM2K@bootlin.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <D7LA9XGPGG5H.287DBDA93AM2K@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 10:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210915

2025. 02. 06. 11:16 keltezéssel, Mathieu Dubois-Briand írta:
> On Thu Feb 6, 2025 at 6:52 AM CET, Zoltán Böszörményi wrote:
>> This ships a crypto policy file for rpm-sequoia.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
> Hi Zoltán,
>
> Thanks for the patch update.
>
> I believe there is a regression introduced by this version of your
> series, several builds are failing with:
>
> ERROR: rpm-sequoia-crypto-policy-native-20250124-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/temp/run.do_compile.537997' failed with exit code 2
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | asciidoc -v -d manpage -b docbook crypto-policies.7.txt
> | asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysroot-native/usr/lib/python3.13/site-packages/asciidoc/resources/asciidoc.conf
> | asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/sources-unpack/git/crypto-policies.7.txt
> | asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysroot-native/usr/lib/python3.13/site-packages/asciidoc/resources/docbook45.conf
> | asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysroot-native/usr/lib/python3.13/site-packages/asciidoc/resources/filters/source/source-highlight-filter.conf
> | asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysroot-native/usr/lib/python3.13/site-packages/asciidoc/resources/filters/code/code-filter.conf
> | asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysroot-native/usr/lib/python3.13/site-packages/asciidoc/resources/filters/latex/latex-filter.conf
> | asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysroot-native/usr/lib/python3.13/site-packages/asciidoc/resources/filters/graphviz/graphviz-filter.conf
> | asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysroot-native/usr/lib/python3.13/site-packages/asciidoc/resources/filters/music/music-filter.conf
> | asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysroot-native/usr/lib/python3.13/site-packages/asciidoc/resources/lang-en.conf
> | asciidoc: writing: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/sources-unpack/git/crypto-policies.7.xml
> | xsltproc --nonet -o crypto-policies.7 /usr/share/asciidoc/docbook-xsl/manpage.xsl crypto-policies.7.xml
> | warning: failed to load external entity "/usr/share/asciidoc/docbook-xsl/manpage.xsl"
> | cannot parse /usr/share/asciidoc/docbook-xsl/manpage.xsl
> | make: *** [Makefile:137: crypto-policies.7] Error 4
> | WARNING: exit code 2 from a shell command.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/870/steps/14/logs/stdio
>
> Might this be a missing dependency ?

Sigh.

That's what you get when your regular dev laptop is also the buildbox,
with a lot of things already installed.

I will try to patch and reduce the dependencies instead, as there's no
need for building the documentation for the crypto policies.


