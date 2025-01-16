Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A43DC02187
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 16:07:51 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.52990.1737043663501297312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 08:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l94gNvBt;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71e10e6a1ceso324029a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 08:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737043662; x=1737648462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yco90KQpzpmduzP+K9K9cEH9NAyN/FBLoo8HhxfBzHo=;
        b=l94gNvBtalafEjwQz0B6D4C3KXjAiDMuaNHB2bFlUL1Xju5V95KkUaSUO/qUnO9oMy
         PPsds1bBQQp3CJ7x6hPgVKCAHIm6FW0QRAssfNxagkUmsdMzFj8KX1mOtNZe+6eQ8t7D
         l91snct0JLb5jVNORocOJT4AsWxj7HxFoETPSFk2nQ6E3okZQqp42CBX6To/blOwdW4w
         +pPIxyudN+Q+ccJts7HPfiS7C5txHFxzw3YiFLHQOEuj8gEpvC2zCESqfqf0HxUZS9lK
         krfj7xdJqoo6LltkezMfj0sjHi8dE0uRFqWTZdhWug7SamLTHr5hokFFIiFh0c+tta/B
         zhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737043662; x=1737648462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yco90KQpzpmduzP+K9K9cEH9NAyN/FBLoo8HhxfBzHo=;
        b=S9GymdMuc6gfnh0fKtSWQY1rLo2cVcI+PNmFbT6bnZ4POA81s2pmQYvKEvvV3ypwNX
         kb7Uu0k1DX6+Ug9QeKu/iQbUkVacer853/vfg7UzdV/KxmaBrIeUvovzoCI9J7i8ZDpE
         M0YrWELs8dmfXy2SASp8SXRr9v8esbx8QjmAFWT2NrWtVRD+AvJDWVtgNfpsoSj4acLg
         GsOaNYiImUJKN6VZR7eoTrhPHgXBgzpOQr9DKkafk8t+D2tqGZbFsQYeqgCqUqfv7zR/
         TZn1ejWJdKdg/H9+26AUh9KiF1mVvPJkd5A5kXAvRPii0BmPBcPt0VqJZLScy0+OGRiC
         PmiA==
X-Gm-Message-State: AOJu0Yw+8Cwx0jF6nPFKyPrNlvaDC3bHCfw0kGy0xPTEwX+HS2aOh434
	SHNHBHUBKSTw4CtcSBm7taP39KO+uKsQ48R/We2XIJ8LXT+I9CO1pX7sZA==
X-Gm-Gg: ASbGncv3G5H8mhajd8SBbzfTX4sGo+IbUvv65c1aZM4Ra6zDF2TzCu/3eE9A3zo2Enq
	Ai7U32NsZ/zZIqqPvzqt2ZRGNxlTgfVd4eyrsrzS+NoLZoAIIovoh5Tp0IqSOO/qR9wHbuWpLIq
	ryTIEYB9pT9hhXbxDA1Lqc9dvBknu/hKxdZGql/VVpJ/Su1hklignKM4/Kh5cOye9ySwXlZkXtJ
	BpbOgjv73SWJz+xHe3Tn6XnedkQVA0Zs9NC0XBTNA6gN5WO8CUC27M=
X-Google-Smtp-Source: AGHT+IHLUT8miR3kwrMXPQlah3ytK5ho4F8SPIm2885cgBF4KL73NSgZuONVdsvvAzql4fAInDrkpQ==
X-Received: by 2002:a05:6830:6216:b0:718:6da0:72b with SMTP id 46e09a7af769-721e2e17a17mr20867691a34.7.1737043661745;
        Thu, 16 Jan 2025 08:07:41 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::11f3])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fa35f063c9sm81699eaf.10.2025.01.16.08.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:07:39 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib: spdx: Upgrade to final 3.0.1 release
Date: Thu, 16 Jan 2025 09:07:33 -0700
Message-ID: <20250116160733.2452799-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 16:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209968

The 3.0.1 release of SPDX has been officially released with a few minor
modifications. Regenerate the bindings to use this version.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py |   2 +-
 meta/lib/oe/spdx30.py | 146 ++++++++++++++++++++++++------------------
 2 files changed, 85 insertions(+), 63 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 7993e1fbefd..f7c4b323d56 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -495,7 +495,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             return []
 
         if not to:
-            to = [oe.spdx30.Element.NoneElement]
+            to = [oe.spdx30.IndividualElement.NoneElement]
 
         ret = []
 
diff --git a/meta/lib/oe/spdx30.py b/meta/lib/oe/spdx30.py
index 5cd2eb45c36..cd97eebd186 100644
--- a/meta/lib/oe/spdx30.py
+++ b/meta/lib/oe/spdx30.py
@@ -133,8 +133,9 @@ class DateTimeProp(Property):
         if value.utcoffset() is None:
             value = value.astimezone()
         offset = value.utcoffset()
-        if offset % timedelta(minutes=1):
-            offset = offset - (offset % timedelta(minutes=1))
+        seconds = offset % timedelta(minutes=-1 if offset.total_seconds() < 0 else 1)
+        if seconds:
+            offset = offset - seconds
             value = value.replace(tzinfo=timezone(offset))
         value = value.replace(microsecond=0)
         return value
@@ -922,6 +923,12 @@ class SHACLExtensibleObject(object):
         return obj
 
     def _decode_properties(self, decoder, objectset=None):
+        def decode_value(d):
+            if not d.is_list():
+                return d.read_value()
+
+            return [decode_value(val_d) for val_d in d.read_list()]
+
         if self.CLOSED:
             super()._decode_properties(decoder, objectset=objectset)
             return
@@ -936,7 +943,7 @@ class SHACLExtensibleObject(object):
                 )
 
             with decoder.read_property(key) as prop_d:
-                self.__dict__["_obj_data"][key] = prop_d.read_value()
+                self.__dict__["_obj_data"][key] = decode_value(prop_d)
 
     def _encode_properties(self, encoder, state):
         def encode_value(encoder, v):
@@ -948,6 +955,11 @@ class SHACLExtensibleObject(object):
                 encoder.write_integer(v)
             elif isinstance(v, float):
                 encoder.write_float(v)
+            elif isinstance(v, list):
+                with encoder.write_list() as list_s:
+                    for i in v:
+                        with list_s.write_list_item() as item_s:
+                            encode_value(item_s, i)
             else:
                 raise TypeError(
                     f"Unsupported serialized type {type(v)} with value '{v}'"
@@ -1197,7 +1209,7 @@ class SHACLObjectSet(object):
 
         return SHACLObjectSet(new_objects, link=True)
 
-    def encode(self, encoder, force_list=False):
+    def encode(self, encoder, force_list=False, *, key=None):
         """
         Serialize a list of objects to a serialization encoder
 
@@ -1244,7 +1256,7 @@ class SHACLObjectSet(object):
         else:
             objects = list(self.objects)
 
-        objects.sort()
+        objects.sort(key=key)
 
         if use_list:
             # Ensure top level objects are only written in the top level graph
@@ -1265,7 +1277,7 @@ class SHACLObjectSet(object):
                     with list_s.write_list_item() as item_s:
                         o.encode(item_s, state)
 
-        else:
+        elif objects:
             objects[0].encode(encoder, state)
 
     def decode(self, decoder):
@@ -1409,6 +1421,15 @@ class Decoder(ABC):
         """
         pass
 
+    @abstractmethod
+    def is_list(self):
+        """
+        Checks if the next item is a list
+
+        Returns True if the next item is a list, or False if it is a scalar
+        """
+        pass
+
     @abstractmethod
     def read_object(self):
         """
@@ -1507,12 +1528,15 @@ class JSONLDDecoder(Decoder):
         return None
 
     def read_list(self):
-        if isinstance(self.data, (list, tuple, set)):
+        if self.is_list():
             for v in self.data:
                 yield self.__class__(v)
         else:
             yield self
 
+    def is_list(self):
+        return isinstance(self.data, (list, tuple, set))
+
     def __get_value(self, *keys):
         for k in keys:
             if k and k in self.data:
@@ -1962,18 +1986,11 @@ CONTEXT_URLS = [
 
 
 # CLASSES
-@register("http://spdx.invalid./AbstractClass", abstract=False)
-class http_spdx_invalid_AbstractClass(SHACLObject):
-    NODE_KIND = NodeKind.BlankNodeOrIRI
-    NAMED_INDIVIDUALS = {
-    }
-
-
 # A class for describing the energy consumption incurred by an AI model in
 # different stages of its lifecycle.
 @register("https://spdx.org/rdf/3.0.1/terms/AI/EnergyConsumption", compact_type="ai_EnergyConsumption", abstract=False)
 class ai_EnergyConsumption(SHACLObject):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -2010,7 +2027,7 @@ class ai_EnergyConsumption(SHACLObject):
 # used for measurement.
 @register("https://spdx.org/rdf/3.0.1/terms/AI/EnergyConsumptionDescription", compact_type="ai_EnergyConsumptionDescription", abstract=False)
 class ai_EnergyConsumptionDescription(SHACLObject):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -2093,7 +2110,7 @@ class AnnotationType(SHACLObject):
 # Provides information about the creation of the Element.
 @register("https://spdx.org/rdf/3.0.1/terms/Core/CreationInfo", compact_type="CreationInfo", abstract=False)
 class CreationInfo(SHACLObject):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -2147,7 +2164,7 @@ class CreationInfo(SHACLObject):
 # A key with an associated value.
 @register("https://spdx.org/rdf/3.0.1/terms/Core/DictionaryEntry", compact_type="DictionaryEntry", abstract=False)
 class DictionaryEntry(SHACLObject):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -2177,15 +2194,7 @@ class Element(SHACLObject):
     NODE_KIND = NodeKind.IRI
     ID_ALIAS = "spdxId"
     NAMED_INDIVIDUALS = {
-        "NoAssertionElement": "https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionElement",
-        "NoneElement": "https://spdx.org/rdf/3.0.1/terms/Core/NoneElement",
     }
-    # An Individual Value for Element representing a set of Elements of unknown
-    # identify or cardinality (number).
-    NoAssertionElement = "https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionElement"
-    # An Individual Value for Element representing a set of Elements with
-    # cardinality (number/count) of zero.
-    NoneElement = "https://spdx.org/rdf/3.0.1/terms/Core/NoneElement"
 
     @classmethod
     def _register_props(cls):
@@ -2276,10 +2285,10 @@ class ElementCollection(Element):
             "element",
             ListProp(ObjectProp(Element, False, context=[
                     ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement", "NoneElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
                     ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganization", "SpdxOrganization"),
                     ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionElement", "NoAssertionElement"),
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
                 ],)),
             iri="https://spdx.org/rdf/3.0.1/terms/Core/element",
             compact="element",
@@ -2308,10 +2317,10 @@ class ElementCollection(Element):
             "rootElement",
             ListProp(ObjectProp(Element, False, context=[
                     ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement", "NoneElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
                     ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganization", "SpdxOrganization"),
                     ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionElement", "NoAssertionElement"),
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
                 ],)),
             iri="https://spdx.org/rdf/3.0.1/terms/Core/rootElement",
             compact="rootElement",
@@ -2321,7 +2330,7 @@ class ElementCollection(Element):
 # A reference to a resource identifier defined outside the scope of SPDX-3.0 content that uniquely identifies an Element.
 @register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifier", compact_type="ExternalIdentifier", abstract=False)
 class ExternalIdentifier(SHACLObject):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -2425,7 +2434,7 @@ class ExternalIdentifierType(SHACLObject):
 # external to that SpdxDocument.
 @register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalMap", compact_type="ExternalMap", abstract=False)
 class ExternalMap(SHACLObject):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -2469,7 +2478,7 @@ class ExternalMap(SHACLObject):
 # A reference to a resource outside the scope of SPDX-3.0 content related to an Element.
 @register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef", compact_type="ExternalRef", abstract=False)
 class ExternalRef(SHACLObject):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -2774,10 +2783,28 @@ class HashAlgorithm(SHACLObject):
     sha512 = "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha512"
 
 
+# A concrete subclass of Element used by Individuals in the
+# Core profile.
+@register("https://spdx.org/rdf/3.0.1/terms/Core/IndividualElement", compact_type="IndividualElement", abstract=False)
+class IndividualElement(Element):
+    NODE_KIND = NodeKind.IRI
+    ID_ALIAS = "spdxId"
+    NAMED_INDIVIDUALS = {
+        "NoAssertionElement": "https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionElement",
+        "NoneElement": "https://spdx.org/rdf/3.0.1/terms/Core/NoneElement",
+    }
+    # An Individual Value for Element representing a set of Elements of unknown
+    # identify or cardinality (number).
+    NoAssertionElement = "https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionElement"
+    # An Individual Value for Element representing a set of Elements with
+    # cardinality (number/count) of zero.
+    NoneElement = "https://spdx.org/rdf/3.0.1/terms/Core/NoneElement"
+
+
 # Provides an independently reproducible mechanism that permits verification of a specific Element.
 @register("https://spdx.org/rdf/3.0.1/terms/Core/IntegrityMethod", compact_type="IntegrityMethod", abstract=True)
 class IntegrityMethod(SHACLObject):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -2823,7 +2850,7 @@ class LifecycleScopeType(SHACLObject):
 # A mapping between prefixes and namespace partial URIs.
 @register("https://spdx.org/rdf/3.0.1/terms/Core/NamespaceMap", compact_type="NamespaceMap", abstract=False)
 class NamespaceMap(SHACLObject):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -2852,7 +2879,7 @@ class NamespaceMap(SHACLObject):
 # An SPDX version 2.X compatible verification method for software packages.
 @register("https://spdx.org/rdf/3.0.1/terms/Core/PackageVerificationCode", compact_type="PackageVerificationCode", abstract=False)
 class PackageVerificationCode(IntegrityMethod):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -2911,7 +2938,7 @@ class PackageVerificationCode(IntegrityMethod):
 # A tuple of two positive integers that define a range.
 @register("https://spdx.org/rdf/3.0.1/terms/Core/PositiveIntegerRange", compact_type="PositiveIntegerRange", abstract=False)
 class PositiveIntegerRange(SHACLObject):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -2977,7 +3004,7 @@ class ProfileIdentifierType(SHACLObject):
     core = "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType/core"
     # the element follows the Dataset profile specification
     dataset = "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType/dataset"
-    # the element follows the expanded Licensing profile specification
+    # the element follows the ExpandedLicensing profile specification
     expandedLicensing = "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType/expandedLicensing"
     # the element follows the Extension profile specification
     extension = "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType/extension"
@@ -2985,7 +3012,7 @@ class ProfileIdentifierType(SHACLObject):
     lite = "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType/lite"
     # the element follows the Security profile specification
     security = "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType/security"
-    # the element follows the simple Licensing profile specification
+    # the element follows the SimpleLicensing profile specification
     simpleLicensing = "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType/simpleLicensing"
     # the element follows the Software profile specification
     software = "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType/software"
@@ -3025,10 +3052,10 @@ class Relationship(Element):
             "from_",
             ObjectProp(Element, True, context=[
                     ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement", "NoneElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
                     ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganization", "SpdxOrganization"),
                     ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionElement", "NoAssertionElement"),
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
                 ],),
             iri="https://spdx.org/rdf/3.0.1/terms/Core/from",
             min_count=1,
@@ -3114,10 +3141,10 @@ class Relationship(Element):
             "to",
             ListProp(ObjectProp(Element, False, context=[
                     ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement", "NoneElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
                     ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganization", "SpdxOrganization"),
                     ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionElement", "NoAssertionElement"),
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
                 ],)),
             iri="https://spdx.org/rdf/3.0.1/terms/Core/to",
             min_count=1,
@@ -3343,8 +3370,8 @@ class SpdxDocument(ElementCollection):
         cls._add_property(
             "dataLicense",
             ObjectProp(simplelicensing_AnyLicenseInfo, False, context=[
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
                     ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
                 ],),
             iri="https://spdx.org/rdf/3.0.1/terms/Core/dataLicense",
             compact="dataLicense",
@@ -3587,7 +3614,7 @@ class expandedlicensing_ListedLicenseException(expandedlicensing_LicenseAddition
 # A property name with an associated value.
 @register("https://spdx.org/rdf/3.0.1/terms/Extension/CdxPropertyEntry", compact_type="extension_CdxPropertyEntry", abstract=False)
 class extension_CdxPropertyEntry(SHACLObject):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -3614,7 +3641,7 @@ class extension_CdxPropertyEntry(SHACLObject):
 # A characterization of some aspect of an Element that is associated with the Element in a generalized fashion.
 @register("https://spdx.org/rdf/3.0.1/terms/Extension/Extension", compact_type="extension_Extension", abstract=True)
 class extension_Extension(SHACLExtensibleObject, SHACLObject):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -3724,13 +3751,7 @@ class security_VulnAssessmentRelationship(Relationship):
         # found.
         cls._add_property(
             "security_assessedElement",
-            ObjectProp(Element, False, context=[
-                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement", "NoneElement"),
-                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganization", "SpdxOrganization"),
-                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionElement", "NoAssertionElement"),
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
-                ],),
+            ObjectProp(software_SoftwareArtifact, False),
             iri="https://spdx.org/rdf/3.0.1/terms/Security/assessedElement",
             compact="security_assessedElement",
         )
@@ -3826,7 +3847,7 @@ class simplelicensing_SimpleLicensingText(Element):
 # A canonical, unique, immutable identifier
 @register("https://spdx.org/rdf/3.0.1/terms/Software/ContentIdentifier", compact_type="software_ContentIdentifier", abstract=False)
 class software_ContentIdentifier(IntegrityMethod):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -4134,10 +4155,10 @@ class Annotation(Element):
             "subject",
             ObjectProp(Element, True, context=[
                     ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement", "NoneElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
                     ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganization", "SpdxOrganization"),
                     ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionElement", "NoAssertionElement"),
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
                 ],),
             iri="https://spdx.org/rdf/3.0.1/terms/Core/subject",
             min_count=1,
@@ -4245,7 +4266,7 @@ class Bundle(ElementCollection):
 # A mathematically calculated representation of a grouping of data.
 @register("https://spdx.org/rdf/3.0.1/terms/Core/Hash", compact_type="Hash", abstract=False)
 class Hash(IntegrityMethod):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -4366,8 +4387,8 @@ class expandedlicensing_ConjunctiveLicenseSet(simplelicensing_AnyLicenseInfo):
         cls._add_property(
             "expandedlicensing_member",
             ListProp(ObjectProp(simplelicensing_AnyLicenseInfo, False, context=[
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
                     ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
                 ],)),
             iri="https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/member",
             min_count=2,
@@ -4400,8 +4421,8 @@ class expandedlicensing_DisjunctiveLicenseSet(simplelicensing_AnyLicenseInfo):
         cls._add_property(
             "expandedlicensing_member",
             ListProp(ObjectProp(simplelicensing_AnyLicenseInfo, False, context=[
-                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
                     ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/NoneLicense", "expandedlicensing_NoneLicense"),
                 ],)),
             iri="https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/member",
             min_count=2,
@@ -4603,7 +4624,7 @@ class expandedlicensing_WithAdditionOperator(simplelicensing_AnyLicenseInfo):
 # A type of extension consisting of a list of name value pairs.
 @register("https://spdx.org/rdf/3.0.1/terms/Extension/CdxPropertiesExtension", compact_type="extension_CdxPropertiesExtension", abstract=False)
 class extension_CdxPropertiesExtension(extension_Extension):
-    NODE_KIND = NodeKind.BlankNode
+    NODE_KIND = NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS = {
     }
 
@@ -4831,7 +4852,7 @@ class security_SsvcVulnAssessmentRelationship(security_VulnAssessmentRelationshi
         )
 
 
-# Asbtract ancestor class for all VEX relationships
+# Abstract ancestor class for all VEX relationships
 @register("https://spdx.org/rdf/3.0.1/terms/Security/VexVulnAssessmentRelationship", compact_type="security_VexVulnAssessmentRelationship", abstract=True)
 class security_VexVulnAssessmentRelationship(security_VulnAssessmentRelationship):
     NODE_KIND = NodeKind.IRI
@@ -5040,13 +5061,14 @@ class security_VexAffectedVulnAssessmentRelationship(security_VexVulnAssessmentR
             "security_actionStatement",
             StringProp(),
             iri="https://spdx.org/rdf/3.0.1/terms/Security/actionStatement",
+            min_count=1,
             compact="security_actionStatement",
         )
         # Records the time when a recommended action was communicated in a VEX statement
         # to mitigate a vulnerability.
         cls._add_property(
             "security_actionStatementTime",
-            ListProp(DateTimeStampProp(pattern=r"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\dZ$",)),
+            DateTimeStampProp(pattern=r"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\dZ$",),
             iri="https://spdx.org/rdf/3.0.1/terms/Security/actionStatementTime",
             compact="security_actionStatementTime",
         )
-- 
2.47.1


