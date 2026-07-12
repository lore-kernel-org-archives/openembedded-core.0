Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D349AC44508
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:26 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.931.1783881801664184962
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=I6CkvmtC;
 spf=pass (domain: underview.tech, ip: 74.125.224.50, mailfrom: vince@underview.tech)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-667923d86a7so4215107d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881801; x=1784486601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXdf4JkUf4ZdcUU/V3s+aiL9oV8FCwlTzc+4jbcVjOM=;
        b=I6CkvmtCAst3opXTxH1OTK+rtq+2dWQ8MNWViqZBn05W3n/TIUhUHl5yF9O5eIP3r2
         7TjsCTI+mbSTA8KIQUEOQiGb932sdeYXNDo1vH7EYEuVJU1uu2H+hKeUvjbojbV73wG2
         dIqyZrVgbyikKjh0VgmRnH3XbPzzWb4BKBaGCR59dyJHvZSE0NuCK9W9YDBQAJd6ajaJ
         NggMMl+kjc8SdSHMxAKO+1V9RFN4/QzDOiGKZzI+fkLhUFsnoOoN28DIM4yysU5EKxZM
         la/02l2jmuG5eA+9FIklN6TygNzpaNcey1OPa/+GLNmZlvMgmrsuWuBeXY8ucDLGpfHm
         JFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881801; x=1784486601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VXdf4JkUf4ZdcUU/V3s+aiL9oV8FCwlTzc+4jbcVjOM=;
        b=bpPVMMCa1jjn9oL5pVHwtfEope3m9ly5YNMEkfOEWJ80cpNItM1yoF/SoHPxqryffK
         iiP+v2uxMYighz1ovYWf7/LrOVVWyb8LURbYJQsChiyOk2/Iu5WCwDwyzD5R12yNFM8n
         wh39D8MemxB/Hdgl1kMRWyyXJMWkbZS2JFAZd/ycX4RRx4jrwMpwToXQgrIwBehPjmnD
         cCvmJSBs+wemEEg+edcCT3b5aLrP3Xo4ZZvmu2W/Xl/AMhc35fdadDbJRm3QB1zqbvJD
         mMlJ3HPfoBlVdGMMR4NZesVuEDoVIo6LTjOKQ/mZNi2OsppgmyPzyDeJyCChZsXbVdEb
         PNkQ==
X-Gm-Message-State: AOJu0Yw0fCErLzmTTYyjyTO7cVYXefcKQ2gJIpievjBI7M+Gaqj0LmFv
	pDajcTBw1Yv7uG6hovTJnNWjd0JzCz4dSNxaVtSFWkJ2T6q2W8KSeggoHDdfIVAKmH7eWksR3Jd
	xHt73mpA=
X-Gm-Gg: AfdE7ck5Up6kPXDjoXsvpFjrNY4A1gizSw5GmwQSfQwTezkr5TAfxyNnotfU7DY2Jnr
	m8Z1OB2jaGvPhlO/dEppHZi9NhNfxAGdZAvEX3wFWqfx1C01sPONMIALEsj/l/sJ4cdVvS3KPWC
	4uQbLOB18YB1akb1JqS42Mf0Q8xITVTtzZf0cUHNBLreTOohz5yzuQNDDWWbEWL06x8LhKQiSGB
	yGy4SR5zSU8OmGgXnPYclnXtSoTRKbdyWkkpg671GK42emh0bZphb2XigGV/hrs6NS0MMgu3QrO
	hled5PUVKDmA17xkwyzgsfE6ZwBUSks4aqB1Ygz8OqVgnLtPuwIle6EZulesr42ch0rd1NFL+0m
	Bke7fZBSIGBk8eHRCpaXKMnA5YzLhc8Lkx0Y1nx0Qzpno9BLJI50MOvkIlqa41ZlmI4QKs5lE6M
	QBvgLjrjzBUD6aRkwExD2SSBWg
X-Received: by 2002:a05:690e:43d3:b0:667:8b90:2ed1 with SMTP id 956f58d0204a3-667d9964dc1mr3202355d50.45.1783881800682;
        Sun, 12 Jul 2026 11:43:20 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:20 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 03/27] kernel: remove setting of KERNEL_PACKAGE_NAME
Date: Sun, 12 Jul 2026 14:42:43 -0400
Message-ID: <20260712184307.3259642-3-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240793

Must always be globally defined to maintain
uniformity with builds if KERNEL_PACKAGE_NAME
variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/classes-recipe/kernel.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index d8d44de27b..59746bee7b 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -95,7 +95,10 @@ python __anonymous () {
 
         d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', ' '.join(sorted(typeformake)))
 
-    kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
+    kname = d.getVar('KERNEL_PACKAGE_NAME')
+    if not kname:
+        bb.error("KERNEL_PACKAGE_NAME is somehow not defined.")
+
     imagedest = d.getVar('KERNEL_IMAGEDEST')
 
     for type in types.split():
-- 
2.43.0


