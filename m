Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90137C5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 17:15:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59660.1786468501381738503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 10:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h5QQ8LNm;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso9994515e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 10:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786468500; x=1787073300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7DsshdpMQmaSwnDiEkoZxU9satDHRO9P1e/Gcf0S0w=;
        b=h5QQ8LNmDp5UBMTxg5b3/i8XTOm8Igjq5N7nH+SKYY0K6hWtSsyUHU7ExoSd18NdDd
         HNSCBTU22Uh4hPUAuJGx/fRAzS4DWn3iCJCwxnwshiu43irHILlovQ1JHpj6EXNgrP6u
         9Z3w6XTR+eQqvSWA/oyUVvz1ZQ0NlDvaVX941kl94srGRsjvtycl8dqRDfWMvuZT+sAn
         O3W3HqMsyRl6JWtCiutZloyfM3Ok47eGM1odSqTjNKXGyje0RZPNqRbKgWWONsEe4f1Y
         V87VOuvpGwQhLljH981OvQ0+NalhmLEA41MlFYyPEHPwhCtAgvNwYWqhIYQY0YwwSEzi
         7xEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786468500; x=1787073300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E7DsshdpMQmaSwnDiEkoZxU9satDHRO9P1e/Gcf0S0w=;
        b=PhiMfQO1+pVK+3eaS01Apo6EINhMgbhIKciheJdICITWcwougvjcvQeerHyY3AnxG7
         mgw4V9E99j2O8esqfNYg+aa57E0j0Bq6DhZf88mn+2u57PK0AJLeZ/dtHe1cixS705A2
         /6L/5GZFFXnFdjoYMC2z/PrNKAx7+O4iTkUg05mXVBi+2bAX/Ptx0YTceEOTfds6C9yI
         8MDN9mhH/X5ZaF13GZJzBen/5kikvQw6LNMRQIZ2LLTRyjROZrEk2/cK/biguw+KXKmO
         EsXSlxhwdY2Aa+Oj8gvm8Eru4vx9MFUTKPPxqZZGxWLAk/CEh4Vz5nEFZNFaGDzAFh+X
         YN1w==
X-Gm-Message-State: AOJu0YxXfRnqcVpP5BWDK/za7r7AX+dPa+Wr2FClQvEzRPWTcIF24PHd
	IvlHm+75NvUx8E3cVblKbdnXAU7vlxrds/gz05K8MqmkpyZuJCtzZpUIQdV+XFZm
X-Gm-Gg: AR+sD10RE2OTOqb6g1tJVWBF3JvHRyEJ5zKdOVEeSZpmWEbPcl7cZGv3XXI4EdQDV0z
	wMxrYAArBvj7nmk3ep3xuWE9SdBfLcV/bE2O4WIh50jE2TRxrEsf6NCAwf2HVy0yXac+UP4ST0f
	U6gWyPxWgm6gpfncFPbnG7a9KLBWZjplI737iEPE/WQOwj028zEX5z6ZtwOk2HcEpJOmjJT7W6i
	20MIaM0z+ss+oiZ6ZMoUe59yrbPFlaPbbr1DTP3ItTdwIoECrvgREA8ZI7ERZJAXRuN9gXs+8t+
	9AWW3wE0WzwwV4BP6fekw7nGv05WdZtQZupPePD/2yuQE2rck9GUlPfPPY6ZSxJ3HGzQ9rzpeTE
	x/27O9nJcD5VNcE5Lny6wGtx5xR7WyRNNbLeo3KNTzsPj1jK/b1O+eSn0ozS28bDrGxQhcGM2jb
	ic2IamjgpgecqIc5KRTolHX+v9uDb0pvhZQgBa6nkJ+VbiAE4oVgWnF5ZkMtZN2oiHevtlKdE3y
	rFHOnUuYfE+6GagNPqxiy6WMfxaK795KS9Af4jomOXw5X0PNGVrDd4zZ2CKDL397TxPzmoI98kt
	icwMSH0AfJE02pjGKUo1
X-Received: by 2002:a05:600c:5811:b0:493:e543:1dd9 with SMTP id 5b1f17b1804b1-4997a6610bemr19932105e9.9.1786468499459;
        Tue, 11 Aug 2026 10:14:59 -0700 (PDT)
Received: from aniss-macbook-air.home ([2a01:cb15:80cf:2100:91ff:b7a6:5488:6e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a70976csm5658292f8f.19.2026.08.11.10.14.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Aug 2026 10:14:59 -0700 (PDT)
From: anis <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anis <anis.bougrine10@gmail.com>
Subject: [PATCH 1/1] conf/documentation.conf: Make do_clean description more explicit
Date: Tue, 11 Aug 2026 19:12:36 +0200
Message-ID: <20260811171236.84403-2-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260811171236.84403-1-anis.bougrine10@gmail.com>
References: <20260811171236.84403-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 17:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243218

The current do_clean task description is generic and does not
specify which files will be removed.

This commit adds details about the files that are removed by
explicitly listing the affected subdirectories.

Signed-off-by: anis <anis.bougrine10@gmail.com>
---
 meta/conf/documentation.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 4c5a5ee8c2..72513296e2 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -8,7 +8,7 @@ do_bootimg[doc] = "Creates a bootable live image"
 do_build[doc] = "Default task for a recipe - depends on all other normal tasks required to 'build' a recipe"
 do_bundle_initramfs[doc] = "Combines an initial ramdisk image and kernel together to form a single image"
 do_checkuri[doc] = "Validates the SRC_URI value"
-do_clean[doc] = "Removes all output files for a target"
+do_clean[doc] = "Removes all output files for a target including ${WORKDIR}, sstate manifests and stamps"
 do_cleanall[doc] = "Removes all output files, shared state cache, and downloaded source files for a target"
 do_cleansstate[doc] = "Removes all output files and shared state cache for a target"
 do_compile[doc] = "Compiles the source in the compilation directory"
-- 
2.50.1 (Apple Git-155)


