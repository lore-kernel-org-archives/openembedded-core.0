Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40EEC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 07:07:05 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.6576.1738739217614254883
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 23:06:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P/1K76Il;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso44450685e9.0
        for <Openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 23:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738739216; x=1739344016; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WZoWkQ0WJWeovfBOSvONiignzgGzbHq/lXDpvAQNKZc=;
        b=P/1K76IlpDOYcZbHYeRxVppkFr2CFBSFxRcQtZ8GCQPgtbZecR28VefTa44tXAYOFu
         LrZXZhFrXmvfg5C7utnCVLsPVNbdRupEO4V9y8xIA5/p1hUPiURR8LmfDQ3QUDBA8HQU
         iQdNv7w72BNhFqXlrcOMRHaPfF+JTV/FKeVO58oSdHk0lT5uZq5PTtl4PmT7EwG6xGIy
         vWk6jctTyFTPVtMRWU24v211abely2TmZGl6DEy8mWT/Xd3iSQHrm5N5t3h3EkKHlnM1
         OTbMkR/X6WPKNZ6l5SiNXSZBnINWzhDSdi2lCLYc8k34Sd1bgtssOmVRY87QC/wwKlIE
         Fx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738739216; x=1739344016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZoWkQ0WJWeovfBOSvONiignzgGzbHq/lXDpvAQNKZc=;
        b=jyejEFcoeRDpNIo6wKrQdpvRL26foGK8DMspQh2uB4tfSpkLQLXk66GCxac4UktqTJ
         9UVV5z3sCFU5FKTxTypD+D2yhr9YWBmYlY30wrXYOyyOzHptQkr2Vnfk82EGXoq/JCfq
         17EVUamrVS2fa8UwUrv0635h+4Z3MaxvOLMUkxmvZ4RfZtVM9Wb6wOI2WAtPtvKeFUC2
         WCExHRYaVc4U6hZDmCghc0TmQpoln83uCsp05qkKaapd64BAqgWumesf8y5H4kiN5qys
         sbeu3Y9l9A5HIhcdu44duFIa8Z4NAaDptXforZV0JmHU/j9HhfZyImw1vOqWGYjZbu5H
         QVkA==
X-Gm-Message-State: AOJu0YzASQ8G9z1mnVpX2P8wztTYw4PiFTuvWh3guZOU7yGxECa/7O/K
	l7kS1SdWNw/0d9/moFW8GsCI81PZKyB2GsAACItfIQ3nV61dcGH5
X-Gm-Gg: ASbGncv6Knd+VfYkQb3QrnLQMvYD+m3RMGK1yiw6bTfmGR2ylrcEUUEgERltcGpuyBd
	P8NXXEaQn7qn13dRA8qmQZAG7c1qJIfA+TV13TqCBQRkWy4lkXOj5adzjybgrJRIvwQQPkbViqj
	FPTQR67UcAPbTxZuPGRyyIxXRtTZ+e6TKXbno+rasvg9UVBSsCRz5WgKu1bF/6OMGr/o9oe0j6O
	yjTnQ68mToBG619S4E/d9GpHIib6AOJoABddmdbeTMrbsujzN0Dkq3VlvBXYjJ3C0q1uX3dY0qv
	Mk4YALKkNxW1ygSBDGgsXOYXkSRun94p
X-Google-Smtp-Source: AGHT+IHVDTRFbIVZ9nee+yBaCVF/YgzxEydDqiYrClC82dZBs8IcDlfOC5vD/HBc0BKcIeCNGRz/qA==
X-Received: by 2002:a05:600c:5127:b0:438:da66:fdf9 with SMTP id 5b1f17b1804b1-4390d43f779mr10111145e9.18.1738739215626;
        Tue, 04 Feb 2025 23:06:55 -0800 (PST)
Received: from [10.54.22.119] ([154.47.27.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f6741esm24586145e9.3.2025.02.04.23.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 23:06:54 -0800 (PST)
Message-ID: <5bc230dd-0480-4a5a-8cac-6137e36538a8@gmail.com>
Date: Wed, 5 Feb 2025 08:06:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Build the systemctl executable
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Openembedded-core@lists.openembedded.org
References: <20250204105315.84079-1-uvv.mail@gmail.com>
 <20250204105315.84079-3-uvv.mail@gmail.com> <Z6ITnblSwyvezrQT@nuoska>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <Z6ITnblSwyvezrQT@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 07:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210830

On 04.02.2025 14:18, Mikko Rapeli wrote:
> Hmm, doesn't this overwrite SRC_URI from systemd.inc?
>
> SRC_URI += "file://...patch" would amend the patch file.

Good catch!

>> -S = "${WORKDIR}/sources"
>> -UNPACKDIR = "${S}"
>> -
>> -do_install() {
>> -	install -d ${D}${bindir}
>> -	install -m 0755 ${S}/systemctl ${D}${bindir}
>> -}
>> +MESON_TARGET = "systemctl:executable"
>> +MESON_INSTALL_TAGS = "systemctl"
>> +EXTRA_OEMESON:append = " -Dlink-systemctl-shared=false"
> I wonder why this tag support is needed since MESON_TARGET already
> compiles only the correct executable with static linking. Is it there
> just to let meson handle the install step of a single systemctl
> executable?
>
> Or does it install more files, like config files too?

Correct. It installs much more when no tags specified :)

>
> I'm comparing this to a draft systemd-boot-native recipe for ukify
> which I had and which sets the build target but installs manually:
>
> MESON_TARGET = "ukify"
>
> EXTRA_OEMESON += "-Dnobody-user=nobody \
>      -Dnobody-group=nogroup \
>      -Drootlibdir=${rootlibdir} \
>      -Drootprefix=${rootprefix} \
>      -Ddefault-locale=C \
>      -Dmode=release \
>      -Dsystem-alloc-uid-min=101 \
>      -Dsystem-uid-max=999 \
>      -Dsystem-alloc-gid-min=101 \
>      -Dsystem-gid-max=999 \
> "
>
> do_install() {
>      install -d ${D}${bindir}/
>      install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
> }
>
> So the custom do_install() step could be avoided if systemd meson config
> would have "install_tag" for ukify too?

Correct. There's more discussion here 
https://github.com/systemd/systemd/pull/36243 , but if we need more 
tags, they can be added.

>
> Current systemd-boot-native recipe installs/copies the unmodified ukify.py
> from source tree and uses that in native. It doesn't run meson build for it
> and thus things like version details are incorrect. Also some additional tools
> like systemd-measure, systemd-sbsign etc are not compiled so some usecases may
> not be supported atm. If those would also include the install tags, then they
> could be compiled and installed too, I presume.

Yes, that would be an option as well

Slava

