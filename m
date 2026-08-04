Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D17C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 11:33:01 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14037.1785842683470230765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 04:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=br9Fptl1;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49548e01d02so17677885e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785842682; x=1786447482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQprmaYy9LsJw7WJ7b5qnLvb4GWR+CtMgWgWVDHfDOg=;
        b=br9Fptl1UCAY9f59SaGHyybbvhPI0uQ4CdHi/jHprbYR4aseaCC1sFNKMmzLKPCitc
         3IyLkaSuM8fuGCThJqRd1/HQ9yaSoh3f6/OVKGqUP3saPWGPy9BG3FzJYvtvrpncGu6N
         Hm8MP0jmOxwnR7/AObU1jrDMjMIeAhob4BrZKmNmUioouAYDUpgOH18/aNiwtJVLH0wM
         fPc8ZQnKsK2aqBqrac21p935ary8xctzWO2g0OI+Qr2ntWthV816pZyWKzaYO0YfDnsa
         bnU4IjtRqCKmzwzuJ8RyKDxKar1OHRJfuj5KbSWhTsFOzDuWgy6uCbyPPbhT4zd4F5dz
         FnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842682; x=1786447482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQprmaYy9LsJw7WJ7b5qnLvb4GWR+CtMgWgWVDHfDOg=;
        b=MRKUbYiLk3s2rcxtltfbjzkvQbqQNFAvQ2uEabVUY7KnWMsKUOy5wlPoeqnsQLfFYm
         O9X+G/SOnx0F200a30mMtV0kGZqZeKL+uCpHBFyM87cRcg9jX9klBupL5eqy9stQoXKN
         vYeg3zkiewRv/AOsL0lF4phFhLS046gYL9bf5GpXaaZs3LpM3kd4z9psA/o9oSwW3w9R
         7RaXMSJcsdiErsRaImhIOqOvJLeNIVwfu4odCMf7RZpDAyFE9qDZzMZcsqqS/hHQ5h1i
         e7RKCjHeb1ZvhFrtLeNp9A/hUVgIhs2SBL3Q0x13e5QLk8hSy7iY500UdNQdSbf/IOiZ
         aFSw==
X-Gm-Message-State: AOJu0YwzP6Hb56Wg8mcaoTW70GzSPKOgNJr0uqrPyMfnnKrnaNeIijnn
	Qev05l1vPsIRlXrBF2/7zsVUhvccaTbTkS2hyZYvBSQkA1cpR33jEcCDjfjOvQ==
X-Gm-Gg: AR+sD10n/uWAmwsYzjEJhedhcOmhHTGIoTENSRv9WbPyn4nZf4sOOTgYouY0IKtrlzh
	aNg0vsrM1Xnzu/t4M06g/srHcKpxneDoHtE3Mg0YXFTpPLT/c3v9RA/1zGg9tv9nPS4Mq8MSOWX
	yFZJOhWb/8/xoVWeWV8j98oghrPGX55ffhvbrrcZaFBqLnSbfyh4vj63c/KNLHGq9WSFEHk/cLU
	DeF6kqwOr62arPrCoOoxisIKBd9arWPxzBtLLsi7SyG2y+KVGxKqg6DfLft1s7c4gpX4QxDBxST
	sdVOyCPaMDeF5R1cJFFqHd5sQcvwXzMdm1pqdHZa25mLGt5EP2mOAYEutmStFVR3h/ijytF2/7/
	lmA0quM8eBycnLxcxkyy9Hrw+mrAsRLonbr92xfxpuzKHd4eskeWv4CBf/mfDhkr0thOn/aarX0
	ecIMXIzfwLdHYf+DF23fs/GM3YYZlkwSWT6LTfDwhlLRoI0cVXdflpM4b7EcoxiGukVpkUyTn1E
	Fhirccr4ui9E35K9MICLuZ/pf0E8BbRrsoRTa4dHVA/
X-Received: by 2002:a05:600d:640f:20b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-4980c672adbmr256878095e9.9.1785842681737;
        Tue, 04 Aug 2026 04:24:41 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:810d:ae08:d00:a23e:1b00:ebf4:5b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm91249135e9.0.2026.08.04.04.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:24:40 -0700 (PDT)
From: roosesweb@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Thomas Roos <roosesweb@gmail.com>
Subject: [PATCH] classes/sbom-cve-check: fall back to the stable SBOM symlink
Date: Tue,  4 Aug 2026 13:24:37 +0200
Message-ID: <20260804112437.3357583-1-roosesweb@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 11:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242717

do_sbom_cve_check builds its input path from ${IMAGE_NAME}, which carries
${IMAGE_VERSION_SUFFIX} and so ${DATETIME}. That value is excluded from task
hashes but changes on every bitbake invocation, so the path is only correct when
do_create_image_sbom_spdx ran in the same invocation.

It does not when the class is newly enabled on an existing build tree: the image
SBOM is already deployed and stamped from an earlier build, do_sbom_cve_check has
never run, so bitbake executes only the latter and it looks for a file whose
timestamp belongs to the current invocation. The same happens on any forced re-run
of just this task:

  $ bitbake -f -c sbom_cve_check core-image-minimal
  ERROR: core-image-minimal-1.0-r0 do_sbom_cve_check: sbom-cve-check failed: [...]
  sbom-cve-check: error: [Errno 2] No such file or directory:
    '.../core-image-minimal-qemux86-64.rootfs-20260804101106.spdx.json'

  $ ls tmp/deploy/images/qemux86-64/*.spdx.json
  core-image-minimal-qemux86-64.rootfs-20260804095834.spdx.json
  core-image-minimal-qemux86-64.rootfs.spdx.json -> ...-20260804095834.spdx.json

The file is there under ${IMAGE_LINK_NAME}, the symlink do_create_image_sbom_spdx
maintains. Keep preferring the timestamped name, so behaviour is unchanged whenever
it exists, and fall back to the symlink rather than failing. Guarded on link_name
being set, since IMAGE_LINK_NAME can be empty.

Signed-off-by: Thomas Roos <roosesweb@gmail.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-recipe/sbom-cve-check.bbclass
index 451595f..b184c12 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -14,9 +14,20 @@ python do_sbom_cve_check() {
     """
     Task: Run sbom-cve-check analysis on SBOM.
     """
-    sbom_path = d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.spdx.json")
+    import os
+
     image_name = d.getVar("IMAGE_NAME")
     link_name = d.getVar("IMAGE_LINK_NAME")
+    deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
+
+    # IMAGE_NAME carries DATETIME, which changes on every invocation while being
+    # excluded from task hashes, so this path is only valid when
+    # do_create_image_sbom_spdx ran in the same invocation. Fall back to the
+    # symlink it maintains, which is stable across builds.
+    sbom_path = os.path.join(deploy_dir, "%s.spdx.json" % image_name)
+    if not os.path.exists(sbom_path) and link_name:
+        sbom_path = os.path.join(deploy_dir, "%s.spdx.json" % link_name)
+
     run_sbom_cve_check(d, sbom_path, image_name, link_name)
 }
 
-- 
2.55.0


