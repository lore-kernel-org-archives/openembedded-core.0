Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D2DC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 21:44:28 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.3946.1634939066513152376
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Oct 2021 14:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WMOfK79F;
 spf=pass (domain: gmail.com, ip: 209.85.210.44,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id
 l10-20020a056830154a00b00552b74d629aso6006825otp.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Oct 2021 14:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gEFM4cKpwMjeqCQDyI0eIa4I762dpC+pJOj4YP/83D4=;
        b=WMOfK79FvmcypWwM9/ny3b46Wwpr2qR+8g3CKWpljJFyRGvGkNvBJlCTxupD+7oFlQ
         lhZKvfviJoRz7kgI5eBg+16K5BJ3kbea7d1HANz7e6hhMf9tQ0OiS2BhxbbThgCYEgJE
         2GiJzKzi/5JWQCdIdjhnck7F1ePs+s7FlYkBO6WXANyhtRpxzJ2DPXnS5qWSB+tFnUEL
         5fpCy/XMhoejSHRUdQC/+R1Qkzz2Irq0vl3VcWO8w5AVU+4cj3+aYXV8fj1UUoWHRlVh
         qnqnQRg4Iowb/plyLeAXVcGor7qdWAu4HSBn7sptt6bq4GFsppdk8VCqq+RtV1rt044U
         Op2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gEFM4cKpwMjeqCQDyI0eIa4I762dpC+pJOj4YP/83D4=;
        b=qYDJfoFYG7tbwlT6USFurVlh1GmqqK3Rj4Q0RzKj8bTNrGotuknXhU5zQuPHuVXnSq
         sL69lBJ0ZsNh3VD0Z2ab4BkjiYMz5dLD9XQMY8LXQlIOpwYH/zBwDCdaKzGgSBRavmof
         R1q5hX9qgYzRFgTkOP/ujzV9VYp+/tTzAk078q1znPmrOdYvpvGpJcDwAtgQHIfH1r0Z
         M7i1NhL3KK8vDGDe/G35NosRu+p/Bsd51i5iYDZuQyyBGvw4n2Beqqb93+cZEF1DeED+
         0t5++X+UQElbJXf4qkagf/hdLNauJBQmEhxTFkYJOaE7LMLT5xZGPOnOciauWfBPztNg
         ZOhw==
X-Gm-Message-State: AOAM531iOE+sbD9hCtMdnG+zP6DMtmFUi1oxWQWlVPDbgZzTKJFZgRhi
	JYLBvTy7xATz21Mj/zI6PynyoyhKVG0=
X-Google-Smtp-Source: 
 ABdhPJx2DAe3Eau0ilkLuKsN/Xa7ImWgCN+hLrYiemWNGXDYLf5jmIUqEbi5F7q7KNyLBqXviOCZxw==
X-Received: by 2002:a05:6830:1046:: with SMTP id
 b6mr1899570otp.31.1634939065571;
        Fri, 22 Oct 2021 14:44:25 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 d8sm1707469otc.51.2021.10.22.14.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 14:44:25 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/populate_sdk_base: Add setscene tasks
Date: Fri, 22 Oct 2021 16:44:22 -0500
Message-Id: <20211022214422.2176030-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Oct 2021 21:44:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157298

do_populate_sdk was added to SSTATETASKS, but had no _setscene task
created to allow it to actually run from sstate. Add it so that SDKs can
be restored from sstate.

Note that like do_image_complete, do_populate_sdk is marked with
SSTATE_SKIP_CREATION by default so sstate is not used for them; adding
this task will allow it to work if the user overrides this default
though.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/populate_sdk_base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 49e166e697..fafdd96749 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -179,6 +179,10 @@ do_populate_sdk[cleandirs] = "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-inputdirs] = "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-outputdirs] = "${SDK_DEPLOY}"
 do_populate_sdk[stamp-extra-info] = "${MACHINE_ARCH}${SDKMACHINE}"
+python do_populate_sdk_setscene () {
+    sstate_setscene(d)
+}
+addtask do_populate_sdk_setscene
 
 PSEUDO_IGNORE_PATHS .= ",${SDKDEPLOYDIR},${WORKDIR}/oe-sdk-repo,${WORKDIR}/sstate-build-populate_sdk"
 
-- 
2.33.0


