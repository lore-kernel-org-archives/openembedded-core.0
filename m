Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1211C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 20:29:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.774.1657571381725093957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 13:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eWWg9Zuo;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 bi22-20020a05600c3d9600b003a04de22ab6so3688301wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 13:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lVedNu54t5FTAsfq+rlngQkoKjhgIk7VtWVVxAzCXXQ=;
        b=eWWg9ZuoFw7Cl1jBrM1Ytz/3sVNPxrti5vQgjhky3aMfaIbvEhj/efPubduUHeRSBk
         ddYMfYqGJdY/Khos7IuDMj1s3GrnR/IqCl27QCoPDYmR85NJ8OtZ/D7V8kssUhwVQuxr
         znz5hk9Nwm77fCMrj2ThuHeFrWtxkiVQURNBJqp9vMyx3dSZiUXsvQe1YWTATMhIxCIn
         I7H8RCXpCCSzXl0lumQC9QeK+GUYaKceXrCZIBtoUqnn4VXvvqnxcLkZ6X/RrX5wFwN4
         VbiVmIofdZwV6CMdp5yaDnIXBDKGU0JgsaqTgW0felIqmmzxil/n9IGY1TmTczOywsqy
         M0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lVedNu54t5FTAsfq+rlngQkoKjhgIk7VtWVVxAzCXXQ=;
        b=o0e9chL2+WcZVbaS9CYFOOEc/p9vIpYg5egTVQPH+3xt1Yw9Bm4zPTjPGbjzo3XD/p
         vIqNZ4HqhfAjzoFR7ttzoiOKn7jtB9wVU7ryURvVdLALIOSifyadqWSa6ff88g/qlnOa
         cMyc5Rq/YiT6/aQmJNXpLQVsT32wHvzTYGIoHpEnvPuBn6pLAvdOZuxGQNcX9o6+CknY
         1bnOQvoldu+pO53IJ1ZrutwOo4Hmt5ZhYZFOXSef7fCeOK3mkpOcq0H7ZiJC3jVAjbzf
         hTqaTNLXmTcIw3WN5MwDP4ys2mFHTmx6dgaAylNvLgpbpSd5awYZ5/HQt5KZpE9eZRP/
         5zEw==
X-Gm-Message-State: AJIora/iBKzYaSdD/GUosPQxfyLpUQEC2AQ5friTTG85TPNiOSSOpbF5
	8jsRxIlGS7B7SLikiqtlhpzDin/tnkU=
X-Google-Smtp-Source: 
 AGRyM1vY76Tazv9EBm/0KXYS0nAwH9nAdMrQTpyXtWHBvwtdQWDvh+PWYCE8PYl6vU8xbMlTQfw9CA==
X-Received: by 2002:a05:600c:3ac6:b0:3a2:ce07:d011 with SMTP id
 d6-20020a05600c3ac600b003a2ce07d011mr127410wms.99.1657571379644;
        Mon, 11 Jul 2022 13:29:39 -0700 (PDT)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b0039ee51fda45sm7970775wmq.2.2022.07.11.13.29.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 13:29:39 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: add usrmerge to REQUIRED_DISTRO_FEATURES
Date: Mon, 11 Jul 2022 21:29:29 +0100
Message-Id: <20220711202929.3839971-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 20:29:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167883

From: Luca Boccassi <luca.boccassi@microsoft.com>

Support for unmerged-usr is deprecated upstream, taints the system and will be
removed in the near future.
Enforce building merged-usr images when using systemd.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
We intend to deprecate unmerged-usr at some point, and we are doing the
rounds ensuring distros are moving along so that there are no surprises
when the time comes.

See:
https://lists.freedesktop.org/archives/systemd-devel/2022-April/047673.html

 meta/recipes-core/systemd/systemd.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index b8dbe2263a..f9e109bba4 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -21,3 +21,8 @@ SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${S
 "
 
 S = "${WORKDIR}/git"
+
+# unmerged-usr support is deprecated upstream, taints the system and will be
+# removed in the near future. Fail the build if it is not enabled.
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "usrmerge"
-- 
2.34.1


