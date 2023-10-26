Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F47C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 10:51:25 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.67709.1698317479172251947
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 03:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mVXDZ5J5;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-507c91582fdso1046315e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 03:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698317477; x=1698922277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEfDBb5tfWAPYiyQkg3PX49ZHxG6/xXRilGcSDJBHzM=;
        b=mVXDZ5J59J2RlPOGi72IE5yOfhh+oqsySu68AEJ7sxtwerJesTJBGTsDCbbgK0wyCq
         VhObnBgLjXlJJMAZI6agaRl7MO5Wz61zNm3capijgKUwc5T8tJZI/kGvGBBqsiC1xKn7
         eoDs3vpidhGVpCqpmPUahQ6Hh6lgUniQzJGFa0s5yToGMokacdoZ9pIzuBFlYDrgbl8w
         BJya/IEiCUdBJVHwtArEVJpDvetfu7fhAHnwIYxWxFfi5SgLvY5lx2e9HnLVDSsVZn90
         GDlj9SXJAJ1W5A2HL4qsVIwcHKXgw3wEiDpu41UY47dRmimrfudjKF1rprbFo2ZwN9eH
         QsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698317477; x=1698922277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEfDBb5tfWAPYiyQkg3PX49ZHxG6/xXRilGcSDJBHzM=;
        b=f3FnzeIAvxfL8s5cGnuDTzhuJNDok7ceYu6/8lTfrKqd4NQrpna/9p/iyevwDFLYj9
         OLFsk+JDeiC6Qda5lRUYK4+4f3mt9Y4EhaizlljYsD6p759E4dA40AA37uvRrP7hHpS5
         YYkvMIDmqXY0pTrAy+aDLJTx2+PpX0fXqgHo8EsfMrkpGemWRWuqnAe6mvmEUhKGByod
         KA0/kBdI03mn+3Zz5qreYh7cpD/54BGb0MQH59ppdBJY2iyrLMN2FEkSRs3nSsbzPMLo
         kDsN+FDeni1nxFOYteM9wJroMX4jHkNC1bk1X1o7teqpUgs0KZp0b0uNo1H6AwypxWwO
         9bGg==
X-Gm-Message-State: AOJu0YwkakpJFp4FsKfASF/yYYvuxItPd9WDBMTUV/SWFsD5BNi8svap
	x2JCtk0lRjI6sqX2s28TdEYgzD1bfxzF2A==
X-Google-Smtp-Source: AGHT+IFQs8RKGwI0x/amxmA2JVkWJBGJox5TZ+Sokj3wHEbfl0fP7e9XHF9ChJu1aBl7LcOrN4Odzw==
X-Received: by 2002:ac2:4adb:0:b0:4f9:54f0:b6db with SMTP id m27-20020ac24adb000000b004f954f0b6dbmr12032067lfp.13.1698317476483;
        Thu, 26 Oct 2023 03:51:16 -0700 (PDT)
Received: from localhost.localdomain ([31.32.81.187])
        by smtp.gmail.com with ESMTPSA id f1-20020adff8c1000000b0032da75af3easm13936004wrq.80.2023.10.26.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:51:15 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Louis Rannou <louis.rannou@syslinbit.com>,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [RFC][OE-core 4/7] create-spdx-3.0: SPDX3 objects as classes
Date: Thu, 26 Oct 2023 12:48:44 +0200
Message-ID: <20231026105033.257971-5-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
References: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 10:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189715

From: Louis Rannou <louis.rannou@syslinbit.com>

Create SPDX3 objects that classes as they are described in the SPDX3 model.

Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 meta/lib/oe/spdx3.py | 385 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 385 insertions(+)
 create mode 100644 meta/lib/oe/spdx3.py

diff --git a/meta/lib/oe/spdx3.py b/meta/lib/oe/spdx3.py
new file mode 100644
index 0000000000..ecbe999258
--- /dev/null
+++ b/meta/lib/oe/spdx3.py
@@ -0,0 +1,385 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+#
+# This library is intended to set the data types for the SPDX3 specification. It
+# is not intended to encode any particular OE specific behaviors, see the
+# sbom.py for that.
+#
+
+from oe.spdx import _String, _StringList, _Object, _ObjectList
+from oe.spdx import SPDXObject
+
+import json
+import hashlib
+
+class SPDX3Tool(SPDXObject):
+    pass
+
+class SPDX3Agent(SPDXObject):
+    pass
+
+#
+# Profile: Core - Enumerations
+#
+SPDX3HashAlgorithm = [
+    "blake2b256",
+    "blake2b384",
+    "blake2b512",
+    "blake3",
+    "crystalsKyber",
+    "crystalsDilithium",
+    "falcon",
+    "md2",
+    "md4",
+    "md5",
+    "md6",
+    "other",
+    "sha1",
+    "sha224",
+    "sha256",
+    "sha3_224",
+    "sha3_256",
+    "sha3_384",
+    "sha3_512",
+    "sha384",
+    "sha512",
+    "spdxPvcSha1",
+    "spdxPvcSha256",
+    "sphincsPlus"
+]
+
+#
+# Profile: Core - Datatypes
+#
+
+class SPDX3IntegrityMethod(SPDXObject):
+    comment = _String()
+
+class SPDX3Hash(SPDX3IntegrityMethod):
+    hashValue = _String()
+    algorithm = _String()
+
+#
+# Profile: Core - Classes
+#
+class SPDX3CreationInfo(SPDXObject):
+    specVersion = _String(default="3.0.0")
+    created = _String()
+    createdBy = _ObjectList(SPDX3Agent)
+    profile = _StringList(default=["core", "software"])  # TODO: not in creationInfo in spec
+    createdUsing = _ObjectList(SPDX3Tool)
+    dataLicense = _String(default="CC0-1.0")
+
+    def serializer(self):
+        """
+        Serialize a creationInfo element.
+        createdBy and createdUsing are only stored with their spdxId.
+        other attributes are ordinary serialized
+        """
+        main = {"type": self.__class__.__name__[len("SPDX3"):],
+                "createdBy": []}
+
+        main["createdBy"] = [c.spdxId for c in self._spdx["createdBy"]]
+        if "createdUsing" in self._spdx and len(self._spdx["createdUsing"]):
+            main["createdUsing"] = [c.spdxId for c in self._spdx["createdUsing"]]
+
+        for (key, value) in self._spdx.items():
+            if not key in ["createdBy", "createdUsing"]:
+                main.update({key: value})
+        return main
+
+class SPDX3ExternalMap(SPDXObject):
+    externalId = _String()
+    verifiedUsing = _ObjectList(SPDX3IntegrityMethod)
+    definingDocument = _String()
+
+class SPDX3Element(SPDXObject):
+    spdxId = _String(default="SPDXRef-DOCUMENT")
+    name = _String()
+    summary = _String()
+    description = _String()
+    creationInfo = _String()
+    verifiedUsing = _ObjectList(SPDX3IntegrityMethod)
+#    packages = _ObjectList(SPDXPackage)
+#    files = _ObjectList(SPDXFile)
+#    relationships = _ObjectList(SPDXRelationship)
+#    externalDocumentRefs = _ObjectList(SPDXExternalDocumentRef)
+#    hasExtractedLicensingInfos = _ObjectList(SPDXExtractedLicensingInfo)
+
+    def serializer(self, rootElement):
+        """
+        Default serialization of an Element
+        creationInfo is moved to the root and refered with its id
+        context and element defined in ElementCollection and Bundle are ignored
+        Element objects are ignored
+        other attributes are ordinary serialized
+        """
+        main = {"type": self.__class__.__name__[len("SPDX3"):]}
+
+        for (key, value) in self._spdx.items():
+            if key == "creationInfo":
+                _id = rootElement.creationinfo(value)
+                main["creationInfo"] = _id
+            elif key not in ["context", "element"] \
+                and not isinstance(value, SPDX3Element):
+                if key[0] == '_':
+                    main.update({key[1:]: value})
+                else:
+                    main.update({key: value})
+        return main
+
+    def add_relationship(self, _from, relationship, _to):
+        if isinstance(_from, SPDX3Element):
+            from_spdxid = _from.spdxId
+        else:
+            from_spdxid = _from
+
+        if isinstance(_to, SPDX3Element):
+            to_spdxid = _to.spdxId
+        else:
+            to_spdxid = _to
+
+        for element in self.element:
+            if isinstance(element, SPDX3Relationship) \
+            and element._from == from_spdxid \
+            and element.relationshipType == relationship:
+                element.to.append(to_spdxid)
+                return element.spdxId
+
+        r = SPDX3Relationship(
+            _from=from_spdxid,
+            relationshipType=relationship,
+            to = [to_spdxid]
+        )
+
+        self.element.append(r)
+        return r.spdxId
+
+    def find_external_map(self, sourceDocumentNamespace):
+        for i in self.imports:
+            if i.definingDocument == sourceDocumentNamespace:
+                return i
+
+class SPDX3Relationship(SPDX3Element):
+    spdxId = _String(default="SPDXRef-Relationship") # TODO: increment id
+    _from = _String()
+    to = _StringList()
+    relationshipType = _String()
+
+class SPDX3Annotation(SPDX3Element):
+    spdxId = _String(default="SPDXRef-Annotation") # TODO: increment id
+    annotationType = _String()
+    statement = _String()
+    subject = _String()
+
+class SPDX3Agent(SPDX3Element):
+    pass
+
+class SPDX3Person(SPDX3Agent):
+    pass
+
+class SPDX3Organization(SPDX3Agent):
+    pass
+
+class SPDX3Tool(SPDX3Element):
+    pass
+
+class SPDX3Artifact(SPDX3Element):
+    suppliedBy = _ObjectList(SPDX3Agent)
+
+class SPDX3ElementCollection(SPDX3Element):
+    element = _ObjectList(SPDX3Element)
+    imports = _ObjectList(SPDX3ExternalMap)
+
+class SPDX3Bundle(SPDX3ElementCollection):
+    context = _String(default="")
+
+class SPDX3SpdxDocument(SPDX3Bundle):
+    documentNamespace = _String()  # TODO: where is this definition ?
+    creationInfo = _Object(SPDX3CreationInfo)
+
+    _spdxcounter = 1
+
+    def __init__(self):
+        self._spdxcreationinfo = {}
+        super().__init__()
+
+    def creationinfo(self, c):
+        """
+        Look for a creationInfo in the dictionary. If it does not exist,
+        create a unique id and append it if it does not exist.
+        Return the id.
+        """
+        for (_id, info) in self._spdxcreationinfo.items():
+            if c == info:
+                return _id
+        _id = "_:CreationInfo{}".format(SPDX3SpdxDocument._spdxcounter)
+        SPDX3SpdxDocument._spdxcounter += 1
+        self._spdxcreationinfo[_id] = c
+        return _id
+
+    def serializer(self, rootElement):
+        """
+        Serialize a SpdxDocument element.
+        context has a specific serialization
+        attributes of type Element are moved to root
+        attributes are are ordinary serialized (context and element are ignored)
+        all elements are moved to root
+        """
+        chunk = {"@context": [self.context, {}]}
+        root = super().serializer(rootElement)
+        chunk["@graph"] = []
+
+        body = []
+        for (_, value) in self._spdx.items():
+            if isinstance(value, SPDX3Element):
+                body.append(value.serializer(rootElement))
+
+        if len(self.element):
+            root["element"] = []
+            for e in self.element:
+                root["element"].append(e.spdxId)
+                body.append(e.serializer(rootElement))
+
+        for (_id, c) in self._spdxcreationinfo.items():
+            cser = {"@id": _id}
+            cser.update(c.serializer())
+            chunk["@graph"].append(cser)
+
+        chunk["@graph"].append(root)
+        chunk["@graph"] = chunk["@graph"] + body
+
+        return chunk
+
+    def to_json(self, f, *, sort_keys=False, indent=None, separators=None):
+        class Encoder(json.JSONEncoder):
+            def __init__(self, rootElement=None, **kwargs):
+                self.rootElement = rootElement
+                super(Encoder, self).__init__(**kwargs)
+
+            def default(self, o):
+                if isinstance(o, SPDX3SpdxDocument):
+                    return o.serializer(self.rootElement)
+                elif isinstance(o, SPDXObject):
+                    root = o.serializer(self.rootElement)
+                    return root
+
+                return super().default(o)
+
+        sha1 = hashlib.sha1()
+        for chunk in Encoder(
+            rootElement=self,
+            sort_keys=sort_keys,
+            indent=indent,
+            separators=separators,
+        ).iterencode(self):
+            chunk = chunk.encode("utf-8")
+            f.write(chunk)
+            sha1.update(chunk)
+
+        return sha1.hexdigest()
+
+    @classmethod
+    def from_json(cls, f, attributes=[]):
+        """
+        Look into a json file for all objects of given type. Return the document
+        element and a dictionary of required objects.
+        """
+        class Decoder(json.JSONDecoder):
+            def __init__(self, *args, **kwargs):
+                super().__init__(object_hook=self.object_hook, *args, **kwargs)
+
+            def object_hook(self, d):
+                if 'type' in d.keys():
+                    if d['type'] in attributes or d['type'] == 'SpdxDocument':
+                        return d
+                if '@graph' in d.keys():
+                    spdxDocument = None
+                    attr = {a: [] for a in attributes}
+                    for p in d['@graph']:
+                        if p is not None:
+                            if p['type'] == 'SpdxDocument':
+                                spdxDocument = p
+                            else:
+                                attr[p['type']].append(p)
+                    return (spdxDocument, attr)
+
+        return json.load(f, cls=Decoder)
+
+#
+# Profile: Software - Datatypes
+#
+SPDX3SoftwarePurpose = [
+    "application",
+    "archive",
+    "bom",
+    "configuration",
+    "container",
+    "data",
+    "device",
+    "documentation",
+    "executable",
+    "file",
+    "firmware",
+    "framework",
+    "install",
+    "library",
+    "module",
+    "operatingSystem",
+    "patch",
+    "source",
+    "other"
+]
+
+class SPDX3SoftwareArtifact(SPDX3Artifact):
+    primaryPurpose = _String()
+    additionalPurpose = _StringList()
+
+class SPDX3Package(SPDX3SoftwareArtifact):
+    packageVersion = _String()
+    homePage = _String()
+    downloadLocation = _String()
+
+class SPDX3File(SPDX3SoftwareArtifact):
+    pass
+
+#
+# OpenEmbedded base class
+#
+class SPDX3Graph(SPDXObject):
+    # TODO: rework: graph should only have a list of objects and more
+    # intelligence in to_json
+    package = _Object(SPDX3Package)
+    creationInfo = _Object(SPDX3CreationInfo)
+    doc = _Object(SPDX3SpdxDocument)
+    tool = _Object(SPDX3Tool)
+    organization = _Object(SPDX3Organization)
+    person = _Object(SPDX3Person)
+
+    def __init__(self, **d):
+        super().__init__(**d)
+
+
+    def to_json(self, f, *, sort_keys=False, indent=None, separators=None):
+        class Encoder(json.JSONEncoder):
+            def default(self, o):
+                if isinstance(o, SPDXObject):
+                    return o.serializer()
+
+                return super().default(o)
+
+        sha1 = hashlib.sha1()
+        for chunk in Encoder(
+            sort_keys=sort_keys,
+            indent=indent,
+            separators=separators,
+        ).iterencode(self):
+            chunk = chunk.encode("utf-8")
+            f.write(chunk)
+            sha1.update(chunk)
+
+        return sha1.hexdigest()
-- 
2.42.0


