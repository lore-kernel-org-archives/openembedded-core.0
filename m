Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web12.8225.1630503925893292960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V7n+32Nw;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso3455195otv.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HZtH6ZzSRFg4XR0p1hSVO639PWjTwEX+KTC4OVWatis=;
        b=V7n+32NwNE5tNrx4OWB245gAjFx12oq124p7cxSME0I730H8mS+NNi8G9O8SRFhbQt
         Zcnx8l3YcGKCPByY5NARDOTP4n6EYxxsZMRMlU3c9SfKcoEl85VwfzmlLibnWMHUKiWw
         UaMB1lsV6gC3/ZIH/DC5KzJ7xTBtAjmobSZ4r5eoKeMtzFvL4DLqvZ2h7aFWbIccqwFD
         TQUD2swmn5XPndlXxsaTT3CZE4eTkiglgOJdBNEAbJwpb0ORFvm2PwgYkS5SiJ7hls25
         1TPIpKdfUAmnosewEp8QWZ4KBmDBe67IPasGLG9U6Fy1IAecfBdo5/W+HOh8/pSwDFfe
         gaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HZtH6ZzSRFg4XR0p1hSVO639PWjTwEX+KTC4OVWatis=;
        b=YajFZcnz8O3n39ZjTPWAf2TnDHHNCiqvyeqN4WQuDkb53eQsMydMbHGuRPkMT5+Edj
         3cKinOwS4MIMk0gEZRgqcAvTuT9IzyK/90WFAtyUurmJ4OBxl5CMkVC4vZtbds/ShB/H
         OLTHOL/C5wNUSKqeAkUnYuVvTq24j0dANrx8n6fbU3vlL+r2EY3fPUwN1oriAu4eISeU
         ByqEnVlhUzI4x735gDpRYpiqdQfICH0dbM7TkhQLow6NEX49OPtezPxBa3ACvfCWBR3f
         1CvVneQ4p4tEjNTPXnXp6Zg+nncoVHa/bwZdniHYH7A84knG43aJ2uo2dMDRcrbQA4Gp
         amUQ==
X-Gm-Message-State: AOAM530np5P/adEy+P/NCPDTJsRJ7PXMtN+WeZtdrTJPgo2VOsACUeJH
	LyRkA8+vNzDHmWUfMxvIwPtG303ENOo=
X-Google-Smtp-Source: ABdhPJwi7BKh6xCd6HjxAu/1Qf21mfhpnIVpUoIVMyx1Y/O8KBXPS5HcWAsPIxdca8w+zwtYJ+hozg==
X-Received: by 2002:a9d:ecc:: with SMTP id 70mr29304541otj.96.1630503925024;
        Wed, 01 Sep 2021 06:45:25 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:24 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 07/31] classes/create-spdx: Add NOASSERTION for unknown debug sources
Date: Wed,  1 Sep 2021 08:44:46 -0500
Message-Id: <20210901134510.29561-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a debug source cannot be found, mark it as NOASSERTION so that other
tools at least know we were unable to locate it.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 36 ++++++++++++++------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 28a2e64f52..3f635045a6 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -190,6 +190,7 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
             continue
 
         for debugsrc in file_data["debugsrc"]:
+            ref_id = "NOASSERTION"
             for search in debug_search_paths:
                 debugsrc_path = search / debugsrc.lstrip("/")
                 if not debugsrc_path.exists():
@@ -205,31 +206,26 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
 
                 file_sha256 = sha.hexdigest()
 
-                if not file_sha256 in sources:
-                    bb.debug(1, "Debug source %s with SHA256 %s not found in any dependency" % (str(debugsrc_path), file_sha256))
-                    continue
+                if file_sha256 in sources:
+                    source_file = sources[file_sha256]
+
+                    doc_ref = package_doc.find_external_document_ref(source_file.doc.documentNamespace)
+                    if doc_ref is None:
+                        doc_ref = oe.spdx.SPDXExternalDocumentRef()
+                        doc_ref.externalDocumentId = "DocumentRef-dependency-" + source_file.doc.name
+                        doc_ref.spdxDocument = source_file.doc.documentNamespace
+                        doc_ref.checksum.algorithm = "SHA1"
+                        doc_ref.checksum.checksumValue = source_file.doc_sha1
+                        package_doc.externalDocumentRefs.append(doc_ref)
 
-                source_file = sources[file_sha256]
-
-                doc_ref = package_doc.find_external_document_ref(source_file.doc.documentNamespace)
-                if doc_ref is None:
-                    doc_ref = oe.spdx.SPDXExternalDocumentRef()
-                    doc_ref.externalDocumentId = "DocumentRef-dependency-" + source_file.doc.name
-                    doc_ref.spdxDocument = source_file.doc.documentNamespace
-                    doc_ref.checksum.algorithm = "SHA1"
-                    doc_ref.checksum.checksumValue = source_file.doc_sha1
-                    package_doc.externalDocumentRefs.append(doc_ref)
-
-                package_doc.add_relationship(
-                    pkg_file,
-                    "GENERATED_FROM",
-                    "%s:%s" % (doc_ref.externalDocumentId, source_file.file.SPDXID),
-                    comment=debugsrc
-                )
+                    ref_id = "%s:%s" % (doc_ref.externalDocumentId, source_file.file.SPDXID),
+                else:
+                    bb.debug(1, "Debug source %s with SHA256 %s not found in any dependency" % (str(debugsrc_path), file_sha256))
                 break
             else:
                 bb.debug(1, "Debug source %s not found" % debugsrc)
 
+            package_doc.add_relationship(pkg_file, "GENERATED_FROM", ref_id, comment=debugsrc)
 
 def collect_dep_recipes(d, doc, spdx_recipe):
     from pathlib import Path
-- 
2.32.0

