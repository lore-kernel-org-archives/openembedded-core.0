Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA80C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 16:16:10 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.787.1708100164579033494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 08:16:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RRF5aty0;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so1764410a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 08:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708100164; x=1708704964; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=65OVGIZjE9OpXOCaNqBHRaFHh0SJAvoxcgR1qyyY02s=;
        b=RRF5aty0mR2bS0mtX0WAxqC3tdo6XLn7Hv7IgValSvOx+brI8kr6CG+adi6dHfHsZB
         afEpQf6I8UvP7QMC7s5FRvms8nU14rFR8+jQWxqVOu3Os3aR9UnNheZNK0v2lqJa07RJ
         ACjALyndG1gNapXja9eadImmhr3Z+NjQsjGOZb0whwb6aaLgZKZDIEa0lY6+hWx6MHuQ
         5LriFBrGsffCvvzvAAS6cmDEGX3hj/5v5SayBE/AEpPCvtwHteoS64nQ8lXP5m26NTK6
         ekz3a+uCDRfXB8isXNvTdQde0L+0j4bomf1Hkmdiz7iQgsNvoUG7ISa1nWQIseeATdLA
         4JEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708100164; x=1708704964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65OVGIZjE9OpXOCaNqBHRaFHh0SJAvoxcgR1qyyY02s=;
        b=SUC2QfWOxrCggwi9oV0b9sa7idpRtoCXqryGtOvoWxDyRQsBKEfVyqaRHiF3hBzaXW
         tGsqTdRdERJibdO9b0xphojh9D+8PPOurWVoQDcgYRyclJFYZlLSpZwFPYB334Z2DRXJ
         KmVUh1xDOrsh2LM0QYlkf36qIJKxZn2EQZyAbXoTGtzGnk2hRWnRqCj1WroY7pgM0DK+
         L23jRfTaMCdjpqiMlUtXpmWQsrUPNnbcraiSXh5dTrluB9G84vW8WqHefAxtdI9smUy8
         uvIAgsIN90LFKcOU5keGXRoXEUXvTNBtQTBA3MZTDQlFulyHkv7A8tCBnXOJGJHPQuNQ
         tigQ==
X-Gm-Message-State: AOJu0Yzt2WluxJuHlJTEkdSETZe+LAKDMBnbjCdOiBv82hpIMwbQQ8E/
	yigiM8+7viJAVw/9uUYOz6BAuYAnx1LvDLARIgCyp+USCrR8gBbt04RMGo7F
X-Google-Smtp-Source: AGHT+IEiVd1wzuvADV0uAYzR4ykHeGm4EKHSig2aQWJcHf9SgZ73dh5dfv8+H6spDcJkgiNwruE/Sw==
X-Received: by 2002:a17:90b:10e:b0:299:4ad2:526f with SMTP id p14-20020a17090b010e00b002994ad2526fmr338526pjz.46.1708100163450;
        Fri, 16 Feb 2024 08:16:03 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:ef9e:327e:12eb:73bf])
        by smtp.gmail.com with ESMTPSA id w3-20020a17090a528300b002990d91d31dsm198925pjh.15.2024.02.16.08.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 08:16:03 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 0/2] Fix for python3-pytest 8.0.0 related failure
Date: Fri, 16 Feb 2024 08:15:52 -0800
Message-Id: <20240216161553.3217554-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195777

The python3-pytest upgrade to 8.0.0 caused a failure in python3-attrs.
https://github.com/python-attrs/attrs/issues/1233

Tim Orling (1):
  python3-attrs: skip test failing with pytest-8

Wang Mingyu (1):
  python3-pytest: upgrade 7.4.4 -> 8.0.0

 ...funcs-skip-test_unknown-for-pytest-8.patch | 30 +++++++++++++++++++
 .../python/python3-attrs_23.2.0.bb            |  1 +
 ...ytest_7.4.4.bb => python3-pytest_8.0.0.bb} |  2 +-
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-attrs/0001-test_funcs-skip-test_unknown-for-pytest-8.patch
 rename meta/recipes-devtools/python/{python3-pytest_7.4.4.bb => python3-pytest_8.0.0.bb} (93%)

-- 
2.34.1


