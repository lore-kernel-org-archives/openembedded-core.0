Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D99C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 17:36:28 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.12366.1653413786174291906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 10:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kVladJFG;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id n23so24068905edy.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 10:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=50PrlRtt9QKYE/PduzBtjSgHMlVTa/kjtybJcvv3xZQ=;
        b=kVladJFGwleqO0l7kbbBm3/ABDApTtALPoquTWw03H9SytTca0u1hS6f5/uqswROUz
         csOp5tslSPzu+1mtyo/j0t9zXR03efPqaizZ/F0DxL0nHdqD+CZFKpIZW/250FcBYTQB
         vcnH3yYukx/PVNiprHVYiXpowtMvObl2cVZrgYLBl7LBWonaR7otaS343/Gn5PgnB/d8
         +RsdN3WZbYarn+lViJY7WxESkA7wu1kdBsXv5D1NaJ1rs8cfPDa9ELWuad/53oIYVnv8
         smDvJEFgsDu0cuFRzGkrWNuFd5A6Dvu157KXjEOf17/hc+OHUaeodY7vqMUT9hNI1LSD
         t19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=50PrlRtt9QKYE/PduzBtjSgHMlVTa/kjtybJcvv3xZQ=;
        b=2AuHTyNebs93B3f2UtmuOxlYkE0LH/PrBze90WKlqvD2Fb3qhfEeI2q2WwLuQWqo7K
         ERCd7Kmrcz+vJnibR22rCq5Ci6uN/BPcz4JPz+Kb5bGKhqHifG26YS56G3z6LTqdxU4U
         KIPTCHHHa2z/yqLasmQTxIzJAiZ5NuXzjLjlOe9jzJwcDt8tupxH5CInlN349c1uQpWH
         GfHLP1vOYuUIpeY8TKfGiBRqeGPdXDaaAkE688VqGhCIpN6GK0wfbIdYI2odFJIU94Na
         ei5TTRom0AHGP2SnkHxksUbiRMOUxgCU1zXE+Rbj9D8GPVOlzP5vpqiKH+vtj3wxwTyC
         gsoA==
X-Gm-Message-State: AOAM530J9rGga9rZivrlKVu85JdfUMNhICOkP7eFVkg2itzIvRZRI9O5
	eJ11LmHTJHsHxxkvEImvv7+ovEEBs3Q=
X-Google-Smtp-Source: 
 ABdhPJzc3P89UDPWhRhPq6vfQT8K5h0BZpIopN5AuIpdPp+bluNc2eOZTD5RjKCxoDXj5v1sxtCdfQ==
X-Received: by 2002:a05:6402:35cd:b0:42b:7545:9726 with SMTP id
 z13-20020a05640235cd00b0042b75459726mr8764018edc.77.1653413784647;
        Tue, 24 May 2022 10:36:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j11-20020a17090686cb00b006feb047502bsm4830402ejy.151.2022.05.24.10.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 10:36:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] apt: fix upstream version check
Date: Tue, 24 May 2022 19:36:22 +0200
Message-Id: <20220524173622.4033177-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 17:36:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166085

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/apt/apt_2.4.5.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
index 95c25e3036..1d94dd118c 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -31,8 +31,14 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
-
-inherit cmake perlnative bash-completion upstream-version-is-even useradd
+# apt seems to follow a peculiar version policy, where every *other* even version
+# is considered stable, e.g. 1.0, 1.4, 1.8, 2.2, 2.6, etc. As there is no way
+# to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.
+UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"
+# needs be marked as unknown until 2.6 is out
+UPSTREAM_VERSION_UNKNOWN = "1"
+
+inherit cmake perlnative bash-completion useradd
 
 # User is added to allow apt to drop privs, will runtime warn without
 USERADD_PACKAGES = "${PN}"
-- 
2.30.2


