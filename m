Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7137C4332F
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 21:59:45 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.125284.1672005575707192098
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 13:59:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fQ61XTTX;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id tz12so23086222ejc.9
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 13:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jYLIKmkvQJnIg3Sh9/k6yXV52jav2Ydx0BeCZo2skM=;
        b=fQ61XTTXyfPQ711iPlViS5Ha9hpiqIGe/XOIQicLj1JmcsPska67D0pXVZxRsgksR6
         RcpVVIptcoucDWEz4iDEZHyTVT0AKQb4G2inudwlM/r1rF3Vq4C85+/lp+cWcAivoGnm
         Qka59OFDGNIaIoVTKUvAKCw5xAZSrCrBwbkFSmQw0Bu5bsBdrD7UF1iv4FqlmAnTnyWy
         pGX0o881J6RSZQnHfjgMVgBUe8BE6HZXIeeFi2gepxIS+JHrE1pa1C5xcebrEEb+T6qm
         NYCXjdwSs6zZD22LhFp1WNPV0r0aXSGAJ2z/dMZm1xyaGQYTDsLAIIzYEWV/dhMJNp7G
         7U9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jYLIKmkvQJnIg3Sh9/k6yXV52jav2Ydx0BeCZo2skM=;
        b=O+82olnQaZgLYOvAMsmIp5NYRSlqrocLFEhTKWY4E0fUgp4tvRiC8tQKOZ7RqNj/c/
         Si8T0ZL30ycvFi8d6ZbWc5bFFOph3AMXqNiISbN52XUjvCbPBOHMHG1QN+6Hmz2Le4Eb
         EjAFZLTteceeymzgZ9sDQUvkAPpFmwTjZ41QtvI+TXETYvtAHz57KY45btlYg8HSvfkA
         UU/JCnrVBpwC9ztLpx4Gn720NW71MblfmjC8E63MYj5hQ8CxL5BF8OBRBkO19T37vC/d
         GtQ1VtsT7+3X3LeQxdgAAndlKQ775NrA9TaGhmLH7D31mFxc3gLRVN8Yiy6EylqIBY1H
         53OQ==
X-Gm-Message-State: AFqh2koTqpwEzdbgN1arlBp/uqnQY+FOXozUs1xsUyfwZof+whWu3zzM
	ejI+a+W3yHyu1/yZRh02ihPc75E8HyY=
X-Google-Smtp-Source: AMrXdXt7NWf3wLv2HA1uZgurdNw+abppAZ7aAb0UvUaz/89HSVuW6XOcoKxpDdClp8mEWQN9tN7Ihw==
X-Received: by 2002:a17:907:cb85:b0:7c0:f216:cc14 with SMTP id un5-20020a170907cb8500b007c0f216cc14mr14388798ejc.11.1672005573998;
        Sun, 25 Dec 2022 13:59:33 -0800 (PST)
Received: from localhost.localdomain (42.93.115.87.dyn.plus.net. [87.115.93.42])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007c0f2c4cdffsm4066487ejk.44.2022.12.25.13.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:59:33 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 04/11] packagegroup-core-sdk: Add SDK toolchain language selection support
Date: Sun, 25 Dec 2022 21:59:14 +0000
Message-Id: <20221225215921.12868-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225215921.12868-1-alex.kiernan@gmail.com>
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 21:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174999

Use SDK_TOOLCHAIN_LANGS to allow different language support to be
selected within SDKs. Initially supported options are rust and go.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v3)

Changes in v3:
- Switch to packagegroup-core-sdk driven from TARGET_TOOLCHAIN_LANGS
  (which defaults to SDK_TOOLCHAIN_LANGS)

 .../packagegroups/packagegroup-core-sdk.bb             | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index d70aff22c725..104f3549d593 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -11,6 +11,11 @@ inherit packagegroup
 
 #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
 
+TARGET_TOOLCHAIN_LANGS ??= "${SDK_TOOLCHAIN_LANGS}"
+TARGET_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
+# libstd-rs doesn't build for mips n32 with compiler constraint errors
+TARGET_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
+
 RDEPENDS:packagegroup-core-sdk = "\
     packagegroup-core-buildessential \
     coreutils \
@@ -23,7 +28,10 @@ RDEPENDS:packagegroup-core-sdk = "\
     less \
     ldd \
     file \
-    tcl"
+    tcl \
+    ${@bb.utils.contains('TARGET_TOOLCHAIN_LANGS', 'go', 'packagegroup-go-sdk-target', '', d)} \
+    ${@bb.utils.contains('TARGET_TOOLCHAIN_LANGS', 'rust', 'packagegroup-rust-sdk-target', '', d)} \
+"
 
 SANITIZERS = "libasan-dev libubsan-dev"
 SANITIZERS:arc = ""
-- 
2.39.0


