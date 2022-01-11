Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56717C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 18:00:07 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.11558.1641924006836972914
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k3qZFLs2;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id i8so174055qtw.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MlkeOoCCQt714tE+12iqVuc0RrIDH6RKMejpCNIVuJk=;
        b=k3qZFLs2+6YzHzzRCWHWUZb+3A+aOe5pt/g2f+BEWkCVFSd9f+09woUvkObq5HYyxr
         WWrtkWvCHq5iuawWe4lVh3P9Nu4XVvU6QJl9VKRGChE7hO7DZbHXZ0MkUISbZWqN9IIi
         kYi+a09WxFHqQEHg13wxyuxvtcl1EuUZvMNM54hHv8hd6wiUvc9tTad7nyfYNQZLmPQ1
         Jnzmw0SQVJAvRQpoOGejgThUz29e/bY/rkEpIcXDqTyPZu5PA0jdsZ8mknjJhxu7HpVz
         9jXPvM5W+r0+vnb9xXnId5OMEhRJawMWCPajWgNO8RcK+NiGtEXGh1HVNRQmJJlJv7Ak
         oVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MlkeOoCCQt714tE+12iqVuc0RrIDH6RKMejpCNIVuJk=;
        b=yaZhE++yU0HYLrtq+77uKTObIXUz4cDpfXz59GUGoQazo8XwOhaShSQ2VH5tM/15io
         LpglcAjTgQnZVLUk9vu0wShnkUrjeephIkH2HAaeMys4K1hhYzKSZZjmIdR2FKitx2YL
         LGz8i2bUnN160xg19uGu024ClFWa4wIEHks00Sih9vsC+z/uG5uq/ImaflI2CbpQOg+R
         MWgCKfRilm05F2VQm/d1/ybLtFBLplFXk1mLdW3LDh0TaHmvpvjozWhfO55jAJsRKJhJ
         03LXXmdsWRYi9wChJSYDTblkdY61IpFlHWalfMIpxazrRj4gbkgTIpOVXFVe9njld/Xa
         K+BA==
X-Gm-Message-State: AOAM530gSg1v2USahK0rrYEfhOxPH5Vhpm5DFdx1KHrKws8dxn9hryoz
	OeZ80tSwNGyhrpCag7zJp1HWbVG7oyHxHg==
X-Google-Smtp-Source: 
 ABdhPJxCgXvRJWopKOKzfPvJiaG4K0lbB5AAsTNtW7CEJKkREi8/07K0k8zkZdzJ1EXg6hUXMaXfxw==
X-Received: by 2002:ac8:4142:: with SMTP id e2mr4630179qtm.603.1641924005937;
        Tue, 11 Jan 2022 10:00:05 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x7sm7360749qkp.128.2022.01.11.10.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 10:00:05 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] linux-yocto/5.15/cfg: add kcov feature fragment
Date: Tue, 11 Jan 2022 12:59:54 -0500
Message-Id: 
 <77b8c1ba709346ac8d43ce9efba9dca77b8247a5.1641923693.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1641923693.git.bruce.ashfield@gmail.com>
References: <cover.1641923693.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 18:00:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160430

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto:

41721be8a03 cfg/debug: add kcov kernel configs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 3d600acde6..dd897d121f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "11651ef1c948677add527afd54c9f960a33884c8"
-SRCREV_meta ?= "41e5b01b59c69ac58f588bc7dc7d2e2cb80d82e1"
+SRCREV_meta ?= "b1e4fff58196879307a8333086b63a68d7551e0a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 6f5bf33d74..85cdfd820a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "0f7af34df7639ad8c513e6698d5f1a6081b55f77"
 SRCREV_machine ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
-SRCREV_meta ?= "41e5b01b59c69ac58f588bc7dc7d2e2cb80d82e1"
+SRCREV_meta ?= "b1e4fff58196879307a8333086b63a68d7551e0a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index b06184a2ee..d6c57ab0bc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
 SRCREV_machine:qemux86-64 ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
 SRCREV_machine:qemumips64 ?= "723cf54aff5756af97663c4a8a7bf0754d0d940e"
 SRCREV_machine ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
-SRCREV_meta ?= "41e5b01b59c69ac58f588bc7dc7d2e2cb80d82e1"
+SRCREV_meta ?= "b1e4fff58196879307a8333086b63a68d7551e0a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


