Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1C3C44508
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:30 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14783.1783866566942250615
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=RBUHn6Qv;
 spf=pass (domain: underview.tech, ip: 209.85.128.174, mailfrom: vince@underview.tech)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81e771226b0so33245887b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866566; x=1784471366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXdf4JkUf4ZdcUU/V3s+aiL9oV8FCwlTzc+4jbcVjOM=;
        b=RBUHn6QvycwSiC13NzbcU4aRKEhUT2+YhFPz/dq8C6pWRE4AuQxVHEOBTZhyhaJJ/D
         j4HvnhZOJ9AKH8fa7WzVcLWIwLMc/K7z4zYTtJKTQxkIhG5qElwN9pzFw+ErmZSmKeMz
         jautC8CIk6iaUc934jq/T/LSV5YW7ZdgGL+PIeO1QzRRY8UjOP6TG0xOTZ/+xBNmwxIk
         FkGLbm+fLcwCAkq+0A8UHivgFKgd/Nwar+sE6gi7l3/rU0IQ1jAaUs8qq0hXW8JxEDIr
         fCCYirSOgG7W72VYTjtC2/N5SloTuMIjQM5z163OzaL/zeqJ4uG1Z+Ykbq0IkdN9Ni2K
         0iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866566; x=1784471366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VXdf4JkUf4ZdcUU/V3s+aiL9oV8FCwlTzc+4jbcVjOM=;
        b=Y9oMbbJ4LiW19uvX+BHm4Ks9OGaNXF2jQ8NCnltC9K1YO/Kv2R10LAGvDPbYaFrSO1
         MoR2lY9uUIcIcmQEL2Rnrxov2f4g7KqRCdO5i6bNndk2KInMKr+rdNLkSFyfTrIr3Fkz
         6YPhflQIZJq8e3mgLA0rmsWxHbBVJqcAalYsoGuDgpxbWzv+eiwj2M5ER2ROOoe+caYK
         US79lYmLYQgL4rV1OP0u32zFTzWkEQ18BXqzdSTla1Rv3JhLeIHUFQlZI9oYo0tbDa5W
         viH28Mzik0kWnseKvpVxRYKfQMn3GtaTSHzo+bVGBgu1Lewg5Ypw7Q+2aOROPJ834wsf
         hqZg==
X-Gm-Message-State: AOJu0YzW90PDwofSvPbHdLckKG7MAjq6gUuouaLFflv4Jr1NC6a2PaOX
	at5M1mEln15TnwrL0ywlwyDizzO1xOYrQcMde8xoCpqBQbuXmFFwlM+CBJF2mpU3f4g73HORJNW
	j+HfS4CU=
X-Gm-Gg: AfdE7cmGeA4bfJGtlapC8ir+5g56D2+NljK3WFE4f+rXKRhbirOAtVRPvj8Zp3x/o5Q
	BIgFfDmU90BADA82U943aaDFIKZwNtV1NTUXZLOrmd+2Vk3iVPmseslDtMlaR0U47ojs0hthTV6
	eX5fOa8tYoGz+AskzEBIExN9oHkT0cajt1eDI0v9WkcvFNgNVfXLpv+mgjguQlq/PuOFEGx6b6N
	NLH47S38ZCA2Y/e20hrPYQmRogcePGr2hkEcf4gD+yBJ4JMdBFET20VIEWtrxRB0YDAaLmcpLak
	yHKOXTbS4WwJOCt3olDQu5pZoMhzTL4E2x7sl4+hF1Rgbyhogug432u7gFVxo5QBayBrmmCf1nV
	oyUcKFfU1W70c3CGkaZjk+SMmdsHPMFoXHnN4PN+olQxZMv//HCP/WLLe8eQrbXSkF2ViAFmdIx
	j/w+nXKvwnLvHC8j3sqTz6Uswk
X-Received: by 2002:a05:690c:dc7:b0:81e:8d95:3d32 with SMTP id 00721157ae682-81e900072f9mr38280717b3.9.1783866565972;
        Sun, 12 Jul 2026 07:29:25 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:25 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 03/24] kernel: remove setting of KERNEL_PACKAGE_NAME
Date: Sun, 12 Jul 2026 10:28:55 -0400
Message-ID: <20260712142916.2573370-3-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240769

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


