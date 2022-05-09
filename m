Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F929C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 10:33:24 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.30279.1652092395199057824
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 03:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iNO4cUiG;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id q130so16444960ljb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 03:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=60GL81ywUmuPkRUjgWAaK9o07Ku3LXRIf817WPg6Qdc=;
        b=iNO4cUiGJtgAWTvcsSS2t9536KzsXyOgxHQmBhCliditHFfzZB3dLIwRh41oOnT+XV
         gX/lZXGbo8u02LDrmdKJcB8O+pkpqrDN8vFrvDrNB8jTJzdKA7ko7M9PzubRmkRBK5Bp
         HPGKx3R35wHoLVeTgmSy5SUXNn726f9Xi9MSonajfKIKv8e/BCzuK2zw5tfyqwX+xKnd
         cfDRIgYHLLfaFQfdhYHnLX4MjWUPYBO4qn1lPK+/HPQzZxgcR+Wcri3MseGGHlevzisO
         2COggJgwvyyfvdOm/7cUJUCottr/SBndNz2Q8JW9GjsQowRDf4oSxpjegXeeEdvqC2Dn
         rcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=60GL81ywUmuPkRUjgWAaK9o07Ku3LXRIf817WPg6Qdc=;
        b=aXzed2mP1GyX/Jw1w+P3qfVxsty9ALQHQ8x7liOZT25KFuSGKKl/vQ64blXZ+qz74T
         Voibrz3RdNtgY11aqNHmJIvB8LolB0BAsfaPXa+Y09PbgD9c7pYEDrmTMLks7jrv4K2r
         2hHmCKC12kOINOuX4a+NXZ6drJcPBWMwbGDSKpqTyhfqWRSoYhAgbYOQTpZ7LvUr4bgE
         vg7pVyadpkCic7NEeJVt+vL37CdlmpzRwPyBZtwnMe3EbavqjQnini4HrJywUjRn8O19
         faaYi3mle8vAdJ3YLE6kUpsdhtXnoQs+LR0jC0E/rp/T2Ba51aLS8fCdSK0QW99zLWut
         Izmg==
X-Gm-Message-State: AOAM5329+xobmALz6QzK9ChqtfvDo1MlQdVVPLTnOSlBT78lEfpisi2+
	L8XBOQFxU7lwcxmJVKpbSB5O7r+fqiE=
X-Google-Smtp-Source: 
 ABdhPJwB2Izt7+Qndz1M1YtrS2F0PRSzUzbyvFjACHaoOiURYmM9VUIfhJznRwGNdHqy+uRKpepaeQ==
X-Received: by 2002:a2e:878d:0:b0:24f:2bf2:5a79 with SMTP id
 n13-20020a2e878d000000b0024f2bf25a79mr10208171lji.497.1652092393185;
        Mon, 09 May 2022 03:33:13 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 d42-20020a0565123d2a00b0047255d21154sm1894167lfv.131.2022.05.09.03.33.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 03:33:12 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "image.bbclass: allow overriding dependency on
 virtual/kernel:do_deploy"
Date: Mon,  9 May 2022 12:32:51 +0200
Message-Id: <20220509103251.674719-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 10:33:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165390

As pointed out in
https://lists.openembedded.org/g/openembedded-core/message/165058
https://lists.openembedded.org/g/openembedded-core/message/165216
this patch sets KERNELDEPLOYDEPEND but then uses KERNELDEPMODDEPEND.

Revert the changes since no one seems interested enough to fix it.
If someone wants this then make the variable name readable by
adding underscores where appropriate, for example by calling it
KERNEL_DEPLOY_DEPEND.

This reverts commit dcf9dfa4e6305786cd713aa28deda94a50bd6635.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/image.bbclass | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 47776db2b0..7f1f6f80a4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -132,12 +132,7 @@ def rootfs_variables(d):
 
 do_rootfs[vardeps] += "${@rootfs_variables(d)}"
 
-# This is needed to have kernel image in DEPLOY_DIR.
-# This follow many common usecases and user expectations.
-# But if you are building an image which doesn't need the kernel image at all,
-# you can unset this variable manually.
-KERNELDEPLOYDEPEND ?= "virtual/kernel:do_deploy"
-do_build[depends] += "${KERNELDEPMODDEPEND}"
+do_build[depends] += "virtual/kernel:do_deploy"
 
 
 python () {

