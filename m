Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137F5C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 23:58:44 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.26257.1676591920309433688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 15:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AZBd999d;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so3883577pjp.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 15:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JiWv9qSZ3Rhworxg34Xphb3RL2zZa9ORdTl5bnSnQtI=;
        b=AZBd999dy7pOjBkRoxj+KjrDigwmbF64X+RzPpIou8OeAz/HdpcSTBXEUkhP22LBub
         2e5Oq0ncq+EU+Cv+UgJEznOIhd9nDH+biMver0neZIaLvYt7ZgRiBwyh7EfVTO7GWtta
         nkzFKldbQ6YFrtSMCwRZyc1k7Evq0+XhAwL/H+Zvf6azhIf4aH5VRiunyE2kUxYcblJG
         4YsjSdcvNhviCwQEn3dTgyLcDF29G0yAEz64zt/Lz405Q3GZOju+yOmqL1Vv3AiCQTRg
         3sS6HejYFBrmbxHlwJ7QkoSCyQlagG44mfNKGW3NixE1sZyVuxnICQuKdHOIDJHYmjE1
         qRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JiWv9qSZ3Rhworxg34Xphb3RL2zZa9ORdTl5bnSnQtI=;
        b=wLFnsnxApp2GXcmaWII6t40W+jpNmW5QClKJXbjmJ/Ut9EBXhYylkRPPZ4a+e2hZQx
         kKJBDV5j97feEK7XChOGU5pY2JgF3c+a7IBylMilcpofVknAx5Ghata3KRFYt/Yxkyn9
         aB9E4cxAIUCpk5eIvDRqisRKAJoQXd6cSOrMFsGutbnCo8AjmAgLUx7QYKL+ko8ip8KF
         MNvBGdQb8/mIQSt3eyRIvw2YNNQUUhFp6/kXIvEgSJMAMge7k176xfUCAUc0+PEygCQv
         0vA/Sdo7gs7npIBkBPSkZAQx+5W1P8HXZQbLlCwxiT82iB34KO79Q8/rbTqSWolf7LpD
         bLFA==
X-Gm-Message-State: AO0yUKUF026O7+H66KAfJNTJisBfmNUehznhziBQldNGdqMkhgsT+9o+
	Ni5LscKon4go6p10eWuDojyObL+JvtnUbw==
X-Google-Smtp-Source: AK7set838U5btH6MVJPdoMWpuokXGG3FyJH1OLXgIEKoZmX8kkF6ULNubIM/27rvwmHWJ1BDMo+t2g==
X-Received: by 2002:a17:90a:d181:b0:230:a82c:d6c4 with SMTP id fu1-20020a17090ad18100b00230a82cd6c4mr9046094pjb.15.1676591919156;
        Thu, 16 Feb 2023 15:58:39 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f2f2:691e:e829:c393])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a174600b00230dc295651sm1729300pjm.8.2023.02.16.15.58.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 15:58:38 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] Recipe upgrades from AUH 2023-02-16
Date: Thu, 16 Feb 2023 15:58:29 -0800
Message-Id: <cover.1676580166.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 23:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177300

Recipe upgrades from the AUH run on 2023-02-16

The following changes since commit 44311c454d0b0856f58cfa6fa60669903b2ba3af:

  yocto-bsps: remove 5.19 bbappend (2023-02-15 10:21:35 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/recipe-upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=timo/recipe-upgrades

Tim Orling (3):
  python3-hypothesis: upgrade 6.66.0 -> 6.68.1
  python3-typing-extensions: upgrade 4.4.0 -> 4.5.0
  python3-cryptography{-vectors}: 39.0.0 -> 39.0.1

 ...vectors_39.0.0.bb => python3-cryptography-vectors_39.0.1.bb} | 2 +-
 ...n3-cryptography_39.0.0.bb => python3-cryptography_39.0.1.bb} | 2 +-
 ...ython3-hypothesis_6.66.0.bb => python3-hypothesis_6.68.1.bb} | 2 +-
 ...g-extensions_4.4.0.bb => python3-typing-extensions_4.5.0.bb} | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_39.0.0.bb => python3-cryptography-vectors_39.0.1.bb} (90%)
 rename meta/recipes-devtools/python/{python3-cryptography_39.0.0.bb => python3-cryptography_39.0.1.bb} (95%)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.66.0.bb => python3-hypothesis_6.68.1.bb} (91%)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.4.0.bb => python3-typing-extensions_4.5.0.bb} (91%)

-- 
2.30.2


