Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE89BF3383D
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 14:34:30 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77377.1773758064793096949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 07:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BSVZcl/0;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so41179225e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 07:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773758062; x=1774362862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8CkoYuAEX8pqnGABSJdWb+uoaDmrm6RWf7He/eBLDhI=;
        b=BSVZcl/0aWLZxbVzKaHM8R99XVrmREpyLU9dpvptoASjQzz7jaiGs648ITz/T2MkFa
         3Ckju2/rvYn58Vu3UXDhbK54aSCV5lHevN4pCdafZcbWjFuYIOHeAtSZVHEcDCm79YBf
         NIkt/NWv9ncznu2almW/odWBYFjebClz8aKylRL+DB+X4wuLa/C9JMYdeXXNNm1HRxOm
         0ffo4eBdiyZpW5J4xZ4MJz79Qq+Zw8C8PkOWKun3dQk6CjX6wqKfp0hGfjInlkGaadGB
         wET6i8pQ/qWUiuLy0u7G6nQL66tqpscgx1z7fYBOQmqsOMVl4cxWCsujVI7+nMTFdYtK
         QI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758062; x=1774362862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CkoYuAEX8pqnGABSJdWb+uoaDmrm6RWf7He/eBLDhI=;
        b=cc3aQIU3xK3uU5+G/en+ZPw+ASXDJReuW50e43vmlfkiMG4iEodEwYcoGaWqGCiDjq
         bV+I5jx6zxweTvYnVg11z+VaIO5+BWXQLzmQJTqu39P4BwFeTIOpiK6fuhwBfGuO79G7
         su3HsTYNnmyRdFRQ4cpUv8tiQNFC3+AlWQWN+x3AVw+s6rMUJlDVWhP43I+Yhm3HByFP
         9OGLQ4Iy5P/yGRCV/EqJQ8PMlFCn664kgJgQpLICrpxL7WNe5sIR+8EWW/8YpH0apbMs
         yqZyphDKt47T9TNTDDZ9TKIYCflXFtPL7hTouLeWBwS7Gyi5k8tuoF3/Qty6ikBWrLfD
         6AsA==
X-Gm-Message-State: AOJu0YxNllBJTI8Kd3j6KSUCMihMfHV1iMxjUqXUBne/uqlFVIPpyFW5
	RYVznfraNsPr7kOWhnzbms5Zzyw4u3srQS0Dmcr6zt+9DHMgEEoKjRbiv7r1Sw==
X-Gm-Gg: ATEYQzyago9d8p+oALn/nSHSIpC9A7u/pNW/p7+j+6RI9tiwl4Hez0JqJpyAVY/y2Cn
	e8rAyhw4NqYFXnJpF3kREf0BiYiQdONXXC2F/cCGECRprw81iHc2vznJJTQazDCm4LEJHb0DSZd
	3a+Qfcm/CUS5VugW95NuF4jCEU3YGwnt3sWpGtekFFA2AZcNMxffxMCBqy20gm5dgJw1w5ypVRz
	juLiyMD5vay97UvC18aZXjY5HJgRPgpmEliUn/rcbFAa/ninEAl9nG4Duys7Z6brPZUkWXZ9sR2
	MGXpCrUSPSSXvwa+MnEacz4j4PUgBzX65ErVJu1AuGsPbMakZWPgP0bZXqx4FKnabVIay7WjI9H
	jl/G9RpddehkFIP+qPzSAW2QsFzY+gxzPCZJAI4xhuMYRpF62o9DlDXEMtW5L1tKYJV0fINPXy+
	oiCR/9ImTV5F8puh6wMROxwe1magaVQQ8i8r0R+LpFDZs=
X-Received: by 2002:a05:600c:1d0f:b0:485:2ce2:4c75 with SMTP id 5b1f17b1804b1-485566ca5d8mr291429195e9.1.1773758061288;
        Tue, 17 Mar 2026 07:34:21 -0700 (PDT)
Received: from toster.lan ([185.228.162.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19b936sm54473575f8f.5.2026.03.17.07.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:34:19 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>,
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH v2] sanity: condition hash equivalence warnings to when it is in use.
Date: Tue, 17 Mar 2026 14:33:27 +0000
Message-ID: <20260317143326.318575-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 14:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233325

From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>

The warnings about the hash equivalence server are only valid when the signature is
being used, and for that we have to check the BB_SIGNATURE_HANDLER variable.

This fix the warning that is displayed when using the basic signature hash, OEBasicHash.

| WARNING:
| You are using a local hash equivalence server but have configured an sstate mirror.
| This will likely mean no sstate will match from the mirror.
| You may wish to disable the hash equivalence use (BB_HASHSERVE),
| or use a hash equivalence server alongside the sstate mirror.

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---

 v2: add new top conditions for the BB_SIGNATURE_HANDLER and ident the existing one

 meta/classes-global/sanity.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index a170c3f5f5..389ad7c917 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -1008,8 +1008,9 @@ def check_sanity_everybuild(status, d):
 
     # Check sstate mirrors aren't being used with a local hash server and no remote
     hashserv = d.getVar("BB_HASHSERVE")
-    if d.getVar("SSTATE_MIRRORS") and hashserv and hashserv.startswith("unix://") and not d.getVar("BB_HASHSERVE_UPSTREAM"):
-        bb.warn("You are using a local hash equivalence server but have configured an sstate mirror. This will likely mean no sstate will match from the mirror. You may wish to disable the hash equivalence use (BB_HASHSERVE), or use a hash equivalence server alongside the sstate mirror.")
+    if d.getVar("BB_SIGNATURE_HANDLER") == "OEEquivHash":
+        if d.getVar("SSTATE_MIRRORS") and hashserv and hashserv.startswith("unix://") and not d.getVar("BB_HASHSERVE_UPSTREAM"):
+            bb.warn("You are using a local hash equivalence server but have configured an sstate mirror. This will likely mean no sstate will match from the mirror. You may wish to disable the hash equivalence use (BB_HASHSERVE), or use a hash equivalence server alongside the sstate mirror.")
 
     # Check that when SSTATE_DIR is shared between builds, hashserve database is not private to a build
     hashserv_proto,_,hashserv_path,_,_,_ = bb.fetch2.decodeurl(hashserv)
-- 
2.53.0


