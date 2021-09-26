Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC02C433FE
	for <webhook@archiver.kernel.org>; Sun, 26 Sep 2021 15:49:46 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.20031.1632671385503102207
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Sep 2021 08:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QDuiwca9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id u18so44375519wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Sep 2021 08:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=n0eUB9xgOSCui46lgZpRImEFUTSdVwoZRJbA96sHEfw=;
        b=QDuiwca9mTRCpzR9+esCn2/EOPPNvLef2969KheJcXB8h11xY1IiRlHpeMbB8Opnof
         Aa1weg9L++DWTIOBLuVlynVCyqsE8CyL5c2LlZPqfYgAtxVlAMnwXO6Qmz/vzH4HjUOc
         ajqcWHpSxb/IG1p3JXdbdJotaZT28JRT3m1sI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=n0eUB9xgOSCui46lgZpRImEFUTSdVwoZRJbA96sHEfw=;
        b=Fw9kgIDbS+nB02bMjSYwkXK2Dzi6xvnHgkdVYpooHPWWP2alSridrgI+Lf5r1TBgCm
         0hhISUYILwahQtE/12Kb5ZMx7+OzSNCJZ0BWax6UJDI/ALrq5bNeZEeWgwgP1ukbQT/T
         WKVgW3xdNIqBy4A+ETlzIy+zE3p7USCcNc0AEv4Zv6HYTrmfpNh4KRIlzJvM6638MBBA
         sBhGxiSJItUEbw/TH03TZw7iBIjmCWRvxEIqJnoXN9Xo+4q+cZbDYszZlFkpGzgI1/ut
         5X2L/SBj8sWTqWIJVb9Mk1TFZlnzRN6HWqjw52TVXuz7BsBXg7kGN2D//UfmYr3jjsgt
         EQfw==
X-Gm-Message-State: AOAM533jbqOrpV8cAkkbbj9VPAmteE+4izi3HucmNbKi1kCyjkZEkdEh
	D92b0PSbRX5wugAJ284oeCydoCPxGNxY6Kb6
X-Google-Smtp-Source: 
 ABdhPJx8bPI6y/V/rIlE7kZZI/ab9nROAC28Sa6vHINGczgLlc1fe8u+JGUcYSIHGHIurh7zhDzsJQ==
X-Received: by 2002:a05:600c:3594:: with SMTP id
 p20mr11881151wmq.180.1632671383707;
        Sun, 26 Sep 2021 08:49:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ea95:6e9a:b58c:3d3e?
 ([2001:8b0:aba:5f3c:ea95:6e9a:b58c:3d3e])
        by smtp.gmail.com with ESMTPSA id
 s10sm14299767wrg.42.2021.09.26.08.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 08:49:43 -0700 (PDT)
Message-ID: 
 <ecbea7499b1104960336061703bd14d75dab7ca3.camel@linuxfoundation.org>
Subject: /tmp cleanup issues for oeqa and builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, "Mittal,
	Anuj" <anuj.mittal@intel.com>, Steve Sakoman <steve@sakoman.com>
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Sun, 26 Sep 2021 16:49:42 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Sep 2021 15:49:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156367

The autobuilder workers were not rebooted this week and we started to hit issues
with lack of inodes in /tmp on some of them.

Looking at the mess in /tmp, some of our builds and tests are creating temp
directories there and not cleaning up after themselves.

I've two fixes queued, one for the go SDK tests (which leave readonly files) and
another for anything using buildproject SDK/target testing. Another issue is
glew leaving a temp directory behind. I've opened a bug for that one.

The next major issue I saw seemed to be a failed devtool test of some kind,
probably one of the kernel ones given the size of it.

I'd ask that Steve and Anuj look to backport these kinds of fixes as we find
them so we can try and keep the /tmp directory a little cleaner.

If there are other tests causing problems we'll file bugs or add patches as we
identify the issues. Any help in tracking further cases down appreciated.

Cheers,

Richard



