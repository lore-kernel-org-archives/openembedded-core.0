Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5E8C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 09:21:27 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.28194.1647854486969248197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 02:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q/j79LPe;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id h1so17021529edj.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K4FoqodWEz0oK2IRKEg0WNHx+dXZq0okA/9gULFWOPg=;
        b=Q/j79LPeLsLCpDWdO6Zdn4Cahfo+VC8j917/pnI+SX5ahIDd/aZN1RWaZdDDVfjaXt
         W8P6faHpsc8ebfMbhJpw/+Qfve1XqkqPtVvD2rV69uRVBiuexZXC/5v2u4bzdfPN9xFc
         E4omWdei1X4zZWp+/XbiHXxWjzLlwKbqCf+RUd87Z1yu8okWr1tE5qXkFoLcwVT6G+Id
         1/88SPdZeC2yl8MkRT0YcHtt4hZsh3ePjgvU9XfbljEU6fgLOBwTye1RPaZspzC45kX6
         B1RwiVOob86zb1hHbGPsnaXugNWF0AD2Cb1+TJjR4uhJQXWgXPUhCjBaYnK9UAs2mSl2
         7Pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K4FoqodWEz0oK2IRKEg0WNHx+dXZq0okA/9gULFWOPg=;
        b=ISIK1/99Gj3XdsCEiuR0nEiyGYnrjgS4Wuug3LXYUrbHOldOJlSOAbaj8BQBqs+RBu
         K/TGanPqQmWT2dX49LpCE3DLfQSf3gc0EXrEXWfkqB/4xGVubCYtNVzIkpPMklCvMzdo
         qgx4TMaqFItXiktFvq21pkpDj8t2g0Kle1n3It3amtPPT+INrl286MrOAey4h6BmOIfE
         VPsWszg3rKXdcs+fdc7ndYvL69H0f2gFgP7TDh3yGubSPl55wnx0mGgYPHVIP/xAqVoN
         z0nB4nF3YAdJq3dZsFuUiNlVv3+Oa5oMpe+hzwTAvMKgg0D9ml4ZTrQzNduVFGYMCLEW
         GLrQ==
X-Gm-Message-State: AOAM532PzVm/liKTG07fdmBzjQyxLRfkcwMxvYsW1w7hjO2LwYlz3A+H
	sYbfkVT+2Mbo7mt8cG/DNlMmJXh6Rlc=
X-Google-Smtp-Source: 
 ABdhPJwIDVmMfIbm2HxlAl7IJYY1B8126d0C5quRE7tG26+GNwc+dQN85vhX4YYukoUCUtgeTrsXaA==
X-Received: by 2002:a05:6402:528e:b0:407:80ff:6eed with SMTP id
 en14-20020a056402528e00b0040780ff6eedmr21904075edb.165.1647854485353;
        Mon, 21 Mar 2022 02:21:25 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p17-20020aa7d311000000b00419449b00e9sm708361edq.64.2022.03.21.02.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 02:21:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] python3-sphinx-rtd-theme: correct upstream version check
Date: Mon, 21 Mar 2022 10:21:22 +0100
Message-Id: <20220321092122.174159-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 09:21:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163495

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb
index 4a43b595aa..fa375055a1 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb
@@ -11,6 +11,7 @@ DEPENDS = "python3-sphinx"
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
 SRC_URI[sha256sum] = "22c795ba2832a169ca301cd0a083f7a434e09c538c70beb42782c073651b707d"
+UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
 
-- 
2.30.2


