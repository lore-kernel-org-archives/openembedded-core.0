Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8DDC5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:44 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21795.1786634556052833065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LgUQ5ONr;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f7854678cso1624868f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634554; x=1787239354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tbwRddNu+1++cOsEyl6sov0CGhuGFkxG8BDZS5bZYUg=;
        b=LgUQ5ONrdtr/f489LFqMgcYe/YcWfJrsPzBPxvduL0kU+NpafXB6DHb6nZ+El0/3oj
         G+inMTHLx7yHTBnhda7kmfst1gaFlRcr50wNX8Au5VCPK+gM6INKyqi/ZbxDkALCI1VD
         bI1W8VD+UGdN4r/5pu9bVsafUlxYEC3YaOzeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634554; x=1787239354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tbwRddNu+1++cOsEyl6sov0CGhuGFkxG8BDZS5bZYUg=;
        b=sr2lJ1zm2ptCFauXE5xxv938tHOq+en7Y4X69Sd49lgZIcCrqLQYo6Hk51UocttD4O
         Aq54wfkDSuLyWZxNDq2XWHCZleMLPJ69JXkJHw62hD/hqfaSnhpXYPZVAcCXmi/MSR9+
         KLS9vaIc5EAHrZAixPRSwCl5p2aXzbVv8Y7g7VyFJFCPl1JL61r7f2mFpOkw02rkiY1W
         eRdlfnb4HAwZx0bbZeLz6J4MdTbfgwNg4XoAcZCRbAtSVJEzMQLHwKrB9FjA63e9aFPb
         2zoy3/T1RI+eb92oD64ni42eZzNnYu2msWfPmyyFHqR6RHC3HfcGMzXjTJc1fH80M78d
         PuKA==
X-Gm-Message-State: AOJu0Yx5tSMVrZKImRlDq9evU7sLhVkLOGB/lkGrDSwF3eC0zdL1z2Wk
	4UrdC/ev/USo651iG29uIXNbBE/fcEEZRbtThwkx463H/EGi7JRkIJqCcm4YMce4rAh6cY0PXYh
	aiYoJSs9yww==
X-Gm-Gg: AR+sD13nnPtbOt09xaBXzwXIU+yGTXkWTz5d7wYOJAUSP9zh0SFyEWJjBZAfrQ0WoTf
	SB7xSdaVDRyFU/FAw2k4Ex0on5qN7GDIQyOZVx3zW0RzmTkyeyeNZANrKYHxfOazA7qfFQThOqo
	CTv5yB518/E1agAjeonWGBgU/F8kQYESChrholzDZmGuHnMtQ5BnU/xa/Es/5uPwoEfzPFU2nAi
	2AtMfofezPrimMv0lZL6bdyeq2p2LhurvRp8VWMLlc6yprkgrcspw5TdOlN0P9cghmixnYIHjSj
	LpTCQxpWUq4iQL2yWeUNsiRM785XOvqZPn4t0DhIRx0lc5GTSTYC39wbIglbhLw6h6SSPXN20SU
	uAN9gJVdrgGuC9uuSGTDKAe+nKRqQI0O7qvu8La9H2rMyFJyCU8r89t+r8AwYKOgIl0bhMWhzNf
	c9XRqGeUbFWbXOP9MycrgHv98wJGhbar/4mYjVHImwmyXvmv7ehLNDQWjq+Nwc/SupOL6cfV4j+
	+QQHhe1GqchqfgpLQdUGXn79Q1qxUt/rJFW2PI3llvyKXsk4nXXKHxILqnx/Y/Qa5A41g4AuCUQ
	EzZH5MMcHcG/d4Kn8w38vpbbg2eqACM8UD8X6gMt
X-Received: by 2002:a05:6000:22c5:b0:47f:c648:e280 with SMTP id ffacd0b85a97d-48159fe3f7bmr9036115f8f.18.1786634554223;
        Thu, 13 Aug 2026 08:22:34 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:33 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/17] kernel-fit-image.bbclass: Do not include kernel property in DTBO config subnodes
Date: Thu, 13 Aug 2026 17:22:04 +0200
Message-ID: <327d2793ad520e41554d6afdffa881d1806d9619.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243371

From: Marek Vasut <marek.vasut@mailbox.org>

The OE 5.0 implementation of fitImage generation did not include the
kernel property in DTBO configuration node subnodes, while the current
OE 6.0 implementation does. The previous implementation was correct,
because kernel together with only a DTBO overlay can not form bootable
result. The kernel property should only be part of the configuration
subnode which includes both kernel and DTB. Fix this.

Fixes: 05d0c7342d76 ("kernel-fit-image.bbclass: add a new FIT image implementation")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 06ed34005957a6afb88270603df5e545941546b0)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/fitimage.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index 881d0eae0a..d7e21171ab 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -425,8 +425,13 @@ class ItsNodeRootKernel(ItsNode):
         opt_props = {}
         conf_desc = []
         sign_entries = []
+        include_kernel = 1
 
-        if self._kernel:
+        # DTBO configuration sections do not include kernel property
+        if dtb and os.path.splitext(dtb.name)[1] == ".dtbo":
+            include_kernel = 0
+
+        if self._kernel and include_kernel:
             conf_desc.append("Linux kernel")
             opt_props["kernel"] = self._kernel.name
             if self._sign_enable:

