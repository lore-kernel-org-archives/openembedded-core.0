Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B78A103E187
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:47:10 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14409.1773841624080905191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gjXgshl2;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-40974bf7781so645680fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773841623; x=1774446423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgZWWYUETcp+KAK54Y1gHYnk1xGLeXOCGllecsNhDhw=;
        b=gjXgshl2ex3TjCtBIVAiMvdUYQMnoU/NxMtDSsz+PIClwxrg9eGfy0D8cG6GoH9wZC
         RH01ogaXctku0a+wI+ytsmChmbwZnwtmIO/k9SYl8WdJYYYyGOtud9PO9dyxQ3E9MEiI
         5bwgA+1vNKx5Pp7B7vbDOvIhfI3fyi4433BBq0hcXF7rDaL2sZNWBdxQ3eeOgAvDifX2
         IbaeCBJX2e3A+guCH9mcws7uffNguK5C+h8ps0EuLSp6UeKwTLCvRKRoWx7ov206SSCx
         loRmn5kajDnfG1G2tbHnDl/QWoI0SWfGI3zczm1mrC70/RXVsevDadcx2IY4zH+5UJ9G
         yJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841623; x=1774446423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RgZWWYUETcp+KAK54Y1gHYnk1xGLeXOCGllecsNhDhw=;
        b=mwNVOfk0oemtgNcFdF59Tb/EeZ3/05sBtHC9KNUwEnp1xr0rGK8C6rc7I3SGeg64Ps
         EzG/T+oQRyRgFYdBUmbOXUF+2SuPfWQPR4Bi//E0bas0au7RUKglfPki1rbZOlwiF8ws
         l4bI4BDprX2LrHmb3oWMK219j3zRls3AjpZ9dfRLETsYCGKQ0AIL9tq1GAy07HJsS3A/
         QYGEXfymFAyLXY+bIcF9PDMgDmxg3M+EFuxG6hfzbRK4Q2qa6PfEZngCmZ12044bcJ4O
         7DBqEmgp5TbIciJrZlKBWqudNXE28XuAIj7AhPNiBy1jU9GNwkppGoD+SvBPrsK0IbB5
         CtgA==
X-Gm-Message-State: AOJu0Yzs1M1IknuioPD14WIrHvyuuhxOcne7MIxLaLxkqgOOcXZ/vqX1
	OB382P3aW8I62eohkOHRjPkNezBscpaDt0BzzB6pIW4boG7Qn3rIdFzZhiI8qQ==
X-Gm-Gg: ATEYQzzavRWwbT7idm5+uFap3h4/cG/Xa2h4UJJD0kAugeHk29Q9FlBJOgpA7fqYpHp
	poRcX+st0mcwympK4bxDzLsELrkL+WFC8WwGFsysTaiMi1h4i8kYlNV60wTwFZbbLdh1GAgkFTn
	wZshn5hROuuRERyUA4XfX1mMPB4IoPrJBzFjlXJdAK3nc+yRbMFr2U7C80j96Dl7IQemdYIZTxg
	bIsoGjbQUZV6QfIvDbpx82BdP65sVSHFPsDu31FrtTPP83yE2jQpbk4h/TdIDOsxjvkhQIUFxc0
	13iwkqeaBIOk4/G0fq6qmRPwPl3Mcw1P7OfRQGsX6zi+ASFyp6EesBLNKw7BRwbAaRfXms9z0St
	K5GeMdUuZfnuwpDg4DBj/v7YN8llEMSRnaEn7DXvw8Qa3O7doZJ2PwFNlXGNluxg4Cu+3a/yz1r
	/ViraRek+Kb/UmJg7vc9UI4PWl4hV//HU=
X-Received: by 2002:a05:6820:f04:b0:67b:a85e:6ca5 with SMTP id 006d021491bc7-67c0d04d23cmr2212913eaf.18.1773841623057;
        Wed, 18 Mar 2026 06:47:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::8279])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c0d89c739sm1763625eaf.13.2026.03.18.06.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:47:02 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 05/12] spdx: De-duplicate CreationInfo
Date: Wed, 18 Mar 2026 07:44:33 -0600
Message-ID: <20260318134655.953233-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318134655.953233-1-JPEWhacker@gmail.com>
References: <20260310184058.533343-1-JPEWhacker@gmail.com>
 <20260318134655.953233-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233395

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


