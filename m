Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C251CCA481
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 13:27:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.31971.1654522020574478787
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 06:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=jv+aoxSD;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id q7so19871546wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 06:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zOAdcHcBcZcTFWVKc5XkwPoL+ufptJL4Mp0A1Niefu4=;
        b=jv+aoxSDR+tCi780mTKHPkuL6G5Aoss70wo255BWaGSzvX3pK7MbjunJW6d7Tof1yq
         ayPcA+9Q7+kB+zqcc+Vp8Lt8ZQ2YglaTFoRkpUiaXLuL22pP8iJ5U9xI8paJbLqSXcdX
         vYrzibCjuifuIzKG6UVcGtL6wEaHBqDouEUYnx2DknYTqeOpBwAItwY6d/2dEp7oaOmX
         wYmXJEi3DABG+omiimKK+NsW5IBfo7W1LLMUTgzJ8tNozTjd16H8zO5GAExp5AvJSAEb
         jqJuCIgv8vqpjjs7dRWOef2uM5vVrCYxuN2hBRa43YOOl9P2PnUKSzKoLDMGPcRdlNKL
         uVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zOAdcHcBcZcTFWVKc5XkwPoL+ufptJL4Mp0A1Niefu4=;
        b=U1aASdGZQ6h+35t5PoDxYVGOpZz7BrOWvRqqsw24addPsIzN8jhxHHR1Bxk9NVZF8O
         cUpgWtISOilYmgCyy3jGgAppUye8Nl4CdQRs17ONwmg4eg8Zb1GdOYDmM08Oe19kuMJD
         4pHm/CWTvYfrpAEtPrYITstZ5gXrOrVkazpQ1DanUVdC0B2dT1PEEWkAwhX8dM92XsmR
         hegHXZgoz1Hhqv3B/ZoNyFFO8uT/F16qKmtCHUQxRvEzyIUL/7lwYz7AaJdvbior3pxx
         +52GyGq4xd+vkJsSl/Yrew4hW5JUmRlUdnwGGZFChuxn02Y3Z7kD8AemIkXmWfeOpgDr
         0nww==
X-Gm-Message-State: AOAM531uqD49tnE3svy62FLmBfDcGU5+UJ67FA4ZZXarxWCDT3cw/CUN
	cPhtN+ivXRB+oQq2XSl+UI3Hew==
X-Google-Smtp-Source: 
 ABdhPJxNCINJXJsKf+lvXByL955JQ7qLGSG3U/xHnFr0tQXIrf3zHStYShpJQ0sHZuAWFAuh9Oc/KQ==
X-Received: by 2002:adf:e181:0:b0:213:bbe1:ba66 with SMTP id
 az1-20020adfe181000000b00213bbe1ba66mr15068370wrb.325.1654522018552;
        Mon, 06 Jun 2022 06:26:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:46fe:49d5:2ab9:ca49])
        by smtp.gmail.com with ESMTPSA id
 k1-20020a1ca101000000b0039c4ff5e0a7sm2840911wme.38.2022.06.06.06.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 06:26:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [OE-core][PATCH 0/4] cargo: improve the build process and add a new
 recipe
Date: Mon,  6 Jun 2022 15:26:49 +0200
Message-Id: <20220606132653.60232-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 13:27:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166627

This series contains some improvements to the cargo build and adds a new
recipe for gstreamer plugins written in rust.

Bartosz Golaszewski (4):
  cargo: don't update git submodules in --offline mode
  cargo: run in --offline mode
  cargo: pass PACKAGECONFIG_CONFARGS to cargo build
  gstreamer1.0-plugins-rs: new package

 meta/classes/cargo.bbclass                    |   4 +-
 meta/recipes-devtools/cargo/cargo.inc         |   2 +-
 ...-t-update-submodules-in-offline-mode.patch |  32 ++
 .../gstreamer1.0-plugins-rs_0.8.4.bb          | 465 ++++++++++++++++++
 4 files changed, 500 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/cargo/cargo/0001-git-don-t-update-submodules-in-offline-mode.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.8.4.bb

-- 
2.34.1


