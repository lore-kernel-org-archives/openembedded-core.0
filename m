Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7D8C41513
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 16:03:33 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.11597.1720800207761906880
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 09:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cAceWUEd;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-25d6dd59170so1149966fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720800206; x=1721405006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLifC1TxjruMonFT8U23tJUUqGaBbLMn1FCOnDYPeY8=;
        b=cAceWUEdJUUKyq8rfDLPuBIPi+xRY5WkKb/IrgpZY5q+34lGZLLxZ+RKAq7NudTFOx
         x8mprjw49XpEJZR2YxcUpSv6o3naXE2Q9Mao9YSsjk+RdIsEAcRjNwIKCFsKOMf5/Hqf
         qUYsewZZERbYdGAvm0OKLLqK0cUNGUeQ8UfwIeGfHAnJqyb96H3U17UhoGmXKXjcY5b0
         zQG+JywhPRRZAoE2EwY81H39htDNa88W9YOb0lJx1EN588CBoKLYfMGnwR+sE6CqjJAQ
         /FwKb8PP/4Mp0qChMTg3GWVFmMZmYsOVtcFMNYqmWJtfLyR3cCARoM3WSjwcCCCusAaY
         lDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720800206; x=1721405006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLifC1TxjruMonFT8U23tJUUqGaBbLMn1FCOnDYPeY8=;
        b=QEY7hhxop8krFsvOJCLzZXkeaIHA/y8+sRyRJTHRINsYsq8cpGYTCOzLBmRdn7Wum7
         Vnbvr6NGkPj6nx4AAyWCSzA+IEsfNW5V80TcRt1Tw8QLyhMeLUv2gp+uqzQgKjDxMcEy
         o8aeuQKIcg7jnbpQMsfwXaRlWWAWzuzxvq6F50qxo8jOmwisYm9YJD7fAUcl0ZOVpUMN
         rJECi9I2vm52zHYaXjLVkGtYTcYv6QsPFQQc6L7JH9GVdnyqUZSFTiltzb/lUmu1iI1W
         XIZ4XdJiOAqT8SC5jgQZUcSFeY3x6S2kUUT1SodQcnf+L5e2Db8CZglLXAw0R0xl9YKF
         cCZQ==
X-Gm-Message-State: AOJu0Yy8l3sfpkMb/jdMwB9Q0N4UBNh/vpyw6bmf2JXayPmLpoUjtbbG
	ntcfuhqoQUT3+kZ8Gc0z7ojmEL51YOz2vlXHmi2IV6cmzlpr7FecESjckw==
X-Google-Smtp-Source: AGHT+IH7hcEfz0MEn0DCS2P9QTc5gtrBCxVNa3Z/gS3aZ6c8LeIhQFkfWHE4qk8uhL1LWPNr36J+WA==
X-Received: by 2002:a05:6870:918d:b0:25e:1775:b02d with SMTP id 586e51a60fabf-25eae8af595mr9670032fac.32.1720800205954;
        Fri, 12 Jul 2024 09:03:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4a71])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa29d16dsm2267694fac.53.2024.07.12.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:03:25 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 11/12] classes/create-spdx-2.2: Handle empty packages
Date: Fri, 12 Jul 2024 09:58:21 -0600
Message-ID: <20240712160304.3514496-12-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712160304.3514496-1-JPEWhacker@gmail.com>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
 <20240712160304.3514496-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 16:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201845

When combining an SPDX document, the package list might be empty (e.g.
a baremetal image). Handle this case instead of erroring out

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 83 ++++++++++++++--------------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 0382e4cc51a..865323d66a6 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -822,52 +822,53 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
     doc.packages.append(image)
 
-    for name in sorted(packages.keys()):
-        if name not in providers:
-            bb.fatal("Unable to find SPDX provider for '%s'" % name)
+    if packages:
+        for name in sorted(packages.keys()):
+            if name not in providers:
+                bb.fatal("Unable to find SPDX provider for '%s'" % name)
 
-        pkg_name, pkg_hashfn = providers[name]
+            pkg_name, pkg_hashfn = providers[name]
 
-        pkg_spdx_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, pkg_name, pkg_hashfn)
-        if not pkg_spdx_path:
-            bb.fatal("No SPDX file found for package %s, %s" % (pkg_name, pkg_hashfn))
+            pkg_spdx_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, pkg_name, pkg_hashfn)
+            if not pkg_spdx_path:
+                bb.fatal("No SPDX file found for package %s, %s" % (pkg_name, pkg_hashfn))
 
-        pkg_doc, pkg_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
+            pkg_doc, pkg_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
 
-        for p in pkg_doc.packages:
-            if p.name == name:
-                pkg_ref = oe.spdx.SPDXExternalDocumentRef()
-                pkg_ref.externalDocumentId = "DocumentRef-%s" % pkg_doc.name
-                pkg_ref.spdxDocument = pkg_doc.documentNamespace
-                pkg_ref.checksum.algorithm = "SHA1"
-                pkg_ref.checksum.checksumValue = pkg_doc_sha1
+            for p in pkg_doc.packages:
+                if p.name == name:
+                    pkg_ref = oe.spdx.SPDXExternalDocumentRef()
+                    pkg_ref.externalDocumentId = "DocumentRef-%s" % pkg_doc.name
+                    pkg_ref.spdxDocument = pkg_doc.documentNamespace
+                    pkg_ref.checksum.algorithm = "SHA1"
+                    pkg_ref.checksum.checksumValue = pkg_doc_sha1
 
-                doc.externalDocumentRefs.append(pkg_ref)
-                doc.add_relationship(image, "CONTAINS", "%s:%s" % (pkg_ref.externalDocumentId, p.SPDXID))
-                break
-        else:
-            bb.fatal("Unable to find package with name '%s' in SPDX file %s" % (name, pkg_spdx_path))
-
-        runtime_spdx_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, "runtime-" + name, pkg_hashfn)
-        if not runtime_spdx_path:
-            bb.fatal("No runtime SPDX document found for %s, %s" % (name, pkg_hashfn))
-
-        runtime_doc, runtime_doc_sha1 = oe.sbom.read_doc(runtime_spdx_path)
-
-        runtime_ref = oe.spdx.SPDXExternalDocumentRef()
-        runtime_ref.externalDocumentId = "DocumentRef-%s" % runtime_doc.name
-        runtime_ref.spdxDocument = runtime_doc.documentNamespace
-        runtime_ref.checksum.algorithm = "SHA1"
-        runtime_ref.checksum.checksumValue = runtime_doc_sha1
-
-        # "OTHER" isn't ideal here, but I can't find a relationship that makes sense
-        doc.externalDocumentRefs.append(runtime_ref)
-        doc.add_relationship(
-            image,
-            "OTHER",
-            "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.SPDXID),
-            comment="Runtime dependencies for %s" % name
-        )
+                    doc.externalDocumentRefs.append(pkg_ref)
+                    doc.add_relationship(image, "CONTAINS", "%s:%s" % (pkg_ref.externalDocumentId, p.SPDXID))
+                    break
+            else:
+                bb.fatal("Unable to find package with name '%s' in SPDX file %s" % (name, pkg_spdx_path))
+
+            runtime_spdx_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, "runtime-" + name, pkg_hashfn)
+            if not runtime_spdx_path:
+                bb.fatal("No runtime SPDX document found for %s, %s" % (name, pkg_hashfn))
+
+            runtime_doc, runtime_doc_sha1 = oe.sbom.read_doc(runtime_spdx_path)
+
+            runtime_ref = oe.spdx.SPDXExternalDocumentRef()
+            runtime_ref.externalDocumentId = "DocumentRef-%s" % runtime_doc.name
+            runtime_ref.spdxDocument = runtime_doc.documentNamespace
+            runtime_ref.checksum.algorithm = "SHA1"
+            runtime_ref.checksum.checksumValue = runtime_doc_sha1
+
+            # "OTHER" isn't ideal here, but I can't find a relationship that makes sense
+            doc.externalDocumentRefs.append(runtime_ref)
+            doc.add_relationship(
+                image,
+                "OTHER",
+                "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.SPDXID),
+                comment="Runtime dependencies for %s" % name
+            )
     bb.utils.mkdirhier(spdx_workdir)
     image_spdx_path = spdx_workdir / (rootfs_name + ".spdx.json")
 
-- 
2.45.2


