Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B4CC433F5
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 09:22:44 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.34055.1638004963302299667
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RoPrhUYX;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id r130so11255116pfc.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ZcsyOLhVg+TIj2OARYQ54SgyYBCwQ5slMrXL3YiPjw=;
        b=RoPrhUYX7NYt+EqJvJYO3hVi5cdO99os+fFIU4iWbAmMjrmxC8veBhkQJXk+epSYai
         S5yBm3SYRXeCl0ZiWAFzxfzYv1aoz8Mtdeu26zkaqa2BB6inmKIss2tFb8zjYvlpTOY3
         mUGXDuattnMRe7rVsgSRPj1B62418TBLdZN+wQG1Te067TZZYIwUiAuKEuCjxF8uhHP4
         r0N8uFx655FHEBhoWySQoadD5AqgRNdTNugdLInyesg60Aa8CxNcm55TcnxnJnBEspza
         PDIIDuPumN0KcJNbkrnzCurXd0ipNEbqq8DRc0qrvkeX6Nt8sMz7jlHKVL/bPPNa6zS7
         ax6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ZcsyOLhVg+TIj2OARYQ54SgyYBCwQ5slMrXL3YiPjw=;
        b=WcYYW0Sto7v4igRBoQGh/2z0RA4RqSQakxA8PiIcPIZ1jBBfROFk+drk95qeX5iPTS
         iRCsrltx5K7sDuAFA5giLPD+cy7S7gO7BTzQlqNZgDKcMKxBMgMVz2mRf6GfX+uqNytP
         ulWnuIk6oSRTaS9pfsYl+7kBhlmThihsiQVdyyl4IppEqYxZhSkFjPypDjEaFNJdhKya
         l17kPCc4CAfZJpXXkXSZzvRMsBUI9v3lmbE7qFvRgjwfhfU0FTi2G4a3PM1jzSg5nBBI
         Ebw2LKT2JM+Iwu/b5sI6Gha9826MLN45oFrx2xtrHqzoXGrwd0hauO4mMgFBxwAH32jZ
         NMkg==
X-Gm-Message-State: AOAM530OP0wOUasR2BapCBuLgmii0aXi1yJBkOPHOy/4wbLgqpcYnRi5
	H1PSqUA4+1wTEYm9E+S2bmNjfCtjlplA2w==
X-Google-Smtp-Source: 
 ABdhPJxWR0SMrVLB6nDrlVOvmXTmnaTdpnv5VWCjBJOCDV6e7jkzaed+pOzHCdRP+VH6ZCHCag015w==
X-Received: by 2002:aa7:8886:0:b0:49f:fae6:c5f5 with SMTP id
 z6-20020aa78886000000b0049ffae6c5f5mr26372072pfe.8.1638004962492;
        Sat, 27 Nov 2021 01:22:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 n11sm6805265pgp.15.2021.11.27.01.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:22:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] weston-init: Pass --continue-without-input when launching
 weston
Date: Sat, 27 Nov 2021 01:22:39 -0800
Message-Id: <20211127092239.4144840-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 09:22:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158849

This ensures that we do not need keyboard/mouse or other input system
Weston's default behavior is to not open if input devices are not
found, but we may not always have input devices connected for systems
running weston in field

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init/init           | 2 +-
 meta/recipes-graphics/wayland/weston-init/weston.service | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index a849f29bcbd..f74ac8b1846 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -32,7 +32,7 @@ case "$1" in
         . /etc/profile
 	export HOME=ROOTHOME
 
-        weston-start -- $OPTARGS
+        weston-start -- --continue-without-input $OPTARGS
   ;;
 
   stop)
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
index e09625b31c6..c7583e92e6e 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -34,7 +34,7 @@ ConditionPathExists=/dev/tty0
 # Requires systemd-notify.so Weston plugin.
 Type=notify
 EnvironmentFile=/etc/default/weston
-ExecStart=/usr/bin/weston --modules=systemd-notify.so
+ExecStart=/usr/bin/weston --continue-without-input --modules=systemd-notify.so
 
 # Optional watchdog setup
 TimeoutStartSec=60
-- 
2.34.1


