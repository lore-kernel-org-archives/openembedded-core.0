Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF48ACDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 08:00:28 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.22684.1697702425753492905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 01:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=orSTpeiB;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so6531377f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 01:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1697702423; x=1698307223; darn=lists.openembedded.org;
        h=content-transfer-encoding:organization:subject:cc:content-language
         :to:from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wO7NsBQAi6WmL0VCHToWJ1mcue59cSanxL3yd/z+wtE=;
        b=orSTpeiBT2PfZNFcxipfH+UbqF7DqInb9J5VAyMzokKo0+MCrYwGdwnX5t1UQB7oPL
         B9PWsKcHIVjG+lcfxy5GoVRsusfw8LJ0aKIC+1xBtHBaR5w+LR0Tk+ZyxF5CUo/jXm3Z
         nszqOB4+H/bXQLLsbubdpl2xeGKnUiPsgWq4yL6qS6/Bk3uEC4vCu9gtYscy7VMstFLs
         KbE53cYrvoFwP+9WVGSHj3yoRR4UrqhY1NHkMTXetgCT39A08X9Tblwz+lEEtPwXb4+Y
         +kBal578ZeaB1yROLgBV7R1YqVABfYRz7QzFUUKH1Ma6opl85TyQoYMZo8AWxtT87YLc
         Odbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697702423; x=1698307223;
        h=content-transfer-encoding:organization:subject:cc:content-language
         :to:from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wO7NsBQAi6WmL0VCHToWJ1mcue59cSanxL3yd/z+wtE=;
        b=FC/MZbPQLSvlWSoSJX70EoS9vlD7EC15bCmrdnlkXfVjm9rQ8q32M3rp6+Xvf01FS3
         ij2Tn3vtV6Ip8baTWRLv85WhTgCRhMa7LZIqiv2xs8RcY2wPeXrcr0ASfD98VxFE4+US
         LDWoD6KslFyxW06b4QD14VBT6uZ45t843zTVTsjC4SR9cbO5PvgTox0XXHNBRwn/87lQ
         JDTD7JVZeB+GTYFCWF+8jpv4OWN7chG1wpw5kU2enhDGJyQqnbKIf1mWfeAunrAEJ1mm
         fnJM28J1xDW72u5jBmpzO5rdTQN6AQqBt7gR4SxrljRYruxbxK4lQ1Ii/Q64utH89gwk
         BNHA==
X-Gm-Message-State: AOJu0YwqWkbz0+gB0c7+te3kNQWI/Cx2WrcQZnUnRusIBHnmqzDqFqnL
	BYv4DUAzITkhHUMuQ9FxfOXYxKsCiCpGF0D0LqQ=
X-Google-Smtp-Source: AGHT+IG+IFtAwM5B/ge1cUwNVNGdrrHutkq+QT/LSsfprb2Xmixh2JIOxparkRNYIJrLJz1bnHD6kg==
X-Received: by 2002:a5d:5646:0:b0:32d:a853:af6e with SMTP id j6-20020a5d5646000000b0032da853af6emr901575wrw.1.1697702423489;
        Thu, 19 Oct 2023 01:00:23 -0700 (PDT)
Received: from [10.1.10.109] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id k6-20020adfe8c6000000b0030647449730sm3865296wrn.74.2023.10.19.01.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 01:00:23 -0700 (PDT)
Message-ID: <c8b8ee57-7e21-0189-ba71-3e4805725bcc@smile.fr>
Date: Thu, 19 Oct 2023 10:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org
Content-Language: en-US
Cc: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Subject: Detecting unimplemented ptests with heuristics
Organization: Smile ECS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 08:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189433

Hi everyone,

We recently implemented a way to detect recipes for upstream code that contain unit tests but does not implement ptests.
Those recipes make good candidates for increasing the ptests coverage.

This is implemented as a QA check. The check is disabled by default since it generates a lot of warning at build.
In order to activate it (in local.conf for exemple) :
WARN_QA += "unimplemented-ptest"

The warnings looks like:
WARNING: time-1.9-r0 do_patch: QA Issue: time: autotools-based tests detected [unimplemented-ptest]
 
I've generated the list for the unimplemented ptests for oe-core and for meta-openembedded:
  329 unimplemented-ptests_oe-core.log: https://gist.github.com/ycongal-smile/dd51b0e450a8f0083e9d5cc10eeeb060#file-unimplemented-ptests_oe-core-log
 1080 unimplemented-ptests_meta-openembedded.log: https://gist.github.com/ycongal-smile/dd51b0e450a8f0083e9d5cc10eeeb060#file-unimplemented-ptests_meta-openembedded-log

Those were generated with :
bitbake --runall patch world

... without the meta-openembedded layers for oe-core.

For meta-openembedded, I have excluded OE-core recipes from world with:
EXCLUDE_FROM_WORLD:layer-core = '1'
EXCLUDE_FROM_WORLD:layer-yoctobsp = '1'
EXCLUDE_FROM_WORLD:layer-yocto = '1'

For the curious, the code is here:
https://git.yoctoproject.org/poky/tree/meta/classes-global/insane.bbclass?id=07546cc63f5e2a1a74bd7f5cac6ad1c9948264d4#n1351

And the doc was sent here: https://lists.yoctoproject.org/g/docs/message/4335

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

