Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAA7FD8FE8
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 17:39:42 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75807.1772127579255217582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 09:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Af+8PmYA;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d1890f5cafso441128a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 09:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772127578; x=1772732378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgZWWYUETcp+KAK54Y1gHYnk1xGLeXOCGllecsNhDhw=;
        b=Af+8PmYA0k4fJhEPeX+gDNQGlICcvQu1cIRBgbAA4CqSDMhEogOiNqbtjMHi4KnfMm
         0TNcRSEOzKRnSt+OgNwOWwk7T0B5SP/QrPL1qAds3f35Dqs8qBQ2deCu9IPT0CgAtOTz
         3i6iEqhRM00dD2StKuxHGqXDKQfTLTODRRmBpGB5UHOvDiTHwjBXOp9P1kKPWNC/tqip
         GtjVvmEoQWtsNH559yT88xIFGIX+gP6wiDBVTWIhitrG+Nmou1ZTCHK+E2PPFUE6qE+H
         Db8vSett7GzFgEAN72M7ocN5lt982D5rLiZ02UGkV8CR8SmP4c0qNTw/ew7P5tgUzI8h
         4WFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772127578; x=1772732378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RgZWWYUETcp+KAK54Y1gHYnk1xGLeXOCGllecsNhDhw=;
        b=LVlTA/kFmxjeCun3OmrcBsAp9geJ4n1fogM8l/ul3E3+0pyLEruXhOBjyfYio7yseP
         BfSxRADW4tLLsF+JTKwZ1bk5y1gZsp/ZthyYklBi+/YJDysOdr832a1QT80onNZlu/DR
         6nk1f14Xp0NVwENsXB5IenDqz7ylkRprZOv3YWWx8Go7ASTzAn6ls4nvlFudsfG2352Z
         j0kp+JRRXGb0Pp1w2LTe5Nj9bepizaUwg9Ll721T6clIeO37O1zOpRBmWo/h10IUCHiR
         h+sbcsvwxlcyd2wBCVjjYWGauxfVYxDDRoYbsRe+VXQQXED/VB6ejVsd2QjdXuOEEILQ
         so9g==
X-Gm-Message-State: AOJu0YxocHNz8n8MXiIVQ9Vpfe7cTtHa7MhRVqhL60VOtBUxBdIUpix8
	kB/t82uIX1IoM+9CMDnmXAbYdKOwg5dqXVMOz08cNODwWRht6tiXZGW2RaJjoQ==
X-Gm-Gg: ATEYQzxSJanKannFUnf/Pfq5euma9O67T+V0h3p6uVT8ay8WgW7diauamUEBkkwl77F
	fNugXVQVLTSUhiE1KmQXvo4rrX/dY5a/PqN708zpFRsBDJEWnS5vhZzPcZ5ACfovBdSwa5gPmVR
	SbIOZclDBeO2Bzux9ikB7RTnT4mofbFLMUTaXftIexn7OWnuLs7vEsIU3gVvALFnEYor2zX0GwI
	ura2bvOztiDWLiaC+BdvzL8+mbXSf9+FHCdeEH8YbP0KzYdehBh1sAmVQQCIspp5Dzr6M8Jg/A+
	gzNT53tQp8uMPkpAty3jc+vn8R3d6LB4swXxYnMMStFcGVQeqX3TQ1V8z6G/DrM0HTtJ44cyGZp
	Mfio/MDMNnsoU8Au/Fhkxzf6ovcPpqAtzT8foMzojIdxt9s0cBs8H/dITN171QBbCQMORqhbT2k
	H4jHUGJasI6nEUcgyKrbmT
X-Received: by 2002:a05:6830:4707:b0:7cf:dc0c:8cfe with SMTP id 46e09a7af769-7d582a92228mr2840784a34.34.1772127578308;
        Thu, 26 Feb 2026 09:39:38 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::6492])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d586653f81sm2173027a34.23.2026.02.26.09.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:39:37 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 7/8] spdx: De-duplicate CreationInfo
Date: Thu, 26 Feb 2026 10:33:08 -0700
Message-ID: <20260226173930.2847872-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226173930.2847872-1-JPEWhacker@gmail.com>
References: <20260224230234.679049-1-JPEWhacker@gmail.com>
 <20260226173930.2847872-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232053

De-duplicates CreationInfo objects that are identical (except for ID)
when writing out an SBoM. This significantly reduces the number of
CreationInfo objects that end up in the final document.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py | 112 ++++++++++++++++++++++++++++++------------
 meta/lib/oe/spdx30.py |   2 +-
 2 files changed, 81 insertions(+), 33 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 21f084dc16..55a2863d2d 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -14,6 +14,7 @@ import uuid
 import os
 import oe.spdx_common
 from datetime import datetime, timezone
+from contextlib import contextmanager
 
 OE_SPDX_BASE = "https://rdf.openembedded.org/spdx/3.0/"
 
@@ -191,6 +192,25 @@ def to_list(l):
     return l
 
 
+class Dedup(object):
+    def __init__(self, objset):
+        self.unique = set()
+        self.dedup = {}
+        self.objset = objset
+
+    def find_duplicates(self, cmp, typ, **kwargs):
+        for o in self.objset.foreach_filter(typ, **kwargs):
+            for u in self.unique:
+                if cmp(u, o):
+                    self.dedup[o] = u
+                    break
+            else:
+                self.unique.add(o)
+
+    def get(self, o):
+        return self.dedup.get(o, o)
+
+
 class ObjectSet(oe.spdx30.SHACLObjectSet):
     def __init__(self, d):
         super().__init__()
@@ -895,6 +915,45 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         self.missing_ids -= set(imports.keys())
         return self.missing_ids
 
+    @contextmanager
+    def deduplicate(self):
+        d = Dedup(self)
+
+        yield d
+
+        visited = set()
+
+        def visit(o, path):
+            if isinstance(o, oe.spdx30.SHACLObject):
+                if o in visited:
+                    return False
+                visited.add(o)
+
+                for k in o:
+                    v = o[k]
+                    if isinstance(v, oe.spdx30.SHACLObject):
+                        o[k] = d.get(v)
+
+            elif isinstance(o, oe.spdx30.ListProxy):
+                for idx, v in enumerate(o):
+                    if isinstance(v, oe.spdx30.SHACLObject):
+                        o[idx] = d.get(v)
+
+            return True
+
+        if d.dedup:
+            for o in self.objects:
+                o.walk(visit)
+
+            for k, v in d.dedup.items():
+                bb.debug(
+                    1,
+                    f"Removing duplicate {k.__class__.__name__} {k._id or id(k)} -> {v._id or id(v)}",
+                )
+                self.objects.discard(k)
+
+            self.create_index()
+
 
 def load_jsonld(d, path, required=False):
     deserializer = oe.spdx30.JSONLDDeserializer()
@@ -1080,39 +1139,28 @@ def create_sbom(d, name, root_elements, add_objectsets=[]):
     # SBoM should be the only root element of the document
     objset.doc.rootElement = [sbom]
 
-    # De-duplicate licenses
-    unique = set()
-    dedup = {}
-    for lic in objset.foreach_type(oe.spdx30.simplelicensing_LicenseExpression):
-        for u in unique:
-            if (
-                u.simplelicensing_licenseExpression
-                == lic.simplelicensing_licenseExpression
-                and u.simplelicensing_licenseListVersion
-                == lic.simplelicensing_licenseListVersion
-            ):
-                dedup[lic] = u
-                break
-        else:
-            unique.add(lic)
-
-    if dedup:
-        for rel in objset.foreach_filter(
-            oe.spdx30.Relationship,
-            relationshipType=oe.spdx30.RelationshipType.hasDeclaredLicense,
-        ):
-            rel.to = [dedup.get(to, to) for to in rel.to]
-
-        for rel in objset.foreach_filter(
-            oe.spdx30.Relationship,
-            relationshipType=oe.spdx30.RelationshipType.hasConcludedLicense,
-        ):
-            rel.to = [dedup.get(to, to) for to in rel.to]
+    def cmp_license_expression(a, b):
+        return (
+            a.simplelicensing_licenseExpression == b.simplelicensing_licenseExpression
+            and a.simplelicensing_licenseListVersion
+            == b.simplelicensing_licenseListVersion
+        )
 
-        for k, v in dedup.items():
-            bb.debug(1, f"Removing duplicate License {k._id} -> {v._id}")
-            objset.objects.remove(k)
+    def cmp_creation_info(a, b):
+        data_a = {k: a[k] for k in a}
+        data_b = {k: b[k] for k in b}
+        data_a["@id"] = ""
+        data_b["@id"] = ""
+        return data_a == data_b
+
+    with objset.deduplicate() as dedup:
+        # De-duplicate licenses
+        dedup.find_duplicates(
+            cmp_license_expression,
+            oe.spdx30.simplelicensing_LicenseExpression,
+        )
 
-        objset.create_index()
+        # Deduplicate creation info
+        dedup.find_duplicates(cmp_creation_info, oe.spdx30.CreationInfo)
 
     return objset, sbom
diff --git a/meta/lib/oe/spdx30.py b/meta/lib/oe/spdx30.py
index cd97eebd18..1f58402ffc 100644
--- a/meta/lib/oe/spdx30.py
+++ b/meta/lib/oe/spdx30.py
@@ -701,7 +701,7 @@ class SHACLObject(object):
         self.__dict__["_obj_data"][iri] = prop.init()
 
     def __iter__(self):
-        return self._OBJ_PROPERTIES.keys()
+        return iter(self._OBJ_PROPERTIES.keys())
 
     def walk(self, callback, path=None):
         """
-- 
2.53.0


