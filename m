Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC95C5DF7F
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:24:33 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14437.1771647871507280055
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b1eDbSMf;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483703e4b08so21399325e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647869; x=1772252669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrvOYHm9Xyyb9WMaqqfitEy9fQkHxTLIcHHpItQVwwg=;
        b=b1eDbSMf5ZPMTw6tdglI7qqalCEjoe7+4lmkn9526iVVRc/yP74MDQGOHt+amV3Zq2
         M7fTO08BJIhW056wflaUsES6NdIWwRbzpqKanm0d+3F2UzVGE+PrrEhW+5K8YGRqRw+Y
         kzGp+lM8WTKTiXnMe1rMIB5kC0VgNK2sEwJq2wlwGgWL3hZ9VeeM946jFhLEREIa1xHH
         sEMbC07A7SXifk1DSPSXTLx08WTZtZg+zdfGS6nePsKeryobzVw318Nb2AqEES4MUZu6
         pU3OvN4ImjyjX3SMP6F2FABitwTkatnE0gUExNWYzTsCPYQ2aCdwJAXshAvToUTrGSEy
         E0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647869; x=1772252669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrvOYHm9Xyyb9WMaqqfitEy9fQkHxTLIcHHpItQVwwg=;
        b=iq9q+a5GVpUAxkD+tH6cj/jxW3YWk5j52ieUsvRwRxwNzvbH0y03kmf/F+1v/6oHay
         tlHjcSF+dx5wBh6XF4bCXvXW6DOxDmSQEtaeL68mjDBOS0p8RjzzbK/M8oDN8OsZoLfb
         QNq8JSo3L5msRPImZ/lx+PBY3BDcBRC2py//AABpr4Rduu62aDAcGaiUj8PrO/MSEHS2
         pUr9kvCDqsgdLBS2DkTPHv6XlZd1Aid+Lti6fZVoApgJAhjQEIAg3DxUuH4S6T3aMEp3
         tAdto7mvQ5kIlbt8CodUt8uuGtuUr9npp2suBnwkdBgbUtE5nj6pawETXIexYBGiBsQd
         YmgQ==
X-Gm-Message-State: AOJu0YxI4GtM8iqDaCGekEWOWo0w2LCvSARMP6iz0blwNC7aF8bFszlO
	hOrUZ/qc62mbyXiKRFvrO3piueq1Az+YCEWBAaB8k2fWswiLh9NTPO0RRbJQSA==
X-Gm-Gg: AZuq6aKLu9mE2CMrq97mVEz13VV3ZO2iogdNzL5xNmY0hFHY6WO/Ce7lRSIbaXEB+XS
	qKZubKpEgfTnwpuN8FVOBoRI88zhVEygnbVtTT1+5EKFP73VBAUNuyIAKD62rRC6ZLXcjzBuPtv
	A779C6OlunOkSvJM/eQChOX4vB4a15ZoqTT90X1CTH8RkKsUQYHDF8snS+muAqB7ZdZJc8LQdPN
	MLa3Oe+RNAnZxqWX0kyblQ7e/VCG8q0cqlsBLE1CVYShACWd8U9ohqABOiMMSaJuSvvQGHSVJwP
	X8CM29jqdBk/8SqLCRtPf/xS3659wafEQaPb05vcW0WMlQR+3BfhmBRUwpLMyAKYoYfFkP45Did
	NChyJW6haNDv0Gy9lTERFPXsbz03XAEG7yzQ3WHH9kKryDGUh2JBt48F+bv2Zlws9NN+lCQ3IT6
	69GaYPbaokkRUJZtiwlTMmV/54XuCMK6x1t6E=
X-Received: by 2002:a05:600c:4f13:b0:483:7b99:131d with SMTP id 5b1f17b1804b1-483a94d9b6cmr38814965e9.16.1771647869542;
        Fri, 20 Feb 2026 20:24:29 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm117340865e9.15.2026.02.20.20.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:24:28 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 06/14] sbom30: Fix object deduplication to preserve complete data
Date: Sat, 21 Feb 2026 05:24:10 +0100
Message-ID: <20260221042418.317535-7-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221042418.317535-1-stondo@gmail.com>
References: <20260221042418.317535-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231562

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

When consolidating SPDX documents via expand_collection(), objects
with the same SPDX ID can appear in multiple source documents with
different levels of completeness. The previous implementation used
simple set union (self.objects |= other.objects), which would keep
an arbitrary version when duplicates existed.

This caused data loss during consolidation, particularly affecting
externalIdentifier arrays where one version might have a basic PURL
while another has multiple PURLs with Git metadata qualifiers.

Fix by implementing intelligent object merging that:
- Detects objects with duplicate SPDX IDs
- Compares completeness based on externalIdentifier count
- Keeps the more complete version (more externalIdentifiers)
- Preserves objects without IDs as-is

This ensures that consolidated SBOMs contain the most complete
metadata available from all source documents.

The bug was discovered while testing multi-PURL support where
packages can have varying externalIdentifier counts (base PURL
vs base + Git commit + Git branch PURLs), but affects any
scenario with duplicate SPDX IDs during consolidation.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/sbom30.py | 47 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 227ac51877..c77e18f4e8 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -822,7 +822,52 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
                 if not e.externalSpdxId in imports:
                     imports[e.externalSpdxId] = e
 
-            self.objects |= other.objects
+            # Merge objects intelligently: if same SPDX ID exists, keep the one with more complete data
+            #
+            # WHY DUPLICATES OCCUR: When consolidating SPDX documents (e.g., recipe -> package -> image),
+            # the same package can be referenced at different build stages, each with varying levels of
+            # detail. Early stages may have basic PURLs, while later stages add Git metadata qualifiers.
+            # This is architectural - multi-stage builds naturally create multiple representations of
+            # the same entity.
+            #
+            # However, preserve object identity for types that get referenced (like CreationInfo)
+            # to avoid breaking serialization
+            other_by_id = {}
+            for obj in other.objects:
+                obj_id = getattr(obj, '_id', None)
+                if obj_id:
+                    other_by_id[obj_id] = obj
+
+            self_by_id = {}
+            for obj in self.objects:
+                obj_id = getattr(obj, '_id', None)
+                if obj_id:
+                    self_by_id[obj_id] = obj
+
+            # Merge: for duplicate IDs, prefer the object with more externalIdentifier entries
+            # but only for Element types (not CreationInfo, Agent, Tool, etc.)
+            for obj_id, other_obj in other_by_id.items():
+                if obj_id in self_by_id:
+                    self_obj = self_by_id[obj_id]
+                    # Only replace Elements with more complete data
+                    # Do NOT replace CreationInfo or other supporting types to preserve object identity
+                    if isinstance(self_obj, oe.spdx30.Element):
+                        # If both have externalIdentifier, keep the one with more entries
+                        self_ext_ids = getattr(self_obj, 'externalIdentifier', [])
+                        other_ext_ids = getattr(other_obj, 'externalIdentifier', [])
+                        if len(other_ext_ids) > len(self_ext_ids):
+                            # Replace self object with other (more complete) object
+                            self.objects.discard(self_obj)
+                            self.objects.add(other_obj)
+                    # For non-Element types (CreationInfo, Agent, Tool), keep existing to preserve identity
+                else:
+                    # New object, just add it
+                    self.objects.add(other_obj)
+
+            # Add any objects without IDs
+            for obj in other.objects:
+                if not getattr(obj, '_id', None):
+                    self.objects.add(obj)
 
         for o in add_objectsets:
             merge_doc(o)
-- 
2.53.0


