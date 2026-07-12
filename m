Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D42C44506
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:51 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14878.1783866586028801239
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Q584ayRV;
 spf=pass (domain: underview.tech, ip: 209.85.128.180, mailfrom: vince@underview.tech)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-804e46366d7so31955987b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866585; x=1784471385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePWQmvhCdx3WA6qQfubxCk3A1TIPraKQR5AnU4XIXz0=;
        b=Q584ayRVsBls0O9kUstXilrBq4NuhHATfiYbTHg2Ul6JoxyyLNE+TiMjAFvVViBRMI
         g5SwuAjuB76eZMuOJ9j9pv5tt/IPit1Eo4eK1H/XCtiWENX8cSrjgWjrZ91kwO6yO0j2
         RazYuXUbpsOElfiTEL3KQIkt/XU9I1JpteWmUwpoanmyM2PxUrfUlT70ci+BCcxXoERV
         rIQbVtfyWyQtBQknCZqEHZHZmuC4uDL/UvVFX5hWtDUqYpzSUZ/Ww806vMNj2G5RpcU1
         /3mAHEEmrIY9+YVM+9tAdeTQFnYoeuoecVCXBr0sRtHIlqbp6eUlPu1VS9PeFfSVc9Y3
         B01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866585; x=1784471385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ePWQmvhCdx3WA6qQfubxCk3A1TIPraKQR5AnU4XIXz0=;
        b=N7uwgejkV6lBLSHnDYUKBAWV/hEe35WFND1drzbUjuFo25SAkxJvzbYBKBg44S7BnR
         m5cR/2DcFwT13diKVBUOAGIYbUC9ATr9SwjRxZ/3Xr6Hgz7OeqVr7mOSaE8bGw6ewFnN
         xyF9fE1Dv/kNzF345LQCMNJb7I9W+fgNAbM2XwcvcrBCKYzWCeHnWO9UiSGU+stqiZaB
         vOWKhQzoF07BVcIr2RCF9xLGVGWH+9KOHzQfAze6ohghMstWPqjsBVhBwouBOQXQjHsh
         zwB5hkGWx/o9BRnOl1h+ov7BlOx2DeuwnnTZJAzZpvQaiajniqHNT2VdIQOD9GjztLrI
         z/Lg==
X-Gm-Message-State: AOJu0Yz5+XARcX6qN9KWSSdpc3hvI9xZybdqI2qu4l96ROJ1UPMkWC8R
	L2cXYNcCg45zeZCZJ4pTM0F2sjEcIn7oWJbiM57KwdvuUSqta1J1QjiKn8FUtFh9HqfyU3oj16Q
	ejerEOIc=
X-Gm-Gg: AfdE7cl+k030M3mBdNJNIJ3Ro/p6+DdKpZQFYJJlhy35S2ICEWujNh5cWmi44SPX535
	5GPT3Sd1SZbI5dxp0U7fYBINplkjssdLUWyxIj+xGNfAhix6pc8B4vxtitqVg/q/nkNRgTWrY+R
	mXuGAM8eaHY9B1TuPev6M342wQuaakGfkLPt4vHhqnMNBqHNYITCWZGCTcTPfYejiYaYeikndAa
	G8FP3d2PF8+Ph4nCbW3AyH4Cl3rdCCAtuB+qgSSweCvMfn/9HAd55LzJ6Yzx3PJVjAMgpIxxIS1
	mKlnxCGi+qQnKTx3oHu9AGRllsH28fiNc6/RPAQKTExDpxRb1OHV2iK8SI4D6wRWt67k6WgJtmY
	phIqzOIo54FfefwCbRcUg2tt51syjJ/YWt5nWIyLIVNTsuZ3FWPca1G/VN7xkmPKK1wXtlg9GO2
	jJWpU7bnU6vzBjwg==
X-Received: by 2002:a05:690c:f0b:b0:81d:709f:919a with SMTP id 00721157ae682-81e902c763amr42813017b3.72.1783866585088;
        Sun, 12 Jul 2026 07:29:45 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:44 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 23/24] linux-kernel-base: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:15 -0400
Message-ID: <20260712142916.2573370-23-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240789

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/classes-recipe/linux-kernel-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/linux-kernel-base.bbclass b/meta/classes-recipe/linux-kernel-base.bbclass
index e2187a73f0..5ecaa8ce6f 100644
--- a/meta/classes-recipe/linux-kernel-base.bbclass
+++ b/meta/classes-recipe/linux-kernel-base.bbclass
@@ -52,7 +52,7 @@ def get_kernellocalversion_file(p):
 
 def linux_module_packages(s, d):
     suffix = ""
-    return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
+    return " ".join(map(lambda s: "%s-module-%s%s" % (d.getVar("KERNEL_PACKAGE_NAME"), s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
 
 export KBUILD_BUILD_VERSION = "1"
 export KBUILD_BUILD_USER ?= "oe-user"
-- 
2.43.0


