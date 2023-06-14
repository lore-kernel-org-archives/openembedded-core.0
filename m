Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6800EB64DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:33 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.7467.1686734966056068619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sA8jqZbk;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-976a0a1a92bso88637066b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734964; x=1689326964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6ixIkxc9Do+FmH8KnJ3mBqQZEZPCdXb76jEH42PZog=;
        b=sA8jqZbkIHA1HVzu2/ve3mtTwhC9eo1YwwA0HJreInEhCYovIQg+dKcince5hzHlHc
         vMUNrTb6eNjO4jFbWxu4o8PnOm9bvl7TLrhxVfLIqEQPspqvbCRkS32IawUmlUV4PYRe
         DsIOPeGceYGjIqcshXBhA84mkUCpH73uEYzU9c9ZFfGxdKMFVU7umXYA7XcH3OecseQB
         XhKxElQ+2+SC+isgG6GeruVRcY6xbJ2cVXcM2HNA7rSLzaTNgWFP2Kxm+Y+lfsPyHsoB
         wrmaGjaot4HlVZ5vH7L/wuf/fmsPP6wM/y1smloXy29Pfxgrhvlqxwum+FFgVJyrmfqH
         qdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734964; x=1689326964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6ixIkxc9Do+FmH8KnJ3mBqQZEZPCdXb76jEH42PZog=;
        b=OYRL6NXh1vMNjUf6SoggaHlC2cuHvBwwI2aTn9vHzCKobdYKne17BcKEs1zufYcMpS
         8FHHooWEGEMGFeZ/dH5bY3uOoT/YPB2GFc75rImjCKSoFDyRgztxELdpvgafEeWSlBqy
         mjINVFBK2Ui4r7gaupl3Yil0xvm00yfSWrlXX2lgOXK6YRYh97GwFqkHPZHLV7cDtwWd
         g5n62ln0BnYv1xyjwLF0+9LAQaV23FdSHpDdgCUE1byrcJzjM6FzZJa1NBpnDj+YvL5O
         dxE3VJ5GATlG8jzuek+9OOy1qBt/+rAzT67ie+JraaeOlQYCb0W/Jui7BWsRn/XW4Wck
         NLXA==
X-Gm-Message-State: AC+VfDxYG7v3csTT93qztfHYUrL7ux1Zs1Ts3xVF6jejV7NNJ5W4C+bT
	fDtMCXmzRwSD1ifCsjW4JQAxReWfqLw=
X-Google-Smtp-Source: ACHHUZ7JKzcTo4f5RCLbmTZUZTkevfWYYkk7KzP4GHO0gNOUtphNeE0iOGGKVHJZkCZwnbiHb+wgew==
X-Received: by 2002:a17:907:5c2:b0:973:8c47:2a02 with SMTP id wg2-20020a17090705c200b009738c472a02mr16015548ejb.38.1686734964422;
        Wed, 14 Jun 2023 02:29:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/55] insane.bbclass: add a RECIPE_MAINTAINER check (oe-core recipes only)
Date: Wed, 14 Jun 2023 11:28:25 +0200
Message-Id: <20230614092918.4065570-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182747

Absent maintainer entries are as well a frequent source of friction, as they are checked
only in selftest, and so aren't revealed until autobuilder runs.

The selftest is retained as it also checks for obsolete entries in maintainers.inc
(not possible to do in insane class).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 632f738c86d..50f60337cc4 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1492,7 +1492,19 @@ python do_qa_fetch() {
             else:
                 oe.qa.handle_error("missing-metadata", "Recipe {} in {} does not contain a HOMEPAGE. Please add an entry.".format(pn, fn), d)
 
+    def test_missing_maintainer(d):
+        fn = d.getVar("FILE")
+        if not '/meta/recipes-' in fn:
+            # We are only interested in OE-Core
+            return
+        pn = d.getVar("PN")
+        if pn.endswith("-native") or pn.startswith("nativesdk-"):
+            return
+        if not d.getVar('RECIPE_MAINTAINER'):
+            oe.qa.handle_error("missing-metadata", "Recipe {} in {} does not have an assigned maintainer. Please add an entry into meta/conf/distro/include/maintainers.inc.".format(pn, fn), d)
+
     test_missing_metadata(d)
+    test_missing_maintainer(d)
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


