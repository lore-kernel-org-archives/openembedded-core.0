Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AF8C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 12:58:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.8859.1633352299729473007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 05:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hUV6RLxw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id z2so13378829wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 05:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3L0AcLj3TROXATsU9ssb4deh/7WtdiI5C9rjmn7LdY0=;
        b=hUV6RLxwtTwTtHjGRPi43Idq77utiTxeJ6pjU5M48ZReuF3ro+9byaZw98O2OE1ppx
         KSCuSHkt3so/gYqjJ5A0LUcFjm2PpYkdE6DdZ4tWJ3onKMr+JNnCgwAAb1JUxPXBjixi
         H+8YI9M/kmTUP9NTIPUfNz3dk7IT59Lh1dRaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3L0AcLj3TROXATsU9ssb4deh/7WtdiI5C9rjmn7LdY0=;
        b=OBfT9Mn4+uqIWUTszuoxn3cH7tOeWmnrpHakk1MGZNOZaikNLleXFmTzsX/qmSGb1F
         R8nVOKMKmxIj/2i+GMdoQrF36OjohOSNyfNA4WIK+gA4pIzKByk5MWaY1ZHk+wwojSNX
         qALMgqVsQONC2H2ReBpnwFV97H2ZEqLi1WHyf8K04RsJYXBDVnDRvLiqKJCJCIl8ZKDg
         OSj8T/zDZsAH+0mKKFzB+JzR96w+kLzBz0HaIpO3r/e/ojLZkW94bS+8vHNnZdZ/lYwR
         nfxD92iwqkEZNWfAubcLbUoGt1TreskYCNJg/paPP58uHnp36kMIM6ql4Fz5xBNp69qs
         OP6g==
X-Gm-Message-State: AOAM530OKFf7dM+qsPiALMoMiWIgsBAOUAqOMYrPeFPgtvLQpdDJKUBc
	Zrebn+Acp70mWYzQR2dGfDJrOveWcMbDtG/E
X-Google-Smtp-Source: 
 ABdhPJwgynB3F7vxUyk0uqiRDof/8+maA3znKq7wMYeklGegySbljdSXgDUMBhk2IZHap2ZPoS+mAA==
X-Received: by 2002:a7b:c24c:: with SMTP id b12mr8495304wmj.173.1633352297929;
        Mon, 04 Oct 2021 05:58:17 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:dd7:3f6:3509:4eb9])
        by smtp.gmail.com with ESMTPSA id
 h18sm14091712wrs.75.2021.10.04.05.58.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 05:58:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3 v2] image-artifact-names: Use SOURCE_DATE_EPOCH when
 making reproducible builds for deploy
Date: Mon,  4 Oct 2021 13:58:15 +0100
Message-Id: <20211004125817.2323818-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 12:58:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156583

Using DATETIME means the do_deploy output is not deterministic. Use SDE
when using reproducible builds since it is consistent for given input data.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image-artifact-names.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image-artifact-names.bbclass b/meta/classes/image-artifact-names.bbclass
index 3ac8dd731a6..67f04e81658 100644
--- a/meta/classes/image-artifact-names.bbclass
+++ b/meta/classes/image-artifact-names.bbclass
@@ -4,7 +4,7 @@
 
 IMAGE_BASENAME ?= "${PN}"
 IMAGE_VERSION_SUFFIX ?= "-${DATETIME}"
-IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME"
+IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME SOURCE_DATE_EPOCH"
 IMAGE_NAME ?= "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"
 
@@ -13,3 +13,10 @@ IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"
 # by default) followed by additional suffices which describe the format (.ext4,
 # .ext4.xz, etc.).
 IMAGE_NAME_SUFFIX ??= ".rootfs"
+
+python () {
+    if bb.data.inherits_class('reproducible_build', d) and bb.data.inherits_class('deploy', d) and d.getVar("IMAGE_VERSION_SUFFIX") == "-${DATETIME}":
+        import datetime
+        d.setVar("IMAGE_VERSION_SUFFIX", "-" + datetime.datetime.fromtimestamp(int(d.getVar("SOURCE_DATE_EPOCH")), datetime.timezone.utc).strftime('%Y%m%d%H%M%S'))
+        d.setVarFlag("IMAGE_VERSION_SUFFIX", "vardepvalue", "")
+}
-- 
2.32.0


