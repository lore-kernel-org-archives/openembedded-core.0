Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9C2C5DF9B
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:23 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14923.1771650622586125396
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hXJ5fDfI;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48375f1defeso19260215e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650620; x=1772255420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrvOYHm9Xyyb9WMaqqfitEy9fQkHxTLIcHHpItQVwwg=;
        b=hXJ5fDfIgSigo+HXnmkfohv0XMXdQbOGdMNorT8rSEPXbwJjYRQ0quXOU4yzqjX4kC
         cj+jEp/yo1vYTjG9Cs+s1l850PsWu3noQGeSTntE6QilQBd7Tz2xVgX8+cjFzCcJObUB
         +2x+q1f1ViOFWsxzr2C22odRdSEdcbdaFBHt8wxUoa9r6rF92sugJbJo4jKHGWSePBpY
         tzyMIWxebjHXE/tldXmKkWklmJrmbd5rITnsliYKLu4p5WjH8U7/joeDFqQnevMfU6W7
         Bqqsiw8wALCRVxiqugxggq1dD4oXqqFXQlJzWID0JO1RcvRt6kzb/M54ALi5kcJ1krgp
         5R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650620; x=1772255420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrvOYHm9Xyyb9WMaqqfitEy9fQkHxTLIcHHpItQVwwg=;
        b=nuyo61OyXc5HhAcWqUFp8xRWuPpeOFXR1kNie9VeGw9eQ+2sRpVFfkN/8qKwp9XKun
         i7HtKFYhX9ON3fPJEB7iw3nUMlqYU1NjLqwim0WYrOKCZdmymlNsLBK1bd6J9O4BeEIK
         cMfGqmJVJeIdybB6zCqq9GdzQ9xdYl+KCnCiOWqptRiwdy8yCknbXOhWNJs90JFYx2aH
         LIRGtPZgDulVUQ19GBDpOzH4OWLiHvNYi70x+bdlKP1RwE0mTgh52Z43si1A2CNt5e8U
         MznVZOdWszxRfgLHX5NwZjEkvsMHATFNEe31LF/6BsUxPJzRpna9bxxCX5X7naxL6l16
         Q/8Q==
X-Gm-Message-State: AOJu0YwsAquiJ8MDvcNurYis+EX9a0GHO550u94Dll8YIiBj19piAYqS
	62WigIBpCivCO236n30hDql94ojvDa0cctVyj3kDAdj+3dlnxIotN3FRgdLT0w==
X-Gm-Gg: AZuq6aL8oU6+jGWN3oPyeyqXnfXJZdNT+Mp2EVtZDoQFhtg6H5WD8rHCbjch995Inbv
	EkntrnHqApFXOh4Br4OMgs9xqGY+brc1yWbKogW6LDggJ0WI87L65caSfzoDgDWbln/Fmp12tvw
	GeWTCmkvVTS0/pkrwNaTFrqYXSOztC6e36ix6d4Y210TwDi9ezdiCXojBEiUs7lOxDxlHCxgJFV
	mM/EGx1snlrDCSrGsYAfZpgugtFmWQ4OVpDD/FEYIL/T+sslqOr9LyJUziAP1o6+wkLKDXt4ng3
	K1R4ZfVIp9X8EyrxQtIq6gXyC7UnYZRCPT5NFIA1XfW0Ltn8H70PytVnjDoKJf6E/mcLPEBaoeq
	CblFxn+qt43Xo+K3p2XocYa37j1ZUHpG+BQdj1P5ZvQgPzJdAqkmJu4Om/VM6rEVCTG6iHjsfQf
	xvQrvCHKB6/6dd42Tzc9dwyjRlpUdH8bGaYZ4=
X-Received: by 2002:a05:600c:45c5:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-483a95eb516mr30459435e9.2.1771650620482;
        Fri, 20 Feb 2026 21:10:20 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:19 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 06/18] sbom30: Fix object deduplication to preserve complete data
Date: Sat, 21 Feb 2026 06:09:54 +0100
Message-ID: <20260221051006.335141-7-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231586

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


