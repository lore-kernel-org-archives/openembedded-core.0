Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6418C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:48:14 +0000 (UTC)
Received: from 12.mo581.mail-out.ovh.net (12.mo581.mail-out.ovh.net [178.33.107.167])
 by mx.groups.io with SMTP id smtpd.web11.9573.1698792484899971171
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 178.33.107.167, mailfrom: louis.rannou@syslinbit.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.146.19])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 6115028148
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:03 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nzml2 (unknown [10.110.208.94])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DC2E91FD81;
	Tue, 31 Oct 2023 22:48:02 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-nzml2 with ESMTPSA
	id IMn4MSKEQWUYnR8APQBgzw
	(envelope-from <louis.rannou@syslinbit.com>); Tue, 31 Oct 2023 22:48:02 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S002abf99821-60fc-41c4-90bf-6f9c483945ea,
                    E382B8EC8DEDBA5F41C2577A0B4F295D8A9180D4) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	jpewhacker@gmail.com,
	Louis Rannou <louis.rannou@syslinbit.com>,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [OE-core][RFC v2 04/12] create-spdx-3.0: SPDX3 objects as classes
Date: Tue, 31 Oct 2023 23:47:25 +0100
Message-ID: <20231031224733.367227-5-louis.rannou@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031224733.367227-1-louis.rannou@syslinbit.com>
References: <20231031224733.367227-1-louis.rannou@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9521454037681954057
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtfedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqeenucggtffrrghtthgvrhhnpeekteeuueeghfehiefhkeevkeeluefgieegvddugfeiueduvdffjeekleeiieduueenucffohhmrghinheppggptghlrghsshgppgdrpggpnhgrmhgvnecukfhppeduvdejrddtrddtrddupdeghedrkedurdeivddrledpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189879

Create SPDX3 objects that classes as they are described in the SPDX3 mode=
l.

Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 meta/lib/oe/spdx3.py | 386 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 386 insertions(+)
 create mode 100644 meta/lib/oe/spdx3.py

diff --git a/meta/lib/oe/spdx3.py b/meta/lib/oe/spdx3.py
new file mode 100644
index 0000000000..a027c0ee5b
--- /dev/null
+++ b/meta/lib/oe/spdx3.py
@@ -0,0 +1,386 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+#
+# This library is intended to set the data types for the SPDX3 specifica=
tion. It
+# is not intended to encode any particular OE specific behaviors, see th=
e
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
+SPDX3HashAlgorithm =3D [
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
+    comment =3D _String()
+
+class SPDX3Hash(SPDX3IntegrityMethod):
+    hashValue =3D _String()
+    algorithm =3D _String()
+
+#
+# Profile: Core - Classes
+#
+class SPDX3CreationInfo(SPDXObject):
+    specVersion =3D _String(default=3D"3.0.0")
+    created =3D _String()
+    createdBy =3D _ObjectList(SPDX3Agent)
+    profile =3D _StringList(default=3D["core", "software"])  # TODO: not=
 in creationInfo in spec
+    createdUsing =3D _ObjectList(SPDX3Tool)
+    dataLicense =3D _String(default=3D"CC0-1.0")
+
+    def serializer(self):
+        """
+        Serialize a creationInfo element.
+        createdBy and createdUsing are only stored with their spdxId.
+        other attributes are ordinary serialized
+        """
+        main =3D {"type": self.__class__.__name__[len("SPDX3"):],
+                "createdBy": []}
+
+        main["createdBy"] =3D [c.spdxId for c in self._spdx["createdBy"]=
]
+        if "createdUsing" in self._spdx and len(self._spdx["createdUsing=
"]):
+            main["createdUsing"] =3D [c.spdxId for c in self._spdx["crea=
tedUsing"]]
+
+        for (key, value) in self._spdx.items():
+            if not key in ["createdBy", "createdUsing"]:
+                main.update({key: value})
+        return main
+
+class SPDX3ExternalMap(SPDXObject):
+    externalId =3D _String()
+    verifiedUsing =3D _ObjectList(SPDX3IntegrityMethod)
+    definingDocument =3D _String()
+
+class SPDX3Element(SPDXObject):
+    spdxId =3D _String(default=3D"SPDXRef-DOCUMENT")
+    name =3D _String()
+    summary =3D _String()
+    description =3D _String()
+    creationInfo =3D _String()
+    verifiedUsing =3D _ObjectList(SPDX3IntegrityMethod)
+#    packages =3D _ObjectList(SPDXPackage)
+#    files =3D _ObjectList(SPDXFile)
+#    relationships =3D _ObjectList(SPDXRelationship)
+#    externalDocumentRefs =3D _ObjectList(SPDXExternalDocumentRef)
+#    hasExtractedLicensingInfos =3D _ObjectList(SPDXExtractedLicensingIn=
fo)
+
+    def serializer(self, rootElement, ignorekeys=3D[]):
+        """
+        Default serialization of an Element
+        creationInfo is moved to the root and refered with its id
+        context and element defined in ElementCollection and Bundle are =
ignored
+        Element objects are ignored
+        other attributes are ordinary serialized
+        """
+        main =3D {"type": self.__class__.__name__[len("SPDX3"):]}
+
+        for (key, value) in self._spdx.items():
+            if key =3D=3D "creationInfo":
+                _id =3D rootElement.creationinfo(value)
+                main["creationInfo"] =3D _id
+            elif key not in ignorekeys \
+                and not isinstance(value, SPDX3Element):
+                if key[0] =3D=3D '_':
+                    main.update({key[1:]: value})
+                else:
+                    main.update({key: value})
+        return main
+
+    def add_relationship(self, _from, relationship, _to):
+        if isinstance(_from, SPDX3Element):
+            from_spdxid =3D _from.spdxId
+        else:
+            from_spdxid =3D _from
+
+        if isinstance(_to, SPDX3Element):
+            to_spdxid =3D _to.spdxId
+        else:
+            to_spdxid =3D _to
+
+        for element in self.element:
+            if isinstance(element, SPDX3Relationship) \
+            and element._from =3D=3D from_spdxid \
+            and element.relationshipType =3D=3D relationship:
+                element.to.append(to_spdxid)
+                return element.spdxId
+
+        r =3D SPDX3Relationship(
+            _from=3Dfrom_spdxid,
+            relationshipType=3Drelationship,
+            to =3D [to_spdxid]
+        )
+
+        self.element.append(r)
+        return r.spdxId
+
+    def find_external_map(self, sourceDocumentNamespace):
+        for i in self.imports:
+            if i.definingDocument =3D=3D sourceDocumentNamespace:
+                return i
+
+class SPDX3Relationship(SPDX3Element):
+    spdxId =3D _String(default=3D"SPDXRef-Relationship") # TODO: increme=
nt id
+    _from =3D _String()
+    to =3D _StringList()
+    relationshipType =3D _String()
+
+class SPDX3Annotation(SPDX3Element):
+    spdxId =3D _String(default=3D"SPDXRef-Annotation") # TODO: increment=
 id
+    annotationType =3D _String()
+    statement =3D _String()
+    subject =3D _String()
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
+    suppliedBy =3D _ObjectList(SPDX3Agent)
+
+class SPDX3ElementCollection(SPDX3Element):
+    element =3D _ObjectList(SPDX3Element)
+    imports =3D _ObjectList(SPDX3ExternalMap)
+
+class SPDX3Bundle(SPDX3ElementCollection):
+    context =3D _String(default=3D"")
+
+class SPDX3SpdxDocument(SPDX3Bundle):
+    documentNamespace =3D _String()  # TODO: where is this definition ?
+    creationInfo =3D _Object(SPDX3CreationInfo)
+
+    _spdxcounter =3D 1
+
+    def __init__(self):
+        self._spdxcreationinfo =3D {}
+        super().__init__()
+
+    def creationinfo(self, c):
+        """
+        Look for a creationInfo in the dictionary. If it does not exist,
+        create a unique id and append it if it does not exist.
+        Return the id.
+        """
+        for (_id, info) in self._spdxcreationinfo.items():
+            if c =3D=3D info:
+                return _id
+        _id =3D "_:CreationInfo{}".format(SPDX3SpdxDocument._spdxcounter=
)
+        SPDX3SpdxDocument._spdxcounter +=3D 1
+        self._spdxcreationinfo[_id] =3D c
+        return _id
+
+    def serializer(self, rootElement):
+        """
+        Serialize a SpdxDocument element.
+        context has a specific serialization
+        attributes of type Element are moved to root
+        attributes are are ordinary serialized (context and element are =
ignored)
+        all elements are moved to root
+        """
+        chunk =3D {"@context": [self.context, {}]}
+        root =3D super().serializer(rootElement)
+        chunk["@graph"] =3D []
+
+        body =3D []
+        for (_, value) in self._spdx.items():
+            if isinstance(value, SPDX3Element):
+                body.append(value.serializer(rootElement, ignorekeys=3D[=
"context", "element"]))
+
+        if len(self.element):
+            root["element"] =3D []
+            for e in self.element:
+                root["element"].append(e.spdxId)
+                body.append(e.serializer(rootElement, ignorekeys=3D["con=
text", "element"]))
+
+        for (_id, c) in self._spdxcreationinfo.items():
+            cser =3D {"@id": _id}
+            cser.update(c.serializer())
+            chunk["@graph"].append(cser)
+
+        chunk["@graph"].append(root)
+        chunk["@graph"] =3D chunk["@graph"] + body
+
+        return chunk
+
+    def to_json(self, f, *, sort_keys=3DFalse, indent=3DNone, separators=
=3DNone):
+        class Encoder(json.JSONEncoder):
+            def __init__(self, rootElement=3DNone, **kwargs):
+                self.rootElement =3D rootElement
+                super(Encoder, self).__init__(**kwargs)
+
+            def default(self, o):
+                if isinstance(o, SPDX3SpdxDocument):
+                    return o.serializer(self.rootElement)
+                elif isinstance(o, SPDXObject):
+                    root =3D o.serializer(self.rootElement)
+                    return root
+
+                return super().default(o)
+
+        sha1 =3D hashlib.sha1()
+        for chunk in Encoder(
+            rootElement=3Dself,
+            sort_keys=3Dsort_keys,
+            indent=3Dindent,
+            separators=3Dseparators,
+        ).iterencode(self):
+            chunk =3D chunk.encode("utf-8")
+            f.write(chunk)
+            sha1.update(chunk)
+
+        return sha1.hexdigest()
+
+    @classmethod
+    def from_json(cls, f, attributes=3D[]):
+        """
+        Look into a json file for all objects of given type. Return the =
document
+        element and a dictionary of required objects.
+        """
+        class Decoder(json.JSONDecoder):
+            def __init__(self, *args, **kwargs):
+                super().__init__(object_hook=3Dself.object_hook, *args, =
**kwargs)
+
+            def object_hook(self, d):
+                if 'type' in d.keys():
+                    if d['type'] in attributes or d['type'] =3D=3D 'Spdx=
Document':
+                        return d
+                if '@graph' in d.keys():
+                    spdxDocument =3D None
+                    attr =3D {a: [] for a in attributes}
+                    for p in d['@graph']:
+                        if p is not None:
+                            if p['type'] =3D=3D 'SpdxDocument':
+                                spdxDocument =3D p
+                            else:
+                                attr[p['type']].append(p)
+                    return (spdxDocument, attr)
+
+        return json.load(f, cls=3DDecoder)
+
+#
+# Profile: Software - Datatypes
+#
+SPDX3SoftwarePurpose =3D [
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
+    primaryPurpose =3D _String()
+    additionalPurpose =3D _StringList()
+
+class SPDX3Package(SPDX3SoftwareArtifact):
+    packageVersion =3D _String()
+    homePage =3D _String()
+    downloadLocation =3D _String()
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
+    package =3D _Object(SPDX3Package)
+    creationInfo =3D _Object(SPDX3CreationInfo)
+    doc =3D _Object(SPDX3SpdxDocument)
+    tool =3D _Object(SPDX3Tool)
+    organization =3D _Object(SPDX3Organization)
+    person =3D _Object(SPDX3Person)
+
+    def __init__(self, **d):
+        super().__init__(**d)
+
+
+    def to_json(self, f, *, sort_keys=3DFalse, indent=3DNone, separators=
=3DNone):
+        class Encoder(json.JSONEncoder):
+            def default(self, o):
+                if isinstance(o, SPDXObject):
+                    return o.serializer()
+
+                return super().default(o)
+
+        sha1 =3D hashlib.sha1()
+        for chunk in Encoder(
+            sort_keys=3Dsort_keys,
+            indent=3Dindent,
+            separators=3Dseparators,
+        ).iterencode(self):
+            chunk =3D chunk.encode("utf-8")
+            f.write(chunk)
+            sha1.update(chunk)
+
+        return sha1.hexdigest()
+
--=20
2.42.0


