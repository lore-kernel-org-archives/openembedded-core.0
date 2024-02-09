Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC0CC4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 02:19:43 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.2391.1707445181080935796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 18:19:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IaYobjOG;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-296717ccc2aso1189843a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 18:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707445180; x=1708049980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FWb9an7e7mBBzf7KfKvFmcCZK2sa55U61WWo1cYZgds=;
        b=IaYobjOGyU7vHiNufINpqiUNgDw0Df7KbhNqdRuzBbmxpez1b3yjT1hjvqh5HZgmyX
         4uGganttVIz/orC5kQBL4x4xb4k3XFc0zTydloxatSVjg/bldcFyzYHCUB6JBTS33lXd
         zK3eG55EjKlZrgd8rmh7bhMJwIR8QbwV4EVaEs97GofjLy+ECH5ZUeTrHE+qZtTOxoqm
         vO4WPE6I5b8L/ztgbba5FPX756WpHktEDzBoLb4z22zpZ+rbY5gp5iAfHbVSyv6UbQkS
         g+Tjr2auvYyX7lI3KYyfRvySNPp23ey8CDsy+5c8I+rjEPGVq6kYSz4VjDZ/JMGzJ22Q
         vRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707445180; x=1708049980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FWb9an7e7mBBzf7KfKvFmcCZK2sa55U61WWo1cYZgds=;
        b=TafGnT3nEYsRCi2EUrakvMrGRLICIKutC8VKOcJ1tgAJQWwKQ3AEBVHlgw//XGGvqX
         C+QX0nlgk5sWgT9k1DuIKo5YonCgNOuURMhCgk7xUp1RVj4qPJWEx7o7S5MgroO9TAvf
         L+ktTUwyKpqYmeke2QWN3r7+yBPzSV68/a3+OHwbUZT702/n7fJxg40n+WNoXjsDAIDO
         iBUEUsiabN88SxAeb1P3m8sZGBdm0FJzL2S4T8g9KDb/cGGyRJkAeszOXl91wszoBj7G
         KpEUqiwHmV4Rxlq2AiXizGCB6bgF7f9ISJYFoAo283Ai0qt/3vuR6yJuSLfhYMItrzcQ
         UUoQ==
X-Gm-Message-State: AOJu0YycHoB9H8JsCDzX945NeHVXxy/bC7UbHQCt/LAVNcQAkstHoAwI
	QWQJYubQjkJNGTPtsfIJbkVU4IXIURY1GTmdHfMAKFGUOBDHuO+OJdClqOBa
X-Google-Smtp-Source: AGHT+IGSfnSiJ5rLtGT9G86s4SkqnZNsWDfNcZ+SsIphtxVHuL9oni/xZnN4ogZ5rNPGBSd8KWqJ+g==
X-Received: by 2002:a17:90a:fc96:b0:296:2865:cc17 with SMTP id ci22-20020a17090afc9600b002962865cc17mr812060pjb.20.1707445179917;
        Thu, 08 Feb 2024 18:19:39 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:8cbe:e895:b511:86c6])
        by smtp.gmail.com with ESMTPSA id ft10-20020a17090b0f8a00b00296a6175fc5sm498490pjb.36.2024.02.08.18.19.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 18:19:39 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] python3-pyyaml fix libyaml detection and enable ptest
Date: Thu,  8 Feb 2024 18:18:54 -0800
Message-Id: <cover.1707444824.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 02:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195184

As pointed out by jdiez in #yocto IRC, python3-pyyaml will "helpfully" detect
libyaml in the build environment and compile with Python bindings for the C
library. This is non-deterministic and can result in host contamination (pulling
in the host's libyaml). Add a PACKAGECONFIG to make compiling with the faster
libyaml bindings as the default. Add very basic ptest to ensure the runtime is
viable.

The following changes since commit 71ac318a830b37f55cbd63794c55c6adc1904f1f:

  yocto-bsp: update reference boards to v6.6.15 (2024-02-08 23:15:18 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/python3-pyyaml-libyaml-ptest
  https://git.yoctoproject.org/poky-contrib/log/?h=timo/python3-pyyaml-libyaml-ptest

Tim Orling (2):
  python3-pyyaml: add PACKAGECONFIG for libyaml
  python3-pyyaml: enable ptest

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-pyyaml/run-ptest           |  3 +++
 .../python/python3-pyyaml_6.0.1.bb            | 20 +++++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyyaml/run-ptest

-- 
2.34.1


