Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC9FC7EE33
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 18:11:00 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.30585.1677694255173015535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 10:10:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cmCEv4c+;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id x34so14258547pjj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 10:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5I2CuFbRKeqbjpKwZmYmoeTiN3AxHEPMwG4vggXegA=;
        b=cmCEv4c+exlpU9drV5mFLcBp7TLkVMmeHiCPii0FWjiKcfUkTWZQm4xY6WHz+SDvhF
         LMixJ6WNr9Bx+8vDGhgZ5io/ZjzZMm/QDdwqoRypOp3Z9sGWMBDLa/OKElV0VfF7sLh/
         69K+dDPHpGY4vOlqFMeKGo2N5SvsBSpQAt5Xr9hehLCL/2d3BvsLhoqBlvIT+wClXsPd
         xE7NWzy46k+rCLrBbR6UxiE7EnCLN1i+L/ERBUyKslD5cHoqgelxgpUUmUnvBdJmDDG/
         bBxuXpLDJsXAYj1HNMYcuzKCGiaVvBCrrWfrchJ2+R4pKRf4PheIRRAl9sZVWXCBpBHF
         +LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5I2CuFbRKeqbjpKwZmYmoeTiN3AxHEPMwG4vggXegA=;
        b=BuraPSbqdF6lNBm6hARf2pc04q+1A2mEUxCm4aDaRBBBjsRwy6R5RLh22cU9FRlKcy
         tR3g12gq+sSJ0w7KIUjPsu1LN3Xb7iG+iTx1hiXtFnmgYXjEiCTELhtv4GpotjPbskST
         +UelR9uLEBo+5OrWjBaxQkQDWCknfAcBkub1rbZLFZUh2TT5nc1RNTDFDZWzSjfCS9ND
         8yzF7AGnMIcR2Eg0xZLjIdmSTCaa/Ivdp3wvF5GkOkOCgzfqHI5Xvf7a1eqcy9895cBn
         dCaocZF3iSVCIyoqTlFCqYcHzmXnLcTvr8EOhCEsbfZp+V3tRoATRq83kzarZEVdBo0J
         tkQA==
X-Gm-Message-State: AO0yUKU+spunYxnn0zPLSTWQ2LmqMDi+fwLGCoFleYDzcW9JqeJV5IN0
	n7WBIr4briNbYcd/l7IT2XthhxRjnYMwXA==
X-Google-Smtp-Source: AK7set/LQfx4YtDlOEPa4Pb88277ow+Q1ok5zHp+YvRjDIn5JvZ7eAFokQ0YJL51vu4BD/pDbcOmiQ==
X-Received: by 2002:a17:902:e88d:b0:19c:e046:d906 with SMTP id w13-20020a170902e88d00b0019ce046d906mr7657819plg.24.1677694253856;
        Wed, 01 Mar 2023 10:10:53 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:8ecb:2eaa:9ab3:bdee])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902780500b0019928ce257dsm8715614pll.99.2023.03.01.10.10.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 10:10:53 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] Recipe upgrades for AUH 01 Mar 2023 Run
Date: Wed,  1 Mar 2023 10:10:38 -0800
Message-Id: <cover.1677693991.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 18:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177946

All ptests for python3-more-itertools and python3-hypothesis pass on
qemux86-64

The following changes since commit 33d9b3a8ed186c2d212acb83f715367912010e7f:

  systemd-systemctl: Create machine-id with "uninitialized" text in it (2023-02-28 07:53:54 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/recipe-upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=timo/recipe-upgrades

Tim Orling (4):
  python3-more-itertools: upgrade 9.0.0 -> 9.1.0
  python3-hypothesis: upgrade 6.68.1 -> 6.68.2
  python3-babel: upgrade 2.11.0 -> 2.12.1
  python3-zipp: upgrade 3.14.0 -> 3.15.0

 .../{python3-babel_2.11.0.bb => python3-babel_2.12.1.bb}      | 4 ++--
 ...hon3-hypothesis_6.68.1.bb => python3-hypothesis_6.68.2.bb} | 2 +-
 ...ore-itertools_9.0.0.bb => python3-more-itertools_9.1.0.bb} | 2 +-
 .../python/{python3-zipp_3.14.0.bb => python3-zipp_3.15.0.bb} | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-babel_2.11.0.bb => python3-babel_2.12.1.bb} (76%)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.68.1.bb => python3-hypothesis_6.68.2.bb} (91%)
 rename meta/recipes-devtools/python/{python3-more-itertools_9.0.0.bb => python3-more-itertools_9.1.0.bb} (86%)
 rename meta/recipes-devtools/python/{python3-zipp_3.14.0.bb => python3-zipp_3.15.0.bb} (85%)

-- 
2.30.2


