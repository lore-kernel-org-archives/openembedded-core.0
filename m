Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A9310F3DC6
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 08:56:36 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7674.1774688193315751894
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 01:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pvur+rbv;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fb14227cso36922955e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 01:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774688192; x=1775292992; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gvv6PcdsShX8xn02YyMXiEdgbNQx6ACVNo2ff6SE4Ls=;
        b=pvur+rbvBMoV7ePb2GHiJ+Hj2K7f1QvPOryQMYE817wAO3xjfrgFOkB/K4WdYcZR6G
         EcPUevK1afjRauuZ0DmMOQLb0cm0rj8jT6PSGX/KguKreeXMHTp0mOP7NizHrhEJmY6k
         gxp50XtpC7dz2WeZdHdPFjJK4amD07OkFKO+fvbe40tMVf2fZfGD/GpXYfVLafBlu88L
         xoZRuzzICKYnUKe+8sVHlxaDyvRuNQQ912KSASnx2FEBpfFvM49dp2xjB5C50R1Bfid6
         Qw4lpd6ozouWWbd+sBH2y4asVCN13M6Oq/X9zJNf3/2XhUr+spSeug5QNIYLVkw+YyEV
         yBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774688192; x=1775292992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gvv6PcdsShX8xn02YyMXiEdgbNQx6ACVNo2ff6SE4Ls=;
        b=FaSiJmCV7g8YDRViAPXuQTt5QpuiDgUKAnHole5sFIlkr/X4XHyfZcgzby3VMFcnl8
         QQPLTazHSCPiEhjw95bXMxuolBpZA0xpW3+VQkdqUTGjT/eXYb26fqxWRdAgsBrJlYMH
         bCU84cORXtnZi+A57NMTJuMHtmxKsGHUdOJRhyGwca+dYd7s/r1fIj+zgrgF4y+NKlpZ
         y0asf7vsQH7RTfklB7Ej057vo4QuZST1UGivmvypT/VwN5k0ivsifeb+eOdi6MkyE2yH
         5nxP6/6700fqeAg+UNtLHG+SE2cmHm6GKFGfA1DOye/HkO1oQFxNkRub8sOSykUrr8e7
         2AqA==
X-Forwarded-Encrypted: i=1; AJvYcCWjmnez5HndcOT7yyKZzC6ZIkwN3Y6D9A3Pkl9XmozKG3sATz5hD+9IulJ1BFgY7VwYkYfLBRYL1uReRa8Bqd2G3w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxurFB/W0CV2NMnekR61LnmpvWpAtf/Y+N8WCVgQq6rgu82x4kO
	NVHIxyDVtBs79x36OG3G2KXC9D91RMqGGVyVJrMDAcxt0o3RQQlk+WRJ
X-Gm-Gg: ATEYQzzOf0VPpLgRKCZnCqsyDOqBIwa5Tqg///KqyVnGlovwet6UBepvXysHx58DrxT
	yIELvTZMLAXv/jF014dIHKsg4NXkEPZeprWPW/dRdG2ZD1QvIJFziL8IyfN+TGDxDdNHB0M5eE9
	WYux6R008jgm3EbtqbbzeGiIbyaHyJsNgZv5/AYZbztVDN6FzJC4ngRwJBXuPuHaX7LGh+DmWP9
	gJuHSpte5sT/JbGr6kxKXE35liGUVkiPik526kFaq0NC63ln6XSKP5gvP/PgqWBl4PFwkSCZisT
	5JBgBsdLqORQoBxQnYQR7wg5vDyIQNNu+60TJ0yQncI38ydgLOadbkERbE7ydPLnOUMgf95bpox
	QX6ptJanp07Pm7PNBY6y5ssXwSR18dSqbcePdEaZQqrZjzbKoIipvTuD3HurYz4iczj0Q/rBtjc
	FAShJ3NXC+17yTems4bscZD+60BecbXfVNyNUQ1Wlxeb/n5YFL11/FPJ0=
X-Received: by 2002:a05:600c:3b27:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-48727d5a252mr92724615e9.7.1774688191365;
        Sat, 28 Mar 2026 01:56:31 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d3b315sm44029005e9.0.2026.03.28.01.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 01:56:30 -0700 (PDT)
Message-ID: <cb2aef19-84ee-406d-ae1f-5bbf2ce2f9b9@gmail.com>
Date: Sat, 28 Mar 2026 09:56:29 +0100
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
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <DHE97CHEV2AH.1F608DBNYS3BA@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 08:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234121

2026. 03. 28. 8:57 keltezéssel, Mathieu Dubois-Briand írta:
> On Fri Mar 27, 2026 at 9:30 AM CET, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> PYTHON_DIR now contains PYTHON_ABI, use it.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
> Hi Zoltán,
>
> Thanks for your patch. It looks like lttng-tools build is now failing:
>
> ERROR: lttng-tools-2.15.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/genericarm64-alt/build/build/tmp/work/armv8a-poky-linux/lttng-tools/2.15.0/temp/run.do_configure.1174739' failed with exit code 1
> ...
> | configure: error: Package requirements (lttng-ust >= 2.15 lttng-ust < 2.16) were not met:
> |
> | Package dependency requirement 'lttng-ust >= 2.15' could not be satisfied.
> | Package 'lttng-ust' has version '2.14.0', required version is '>= 2.15'
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables UST_CFLAGS
> | and UST_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> | NOTE: The following config.log files may provide further information.
> | NOTE: /srv/pokybuild/yocto-worker/genericarm64-alt/build/build/tmp/work/armv8a-poky-linux/lttng-tools/2.15.0/build/config.log
> | ERROR: configure failed
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3489
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/3454
>
> Can you have a look at the issue?

I tested the build with my patches, there was no such issue.

It's caused by another patch that updated lttng-tools without also updating lttng-ust.

My guess is because these were not in a patch series:
https://lists.openembedded.org/g/openembedded-core/message/233485
https://lists.openembedded.org/g/openembedded-core/message/234080


