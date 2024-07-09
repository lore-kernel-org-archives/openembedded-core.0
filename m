Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045DBC3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 13:26:50 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.12898.1720531602770970639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 06:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=R3HUF6rE;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-367ac08f80fso2250834f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1720531600; x=1721136400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Urd+X3vK1hki0f3wDgLc83YEYcWG9CbTaVqcmjATGss=;
        b=R3HUF6rEnUw24spMDR7/7aaEWJGlxCyvhlyODWydu8J4PDWqWlJug/SxYP5r2+73AW
         VzGflUW+QF271BtG08YsHnlcxcC364Kr6V5X8ZBKG0hFYwAmv9M1BwWwwQqA9Td/C23R
         vmQic4aIvLVfgu/S5WZx6URquUaon6JdmO23E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720531600; x=1721136400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Urd+X3vK1hki0f3wDgLc83YEYcWG9CbTaVqcmjATGss=;
        b=bd3rpR0WUW6MECgeqxzeYiB6qqwUoVh0p7uMFLk3fOKUBxQf/Zb59Og8W6G94UXDL2
         uZpxZjPN0zKxMyFttUdBVe1TqRRPXo5ToNDSuwyfnOFExaNV1Vz1kUtJSLSRRbbYa8pA
         0xHjxB7h5eLj0su25UO9Rd1SOruz0Zz2bxxTeU2bAFVPDfD3NFNV4nlGuMM1pEdDfBVK
         czmX3uUp+VnwnlPxHx9M33CIg+eHN0tPQxi1XUqlHmtGHecFP7QbHsGaxekkIE4SkN9v
         cICozcyHowhWQeGoahUfYa84C4EJMyZ067OsvnzCKFL1F9yda9KBqP9lD0mkR8nDgsHx
         xgkQ==
X-Gm-Message-State: AOJu0YzJBXZAMKckkDCF3Ez+SoPHa8lpc3WW0e92MoT8lU2i1W5ZIsEH
	hb31VWaVCD06HmyebVvYiZWBnIHXezHcbZ9TsnT6HII/Z+Ke7boGWjlp5JmifmYfb0N2mbxIvi5
	c
X-Google-Smtp-Source: AGHT+IHF3+QFs9dJPXp3kDJYTgcx3Ji399rGzt+8hYWbQm++pWXqkEoSSu7gn3am0SK4cX3ducbPkQ==
X-Received: by 2002:a5d:6389:0:b0:35f:fa0:cf82 with SMTP id ffacd0b85a97d-367ceadb05emr1873312f8f.68.1720531600361;
        Tue, 09 Jul 2024 06:26:40 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e07fsm2563336f8f.17.2024.07.09.06.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 06:26:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] Revert "insane: skip unimplemented-ptest on S=WORKDIR recipes"
Date: Tue,  9 Jul 2024 15:26:13 +0200
Message-Id: <20240709132613.1265591-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 13:26:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201659

From: Yoann Congal <yoann.congal@smile.fr>

S=WORKDIR is not supported anymore, so the check is now redundant.

This reverts commit 9a2d2f7c2b7236667a6d80355f73db4c27e6582e (in OE-Core).

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/insane.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 6888fa06f0..81c5293b45 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1365,8 +1365,6 @@ python do_qa_patch() {
         pass
     elif bb.data.inherits_class('ptest', d):
         bb.note("Package %s QA: skipping unimplemented-ptest: ptest implementation detected" % d.getVar('PN'))
-    elif srcdir == d.getVar('WORKDIR'):
-        bb.note("Package %s QA: skipping unimplemented-ptest: This check is not supported for recipe with \"S = \"${WORKDIR}\"" % d.getVar('PN'))
 
     # Detect perl Test:: based tests
     elif os.path.exists(os.path.join(srcdir, "t")) and any(filename.endswith('.t') for filename in os.listdir(os.path.join(srcdir, 't'))):

