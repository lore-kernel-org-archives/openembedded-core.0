Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8FAC282C5
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 05:50:02 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.47020.1740980996314554336
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Mar 2025 21:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EaaFnOxs;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abf4b376f2fso280992266b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Mar 2025 21:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740980995; x=1741585795; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PfbF+uSt/m+mi4XZQ2WaOPQJ3mxc1opvMRLgVK3bPms=;
        b=EaaFnOxs3q0ommmIjG1gXiZpQ/AfBLYvdgoFTLAwMJuavaccYOnWOrbhJkInuqfrDD
         XH8TeZPywgkIVKCwKdclFrmDzo/WW5y6LdlnAvOq0QugaT9Kle6iX7C7oYmtP7hdEd0/
         JhwSco7iMtCu5pzKXZLS5bhW86O2GezRPd5UnzoXTm7aq8ghdbSpehXxPdVroNt4Tojw
         aV88CSk5vnFz5TAwt9V1eG213dxrn6AFdk+c7U9GDs1TBO/kAOIFhZRPjJys5iiVyNyW
         YKcyQO8p5ljM+sNh9kr8g9KUY26tCp2fPFnKwVP/s3xi1J15UhwZ7YJBWHVmCmyl1Qgo
         xhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740980995; x=1741585795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PfbF+uSt/m+mi4XZQ2WaOPQJ3mxc1opvMRLgVK3bPms=;
        b=LR4zYBCFJ8LFYhFH8a9HjXa6px84XIiYZ0GHUgxWauHr+gn9+e8Fg11qgfNsJqUYs+
         yr0qT6d+r8ADOZrxlQyy8jkI2UsI82qUtF2kifB3kUVYbGU6hublbRVUZDXJNrvxX/bB
         0J6GCQHTkcS3UI/h4KoRuferm45ULDQmF80gmxuCGCIoV3718hXkA3ntWl7t2R/ITJti
         BUIXYmUrvQcLKRBjG5GmodX1uAJ04l9e5SSpwcJsocYyGWCRIX/pzukKNMjrBQDHMGwF
         UDRzDKkGtc2G7dCJWV6lLrxNmaAzlx0evFmAZ6cxNj8WA2Q8yGWgPqnGRTre36GQKo21
         4Eqg==
X-Gm-Message-State: AOJu0Yy4fMitpbgxdZLZywTeKvTuiidVjvpzGUaBmj5ykW804u1Ht1VB
	c2HfxtGxkgfIFx9xcd4sAIH7jmGlRuiwpFGoytKjR65hugK6/3xD
X-Gm-Gg: ASbGncvJC+4JQDRGRmCEMlYwOHPtUPeFXzt9iHdeoZnaQrboq992nntfIco0ke+ObiS
	BRoorqvlCe5h6IFkVKDwDLi9nTWx1EPD1WubfRYOb9fX2MIQ+u8wLlRYZ+qbW4rPln1H9JAcVPI
	QO95HsxJt7stvSdO239S5nS1PNx7+Bx3XyvwDKdOHJXaVhjZNT4Won6PCTx6s54OWztwIzFxzF3
	mXHvss0L6HeE737xg+lHDUQTJEObR4sCRzEQcTxBjKivqIQ3bMGvhiO7HQKlbAKE/YjX1CewCME
	tCPwPhSsdpa3+7pDN6bqHlX3ZGmNBS9DCndS/AzZqeJk66jpR17cSE3CDgAzlTiUYlXhFUBBBo7
	/Fw==
X-Google-Smtp-Source: AGHT+IFJmawRZX+NbT2XfpcnJxh+LaqO7UcOuc+manS+n6cgUvVPqW2YIvOkowWZC3fhhzHKHCK86g==
X-Received: by 2002:a17:907:c2a:b0:abf:6b30:7a94 with SMTP id a640c23a62f3a-abf6b58f60cmr556540266b.45.1740980994531;
        Sun, 02 Mar 2025 21:49:54 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c101415sm746619666b.81.2025.03.02.21.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 21:49:54 -0800 (PST)
Message-ID: <22c66e46-c188-4ad9-b527-8aedbab9ee0a@gmail.com>
Date: Mon, 3 Mar 2025 06:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] rpm-sequoia-crypto-policy: upgrading to
 ff7551bbb3011f17cb8c6aac03f64682dde14c21 FAILED
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
References: <010101955174417f-41791d06-a857-406f-b753-24fcd292bc21-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <010101955174417f-41791d06-a857-406f-b753-24fcd292bc21-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 05:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212197

2025. 03. 01. 12:25 keltezéssel, Auto Upgrade Helper via lists.openembedded.org írta:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *ff7551bbb3011f17cb8c6aac03f64682dde14c21* has Failed (devtool error).
>
> Detailed error information:
>
> The following devtool command failed:  upgrade rpm-sequoia-crypto-policy -S ff7551bbb3011f17cb8c6aac03f64682dde14c21
> NOTE: Reconnecting to bitbake server...
> Loading cache...done.
> Loaded 1881 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "2.9.1"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       = "5.1"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp
> workspace            = "tmp-auh-upgrades:cc9bc84087935d0263534342891297e66880985e"
>
> Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
> Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
> done.
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 2 seconds
>
> INFO: Extracting current version source...
> INFO: Extracting upgraded version source...
> ERROR: Execution of 'git checkout ff7551bbb3011f17cb8c6aac03f64682dde14c21' failed with exit code 128:
> fatal: reference is not a tree: ff7551bbb3011f17cb8c6aac03f64682dde14c21

Do I have to do anything with this?

The new commit ID is correct for the new git tip of
the fedora-crypto-policies repository.

The error looks like a checkout problem.


