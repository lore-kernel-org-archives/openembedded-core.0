Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474C4C531D0
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 23:52:35 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9104.1784850749796444069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 16:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KI/V55x7;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so1203325b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 16:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784850749; x=1785455549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45PiIOY+sW4KEaBQvWc1jXSs0HZJCa5tW1wHmNZmZDM=;
        b=KI/V55x7hymCPb2rXeD8RkkgpJJZyGB3iTcUtqh76iEezvIeQVzeVEnj1rY5JTtQde
         AmDl4+yUk3TCf1o7Fugo5163qCBqA2gt3IJ3HBFqAq/0Ojqn6AK0Kk73BlWWz1nTUgMS
         aGcM1Qpc7Sy/evaCRWBMzKX1woPYvk7XkwwYjoir7I04Al7YxVkwwLUnGTn3i9LC8me8
         fucR6FflaXie9iXypu9ofR0iHiswv8oRX+pzSF0cArATNCGLKnsla8bGrJBhmYjtw0/9
         SFhyOQaLaAi5jSVSFNOyoaZruLn30jVcNR7XESK4eoz6VJc4yCFeS5dSiaLJF39WVEnY
         OfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784850749; x=1785455549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=45PiIOY+sW4KEaBQvWc1jXSs0HZJCa5tW1wHmNZmZDM=;
        b=ddA5Mj1S/AHbAL6DWGG/eAM/MkqDEHcG5N/5PS+/Suv8r7LFlzz8Jnh7Js0VyKGqki
         +dX8bYsQHMZovoRAX/Lq15Eyev2/zelmltNLtepxVP9pQ7ZamgAlnvDkOWgm4IUnf8+K
         PENSwC16g0ift2Yiq1VgKBsISwqVOc6R26utxImBeNcgW+KB5S1uxhYhHljn4dqrVfBW
         eTpjBffmAj14bkb3tGOslYvFIHep6Bjibp076mSsf3U/uvlby7qtuvxJKdw1mBuvX1ba
         BMdD+qKVNPVFbfKR+lXPeZvcpSZNqnL9X4msc6M57z/gjXEhOudubjkEZloQLe9Q8n/Y
         GLYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpd0C0pyAP+6cHM2yWxIkcsvGTwLJFbNH0CAQPt7FDIEbqUuh4zNBaRH2JSEZfKITtE7PjZ2uFZRsWddXjHFzaC/Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwKgupllgJbFz7qW11Vi/OrkKotmtDKJfZI7fURBKjeTYBLmcrz
	j3hvGkY1gMe7CdXS/Of/A757UkzK9TP/qi7G2yM/easCpTFc6br07AYi
X-Gm-Gg: AR+sD12sQ8wLqOIlz1+FFN1VxrB4AVR1vEc+zanXcId03nLTlREiBwq3n4dyhtDvrWF
	fwPdvCyg8IooofP7HGXD6w+LSRYGtEvAVCPv5Ku/D2Pl23eAhr3n1M612kOI+xT1zpTjsnrOvtD
	MB7df/iS/C9I04hA0Zgu26nnYzS2Ja7QQAtKO4piqZdOdD15ruGgRvohebzy5mJxMyR1bn+k9aO
	iPB/XU0RHFIb8xwkNiM/p8eZKKsFpYtPA7rZGJhmr1U+kW21q7TkwqvzOE3lteK46qyCMDzWpr4
	dRURQhHTieWJBRi3hZ9pHSLylSvzHg7KwREvygjVULklaGm9JRtg7bBdO1LF08wy010gxpOX1jC
	3Izp59U11lGbWfVN/b2tGSer8PKGIHYkpS7T5v56czhqzW4bj/EfPopJAEP8aDpeQLBQjEpPjqM
	mi0Q==
X-Received: by 2002:a05:6a00:17a7:b0:848:7bbd:2851 with SMTP id d2e1a72fcca58-84e2e9578a0mr5550285b3a.29.1784850749035;
        Thu, 23 Jul 2026 16:52:29 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17600a72sm3825466b3a.58.2026.07.23.16.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 16:52:28 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Chris Laplante <chris.laplante@agilent.com>,
	Peter Kjellerstedt <pkj@axis.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] devtool: standard: guess srcrev update mode for gitsm:// recipes too
Date: Thu, 23 Jul 2026 23:52:27 +0000
Message-ID: <20260723235227.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DK61MC7B9VH0.2408UF4LVISPP@bootlin.com>
References: <DK61MC7B9VH0.2408UF4LVISPP@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 23:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241879

Hi Mathieu,

Thanks for the report. I dug into the three failures on build 4355:
one is a real regression in my patch (fixed in v2), the other two
don't look caused by this series.

1) test_devtool_git_submodules: my fault. The test commits inside a
submodule, so the parent HEAD stays on the upstream branch and v1
guessed srcrev, which only rewrites the parent SRCREV and so
silently dropped the submodule commit. v2 only guesses srcrev when
'git submodule status --recursive' shows every submodule in sync,
keeping such trees in patch mode. The test fails here with v1 and
passes with v2, matching the autobuilder.

2) test_devtool_modify_nested_gitsm fails during 'devtool modify'
source extraction ("No url found for submodule path
'nested/repo-gitsm' in .gitmodules"), before the update-mode guesser
(the only thing this series touches) can run.

3) test_devtool_finish_update_patch: sysdig-selftest has no gitsm://
URIs, so the change is inert for it.

Both 2) and 3) pass here on master with only this series applied.
Build 4355 tested mathieu/master-next, and the nested-git destsuffix
rework in that queue touches exactly the machinery both failures
point at, so I suspect an interaction with that series. Happy to be
corrected if they still fail without other devtool changes in the
queue.

v2 also adopts Richard's startswith-tuple suggestion.

Thanks,
Baban

