Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC72C41513
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 21:45:13 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.31921.1718055905349864530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 14:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WoqUpVGK;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6f855b2499cso2667921a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 14:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718055903; x=1718660703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMXwZiAp4oQEJqIGSNqFi91mDcHitJfu9iK58O4Rt/0=;
        b=WoqUpVGKtRUep2V/vEUEsAGRwv0kiy3ei4AcM5OwV5gnLeAENG64+bUExfQ++Apn5q
         ZAvaS2eJXazNgPvQW2UIH5XCri+tANXgzt5g00gjDAdV8eC7EQp5NU8y0k6HyGegWf0i
         pf31jKQ0hds4qm+hNwp9hWoeT1LvD5qfkLmdOiJl2JW/OwyV8y2xz2a+0LXxQKxjEOBx
         VRh0KBcQAz41EfEF/UxSo+P8cOGu4bVd/frUZBv5O4a34Og10wGKGuhdPf4IvQnXNFj5
         Z5MPict2ws95A368+LXrCk3IwMpAN/5EZUYJGXs+wUPksYLwlFKOMzVGXPSBkQkCupJy
         IfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718055903; x=1718660703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMXwZiAp4oQEJqIGSNqFi91mDcHitJfu9iK58O4Rt/0=;
        b=i8Gz2+dSJLu5zV7/1rKr5EZsvGBvhAZ5Os1xm/TCt/jUl/1sMvZZPqJ/FUc2q071do
         NWNzfnXDudDvcOkGENKKVcSmDSmISYqOrWbGd4dP7c9DfgIT7VjXqsL/QGzraoMOFqLE
         7awg+gfdrk2IyQJjsBTqPRTx43Nj+v4D3z1ECecVT+vZ+N8O8qElLrkdPAq2o72UABeD
         fUwME/ydl+B3/u/ki/DtEr8nQnuw/nKWiU9EpdJP5VxhbN/14o38r8n2iCWYDnCwn5eQ
         dt0VxGgpwpvhMxqRUJNMzP1JmiT1vd2qL1VhUy5g6mnhthgTd4CWIi9sRy/uqhk9V3Xq
         jtdQ==
X-Gm-Message-State: AOJu0YzGNNrvoIjba+82kgYUjtkNptye/gf9jP1ZSIQzbB3vFm8zhiGT
	tQs6qmf9HQvBu/mCzgpumzg/VnH6UW/YLGeJN3uX3laHZqmdNiwZZ4HNqA==
X-Google-Smtp-Source: AGHT+IGSkNC5B8gHrU3auMU0YnxkbZgz2LM7QzAHgSEvd1jC6ooHe+zNZctGWXKNtQP7LV06ViizmQ==
X-Received: by 2002:a9d:7d91:0:b0:6f9:7226:1a78 with SMTP id 46e09a7af769-6f972262067mr7173959a34.28.1718055903408;
        Mon, 10 Jun 2024 14:45:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::2cec])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f94dc70d48sm1888631a34.5.2024.06.10.14.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 14:45:02 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 3/6] classes/spdx-common: Add SPDX version to path
Date: Mon, 10 Jun 2024 15:41:49 -0600
Message-ID: <20240610214456.2757397-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610214456.2757397-1-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 21:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200487

Since multiple versions of SPDX are available, use the version in the
path

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 ++
 meta/classes/spdx-common.bbclass     | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 94a172fbc94..3ebf92b5e12 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -6,6 +6,8 @@
 
 inherit spdx-common
 
+SPDX_VERSION = "2.2"
+
 def get_namespace(d, name):
     import uuid
     namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 468a11ca3e2..f6fc182838d 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -4,14 +4,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-DEPLOY_DIR_SPDX ??= "${DEPLOY_DIR}/spdx"
+SPDX_VERSION ??= ""
+DEPLOY_DIR_SPDX ??= "${DEPLOY_DIR}/spdx/${SPDX_VERSION}"
 
 # The product name that the CVE database uses.  Defaults to BPN, but may need to
 # be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-SPDXDIR ??= "${WORKDIR}/spdx"
+SPDXDIR ??= "${WORKDIR}/spdx/${SPDX_VERSION}"
 SPDXDEPLOY = "${SPDXDIR}/deploy"
 SPDXWORK = "${SPDXDIR}/work"
 SPDXIMAGEWORK = "${SPDXDIR}/image-work"
-- 
2.43.2


