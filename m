Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955B4CDD1C6
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 15:53:15 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.72407.1727452388480049383
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 08:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ag7VYqoD;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-286f1431bceso1304280fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 08:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727452387; x=1728057187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7scdERdyfGw8WUnbtritamxHnrrTBxFEKL2YOpSIa4=;
        b=Ag7VYqoDWi8GkYOkbGm/JJ5a3/v/aCMNYg1i2Xxq9VSKTQHV46OkNfuAaw/ssPzdbM
         ivuu7a0xIFy93lt289a+Rn1XXMxBSx5TWWu/tG7nRAJVUdu/EcC3HTnezuzkoIddt8Be
         ZymubsmENAKazGoEUPpKyBnIu6+8Tg5EVa4JChfClh6VUyJgyuam288rEenIMZdFbYF3
         MqkxFSwdYSWnnl4IsSU7HgY9Do1q2oJPAhg95JGfKiV0SJDVgqP5yUG+ic2+47rlOftu
         BV+Gl3tCguy5O7Tc+SZcGHnWFL2UttnlkHIvWumA1Z7+GJuOGhBgLHl94qIqnU5oBEjT
         fEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727452387; x=1728057187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7scdERdyfGw8WUnbtritamxHnrrTBxFEKL2YOpSIa4=;
        b=ibLpYbawArCNz6dEkstd/8tXP66AaWTgoRTt3gcn2L9SWyAkEjjgBZA87JyNweSPd6
         uDzhPBGfsJMAFWRpyKOKjtduyXJ3Vdme0j+i5HbVIj/5gTQtLv1CSHvHyMS7M8Ja44RX
         4fLf1Zc1L8hPVd+pkG2FQ80ZJIDmOWEctzGuNJpoYafM8+yc9fQgYw3dZhVuYdOtJ6a8
         qTB6t+pBpEMjYYJJIYCl4e/qphn8JI7l3PKuHKT8YBxKI4VchV99RjIebnHf7xlGpo0+
         7mArg0bk1v1LJhkqLXT7jinkI19pmLKuT4ovQH7mT+4mxDDf+Xfd9ncm2eHsWe33TGiF
         DEgw==
X-Gm-Message-State: AOJu0YyCGPjYvPWl70LPRFd7eQkXzy9X6EWKAR74dCtp6HqOsXEiH3YG
	gcQGJl5SXOJLuK3dIoS5AsxGm/nqU6CkOzg7FvO1Amn3cHQqoOpDBZiB5Q==
X-Google-Smtp-Source: AGHT+IEWRq+sKn5Gwr1yKZ4JdyenbdwnYPs0T+EIyDUMVNkL/X/4vEjOSIcjk6ZvVmMU+Cf7dkAW2g==
X-Received: by 2002:a05:6870:e310:b0:25e:23b4:cf3e with SMTP id 586e51a60fabf-28710bd9a0fmr2947438fac.44.1727452383685;
        Fri, 27 Sep 2024 08:53:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::8a23])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2870f778f1bsm698589fac.1.2024.09.27.08.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 08:53:01 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 3/4] create-spdx-3.0: Upgrade to SPDX 3.0.1
Date: Fri, 27 Sep 2024 09:51:56 -0600
Message-ID: <20240927155247.1012846-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240927155247.1012846-1-JPEWhacker@gmail.com>
References: <20240927155247.1012846-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 15:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205033

Upgrades the SPDX 3.0 implementation from 3.0.0 -> 3.0.1. This version
introduced some breaking changes. Effectively, 3.0.0 was a pre-release
version that we do not need to support any longer.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass |    2 +-
 meta/lib/oe/sbom30.py                |   15 +-
 meta/lib/oe/spdx30.py                | 3375 +++++++++++---------------
 meta/lib/oe/spdx30_tasks.py          |   40 +-
 4 files changed, 1493 insertions(+), 1939 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spd=
x-3.0.bbclass
index c1241e58563..5f0590198fc 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -6,7 +6,7 @@
=20
 inherit spdx-common
=20
-SPDX_VERSION =3D "3.0.0"
+SPDX_VERSION =3D "3.0.1"
=20
 # The list of SPDX profiles generated documents will conform to
 SPDX_PROFILES ?=3D "core build software simpleLicensing security"
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 76bfb752ef1..7b4f78cc718 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -359,7 +359,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         if not spdxid:
             bb.fatal(f"{key} is not a valid SPDX_IMPORTS key")
=20
-        for i in self.docs.imports:
+        for i in self.docs.import_:
             if i.externalSpdxId =3D=3D spdxid:
                 # Already imported
                 return spdxid
@@ -380,7 +380,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
                     )
                 )
=20
-        self.doc.imports.append(m)
+        self.doc.import_.append(m)
         return spdxid
=20
     def new_agent(self, varname, *, creation_info=3DNone, add=3DTrue):
@@ -521,8 +521,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             return []
=20
         if not to:
-            # TODO: Switch to the code constant once SPDX 3.0.1 is released
-            to =3D ["https://spdx.org/rdf/3.0.0/terms/Core/NoneElement"]
+            to =3D [oe.spdx30.Element.NoneElement]
=20
         ret =3D []
=20
@@ -726,7 +725,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         bb_objset =3D load_jsonld(
             self.d, deploy_dir_spdx / "bitbake.spdx.json", required=3DTrue
         )
-        self.doc.imports.extend(bb_objset.doc.imports)
+        self.doc.import_.extend(bb_objset.doc.import_)
         self.update(bb_objset.objects)
=20
         return bb_objset
@@ -827,12 +826,12 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         Returns the set of ids that could not be found to link into the do=
cument
         """
         missing_spdxids =3D set()
-        imports =3D {e.externalSpdxId: e for e in self.doc.imports}
+        imports =3D {e.externalSpdxId: e for e in self.doc.import_}
=20
         def merge_doc(other):
             nonlocal imports
=20
-            for e in other.doc.imports:
+            for e in other.doc.import_:
                 if not e.externalSpdxId in imports:
                     imports[e.externalSpdxId] =3D e
=20
@@ -876,7 +875,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
                 f"Linked document doesn't match missing SPDX ID list. Got:=
 {missing}\nExpected: {missing_spdxids}"
             )
=20
-        self.doc.imports =3D sorted(imports.values(), key=3Dlambda e: e.ex=
ternalSpdxId)
+        self.doc.import_ =3D sorted(imports.values(), key=3Dlambda e: e.ex=
ternalSpdxId)
=20
         return missing_spdxids
=20
diff --git a/meta/lib/oe/spdx30.py b/meta/lib/oe/spdx30.py
index ae74ce36f46..5cd2eb45c36 100644
--- a/meta/lib/oe/spdx30.py
+++ b/meta/lib/oe/spdx30.py
@@ -220,13 +220,34 @@ class FloatProp(Property):
         return decoder.read_float()
=20
=20
-class ObjectProp(Property):
+class IRIProp(Property):
+    def __init__(self, context=3D[], *, pattern=3DNone):
+        super().__init__(pattern=3Dpattern)
+        self.context =3D context
+
+    def compact(self, value):
+        for iri, compact in self.context:
+            if value =3D=3D iri:
+                return compact
+        return None
+
+    def expand(self, value):
+        for iri, compact in self.context:
+            if value =3D=3D compact:
+                return iri
+        return None
+
+    def iri_values(self):
+        return (iri for iri, _ in self.context)
+
+
+class ObjectProp(IRIProp):
     """
     A scalar SHACL object property of a SHACL object
     """
=20
-    def __init__(self, cls, required):
-        super().__init__()
+    def __init__(self, cls, required, context=3D[]):
+        super().__init__(context)
         self.cls =3D cls
         self.required =3D required
=20
@@ -264,8 +285,7 @@ class ObjectProp(Property):
             raise ValueError("Object cannot be None")
=20
         if isinstance(value, str):
-            value =3D _NI_ENCODE_CONTEXT.get(value, value)
-            encoder.write_iri(value)
+            encoder.write_iri(value, self.compact(value))
             return
=20
         return value.encode(encoder, state)
@@ -275,7 +295,7 @@ class ObjectProp(Property):
         if iri is None:
             return self.cls.decode(decoder, objectset=3Dobjectset)
=20
-        iri =3D _NI_DECODE_CONTEXT.get(iri, iri)
+        iri =3D self.expand(iri) or iri
=20
         if objectset is None:
             return iri
@@ -445,36 +465,27 @@ class ListProp(Property):
         return ListProxy(self.prop, data=3Ddata)
=20
=20
-class EnumProp(Property):
+class EnumProp(IRIProp):
     VALID_TYPES =3D str
=20
     def __init__(self, values, *, pattern=3DNone):
-        super().__init__(pattern=3Dpattern)
-        self.values =3D values
+        super().__init__(values, pattern=3Dpattern)
=20
     def validate(self, value):
         super().validate(value)
=20
-        valid_values =3D (iri for iri, _ in self.values)
+        valid_values =3D self.iri_values()
         if value not in valid_values:
             raise ValueError(
                 f"'{value}' is not a valid value. Choose one of {' '.join(=
valid_values)}"
             )
=20
     def encode(self, encoder, value, state):
-        for iri, compact in self.values:
-            if iri =3D=3D value:
-                encoder.write_enum(value, self, compact)
-                return
-
-        encoder.write_enum(value, self)
+        encoder.write_enum(value, self, self.compact(value))
=20
     def decode(self, decoder, *, objectset=3DNone):
         v =3D decoder.read_enum(self)
-        for iri, compact in self.values:
-            if v =3D=3D compact:
-                return iri
-        return v
+        return self.expand(v) or v
=20
=20
 class NodeKind(Enum):
@@ -1946,539 +1957,26 @@ def print_tree(objects, all_fields=3DFalse):
=20
=20
 CONTEXT_URLS =3D [
-    "https://spdx.org/rdf/3.0.0/spdx-context.jsonld",
+    "https://spdx.org/rdf/3.0.1/spdx-context.jsonld",
 ]
=20
-_NI_ENCODE_CONTEXT =3D {
-    "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/kilowattHour": "ai=
_EnergyUnitType:kilowattHour",
-    "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/megajoule": "ai_En=
ergyUnitType:megajoule",
-    "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/other": "ai_Energy=
UnitType:other",
-    "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentType/high": "=
ai_SafetyRiskAssessmentType:high",
-    "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentType/low": "a=
i_SafetyRiskAssessmentType:low",
-    "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentType/medium":=
 "ai_SafetyRiskAssessmentType:medium",
-    "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentType/serious"=
: "ai_SafetyRiskAssessmentType:serious",
-    "https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType/other": "Annotat=
ionType:other",
-    "https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType/review": "Annota=
tionType:review",
-    "https://spdx.org/rdf/3.0.0/terms/Core/NoAssertionElement": "spdx:Core=
/NoAssertionElement",
-    "https://spdx.org/rdf/3.0.0/terms/Core/NoneElement": "spdx:Core/NoneEl=
ement",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/cpe22": =
"ExternalIdentifierType:cpe22",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/cpe23": =
"ExternalIdentifierType:cpe23",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/cve": "E=
xternalIdentifierType:cve",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/email": =
"ExternalIdentifierType:email",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/gitoid":=
 "ExternalIdentifierType:gitoid",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/other": =
"ExternalIdentifierType:other",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/packageU=
rl": "ExternalIdentifierType:packageUrl",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/security=
Other": "ExternalIdentifierType:securityOther",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/swhid": =
"ExternalIdentifierType:swhid",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/swid": "=
ExternalIdentifierType:swid",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/urlSchem=
e": "ExternalIdentifierType:urlScheme",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/altDownloadLoca=
tion": "ExternalRefType:altDownloadLocation",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/altWebPage": "E=
xternalRefType:altWebPage",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/binaryArtifact"=
: "ExternalRefType:binaryArtifact",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/bower": "Extern=
alRefType:bower",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/buildMeta": "Ex=
ternalRefType:buildMeta",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/buildSystem": "=
ExternalRefType:buildSystem",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/certificationRe=
port": "ExternalRefType:certificationReport",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/chat": "Externa=
lRefType:chat",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/componentAnalys=
isReport": "ExternalRefType:componentAnalysisReport",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/cwe": "External=
RefType:cwe",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/documentation":=
 "ExternalRefType:documentation",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/dynamicAnalysis=
Report": "ExternalRefType:dynamicAnalysisReport",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/eolNotice": "Ex=
ternalRefType:eolNotice",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/exportControlAs=
sessment": "ExternalRefType:exportControlAssessment",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/funding": "Exte=
rnalRefType:funding",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/issueTracker": =
"ExternalRefType:issueTracker",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/license": "Exte=
rnalRefType:license",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/mailingList": "=
ExternalRefType:mailingList",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/mavenCentral": =
"ExternalRefType:mavenCentral",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/metrics": "Exte=
rnalRefType:metrics",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/npm": "External=
RefType:npm",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/nuget": "Extern=
alRefType:nuget",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/other": "Extern=
alRefType:other",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/privacyAssessme=
nt": "ExternalRefType:privacyAssessment",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/productMetadata=
": "ExternalRefType:productMetadata",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/purchaseOrder":=
 "ExternalRefType:purchaseOrder",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/qualityAssessme=
ntReport": "ExternalRefType:qualityAssessmentReport",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/releaseHistory"=
: "ExternalRefType:releaseHistory",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/releaseNotes": =
"ExternalRefType:releaseNotes",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/riskAssessment"=
: "ExternalRefType:riskAssessment",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/runtimeAnalysis=
Report": "ExternalRefType:runtimeAnalysisReport",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/secureSoftwareA=
ttestation": "ExternalRefType:secureSoftwareAttestation",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/securityAdversa=
ryModel": "ExternalRefType:securityAdversaryModel",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/securityAdvisor=
y": "ExternalRefType:securityAdvisory",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/securityFix": "=
ExternalRefType:securityFix",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/securityOther":=
 "ExternalRefType:securityOther",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/securityPenTest=
Report": "ExternalRefType:securityPenTestReport",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/securityPolicy"=
: "ExternalRefType:securityPolicy",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/securityThreatM=
odel": "ExternalRefType:securityThreatModel",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/socialMedia": "=
ExternalRefType:socialMedia",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/sourceArtifact"=
: "ExternalRefType:sourceArtifact",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/staticAnalysisR=
eport": "ExternalRefType:staticAnalysisReport",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/support": "Exte=
rnalRefType:support",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/vcs": "External=
RefType:vcs",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/vulnerabilityDi=
sclosureReport": "ExternalRefType:vulnerabilityDisclosureReport",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/vulnerabilityEx=
ploitabilityAssessment": "ExternalRefType:vulnerabilityExploitabilityAssess=
ment",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/blake2b256": "Has=
hAlgorithm:blake2b256",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/blake2b384": "Has=
hAlgorithm:blake2b384",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/blake2b512": "Has=
hAlgorithm:blake2b512",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/blake3": "HashAlg=
orithm:blake3",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/crystalsDilithium=
": "HashAlgorithm:crystalsDilithium",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/crystalsKyber": "=
HashAlgorithm:crystalsKyber",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/falcon": "HashAlg=
orithm:falcon",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md2": "HashAlgori=
thm:md2",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md4": "HashAlgori=
thm:md4",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md5": "HashAlgori=
thm:md5",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md6": "HashAlgori=
thm:md6",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/other": "HashAlgo=
rithm:other",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha1": "HashAlgor=
ithm:sha1",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha224": "HashAlg=
orithm:sha224",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha256": "HashAlg=
orithm:sha256",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha384": "HashAlg=
orithm:sha384",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3_224": "HashA=
lgorithm:sha3_224",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3_256": "HashA=
lgorithm:sha3_256",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3_384": "HashA=
lgorithm:sha3_384",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3_512": "HashA=
lgorithm:sha3_512",
-    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha512": "HashAlg=
orithm:sha512",
-    "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/build": "Lif=
ecycleScopeType:build",
-    "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/design": "Li=
fecycleScopeType:design",
-    "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/development"=
: "LifecycleScopeType:development",
-    "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/other": "Lif=
ecycleScopeType:other",
-    "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/runtime": "L=
ifecycleScopeType:runtime",
-    "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/test": "Life=
cycleScopeType:test",
-    "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/no": "PresenceType=
:no",
-    "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/noAssertion": "Pre=
senceType:noAssertion",
-    "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/yes": "PresenceTyp=
e:yes",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/ai": "Pro=
fileIdentifierType:ai",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/build": "=
ProfileIdentifierType:build",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/core": "P=
rofileIdentifierType:core",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/dataset":=
 "ProfileIdentifierType:dataset",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/expandedL=
icensing": "ProfileIdentifierType:expandedLicensing",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/extension=
": "ProfileIdentifierType:extension",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/lite": "P=
rofileIdentifierType:lite",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/security"=
: "ProfileIdentifierType:security",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/simpleLic=
ensing": "ProfileIdentifierType:simpleLicensing",
-    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/software"=
: "ProfileIdentifierType:software",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCompleteness/comple=
te": "RelationshipCompleteness:complete",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCompleteness/incomp=
lete": "RelationshipCompleteness:incomplete",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCompleteness/noAsse=
rtion": "RelationshipCompleteness:noAssertion",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/affects": "Rel=
ationshipType:affects",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/amendedBy": "R=
elationshipType:amendedBy",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/ancestorOf": "=
RelationshipType:ancestorOf",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/availableFrom"=
: "RelationshipType:availableFrom",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/configures": "=
RelationshipType:configures",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/contains": "Re=
lationshipType:contains",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/coordinatedBy"=
: "RelationshipType:coordinatedBy",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/copiedTo": "Re=
lationshipType:copiedTo",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/delegatedTo": =
"RelationshipType:delegatedTo",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/dependsOn": "R=
elationshipType:dependsOn",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/descendantOf":=
 "RelationshipType:descendantOf",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/describes": "R=
elationshipType:describes",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/doesNotAffect"=
: "RelationshipType:doesNotAffect",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/expandsTo": "R=
elationshipType:expandsTo",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/exploitCreated=
By": "RelationshipType:exploitCreatedBy",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/fixedBy": "Rel=
ationshipType:fixedBy",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/fixedIn": "Rel=
ationshipType:fixedIn",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/foundBy": "Rel=
ationshipType:foundBy",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/generates": "R=
elationshipType:generates",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasAddedFile":=
 "RelationshipType:hasAddedFile",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasAssessmentF=
or": "RelationshipType:hasAssessmentFor",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasAssociatedV=
ulnerability": "RelationshipType:hasAssociatedVulnerability",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasConcludedLi=
cense": "RelationshipType:hasConcludedLicense",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasDataFile": =
"RelationshipType:hasDataFile",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasDeclaredLic=
ense": "RelationshipType:hasDeclaredLicense",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasDeletedFile=
": "RelationshipType:hasDeletedFile",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasDependencyM=
anifest": "RelationshipType:hasDependencyManifest",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasDistributio=
nArtifact": "RelationshipType:hasDistributionArtifact",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasDocumentati=
on": "RelationshipType:hasDocumentation",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasDynamicLink=
": "RelationshipType:hasDynamicLink",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasEvidence": =
"RelationshipType:hasEvidence",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasExample": "=
RelationshipType:hasExample",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasHost": "Rel=
ationshipType:hasHost",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasInputs": "R=
elationshipType:hasInputs",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasMetadata": =
"RelationshipType:hasMetadata",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasOptionalCom=
ponent": "RelationshipType:hasOptionalComponent",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasOptionalDep=
endency": "RelationshipType:hasOptionalDependency",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasOutputs": "=
RelationshipType:hasOutputs",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasPrerequsite=
": "RelationshipType:hasPrerequsite",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasProvidedDep=
endency": "RelationshipType:hasProvidedDependency",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasRequirement=
": "RelationshipType:hasRequirement",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasSpecificati=
on": "RelationshipType:hasSpecification",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasStaticLink"=
: "RelationshipType:hasStaticLink",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasTest": "Rel=
ationshipType:hasTest",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasTestCase": =
"RelationshipType:hasTestCase",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasVariant": "=
RelationshipType:hasVariant",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/invokedBy": "R=
elationshipType:invokedBy",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/modifiedBy": "=
RelationshipType:modifiedBy",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/other": "Relat=
ionshipType:other",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/packagedBy": "=
RelationshipType:packagedBy",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/patchedBy": "R=
elationshipType:patchedBy",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/publishedBy": =
"RelationshipType:publishedBy",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/reportedBy": "=
RelationshipType:reportedBy",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/republishedBy"=
: "RelationshipType:republishedBy",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/serializedInAr=
tifact": "RelationshipType:serializedInArtifact",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/testedOn": "Re=
lationshipType:testedOn",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/trainedOn": "R=
elationshipType:trainedOn",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/underInvestiga=
tionFor": "RelationshipType:underInvestigationFor",
-    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/usesTool": "Re=
lationshipType:usesTool",
-    "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/deployed": "Support=
Type:deployed",
-    "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/development": "Supp=
ortType:development",
-    "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/endOfSupport": "Sup=
portType:endOfSupport",
-    "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/limitedSupport": "S=
upportType:limitedSupport",
-    "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/noAssertion": "Supp=
ortType:noAssertion",
-    "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/noSupport": "Suppor=
tType:noSupport",
-    "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/support": "SupportT=
ype:support",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLevelType/amb=
er": "dataset_ConfidentialityLevelType:amber",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLevelType/cle=
ar": "dataset_ConfidentialityLevelType:clear",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLevelType/gre=
en": "dataset_ConfidentialityLevelType:green",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLevelType/red=
": "dataset_ConfidentialityLevelType:red",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabilityType/clic=
kthrough": "dataset_DatasetAvailabilityType:clickthrough",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabilityType/dire=
ctDownload": "dataset_DatasetAvailabilityType:directDownload",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabilityType/quer=
y": "dataset_DatasetAvailabilityType:query",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabilityType/regi=
stration": "dataset_DatasetAvailabilityType:registration",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabilityType/scra=
pingScript": "dataset_DatasetAvailabilityType:scrapingScript",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/audio": "dataset=
_DatasetType:audio",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/categorical": "d=
ataset_DatasetType:categorical",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/graph": "dataset=
_DatasetType:graph",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/image": "dataset=
_DatasetType:image",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/noAssertion": "d=
ataset_DatasetType:noAssertion",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/numeric": "datas=
et_DatasetType:numeric",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/other": "dataset=
_DatasetType:other",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/sensor": "datase=
t_DatasetType:sensor",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/structured": "da=
taset_DatasetType:structured",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/syntactic": "dat=
aset_DatasetType:syntactic",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/text": "dataset_=
DatasetType:text",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/timeseries": "da=
taset_DatasetType:timeseries",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/timestamp": "dat=
aset_DatasetType:timestamp",
-    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/video": "dataset=
_DatasetType:video",
-    "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/critical":=
 "security_CvssSeverityType:critical",
-    "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/high": "se=
curity_CvssSeverityType:high",
-    "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/low": "sec=
urity_CvssSeverityType:low",
-    "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/medium": "=
security_CvssSeverityType:medium",
-    "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/none": "se=
curity_CvssSeverityType:none",
-    "https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalogType/kev": "s=
ecurity_ExploitCatalogType:kev",
-    "https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalogType/other": =
"security_ExploitCatalogType:other",
-    "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType/act": "sec=
urity_SsvcDecisionType:act",
-    "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType/attend": "=
security_SsvcDecisionType:attend",
-    "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType/track": "s=
ecurity_SsvcDecisionType:track",
-    "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType/trackStar"=
: "security_SsvcDecisionType:trackStar",
-    "https://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/compon=
entNotPresent": "security_VexJustificationType:componentNotPresent",
-    "https://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/inline=
MitigationsAlreadyExist": "security_VexJustificationType:inlineMitigationsA=
lreadyExist",
-    "https://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/vulner=
ableCodeCannotBeControlledByAdversary": "security_VexJustificationType:vuln=
erableCodeCannotBeControlledByAdversary",
-    "https://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/vulner=
ableCodeNotInExecutePath": "security_VexJustificationType:vulnerableCodeNot=
InExecutePath",
-    "https://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/vulner=
ableCodeNotPresent": "security_VexJustificationType:vulnerableCodeNotPresen=
t",
-    "https://spdx.org/rdf/3.0.0/terms/Software/ContentIdentifierType/gitoi=
d": "software_ContentIdentifierType:gitoid",
-    "https://spdx.org/rdf/3.0.0/terms/Software/ContentIdentifierType/swhid=
": "software_ContentIdentifierType:swhid",
-    "https://spdx.org/rdf/3.0.0/terms/Software/FileKindType/directory": "s=
oftware_FileKindType:directory",
-    "https://spdx.org/rdf/3.0.0/terms/Software/FileKindType/file": "softwa=
re_FileKindType:file",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/analyzed": "softwa=
re_SbomType:analyzed",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/build": "software_=
SbomType:build",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/deployed": "softwa=
re_SbomType:deployed",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/design": "software=
_SbomType:design",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/runtime": "softwar=
e_SbomType:runtime",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/source": "software=
_SbomType:source",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/application=
": "software_SoftwarePurpose:application",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/archive": "=
software_SoftwarePurpose:archive",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/bom": "soft=
ware_SoftwarePurpose:bom",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/configurati=
on": "software_SoftwarePurpose:configuration",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/container":=
 "software_SoftwarePurpose:container",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/data": "sof=
tware_SoftwarePurpose:data",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/device": "s=
oftware_SoftwarePurpose:device",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/deviceDrive=
r": "software_SoftwarePurpose:deviceDriver",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/diskImage":=
 "software_SoftwarePurpose:diskImage",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/documentati=
on": "software_SoftwarePurpose:documentation",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/evidence": =
"software_SoftwarePurpose:evidence",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/executable"=
: "software_SoftwarePurpose:executable",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/file": "sof=
tware_SoftwarePurpose:file",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/filesystemI=
mage": "software_SoftwarePurpose:filesystemImage",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/firmware": =
"software_SoftwarePurpose:firmware",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/framework":=
 "software_SoftwarePurpose:framework",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/install": "=
software_SoftwarePurpose:install",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/library": "=
software_SoftwarePurpose:library",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/manifest": =
"software_SoftwarePurpose:manifest",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/model": "so=
ftware_SoftwarePurpose:model",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/module": "s=
oftware_SoftwarePurpose:module",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/operatingSy=
stem": "software_SoftwarePurpose:operatingSystem",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/other": "so=
ftware_SoftwarePurpose:other",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/patch": "so=
ftware_SoftwarePurpose:patch",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/platform": =
"software_SoftwarePurpose:platform",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/requirement=
": "software_SoftwarePurpose:requirement",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/source": "s=
oftware_SoftwarePurpose:source",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/specificati=
on": "software_SoftwarePurpose:specification",
-    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/test": "sof=
tware_SoftwarePurpose:test",
-    "https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/NoAssertionLicense=
": "spdx:ExpandedLicensing/NoAssertionLicense",
-    "https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/NoneLicense": "spd=
x:ExpandedLicensing/NoneLicense",
-}
-
-_NI_DECODE_CONTEXT =3D {
-    "ai_EnergyUnitType:kilowattHour": "https://spdx.org/rdf/3.0.0/terms/AI=
/EnergyUnitType/kilowattHour",
-    "ai_EnergyUnitType:megajoule": "https://spdx.org/rdf/3.0.0/terms/AI/En=
ergyUnitType/megajoule",
-    "ai_EnergyUnitType:other": "https://spdx.org/rdf/3.0.0/terms/AI/Energy=
UnitType/other",
-    "ai_SafetyRiskAssessmentType:high": "https://spdx.org/rdf/3.0.0/terms/=
AI/SafetyRiskAssessmentType/high",
-    "ai_SafetyRiskAssessmentType:low": "https://spdx.org/rdf/3.0.0/terms/A=
I/SafetyRiskAssessmentType/low",
-    "ai_SafetyRiskAssessmentType:medium": "https://spdx.org/rdf/3.0.0/term=
s/AI/SafetyRiskAssessmentType/medium",
-    "ai_SafetyRiskAssessmentType:serious": "https://spdx.org/rdf/3.0.0/ter=
ms/AI/SafetyRiskAssessmentType/serious",
-    "AnnotationType:other": "https://spdx.org/rdf/3.0.0/terms/Core/Annotat=
ionType/other",
-    "AnnotationType:review": "https://spdx.org/rdf/3.0.0/terms/Core/Annota=
tionType/review",
-    "spdx:Core/NoAssertionElement": "https://spdx.org/rdf/3.0.0/terms/Core=
/NoAssertionElement",
-    "spdx:Core/NoneElement": "https://spdx.org/rdf/3.0.0/terms/Core/NoneEl=
ement",
-    "ExternalIdentifierType:cpe22": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalIdentifierType/cpe22",
-    "ExternalIdentifierType:cpe23": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalIdentifierType/cpe23",
-    "ExternalIdentifierType:cve": "https://spdx.org/rdf/3.0.0/terms/Core/E=
xternalIdentifierType/cve",
-    "ExternalIdentifierType:email": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalIdentifierType/email",
-    "ExternalIdentifierType:gitoid": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/ExternalIdentifierType/gitoid",
-    "ExternalIdentifierType:other": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalIdentifierType/other",
-    "ExternalIdentifierType:packageUrl": "https://spdx.org/rdf/3.0.0/terms=
/Core/ExternalIdentifierType/packageUrl",
-    "ExternalIdentifierType:securityOther": "https://spdx.org/rdf/3.0.0/te=
rms/Core/ExternalIdentifierType/securityOther",
-    "ExternalIdentifierType:swhid": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalIdentifierType/swhid",
-    "ExternalIdentifierType:swid": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalIdentifierType/swid",
-    "ExternalIdentifierType:urlScheme": "https://spdx.org/rdf/3.0.0/terms/=
Core/ExternalIdentifierType/urlScheme",
-    "ExternalRefType:altDownloadLocation": "https://spdx.org/rdf/3.0.0/ter=
ms/Core/ExternalRefType/altDownloadLocation",
-    "ExternalRefType:altWebPage": "https://spdx.org/rdf/3.0.0/terms/Core/E=
xternalRefType/altWebPage",
-    "ExternalRefType:binaryArtifact": "https://spdx.org/rdf/3.0.0/terms/Co=
re/ExternalRefType/binaryArtifact",
-    "ExternalRefType:bower": "https://spdx.org/rdf/3.0.0/terms/Core/Extern=
alRefType/bower",
-    "ExternalRefType:buildMeta": "https://spdx.org/rdf/3.0.0/terms/Core/Ex=
ternalRefType/buildMeta",
-    "ExternalRefType:buildSystem": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalRefType/buildSystem",
-    "ExternalRefType:certificationReport": "https://spdx.org/rdf/3.0.0/ter=
ms/Core/ExternalRefType/certificationReport",
-    "ExternalRefType:chat": "https://spdx.org/rdf/3.0.0/terms/Core/Externa=
lRefType/chat",
-    "ExternalRefType:componentAnalysisReport": "https://spdx.org/rdf/3.0.0=
/terms/Core/ExternalRefType/componentAnalysisReport",
-    "ExternalRefType:cwe": "https://spdx.org/rdf/3.0.0/terms/Core/External=
RefType/cwe",
-    "ExternalRefType:documentation": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/ExternalRefType/documentation",
-    "ExternalRefType:dynamicAnalysisReport": "https://spdx.org/rdf/3.0.0/t=
erms/Core/ExternalRefType/dynamicAnalysisReport",
-    "ExternalRefType:eolNotice": "https://spdx.org/rdf/3.0.0/terms/Core/Ex=
ternalRefType/eolNotice",
-    "ExternalRefType:exportControlAssessment": "https://spdx.org/rdf/3.0.0=
/terms/Core/ExternalRefType/exportControlAssessment",
-    "ExternalRefType:funding": "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/funding",
-    "ExternalRefType:issueTracker": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalRefType/issueTracker",
-    "ExternalRefType:license": "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/license",
-    "ExternalRefType:mailingList": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalRefType/mailingList",
-    "ExternalRefType:mavenCentral": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalRefType/mavenCentral",
-    "ExternalRefType:metrics": "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/metrics",
-    "ExternalRefType:npm": "https://spdx.org/rdf/3.0.0/terms/Core/External=
RefType/npm",
-    "ExternalRefType:nuget": "https://spdx.org/rdf/3.0.0/terms/Core/Extern=
alRefType/nuget",
-    "ExternalRefType:other": "https://spdx.org/rdf/3.0.0/terms/Core/Extern=
alRefType/other",
-    "ExternalRefType:privacyAssessment": "https://spdx.org/rdf/3.0.0/terms=
/Core/ExternalRefType/privacyAssessment",
-    "ExternalRefType:productMetadata": "https://spdx.org/rdf/3.0.0/terms/C=
ore/ExternalRefType/productMetadata",
-    "ExternalRefType:purchaseOrder": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/ExternalRefType/purchaseOrder",
-    "ExternalRefType:qualityAssessmentReport": "https://spdx.org/rdf/3.0.0=
/terms/Core/ExternalRefType/qualityAssessmentReport",
-    "ExternalRefType:releaseHistory": "https://spdx.org/rdf/3.0.0/terms/Co=
re/ExternalRefType/releaseHistory",
-    "ExternalRefType:releaseNotes": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalRefType/releaseNotes",
-    "ExternalRefType:riskAssessment": "https://spdx.org/rdf/3.0.0/terms/Co=
re/ExternalRefType/riskAssessment",
-    "ExternalRefType:runtimeAnalysisReport": "https://spdx.org/rdf/3.0.0/t=
erms/Core/ExternalRefType/runtimeAnalysisReport",
-    "ExternalRefType:secureSoftwareAttestation": "https://spdx.org/rdf/3.0=
.0/terms/Core/ExternalRefType/secureSoftwareAttestation",
-    "ExternalRefType:securityAdversaryModel": "https://spdx.org/rdf/3.0.0/=
terms/Core/ExternalRefType/securityAdversaryModel",
-    "ExternalRefType:securityAdvisory": "https://spdx.org/rdf/3.0.0/terms/=
Core/ExternalRefType/securityAdvisory",
-    "ExternalRefType:securityFix": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalRefType/securityFix",
-    "ExternalRefType:securityOther": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/ExternalRefType/securityOther",
-    "ExternalRefType:securityPenTestReport": "https://spdx.org/rdf/3.0.0/t=
erms/Core/ExternalRefType/securityPenTestReport",
-    "ExternalRefType:securityPolicy": "https://spdx.org/rdf/3.0.0/terms/Co=
re/ExternalRefType/securityPolicy",
-    "ExternalRefType:securityThreatModel": "https://spdx.org/rdf/3.0.0/ter=
ms/Core/ExternalRefType/securityThreatModel",
-    "ExternalRefType:socialMedia": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalRefType/socialMedia",
-    "ExternalRefType:sourceArtifact": "https://spdx.org/rdf/3.0.0/terms/Co=
re/ExternalRefType/sourceArtifact",
-    "ExternalRefType:staticAnalysisReport": "https://spdx.org/rdf/3.0.0/te=
rms/Core/ExternalRefType/staticAnalysisReport",
-    "ExternalRefType:support": "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/support",
-    "ExternalRefType:vcs": "https://spdx.org/rdf/3.0.0/terms/Core/External=
RefType/vcs",
-    "ExternalRefType:vulnerabilityDisclosureReport": "https://spdx.org/rdf=
/3.0.0/terms/Core/ExternalRefType/vulnerabilityDisclosureReport",
-    "ExternalRefType:vulnerabilityExploitabilityAssessment": "https://spdx=
.org/rdf/3.0.0/terms/Core/ExternalRefType/vulnerabilityExploitabilityAssess=
ment",
-    "HashAlgorithm:blake2b256": "https://spdx.org/rdf/3.0.0/terms/Core/Has=
hAlgorithm/blake2b256",
-    "HashAlgorithm:blake2b384": "https://spdx.org/rdf/3.0.0/terms/Core/Has=
hAlgorithm/blake2b384",
-    "HashAlgorithm:blake2b512": "https://spdx.org/rdf/3.0.0/terms/Core/Has=
hAlgorithm/blake2b512",
-    "HashAlgorithm:blake3": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlg=
orithm/blake3",
-    "HashAlgorithm:crystalsDilithium": "https://spdx.org/rdf/3.0.0/terms/C=
ore/HashAlgorithm/crystalsDilithium",
-    "HashAlgorithm:crystalsKyber": "https://spdx.org/rdf/3.0.0/terms/Core/=
HashAlgorithm/crystalsKyber",
-    "HashAlgorithm:falcon": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlg=
orithm/falcon",
-    "HashAlgorithm:md2": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgori=
thm/md2",
-    "HashAlgorithm:md4": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgori=
thm/md4",
-    "HashAlgorithm:md5": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgori=
thm/md5",
-    "HashAlgorithm:md6": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgori=
thm/md6",
-    "HashAlgorithm:other": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgo=
rithm/other",
-    "HashAlgorithm:sha1": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgor=
ithm/sha1",
-    "HashAlgorithm:sha224": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlg=
orithm/sha224",
-    "HashAlgorithm:sha256": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlg=
orithm/sha256",
-    "HashAlgorithm:sha384": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlg=
orithm/sha384",
-    "HashAlgorithm:sha3_224": "https://spdx.org/rdf/3.0.0/terms/Core/HashA=
lgorithm/sha3_224",
-    "HashAlgorithm:sha3_256": "https://spdx.org/rdf/3.0.0/terms/Core/HashA=
lgorithm/sha3_256",
-    "HashAlgorithm:sha3_384": "https://spdx.org/rdf/3.0.0/terms/Core/HashA=
lgorithm/sha3_384",
-    "HashAlgorithm:sha3_512": "https://spdx.org/rdf/3.0.0/terms/Core/HashA=
lgorithm/sha3_512",
-    "HashAlgorithm:sha512": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlg=
orithm/sha512",
-    "LifecycleScopeType:build": "https://spdx.org/rdf/3.0.0/terms/Core/Lif=
ecycleScopeType/build",
-    "LifecycleScopeType:design": "https://spdx.org/rdf/3.0.0/terms/Core/Li=
fecycleScopeType/design",
-    "LifecycleScopeType:development": "https://spdx.org/rdf/3.0.0/terms/Co=
re/LifecycleScopeType/development",
-    "LifecycleScopeType:other": "https://spdx.org/rdf/3.0.0/terms/Core/Lif=
ecycleScopeType/other",
-    "LifecycleScopeType:runtime": "https://spdx.org/rdf/3.0.0/terms/Core/L=
ifecycleScopeType/runtime",
-    "LifecycleScopeType:test": "https://spdx.org/rdf/3.0.0/terms/Core/Life=
cycleScopeType/test",
-    "PresenceType:no": "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType=
/no",
-    "PresenceType:noAssertion": "https://spdx.org/rdf/3.0.0/terms/Core/Pre=
senceType/noAssertion",
-    "PresenceType:yes": "https://spdx.org/rdf/3.0.0/terms/Core/PresenceTyp=
e/yes",
-    "ProfileIdentifierType:ai": "https://spdx.org/rdf/3.0.0/terms/Core/Pro=
fileIdentifierType/ai",
-    "ProfileIdentifierType:build": "https://spdx.org/rdf/3.0.0/terms/Core/=
ProfileIdentifierType/build",
-    "ProfileIdentifierType:core": "https://spdx.org/rdf/3.0.0/terms/Core/P=
rofileIdentifierType/core",
-    "ProfileIdentifierType:dataset": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/ProfileIdentifierType/dataset",
-    "ProfileIdentifierType:expandedLicensing": "https://spdx.org/rdf/3.0.0=
/terms/Core/ProfileIdentifierType/expandedLicensing",
-    "ProfileIdentifierType:extension": "https://spdx.org/rdf/3.0.0/terms/C=
ore/ProfileIdentifierType/extension",
-    "ProfileIdentifierType:lite": "https://spdx.org/rdf/3.0.0/terms/Core/P=
rofileIdentifierType/lite",
-    "ProfileIdentifierType:security": "https://spdx.org/rdf/3.0.0/terms/Co=
re/ProfileIdentifierType/security",
-    "ProfileIdentifierType:simpleLicensing": "https://spdx.org/rdf/3.0.0/t=
erms/Core/ProfileIdentifierType/simpleLicensing",
-    "ProfileIdentifierType:software": "https://spdx.org/rdf/3.0.0/terms/Co=
re/ProfileIdentifierType/software",
-    "RelationshipCompleteness:complete": "https://spdx.org/rdf/3.0.0/terms=
/Core/RelationshipCompleteness/complete",
-    "RelationshipCompleteness:incomplete": "https://spdx.org/rdf/3.0.0/ter=
ms/Core/RelationshipCompleteness/incomplete",
-    "RelationshipCompleteness:noAssertion": "https://spdx.org/rdf/3.0.0/te=
rms/Core/RelationshipCompleteness/noAssertion",
-    "RelationshipType:affects": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/affects",
-    "RelationshipType:amendedBy": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/amendedBy",
-    "RelationshipType:ancestorOf": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/ancestorOf",
-    "RelationshipType:availableFrom": "https://spdx.org/rdf/3.0.0/terms/Co=
re/RelationshipType/availableFrom",
-    "RelationshipType:configures": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/configures",
-    "RelationshipType:contains": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/contains",
-    "RelationshipType:coordinatedBy": "https://spdx.org/rdf/3.0.0/terms/Co=
re/RelationshipType/coordinatedBy",
-    "RelationshipType:copiedTo": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/copiedTo",
-    "RelationshipType:delegatedTo": "https://spdx.org/rdf/3.0.0/terms/Core=
/RelationshipType/delegatedTo",
-    "RelationshipType:dependsOn": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/dependsOn",
-    "RelationshipType:descendantOf": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/RelationshipType/descendantOf",
-    "RelationshipType:describes": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/describes",
-    "RelationshipType:doesNotAffect": "https://spdx.org/rdf/3.0.0/terms/Co=
re/RelationshipType/doesNotAffect",
-    "RelationshipType:expandsTo": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/expandsTo",
-    "RelationshipType:exploitCreatedBy": "https://spdx.org/rdf/3.0.0/terms=
/Core/RelationshipType/exploitCreatedBy",
-    "RelationshipType:fixedBy": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/fixedBy",
-    "RelationshipType:fixedIn": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/fixedIn",
-    "RelationshipType:foundBy": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/foundBy",
-    "RelationshipType:generates": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/generates",
-    "RelationshipType:hasAddedFile": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/RelationshipType/hasAddedFile",
-    "RelationshipType:hasAssessmentFor": "https://spdx.org/rdf/3.0.0/terms=
/Core/RelationshipType/hasAssessmentFor",
-    "RelationshipType:hasAssociatedVulnerability": "https://spdx.org/rdf/3=
.0.0/terms/Core/RelationshipType/hasAssociatedVulnerability",
-    "RelationshipType:hasConcludedLicense": "https://spdx.org/rdf/3.0.0/te=
rms/Core/RelationshipType/hasConcludedLicense",
-    "RelationshipType:hasDataFile": "https://spdx.org/rdf/3.0.0/terms/Core=
/RelationshipType/hasDataFile",
-    "RelationshipType:hasDeclaredLicense": "https://spdx.org/rdf/3.0.0/ter=
ms/Core/RelationshipType/hasDeclaredLicense",
-    "RelationshipType:hasDeletedFile": "https://spdx.org/rdf/3.0.0/terms/C=
ore/RelationshipType/hasDeletedFile",
-    "RelationshipType:hasDependencyManifest": "https://spdx.org/rdf/3.0.0/=
terms/Core/RelationshipType/hasDependencyManifest",
-    "RelationshipType:hasDistributionArtifact": "https://spdx.org/rdf/3.0.=
0/terms/Core/RelationshipType/hasDistributionArtifact",
-    "RelationshipType:hasDocumentation": "https://spdx.org/rdf/3.0.0/terms=
/Core/RelationshipType/hasDocumentation",
-    "RelationshipType:hasDynamicLink": "https://spdx.org/rdf/3.0.0/terms/C=
ore/RelationshipType/hasDynamicLink",
-    "RelationshipType:hasEvidence": "https://spdx.org/rdf/3.0.0/terms/Core=
/RelationshipType/hasEvidence",
-    "RelationshipType:hasExample": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/hasExample",
-    "RelationshipType:hasHost": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/hasHost",
-    "RelationshipType:hasInputs": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/hasInputs",
-    "RelationshipType:hasMetadata": "https://spdx.org/rdf/3.0.0/terms/Core=
/RelationshipType/hasMetadata",
-    "RelationshipType:hasOptionalComponent": "https://spdx.org/rdf/3.0.0/t=
erms/Core/RelationshipType/hasOptionalComponent",
-    "RelationshipType:hasOptionalDependency": "https://spdx.org/rdf/3.0.0/=
terms/Core/RelationshipType/hasOptionalDependency",
-    "RelationshipType:hasOutputs": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/hasOutputs",
-    "RelationshipType:hasPrerequsite": "https://spdx.org/rdf/3.0.0/terms/C=
ore/RelationshipType/hasPrerequsite",
-    "RelationshipType:hasProvidedDependency": "https://spdx.org/rdf/3.0.0/=
terms/Core/RelationshipType/hasProvidedDependency",
-    "RelationshipType:hasRequirement": "https://spdx.org/rdf/3.0.0/terms/C=
ore/RelationshipType/hasRequirement",
-    "RelationshipType:hasSpecification": "https://spdx.org/rdf/3.0.0/terms=
/Core/RelationshipType/hasSpecification",
-    "RelationshipType:hasStaticLink": "https://spdx.org/rdf/3.0.0/terms/Co=
re/RelationshipType/hasStaticLink",
-    "RelationshipType:hasTest": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/hasTest",
-    "RelationshipType:hasTestCase": "https://spdx.org/rdf/3.0.0/terms/Core=
/RelationshipType/hasTestCase",
-    "RelationshipType:hasVariant": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/hasVariant",
-    "RelationshipType:invokedBy": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/invokedBy",
-    "RelationshipType:modifiedBy": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/modifiedBy",
-    "RelationshipType:other": "https://spdx.org/rdf/3.0.0/terms/Core/Relat=
ionshipType/other",
-    "RelationshipType:packagedBy": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/packagedBy",
-    "RelationshipType:patchedBy": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/patchedBy",
-    "RelationshipType:publishedBy": "https://spdx.org/rdf/3.0.0/terms/Core=
/RelationshipType/publishedBy",
-    "RelationshipType:reportedBy": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/reportedBy",
-    "RelationshipType:republishedBy": "https://spdx.org/rdf/3.0.0/terms/Co=
re/RelationshipType/republishedBy",
-    "RelationshipType:serializedInArtifact": "https://spdx.org/rdf/3.0.0/t=
erms/Core/RelationshipType/serializedInArtifact",
-    "RelationshipType:testedOn": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/testedOn",
-    "RelationshipType:trainedOn": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/trainedOn",
-    "RelationshipType:underInvestigationFor": "https://spdx.org/rdf/3.0.0/=
terms/Core/RelationshipType/underInvestigationFor",
-    "RelationshipType:usesTool": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/usesTool",
-    "SupportType:deployed": "https://spdx.org/rdf/3.0.0/terms/Core/Support=
Type/deployed",
-    "SupportType:development": "https://spdx.org/rdf/3.0.0/terms/Core/Supp=
ortType/development",
-    "SupportType:endOfSupport": "https://spdx.org/rdf/3.0.0/terms/Core/Sup=
portType/endOfSupport",
-    "SupportType:limitedSupport": "https://spdx.org/rdf/3.0.0/terms/Core/S=
upportType/limitedSupport",
-    "SupportType:noAssertion": "https://spdx.org/rdf/3.0.0/terms/Core/Supp=
ortType/noAssertion",
-    "SupportType:noSupport": "https://spdx.org/rdf/3.0.0/terms/Core/Suppor=
tType/noSupport",
-    "SupportType:support": "https://spdx.org/rdf/3.0.0/terms/Core/SupportT=
ype/support",
-    "dataset_ConfidentialityLevelType:amber": "https://spdx.org/rdf/3.0.0/=
terms/Dataset/ConfidentialityLevelType/amber",
-    "dataset_ConfidentialityLevelType:clear": "https://spdx.org/rdf/3.0.0/=
terms/Dataset/ConfidentialityLevelType/clear",
-    "dataset_ConfidentialityLevelType:green": "https://spdx.org/rdf/3.0.0/=
terms/Dataset/ConfidentialityLevelType/green",
-    "dataset_ConfidentialityLevelType:red": "https://spdx.org/rdf/3.0.0/te=
rms/Dataset/ConfidentialityLevelType/red",
-    "dataset_DatasetAvailabilityType:clickthrough": "https://spdx.org/rdf/=
3.0.0/terms/Dataset/DatasetAvailabilityType/clickthrough",
-    "dataset_DatasetAvailabilityType:directDownload": "https://spdx.org/rd=
f/3.0.0/terms/Dataset/DatasetAvailabilityType/directDownload",
-    "dataset_DatasetAvailabilityType:query": "https://spdx.org/rdf/3.0.0/t=
erms/Dataset/DatasetAvailabilityType/query",
-    "dataset_DatasetAvailabilityType:registration": "https://spdx.org/rdf/=
3.0.0/terms/Dataset/DatasetAvailabilityType/registration",
-    "dataset_DatasetAvailabilityType:scrapingScript": "https://spdx.org/rd=
f/3.0.0/terms/Dataset/DatasetAvailabilityType/scrapingScript",
-    "dataset_DatasetType:audio": "https://spdx.org/rdf/3.0.0/terms/Dataset=
/DatasetType/audio",
-    "dataset_DatasetType:categorical": "https://spdx.org/rdf/3.0.0/terms/D=
ataset/DatasetType/categorical",
-    "dataset_DatasetType:graph": "https://spdx.org/rdf/3.0.0/terms/Dataset=
/DatasetType/graph",
-    "dataset_DatasetType:image": "https://spdx.org/rdf/3.0.0/terms/Dataset=
/DatasetType/image",
-    "dataset_DatasetType:noAssertion": "https://spdx.org/rdf/3.0.0/terms/D=
ataset/DatasetType/noAssertion",
-    "dataset_DatasetType:numeric": "https://spdx.org/rdf/3.0.0/terms/Datas=
et/DatasetType/numeric",
-    "dataset_DatasetType:other": "https://spdx.org/rdf/3.0.0/terms/Dataset=
/DatasetType/other",
-    "dataset_DatasetType:sensor": "https://spdx.org/rdf/3.0.0/terms/Datase=
t/DatasetType/sensor",
-    "dataset_DatasetType:structured": "https://spdx.org/rdf/3.0.0/terms/Da=
taset/DatasetType/structured",
-    "dataset_DatasetType:syntactic": "https://spdx.org/rdf/3.0.0/terms/Dat=
aset/DatasetType/syntactic",
-    "dataset_DatasetType:text": "https://spdx.org/rdf/3.0.0/terms/Dataset/=
DatasetType/text",
-    "dataset_DatasetType:timeseries": "https://spdx.org/rdf/3.0.0/terms/Da=
taset/DatasetType/timeseries",
-    "dataset_DatasetType:timestamp": "https://spdx.org/rdf/3.0.0/terms/Dat=
aset/DatasetType/timestamp",
-    "dataset_DatasetType:video": "https://spdx.org/rdf/3.0.0/terms/Dataset=
/DatasetType/video",
-    "security_CvssSeverityType:critical": "https://spdx.org/rdf/3.0.0/term=
s/Security/CvssSeverityType/critical",
-    "security_CvssSeverityType:high": "https://spdx.org/rdf/3.0.0/terms/Se=
curity/CvssSeverityType/high",
-    "security_CvssSeverityType:low": "https://spdx.org/rdf/3.0.0/terms/Sec=
urity/CvssSeverityType/low",
-    "security_CvssSeverityType:medium": "https://spdx.org/rdf/3.0.0/terms/=
Security/CvssSeverityType/medium",
-    "security_CvssSeverityType:none": "https://spdx.org/rdf/3.0.0/terms/Se=
curity/CvssSeverityType/none",
-    "security_ExploitCatalogType:kev": "https://spdx.org/rdf/3.0.0/terms/S=
ecurity/ExploitCatalogType/kev",
-    "security_ExploitCatalogType:other": "https://spdx.org/rdf/3.0.0/terms=
/Security/ExploitCatalogType/other",
-    "security_SsvcDecisionType:act": "https://spdx.org/rdf/3.0.0/terms/Sec=
urity/SsvcDecisionType/act",
-    "security_SsvcDecisionType:attend": "https://spdx.org/rdf/3.0.0/terms/=
Security/SsvcDecisionType/attend",
-    "security_SsvcDecisionType:track": "https://spdx.org/rdf/3.0.0/terms/S=
ecurity/SsvcDecisionType/track",
-    "security_SsvcDecisionType:trackStar": "https://spdx.org/rdf/3.0.0/ter=
ms/Security/SsvcDecisionType/trackStar",
-    "security_VexJustificationType:componentNotPresent": "https://spdx.org=
/rdf/3.0.0/terms/Security/VexJustificationType/componentNotPresent",
-    "security_VexJustificationType:inlineMitigationsAlreadyExist": "https:=
//spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/inlineMitigationsA=
lreadyExist",
-    "security_VexJustificationType:vulnerableCodeCannotBeControlledByAdver=
sary": "https://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/vuln=
erableCodeCannotBeControlledByAdversary",
-    "security_VexJustificationType:vulnerableCodeNotInExecutePath": "https=
://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/vulnerableCodeNot=
InExecutePath",
-    "security_VexJustificationType:vulnerableCodeNotPresent": "https://spd=
x.org/rdf/3.0.0/terms/Security/VexJustificationType/vulnerableCodeNotPresen=
t",
-    "software_ContentIdentifierType:gitoid": "https://spdx.org/rdf/3.0.0/t=
erms/Software/ContentIdentifierType/gitoid",
-    "software_ContentIdentifierType:swhid": "https://spdx.org/rdf/3.0.0/te=
rms/Software/ContentIdentifierType/swhid",
-    "software_FileKindType:directory": "https://spdx.org/rdf/3.0.0/terms/S=
oftware/FileKindType/directory",
-    "software_FileKindType:file": "https://spdx.org/rdf/3.0.0/terms/Softwa=
re/FileKindType/file",
-    "software_SbomType:analyzed": "https://spdx.org/rdf/3.0.0/terms/Softwa=
re/SbomType/analyzed",
-    "software_SbomType:build": "https://spdx.org/rdf/3.0.0/terms/Software/=
SbomType/build",
-    "software_SbomType:deployed": "https://spdx.org/rdf/3.0.0/terms/Softwa=
re/SbomType/deployed",
-    "software_SbomType:design": "https://spdx.org/rdf/3.0.0/terms/Software=
/SbomType/design",
-    "software_SbomType:runtime": "https://spdx.org/rdf/3.0.0/terms/Softwar=
e/SbomType/runtime",
-    "software_SbomType:source": "https://spdx.org/rdf/3.0.0/terms/Software=
/SbomType/source",
-    "software_SoftwarePurpose:application": "https://spdx.org/rdf/3.0.0/te=
rms/Software/SoftwarePurpose/application",
-    "software_SoftwarePurpose:archive": "https://spdx.org/rdf/3.0.0/terms/=
Software/SoftwarePurpose/archive",
-    "software_SoftwarePurpose:bom": "https://spdx.org/rdf/3.0.0/terms/Soft=
ware/SoftwarePurpose/bom",
-    "software_SoftwarePurpose:configuration": "https://spdx.org/rdf/3.0.0/=
terms/Software/SoftwarePurpose/configuration",
-    "software_SoftwarePurpose:container": "https://spdx.org/rdf/3.0.0/term=
s/Software/SoftwarePurpose/container",
-    "software_SoftwarePurpose:data": "https://spdx.org/rdf/3.0.0/terms/Sof=
tware/SoftwarePurpose/data",
-    "software_SoftwarePurpose:device": "https://spdx.org/rdf/3.0.0/terms/S=
oftware/SoftwarePurpose/device",
-    "software_SoftwarePurpose:deviceDriver": "https://spdx.org/rdf/3.0.0/t=
erms/Software/SoftwarePurpose/deviceDriver",
-    "software_SoftwarePurpose:diskImage": "https://spdx.org/rdf/3.0.0/term=
s/Software/SoftwarePurpose/diskImage",
-    "software_SoftwarePurpose:documentation": "https://spdx.org/rdf/3.0.0/=
terms/Software/SoftwarePurpose/documentation",
-    "software_SoftwarePurpose:evidence": "https://spdx.org/rdf/3.0.0/terms=
/Software/SoftwarePurpose/evidence",
-    "software_SoftwarePurpose:executable": "https://spdx.org/rdf/3.0.0/ter=
ms/Software/SoftwarePurpose/executable",
-    "software_SoftwarePurpose:file": "https://spdx.org/rdf/3.0.0/terms/Sof=
tware/SoftwarePurpose/file",
-    "software_SoftwarePurpose:filesystemImage": "https://spdx.org/rdf/3.0.=
0/terms/Software/SoftwarePurpose/filesystemImage",
-    "software_SoftwarePurpose:firmware": "https://spdx.org/rdf/3.0.0/terms=
/Software/SoftwarePurpose/firmware",
-    "software_SoftwarePurpose:framework": "https://spdx.org/rdf/3.0.0/term=
s/Software/SoftwarePurpose/framework",
-    "software_SoftwarePurpose:install": "https://spdx.org/rdf/3.0.0/terms/=
Software/SoftwarePurpose/install",
-    "software_SoftwarePurpose:library": "https://spdx.org/rdf/3.0.0/terms/=
Software/SoftwarePurpose/library",
-    "software_SoftwarePurpose:manifest": "https://spdx.org/rdf/3.0.0/terms=
/Software/SoftwarePurpose/manifest",
-    "software_SoftwarePurpose:model": "https://spdx.org/rdf/3.0.0/terms/So=
ftware/SoftwarePurpose/model",
-    "software_SoftwarePurpose:module": "https://spdx.org/rdf/3.0.0/terms/S=
oftware/SoftwarePurpose/module",
-    "software_SoftwarePurpose:operatingSystem": "https://spdx.org/rdf/3.0.=
0/terms/Software/SoftwarePurpose/operatingSystem",
-    "software_SoftwarePurpose:other": "https://spdx.org/rdf/3.0.0/terms/So=
ftware/SoftwarePurpose/other",
-    "software_SoftwarePurpose:patch": "https://spdx.org/rdf/3.0.0/terms/So=
ftware/SoftwarePurpose/patch",
-    "software_SoftwarePurpose:platform": "https://spdx.org/rdf/3.0.0/terms=
/Software/SoftwarePurpose/platform",
-    "software_SoftwarePurpose:requirement": "https://spdx.org/rdf/3.0.0/te=
rms/Software/SoftwarePurpose/requirement",
-    "software_SoftwarePurpose:source": "https://spdx.org/rdf/3.0.0/terms/S=
oftware/SoftwarePurpose/source",
-    "software_SoftwarePurpose:specification": "https://spdx.org/rdf/3.0.0/=
terms/Software/SoftwarePurpose/specification",
-    "software_SoftwarePurpose:test": "https://spdx.org/rdf/3.0.0/terms/Sof=
tware/SoftwarePurpose/test",
-    "spdx:ExpandedLicensing/NoAssertionLicense": "https://spdx.org/rdf/3.0=
.0/terms/ExpandedLicensing/NoAssertionLicense",
-    "spdx:ExpandedLicensing/NoneLicense": "https://spdx.org/rdf/3.0.0/term=
s/ExpandedLicensing/NoneLicense",
-}
-
=20
 # CLASSES
-# The class that contains properties to describe energy consumption incurr=
ed
-# by an AI model in different stages of its lifecycle.
-@register("https://spdx.org/rdf/3.0.0/terms/AI/EnergyConsumption", compact=
_type=3D"ai_EnergyConsumption", abstract=3DFalse)
-class ai_EnergyConsumption(SHACLObject):
+@register("http://spdx.invalid./AbstractClass", abstract=3DFalse)
+class http_spdx_invalid_AbstractClass(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
     }
=20
+
+# A class for describing the energy consumption incurred by an AI model in
+# different stages of its lifecycle.
+@register("https://spdx.org/rdf/3.0.1/terms/AI/EnergyConsumption", compact=
_type=3D"ai_EnergyConsumption", abstract=3DFalse)
+class ai_EnergyConsumption(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNode
+    NAMED_INDIVIDUALS =3D {
+    }
+
     @classmethod
     def _register_props(cls):
         super()._register_props()
@@ -2487,7 +1985,7 @@ class ai_EnergyConsumption(SHACLObject):
         cls._add_property(
             "ai_finetuningEnergyConsumption",
             ListProp(ObjectProp(ai_EnergyConsumptionDescription, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/finetuningEnergyCon=
sumption",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/finetuningEnergyCon=
sumption",
             compact=3D"ai_finetuningEnergyConsumption",
         )
         # Specifies the amount of energy consumed during inference time by=
 an AI model
@@ -2495,7 +1993,7 @@ class ai_EnergyConsumption(SHACLObject):
         cls._add_property(
             "ai_inferenceEnergyConsumption",
             ListProp(ObjectProp(ai_EnergyConsumptionDescription, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/inferenceEnergyCons=
umption",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/inferenceEnergyCons=
umption",
             compact=3D"ai_inferenceEnergyConsumption",
         )
         # Specifies the amount of energy consumed when training the AI mod=
el that is
@@ -2503,16 +2001,16 @@ class ai_EnergyConsumption(SHACLObject):
         cls._add_property(
             "ai_trainingEnergyConsumption",
             ListProp(ObjectProp(ai_EnergyConsumptionDescription, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/trainingEnergyConsu=
mption",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/trainingEnergyConsu=
mption",
             compact=3D"ai_trainingEnergyConsumption",
         )
=20
=20
 # The class that helps note down the quantity of energy consumption and th=
e unit
 # used for measurement.
-@register("https://spdx.org/rdf/3.0.0/terms/AI/EnergyConsumptionDescriptio=
n", compact_type=3D"ai_EnergyConsumptionDescription", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/AI/EnergyConsumptionDescriptio=
n", compact_type=3D"ai_EnergyConsumptionDescription", abstract=3DFalse)
 class ai_EnergyConsumptionDescription(SHACLObject):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
@@ -2523,7 +2021,7 @@ class ai_EnergyConsumptionDescription(SHACLObject):
         cls._add_property(
             "ai_energyQuantity",
             FloatProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/energyQuantity",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/energyQuantity",
             min_count=3D1,
             compact=3D"ai_energyQuantity",
         )
@@ -2531,71 +2029,71 @@ class ai_EnergyConsumptionDescription(SHACLObject):
         cls._add_property(
             "ai_energyUnit",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/k=
ilowattHour", "kilowattHour"),
-                    ("https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/m=
egajoule", "megajoule"),
-                    ("https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/o=
ther", "other"),
+                    ("https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType/k=
ilowattHour", "kilowattHour"),
+                    ("https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType/m=
egajoule", "megajoule"),
+                    ("https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType/o=
ther", "other"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/energyUnit",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/energyUnit",
             min_count=3D1,
             compact=3D"ai_energyUnit",
         )
=20
=20
 # Specifies the unit of energy consumption.
-@register("https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType", compact_ty=
pe=3D"ai_EnergyUnitType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType", compact_ty=
pe=3D"ai_EnergyUnitType", abstract=3DFalse)
 class ai_EnergyUnitType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "kilowattHour": "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitTyp=
e/kilowattHour",
-        "megajoule": "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/m=
egajoule",
-        "other": "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/other=
",
+        "kilowattHour": "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitTyp=
e/kilowattHour",
+        "megajoule": "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType/m=
egajoule",
+        "other": "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType/other=
",
     }
     # Kilowatt-hour.
-    kilowattHour =3D "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/k=
ilowattHour"
+    kilowattHour =3D "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType/k=
ilowattHour"
     # Megajoule.
-    megajoule =3D "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/mega=
joule"
+    megajoule =3D "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType/mega=
joule"
     # Any other units of energy measurement.
-    other =3D "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/other"
+    other =3D "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType/other"
=20
=20
 # Specifies the safety risk level.
-@register("https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentType", =
compact_type=3D"ai_SafetyRiskAssessmentType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessmentType", =
compact_type=3D"ai_SafetyRiskAssessmentType", abstract=3DFalse)
 class ai_SafetyRiskAssessmentType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "high": "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentT=
ype/high",
-        "low": "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentTy=
pe/low",
-        "medium": "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmen=
tType/medium",
-        "serious": "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessme=
ntType/serious",
+        "high": "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessmentT=
ype/high",
+        "low": "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessmentTy=
pe/low",
+        "medium": "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessmen=
tType/medium",
+        "serious": "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessme=
ntType/serious",
     }
     # The second-highest level of risk posed by an AI system.
-    high =3D "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentType=
/high"
+    high =3D "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessmentType=
/high"
     # Low/no risk is posed by an AI system.
-    low =3D "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentType/=
low"
+    low =3D "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessmentType/=
low"
     # The third-highest level of risk posed by an AI system.
-    medium =3D "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentTy=
pe/medium"
+    medium =3D "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessmentTy=
pe/medium"
     # The highest level of risk posed by an AI system.
-    serious =3D "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentT=
ype/serious"
+    serious =3D "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessmentT=
ype/serious"
=20
=20
 # Specifies the type of an annotation.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType", compact_=
type=3D"AnnotationType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/AnnotationType", compact_=
type=3D"AnnotationType", abstract=3DFalse)
 class AnnotationType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "other": "https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType/oth=
er",
-        "review": "https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType/re=
view",
+        "other": "https://spdx.org/rdf/3.0.1/terms/Core/AnnotationType/oth=
er",
+        "review": "https://spdx.org/rdf/3.0.1/terms/Core/AnnotationType/re=
view",
     }
-    # Used to store extra information about an Element which is not part o=
f a Review (e.g. extra information provided during the creation of the Elem=
ent).
-    other =3D "https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType/other"
+    # Used to store extra information about an Element which is not part o=
f a review (e.g. extra information provided during the creation of the Elem=
ent).
+    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/AnnotationType/other"
     # Used when someone reviews the Element.
-    review =3D "https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType/revie=
w"
+    review =3D "https://spdx.org/rdf/3.0.1/terms/Core/AnnotationType/revie=
w"
=20
=20
 # Provides information about the creation of the Element.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/CreationInfo", compact_ty=
pe=3D"CreationInfo", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/CreationInfo", compact_ty=
pe=3D"CreationInfo", abstract=3DFalse)
 class CreationInfo(SHACLObject):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
@@ -2607,22 +2105,24 @@ class CreationInfo(SHACLObject):
         cls._add_property(
             "comment",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/comment",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
             compact=3D"comment",
         )
         # Identifies when the Element was originally created.
         cls._add_property(
             "created",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/created",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/created",
             min_count=3D1,
             compact=3D"created",
         )
         # Identifies who or what created the Element.
         cls._add_property(
             "createdBy",
-            ListProp(ObjectProp(Agent, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/createdBy",
+            ListProp(ObjectProp(Agent, False, context=3D[
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganizati=
on", "SpdxOrganization"),
+                ],)),
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/createdBy",
             min_count=3D1,
             compact=3D"createdBy",
         )
@@ -2630,23 +2130,24 @@ class CreationInfo(SHACLObject):
         cls._add_property(
             "createdUsing",
             ListProp(ObjectProp(Tool, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/createdUsing",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/createdUsing",
             compact=3D"createdUsing",
         )
-        # Provides a reference number that can be used to understand how t=
o parse and interpret an Element.
+        # Provides a reference number that can be used to understand how t=
o parse and
+        # interpret an Element.
         cls._add_property(
             "specVersion",
             StringProp(pattern=3Dr"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d=
*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-=
Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/specVersion",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/specVersion",
             min_count=3D1,
             compact=3D"specVersion",
         )
=20
=20
 # A key with an associated value.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/DictionaryEntry", compact=
_type=3D"DictionaryEntry", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/DictionaryEntry", compact=
_type=3D"DictionaryEntry", abstract=3DFalse)
 class DictionaryEntry(SHACLObject):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
@@ -2657,7 +2158,7 @@ class DictionaryEntry(SHACLObject):
         cls._add_property(
             "key",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/key",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/key",
             min_count=3D1,
             compact=3D"key",
         )
@@ -2665,26 +2166,26 @@ class DictionaryEntry(SHACLObject):
         cls._add_property(
             "value",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/value",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/value",
             compact=3D"value",
         )
=20
=20
 # Base domain class from which all other SPDX-3.0 domain classes derive.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/Element", compact_type=3D=
"Element", abstract=3DTrue)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/Element", compact_type=3D=
"Element", abstract=3DTrue)
 class Element(SHACLObject):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
-        "NoAssertionElement": "https://spdx.org/rdf/3.0.0/terms/Core/NoAss=
ertionElement",
-        "NoneElement": "https://spdx.org/rdf/3.0.0/terms/Core/NoneElement",
+        "NoAssertionElement": "https://spdx.org/rdf/3.0.1/terms/Core/NoAss=
ertionElement",
+        "NoneElement": "https://spdx.org/rdf/3.0.1/terms/Core/NoneElement",
     }
     # An Individual Value for Element representing a set of Elements of un=
known
     # identify or cardinality (number).
-    NoAssertionElement =3D "https://spdx.org/rdf/3.0.0/terms/Core/NoAssert=
ionElement"
+    NoAssertionElement =3D "https://spdx.org/rdf/3.0.1/terms/Core/NoAssert=
ionElement"
     # An Individual Value for Element representing a set of Elements with
     # cardinality (number/count) of zero.
-    NoneElement =3D "https://spdx.org/rdf/3.0.0/terms/Core/NoneElement"
+    NoneElement =3D "https://spdx.org/rdf/3.0.1/terms/Core/NoneElement"
=20
     @classmethod
     def _register_props(cls):
@@ -2694,14 +2195,14 @@ class Element(SHACLObject):
         cls._add_property(
             "comment",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/comment",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
             compact=3D"comment",
         )
         # Provides information about the creation of the Element.
         cls._add_property(
             "creationInfo",
             ObjectProp(CreationInfo, True),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/creationInfo",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/creationInfo",
             min_count=3D1,
             compact=3D"creationInfo",
         )
@@ -2709,14 +2210,14 @@ class Element(SHACLObject):
         cls._add_property(
             "description",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/description",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/description",
             compact=3D"description",
         )
         # Specifies an Extension characterization of some aspect of an Ele=
ment.
         cls._add_property(
             "extension",
             ListProp(ObjectProp(extension_Extension, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/extension",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/extension",
             compact=3D"extension",
         )
         # Provides a reference to a resource outside the scope of SPDX-3.0=
 content
@@ -2724,7 +2225,7 @@ class Element(SHACLObject):
         cls._add_property(
             "externalIdentifier",
             ListProp(ObjectProp(ExternalIdentifier, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/externalIdentifie=
r",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalIdentifie=
r",
             compact=3D"externalIdentifier",
         )
         # Points to a resource outside the scope of the SPDX-3.0 content
@@ -2732,21 +2233,21 @@ class Element(SHACLObject):
         cls._add_property(
             "externalRef",
             ListProp(ObjectProp(ExternalRef, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/externalRef",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalRef",
             compact=3D"externalRef",
         )
         # Identifies the name of an Element as designated by the creator.
         cls._add_property(
             "name",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/name",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/name",
             compact=3D"name",
         )
         # A short description of an Element.
         cls._add_property(
             "summary",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/summary",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/summary",
             compact=3D"summary",
         )
         # Provides an IntegrityMethod with which the integrity of an Eleme=
nt can be
@@ -2754,15 +2255,15 @@ class Element(SHACLObject):
         cls._add_property(
             "verifiedUsing",
             ListProp(ObjectProp(IntegrityMethod, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/verifiedUsing",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/verifiedUsing",
             compact=3D"verifiedUsing",
         )
=20
=20
 # A collection of Elements, not necessarily with unifying context.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/ElementCollection", compa=
ct_type=3D"ElementCollection", abstract=3DTrue)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/ElementCollection", compa=
ct_type=3D"ElementCollection", abstract=3DTrue)
 class ElementCollection(Element):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -2773,8 +2274,14 @@ class ElementCollection(Element):
         # Refers to one or more Elements that are part of an ElementCollec=
tion.
         cls._add_property(
             "element",
-            ListProp(ObjectProp(Element, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/element",
+            ListProp(ObjectProp(Element, False, context=3D[
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement", =
"NoneElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganizati=
on", "SpdxOrganization"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionEle=
ment", "NoAssertionElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oneLicense", "expandedlicensing_NoneLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                ],)),
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/element",
             compact=3D"element",
         )
         # Describes one a profile which the creator of this ElementCollect=
ion intends to
@@ -2782,33 +2289,39 @@ class ElementCollection(Element):
         cls._add_property(
             "profileConformance",
             ListProp(EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/ai", "ai"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/build", "build"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/core", "core"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/dataset", "dataset"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/expandedLicensing", "expandedLicensing"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/extension", "extension"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/lite", "lite"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/security", "security"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/simpleLicensing", "simpleLicensing"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/software", "software"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentif=
ierType/ai", "ai"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentif=
ierType/build", "build"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentif=
ierType/core", "core"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentif=
ierType/dataset", "dataset"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentif=
ierType/expandedLicensing", "expandedLicensing"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentif=
ierType/extension", "extension"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentif=
ierType/lite", "lite"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentif=
ierType/security", "security"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentif=
ierType/simpleLicensing", "simpleLicensing"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentif=
ierType/software", "software"),
                 ])),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/profileConformanc=
e",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/profileConformanc=
e",
             compact=3D"profileConformance",
         )
         # This property is used to denote the root Element(s) of a tree of=
 elements contained in a BOM.
         cls._add_property(
             "rootElement",
-            ListProp(ObjectProp(Element, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/rootElement",
+            ListProp(ObjectProp(Element, False, context=3D[
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement", =
"NoneElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganizati=
on", "SpdxOrganization"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionEle=
ment", "NoAssertionElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oneLicense", "expandedlicensing_NoneLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                ],)),
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/rootElement",
             compact=3D"rootElement",
         )
=20
=20
 # A reference to a resource identifier defined outside the scope of SPDX-3=
.0 content that uniquely identifies an Element.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifier", comp=
act_type=3D"ExternalIdentifier", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifier", comp=
act_type=3D"ExternalIdentifier", abstract=3DFalse)
 class ExternalIdentifier(SHACLObject):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
@@ -2820,26 +2333,26 @@ class ExternalIdentifier(SHACLObject):
         cls._add_property(
             "comment",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/comment",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
             compact=3D"comment",
         )
         # Specifies the type of the external identifier.
         cls._add_property(
             "externalIdentifierType",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/cpe22", "cpe22"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/cpe23", "cpe23"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/cve", "cve"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/email", "email"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/gitoid", "gitoid"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/other", "other"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/packageUrl", "packageUrl"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/securityOther", "securityOther"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/swhid", "swhid"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/swid", "swid"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/urlScheme", "urlScheme"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdenti=
fierType/cpe22", "cpe22"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdenti=
fierType/cpe23", "cpe23"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdenti=
fierType/cve", "cve"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdenti=
fierType/email", "email"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdenti=
fierType/gitoid", "gitoid"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdenti=
fierType/other", "other"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdenti=
fierType/packageUrl", "packageUrl"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdenti=
fierType/securityOther", "securityOther"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdenti=
fierType/swhid", "swhid"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdenti=
fierType/swid", "swid"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdenti=
fierType/urlScheme", "urlScheme"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/externalIdentifie=
rType",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalIdentifie=
rType",
             min_count=3D1,
             compact=3D"externalIdentifierType",
         )
@@ -2847,7 +2360,7 @@ class ExternalIdentifier(SHACLObject):
         cls._add_property(
             "identifier",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/identifier",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/identifier",
             min_count=3D1,
             compact=3D"identifier",
         )
@@ -2855,63 +2368,64 @@ class ExternalIdentifier(SHACLObject):
         cls._add_property(
             "identifierLocator",
             ListProp(AnyURIProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/identifierLocator=
",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/identifierLocator=
",
             compact=3D"identifierLocator",
         )
         # An entity that is authorized to issue identification credentials.
         cls._add_property(
             "issuingAuthority",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/issuingAuthority",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/issuingAuthority",
             compact=3D"issuingAuthority",
         )
=20
=20
 # Specifies the type of an external identifier.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType", =
compact_type=3D"ExternalIdentifierType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierType", =
compact_type=3D"ExternalIdentifierType", abstract=3DFalse)
 class ExternalIdentifierType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "cpe22": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifier=
Type/cpe22",
-        "cpe23": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifier=
Type/cpe23",
-        "cve": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierTy=
pe/cve",
-        "email": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifier=
Type/email",
-        "gitoid": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifie=
rType/gitoid",
-        "other": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifier=
Type/other",
-        "packageUrl": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdent=
ifierType/packageUrl",
-        "securityOther": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalId=
entifierType/securityOther",
-        "swhid": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifier=
Type/swhid",
-        "swid": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierT=
ype/swid",
-        "urlScheme": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/urlScheme",
+        "cpe22": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifier=
Type/cpe22",
+        "cpe23": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifier=
Type/cpe23",
+        "cve": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierTy=
pe/cve",
+        "email": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifier=
Type/email",
+        "gitoid": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifie=
rType/gitoid",
+        "other": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifier=
Type/other",
+        "packageUrl": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdent=
ifierType/packageUrl",
+        "securityOther": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalId=
entifierType/securityOther",
+        "swhid": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifier=
Type/swhid",
+        "swid": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierT=
ype/swid",
+        "urlScheme": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdenti=
fierType/urlScheme",
     }
-    # https://cpe.mitre.org/files/cpe-specification_2.2.pdf
-    cpe22 =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierTyp=
e/cpe22"
-    # https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf
-    cpe23 =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierTyp=
e/cpe23"
-    # An identifier for a specific software flaw defined within the offici=
al CVE Dictionary and that conforms to the CVE specification as defined by =
https://csrc.nist.gov/glossary/term/cve_id.
-    cve =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/=
cve"
-    # https://datatracker.ietf.org/doc/html/rfc3696#section-3
-    email =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierTyp=
e/email"
-    # https://www.iana.org/assignments/uri-schemes/prov/gitoid Gitoid stan=
ds for [Git Object ID](https://git-scm.com/book/en/v2/Git-Internals-Git-Obj=
ects) and a gitoid of type blob is a unique hash of a binary artifact. A gi=
toid may represent the software [Artifact ID](https://github.com/omnibor/sp=
ec/blob/main/spec/SPEC.md#artifact-id) or the [OmniBOR Identifier](https://=
github.com/omnibor/spec/blob/main/spec/SPEC.md#omnibor-identifier) for the =
software artifact's associated [OmniBOR Document](https://github.com/omnibo=
r/spec/blob/main/spec/SPEC.md#omnibor-document); this ambiguity exists beca=
use the OmniBOR Document is itself an artifact, and the gitoid of that arti=
fact is its valid identifier. Omnibor is a minimalistic schema to describe =
software [Artifact Dependency Graphs](https://github.com/omnibor/spec/blob/=
main/spec/SPEC.md#artifact-dependency-graph-adg). Gitoids calculated on sof=
tware artifacts (Snippet, File, or Package Elements) should be recorded in =
the SPDX 3.0 SoftwareArtifact's ContentIdentifier property. Gitoids calcula=
ted on the OmniBOR Document (OmniBOR Identifiers) should be recorded in the=
 SPDX 3.0 Element's ExternalIdentifier property.
-    gitoid =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierTy=
pe/gitoid"
-    # Used when the type doesn't match any of the other options.
-    other =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierTyp=
e/other"
-    # https://github.com/package-url/purl-spec
-    packageUrl =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifi=
erType/packageUrl"
+    # [Common Platform Enumeration Specification 2.2](https://cpe.mitre.or=
g/files/cpe-specification_2.2.pdf)
+    cpe22 =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierTyp=
e/cpe22"
+    # [Common Platform Enumeration: Naming Specification Version 2.3](http=
s://csrc.nist.gov/publications/detail/nistir/7695/final)
+    cpe23 =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierTyp=
e/cpe23"
+    # Common Vulnerabilities and Exposures identifiers, an identifier for =
a specific software flaw defined within the official CVE Dictionary and tha=
t conforms to the [CVE specification](https://csrc.nist.gov/glossary/term/c=
ve_id).
+    cve =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierType/=
cve"
+    # Email address, as defined in [RFC 3696](https://datatracker.ietf.org=
/doc/rfc3986/) Section 3.
+    email =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierTyp=
e/email"
+    # [Gitoid](https://www.iana.org/assignments/uri-schemes/prov/gitoid), =
stands for [Git Object ID](https://git-scm.com/book/en/v2/Git-Internals-Git=
-Objects). A gitoid of type blob is a unique hash of a binary artifact. A g=
itoid may represent either an [Artifact Identifier](https://github.com/omni=
bor/spec/blob/eb1ee5c961c16215eb8709b2975d193a2007a35d/spec/SPEC.md#artifac=
t-identifier-types) for the software artifact or an [Input Manifest Identif=
ier](https://github.com/omnibor/spec/blob/eb1ee5c961c16215eb8709b2975d193a2=
007a35d/spec/SPEC.md#input-manifest-identifier) for the software artifact's=
 associated [Artifact Input Manifest](https://github.com/omnibor/spec/blob/=
eb1ee5c961c16215eb8709b2975d193a2007a35d/spec/SPEC.md#artifact-input-manife=
st); this ambiguity exists because the Artifact Input Manifest is itself an=
 artifact, and the gitoid of that artifact is its valid identifier. Gitoids=
 calculated on software artifacts (Snippet, File, or Package Elements) shou=
ld be recorded in the SPDX 3.0 SoftwareArtifact's contentIdentifier propert=
y. Gitoids calculated on the Artifact Input Manifest (Input Manifest Identi=
fier) should be recorded in the SPDX 3.0 Element's externalIdentifier prope=
rty. See [OmniBOR Specification](https://github.com/omnibor/spec/), a minim=
alistic specification for describing software [Artifact Dependency Graphs](=
https://github.com/omnibor/spec/blob/eb1ee5c961c16215eb8709b2975d193a2007a3=
5d/spec/SPEC.md#artifact-dependency-graph-adg).
+    gitoid =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierTy=
pe/gitoid"
+    # Used when the type does not match any of the other options.
+    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierTyp=
e/other"
+    # Package URL, as defined in the corresponding [Annex](../../../annexe=
s/pkg-url-specification.md) of this specification.
+    packageUrl =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifi=
erType/packageUrl"
     # Used when there is a security related identifier of unspecified type.
-    securityOther =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdent=
ifierType/securityOther"
-    # SoftWare Hash IDentifier, persistent intrinsic identifiers for digit=
al artifacts, such as files, trees (also known as directories or folders), =
commits, and other objects typically found in version control systems. The =
syntax of the identifiers is defined in the [SWHID specification](https://w=
ww.swhid.org/specification/v1.1/4.Syntax) and they typically look like `swh=
:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2`.
-    swhid =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierTyp=
e/swhid"
-    # https://www.ietf.org/archive/id/draft-ietf-sacm-coswid-21.html#secti=
on-2.3
-    swid =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType=
/swid"
-    # the scheme used in order to locate a resource https://www.iana.org/a=
ssignments/uri-schemes/uri-schemes.xhtml
-    urlScheme =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifie=
rType/urlScheme"
-
-
-# A map of Element identifiers that are used within a Document but defined=
 external to that Document.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/ExternalMap", compact_typ=
e=3D"ExternalMap", abstract=3DFalse)
+    securityOther =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdent=
ifierType/securityOther"
+    # SoftWare Hash IDentifier, a persistent intrinsic identifier for digi=
tal artifacts, such as files, trees (also known as directories or folders),=
 commits, and other objects typically found in version control systems. The=
 format of the identifiers is defined in the [SWHID specification](https://=
www.swhid.org/specification/v1.1/4.Syntax) (ISO/IEC DIS 18670). They typica=
lly look like `swh:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2`.
+    swhid =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierTyp=
e/swhid"
+    # Concise Software Identification (CoSWID) tag, as defined in [RFC 939=
3](https://datatracker.ietf.org/doc/rfc9393/) Section 2.3.
+    swid =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierType=
/swid"
+    # [Uniform Resource Identifier (URI) Schemes](https://www.iana.org/ass=
ignments/uri-schemes/uri-schemes.xhtml). The scheme used in order to locate=
 a resource.
+    urlScheme =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifie=
rType/urlScheme"
+
+
+# A map of Element identifiers that are used within an SpdxDocument but de=
fined
+# external to that SpdxDocument.
+@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalMap", compact_typ=
e=3D"ExternalMap", abstract=3DFalse)
 class ExternalMap(SHACLObject):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
@@ -2923,15 +2437,15 @@ class ExternalMap(SHACLObject):
         cls._add_property(
             "definingArtifact",
             ObjectProp(Artifact, False),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/definingArtifact",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/definingArtifact",
             compact=3D"definingArtifact",
         )
-        # Identifies an external Element used within a Document but define=
d external to
-        # that Document.
+        # Identifies an external Element used within an SpdxDocument but d=
efined
+        # external to that SpdxDocument.
         cls._add_property(
             "externalSpdxId",
             AnyURIProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/externalSpdxId",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalSpdxId",
             min_count=3D1,
             compact=3D"externalSpdxId",
         )
@@ -2939,7 +2453,7 @@ class ExternalMap(SHACLObject):
         cls._add_property(
             "locationHint",
             AnyURIProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/locationHint",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/locationHint",
             compact=3D"locationHint",
         )
         # Provides an IntegrityMethod with which the integrity of an Eleme=
nt can be
@@ -2947,15 +2461,15 @@ class ExternalMap(SHACLObject):
         cls._add_property(
             "verifiedUsing",
             ListProp(ObjectProp(IntegrityMethod, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/verifiedUsing",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/verifiedUsing",
             compact=3D"verifiedUsing",
         )
=20
=20
 # A reference to a resource outside the scope of SPDX-3.0 content related =
to an Element.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRef", compact_typ=
e=3D"ExternalRef", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef", compact_typ=
e=3D"ExternalRef", abstract=3DFalse)
 class ExternalRef(SHACLObject):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
@@ -2967,300 +2481,303 @@ class ExternalRef(SHACLObject):
         cls._add_property(
             "comment",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/comment",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
             compact=3D"comment",
         )
-        # Specifies the media type of an Element or Property.
+        # Provides information about the content type of an Element or a P=
roperty.
         cls._add_property(
             "contentType",
             StringProp(pattern=3Dr"^[^\/]+\/[^\/]+$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/contentType",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/contentType",
             compact=3D"contentType",
         )
         # Specifies the type of the external reference.
         cls._add_property(
             "externalRefType",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/altDownloadLocation", "altDownloadLocation"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/altWebPage", "altWebPage"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/binaryArtifact", "binaryArtifact"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/bower", "bower"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/buildMeta", "buildMeta"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/buildSystem", "buildSystem"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/certificationReport", "certificationReport"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/chat", "chat"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/componentAnalysisReport", "componentAnalysisReport"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/cwe", "cwe"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/documentation", "documentation"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/dynamicAnalysisReport", "dynamicAnalysisReport"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/eolNotice", "eolNotice"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/exportControlAssessment", "exportControlAssessment"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/funding", "funding"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/issueTracker", "issueTracker"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/license", "license"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/mailingList", "mailingList"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/mavenCentral", "mavenCentral"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/metrics", "metrics"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/npm", "npm"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/nuget", "nuget"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/other", "other"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/privacyAssessment", "privacyAssessment"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/productMetadata", "productMetadata"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/purchaseOrder", "purchaseOrder"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/qualityAssessmentReport", "qualityAssessmentReport"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/releaseHistory", "releaseHistory"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/releaseNotes", "releaseNotes"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/riskAssessment", "riskAssessment"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/runtimeAnalysisReport", "runtimeAnalysisReport"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/secureSoftwareAttestation", "secureSoftwareAttestation"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/securityAdversaryModel", "securityAdversaryModel"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/securityAdvisory", "securityAdvisory"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/securityFix", "securityFix"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/securityOther", "securityOther"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/securityPenTestReport", "securityPenTestReport"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/securityPolicy", "securityPolicy"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/securityThreatModel", "securityThreatModel"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/socialMedia", "socialMedia"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/sourceArtifact", "sourceArtifact"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/staticAnalysisReport", "staticAnalysisReport"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/support", "support"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/vcs", "vcs"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/vulnerabilityDisclosureReport", "vulnerabilityDisclosureReport"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/vulnerabilityExploitabilityAssessment", "vulnerabilityExploitabilityAsses=
sment"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/altDownloadLocation", "altDownloadLocation"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/altWebPage", "altWebPage"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/binaryArtifact", "binaryArtifact"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/bower", "bower"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/buildMeta", "buildMeta"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/buildSystem", "buildSystem"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/certificationReport", "certificationReport"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/chat", "chat"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/componentAnalysisReport", "componentAnalysisReport"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/cwe", "cwe"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/documentation", "documentation"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/dynamicAnalysisReport", "dynamicAnalysisReport"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/eolNotice", "eolNotice"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/exportControlAssessment", "exportControlAssessment"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/funding", "funding"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/issueTracker", "issueTracker"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/license", "license"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/mailingList", "mailingList"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/mavenCentral", "mavenCentral"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/metrics", "metrics"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/npm", "npm"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/nuget", "nuget"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/other", "other"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/privacyAssessment", "privacyAssessment"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/productMetadata", "productMetadata"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/purchaseOrder", "purchaseOrder"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/qualityAssessmentReport", "qualityAssessmentReport"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/releaseHistory", "releaseHistory"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/releaseNotes", "releaseNotes"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/riskAssessment", "riskAssessment"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/runtimeAnalysisReport", "runtimeAnalysisReport"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/secureSoftwareAttestation", "secureSoftwareAttestation"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/securityAdversaryModel", "securityAdversaryModel"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/securityAdvisory", "securityAdvisory"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/securityFix", "securityFix"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/securityOther", "securityOther"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/securityPenTestReport", "securityPenTestReport"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/securityPolicy", "securityPolicy"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/securityThreatModel", "securityThreatModel"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/socialMedia", "socialMedia"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/sourceArtifact", "sourceArtifact"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/staticAnalysisReport", "staticAnalysisReport"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/support", "support"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/vcs", "vcs"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/vulnerabilityDisclosureReport", "vulnerabilityDisclosureReport"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/vulnerabilityExploitabilityAssessment", "vulnerabilityExploitabilityAsses=
sment"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/externalRefType",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalRefType",
             compact=3D"externalRefType",
         )
         # Provides the location of an external reference.
         cls._add_property(
             "locator",
             ListProp(StringProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/locator",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/locator",
             compact=3D"locator",
         )
=20
=20
 # Specifies the type of an external reference.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType", compact=
_type=3D"ExternalRefType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType", compact=
_type=3D"ExternalRefType", abstract=3DFalse)
 class ExternalRefType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "altDownloadLocation": "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/altDownloadLocation",
-        "altWebPage": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTy=
pe/altWebPage",
-        "binaryArtifact": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalR=
efType/binaryArtifact",
-        "bower": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/bo=
wer",
-        "buildMeta": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/buildMeta",
-        "buildSystem": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/buildSystem",
-        "certificationReport": "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/certificationReport",
-        "chat": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/cha=
t",
-        "componentAnalysisReport": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalRefType/componentAnalysisReport",
-        "cwe": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/cwe",
-        "documentation": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRe=
fType/documentation",
-        "dynamicAnalysisReport": "https://spdx.org/rdf/3.0.0/terms/Core/Ex=
ternalRefType/dynamicAnalysisReport",
-        "eolNotice": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/eolNotice",
-        "exportControlAssessment": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalRefType/exportControlAssessment",
-        "funding": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/=
funding",
-        "issueTracker": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRef=
Type/issueTracker",
-        "license": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/=
license",
-        "mailingList": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/mailingList",
-        "mavenCentral": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRef=
Type/mavenCentral",
-        "metrics": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/=
metrics",
-        "npm": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/npm",
-        "nuget": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/nu=
get",
-        "other": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/ot=
her",
-        "privacyAssessment": "https://spdx.org/rdf/3.0.0/terms/Core/Extern=
alRefType/privacyAssessment",
-        "productMetadata": "https://spdx.org/rdf/3.0.0/terms/Core/External=
RefType/productMetadata",
-        "purchaseOrder": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRe=
fType/purchaseOrder",
-        "qualityAssessmentReport": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalRefType/qualityAssessmentReport",
-        "releaseHistory": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalR=
efType/releaseHistory",
-        "releaseNotes": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRef=
Type/releaseNotes",
-        "riskAssessment": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalR=
efType/riskAssessment",
-        "runtimeAnalysisReport": "https://spdx.org/rdf/3.0.0/terms/Core/Ex=
ternalRefType/runtimeAnalysisReport",
-        "secureSoftwareAttestation": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/ExternalRefType/secureSoftwareAttestation",
-        "securityAdversaryModel": "https://spdx.org/rdf/3.0.0/terms/Core/E=
xternalRefType/securityAdversaryModel",
-        "securityAdvisory": "https://spdx.org/rdf/3.0.0/terms/Core/Externa=
lRefType/securityAdvisory",
-        "securityFix": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/securityFix",
-        "securityOther": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRe=
fType/securityOther",
-        "securityPenTestReport": "https://spdx.org/rdf/3.0.0/terms/Core/Ex=
ternalRefType/securityPenTestReport",
-        "securityPolicy": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalR=
efType/securityPolicy",
-        "securityThreatModel": "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/securityThreatModel",
-        "socialMedia": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/socialMedia",
-        "sourceArtifact": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalR=
efType/sourceArtifact",
-        "staticAnalysisReport": "https://spdx.org/rdf/3.0.0/terms/Core/Ext=
ernalRefType/staticAnalysisReport",
-        "support": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/=
support",
-        "vcs": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/vcs",
-        "vulnerabilityDisclosureReport": "https://spdx.org/rdf/3.0.0/terms=
/Core/ExternalRefType/vulnerabilityDisclosureReport",
-        "vulnerabilityExploitabilityAssessment": "https://spdx.org/rdf/3.0=
.0/terms/Core/ExternalRefType/vulnerabilityExploitabilityAssessment",
+        "altDownloadLocation": "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/altDownloadLocation",
+        "altWebPage": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTy=
pe/altWebPage",
+        "binaryArtifact": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalR=
efType/binaryArtifact",
+        "bower": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/bo=
wer",
+        "buildMeta": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/buildMeta",
+        "buildSystem": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/buildSystem",
+        "certificationReport": "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/certificationReport",
+        "chat": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/cha=
t",
+        "componentAnalysisReport": "https://spdx.org/rdf/3.0.1/terms/Core/=
ExternalRefType/componentAnalysisReport",
+        "cwe": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/cwe",
+        "documentation": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/documentation",
+        "dynamicAnalysisReport": "https://spdx.org/rdf/3.0.1/terms/Core/Ex=
ternalRefType/dynamicAnalysisReport",
+        "eolNotice": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/eolNotice",
+        "exportControlAssessment": "https://spdx.org/rdf/3.0.1/terms/Core/=
ExternalRefType/exportControlAssessment",
+        "funding": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/=
funding",
+        "issueTracker": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef=
Type/issueTracker",
+        "license": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/=
license",
+        "mailingList": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/mailingList",
+        "mavenCentral": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef=
Type/mavenCentral",
+        "metrics": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/=
metrics",
+        "npm": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/npm",
+        "nuget": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/nu=
get",
+        "other": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/ot=
her",
+        "privacyAssessment": "https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/privacyAssessment",
+        "productMetadata": "https://spdx.org/rdf/3.0.1/terms/Core/External=
RefType/productMetadata",
+        "purchaseOrder": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/purchaseOrder",
+        "qualityAssessmentReport": "https://spdx.org/rdf/3.0.1/terms/Core/=
ExternalRefType/qualityAssessmentReport",
+        "releaseHistory": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalR=
efType/releaseHistory",
+        "releaseNotes": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef=
Type/releaseNotes",
+        "riskAssessment": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalR=
efType/riskAssessment",
+        "runtimeAnalysisReport": "https://spdx.org/rdf/3.0.1/terms/Core/Ex=
ternalRefType/runtimeAnalysisReport",
+        "secureSoftwareAttestation": "https://spdx.org/rdf/3.0.1/terms/Cor=
e/ExternalRefType/secureSoftwareAttestation",
+        "securityAdversaryModel": "https://spdx.org/rdf/3.0.1/terms/Core/E=
xternalRefType/securityAdversaryModel",
+        "securityAdvisory": "https://spdx.org/rdf/3.0.1/terms/Core/Externa=
lRefType/securityAdvisory",
+        "securityFix": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/securityFix",
+        "securityOther": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/securityOther",
+        "securityPenTestReport": "https://spdx.org/rdf/3.0.1/terms/Core/Ex=
ternalRefType/securityPenTestReport",
+        "securityPolicy": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalR=
efType/securityPolicy",
+        "securityThreatModel": "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/securityThreatModel",
+        "socialMedia": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/socialMedia",
+        "sourceArtifact": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalR=
efType/sourceArtifact",
+        "staticAnalysisReport": "https://spdx.org/rdf/3.0.1/terms/Core/Ext=
ernalRefType/staticAnalysisReport",
+        "support": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/=
support",
+        "vcs": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/vcs",
+        "vulnerabilityDisclosureReport": "https://spdx.org/rdf/3.0.1/terms=
/Core/ExternalRefType/vulnerabilityDisclosureReport",
+        "vulnerabilityExploitabilityAssessment": "https://spdx.org/rdf/3.0=
.1/terms/Core/ExternalRefType/vulnerabilityExploitabilityAssessment",
     }
     # A reference to an alternative download location.
-    altDownloadLocation =3D "https://spdx.org/rdf/3.0.0/terms/Core/Externa=
lRefType/altDownloadLocation"
+    altDownloadLocation =3D "https://spdx.org/rdf/3.0.1/terms/Core/Externa=
lRefType/altDownloadLocation"
     # A reference to an alternative web page.
-    altWebPage =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/=
altWebPage"
+    altWebPage =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/=
altWebPage"
     # A reference to binary artifacts related to a package.
-    binaryArtifact =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/binaryArtifact"
-    # A reference to a bower package.
-    bower =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/bower"
+    binaryArtifact =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/binaryArtifact"
+    # A reference to a Bower package. The package locator format, looks li=
ke `package#version`, is defined in the "install" section of [Bower API doc=
umentation](https://bower.io/docs/api/#install).
+    bower =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/bower"
     # A reference build metadata related to a published package.
-    buildMeta =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/b=
uildMeta"
+    buildMeta =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/b=
uildMeta"
     # A reference build system used to create or publish the package.
-    buildSystem =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType=
/buildSystem"
+    buildSystem =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType=
/buildSystem"
     # A reference to a certification report for a package from an accredit=
ed/independent body.
-    certificationReport =3D "https://spdx.org/rdf/3.0.0/terms/Core/Externa=
lRefType/certificationReport"
+    certificationReport =3D "https://spdx.org/rdf/3.0.1/terms/Core/Externa=
lRefType/certificationReport"
     # A reference to the instant messaging system used by the maintainer f=
or a package.
-    chat =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/chat"
+    chat =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/chat"
     # A reference to a Software Composition Analysis (SCA) report.
-    componentAnalysisReport =3D "https://spdx.org/rdf/3.0.0/terms/Core/Ext=
ernalRefType/componentAnalysisReport"
-    # A reference to a source of software flaw defined within the official=
 CWE Dictionary that conforms to the CWE specification as defined by https:=
//csrc.nist.gov/glossary/term/common_weakness_enumeration.
-    cwe =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/cwe"
+    componentAnalysisReport =3D "https://spdx.org/rdf/3.0.1/terms/Core/Ext=
ernalRefType/componentAnalysisReport"
+    # [Common Weakness Enumeration](https://csrc.nist.gov/glossary/term/co=
mmon_weakness_enumeration). A reference to a source of software flaw define=
d within the official [CWE List](https://cwe.mitre.org/data/) that conforms=
 to the [CWE specification](https://cwe.mitre.org/).
+    cwe =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/cwe"
     # A reference to the documentation for a package.
-    documentation =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTy=
pe/documentation"
+    documentation =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTy=
pe/documentation"
     # A reference to a dynamic analysis report for a package.
-    dynamicAnalysisReport =3D "https://spdx.org/rdf/3.0.0/terms/Core/Exter=
nalRefType/dynamicAnalysisReport"
+    dynamicAnalysisReport =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exter=
nalRefType/dynamicAnalysisReport"
     # A reference to the End Of Sale (EOS) and/or End Of Life (EOL) inform=
ation related to a package.
-    eolNotice =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/e=
olNotice"
+    eolNotice =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/e=
olNotice"
     # A reference to a export control assessment for a package.
-    exportControlAssessment =3D "https://spdx.org/rdf/3.0.0/terms/Core/Ext=
ernalRefType/exportControlAssessment"
+    exportControlAssessment =3D "https://spdx.org/rdf/3.0.1/terms/Core/Ext=
ernalRefType/exportControlAssessment"
     # A reference to funding information related to a package.
-    funding =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/fun=
ding"
+    funding =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/fun=
ding"
     # A reference to the issue tracker for a package.
-    issueTracker =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/issueTracker"
+    issueTracker =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/issueTracker"
     # A reference to additional license information related to an artifact.
-    license =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/lic=
ense"
+    license =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/lic=
ense"
     # A reference to the mailing list used by the maintainer for a package.
-    mailingList =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType=
/mailingList"
-    # A reference to a maven repository artifact.
-    mavenCentral =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/mavenCentral"
+    mailingList =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType=
/mailingList"
+    # A reference to a Maven repository artifact. The artifact locator for=
mat is defined in the [Maven documentation](https://maven.apache.org/guides=
/mini/guide-naming-conventions.html) and looks like `groupId:artifactId[:ve=
rsion]`.
+    mavenCentral =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/mavenCentral"
     # A reference to metrics related to package such as OpenSSF scorecards.
-    metrics =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/met=
rics"
-    # A reference to an npm package.
-    npm =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/npm"
-    # A reference to a nuget package.
-    nuget =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/nuget"
-    # Used when the type doesn't match any of the other options.
-    other =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/other"
+    metrics =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/met=
rics"
+    # A reference to an npm package. The package locator format is defined=
 in the [npm documentation](https://docs.npmjs.com/cli/v10/configuring-npm/=
package-json) and looks like `package@version`.
+    npm =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/npm"
+    # A reference to a NuGet package. The package locator format is define=
d in the [NuGet documentation](https://docs.nuget.org) and looks like `pack=
age/version`.
+    nuget =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/nuget"
+    # Used when the type does not match any of the other options.
+    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/other"
     # A reference to a privacy assessment for a package.
-    privacyAssessment =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalR=
efType/privacyAssessment"
+    privacyAssessment =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalR=
efType/privacyAssessment"
     # A reference to additional product metadata such as reference within =
organization's product catalog.
-    productMetadata =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRef=
Type/productMetadata"
+    productMetadata =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef=
Type/productMetadata"
     # A reference to a purchase order for a package.
-    purchaseOrder =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTy=
pe/purchaseOrder"
+    purchaseOrder =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTy=
pe/purchaseOrder"
     # A reference to a quality assessment for a package.
-    qualityAssessmentReport =3D "https://spdx.org/rdf/3.0.0/terms/Core/Ext=
ernalRefType/qualityAssessmentReport"
+    qualityAssessmentReport =3D "https://spdx.org/rdf/3.0.1/terms/Core/Ext=
ernalRefType/qualityAssessmentReport"
     # A reference to a published list of releases for a package.
-    releaseHistory =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/releaseHistory"
+    releaseHistory =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/releaseHistory"
     # A reference to the release notes for a package.
-    releaseNotes =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/releaseNotes"
+    releaseNotes =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/releaseNotes"
     # A reference to a risk assessment for a package.
-    riskAssessment =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/riskAssessment"
+    riskAssessment =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/riskAssessment"
     # A reference to a runtime analysis report for a package.
-    runtimeAnalysisReport =3D "https://spdx.org/rdf/3.0.0/terms/Core/Exter=
nalRefType/runtimeAnalysisReport"
+    runtimeAnalysisReport =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exter=
nalRefType/runtimeAnalysisReport"
     # A reference to information assuring that the software is developed u=
sing security practices as defined by [NIST SP 800-218 Secure Software Deve=
lopment Framework (SSDF) Version 1.1](https://csrc.nist.gov/pubs/sp/800/218=
/final) or [CISA Secure Software Development Attestation Form](https://www.=
cisa.gov/resources-tools/resources/secure-software-development-attestation-=
form).
-    secureSoftwareAttestation =3D "https://spdx.org/rdf/3.0.0/terms/Core/E=
xternalRefType/secureSoftwareAttestation"
+    secureSoftwareAttestation =3D "https://spdx.org/rdf/3.0.1/terms/Core/E=
xternalRefType/secureSoftwareAttestation"
     # A reference to the security adversary model for a package.
-    securityAdversaryModel =3D "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/securityAdversaryModel"
-    # A reference to a published security advisory (where advisory as defi=
ned per ISO 29147:2018) that may affect one or more elements, e.g., vendor =
advisories or specific NVD entries.
-    securityAdvisory =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRe=
fType/securityAdvisory"
+    securityAdversaryModel =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/securityAdversaryModel"
+    # A reference to a published security advisory (where advisory as defi=
ned per [ISO 29147:2018](https://www.iso.org/standard/72311.html)) that may=
 affect one or more elements, e.g., vendor advisories or specific NVD entri=
es.
+    securityAdvisory =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/securityAdvisory"
     # A reference to the patch or source code that fixes a vulnerability.
-    securityFix =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType=
/securityFix"
+    securityFix =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType=
/securityFix"
     # A reference to related security information of unspecified type.
-    securityOther =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTy=
pe/securityOther"
+    securityOther =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTy=
pe/securityOther"
     # A reference to a [penetration test](https://en.wikipedia.org/wiki/Pe=
netration_test) report for a package.
-    securityPenTestReport =3D "https://spdx.org/rdf/3.0.0/terms/Core/Exter=
nalRefType/securityPenTestReport"
+    securityPenTestReport =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exter=
nalRefType/securityPenTestReport"
     # A reference to instructions for reporting newly discovered security =
vulnerabilities for a package.
-    securityPolicy =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/securityPolicy"
+    securityPolicy =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/securityPolicy"
     # A reference the [security threat model](https://en.wikipedia.org/wik=
i/Threat_model) for a package.
-    securityThreatModel =3D "https://spdx.org/rdf/3.0.0/terms/Core/Externa=
lRefType/securityThreatModel"
+    securityThreatModel =3D "https://spdx.org/rdf/3.0.1/terms/Core/Externa=
lRefType/securityThreatModel"
     # A reference to a social media channel for a package.
-    socialMedia =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType=
/socialMedia"
+    socialMedia =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType=
/socialMedia"
     # A reference to an artifact containing the sources for a package.
-    sourceArtifact =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/sourceArtifact"
+    sourceArtifact =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/sourceArtifact"
     # A reference to a static analysis report for a package.
-    staticAnalysisReport =3D "https://spdx.org/rdf/3.0.0/terms/Core/Extern=
alRefType/staticAnalysisReport"
+    staticAnalysisReport =3D "https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/staticAnalysisReport"
     # A reference to the software support channel or other support informa=
tion for a package.
-    support =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/sup=
port"
+    support =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/sup=
port"
     # A reference to a version control system related to a software artifa=
ct.
-    vcs =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/vcs"
-    # A reference to a Vulnerability Disclosure Report (VDR) which provide=
s the software supplier's analysis and findings describing the impact (or l=
ack of impact) that reported vulnerabilities have on packages or products i=
n the supplier's SBOM as defined in [NIST SP 800-161](https://csrc.nist.gov=
/pubs/sp/800/161/r1/final).
-    vulnerabilityDisclosureReport =3D "https://spdx.org/rdf/3.0.0/terms/Co=
re/ExternalRefType/vulnerabilityDisclosureReport"
+    vcs =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/vcs"
+    # A reference to a Vulnerability Disclosure Report (VDR) which provide=
s the software supplier's analysis and findings describing the impact (or l=
ack of impact) that reported vulnerabilities have on packages or products i=
n the supplier's SBOM as defined in [NIST SP 800-161 Cybersecurity Supply C=
hain Risk Management Practices for Systems and Organizations](https://csrc.=
nist.gov/pubs/sp/800/161/r1/final).
+    vulnerabilityDisclosureReport =3D "https://spdx.org/rdf/3.0.1/terms/Co=
re/ExternalRefType/vulnerabilityDisclosureReport"
     # A reference to a Vulnerability Exploitability eXchange (VEX) stateme=
nt which provides information on whether a product is impacted by a specifi=
c vulnerability in an included package and, if affected, whether there are =
actions recommended to remediate. See also [NTIA VEX one-page summary](http=
s://ntia.gov/files/ntia/publications/vex_one-page_summary.pdf).
-    vulnerabilityExploitabilityAssessment =3D "https://spdx.org/rdf/3.0.0/=
terms/Core/ExternalRefType/vulnerabilityExploitabilityAssessment"
+    vulnerabilityExploitabilityAssessment =3D "https://spdx.org/rdf/3.0.1/=
terms/Core/ExternalRefType/vulnerabilityExploitabilityAssessment"
=20
=20
 # A mathematical algorithm that maps data of arbitrary size to a bit strin=
g.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm", compact_t=
ype=3D"HashAlgorithm", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm", compact_t=
ype=3D"HashAlgorithm", abstract=3DFalse)
 class HashAlgorithm(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "blake2b256": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm=
/blake2b256",
-        "blake2b384": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm=
/blake2b384",
-        "blake2b512": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm=
/blake2b512",
-        "blake3": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/bla=
ke3",
-        "crystalsDilithium": "https://spdx.org/rdf/3.0.0/terms/Core/HashAl=
gorithm/crystalsDilithium",
-        "crystalsKyber": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgori=
thm/crystalsKyber",
-        "falcon": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/fal=
con",
-        "md2": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md2",
-        "md4": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md4",
-        "md5": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md5",
-        "md6": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md6",
-        "other": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/othe=
r",
-        "sha1": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha1",
-        "sha224": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha=
224",
-        "sha256": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha=
256",
-        "sha384": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha=
384",
-        "sha3_224": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/s=
ha3_224",
-        "sha3_256": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/s=
ha3_256",
-        "sha3_384": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/s=
ha3_384",
-        "sha3_512": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/s=
ha3_512",
-        "sha512": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha=
512",
+        "adler32": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/ad=
ler32",
+        "blake2b256": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm=
/blake2b256",
+        "blake2b384": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm=
/blake2b384",
+        "blake2b512": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm=
/blake2b512",
+        "blake3": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/bla=
ke3",
+        "crystalsDilithium": "https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/crystalsDilithium",
+        "crystalsKyber": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgori=
thm/crystalsKyber",
+        "falcon": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/fal=
con",
+        "md2": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md2",
+        "md4": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md4",
+        "md5": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md5",
+        "md6": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md6",
+        "other": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/othe=
r",
+        "sha1": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha1",
+        "sha224": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha=
224",
+        "sha256": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha=
256",
+        "sha384": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha=
384",
+        "sha3_224": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/s=
ha3_224",
+        "sha3_256": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/s=
ha3_256",
+        "sha3_384": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/s=
ha3_384",
+        "sha3_512": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/s=
ha3_512",
+        "sha512": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha=
512",
     }
-    # blake2b algorithm with a digest size of 256 https://datatracker.ietf=
.org/doc/html/rfc7693#section-4
-    blake2b256 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/bl=
ake2b256"
-    # blake2b algorithm with a digest size of 384 https://datatracker.ietf=
.org/doc/html/rfc7693#section-4
-    blake2b384 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/bl=
ake2b384"
-    # blake2b algorithm with a digest size of 512 https://datatracker.ietf=
.org/doc/html/rfc7693#section-4
-    blake2b512 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/bl=
ake2b512"
-    # https://github.com/BLAKE3-team/BLAKE3-specs/blob/master/blake3.pdf
-    blake3 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/blake3"
-    # https://pq-crystals.org/dilithium/index.shtml
-    crystalsDilithium =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgor=
ithm/crystalsDilithium"
-    # https://pq-crystals.org/kyber/index.shtml
-    crystalsKyber =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm=
/crystalsKyber"
-    # https://falcon-sign.info/falcon.pdf
-    falcon =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/falcon"
-    # https://datatracker.ietf.org/doc/rfc1319/
-    md2 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md2"
-    # https://datatracker.ietf.org/doc/html/rfc1186
-    md4 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md4"
-    # https://datatracker.ietf.org/doc/html/rfc1321
-    md5 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md5"
-    # https://people.csail.mit.edu/rivest/pubs/RABCx08.pdf
-    md6 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md6"
+    # Adler-32 checksum is part of the widely used zlib compression librar=
y as defined in [RFC 1950](https://datatracker.ietf.org/doc/rfc1950/) Secti=
on 2.3.
+    adler32 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/adler=
32"
+    # BLAKE2b algorithm with a digest size of 256, as defined in [RFC 7693=
](https://datatracker.ietf.org/doc/rfc7693/) Section 4.
+    blake2b256 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/bl=
ake2b256"
+    # BLAKE2b algorithm with a digest size of 384, as defined in [RFC 7693=
](https://datatracker.ietf.org/doc/rfc7693/) Section 4.
+    blake2b384 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/bl=
ake2b384"
+    # BLAKE2b algorithm with a digest size of 512, as defined in [RFC 7693=
](https://datatracker.ietf.org/doc/rfc7693/) Section 4.
+    blake2b512 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/bl=
ake2b512"
+    # [BLAKE3](https://github.com/BLAKE3-team/BLAKE3-specs/blob/master/bla=
ke3.pdf)
+    blake3 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/blake3"
+    # [Dilithium](https://pq-crystals.org/dilithium/)
+    crystalsDilithium =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgor=
ithm/crystalsDilithium"
+    # [Kyber](https://pq-crystals.org/kyber/)
+    crystalsKyber =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm=
/crystalsKyber"
+    # [FALCON](https://falcon-sign.info/falcon.pdf)
+    falcon =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/falcon"
+    # MD2 message-digest algorithm, as defined in [RFC 1319](https://datat=
racker.ietf.org/doc/rfc1319/).
+    md2 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md2"
+    # MD4 message-digest algorithm, as defined in [RFC 1186](https://datat=
racker.ietf.org/doc/rfc1186/).
+    md4 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md4"
+    # MD5 message-digest algorithm, as defined in [RFC 1321](https://datat=
racker.ietf.org/doc/rfc1321/).
+    md5 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md5"
+    # [MD6 hash function](https://people.csail.mit.edu/rivest/pubs/RABCx08=
.pdf)
+    md6 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md6"
     # any hashing algorithm that does not exist in this list of entries
-    other =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/other"
-    # https://datatracker.ietf.org/doc/html/rfc3174
-    sha1 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha1"
-    # secure hashing algorithm with a digest length of 224 https://datatra=
cker.ietf.org/doc/html/draft-ietf-pkix-sha224-01
-    sha224 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha224"
-    # secure hashing algorithm with a digest length of 256 https://www.rfc=
-editor.org/rfc/rfc4634
-    sha256 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha256"
-    # secure hashing algorithm with a digest length of 384 https://www.rfc=
-editor.org/rfc/rfc4634
-    sha384 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha384"
-    # sha3 with a digest length of 224 https://nvlpubs.nist.gov/nistpubs/F=
IPS/NIST.FIPS.202.pdf
-    sha3_224 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3=
_224"
-    # sha3 with a digest length of 256 https://nvlpubs.nist.gov/nistpubs/F=
IPS/NIST.FIPS.202.pdf
-    sha3_256 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3=
_256"
-    # sha3 with a digest length of 384 https://nvlpubs.nist.gov/nistpubs/F=
IPS/NIST.FIPS.202.pdf
-    sha3_384 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3=
_384"
-    # sha3 with a digest length of 512 https://nvlpubs.nist.gov/nistpubs/F=
IPS/NIST.FIPS.202.pdf
-    sha3_512 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3=
_512"
-    # secure hashing algorithm with a digest length of 512 https://www.rfc=
-editor.org/rfc/rfc4634
-    sha512 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha512"
+    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/other"
+    # SHA-1, a secure hashing algorithm, as defined in [RFC 3174](https://=
datatracker.ietf.org/doc/rfc3174/).
+    sha1 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha1"
+    # SHA-2 with a digest length of 224, as defined in [RFC 3874](https://=
datatracker.ietf.org/doc/rfc3874/).
+    sha224 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha224"
+    # SHA-2 with a digest length of 256, as defined in [RFC 6234](https://=
datatracker.ietf.org/doc/rfc6234/).
+    sha256 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha256"
+    # SHA-2 with a digest length of 384, as defined in [RFC 6234](https://=
datatracker.ietf.org/doc/rfc6234/).
+    sha384 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha384"
+    # SHA-3 with a digest length of 224, as defined in [FIPS 202](https://=
csrc.nist.gov/pubs/fips/202/final).
+    sha3_224 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha3=
_224"
+    # SHA-3 with a digest length of 256, as defined in [FIPS 202](https://=
csrc.nist.gov/pubs/fips/202/final).
+    sha3_256 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha3=
_256"
+    # SHA-3 with a digest length of 384, as defined in [FIPS 202](https://=
csrc.nist.gov/pubs/fips/202/final).
+    sha3_384 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha3=
_384"
+    # SHA-3 with a digest length of 512, as defined in [FIPS 202](https://=
csrc.nist.gov/pubs/fips/202/final).
+    sha3_512 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha3=
_512"
+    # SHA-2 with a digest length of 512, as defined in [RFC 6234](https://=
datatracker.ietf.org/doc/rfc6234/).
+    sha512 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha512"
=20
=20
 # Provides an independently reproducible mechanism that permits verificati=
on of a specific Element.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/IntegrityMethod", compact=
_type=3D"IntegrityMethod", abstract=3DTrue)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/IntegrityMethod", compact=
_type=3D"IntegrityMethod", abstract=3DTrue)
 class IntegrityMethod(SHACLObject):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
@@ -3272,41 +2789,41 @@ class IntegrityMethod(SHACLObject):
         cls._add_property(
             "comment",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/comment",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
             compact=3D"comment",
         )
=20
=20
 # Provide an enumerated set of lifecycle phases that can provide context t=
o relationships.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType", comp=
act_type=3D"LifecycleScopeType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeType", comp=
act_type=3D"LifecycleScopeType", abstract=3DFalse)
 class LifecycleScopeType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "build": "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType=
/build",
-        "design": "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeTyp=
e/design",
-        "development": "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleSco=
peType/development",
-        "other": "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType=
/other",
-        "runtime": "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeTy=
pe/runtime",
-        "test": "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/=
test",
+        "build": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeType=
/build",
+        "design": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeTyp=
e/design",
+        "development": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleSco=
peType/development",
+        "other": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeType=
/other",
+        "runtime": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeTy=
pe/runtime",
+        "test": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeType/=
test",
     }
     # A relationship has specific context implications during an element's=
 build phase, during development.
-    build =3D "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/bu=
ild"
+    build =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeType/bu=
ild"
     # A relationship has specific context implications during an element's=
 design.
-    design =3D "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/d=
esign"
+    design =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeType/d=
esign"
     # A relationship has specific context implications during development =
phase of an element.
-    development =3D "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeT=
ype/development"
+    development =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeT=
ype/development"
     # A relationship has other specific context information necessary to c=
apture that the above set of enumerations does not handle.
-    other =3D "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/ot=
her"
+    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeType/ot=
her"
     # A relationship has specific context implications during the executio=
n phase of an element.
-    runtime =3D "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/=
runtime"
+    runtime =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeType/=
runtime"
     # A relationship has specific context implications during an element's=
 testing phase, during development.
-    test =3D "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/tes=
t"
+    test =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeType/tes=
t"
=20
=20
 # A mapping between prefixes and namespace partial URIs.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/NamespaceMap", compact_ty=
pe=3D"NamespaceMap", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/NamespaceMap", compact_ty=
pe=3D"NamespaceMap", abstract=3DFalse)
 class NamespaceMap(SHACLObject):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
@@ -3314,11 +2831,11 @@ class NamespaceMap(SHACLObject):
     def _register_props(cls):
         super()._register_props()
         # Provides an unambiguous mechanism for conveying a URI fragment p=
ortion of an
-        # ElementID.
+        # Element ID.
         cls._add_property(
             "namespace",
             AnyURIProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/namespace",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/namespace",
             min_count=3D1,
             compact=3D"namespace",
         )
@@ -3326,16 +2843,16 @@ class NamespaceMap(SHACLObject):
         cls._add_property(
             "prefix",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/prefix",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/prefix",
             min_count=3D1,
             compact=3D"prefix",
         )
=20
=20
 # An SPDX version 2.X compatible verification method for software packages.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/PackageVerificationCode",=
 compact_type=3D"PackageVerificationCode", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/PackageVerificationCode",=
 compact_type=3D"PackageVerificationCode", abstract=3DFalse)
 class PackageVerificationCode(IntegrityMethod):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
@@ -3346,29 +2863,30 @@ class PackageVerificationCode(IntegrityMethod):
         cls._add_property(
             "algorithm",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake2b256", "blake2b256"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake2b384", "blake2b384"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake2b512", "blake2b512"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake3", "blake3"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
crystalsDilithium", "crystalsDilithium"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
crystalsKyber", "crystalsKyber"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
falcon", "falcon"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md2", "md2"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md4", "md4"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md5", "md5"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md6", "md6"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
other", "other"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha1", "sha1"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha224", "sha224"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha256", "sha256"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha384", "sha384"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_224", "sha3_224"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_256", "sha3_256"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_384", "sha3_384"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_512", "sha3_512"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha512", "sha512"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
adler32", "adler32"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
blake2b256", "blake2b256"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
blake2b384", "blake2b384"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
blake2b512", "blake2b512"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
blake3", "blake3"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
crystalsDilithium", "crystalsDilithium"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
crystalsKyber", "crystalsKyber"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
falcon", "falcon"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
md2", "md2"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
md4", "md4"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
md5", "md5"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
md6", "md6"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
other", "other"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha1", "sha1"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha224", "sha224"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha256", "sha256"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha384", "sha384"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha3_224", "sha3_224"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha3_256", "sha3_256"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha3_384", "sha3_384"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha3_512", "sha3_512"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha512", "sha512"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/algorithm",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/algorithm",
             min_count=3D1,
             compact=3D"algorithm",
         )
@@ -3376,7 +2894,7 @@ class PackageVerificationCode(IntegrityMethod):
         cls._add_property(
             "hashValue",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/hashValue",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/hashValue",
             min_count=3D1,
             compact=3D"hashValue",
         )
@@ -3385,15 +2903,15 @@ class PackageVerificationCode(IntegrityMethod):
         cls._add_property(
             "packageVerificationCodeExcludedFile",
             ListProp(StringProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/packageVerificati=
onCodeExcludedFile",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/packageVerificati=
onCodeExcludedFile",
             compact=3D"packageVerificationCodeExcludedFile",
         )
=20
=20
 # A tuple of two positive integers that define a range.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/PositiveIntegerRange", co=
mpact_type=3D"PositiveIntegerRange", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/PositiveIntegerRange", co=
mpact_type=3D"PositiveIntegerRange", abstract=3DFalse)
 class PositiveIntegerRange(SHACLObject):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
@@ -3404,7 +2922,7 @@ class PositiveIntegerRange(SHACLObject):
         cls._add_property(
             "beginIntegerRange",
             PositiveIntegerProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/beginIntegerRange=
",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/beginIntegerRange=
",
             min_count=3D1,
             compact=3D"beginIntegerRange",
         )
@@ -3412,71 +2930,71 @@ class PositiveIntegerRange(SHACLObject):
         cls._add_property(
             "endIntegerRange",
             PositiveIntegerProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/endIntegerRange",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/endIntegerRange",
             min_count=3D1,
             compact=3D"endIntegerRange",
         )
=20
=20
 # Categories of presence or absence.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType", compact_ty=
pe=3D"PresenceType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType", compact_ty=
pe=3D"PresenceType", abstract=3DFalse)
 class PresenceType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "no": "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/no",
-        "noAssertion": "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType=
/noAssertion",
-        "yes": "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/yes",
+        "no": "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/no",
+        "noAssertion": "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType=
/noAssertion",
+        "yes": "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/yes",
     }
     # Indicates absence of the field.
-    no =3D "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/no"
+    no =3D "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/no"
     # Makes no assertion about the field.
-    noAssertion =3D "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/no=
Assertion"
+    noAssertion =3D "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/no=
Assertion"
     # Indicates presence of the field.
-    yes =3D "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/yes"
+    yes =3D "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/yes"
=20
=20
 # Enumeration of the valid profiles.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType", c=
ompact_type=3D"ProfileIdentifierType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType", c=
ompact_type=3D"ProfileIdentifierType", abstract=3DFalse)
 class ProfileIdentifierType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "ai": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType=
/ai",
-        "build": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierT=
ype/build",
-        "core": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierTy=
pe/core",
-        "dataset": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifie=
rType/dataset",
-        "expandedLicensing": "https://spdx.org/rdf/3.0.0/terms/Core/Profil=
eIdentifierType/expandedLicensing",
-        "extension": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/extension",
-        "lite": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierTy=
pe/lite",
-        "security": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifi=
erType/security",
-        "simpleLicensing": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileI=
dentifierType/simpleLicensing",
-        "software": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifi=
erType/software",
+        "ai": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType=
/ai",
+        "build": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierT=
ype/build",
+        "core": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierTy=
pe/core",
+        "dataset": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifie=
rType/dataset",
+        "expandedLicensing": "https://spdx.org/rdf/3.0.1/terms/Core/Profil=
eIdentifierType/expandedLicensing",
+        "extension": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentif=
ierType/extension",
+        "lite": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierTy=
pe/lite",
+        "security": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifi=
erType/security",
+        "simpleLicensing": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileI=
dentifierType/simpleLicensing",
+        "software": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifi=
erType/software",
     }
     # the element follows the AI profile specification
-    ai =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/ai"
+    ai =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType/ai"
     # the element follows the Build profile specification
-    build =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType=
/build"
+    build =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType=
/build"
     # the element follows the Core profile specification
-    core =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/=
core"
+    core =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType/=
core"
     # the element follows the Dataset profile specification
-    dataset =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierTy=
pe/dataset"
-    # the element follows the expanded Licensing profile
-    expandedLicensing =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileId=
entifierType/expandedLicensing"
+    dataset =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierTy=
pe/dataset"
+    # the element follows the expanded Licensing profile specification
+    expandedLicensing =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileId=
entifierType/expandedLicensing"
     # the element follows the Extension profile specification
-    extension =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifier=
Type/extension"
+    extension =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifier=
Type/extension"
     # the element follows the Lite profile specification
-    lite =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/=
lite"
+    lite =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType/=
lite"
     # the element follows the Security profile specification
-    security =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierT=
ype/security"
-    # the element follows the simple Licensing profile
-    simpleLicensing =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIden=
tifierType/simpleLicensing"
+    security =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierT=
ype/security"
+    # the element follows the simple Licensing profile specification
+    simpleLicensing =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIden=
tifierType/simpleLicensing"
     # the element follows the Software profile specification
-    software =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierT=
ype/software"
+    software =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierT=
ype/software"
=20
=20
 # Describes a relationship between one or more elements.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/Relationship", compact_ty=
pe=3D"Relationship", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/Relationship", compact_ty=
pe=3D"Relationship", abstract=3DFalse)
 class Relationship(Element):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -3488,25 +3006,31 @@ class Relationship(Element):
         cls._add_property(
             "completeness",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCo=
mpleteness/complete", "complete"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCo=
mpleteness/incomplete", "incomplete"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCo=
mpleteness/noAssertion", "noAssertion"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipCo=
mpleteness/complete", "complete"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipCo=
mpleteness/incomplete", "incomplete"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipCo=
mpleteness/noAssertion", "noAssertion"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/completeness",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/completeness",
             compact=3D"completeness",
         )
         # Specifies the time from which an element is no longer applicable=
 / valid.
         cls._add_property(
             "endTime",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/endTime",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/endTime",
             compact=3D"endTime",
         )
         # References the Element on the left-hand side of a relationship.
         cls._add_property(
             "from_",
-            ObjectProp(Element, True),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/from",
+            ObjectProp(Element, True, context=3D[
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement", =
"NoneElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganizati=
on", "SpdxOrganization"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionEle=
ment", "NoAssertionElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oneLicense", "expandedlicensing_NoneLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                ],),
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/from",
             min_count=3D1,
             compact=3D"from",
         )
@@ -3514,67 +3038,67 @@ class Relationship(Element):
         cls._add_property(
             "relationshipType",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/affects", "affects"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/amendedBy", "amendedBy"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/ancestorOf", "ancestorOf"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/availableFrom", "availableFrom"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/configures", "configures"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/contains", "contains"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/coordinatedBy", "coordinatedBy"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/copiedTo", "copiedTo"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/delegatedTo", "delegatedTo"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/dependsOn", "dependsOn"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/descendantOf", "descendantOf"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/describes", "describes"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/doesNotAffect", "doesNotAffect"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/expandsTo", "expandsTo"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/exploitCreatedBy", "exploitCreatedBy"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/fixedBy", "fixedBy"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/fixedIn", "fixedIn"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/foundBy", "foundBy"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/generates", "generates"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasAddedFile", "hasAddedFile"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasAssessmentFor", "hasAssessmentFor"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasAssociatedVulnerability", "hasAssociatedVulnerability"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasConcludedLicense", "hasConcludedLicense"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasDataFile", "hasDataFile"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasDeclaredLicense", "hasDeclaredLicense"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasDeletedFile", "hasDeletedFile"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasDependencyManifest", "hasDependencyManifest"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasDistributionArtifact", "hasDistributionArtifact"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasDocumentation", "hasDocumentation"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasDynamicLink", "hasDynamicLink"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasEvidence", "hasEvidence"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasExample", "hasExample"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasHost", "hasHost"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasInputs", "hasInputs"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasMetadata", "hasMetadata"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasOptionalComponent", "hasOptionalComponent"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasOptionalDependency", "hasOptionalDependency"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasOutputs", "hasOutputs"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasPrerequsite", "hasPrerequsite"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasProvidedDependency", "hasProvidedDependency"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasRequirement", "hasRequirement"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasSpecification", "hasSpecification"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasStaticLink", "hasStaticLink"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasTest", "hasTest"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasTestCase", "hasTestCase"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasVariant", "hasVariant"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/invokedBy", "invokedBy"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/modifiedBy", "modifiedBy"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/other", "other"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/packagedBy", "packagedBy"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/patchedBy", "patchedBy"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/publishedBy", "publishedBy"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/reportedBy", "reportedBy"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/republishedBy", "republishedBy"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/serializedInArtifact", "serializedInArtifact"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/testedOn", "testedOn"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/trainedOn", "trainedOn"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/underInvestigationFor", "underInvestigationFor"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/usesTool", "usesTool"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/affects", "affects"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/amendedBy", "amendedBy"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/ancestorOf", "ancestorOf"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/availableFrom", "availableFrom"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/configures", "configures"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/contains", "contains"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/coordinatedBy", "coordinatedBy"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/copiedTo", "copiedTo"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/delegatedTo", "delegatedTo"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/dependsOn", "dependsOn"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/descendantOf", "descendantOf"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/describes", "describes"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/doesNotAffect", "doesNotAffect"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/expandsTo", "expandsTo"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/exploitCreatedBy", "exploitCreatedBy"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/fixedBy", "fixedBy"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/fixedIn", "fixedIn"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/foundBy", "foundBy"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/generates", "generates"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasAddedFile", "hasAddedFile"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasAssessmentFor", "hasAssessmentFor"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasAssociatedVulnerability", "hasAssociatedVulnerability"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasConcludedLicense", "hasConcludedLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasDataFile", "hasDataFile"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasDeclaredLicense", "hasDeclaredLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasDeletedFile", "hasDeletedFile"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasDependencyManifest", "hasDependencyManifest"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasDistributionArtifact", "hasDistributionArtifact"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasDocumentation", "hasDocumentation"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasDynamicLink", "hasDynamicLink"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasEvidence", "hasEvidence"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasExample", "hasExample"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasHost", "hasHost"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasInput", "hasInput"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasMetadata", "hasMetadata"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasOptionalComponent", "hasOptionalComponent"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasOptionalDependency", "hasOptionalDependency"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasOutput", "hasOutput"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasPrerequisite", "hasPrerequisite"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasProvidedDependency", "hasProvidedDependency"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasRequirement", "hasRequirement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasSpecification", "hasSpecification"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasStaticLink", "hasStaticLink"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasTest", "hasTest"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasTestCase", "hasTestCase"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasVariant", "hasVariant"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/invokedBy", "invokedBy"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/modifiedBy", "modifiedBy"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/other", "other"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/packagedBy", "packagedBy"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/patchedBy", "patchedBy"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/publishedBy", "publishedBy"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/reportedBy", "reportedBy"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/republishedBy", "republishedBy"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/serializedInArtifact", "serializedInArtifact"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/testedOn", "testedOn"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/trainedOn", "trainedOn"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/underInvestigationFor", "underInvestigationFor"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/usesTool", "usesTool"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/relationshipType",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/relationshipType",
             min_count=3D1,
             compact=3D"relationshipType",
         )
@@ -3582,225 +3106,231 @@ class Relationship(Element):
         cls._add_property(
             "startTime",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/startTime",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/startTime",
             compact=3D"startTime",
         )
         # References an Element on the right-hand side of a relationship.
         cls._add_property(
             "to",
-            ListProp(ObjectProp(Element, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/to",
+            ListProp(ObjectProp(Element, False, context=3D[
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement", =
"NoneElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganizati=
on", "SpdxOrganization"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionEle=
ment", "NoAssertionElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oneLicense", "expandedlicensing_NoneLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                ],)),
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/to",
             min_count=3D1,
             compact=3D"to",
         )
=20
=20
 # Indicates whether a relationship is known to be complete, incomplete, or=
 if no assertion is made with respect to relationship completeness.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCompleteness"=
, compact_type=3D"RelationshipCompleteness", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipCompleteness"=
, compact_type=3D"RelationshipCompleteness", abstract=3DFalse)
 class RelationshipCompleteness(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "complete": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCom=
pleteness/complete",
-        "incomplete": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipC=
ompleteness/incomplete",
-        "noAssertion": "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Completeness/noAssertion",
+        "complete": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipCom=
pleteness/complete",
+        "incomplete": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipC=
ompleteness/incomplete",
+        "noAssertion": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Completeness/noAssertion",
     }
     # The relationship is known to be exhaustive.
-    complete =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipComple=
teness/complete"
+    complete =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipComple=
teness/complete"
     # The relationship is known not to be exhaustive.
-    incomplete =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipComp=
leteness/incomplete"
+    incomplete =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipComp=
leteness/incomplete"
     # No assertion can be made about the completeness of the relationship.
-    noAssertion =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCom=
pleteness/noAssertion"
+    noAssertion =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipCom=
pleteness/noAssertion"
=20
=20
 # Information about the relationship between two Elements.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType", compac=
t_type=3D"RelationshipType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType", compac=
t_type=3D"RelationshipType", abstract=3DFalse)
 class RelationshipType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "affects": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/affects",
-        "amendedBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/amendedBy",
-        "ancestorOf": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/ancestorOf",
-        "availableFrom": "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/availableFrom",
-        "configures": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/configures",
-        "contains": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/contains",
-        "coordinatedBy": "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/coordinatedBy",
-        "copiedTo": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/copiedTo",
-        "delegatedTo": "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/delegatedTo",
-        "dependsOn": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/dependsOn",
-        "descendantOf": "https://spdx.org/rdf/3.0.0/terms/Core/Relationshi=
pType/descendantOf",
-        "describes": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/describes",
-        "doesNotAffect": "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/doesNotAffect",
-        "expandsTo": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/expandsTo",
-        "exploitCreatedBy": "https://spdx.org/rdf/3.0.0/terms/Core/Relatio=
nshipType/exploitCreatedBy",
-        "fixedBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/fixedBy",
-        "fixedIn": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/fixedIn",
-        "foundBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/foundBy",
-        "generates": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/generates",
-        "hasAddedFile": "https://spdx.org/rdf/3.0.0/terms/Core/Relationshi=
pType/hasAddedFile",
-        "hasAssessmentFor": "https://spdx.org/rdf/3.0.0/terms/Core/Relatio=
nshipType/hasAssessmentFor",
-        "hasAssociatedVulnerability": "https://spdx.org/rdf/3.0.0/terms/Co=
re/RelationshipType/hasAssociatedVulnerability",
-        "hasConcludedLicense": "https://spdx.org/rdf/3.0.0/terms/Core/Rela=
tionshipType/hasConcludedLicense",
-        "hasDataFile": "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasDataFile",
-        "hasDeclaredLicense": "https://spdx.org/rdf/3.0.0/terms/Core/Relat=
ionshipType/hasDeclaredLicense",
-        "hasDeletedFile": "https://spdx.org/rdf/3.0.0/terms/Core/Relations=
hipType/hasDeletedFile",
-        "hasDependencyManifest": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/hasDependencyManifest",
-        "hasDistributionArtifact": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/hasDistributionArtifact",
-        "hasDocumentation": "https://spdx.org/rdf/3.0.0/terms/Core/Relatio=
nshipType/hasDocumentation",
-        "hasDynamicLink": "https://spdx.org/rdf/3.0.0/terms/Core/Relations=
hipType/hasDynamicLink",
-        "hasEvidence": "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasEvidence",
-        "hasExample": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/hasExample",
-        "hasHost": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/hasHost",
-        "hasInputs": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasInputs",
-        "hasMetadata": "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasMetadata",
-        "hasOptionalComponent": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/hasOptionalComponent",
-        "hasOptionalDependency": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/hasOptionalDependency",
-        "hasOutputs": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/hasOutputs",
-        "hasPrerequsite": "https://spdx.org/rdf/3.0.0/terms/Core/Relations=
hipType/hasPrerequsite",
-        "hasProvidedDependency": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/hasProvidedDependency",
-        "hasRequirement": "https://spdx.org/rdf/3.0.0/terms/Core/Relations=
hipType/hasRequirement",
-        "hasSpecification": "https://spdx.org/rdf/3.0.0/terms/Core/Relatio=
nshipType/hasSpecification",
-        "hasStaticLink": "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/hasStaticLink",
-        "hasTest": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/hasTest",
-        "hasTestCase": "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasTestCase",
-        "hasVariant": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/hasVariant",
-        "invokedBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/invokedBy",
-        "modifiedBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/modifiedBy",
-        "other": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/o=
ther",
-        "packagedBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/packagedBy",
-        "patchedBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/patchedBy",
-        "publishedBy": "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/publishedBy",
-        "reportedBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/reportedBy",
-        "republishedBy": "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/republishedBy",
-        "serializedInArtifact": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/serializedInArtifact",
-        "testedOn": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/testedOn",
-        "trainedOn": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/trainedOn",
-        "underInvestigationFor": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/underInvestigationFor",
-        "usesTool": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/usesTool",
+        "affects": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/affects",
+        "amendedBy": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/amendedBy",
+        "ancestorOf": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/ancestorOf",
+        "availableFrom": "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/availableFrom",
+        "configures": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/configures",
+        "contains": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/contains",
+        "coordinatedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/coordinatedBy",
+        "copiedTo": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/copiedTo",
+        "delegatedTo": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/delegatedTo",
+        "dependsOn": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/dependsOn",
+        "descendantOf": "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/descendantOf",
+        "describes": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/describes",
+        "doesNotAffect": "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/doesNotAffect",
+        "expandsTo": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/expandsTo",
+        "exploitCreatedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/exploitCreatedBy",
+        "fixedBy": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/fixedBy",
+        "fixedIn": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/fixedIn",
+        "foundBy": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/foundBy",
+        "generates": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/generates",
+        "hasAddedFile": "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/hasAddedFile",
+        "hasAssessmentFor": "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/hasAssessmentFor",
+        "hasAssociatedVulnerability": "https://spdx.org/rdf/3.0.1/terms/Co=
re/RelationshipType/hasAssociatedVulnerability",
+        "hasConcludedLicense": "https://spdx.org/rdf/3.0.1/terms/Core/Rela=
tionshipType/hasConcludedLicense",
+        "hasDataFile": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasDataFile",
+        "hasDeclaredLicense": "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/hasDeclaredLicense",
+        "hasDeletedFile": "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/hasDeletedFile",
+        "hasDependencyManifest": "https://spdx.org/rdf/3.0.1/terms/Core/Re=
lationshipType/hasDependencyManifest",
+        "hasDistributionArtifact": "https://spdx.org/rdf/3.0.1/terms/Core/=
RelationshipType/hasDistributionArtifact",
+        "hasDocumentation": "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/hasDocumentation",
+        "hasDynamicLink": "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/hasDynamicLink",
+        "hasEvidence": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasEvidence",
+        "hasExample": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/hasExample",
+        "hasHost": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/hasHost",
+        "hasInput": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/hasInput",
+        "hasMetadata": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasMetadata",
+        "hasOptionalComponent": "https://spdx.org/rdf/3.0.1/terms/Core/Rel=
ationshipType/hasOptionalComponent",
+        "hasOptionalDependency": "https://spdx.org/rdf/3.0.1/terms/Core/Re=
lationshipType/hasOptionalDependency",
+        "hasOutput": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasOutput",
+        "hasPrerequisite": "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/hasPrerequisite",
+        "hasProvidedDependency": "https://spdx.org/rdf/3.0.1/terms/Core/Re=
lationshipType/hasProvidedDependency",
+        "hasRequirement": "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/hasRequirement",
+        "hasSpecification": "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/hasSpecification",
+        "hasStaticLink": "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/hasStaticLink",
+        "hasTest": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/hasTest",
+        "hasTestCase": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasTestCase",
+        "hasVariant": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/hasVariant",
+        "invokedBy": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/invokedBy",
+        "modifiedBy": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/modifiedBy",
+        "other": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/o=
ther",
+        "packagedBy": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/packagedBy",
+        "patchedBy": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/patchedBy",
+        "publishedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/publishedBy",
+        "reportedBy": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/reportedBy",
+        "republishedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/republishedBy",
+        "serializedInArtifact": "https://spdx.org/rdf/3.0.1/terms/Core/Rel=
ationshipType/serializedInArtifact",
+        "testedOn": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/testedOn",
+        "trainedOn": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/trainedOn",
+        "underInvestigationFor": "https://spdx.org/rdf/3.0.1/terms/Core/Re=
lationshipType/underInvestigationFor",
+        "usesTool": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/usesTool",
     }
-    # (Security/VEX) The `from` vulnerability affect each `to` Element
-    affects =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/af=
fects"
-    # The `from` Element is amended by each `to` Element
-    amendedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
amendedBy"
-    # The `from` Element is an ancestor of each `to` Element
-    ancestorOf =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/ancestorOf"
-    # The `from` Element is available from the additional supplier describ=
ed by each `to` Element
-    availableFrom =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/availableFrom"
-    # The `from` Element is a configuration applied to each `to` Element d=
uring a LifecycleScopeType period
-    configures =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/configures"
-    # The `from` Element contains each `to` Element
-    contains =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/c=
ontains"
-    # (Security) The `from` Vulnerability is coordinatedBy the `to` Agent(=
s) (vendor, researcher, or consumer agent)
-    coordinatedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/coordinatedBy"
-    # The `from` Element has been copied to each `to` Element
-    copiedTo =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/c=
opiedTo"
-    # The `from` Agent is delegating an action to the Agent of the `to` Re=
lationship (which must be of type invokedBy) during a LifecycleScopeType. (=
e.g. the `to` invokedBy Relationship is being done on behalf of `from`)
-    delegatedTo =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/delegatedTo"
-    # The `from` Element depends on each `to` Element during a LifecycleSc=
opeType period.
-    dependsOn =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
dependsOn"
-    # The `from` Element is a descendant of each `to` Element
-    descendantOf =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/descendantOf"
+    # The `from` Vulnerability affects each `to` Element. The use of the `=
affects` type is constrained to `VexAffectedVulnAssessmentRelationship` cla=
ssed relationships.
+    affects =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/af=
fects"
+    # The `from` Element is amended by each `to` Element.
+    amendedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
amendedBy"
+    # The `from` Element is an ancestor of each `to` Element.
+    ancestorOf =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/ancestorOf"
+    # The `from` Element is available from the additional supplier describ=
ed by each `to` Element.
+    availableFrom =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/availableFrom"
+    # The `from` Element is a configuration applied to each `to` Element, =
during a LifecycleScopeType period.
+    configures =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/configures"
+    # The `from` Element contains each `to` Element.
+    contains =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/c=
ontains"
+    # The `from` Vulnerability is coordinatedBy the `to` Agent(s) (vendor,=
 researcher, or consumer agent).
+    coordinatedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/coordinatedBy"
+    # The `from` Element has been copied to each `to` Element.
+    copiedTo =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/c=
opiedTo"
+    # The `from` Agent is delegating an action to the Agent of the `to` Re=
lationship (which must be of type invokedBy), during a LifecycleScopeType (=
e.g. the `to` invokedBy Relationship is being done on behalf of `from`).
+    delegatedTo =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/delegatedTo"
+    # The `from` Element depends on each `to` Element, during a LifecycleS=
copeType period.
+    dependsOn =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
dependsOn"
+    # The `from` Element is a descendant of each `to` Element.
+    descendantOf =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/descendantOf"
     # The `from` Element describes each `to` Element. To denote the root(s=
) of a tree of elements in a collection, the rootElement property should be=
 used.
-    describes =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
describes"
-    # (Security/VEX) The `from` Vulnerability has no impact on each `to` E=
lement
-    doesNotAffect =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/doesNotAffect"
-    # The `from` archive expands out as an artifact described by each `to`=
 Element
-    expandsTo =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
expandsTo"
-    # (Security) The `from` Vulnerability has had an exploit created again=
st it by each `to` Agent
-    exploitCreatedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/exploitCreatedBy"
-    # (Security) Designates a `from` Vulnerability has been fixed by the `=
to` Agent(s)
-    fixedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/fi=
xedBy"
-    # (Security/VEX) A `from` Vulnerability has been fixed in each of the =
`to` Element(s)
-    fixedIn =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/fi=
xedIn"
-    # (Security) Designates a `from` Vulnerability was originally discover=
ed by the `to` Agent(s)
-    foundBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/fo=
undBy"
-    # The `from` Element generates each `to` Element
-    generates =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
generates"
-    # Every `to` Element is is a file added to the `from` Element (`from` =
hasAddedFile `to`)
-    hasAddedFile =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasAddedFile"
-    # (Security) Relates a `from` Vulnerability and each `to` Element(s) w=
ith a security assessment. To be used with `VulnAssessmentRelationship` typ=
es
-    hasAssessmentFor =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/hasAssessmentFor"
-    # (Security) Used to associate a `from` Artifact with each `to` Vulner=
ability
-    hasAssociatedVulnerability =3D "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/hasAssociatedVulnerability"
-    # The `from` Software Artifact is concluded by the SPDX data creator t=
o be governed by each `to` license
-    hasConcludedLicense =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relatio=
nshipType/hasConcludedLicense"
-    # The `from` Element treats each `to` Element as a data file
-    hasDataFile =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/hasDataFile"
-    # The `from` Software Artifact was discovered to actually contain each=
 `to` license, for example as detected by use of automated tooling.
-    hasDeclaredLicense =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relation=
shipType/hasDeclaredLicense"
-    # Every `to` Element is a file deleted from the `from` Element (`from`=
 hasDeletedFile `to`)
-    hasDeletedFile =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasDeletedFile"
-    # The `from` Element has manifest files that contain dependency inform=
ation in each `to` Element
-    hasDependencyManifest =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relat=
ionshipType/hasDependencyManifest"
-    # The `from` Element is distributed as an artifact in each Element `to=
`, (e.g. an RPM or archive file)
-    hasDistributionArtifact =3D "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/hasDistributionArtifact"
-    # The `from` Element is documented by each `to` Element
-    hasDocumentation =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/hasDocumentation"
+    describes =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
describes"
+    # The `from` Vulnerability has no impact on each `to` Element. The use=
 of the `doesNotAffect` is constrained to `VexNotAffectedVulnAssessmentRela=
tionship` classed relationships.
+    doesNotAffect =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/doesNotAffect"
+    # The `from` archive expands out as an artifact described by each `to`=
 Element.
+    expandsTo =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
expandsTo"
+    # The `from` Vulnerability has had an exploit created against it by ea=
ch `to` Agent.
+    exploitCreatedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/exploitCreatedBy"
+    # Designates a `from` Vulnerability has been fixed by the `to` Agent(s=
).
+    fixedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/fi=
xedBy"
+    # A `from` Vulnerability has been fixed in each `to` Element. The use =
of the `fixedIn` type is constrained to `VexFixedVulnAssessmentRelationship=
` classed relationships.
+    fixedIn =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/fi=
xedIn"
+    # Designates a `from` Vulnerability was originally discovered by the `=
to` Agent(s).
+    foundBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/fo=
undBy"
+    # The `from` Element generates each `to` Element.
+    generates =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
generates"
+    # Every `to` Element is a file added to the `from` Element (`from` has=
AddedFile `to`).
+    hasAddedFile =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasAddedFile"
+    # Relates a `from` Vulnerability and each `to` Element with a security=
 assessment. To be used with `VulnAssessmentRelationship` types.
+    hasAssessmentFor =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/hasAssessmentFor"
+    # Used to associate a `from` Artifact with each `to` Vulnerability.
+    hasAssociatedVulnerability =3D "https://spdx.org/rdf/3.0.1/terms/Core/=
RelationshipType/hasAssociatedVulnerability"
+    # The `from` SoftwareArtifact is concluded by the SPDX data creator to=
 be governed by each `to` license.
+    hasConcludedLicense =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/hasConcludedLicense"
+    # The `from` Element treats each `to` Element as a data file. A data f=
ile is an artifact that stores data required or optional for the `from` Ele=
ment's functionality. A data file can be a database file, an index file, a =
log file, an AI model file, a calibration data file, a temporary file, a ba=
ckup file, and more. For AI training dataset, test dataset, test artifact, =
configuration data, build input data, and build output data, please conside=
r using the more specific relationship types: `trainedOn`, `testedOn`, `has=
Test`, `configures`, `hasInput`, and `hasOutput`, respectively. This relati=
onship does not imply dependency.
+    hasDataFile =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/hasDataFile"
+    # The `from` SoftwareArtifact was discovered to actually contain each =
`to` license, for example as detected by use of automated tooling.
+    hasDeclaredLicense =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/hasDeclaredLicense"
+    # Every `to` Element is a file deleted from the `from` Element (`from`=
 hasDeletedFile `to`).
+    hasDeletedFile =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasDeletedFile"
+    # The `from` Element has manifest files that contain dependency inform=
ation in each `to` Element.
+    hasDependencyManifest =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/hasDependencyManifest"
+    # The `from` Element is distributed as an artifact in each `to` Elemen=
t (e.g. an RPM or archive file).
+    hasDistributionArtifact =3D "https://spdx.org/rdf/3.0.1/terms/Core/Rel=
ationshipType/hasDistributionArtifact"
+    # The `from` Element is documented by each `to` Element.
+    hasDocumentation =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/hasDocumentation"
     # The `from` Element dynamically links in each `to` Element, during a =
LifecycleScopeType period.
-    hasDynamicLink =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasDynamicLink"
-    # (Dataset) Every `to` Element is considered as evidence for the `from=
` Element (`from` hasEvidence `to`)
-    hasEvidence =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/hasEvidence"
-    # Every `to` Element is an example for the `from` Element (`from` hasE=
xample `to`)
-    hasExample =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/hasExample"
-    # The `from` Build was run on the `to` Element during a LifecycleScope=
Type period (e.g. The host that the build runs on)
-    hasHost =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/ha=
sHost"
-    # The `from` Build has each `to` Elements as an input during a Lifecyc=
leScopeType period.
-    hasInputs =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
hasInputs"
-    # Every `to` Element is metadata about the `from` Element (`from` hasM=
etadata `to`)
-    hasMetadata =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/hasMetadata"
-    # Every `to` Element is an optional component of the `from` Element (`=
from` hasOptionalComponent `to`)
-    hasOptionalComponent =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relati=
onshipType/hasOptionalComponent"
-    # The `from` Element optionally depends on each `to` Element during a =
LifecycleScopeType period
-    hasOptionalDependency =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relat=
ionshipType/hasOptionalDependency"
-    # The `from` Build element generates each `to` Element as an output du=
ring a LifecycleScopeType period.
-    hasOutputs =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/hasOutputs"
-    # The `from` Element has a prerequsite on each `to` Element, during a =
LifecycleScopeType period
-    hasPrerequsite =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasPrerequsite"
-    # The `from` Element has a dependency on each `to` Element, but depend=
ency is not in the distributed artifact, but assumed to be provided, during=
 a LifecycleScopeType period
-    hasProvidedDependency =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relat=
ionshipType/hasProvidedDependency"
-    # The `from` Element has a requirement on each `to` Element, during a =
LifecycleScopeType period
-    hasRequirement =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasRequirement"
-    # Every `to` Element is a specification for the `from` Element (`from`=
 hasSpecification `to`), during a LifecycleScopeType period
-    hasSpecification =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/hasSpecification"
-    # The `from` Element statically links in each `to` Element, during a L=
ifecycleScopeType period
-    hasStaticLink =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/hasStaticLink"
-    # Every `to` Element is a test artifact for the `from` Element (`from`=
 hasTest `to`), during a LifecycleScopeType period
-    hasTest =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/ha=
sTest"
-    # Every `to` Element is a test case for the `from` Element (`from` has=
TestCase `to`)
-    hasTestCase =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/hasTestCase"
-    # Every `to` Element is a variant the `from` Element (`from` hasVarian=
t `to`)
-    hasVariant =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/hasVariant"
-    # The `from` Element was invoked by the `to` Agent during a LifecycleS=
copeType period (for example, a Build element that describes a build step)
-    invokedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
invokedBy"
-    # The `from` Element is modified by each `to` Element
-    modifiedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/modifiedBy"
-    # Every `to` Element is related to the `from` Element where the relati=
onship type is not described by any of the SPDX relationhip types (this rel=
ationship is directionless)
-    other =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/othe=
r"
-    # Every `to` Element is a packaged instance of the `from` Element (`fr=
om` packagedBy `to`)
-    packagedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/packagedBy"
-    # Every `to` Element is a patch for the `from` Element (`from` patched=
By `to`)
-    patchedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
patchedBy"
-    # (Security) Designates a `from` Vulnerability was made available for =
public use or reference by each `to` Agent
-    publishedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/publishedBy"
-    # (Security) Designates a `from` Vulnerability was first reported to a=
 project, vendor, or tracking database for formal identification by each `t=
o` Agent
-    reportedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/reportedBy"
-    # (Security) Designates a `from` Vulnerability's details were tracked,=
 aggregated, and/or enriched to improve context (i.e. NVD) by a `to` Agent(=
s)
-    republishedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/republishedBy"
-    # The `from` SPDXDocument can be found in a serialized form in each `t=
o` Artifact
-    serializedInArtifact =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relati=
onshipType/serializedInArtifact"
-    # (AI, Dataset) The `from` Element has been tested on the `to` Element
-    testedOn =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/t=
estedOn"
-    # (AI, Dataset) The `from` Element has been trained by the `to` Elemen=
t(s)
-    trainedOn =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
trainedOn"
-    # (Security/VEX) The `from` Vulnerability impact is being investigated=
 for each `to` Element
-    underInvestigationFor =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relat=
ionshipType/underInvestigationFor"
-    # The `from` Element uses each `to` Element as a tool during a Lifecyc=
leScopeType period.
-    usesTool =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/u=
sesTool"
+    hasDynamicLink =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasDynamicLink"
+    # Every `to` Element is considered as evidence for the `from` Element =
(`from` hasEvidence `to`).
+    hasEvidence =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/hasEvidence"
+    # Every `to` Element is an example for the `from` Element (`from` hasE=
xample `to`).
+    hasExample =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/hasExample"
+    # The `from` Build was run on the `to` Element during a LifecycleScope=
Type period (e.g. the host that the build runs on).
+    hasHost =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/ha=
sHost"
+    # The `from` Build has each `to` Element as an input, during a Lifecyc=
leScopeType period.
+    hasInput =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/h=
asInput"
+    # Every `to` Element is metadata about the `from` Element (`from` hasM=
etadata `to`).
+    hasMetadata =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/hasMetadata"
+    # Every `to` Element is an optional component of the `from` Element (`=
from` hasOptionalComponent `to`).
+    hasOptionalComponent =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasOptionalComponent"
+    # The `from` Element optionally depends on each `to` Element, during a=
 LifecycleScopeType period.
+    hasOptionalDependency =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/hasOptionalDependency"
+    # The `from` Build element generates each `to` Element as an output, d=
uring a LifecycleScopeType period.
+    hasOutput =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
hasOutput"
+    # The `from` Element has a prerequisite on each `to` Element, during a=
 LifecycleScopeType period.
+    hasPrerequisite =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/hasPrerequisite"
+    # The `from` Element has a dependency on each `to` Element, dependency=
 is not in the distributed artifact, but assumed to be provided, during a L=
ifecycleScopeType period.
+    hasProvidedDependency =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/hasProvidedDependency"
+    # The `from` Element has a requirement on each `to` Element, during a =
LifecycleScopeType period.
+    hasRequirement =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasRequirement"
+    # Every `to` Element is a specification for the `from` Element (`from`=
 hasSpecification `to`), during a LifecycleScopeType period.
+    hasSpecification =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/hasSpecification"
+    # The `from` Element statically links in each `to` Element, during a L=
ifecycleScopeType period.
+    hasStaticLink =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/hasStaticLink"
+    # Every `to` Element is a test artifact for the `from` Element (`from`=
 hasTest `to`), during a LifecycleScopeType period.
+    hasTest =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/ha=
sTest"
+    # Every `to` Element is a test case for the `from` Element (`from` has=
TestCase `to`).
+    hasTestCase =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/hasTestCase"
+    # Every `to` Element is a variant the `from` Element (`from` hasVarian=
t `to`).
+    hasVariant =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/hasVariant"
+    # The `from` Element was invoked by the `to` Agent, during a Lifecycle=
ScopeType period (for example, a Build element that describes a build step).
+    invokedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
invokedBy"
+    # The `from` Element is modified by each `to` Element.
+    modifiedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/modifiedBy"
+    # Every `to` Element is related to the `from` Element where the relati=
onship type is not described by any of the SPDX relationship types (this re=
lationship is directionless).
+    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/othe=
r"
+    # Every `to` Element is a packaged instance of the `from` Element (`fr=
om` packagedBy `to`).
+    packagedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/packagedBy"
+    # Every `to` Element is a patch for the `from` Element (`from` patched=
By `to`).
+    patchedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
patchedBy"
+    # Designates a `from` Vulnerability was made available for public use =
or reference by each `to` Agent.
+    publishedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/publishedBy"
+    # Designates a `from` Vulnerability was first reported to a project, v=
endor, or tracking database for formal identification by each `to` Agent.
+    reportedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/reportedBy"
+    # Designates a `from` Vulnerability's details were tracked, aggregated=
, and/or enriched to improve context (i.e. NVD) by each `to` Agent.
+    republishedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/republishedBy"
+    # The `from` SpdxDocument can be found in a serialized form in each `t=
o` Artifact.
+    serializedInArtifact =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/serializedInArtifact"
+    # The `from` Element has been tested on the `to` Element(s).
+    testedOn =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/t=
estedOn"
+    # The `from` Element has been trained on the `to` Element(s).
+    trainedOn =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
trainedOn"
+    # The `from` Vulnerability impact is being investigated for each `to` =
Element. The use of the `underInvestigationFor` type is constrained to `Vex=
UnderInvestigationVulnAssessmentRelationship` classed relationships.
+    underInvestigationFor =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/underInvestigationFor"
+    # The `from` Element uses each `to` Element as a tool, during a Lifecy=
cleScopeType period.
+    usesTool =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/u=
sesTool"
=20
=20
 # A collection of SPDX Elements that could potentially be serialized.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/SpdxDocument", compact_ty=
pe=3D"SpdxDocument", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/SpdxDocument", compact_ty=
pe=3D"SpdxDocument", abstract=3DFalse)
 class SpdxDocument(ElementCollection):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -3812,162 +3342,165 @@ class SpdxDocument(ElementCollection):
         # used.
         cls._add_property(
             "dataLicense",
-            ObjectProp(simplelicensing_AnyLicenseInfo, False),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/dataLicense",
+            ObjectProp(simplelicensing_AnyLicenseInfo, False, context=3D[
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oneLicense", "expandedlicensing_NoneLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                ],),
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/dataLicense",
             compact=3D"dataLicense",
         )
         # Provides an ExternalMap of Element identifiers.
         cls._add_property(
-            "imports",
+            "import_",
             ListProp(ObjectProp(ExternalMap, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/imports",
-            compact=3D"imports",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/import",
+            compact=3D"import",
         )
         # Provides a NamespaceMap of prefixes and associated namespace par=
tial URIs applicable to an SpdxDocument and independent of any specific ser=
ialization format or instance.
         cls._add_property(
             "namespaceMap",
             ListProp(ObjectProp(NamespaceMap, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/namespaceMap",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/namespaceMap",
             compact=3D"namespaceMap",
         )
=20
=20
 # Indicates the type of support that is associated with an artifact.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/SupportType", compact_typ=
e=3D"SupportType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/SupportType", compact_typ=
e=3D"SupportType", abstract=3DFalse)
 class SupportType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "deployed": "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/dep=
loyed",
-        "development": "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/=
development",
-        "endOfSupport": "https://spdx.org/rdf/3.0.0/terms/Core/SupportType=
/endOfSupport",
-        "limitedSupport": "https://spdx.org/rdf/3.0.0/terms/Core/SupportTy=
pe/limitedSupport",
-        "noAssertion": "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/=
noAssertion",
-        "noSupport": "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/no=
Support",
-        "support": "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/supp=
ort",
+        "deployed": "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/dep=
loyed",
+        "development": "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/=
development",
+        "endOfSupport": "https://spdx.org/rdf/3.0.1/terms/Core/SupportType=
/endOfSupport",
+        "limitedSupport": "https://spdx.org/rdf/3.0.1/terms/Core/SupportTy=
pe/limitedSupport",
+        "noAssertion": "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/=
noAssertion",
+        "noSupport": "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/no=
Support",
+        "support": "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/supp=
ort",
     }
     # in addition to being supported by the supplier, the software is know=
n to have been deployed and is in use.  For a software as a service provide=
r, this implies the software is now available as a service.
-    deployed =3D "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/deploy=
ed"
+    deployed =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/deploy=
ed"
     # the artifact is in active development and is not considered ready fo=
r formal support from the supplier.
-    development =3D "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/dev=
elopment"
+    development =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/dev=
elopment"
     # there is a defined end of support for the artifact from the supplier=
.  This may also be referred to as end of life. There is a validUntilDate t=
hat can be used to signal when support ends for the artifact.
-    endOfSupport =3D "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/en=
dOfSupport"
+    endOfSupport =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/en=
dOfSupport"
     # the artifact has been released, and there is limited support availab=
le from the supplier. There is a validUntilDate that can provide additional=
 information about the duration of support.
-    limitedSupport =3D "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/=
limitedSupport"
+    limitedSupport =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/=
limitedSupport"
     # no assertion about the type of support is made.   This is considered=
 the default if no other support type is used.
-    noAssertion =3D "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/noA=
ssertion"
+    noAssertion =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/noA=
ssertion"
     # there is no support for the artifact from the supplier, consumer ass=
umes any support obligations.
-    noSupport =3D "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/noSup=
port"
+    noSupport =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/noSup=
port"
     # the artifact has been released, and is supported from the supplier. =
  There is a validUntilDate that can provide additional information about t=
he duration of support.
-    support =3D "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/support"
+    support =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/support"
=20
=20
 # An element of hardware and/or software utilized to carry out a particula=
r function.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/Tool", compact_type=3D"To=
ol", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/Tool", compact_type=3D"To=
ol", abstract=3DFalse)
 class Tool(Element):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
=20
=20
 # Categories of confidentiality level.
-@register("https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLevelTy=
pe", compact_type=3D"dataset_ConfidentialityLevelType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Dataset/ConfidentialityLevelTy=
pe", compact_type=3D"dataset_ConfidentialityLevelType", abstract=3DFalse)
 class dataset_ConfidentialityLevelType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "amber": "https://spdx.org/rdf/3.0.0/terms/Dataset/Confidentiality=
LevelType/amber",
-        "clear": "https://spdx.org/rdf/3.0.0/terms/Dataset/Confidentiality=
LevelType/clear",
-        "green": "https://spdx.org/rdf/3.0.0/terms/Dataset/Confidentiality=
LevelType/green",
-        "red": "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLe=
velType/red",
+        "amber": "https://spdx.org/rdf/3.0.1/terms/Dataset/Confidentiality=
LevelType/amber",
+        "clear": "https://spdx.org/rdf/3.0.1/terms/Dataset/Confidentiality=
LevelType/clear",
+        "green": "https://spdx.org/rdf/3.0.1/terms/Dataset/Confidentiality=
LevelType/green",
+        "red": "https://spdx.org/rdf/3.0.1/terms/Dataset/ConfidentialityLe=
velType/red",
     }
-    # Data points in the dataset can be shared only with specific
-    amber =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLev=
elType/amber"
+    # Data points in the dataset can be shared only with specific organiza=
tions and their clients on a need to know basis.
+    amber =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/ConfidentialityLev=
elType/amber"
     # Dataset may be distributed freely, without restriction.
-    clear =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLev=
elType/clear"
+    clear =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/ConfidentialityLev=
elType/clear"
     # Dataset can be shared within a community of peers and partners.
-    green =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLev=
elType/green"
-    # Data points in the dataset are highly confidential and can only be s=
hared
-    red =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLevel=
Type/red"
+    green =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/ConfidentialityLev=
elType/green"
+    # Data points in the dataset are highly confidential and can only be s=
hared with named recipients.
+    red =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/ConfidentialityLevel=
Type/red"
=20
=20
 # Availability of dataset.
-@register("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabilityTyp=
e", compact_type=3D"dataset_DatasetAvailabilityType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAvailabilityTyp=
e", compact_type=3D"dataset_DatasetAvailabilityType", abstract=3DFalse)
 class dataset_DatasetAvailabilityType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "clickthrough": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetA=
vailabilityType/clickthrough",
-        "directDownload": "https://spdx.org/rdf/3.0.0/terms/Dataset/Datase=
tAvailabilityType/directDownload",
-        "query": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabi=
lityType/query",
-        "registration": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetA=
vailabilityType/registration",
-        "scrapingScript": "https://spdx.org/rdf/3.0.0/terms/Dataset/Datase=
tAvailabilityType/scrapingScript",
+        "clickthrough": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetA=
vailabilityType/clickthrough",
+        "directDownload": "https://spdx.org/rdf/3.0.1/terms/Dataset/Datase=
tAvailabilityType/directDownload",
+        "query": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAvailabi=
lityType/query",
+        "registration": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetA=
vailabilityType/registration",
+        "scrapingScript": "https://spdx.org/rdf/3.0.1/terms/Dataset/Datase=
tAvailabilityType/scrapingScript",
     }
-    # the dataset is not publicly available and can only be accessed
-    clickthrough =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvai=
labilityType/clickthrough"
-    # the dataset is publicly available and can be downloaded
-    directDownload =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAv=
ailabilityType/directDownload"
-    # the dataset is publicly available, but not all at once, and can only
-    query =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabilit=
yType/query"
-    # the dataset is not publicly available and an email registration
-    registration =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvai=
labilityType/registration"
-    # the dataset provider is not making available the underlying
-    scrapingScript =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAv=
ailabilityType/scrapingScript"
+    # the dataset is not publicly available and can only be accessed after=
 affirmatively accepting terms on a clickthrough webpage.
+    clickthrough =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAvai=
labilityType/clickthrough"
+    # the dataset is publicly available and can be downloaded directly.
+    directDownload =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAv=
ailabilityType/directDownload"
+    # the dataset is publicly available, but not all at once, and can only=
 be accessed through queries which return parts of the dataset.
+    query =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAvailabilit=
yType/query"
+    # the dataset is not publicly available and an email registration is r=
equired before accessing the dataset, although without an affirmative accep=
tance of terms.
+    registration =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAvai=
labilityType/registration"
+    # the dataset provider is not making available the underlying data and=
 the dataset must be reassembled, typically using the provided script for s=
craping the data.
+    scrapingScript =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAv=
ailabilityType/scrapingScript"
=20
=20
 # Enumeration of dataset types.
-@register("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType", compact_=
type=3D"dataset_DatasetType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType", compact_=
type=3D"dataset_DatasetType", abstract=3DFalse)
 class dataset_DatasetType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "audio": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/aud=
io",
-        "categorical": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetTy=
pe/categorical",
-        "graph": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/gra=
ph",
-        "image": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/ima=
ge",
-        "noAssertion": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetTy=
pe/noAssertion",
-        "numeric": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/n=
umeric",
-        "other": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/oth=
er",
-        "sensor": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/se=
nsor",
-        "structured": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetTyp=
e/structured",
-        "syntactic": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/syntactic",
-        "text": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/text=
",
-        "timeseries": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetTyp=
e/timeseries",
-        "timestamp": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/timestamp",
-        "video": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/vid=
eo",
+        "audio": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/aud=
io",
+        "categorical": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/categorical",
+        "graph": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/gra=
ph",
+        "image": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/ima=
ge",
+        "noAssertion": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/noAssertion",
+        "numeric": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/n=
umeric",
+        "other": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/oth=
er",
+        "sensor": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/se=
nsor",
+        "structured": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTyp=
e/structured",
+        "syntactic": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/syntactic",
+        "text": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/text=
",
+        "timeseries": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTyp=
e/timeseries",
+        "timestamp": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/timestamp",
+        "video": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/vid=
eo",
     }
     # data is audio based, such as a collection of music from the 80s.
-    audio =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/audio"
-    # data that is classified into a discrete number of categories,
-    categorical =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/=
categorical"
-    # data is in the form of a graph where entries are somehow related to
-    graph =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/graph"
+    audio =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/audio"
+    # data that is classified into a discrete number of categories, such a=
s the eye color of a population of people.
+    categorical =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/=
categorical"
+    # data is in the form of a graph where entries are somehow related to =
each other through edges, such a social network of friends.
+    graph =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/graph"
     # data is a collection of images such as pictures of animals.
-    image =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/image"
+    image =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/image"
     # data type is not known.
-    noAssertion =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/=
noAssertion"
+    noAssertion =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/=
noAssertion"
     # data consists only of numeric entries.
-    numeric =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/nume=
ric"
+    numeric =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/nume=
ric"
     # data is of a type not included in this list.
-    other =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/other"
-    # data is recorded from a physical sensor, such as a thermometer
-    sensor =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/senso=
r"
-    # data is stored in tabular format or retrieved from a relational
-    structured =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/s=
tructured"
-    # data describes the syntax or semantics of a language or text, such
-    syntactic =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/sy=
ntactic"
-    # data consists of unstructured text, such as a book, Wikipedia article
-    text =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/text"
-    # data is recorded in an ordered sequence of timestamped entries,
-    timeseries =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/t=
imeseries"
-    # data is recorded with a timestamp for each entry, but not
-    timestamp =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/ti=
mestamp"
-    # data is video based, such as a collection of movie clips featuring T=
om
-    video =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/video"
+    other =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/other"
+    # data is recorded from a physical sensor, such as a thermometer readi=
ng or biometric device.
+    sensor =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/senso=
r"
+    # data is stored in tabular format or retrieved from a relational data=
base.
+    structured =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/s=
tructured"
+    # data describes the syntax or semantics of a language or text, such a=
s a parse tree used for natural language processing.
+    syntactic =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/sy=
ntactic"
+    # data consists of unstructured text, such as a book, Wikipedia articl=
e (without images), or transcript.
+    text =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/text"
+    # data is recorded in an ordered sequence of timestamped entries, such=
 as the price of a stock over the course of a day.
+    timeseries =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/t=
imeseries"
+    # data is recorded with a timestamp for each entry, but not necessaril=
y ordered or at specific intervals, such as when a taxi ride starts and end=
s.
+    timestamp =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/ti=
mestamp"
+    # data is video based, such as a collection of movie clips featuring T=
om Hanks.
+    video =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/video"
=20
=20
 # Abstract class for additional text intended to be added to a License, but
 # which is not itself a standalone License.
-@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/LicenseAddit=
ion", compact_type=3D"expandedlicensing_LicenseAddition", abstract=3DTrue)
+@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/LicenseAddit=
ion", compact_type=3D"expandedlicensing_LicenseAddition", abstract=3DTrue)
 class expandedlicensing_LicenseAddition(Element):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -3979,7 +3512,7 @@ class expandedlicensing_LicenseAddition(Element):
         cls._add_property(
             "expandedlicensing_additionText",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/addi=
tionText",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/addi=
tionText",
             min_count=3D1,
             compact=3D"expandedlicensing_additionText",
         )
@@ -3987,7 +3520,7 @@ class expandedlicensing_LicenseAddition(Element):
         cls._add_property(
             "expandedlicensing_isDeprecatedAdditionId",
             BooleanProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/isDe=
precatedAdditionId",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/isDe=
precatedAdditionId",
             compact=3D"expandedlicensing_isDeprecatedAdditionId",
         )
         # Identifies all the text and metadata associated with a license i=
n the license
@@ -3995,7 +3528,7 @@ class expandedlicensing_LicenseAddition(Element):
         cls._add_property(
             "expandedlicensing_licenseXml",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/lice=
nseXml",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/lice=
nseXml",
             compact=3D"expandedlicensing_licenseXml",
         )
         # Specifies the licenseId that is preferred to be used in place of=
 a deprecated
@@ -4003,29 +3536,29 @@ class expandedlicensing_LicenseAddition(Element):
         cls._add_property(
             "expandedlicensing_obsoletedBy",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/obso=
letedBy",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/obso=
letedBy",
             compact=3D"expandedlicensing_obsoletedBy",
         )
         # Contains a URL where the License or LicenseAddition can be found=
 in use.
         cls._add_property(
             "expandedlicensing_seeAlso",
             ListProp(AnyURIProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/seeA=
lso",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/seeA=
lso",
             compact=3D"expandedlicensing_seeAlso",
         )
         # Identifies the full text of a LicenseAddition, in SPDX templatin=
g format.
         cls._add_property(
             "expandedlicensing_standardAdditionTemplate",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/stan=
dardAdditionTemplate",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/stan=
dardAdditionTemplate",
             compact=3D"expandedlicensing_standardAdditionTemplate",
         )
=20
=20
 # A license exception that is listed on the SPDX Exceptions list.
-@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/ListedLicens=
eException", compact_type=3D"expandedlicensing_ListedLicenseException", abs=
tract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/ListedLicens=
eException", compact_type=3D"expandedlicensing_ListedLicenseException", abs=
tract=3DFalse)
 class expandedlicensing_ListedLicenseException(expandedlicensing_LicenseAd=
dition):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4038,7 +3571,7 @@ class expandedlicensing_ListedLicenseException(expand=
edlicensing_LicenseAddition
         cls._add_property(
             "expandedlicensing_deprecatedVersion",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/depr=
ecatedVersion",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/depr=
ecatedVersion",
             compact=3D"expandedlicensing_deprecatedVersion",
         )
         # Specifies the SPDX License List version in which this ListedLice=
nse or
@@ -4046,130 +3579,130 @@ class expandedlicensing_ListedLicenseException(ex=
pandedlicensing_LicenseAddition
         cls._add_property(
             "expandedlicensing_listVersionAdded",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/list=
VersionAdded",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/list=
VersionAdded",
             compact=3D"expandedlicensing_listVersionAdded",
         )
=20
=20
 # A property name with an associated value.
-@register("https://spdx.org/rdf/3.0.0/terms/Extension/CdxPropertyEntry", c=
ompact_type=3D"extension_CdxPropertyEntry", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Extension/CdxPropertyEntry", c=
ompact_type=3D"extension_CdxPropertyEntry", abstract=3DFalse)
 class extension_CdxPropertyEntry(SHACLObject):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
     @classmethod
     def _register_props(cls):
         super()._register_props()
-        # A name used in a CdxExtension name-value pair.
+        # A name used in a CdxPropertyEntry name-value pair.
         cls._add_property(
             "extension_cdxPropName",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Extension/cdxPropName",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Extension/cdxPropName",
             min_count=3D1,
             compact=3D"extension_cdxPropName",
         )
-        # A value used in a CdxExtension name-value pair.
+        # A value used in a CdxPropertyEntry name-value pair.
         cls._add_property(
             "extension_cdxPropValue",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Extension/cdxPropValue=
",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Extension/cdxPropValue=
",
             compact=3D"extension_cdxPropValue",
         )
=20
=20
 # A characterization of some aspect of an Element that is associated with =
the Element in a generalized fashion.
-@register("https://spdx.org/rdf/3.0.0/terms/Extension/Extension", compact_=
type=3D"extension_Extension", abstract=3DTrue)
+@register("https://spdx.org/rdf/3.0.1/terms/Extension/Extension", compact_=
type=3D"extension_Extension", abstract=3DTrue)
 class extension_Extension(SHACLExtensibleObject, SHACLObject):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
=20
 # Specifies the CVSS base, temporal, threat, or environmental severity typ=
e.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType", co=
mpact_type=3D"security_CvssSeverityType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityType", co=
mpact_type=3D"security_CvssSeverityType", abstract=3DFalse)
 class security_CvssSeverityType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "critical": "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverit=
yType/critical",
-        "high": "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityTyp=
e/high",
-        "low": "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType=
/low",
-        "medium": "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityT=
ype/medium",
-        "none": "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityTyp=
e/none",
+        "critical": "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverit=
yType/critical",
+        "high": "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityTyp=
e/high",
+        "low": "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityType=
/low",
+        "medium": "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityT=
ype/medium",
+        "none": "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityTyp=
e/none",
     }
     # When a CVSS score is between 9.0 - 10.0
-    critical =3D "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityTy=
pe/critical"
+    critical =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityTy=
pe/critical"
     # When a CVSS score is between 7.0 - 8.9
-    high =3D "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/h=
igh"
-    # When a CVSS score is between 0 - 3.9
-    low =3D "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/lo=
w"
-    # When a CVSS score is between 4 - 6.9
-    medium =3D "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType=
/medium"
-    # When a CVSS score is 0
-    none =3D "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/n=
one"
+    high =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityType/h=
igh"
+    # When a CVSS score is between 0.1 - 3.9
+    low =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityType/lo=
w"
+    # When a CVSS score is between 4.0 - 6.9
+    medium =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityType=
/medium"
+    # When a CVSS score is 0.0
+    none =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityType/n=
one"
=20
=20
 # Specifies the exploit catalog type.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalogType", =
compact_type=3D"security_ExploitCatalogType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/ExploitCatalogType", =
compact_type=3D"security_ExploitCatalogType", abstract=3DFalse)
 class security_ExploitCatalogType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "kev": "https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalogTy=
pe/kev",
-        "other": "https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalog=
Type/other",
+        "kev": "https://spdx.org/rdf/3.0.1/terms/Security/ExploitCatalogTy=
pe/kev",
+        "other": "https://spdx.org/rdf/3.0.1/terms/Security/ExploitCatalog=
Type/other",
     }
     # CISA's Known Exploited Vulnerability (KEV) Catalog
-    kev =3D "https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalogType/=
kev"
+    kev =3D "https://spdx.org/rdf/3.0.1/terms/Security/ExploitCatalogType/=
kev"
     # Other exploit catalogs
-    other =3D "https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalogTyp=
e/other"
+    other =3D "https://spdx.org/rdf/3.0.1/terms/Security/ExploitCatalogTyp=
e/other"
=20
=20
 # Specifies the SSVC decision type.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType", co=
mpact_type=3D"security_SsvcDecisionType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisionType", co=
mpact_type=3D"security_SsvcDecisionType", abstract=3DFalse)
 class security_SsvcDecisionType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "act": "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType=
/act",
-        "attend": "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionT=
ype/attend",
-        "track": "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionTy=
pe/track",
-        "trackStar": "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisi=
onType/trackStar",
+        "act": "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisionType=
/act",
+        "attend": "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisionT=
ype/attend",
+        "track": "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisionTy=
pe/track",
+        "trackStar": "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisi=
onType/trackStar",
     }
     # The vulnerability requires attention from the organization's interna=
l, supervisory-level and leadership-level individuals. Necessary actions in=
clude requesting assistance or information about the vulnerability, as well=
 as publishing a notification either internally and/or externally. Typicall=
y, internal groups would meet to determine the overall response and then ex=
ecute agreed upon actions. CISA recommends remediating Act vulnerabilities =
as soon as possible.
-    act =3D "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType/ac=
t"
+    act =3D "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisionType/ac=
t"
     # The vulnerability requires attention from the organization's interna=
l, supervisory-level individuals. Necessary actions include requesting assi=
stance or information about the vulnerability, and may involve publishing a=
 notification either internally and/or externally. CISA recommends remediat=
ing Attend vulnerabilities sooner than standard update timelines.
-    attend =3D "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType=
/attend"
+    attend =3D "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisionType=
/attend"
     # The vulnerability does not require action at this time. The organiza=
tion would continue to track the vulnerability and reassess it if new infor=
mation becomes available. CISA recommends remediating Track vulnerabilities=
 within standard update timelines.
-    track =3D "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType/=
track"
-    # ("Track*" in the SSVC spec) The vulnerability contains specific char=
acteristics that may require closer monitoring for changes. CISA recommends=
 remediating Track* vulnerabilities within standard update timelines.
-    trackStar =3D "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionT=
ype/trackStar"
+    track =3D "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisionType/=
track"
+    # ("Track\*" in the SSVC spec) The vulnerability contains specific cha=
racteristics that may require closer monitoring for changes. CISA recommend=
s remediating Track\* vulnerabilities within standard update timelines.
+    trackStar =3D "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisionT=
ype/trackStar"
=20
=20
 # Specifies the VEX justification type.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType"=
, compact_type=3D"security_VexJustificationType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/VexJustificationType"=
, compact_type=3D"security_VexJustificationType", abstract=3DFalse)
 class security_VexJustificationType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "componentNotPresent": "https://spdx.org/rdf/3.0.0/terms/Security/=
VexJustificationType/componentNotPresent",
-        "inlineMitigationsAlreadyExist": "https://spdx.org/rdf/3.0.0/terms=
/Security/VexJustificationType/inlineMitigationsAlreadyExist",
-        "vulnerableCodeCannotBeControlledByAdversary": "https://spdx.org/r=
df/3.0.0/terms/Security/VexJustificationType/vulnerableCodeCannotBeControll=
edByAdversary",
-        "vulnerableCodeNotInExecutePath": "https://spdx.org/rdf/3.0.0/term=
s/Security/VexJustificationType/vulnerableCodeNotInExecutePath",
-        "vulnerableCodeNotPresent": "https://spdx.org/rdf/3.0.0/terms/Secu=
rity/VexJustificationType/vulnerableCodeNotPresent",
+        "componentNotPresent": "https://spdx.org/rdf/3.0.1/terms/Security/=
VexJustificationType/componentNotPresent",
+        "inlineMitigationsAlreadyExist": "https://spdx.org/rdf/3.0.1/terms=
/Security/VexJustificationType/inlineMitigationsAlreadyExist",
+        "vulnerableCodeCannotBeControlledByAdversary": "https://spdx.org/r=
df/3.0.1/terms/Security/VexJustificationType/vulnerableCodeCannotBeControll=
edByAdversary",
+        "vulnerableCodeNotInExecutePath": "https://spdx.org/rdf/3.0.1/term=
s/Security/VexJustificationType/vulnerableCodeNotInExecutePath",
+        "vulnerableCodeNotPresent": "https://spdx.org/rdf/3.0.1/terms/Secu=
rity/VexJustificationType/vulnerableCodeNotPresent",
     }
     # The software is not affected because the vulnerable component is not=
 in the product.
-    componentNotPresent =3D "https://spdx.org/rdf/3.0.0/terms/Security/Vex=
JustificationType/componentNotPresent"
+    componentNotPresent =3D "https://spdx.org/rdf/3.0.1/terms/Security/Vex=
JustificationType/componentNotPresent"
     # Built-in inline controls or mitigations prevent an adversary from le=
veraging the vulnerability.
-    inlineMitigationsAlreadyExist =3D "https://spdx.org/rdf/3.0.0/terms/Se=
curity/VexJustificationType/inlineMitigationsAlreadyExist"
+    inlineMitigationsAlreadyExist =3D "https://spdx.org/rdf/3.0.1/terms/Se=
curity/VexJustificationType/inlineMitigationsAlreadyExist"
     # The vulnerable component is present, and the component contains the =
vulnerable code. However, vulnerable code is used in such a way that an att=
acker cannot mount any anticipated attack.
-    vulnerableCodeCannotBeControlledByAdversary =3D "https://spdx.org/rdf/=
3.0.0/terms/Security/VexJustificationType/vulnerableCodeCannotBeControlledB=
yAdversary"
+    vulnerableCodeCannotBeControlledByAdversary =3D "https://spdx.org/rdf/=
3.0.1/terms/Security/VexJustificationType/vulnerableCodeCannotBeControlledB=
yAdversary"
     # The affected code is not reachable through the execution of the code=
, including non-anticipated states of the product.
-    vulnerableCodeNotInExecutePath =3D "https://spdx.org/rdf/3.0.0/terms/S=
ecurity/VexJustificationType/vulnerableCodeNotInExecutePath"
+    vulnerableCodeNotInExecutePath =3D "https://spdx.org/rdf/3.0.1/terms/S=
ecurity/VexJustificationType/vulnerableCodeNotInExecutePath"
     # The product is not affected because the code underlying the vulnerab=
ility is not present in the product.
-    vulnerableCodeNotPresent =3D "https://spdx.org/rdf/3.0.0/terms/Securit=
y/VexJustificationType/vulnerableCodeNotPresent"
+    vulnerableCodeNotPresent =3D "https://spdx.org/rdf/3.0.1/terms/Securit=
y/VexJustificationType/vulnerableCodeNotPresent"
=20
=20
 # Abstract ancestor class for all vulnerability assessments
-@register("https://spdx.org/rdf/3.0.0/terms/Security/VulnAssessmentRelatio=
nship", compact_type=3D"security_VulnAssessmentRelationship", abstract=3DTr=
ue)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/VulnAssessmentRelatio=
nship", compact_type=3D"security_VulnAssessmentRelationship", abstract=3DTr=
ue)
 class security_VulnAssessmentRelationship(Relationship):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4181,56 +3714,62 @@ class security_VulnAssessmentRelationship(Relations=
hip):
         # referenced by the Element.
         cls._add_property(
             "suppliedBy",
-            ObjectProp(Agent, False),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/suppliedBy",
+            ObjectProp(Agent, False, context=3D[
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganizati=
on", "SpdxOrganization"),
+                ],),
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/suppliedBy",
             compact=3D"suppliedBy",
         )
         # Specifies an Element contained in a piece of software where a vu=
lnerability was
         # found.
         cls._add_property(
             "security_assessedElement",
-            ObjectProp(Element, False),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/assessedEleme=
nt",
+            ObjectProp(Element, False, context=3D[
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement", =
"NoneElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganizati=
on", "SpdxOrganization"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionEle=
ment", "NoAssertionElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oneLicense", "expandedlicensing_NoneLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                ],),
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/assessedEleme=
nt",
             compact=3D"security_assessedElement",
         )
         # Specifies a time when a vulnerability assessment was modified
         cls._add_property(
             "security_modifiedTime",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/modifiedTime",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/modifiedTime",
             compact=3D"security_modifiedTime",
         )
         # Specifies the time when a vulnerability was published.
         cls._add_property(
             "security_publishedTime",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/publishedTime=
",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/publishedTime=
",
             compact=3D"security_publishedTime",
         )
         # Specified the time and date when a vulnerability was withdrawn.
         cls._add_property(
             "security_withdrawnTime",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/withdrawnTime=
",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/withdrawnTime=
",
             compact=3D"security_withdrawnTime",
         )
=20
=20
-# Abstract class representing a license combination consisting of one or m=
ore
-# licenses (optionally including additional text), which may be combined
-# according to the SPDX license expression syntax.
-@register("https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/AnyLicenseInfo=
", compact_type=3D"simplelicensing_AnyLicenseInfo", abstract=3DTrue)
+# Abstract class representing a license combination consisting of one or m=
ore licenses.
+@register("https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/AnyLicenseInfo=
", compact_type=3D"simplelicensing_AnyLicenseInfo", abstract=3DTrue)
 class simplelicensing_AnyLicenseInfo(Element):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
=20
=20
 # An SPDX Element containing an SPDX license expression string.
-@register("https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/LicenseExpress=
ion", compact_type=3D"simplelicensing_LicenseExpression", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/LicenseExpress=
ion", compact_type=3D"simplelicensing_LicenseExpression", abstract=3DFalse)
 class simplelicensing_LicenseExpression(simplelicensing_AnyLicenseInfo):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4243,14 +3782,14 @@ class simplelicensing_LicenseExpression(simplelicen=
sing_AnyLicenseInfo):
         cls._add_property(
             "simplelicensing_customIdToUri",
             ListProp(ObjectProp(DictionaryEntry, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/custom=
IdToUri",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/custom=
IdToUri",
             compact=3D"simplelicensing_customIdToUri",
         )
         # A string in the license expression format.
         cls._add_property(
             "simplelicensing_licenseExpression",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/licens=
eExpression",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/licens=
eExpression",
             min_count=3D1,
             compact=3D"simplelicensing_licenseExpression",
         )
@@ -4258,15 +3797,15 @@ class simplelicensing_LicenseExpression(simplelicen=
sing_AnyLicenseInfo):
         cls._add_property(
             "simplelicensing_licenseListVersion",
             StringProp(pattern=3Dr"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d=
*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-=
Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/licens=
eListVersion",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/licens=
eListVersion",
             compact=3D"simplelicensing_licenseListVersion",
         )
=20
=20
 # A license or addition that is not listed on the SPDX License List.
-@register("https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/SimpleLicensin=
gText", compact_type=3D"simplelicensing_SimpleLicensingText", abstract=3DFa=
lse)
+@register("https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/SimpleLicensin=
gText", compact_type=3D"simplelicensing_SimpleLicensingText", abstract=3DFa=
lse)
 class simplelicensing_SimpleLicensingText(Element):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4278,16 +3817,16 @@ class simplelicensing_SimpleLicensingText(Element):
         cls._add_property(
             "simplelicensing_licenseText",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/licens=
eText",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/licens=
eText",
             min_count=3D1,
             compact=3D"simplelicensing_licenseText",
         )
=20
=20
 # A canonical, unique, immutable identifier
-@register("https://spdx.org/rdf/3.0.0/terms/Software/ContentIdentifier", c=
ompact_type=3D"software_ContentIdentifier", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Software/ContentIdentifier", c=
ompact_type=3D"software_ContentIdentifier", abstract=3DFalse)
 class software_ContentIdentifier(IntegrityMethod):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
@@ -4298,10 +3837,10 @@ class software_ContentIdentifier(IntegrityMethod):
         cls._add_property(
             "software_contentIdentifierType",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/ContentIde=
ntifierType/gitoid", "gitoid"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/ContentIde=
ntifierType/swhid", "swhid"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/ContentIde=
ntifierType/gitoid", "gitoid"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/ContentIde=
ntifierType/swhid", "swhid"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/contentIdenti=
fierType",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/contentIdenti=
fierType",
             min_count=3D1,
             compact=3D"software_contentIdentifierType",
         )
@@ -4309,166 +3848,166 @@ class software_ContentIdentifier(IntegrityMethod):
         cls._add_property(
             "software_contentIdentifierValue",
             AnyURIProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/contentIdenti=
fierValue",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/contentIdenti=
fierValue",
             min_count=3D1,
             compact=3D"software_contentIdentifierValue",
         )
=20
=20
 # Specifies the type of a content identifier.
-@register("https://spdx.org/rdf/3.0.0/terms/Software/ContentIdentifierType=
", compact_type=3D"software_ContentIdentifierType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Software/ContentIdentifierType=
", compact_type=3D"software_ContentIdentifierType", abstract=3DFalse)
 class software_ContentIdentifierType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "gitoid": "https://spdx.org/rdf/3.0.0/terms/Software/ContentIdenti=
fierType/gitoid",
-        "swhid": "https://spdx.org/rdf/3.0.0/terms/Software/ContentIdentif=
ierType/swhid",
+        "gitoid": "https://spdx.org/rdf/3.0.1/terms/Software/ContentIdenti=
fierType/gitoid",
+        "swhid": "https://spdx.org/rdf/3.0.1/terms/Software/ContentIdentif=
ierType/swhid",
     }
-    # Gitoid stands for [Git Object ID](https://git-scm.com/book/en/v2/Git=
-Internals-Git-Objects) and a gitoid of type blob is a unique hash of a bin=
ary artifact. A gitoid may represent the software [Artifact ID](https://git=
hub.com/omnibor/spec/blob/main/spec/SPEC.md#artifact-id) or the [OmniBOR Id=
entifier](https://github.com/omnibor/spec/blob/main/spec/SPEC.md#omnibor-id=
entifier) for the software artifact's associated [OmniBOR Document](https:/=
/github.com/omnibor/spec/blob/main/spec/SPEC.md#omnibor-document).
-    gitoid =3D "https://spdx.org/rdf/3.0.0/terms/Software/ContentIdentifie=
rType/gitoid"
-    # SoftWare Hash IDentifier, persistent intrinsic identifiers for digit=
al artifacts. The syntax of the identifiers is defined in the [SWHID specif=
ication](https://www.swhid.org/specification/v1.1/4.Syntax) and in the case=
 of filess they typically look like `swh:1:cnt:94a9ed024d3859793618152ea559=
a168bbcbb5e2`.
-    swhid =3D "https://spdx.org/rdf/3.0.0/terms/Software/ContentIdentifier=
Type/swhid"
+    # [Gitoid](https://www.iana.org/assignments/uri-schemes/prov/gitoid), =
stands for [Git Object ID](https://git-scm.com/book/en/v2/Git-Internals-Git=
-Objects). A gitoid of type blob is a unique hash of a binary artifact. A g=
itoid may represent either an [Artifact Identifier](https://github.com/omni=
bor/spec/blob/eb1ee5c961c16215eb8709b2975d193a2007a35d/spec/SPEC.md#artifac=
t-identifier-types) for the software artifact or an [Input Manifest Identif=
ier](https://github.com/omnibor/spec/blob/eb1ee5c961c16215eb8709b2975d193a2=
007a35d/spec/SPEC.md#input-manifest-identifier) for the software artifact's=
 associated [Artifact Input Manifest](https://github.com/omnibor/spec/blob/=
eb1ee5c961c16215eb8709b2975d193a2007a35d/spec/SPEC.md#artifact-input-manife=
st); this ambiguity exists because the Artifact Input Manifest is itself an=
 artifact, and the gitoid of that artifact is its valid identifier. Gitoids=
 calculated on software artifacts (Snippet, File, or Package Elements) shou=
ld be recorded in the SPDX 3.0 SoftwareArtifact's contentIdentifier propert=
y. Gitoids calculated on the Artifact Input Manifest (Input Manifest Identi=
fier) should be recorded in the SPDX 3.0 Element's externalIdentifier prope=
rty. See [OmniBOR Specification](https://github.com/omnibor/spec/), a minim=
alistic specification for describing software [Artifact Dependency Graphs](=
https://github.com/omnibor/spec/blob/eb1ee5c961c16215eb8709b2975d193a2007a3=
5d/spec/SPEC.md#artifact-dependency-graph-adg).
+    gitoid =3D "https://spdx.org/rdf/3.0.1/terms/Software/ContentIdentifie=
rType/gitoid"
+    # SoftWare Hash IDentifier, a persistent intrinsic identifier for digi=
tal artifacts, such as files, trees (also known as directories or folders),=
 commits, and other objects typically found in version control systems. The=
 format of the identifiers is defined in the [SWHID specification](https://=
www.swhid.org/specification/v1.1/4.Syntax) (ISO/IEC DIS 18670). They typica=
lly look like `swh:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2`.
+    swhid =3D "https://spdx.org/rdf/3.0.1/terms/Software/ContentIdentifier=
Type/swhid"
=20
=20
 # Enumeration of the different kinds of SPDX file.
-@register("https://spdx.org/rdf/3.0.0/terms/Software/FileKindType", compac=
t_type=3D"software_FileKindType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Software/FileKindType", compac=
t_type=3D"software_FileKindType", abstract=3DFalse)
 class software_FileKindType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "directory": "https://spdx.org/rdf/3.0.0/terms/Software/FileKindTy=
pe/directory",
-        "file": "https://spdx.org/rdf/3.0.0/terms/Software/FileKindType/fi=
le",
+        "directory": "https://spdx.org/rdf/3.0.1/terms/Software/FileKindTy=
pe/directory",
+        "file": "https://spdx.org/rdf/3.0.1/terms/Software/FileKindType/fi=
le",
     }
-    # The file represents a directory and all content stored in that
-    directory =3D "https://spdx.org/rdf/3.0.0/terms/Software/FileKindType/=
directory"
+    # The file represents a directory and all content stored in that direc=
tory.
+    directory =3D "https://spdx.org/rdf/3.0.1/terms/Software/FileKindType/=
directory"
     # The file represents a single file (default).
-    file =3D "https://spdx.org/rdf/3.0.0/terms/Software/FileKindType/file"
+    file =3D "https://spdx.org/rdf/3.0.1/terms/Software/FileKindType/file"
=20
=20
 # Provides a set of values to be used to describe the common types of SBOM=
s that
 # tools may create.
-@register("https://spdx.org/rdf/3.0.0/terms/Software/SbomType", compact_ty=
pe=3D"software_SbomType", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Software/SbomType", compact_ty=
pe=3D"software_SbomType", abstract=3DFalse)
 class software_SbomType(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "analyzed": "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/an=
alyzed",
-        "build": "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/build=
",
-        "deployed": "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/de=
ployed",
-        "design": "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/desi=
gn",
-        "runtime": "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/run=
time",
-        "source": "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/sour=
ce",
+        "analyzed": "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/an=
alyzed",
+        "build": "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/build=
",
+        "deployed": "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/de=
ployed",
+        "design": "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/desi=
gn",
+        "runtime": "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/run=
time",
+        "source": "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/sour=
ce",
     }
     # SBOM generated through analysis of artifacts (e.g., executables, pac=
kages, containers, and virtual machine images) after its build. Such analys=
is generally requires a variety of heuristics. In some contexts, this may a=
lso be referred to as a "3rd party" SBOM.
-    analyzed =3D "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/analy=
zed"
+    analyzed =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/analy=
zed"
     # SBOM generated as part of the process of building the software to cr=
eate a releasable artifact (e.g., executable or package) from data such as =
source files, dependencies, built components, build process ephemeral data,=
 and other SBOMs.
-    build =3D "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/build"
+    build =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/build"
     # SBOM provides an inventory of software that is present on a system. =
This may be an assembly of other SBOMs that combines analysis of configurat=
ion options, and examination of execution behavior in a (potentially simula=
ted) deployment environment.
-    deployed =3D "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/deplo=
yed"
+    deployed =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/deplo=
yed"
     # SBOM of intended, planned software project or product with included =
components (some of which may not yet exist) for a new software artifact.
-    design =3D "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/design"
+    design =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/design"
     # SBOM generated through instrumenting the system running the software=
, to capture only components present in the system, as well as external cal=
l-outs or dynamically loaded components. In some contexts, this may also be=
 referred to as an "Instrumented" or "Dynamic" SBOM.
-    runtime =3D "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/runtim=
e"
+    runtime =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/runtim=
e"
     # SBOM created directly from the development environment, source files=
, and included dependencies used to build an product artifact.
-    source =3D "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/source"
+    source =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/source"
=20
=20
 # Provides information about the primary purpose of an Element.
-@register("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose", com=
pact_type=3D"software_SoftwarePurpose", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose", com=
pact_type=3D"software_SoftwarePurpose", abstract=3DFalse)
 class software_SoftwarePurpose(SHACLObject):
     NODE_KIND =3D NodeKind.BlankNodeOrIRI
     NAMED_INDIVIDUALS =3D {
-        "application": "https://spdx.org/rdf/3.0.0/terms/Software/Software=
Purpose/application",
-        "archive": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurp=
ose/archive",
-        "bom": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/=
bom",
-        "configuration": "https://spdx.org/rdf/3.0.0/terms/Software/Softwa=
rePurpose/configuration",
-        "container": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/container",
-        "data": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose=
/data",
-        "device": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpo=
se/device",
-        "deviceDriver": "https://spdx.org/rdf/3.0.0/terms/Software/Softwar=
ePurpose/deviceDriver",
-        "diskImage": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/diskImage",
-        "documentation": "https://spdx.org/rdf/3.0.0/terms/Software/Softwa=
rePurpose/documentation",
-        "evidence": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePur=
pose/evidence",
-        "executable": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwareP=
urpose/executable",
-        "file": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose=
/file",
-        "filesystemImage": "https://spdx.org/rdf/3.0.0/terms/Software/Soft=
warePurpose/filesystemImage",
-        "firmware": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePur=
pose/firmware",
-        "framework": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/framework",
-        "install": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurp=
ose/install",
-        "library": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurp=
ose/library",
-        "manifest": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePur=
pose/manifest",
-        "model": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpos=
e/model",
-        "module": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpo=
se/module",
-        "operatingSystem": "https://spdx.org/rdf/3.0.0/terms/Software/Soft=
warePurpose/operatingSystem",
-        "other": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpos=
e/other",
-        "patch": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpos=
e/patch",
-        "platform": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePur=
pose/platform",
-        "requirement": "https://spdx.org/rdf/3.0.0/terms/Software/Software=
Purpose/requirement",
-        "source": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpo=
se/source",
-        "specification": "https://spdx.org/rdf/3.0.0/terms/Software/Softwa=
rePurpose/specification",
-        "test": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose=
/test",
+        "application": "https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/application",
+        "archive": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurp=
ose/archive",
+        "bom": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/=
bom",
+        "configuration": "https://spdx.org/rdf/3.0.1/terms/Software/Softwa=
rePurpose/configuration",
+        "container": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/container",
+        "data": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose=
/data",
+        "device": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpo=
se/device",
+        "deviceDriver": "https://spdx.org/rdf/3.0.1/terms/Software/Softwar=
ePurpose/deviceDriver",
+        "diskImage": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/diskImage",
+        "documentation": "https://spdx.org/rdf/3.0.1/terms/Software/Softwa=
rePurpose/documentation",
+        "evidence": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePur=
pose/evidence",
+        "executable": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwareP=
urpose/executable",
+        "file": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose=
/file",
+        "filesystemImage": "https://spdx.org/rdf/3.0.1/terms/Software/Soft=
warePurpose/filesystemImage",
+        "firmware": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePur=
pose/firmware",
+        "framework": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/framework",
+        "install": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurp=
ose/install",
+        "library": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurp=
ose/library",
+        "manifest": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePur=
pose/manifest",
+        "model": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpos=
e/model",
+        "module": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpo=
se/module",
+        "operatingSystem": "https://spdx.org/rdf/3.0.1/terms/Software/Soft=
warePurpose/operatingSystem",
+        "other": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpos=
e/other",
+        "patch": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpos=
e/patch",
+        "platform": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePur=
pose/platform",
+        "requirement": "https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/requirement",
+        "source": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpo=
se/source",
+        "specification": "https://spdx.org/rdf/3.0.1/terms/Software/Softwa=
rePurpose/specification",
+        "test": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose=
/test",
     }
-    # the Element is a software application
-    application =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePur=
pose/application"
-    # the Element is an archived collection of one or more files (.tar, .z=
ip, etc)
-    archive =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose=
/archive"
-    # Element is a bill of materials
-    bom =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/bom"
-    # Element is configuration data
-    configuration =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwareP=
urpose/configuration"
-    # the Element is a container image which can be used by a container ru=
ntime application
-    container =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpo=
se/container"
-    # Element is data
-    data =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/da=
ta"
-    # the Element refers to a chipset, processor, or electronic board
-    device =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/=
device"
-    # Element represents software that controls hardware devices
-    deviceDriver =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/deviceDriver"
-    # the Element refers to a disk image that can be written to a disk, bo=
oted in a VM, etc. A disk image typically contains most or all of the compo=
nents necessary to boot, such as bootloaders, kernels, firmware, userspace,=
 etc.
-    diskImage =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpo=
se/diskImage"
-    # Element is documentation
-    documentation =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwareP=
urpose/documentation"
-    # the Element is the evidence that a specification or requirement has =
been fulfilled
-    evidence =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpos=
e/evidence"
-    # Element is an Artifact that can be run on a computer
-    executable =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurp=
ose/executable"
-    # the Element is a single file which can be independently distributed =
(configuration file, statically linked binary, Kubernetes deployment, etc)
-    file =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/fi=
le"
-    # the Element is a file system image that can be written to a disk (or=
 virtual) partition
-    filesystemImage =3D "https://spdx.org/rdf/3.0.0/terms/Software/Softwar=
ePurpose/filesystemImage"
-    # the Element provides low level control over a device's hardware
-    firmware =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpos=
e/firmware"
-    # the Element is a software framework
-    framework =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpo=
se/framework"
-    # the Element is used to install software on disk
-    install =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose=
/install"
-    # the Element is a software library
-    library =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose=
/library"
-    # the Element is a software manifest
-    manifest =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpos=
e/manifest"
-    # the Element is a machine learning or artificial intelligence model
-    model =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/m=
odel"
-    # the Element is a module of a piece of software
-    module =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/=
module"
-    # the Element is an operating system
-    operatingSystem =3D "https://spdx.org/rdf/3.0.0/terms/Software/Softwar=
ePurpose/operatingSystem"
-    # the Element doesn't fit into any of the other categories
-    other =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/o=
ther"
-    # Element contains a set of changes to update, fix, or improve another=
 Element
-    patch =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/p=
atch"
-    # Element represents a runtime environment
-    platform =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpos=
e/platform"
-    # the Element provides a requirement needed as input for another Eleme=
nt
-    requirement =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePur=
pose/requirement"
-    # the Element is a single or a collection of source files
-    source =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/=
source"
-    # the Element is a plan, guideline or strategy how to create, perform =
or analyse an application
-    specification =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwareP=
urpose/specification"
-    # The Element is a test used to verify functionality on an software el=
ement
-    test =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/te=
st"
+    # The Element is a software application.
+    application =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePur=
pose/application"
+    # The Element is an archived collection of one or more files (.tar, .z=
ip, etc.).
+    archive =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose=
/archive"
+    # The Element is a bill of materials.
+    bom =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/bom"
+    # The Element is configuration data.
+    configuration =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwareP=
urpose/configuration"
+    # The Element is a container image which can be used by a container ru=
ntime application.
+    container =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpo=
se/container"
+    # The Element is data.
+    data =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/da=
ta"
+    # The Element refers to a chipset, processor, or electronic board.
+    device =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/=
device"
+    # The Element represents software that controls hardware devices.
+    deviceDriver =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/deviceDriver"
+    # The Element refers to a disk image that can be written to a disk, bo=
oted in a VM, etc. A disk image typically contains most or all of the compo=
nents necessary to boot, such as bootloaders, kernels, firmware, userspace,=
 etc.
+    diskImage =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpo=
se/diskImage"
+    # The Element is documentation.
+    documentation =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwareP=
urpose/documentation"
+    # The Element is the evidence that a specification or requirement has =
been fulfilled.
+    evidence =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpos=
e/evidence"
+    # The Element is an Artifact that can be run on a computer.
+    executable =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurp=
ose/executable"
+    # The Element is a single file which can be independently distributed =
(configuration file, statically linked binary, Kubernetes deployment, etc.).
+    file =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/fi=
le"
+    # The Element is a file system image that can be written to a disk (or=
 virtual) partition.
+    filesystemImage =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softwar=
ePurpose/filesystemImage"
+    # The Element provides low level control over a device's hardware.
+    firmware =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpos=
e/firmware"
+    # The Element is a software framework.
+    framework =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpo=
se/framework"
+    # The Element is used to install software on disk.
+    install =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose=
/install"
+    # The Element is a software library.
+    library =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose=
/library"
+    # The Element is a software manifest.
+    manifest =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpos=
e/manifest"
+    # The Element is a machine learning or artificial intelligence model.
+    model =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/m=
odel"
+    # The Element is a module of a piece of software.
+    module =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/=
module"
+    # The Element is an operating system.
+    operatingSystem =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softwar=
ePurpose/operatingSystem"
+    # The Element doesn't fit into any of the other categories.
+    other =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/o=
ther"
+    # The Element contains a set of changes to update, fix, or improve ano=
ther Element.
+    patch =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/p=
atch"
+    # The Element represents a runtime environment.
+    platform =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpos=
e/platform"
+    # The Element provides a requirement needed as input for another Eleme=
nt.
+    requirement =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePur=
pose/requirement"
+    # The Element is a single or a collection of source files.
+    source =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/=
source"
+    # The Element is a plan, guideline or strategy how to create, perform =
or analyze an application.
+    specification =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwareP=
urpose/specification"
+    # The Element is a test used to verify functionality on an software el=
ement.
+    test =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/te=
st"
=20
=20
 # Class that describes a build instance of software/artifacts.
-@register("https://spdx.org/rdf/3.0.0/terms/Build/Build", compact_type=3D"=
build_Build", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Build/Build", compact_type=3D"=
build_Build", abstract=3DFalse)
 class build_Build(Element):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4480,7 +4019,7 @@ class build_Build(Element):
         cls._add_property(
             "build_buildEndTime",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/buildEndTime",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/buildEndTime",
             compact=3D"build_buildEndTime",
         )
         # A buildId is a locally unique identifier used by a builder to id=
entify a unique
@@ -4488,14 +4027,14 @@ class build_Build(Element):
         cls._add_property(
             "build_buildId",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/buildId",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/buildId",
             compact=3D"build_buildId",
         )
         # Property describing the start time of a build.
         cls._add_property(
             "build_buildStartTime",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/buildStartTime",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/buildStartTime",
             compact=3D"build_buildStartTime",
         )
         # A buildType is a hint that is used to indicate the toolchain, pl=
atform, or
@@ -4503,7 +4042,7 @@ class build_Build(Element):
         cls._add_property(
             "build_buildType",
             AnyURIProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/buildType",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/buildType",
             min_count=3D1,
             compact=3D"build_buildType",
         )
@@ -4512,52 +4051,52 @@ class build_Build(Element):
         cls._add_property(
             "build_configSourceDigest",
             ListProp(ObjectProp(Hash, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/configSourceDige=
st",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/configSourceDige=
st",
             compact=3D"build_configSourceDigest",
         )
         # Property describes the invocation entrypoint of a build.
         cls._add_property(
             "build_configSourceEntrypoint",
             ListProp(StringProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/configSourceEntr=
ypoint",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/configSourceEntr=
ypoint",
             compact=3D"build_configSourceEntrypoint",
         )
         # Property that describes the URI of the build configuration sourc=
e file.
         cls._add_property(
             "build_configSourceUri",
             ListProp(AnyURIProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/configSourceUri",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/configSourceUri",
             compact=3D"build_configSourceUri",
         )
         # Property describing the session in which a build is invoked.
         cls._add_property(
             "build_environment",
             ListProp(ObjectProp(DictionaryEntry, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/environment",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/environment",
             compact=3D"build_environment",
         )
-        # Property describing the parameters used in an instance of a buil=
d.
+        # Property describing a parameter used in an instance of a build.
         cls._add_property(
-            "build_parameters",
+            "build_parameter",
             ListProp(ObjectProp(DictionaryEntry, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/parameters",
-            compact=3D"build_parameters",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/parameter",
+            compact=3D"build_parameter",
         )
=20
=20
 # Agent represents anything with the potential to act on a system.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/Agent", compact_type=3D"A=
gent", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/Agent", compact_type=3D"A=
gent", abstract=3DFalse)
 class Agent(Element):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
=20
=20
 # An assertion made in relation to one or more elements.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/Annotation", compact_type=
=3D"Annotation", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/Annotation", compact_type=
=3D"Annotation", abstract=3DFalse)
 class Annotation(Element):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4569,41 +4108,47 @@ class Annotation(Element):
         cls._add_property(
             "annotationType",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType=
/other", "other"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType=
/review", "review"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/AnnotationType=
/other", "other"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/AnnotationType=
/review", "review"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/annotationType",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/annotationType",
             min_count=3D1,
             compact=3D"annotationType",
         )
-        # Specifies the media type of an Element or Property.
+        # Provides information about the content type of an Element or a P=
roperty.
         cls._add_property(
             "contentType",
             StringProp(pattern=3Dr"^[^\/]+\/[^\/]+$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/contentType",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/contentType",
             compact=3D"contentType",
         )
         # Commentary on an assertion that an annotator has made.
         cls._add_property(
             "statement",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/statement",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/statement",
             compact=3D"statement",
         )
         # An Element an annotator has made an assertion about.
         cls._add_property(
             "subject",
-            ObjectProp(Element, True),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/subject",
+            ObjectProp(Element, True, context=3D[
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement", =
"NoneElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganizati=
on", "SpdxOrganization"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionEle=
ment", "NoAssertionElement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oneLicense", "expandedlicensing_NoneLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                ],),
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/subject",
             min_count=3D1,
             compact=3D"subject",
         )
=20
=20
 # A distinct article or unit within the digital domain.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/Artifact", compact_type=
=3D"Artifact", abstract=3DTrue)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/Artifact", compact_type=
=3D"Artifact", abstract=3DTrue)
 class Artifact(Element):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4615,51 +4160,55 @@ class Artifact(Element):
         cls._add_property(
             "builtTime",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/builtTime",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/builtTime",
             compact=3D"builtTime",
         )
         # Identifies from where or whom the Element originally came.
         cls._add_property(
             "originatedBy",
-            ListProp(ObjectProp(Agent, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/originatedBy",
+            ListProp(ObjectProp(Agent, False, context=3D[
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganizati=
on", "SpdxOrganization"),
+                ],)),
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/originatedBy",
             compact=3D"originatedBy",
         )
         # Specifies the time an artifact was released.
         cls._add_property(
             "releaseTime",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/releaseTime",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/releaseTime",
             compact=3D"releaseTime",
         )
         # The name of a relevant standard that may apply to an artifact.
         cls._add_property(
             "standardName",
             ListProp(StringProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/standardName",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/standardName",
             compact=3D"standardName",
         )
         # Identifies who or what supplied the artifact or VulnAssessmentRe=
lationship
         # referenced by the Element.
         cls._add_property(
             "suppliedBy",
-            ObjectProp(Agent, False),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/suppliedBy",
+            ObjectProp(Agent, False, context=3D[
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganizati=
on", "SpdxOrganization"),
+                ],),
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/suppliedBy",
             compact=3D"suppliedBy",
         )
         # Specifies the level of support associated with an artifact.
         cls._add_property(
             "supportLevel",
             ListProp(EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/SupportType/de=
ployed", "deployed"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/SupportType/de=
velopment", "development"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/SupportType/en=
dOfSupport", "endOfSupport"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/SupportType/li=
mitedSupport", "limitedSupport"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/SupportType/no=
Assertion", "noAssertion"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/SupportType/no=
Support", "noSupport"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/SupportType/su=
pport", "support"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SupportType/de=
ployed", "deployed"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SupportType/de=
velopment", "development"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SupportType/en=
dOfSupport", "endOfSupport"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SupportType/li=
mitedSupport", "limitedSupport"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SupportType/no=
Assertion", "noAssertion"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SupportType/no=
Support", "noSupport"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/SupportType/su=
pport", "support"),
                 ])),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/supportLevel",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/supportLevel",
             compact=3D"supportLevel",
         )
         # Specifies until when the artifact can be used before its usage n=
eeds to be
@@ -4667,15 +4216,15 @@ class Artifact(Element):
         cls._add_property(
             "validUntilTime",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/validUntilTime",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/validUntilTime",
             compact=3D"validUntilTime",
         )
=20
=20
 # A collection of Elements that have a shared context.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/Bundle", compact_type=3D"=
Bundle", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/Bundle", compact_type=3D"=
Bundle", abstract=3DFalse)
 class Bundle(ElementCollection):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4688,15 +4237,15 @@ class Bundle(ElementCollection):
         cls._add_property(
             "context",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/context",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/context",
             compact=3D"context",
         )
=20
=20
 # A mathematically calculated representation of a grouping of data.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/Hash", compact_type=3D"Ha=
sh", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/Hash", compact_type=3D"Ha=
sh", abstract=3DFalse)
 class Hash(IntegrityMethod):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
@@ -4707,29 +4256,30 @@ class Hash(IntegrityMethod):
         cls._add_property(
             "algorithm",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake2b256", "blake2b256"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake2b384", "blake2b384"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake2b512", "blake2b512"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake3", "blake3"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
crystalsDilithium", "crystalsDilithium"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
crystalsKyber", "crystalsKyber"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
falcon", "falcon"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md2", "md2"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md4", "md4"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md5", "md5"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md6", "md6"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
other", "other"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha1", "sha1"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha224", "sha224"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha256", "sha256"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha384", "sha384"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_224", "sha3_224"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_256", "sha3_256"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_384", "sha3_384"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_512", "sha3_512"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha512", "sha512"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
adler32", "adler32"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
blake2b256", "blake2b256"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
blake2b384", "blake2b384"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
blake2b512", "blake2b512"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
blake3", "blake3"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
crystalsDilithium", "crystalsDilithium"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
crystalsKyber", "crystalsKyber"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
falcon", "falcon"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
md2", "md2"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
md4", "md4"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
md5", "md5"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
md6", "md6"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
other", "other"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha1", "sha1"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha224", "sha224"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha256", "sha256"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha384", "sha384"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha3_224", "sha3_224"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha3_256", "sha3_256"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha3_384", "sha3_384"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha3_512", "sha3_512"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha512", "sha512"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/algorithm",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/algorithm",
             min_count=3D1,
             compact=3D"algorithm",
         )
@@ -4737,16 +4287,16 @@ class Hash(IntegrityMethod):
         cls._add_property(
             "hashValue",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/hashValue",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/hashValue",
             min_count=3D1,
             compact=3D"hashValue",
         )
=20
=20
 # Provide context for a relationship that occurs in the lifecycle.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopedRelationsh=
ip", compact_type=3D"LifecycleScopedRelationship", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopedRelationsh=
ip", compact_type=3D"LifecycleScopedRelationship", abstract=3DFalse)
 class LifecycleScopedRelationship(Relationship):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4758,40 +4308,43 @@ class LifecycleScopedRelationship(Relationship):
         cls._add_property(
             "scope",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScope=
Type/build", "build"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScope=
Type/design", "design"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScope=
Type/development", "development"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScope=
Type/other", "other"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScope=
Type/runtime", "runtime"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScope=
Type/test", "test"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScope=
Type/build", "build"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScope=
Type/design", "design"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScope=
Type/development", "development"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScope=
Type/other", "other"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScope=
Type/runtime", "runtime"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScope=
Type/test", "test"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/scope",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/scope",
             compact=3D"scope",
         )
=20
=20
 # A group of people who work together in an organized way for a shared pur=
pose.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/Organization", compact_ty=
pe=3D"Organization", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/Organization", compact_ty=
pe=3D"Organization", abstract=3DFalse)
 class Organization(Agent):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
+        "SpdxOrganization": "https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrg=
anization",
     }
+    # An Organization representing the SPDX Project.
+    SpdxOrganization =3D "https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrgani=
zation"
=20
=20
 # An individual human being.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/Person", compact_type=3D"=
Person", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/Person", compact_type=3D"=
Person", abstract=3DFalse)
 class Person(Agent):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
=20
=20
 # A software agent.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/SoftwareAgent", compact_t=
ype=3D"SoftwareAgent", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/SoftwareAgent", compact_t=
ype=3D"SoftwareAgent", abstract=3DFalse)
 class SoftwareAgent(Agent):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4799,9 +4352,9 @@ class SoftwareAgent(Agent):
=20
 # Portion of an AnyLicenseInfo representing a set of licensing information
 # where all elements apply.
-@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/ConjunctiveL=
icenseSet", compact_type=3D"expandedlicensing_ConjunctiveLicenseSet", abstr=
act=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/ConjunctiveL=
icenseSet", compact_type=3D"expandedlicensing_ConjunctiveLicenseSet", abstr=
act=3DFalse)
 class expandedlicensing_ConjunctiveLicenseSet(simplelicensing_AnyLicenseIn=
fo):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4812,17 +4365,20 @@ class expandedlicensing_ConjunctiveLicenseSet(simpl=
elicensing_AnyLicenseInfo):
         # A license expression participating in a license set.
         cls._add_property(
             "expandedlicensing_member",
-            ListProp(ObjectProp(simplelicensing_AnyLicenseInfo, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/memb=
er",
+            ListProp(ObjectProp(simplelicensing_AnyLicenseInfo, False, con=
text=3D[
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oneLicense", "expandedlicensing_NoneLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                ],)),
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/memb=
er",
             min_count=3D2,
             compact=3D"expandedlicensing_member",
         )
=20
=20
 # A license addition that is not listed on the SPDX Exceptions List.
-@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/CustomLicens=
eAddition", compact_type=3D"expandedlicensing_CustomLicenseAddition", abstr=
act=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/CustomLicens=
eAddition", compact_type=3D"expandedlicensing_CustomLicenseAddition", abstr=
act=3DFalse)
 class expandedlicensing_CustomLicenseAddition(expandedlicensing_LicenseAdd=
ition):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4830,9 +4386,9 @@ class expandedlicensing_CustomLicenseAddition(expande=
dlicensing_LicenseAddition)
=20
 # Portion of an AnyLicenseInfo representing a set of licensing information=
 where
 # only one of the elements applies.
-@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/DisjunctiveL=
icenseSet", compact_type=3D"expandedlicensing_DisjunctiveLicenseSet", abstr=
act=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/DisjunctiveL=
icenseSet", compact_type=3D"expandedlicensing_DisjunctiveLicenseSet", abstr=
act=3DFalse)
 class expandedlicensing_DisjunctiveLicenseSet(simplelicensing_AnyLicenseIn=
fo):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4843,17 +4399,20 @@ class expandedlicensing_DisjunctiveLicenseSet(simpl=
elicensing_AnyLicenseInfo):
         # A license expression participating in a license set.
         cls._add_property(
             "expandedlicensing_member",
-            ListProp(ObjectProp(simplelicensing_AnyLicenseInfo, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/memb=
er",
+            ListProp(ObjectProp(simplelicensing_AnyLicenseInfo, False, con=
text=3D[
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oneLicense", "expandedlicensing_NoneLicense"),
+                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/N=
oAssertionLicense", "expandedlicensing_NoAssertionLicense"),
+                ],)),
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/memb=
er",
             min_count=3D2,
             compact=3D"expandedlicensing_member",
         )
=20
=20
 # Abstract class representing a License or an OrLaterOperator.
-@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/ExtendableLi=
cense", compact_type=3D"expandedlicensing_ExtendableLicense", abstract=3DTr=
ue)
+@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/ExtendableLi=
cense", compact_type=3D"expandedlicensing_ExtendableLicense", abstract=3DTr=
ue)
 class expandedlicensing_ExtendableLicense(simplelicensing_AnyLicenseInfo):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4861,26 +4420,26 @@ class expandedlicensing_ExtendableLicense(simplelic=
ensing_AnyLicenseInfo):
=20
 # A concrete subclass of AnyLicenseInfo used by Individuals in the
 # ExpandedLicensing profile.
-@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/IndividualLi=
censingInfo", compact_type=3D"expandedlicensing_IndividualLicensingInfo", a=
bstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/IndividualLi=
censingInfo", compact_type=3D"expandedlicensing_IndividualLicensingInfo", a=
bstract=3DFalse)
 class expandedlicensing_IndividualLicensingInfo(simplelicensing_AnyLicense=
Info):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
-        "NoAssertionLicense": "https://spdx.org/rdf/3.0.0/terms/ExpandedLi=
censing/NoAssertionLicense",
-        "NoneLicense": "https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing=
/NoneLicense",
+        "NoAssertionLicense": "https://spdx.org/rdf/3.0.1/terms/ExpandedLi=
censing/NoAssertionLicense",
+        "NoneLicense": "https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoneLicense",
     }
     # An Individual Value for License when no assertion can be made about =
its actual
     # value.
-    NoAssertionLicense =3D "https://spdx.org/rdf/3.0.0/terms/ExpandedLicen=
sing/NoAssertionLicense"
+    NoAssertionLicense =3D "https://spdx.org/rdf/3.0.1/terms/ExpandedLicen=
sing/NoAssertionLicense"
     # An Individual Value for License where the SPDX data creator determin=
es that no
     # license is present.
-    NoneLicense =3D "https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/No=
neLicense"
+    NoneLicense =3D "https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/No=
neLicense"
=20
=20
 # Abstract class for the portion of an AnyLicenseInfo representing a licen=
se.
-@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/License", co=
mpact_type=3D"expandedlicensing_License", abstract=3DTrue)
+@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/License", co=
mpact_type=3D"expandedlicensing_License", abstract=3DTrue)
 class expandedlicensing_License(expandedlicensing_ExtendableLicense):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4893,23 +4452,23 @@ class expandedlicensing_License(expandedlicensing_E=
xtendableLicense):
         cls._add_property(
             "expandedlicensing_isDeprecatedLicenseId",
             BooleanProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/isDe=
precatedLicenseId",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/isDe=
precatedLicenseId",
             compact=3D"expandedlicensing_isDeprecatedLicenseId",
         )
         # Specifies whether the License is listed as free by the
-        # [Free Software Foundation (FSF)](https://fsf.org).
+        # Free Software Foundation (FSF).
         cls._add_property(
             "expandedlicensing_isFsfLibre",
             BooleanProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/isFs=
fLibre",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/isFs=
fLibre",
             compact=3D"expandedlicensing_isFsfLibre",
         )
         # Specifies whether the License is listed as approved by the
-        # [Open Source Initiative (OSI)](https://opensource.org).
+        # Open Source Initiative (OSI).
         cls._add_property(
             "expandedlicensing_isOsiApproved",
             BooleanProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/isOs=
iApproved",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/isOs=
iApproved",
             compact=3D"expandedlicensing_isOsiApproved",
         )
         # Identifies all the text and metadata associated with a license i=
n the license
@@ -4917,7 +4476,7 @@ class expandedlicensing_License(expandedlicensing_Ext=
endableLicense):
         cls._add_property(
             "expandedlicensing_licenseXml",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/lice=
nseXml",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/lice=
nseXml",
             compact=3D"expandedlicensing_licenseXml",
         )
         # Specifies the licenseId that is preferred to be used in place of=
 a deprecated
@@ -4925,14 +4484,14 @@ class expandedlicensing_License(expandedlicensing_E=
xtendableLicense):
         cls._add_property(
             "expandedlicensing_obsoletedBy",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/obso=
letedBy",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/obso=
letedBy",
             compact=3D"expandedlicensing_obsoletedBy",
         )
         # Contains a URL where the License or LicenseAddition can be found=
 in use.
         cls._add_property(
             "expandedlicensing_seeAlso",
             ListProp(AnyURIProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/seeA=
lso",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/seeA=
lso",
             compact=3D"expandedlicensing_seeAlso",
         )
         # Provides a License author's preferred text to indicate that a fi=
le is covered
@@ -4940,30 +4499,30 @@ class expandedlicensing_License(expandedlicensing_E=
xtendableLicense):
         cls._add_property(
             "expandedlicensing_standardLicenseHeader",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/stan=
dardLicenseHeader",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/stan=
dardLicenseHeader",
             compact=3D"expandedlicensing_standardLicenseHeader",
         )
         # Identifies the full text of a License, in SPDX templating format.
         cls._add_property(
             "expandedlicensing_standardLicenseTemplate",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/stan=
dardLicenseTemplate",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/stan=
dardLicenseTemplate",
             compact=3D"expandedlicensing_standardLicenseTemplate",
         )
         # Identifies the full text of a License or Addition.
         cls._add_property(
             "simplelicensing_licenseText",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/licens=
eText",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/licens=
eText",
             min_count=3D1,
             compact=3D"simplelicensing_licenseText",
         )
=20
=20
 # A license that is listed on the SPDX License List.
-@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/ListedLicens=
e", compact_type=3D"expandedlicensing_ListedLicense", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/ListedLicens=
e", compact_type=3D"expandedlicensing_ListedLicense", abstract=3DFalse)
 class expandedlicensing_ListedLicense(expandedlicensing_License):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -4976,7 +4535,7 @@ class expandedlicensing_ListedLicense(expandedlicensi=
ng_License):
         cls._add_property(
             "expandedlicensing_deprecatedVersion",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/depr=
ecatedVersion",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/depr=
ecatedVersion",
             compact=3D"expandedlicensing_deprecatedVersion",
         )
         # Specifies the SPDX License List version in which this ListedLice=
nse or
@@ -4984,16 +4543,16 @@ class expandedlicensing_ListedLicense(expandedlicen=
sing_License):
         cls._add_property(
             "expandedlicensing_listVersionAdded",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/list=
VersionAdded",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/list=
VersionAdded",
             compact=3D"expandedlicensing_listVersionAdded",
         )
=20
=20
 # Portion of an AnyLicenseInfo representing this version, or any later ver=
sion,
 # of the indicated License.
-@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/OrLaterOpera=
tor", compact_type=3D"expandedlicensing_OrLaterOperator", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/OrLaterOpera=
tor", compact_type=3D"expandedlicensing_OrLaterOperator", abstract=3DFalse)
 class expandedlicensing_OrLaterOperator(expandedlicensing_ExtendableLicens=
e):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5005,7 +4564,7 @@ class expandedlicensing_OrLaterOperator(expandedlicen=
sing_ExtendableLicense):
         cls._add_property(
             "expandedlicensing_subjectLicense",
             ObjectProp(expandedlicensing_License, True),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/subj=
ectLicense",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/subj=
ectLicense",
             min_count=3D1,
             compact=3D"expandedlicensing_subjectLicense",
         )
@@ -5013,9 +4572,9 @@ class expandedlicensing_OrLaterOperator(expandedlicen=
sing_ExtendableLicense):
=20
 # Portion of an AnyLicenseInfo representing a License which has additional
 # text applied to it.
-@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/WithAddition=
Operator", compact_type=3D"expandedlicensing_WithAdditionOperator", abstrac=
t=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/WithAddition=
Operator", compact_type=3D"expandedlicensing_WithAdditionOperator", abstrac=
t=3DFalse)
 class expandedlicensing_WithAdditionOperator(simplelicensing_AnyLicenseInf=
o):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5027,7 +4586,7 @@ class expandedlicensing_WithAdditionOperator(simpleli=
censing_AnyLicenseInfo):
         cls._add_property(
             "expandedlicensing_subjectAddition",
             ObjectProp(expandedlicensing_LicenseAddition, True),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/subj=
ectAddition",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/subj=
ectAddition",
             min_count=3D1,
             compact=3D"expandedlicensing_subjectAddition",
         )
@@ -5035,16 +4594,16 @@ class expandedlicensing_WithAdditionOperator(simple=
licensing_AnyLicenseInfo):
         cls._add_property(
             "expandedlicensing_subjectExtendableLicense",
             ObjectProp(expandedlicensing_ExtendableLicense, True),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/subj=
ectExtendableLicense",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/subj=
ectExtendableLicense",
             min_count=3D1,
             compact=3D"expandedlicensing_subjectExtendableLicense",
         )
=20
=20
 # A type of extension consisting of a list of name value pairs.
-@register("https://spdx.org/rdf/3.0.0/terms/Extension/CdxPropertiesExtensi=
on", compact_type=3D"extension_CdxPropertiesExtension", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Extension/CdxPropertiesExtensi=
on", compact_type=3D"extension_CdxPropertiesExtension", abstract=3DFalse)
 class extension_CdxPropertiesExtension(extension_Extension):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.BlankNode
     NAMED_INDIVIDUALS =3D {
     }
=20
@@ -5055,16 +4614,16 @@ class extension_CdxPropertiesExtension(extension_Ex=
tension):
         cls._add_property(
             "extension_cdxProperty",
             ListProp(ObjectProp(extension_CdxPropertyEntry, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Extension/cdxProperty",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Extension/cdxProperty",
             min_count=3D1,
             compact=3D"extension_cdxProperty",
         )
=20
=20
 # Provides a CVSS version 2.0 assessment for a vulnerability.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/CvssV2VulnAssessmentR=
elationship", compact_type=3D"security_CvssV2VulnAssessmentRelationship", a=
bstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/CvssV2VulnAssessmentR=
elationship", compact_type=3D"security_CvssV2VulnAssessmentRelationship", a=
bstract=3DFalse)
 class security_CvssV2VulnAssessmentRelationship(security_VulnAssessmentRel=
ationship):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5076,7 +4635,7 @@ class security_CvssV2VulnAssessmentRelationship(secur=
ity_VulnAssessmentRelations
         cls._add_property(
             "security_score",
             FloatProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/score",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/score",
             min_count=3D1,
             compact=3D"security_score",
         )
@@ -5084,16 +4643,16 @@ class security_CvssV2VulnAssessmentRelationship(sec=
urity_VulnAssessmentRelations
         cls._add_property(
             "security_vectorString",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/vectorString",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/vectorString",
             min_count=3D1,
             compact=3D"security_vectorString",
         )
=20
=20
 # Provides a CVSS version 3 assessment for a vulnerability.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/CvssV3VulnAssessmentR=
elationship", compact_type=3D"security_CvssV3VulnAssessmentRelationship", a=
bstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/CvssV3VulnAssessmentR=
elationship", compact_type=3D"security_CvssV3VulnAssessmentRelationship", a=
bstract=3DFalse)
 class security_CvssV3VulnAssessmentRelationship(security_VulnAssessmentRel=
ationship):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5105,7 +4664,7 @@ class security_CvssV3VulnAssessmentRelationship(secur=
ity_VulnAssessmentRelations
         cls._add_property(
             "security_score",
             FloatProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/score",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/score",
             min_count=3D1,
             compact=3D"security_score",
         )
@@ -5113,13 +4672,13 @@ class security_CvssV3VulnAssessmentRelationship(sec=
urity_VulnAssessmentRelations
         cls._add_property(
             "security_severity",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/critical", "critical"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/high", "high"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/low", "low"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/medium", "medium"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/none", "none"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeveri=
tyType/critical", "critical"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeveri=
tyType/high", "high"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeveri=
tyType/low", "low"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeveri=
tyType/medium", "medium"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeveri=
tyType/none", "none"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/severity",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/severity",
             min_count=3D1,
             compact=3D"security_severity",
         )
@@ -5127,16 +4686,16 @@ class security_CvssV3VulnAssessmentRelationship(sec=
urity_VulnAssessmentRelations
         cls._add_property(
             "security_vectorString",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/vectorString",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/vectorString",
             min_count=3D1,
             compact=3D"security_vectorString",
         )
=20
=20
 # Provides a CVSS version 4 assessment for a vulnerability.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/CvssV4VulnAssessmentR=
elationship", compact_type=3D"security_CvssV4VulnAssessmentRelationship", a=
bstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/CvssV4VulnAssessmentR=
elationship", compact_type=3D"security_CvssV4VulnAssessmentRelationship", a=
bstract=3DFalse)
 class security_CvssV4VulnAssessmentRelationship(security_VulnAssessmentRel=
ationship):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5148,7 +4707,7 @@ class security_CvssV4VulnAssessmentRelationship(secur=
ity_VulnAssessmentRelations
         cls._add_property(
             "security_score",
             FloatProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/score",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/score",
             min_count=3D1,
             compact=3D"security_score",
         )
@@ -5156,13 +4715,13 @@ class security_CvssV4VulnAssessmentRelationship(sec=
urity_VulnAssessmentRelations
         cls._add_property(
             "security_severity",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/critical", "critical"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/high", "high"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/low", "low"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/medium", "medium"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/none", "none"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeveri=
tyType/critical", "critical"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeveri=
tyType/high", "high"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeveri=
tyType/low", "low"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeveri=
tyType/medium", "medium"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeveri=
tyType/none", "none"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/severity",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/severity",
             min_count=3D1,
             compact=3D"security_severity",
         )
@@ -5170,16 +4729,16 @@ class security_CvssV4VulnAssessmentRelationship(sec=
urity_VulnAssessmentRelations
         cls._add_property(
             "security_vectorString",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/vectorString",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/vectorString",
             min_count=3D1,
             compact=3D"security_vectorString",
         )
=20
=20
 # Provides an EPSS assessment for a vulnerability.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/EpssVulnAssessmentRel=
ationship", compact_type=3D"security_EpssVulnAssessmentRelationship", abstr=
act=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/EpssVulnAssessmentRel=
ationship", compact_type=3D"security_EpssVulnAssessmentRelationship", abstr=
act=3DFalse)
 class security_EpssVulnAssessmentRelationship(security_VulnAssessmentRelat=
ionship):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5191,7 +4750,7 @@ class security_EpssVulnAssessmentRelationship(securit=
y_VulnAssessmentRelationshi
         cls._add_property(
             "security_percentile",
             FloatProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/percentile",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/percentile",
             min_count=3D1,
             compact=3D"security_percentile",
         )
@@ -5199,24 +4758,16 @@ class security_EpssVulnAssessmentRelationship(secur=
ity_VulnAssessmentRelationshi
         cls._add_property(
             "security_probability",
             FloatProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/probability",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/probability",
             min_count=3D1,
             compact=3D"security_probability",
         )
-        # Specifies the time when a vulnerability was published.
-        cls._add_property(
-            "security_publishedTime",
-            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/publishedTime=
",
-            min_count=3D1,
-            compact=3D"security_publishedTime",
-        )
=20
=20
 # Provides an exploit assessment of a vulnerability.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalogVulnAss=
essmentRelationship", compact_type=3D"security_ExploitCatalogVulnAssessment=
Relationship", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/ExploitCatalogVulnAss=
essmentRelationship", compact_type=3D"security_ExploitCatalogVulnAssessment=
Relationship", abstract=3DFalse)
 class security_ExploitCatalogVulnAssessmentRelationship(security_VulnAsses=
smentRelationship):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5228,10 +4779,10 @@ class security_ExploitCatalogVulnAssessmentRelation=
ship(security_VulnAssessmentR
         cls._add_property(
             "security_catalogType",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/ExploitCat=
alogType/kev", "kev"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/ExploitCat=
alogType/other", "other"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/ExploitCat=
alogType/kev", "kev"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/ExploitCat=
alogType/other", "other"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/catalogType",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/catalogType",
             min_count=3D1,
             compact=3D"security_catalogType",
         )
@@ -5239,7 +4790,7 @@ class security_ExploitCatalogVulnAssessmentRelationsh=
ip(security_VulnAssessmentR
         cls._add_property(
             "security_exploited",
             BooleanProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/exploited",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/exploited",
             min_count=3D1,
             compact=3D"security_exploited",
         )
@@ -5247,16 +4798,16 @@ class security_ExploitCatalogVulnAssessmentRelation=
ship(security_VulnAssessmentR
         cls._add_property(
             "security_locator",
             AnyURIProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/locator",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/locator",
             min_count=3D1,
             compact=3D"security_locator",
         )
=20
=20
 # Provides an SSVC assessment for a vulnerability.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/SsvcVulnAssessmentRel=
ationship", compact_type=3D"security_SsvcVulnAssessmentRelationship", abstr=
act=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/SsvcVulnAssessmentRel=
ationship", compact_type=3D"security_SsvcVulnAssessmentRelationship", abstr=
act=3DFalse)
 class security_SsvcVulnAssessmentRelationship(security_VulnAssessmentRelat=
ionship):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5264,25 +4815,26 @@ class security_SsvcVulnAssessmentRelationship(secur=
ity_VulnAssessmentRelationshi
     @classmethod
     def _register_props(cls):
         super()._register_props()
-        # Provide the enumeration of possible decisions in the Stakeholder=
-Specific Vulnerability Categorization (SSVC) decision tree [https://www.ci=
sa.gov/sites/default/files/publications/cisa-ssvc-guide%20508c.pdf](https:/=
/www.cisa.gov/sites/default/files/publications/cisa-ssvc-guide%20508c.pdf)
+        # Provide the enumeration of possible decisions in the
+        # [Stakeholder-Specific Vulnerability Categorization (SSVC) decisi=
on tree](https://www.cisa.gov/stakeholder-specific-vulnerability-categoriza=
tion-ssvc).
         cls._add_property(
             "security_decisionType",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisi=
onType/act", "act"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisi=
onType/attend", "attend"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisi=
onType/track", "track"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisi=
onType/trackStar", "trackStar"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisi=
onType/act", "act"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisi=
onType/attend", "attend"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisi=
onType/track", "track"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisi=
onType/trackStar", "trackStar"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/decisionType",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/decisionType",
             min_count=3D1,
             compact=3D"security_decisionType",
         )
=20
=20
 # Asbtract ancestor class for all VEX relationships
-@register("https://spdx.org/rdf/3.0.0/terms/Security/VexVulnAssessmentRela=
tionship", compact_type=3D"security_VexVulnAssessmentRelationship", abstrac=
t=3DTrue)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/VexVulnAssessmentRela=
tionship", compact_type=3D"security_VexVulnAssessmentRelationship", abstrac=
t=3DTrue)
 class security_VexVulnAssessmentRelationship(security_VulnAssessmentRelati=
onship):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5294,22 +4846,22 @@ class security_VexVulnAssessmentRelationship(securi=
ty_VulnAssessmentRelationship
         cls._add_property(
             "security_statusNotes",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/statusNotes",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/statusNotes",
             compact=3D"security_statusNotes",
         )
         # Specifies the version of a VEX statement.
         cls._add_property(
             "security_vexVersion",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/vexVersion",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/vexVersion",
             compact=3D"security_vexVersion",
         )
=20
=20
 # Specifies a vulnerability and its associated information.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/Vulnerability", compa=
ct_type=3D"security_Vulnerability", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/Vulnerability", compa=
ct_type=3D"security_Vulnerability", abstract=3DFalse)
 class security_Vulnerability(Artifact):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5321,29 +4873,29 @@ class security_Vulnerability(Artifact):
         cls._add_property(
             "security_modifiedTime",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/modifiedTime",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/modifiedTime",
             compact=3D"security_modifiedTime",
         )
         # Specifies the time when a vulnerability was published.
         cls._add_property(
             "security_publishedTime",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/publishedTime=
",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/publishedTime=
",
             compact=3D"security_publishedTime",
         )
         # Specified the time and date when a vulnerability was withdrawn.
         cls._add_property(
             "security_withdrawnTime",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/withdrawnTime=
",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/withdrawnTime=
",
             compact=3D"security_withdrawnTime",
         )
=20
=20
 # A distinct article or unit related to Software.
-@register("https://spdx.org/rdf/3.0.0/terms/Software/SoftwareArtifact", co=
mpact_type=3D"software_SoftwareArtifact", abstract=3DTrue)
+@register("https://spdx.org/rdf/3.0.1/terms/Software/SoftwareArtifact", co=
mpact_type=3D"software_SoftwareArtifact", abstract=3DTrue)
 class software_SoftwareArtifact(Artifact):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5355,37 +4907,37 @@ class software_SoftwareArtifact(Artifact):
         cls._add_property(
             "software_additionalPurpose",
             ListProp(EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/application", "application"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/archive", "archive"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/bom", "bom"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/configuration", "configuration"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/container", "container"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/data", "data"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/device", "device"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/deviceDriver", "deviceDriver"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/diskImage", "diskImage"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/documentation", "documentation"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/evidence", "evidence"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/executable", "executable"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/file", "file"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/filesystemImage", "filesystemImage"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/firmware", "firmware"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/framework", "framework"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/install", "install"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/library", "library"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/manifest", "manifest"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/model", "model"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/module", "module"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/operatingSystem", "operatingSystem"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/other", "other"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/patch", "patch"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/platform", "platform"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/requirement", "requirement"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/source", "source"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/specification", "specification"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/test", "test"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/application", "application"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/archive", "archive"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/bom", "bom"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/configuration", "configuration"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/container", "container"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/data", "data"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/device", "device"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/deviceDriver", "deviceDriver"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/diskImage", "diskImage"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/documentation", "documentation"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/evidence", "evidence"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/executable", "executable"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/file", "file"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/filesystemImage", "filesystemImage"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/firmware", "firmware"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/framework", "framework"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/install", "install"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/library", "library"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/manifest", "manifest"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/model", "model"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/module", "module"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/operatingSystem", "operatingSystem"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/other", "other"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/patch", "patch"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/platform", "platform"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/requirement", "requirement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/source", "source"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/specification", "specification"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/test", "test"),
                 ])),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/additionalPur=
pose",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/additionalPur=
pose",
             compact=3D"software_additionalPurpose",
         )
         # Provides a place for the SPDX data creator to record acknowledge=
ment text for
@@ -5393,7 +4945,7 @@ class software_SoftwareArtifact(Artifact):
         cls._add_property(
             "software_attributionText",
             ListProp(StringProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/attributionTe=
xt",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/attributionTe=
xt",
             compact=3D"software_attributionText",
         )
         # A canonical, unique, immutable identifier of the artifact conten=
t, that may be
@@ -5401,7 +4953,7 @@ class software_SoftwareArtifact(Artifact):
         cls._add_property(
             "software_contentIdentifier",
             ListProp(ObjectProp(software_ContentIdentifier, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/contentIdenti=
fier",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/contentIdenti=
fier",
             compact=3D"software_contentIdentifier",
         )
         # Identifies the text of one or more copyright notices for a softw=
are Package,
@@ -5409,62 +4961,62 @@ class software_SoftwareArtifact(Artifact):
         cls._add_property(
             "software_copyrightText",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/copyrightText=
",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/copyrightText=
",
             compact=3D"software_copyrightText",
         )
         # Provides information about the primary purpose of the software a=
rtifact.
         cls._add_property(
             "software_primaryPurpose",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/application", "application"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/archive", "archive"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/bom", "bom"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/configuration", "configuration"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/container", "container"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/data", "data"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/device", "device"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/deviceDriver", "deviceDriver"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/diskImage", "diskImage"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/documentation", "documentation"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/evidence", "evidence"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/executable", "executable"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/file", "file"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/filesystemImage", "filesystemImage"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/firmware", "firmware"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/framework", "framework"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/install", "install"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/library", "library"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/manifest", "manifest"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/model", "model"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/module", "module"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/operatingSystem", "operatingSystem"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/other", "other"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/patch", "patch"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/platform", "platform"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/requirement", "requirement"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/source", "source"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/specification", "specification"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/test", "test"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/application", "application"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/archive", "archive"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/bom", "bom"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/configuration", "configuration"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/container", "container"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/data", "data"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/device", "device"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/deviceDriver", "deviceDriver"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/diskImage", "diskImage"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/documentation", "documentation"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/evidence", "evidence"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/executable", "executable"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/file", "file"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/filesystemImage", "filesystemImage"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/firmware", "firmware"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/framework", "framework"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/install", "install"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/library", "library"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/manifest", "manifest"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/model", "model"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/module", "module"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/operatingSystem", "operatingSystem"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/other", "other"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/patch", "patch"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/platform", "platform"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/requirement", "requirement"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/source", "source"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/specification", "specification"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/test", "test"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/primaryPurpos=
e",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/primaryPurpos=
e",
             compact=3D"software_primaryPurpose",
         )
=20
=20
 # A container for a grouping of SPDX-3.0 content characterizing details
 # (provenence, composition, licensing, etc.) about a product.
-@register("https://spdx.org/rdf/3.0.0/terms/Core/Bom", compact_type=3D"Bom=
", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Core/Bom", compact_type=3D"Bom=
", abstract=3DFalse)
 class Bom(Bundle):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
=20
=20
 # A license that is not listed on the SPDX License List.
-@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/CustomLicens=
e", compact_type=3D"expandedlicensing_CustomLicense", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/CustomLicens=
e", compact_type=3D"expandedlicensing_CustomLicense", abstract=3DFalse)
 class expandedlicensing_CustomLicense(expandedlicensing_License):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5472,9 +5024,9 @@ class expandedlicensing_CustomLicense(expandedlicensi=
ng_License):
=20
 # Connects a vulnerability and an element designating the element as a pro=
duct
 # affected by the vulnerability.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/VexAffectedVulnAssess=
mentRelationship", compact_type=3D"security_VexAffectedVulnAssessmentRelati=
onship", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/VexAffectedVulnAssess=
mentRelationship", compact_type=3D"security_VexAffectedVulnAssessmentRelati=
onship", abstract=3DFalse)
 class security_VexAffectedVulnAssessmentRelationship(security_VexVulnAsses=
smentRelationship):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5487,7 +5039,7 @@ class security_VexAffectedVulnAssessmentRelationship(=
security_VexVulnAssessmentR
         cls._add_property(
             "security_actionStatement",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/actionStateme=
nt",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/actionStateme=
nt",
             compact=3D"security_actionStatement",
         )
         # Records the time when a recommended action was communicated in a=
 VEX statement
@@ -5495,16 +5047,16 @@ class security_VexAffectedVulnAssessmentRelationshi=
p(security_VexVulnAssessmentR
         cls._add_property(
             "security_actionStatementTime",
             ListProp(DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\=
d:\d\d:\d\dZ$",)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/actionStateme=
ntTime",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/actionStateme=
ntTime",
             compact=3D"security_actionStatementTime",
         )
=20
=20
 # Links a vulnerability and elements representing products (in the VEX sen=
se) where
 # a fix has been applied and are no longer affected.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/VexFixedVulnAssessmen=
tRelationship", compact_type=3D"security_VexFixedVulnAssessmentRelationship=
", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/VexFixedVulnAssessmen=
tRelationship", compact_type=3D"security_VexFixedVulnAssessmentRelationship=
", abstract=3DFalse)
 class security_VexFixedVulnAssessmentRelationship(security_VexVulnAssessme=
ntRelationship):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5512,9 +5064,9 @@ class security_VexFixedVulnAssessmentRelationship(sec=
urity_VexVulnAssessmentRela
=20
 # Links a vulnerability and one or more elements designating the latter as=
 products
 # not affected by the vulnerability.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/VexNotAffectedVulnAss=
essmentRelationship", compact_type=3D"security_VexNotAffectedVulnAssessment=
Relationship", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/VexNotAffectedVulnAss=
essmentRelationship", compact_type=3D"security_VexNotAffectedVulnAssessment=
Relationship", abstract=3DFalse)
 class security_VexNotAffectedVulnAssessmentRelationship(security_VexVulnAs=
sessmentRelationship):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5528,14 +5080,14 @@ class security_VexNotAffectedVulnAssessmentRelation=
ship(security_VexVulnAssessme
         cls._add_property(
             "security_impactStatement",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/impactStateme=
nt",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/impactStateme=
nt",
             compact=3D"security_impactStatement",
         )
         # Timestamp of impact statement.
         cls._add_property(
             "security_impactStatementTime",
             DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/impactStateme=
ntTime",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/impactStateme=
ntTime",
             compact=3D"security_impactStatementTime",
         )
         # Impact justification label to be used when linking a vulnerabili=
ty to an element
@@ -5544,31 +5096,31 @@ class security_VexNotAffectedVulnAssessmentRelation=
ship(security_VexVulnAssessme
         cls._add_property(
             "security_justificationType",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/VexJustifi=
cationType/componentNotPresent", "componentNotPresent"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/VexJustifi=
cationType/inlineMitigationsAlreadyExist", "inlineMitigationsAlreadyExist"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/VexJustifi=
cationType/vulnerableCodeCannotBeControlledByAdversary", "vulnerableCodeCan=
notBeControlledByAdversary"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/VexJustifi=
cationType/vulnerableCodeNotInExecutePath", "vulnerableCodeNotInExecutePath=
"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Security/VexJustifi=
cationType/vulnerableCodeNotPresent", "vulnerableCodeNotPresent"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/VexJustifi=
cationType/componentNotPresent", "componentNotPresent"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/VexJustifi=
cationType/inlineMitigationsAlreadyExist", "inlineMitigationsAlreadyExist"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/VexJustifi=
cationType/vulnerableCodeCannotBeControlledByAdversary", "vulnerableCodeCan=
notBeControlledByAdversary"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/VexJustifi=
cationType/vulnerableCodeNotInExecutePath", "vulnerableCodeNotInExecutePath=
"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Security/VexJustifi=
cationType/vulnerableCodeNotPresent", "vulnerableCodeNotPresent"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/justification=
Type",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/justification=
Type",
             compact=3D"security_justificationType",
         )
=20
=20
 # Designates elements as products where the impact of a vulnerability is b=
eing
 # investigated.
-@register("https://spdx.org/rdf/3.0.0/terms/Security/VexUnderInvestigation=
VulnAssessmentRelationship", compact_type=3D"security_VexUnderInvestigation=
VulnAssessmentRelationship", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Security/VexUnderInvestigation=
VulnAssessmentRelationship", compact_type=3D"security_VexUnderInvestigation=
VulnAssessmentRelationship", abstract=3DFalse)
 class security_VexUnderInvestigationVulnAssessmentRelationship(security_Ve=
xVulnAssessmentRelationship):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
=20
=20
 # Refers to any object that stores content on a computer.
-@register("https://spdx.org/rdf/3.0.0/terms/Software/File", compact_type=
=3D"software_File", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Software/File", compact_type=
=3D"software_File", abstract=3DFalse)
 class software_File(software_SoftwareArtifact):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5576,30 +5128,30 @@ class software_File(software_SoftwareArtifact):
     @classmethod
     def _register_props(cls):
         super()._register_props()
-        # Provides information about the content type of an Element.
+        # Provides information about the content type of an Element or a P=
roperty.
         cls._add_property(
-            "software_contentType",
+            "contentType",
             StringProp(pattern=3Dr"^[^\/]+\/[^\/]+$",),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/contentType",
-            compact=3D"software_contentType",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/contentType",
+            compact=3D"contentType",
         )
         # Describes if a given file is a directory or non-directory kind o=
f file.
         cls._add_property(
             "software_fileKind",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/FileKindTy=
pe/directory", "directory"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/FileKindTy=
pe/file", "file"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/FileKindTy=
pe/directory", "directory"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/FileKindTy=
pe/file", "file"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/fileKind",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/fileKind",
             compact=3D"software_fileKind",
         )
=20
=20
 # Refers to any unit of content that can be associated with a distribution=
 of
 # software.
-@register("https://spdx.org/rdf/3.0.0/terms/Software/Package", compact_typ=
e=3D"software_Package", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Software/Package", compact_typ=
e=3D"software_Package", abstract=3DFalse)
 class software_Package(software_SoftwareArtifact):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5612,7 +5164,7 @@ class software_Package(software_SoftwareArtifact):
         cls._add_property(
             "software_downloadLocation",
             AnyURIProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/downloadLocat=
ion",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/downloadLocat=
ion",
             compact=3D"software_downloadLocation",
         )
         # A place for the SPDX document creator to record a website that s=
erves as the
@@ -5620,24 +5172,22 @@ class software_Package(software_SoftwareArtifact):
         cls._add_property(
             "software_homePage",
             AnyURIProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/homePage",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/homePage",
             compact=3D"software_homePage",
         )
         # Provides a place for the SPDX data creator to record the package=
 URL string
-        # (in accordance with the
-        # [package URL spec](https://github.com/package-url/purl-spec/blob=
/master/PURL-SPECIFICATION.rst))
-        # for a software Package.
+        # (in accordance with the Package URL specification) for a softwar=
e Package.
         cls._add_property(
             "software_packageUrl",
             AnyURIProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/packageUrl",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/packageUrl",
             compact=3D"software_packageUrl",
         )
         # Identify the version of a package.
         cls._add_property(
             "software_packageVersion",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/packageVersio=
n",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/packageVersio=
n",
             compact=3D"software_packageVersion",
         )
         # Records any relevant background information or additional commen=
ts
@@ -5645,15 +5195,15 @@ class software_Package(software_SoftwareArtifact):
         cls._add_property(
             "software_sourceInfo",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/sourceInfo",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/sourceInfo",
             compact=3D"software_sourceInfo",
         )
=20
=20
 # A collection of SPDX Elements describing a single package.
-@register("https://spdx.org/rdf/3.0.0/terms/Software/Sbom", compact_type=
=3D"software_Sbom", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Software/Sbom", compact_type=
=3D"software_Sbom", abstract=3DFalse)
 class software_Sbom(Bom):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5665,22 +5215,22 @@ class software_Sbom(Bom):
         cls._add_property(
             "software_sbomType",
             ListProp(EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SbomType/a=
nalyzed", "analyzed"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SbomType/b=
uild", "build"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SbomType/d=
eployed", "deployed"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SbomType/d=
esign", "design"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SbomType/r=
untime", "runtime"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Software/SbomType/s=
ource", "source"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SbomType/a=
nalyzed", "analyzed"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SbomType/b=
uild", "build"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SbomType/d=
eployed", "deployed"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SbomType/d=
esign", "design"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SbomType/r=
untime", "runtime"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Software/SbomType/s=
ource", "source"),
                 ])),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/sbomType",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/sbomType",
             compact=3D"software_sbomType",
         )
=20
=20
 # Describes a certain part of a file.
-@register("https://spdx.org/rdf/3.0.0/terms/Software/Snippet", compact_typ=
e=3D"software_Snippet", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Software/Snippet", compact_typ=
e=3D"software_Snippet", abstract=3DFalse)
 class software_Snippet(software_SoftwareArtifact):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5693,7 +5243,7 @@ class software_Snippet(software_SoftwareArtifact):
         cls._add_property(
             "software_byteRange",
             ObjectProp(PositiveIntegerRange, False),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/byteRange",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/byteRange",
             compact=3D"software_byteRange",
         )
         # Defines the line range in the original host file that the snippe=
t information
@@ -5701,23 +5251,23 @@ class software_Snippet(software_SoftwareArtifact):
         cls._add_property(
             "software_lineRange",
             ObjectProp(PositiveIntegerRange, False),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/lineRange",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/lineRange",
             compact=3D"software_lineRange",
         )
         # Defines the original host file that the snippet information appl=
ies to.
         cls._add_property(
             "software_snippetFromFile",
             ObjectProp(software_File, True),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/snippetFromFi=
le",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/snippetFromFi=
le",
             min_count=3D1,
             compact=3D"software_snippetFromFile",
         )
=20
=20
 # Specifies an AI package and its associated information.
-@register("https://spdx.org/rdf/3.0.0/terms/AI/AIPackage", compact_type=3D=
"ai_AIPackage", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/AI/AIPackage", compact_type=3D=
"ai_AIPackage", abstract=3DFalse)
 class ai_AIPackage(software_Package):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5725,29 +5275,30 @@ class ai_AIPackage(software_Package):
     @classmethod
     def _register_props(cls):
         super()._register_props()
-        # States if a human is involved in the decisions of the AI softwar=
e.
+        # Indicates whether the system can perform a decision or action wi=
thout human
+        # involvement or guidance.
         cls._add_property(
             "ai_autonomyType",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/n=
o", "no"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/n=
oAssertion", "noAssertion"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/y=
es", "yes"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/n=
o", "no"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/n=
oAssertion", "noAssertion"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/y=
es", "yes"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/autonomyType",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/autonomyType",
             compact=3D"ai_autonomyType",
         )
         # Captures the domain in which the AI package can be used.
         cls._add_property(
             "ai_domain",
             ListProp(StringProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/domain",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/domain",
             compact=3D"ai_domain",
         )
-        # Indicates the amount of energy consumed to train the AI model.
+        # Indicates the amount of energy consumption incurred by an AI mod=
el.
         cls._add_property(
             "ai_energyConsumption",
             ObjectProp(ai_EnergyConsumption, False),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/energyConsumption",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/energyConsumption",
             compact=3D"ai_energyConsumption",
         )
         # Records a hyperparameter used to build the AI model contained in=
 the AI
@@ -5755,7 +5306,7 @@ class ai_AIPackage(software_Package):
         cls._add_property(
             "ai_hyperparameter",
             ListProp(ObjectProp(DictionaryEntry, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/hyperparameter",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/hyperparameter",
             compact=3D"ai_hyperparameter",
         )
         # Provides relevant information about the AI software, not includi=
ng the model
@@ -5763,28 +5314,28 @@ class ai_AIPackage(software_Package):
         cls._add_property(
             "ai_informationAboutApplication",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/informationAboutApp=
lication",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/informationAboutApp=
lication",
             compact=3D"ai_informationAboutApplication",
         )
         # Describes relevant information about different steps of the trai=
ning process.
         cls._add_property(
             "ai_informationAboutTraining",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/informationAboutTra=
ining",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/informationAboutTra=
ining",
             compact=3D"ai_informationAboutTraining",
         )
         # Captures a limitation of the AI software.
         cls._add_property(
             "ai_limitation",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/limitation",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/limitation",
             compact=3D"ai_limitation",
         )
         # Records the measurement of prediction quality of the AI model.
         cls._add_property(
             "ai_metric",
             ListProp(ObjectProp(DictionaryEntry, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/metric",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/metric",
             compact=3D"ai_metric",
         )
         # Captures the threshold that was used for computation of a metric=
 described in
@@ -5792,7 +5343,7 @@ class ai_AIPackage(software_Package):
         cls._add_property(
             "ai_metricDecisionThreshold",
             ListProp(ObjectProp(DictionaryEntry, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/metricDecisionThres=
hold",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/metricDecisionThres=
hold",
             compact=3D"ai_metricDecisionThreshold",
         )
         # Describes all the preprocessing steps applied to the training da=
ta before the
@@ -5800,40 +5351,40 @@ class ai_AIPackage(software_Package):
         cls._add_property(
             "ai_modelDataPreprocessing",
             ListProp(StringProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/modelDataPreprocess=
ing",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/modelDataPreprocess=
ing",
             compact=3D"ai_modelDataPreprocessing",
         )
-        # Describes methods that can be used to explain the model.
+        # Describes methods that can be used to explain the results from t=
he AI model.
         cls._add_property(
             "ai_modelExplainability",
             ListProp(StringProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/modelExplainability=
",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/modelExplainability=
",
             compact=3D"ai_modelExplainability",
         )
         # Records the results of general safety risk assessment of the AI =
system.
         cls._add_property(
             "ai_safetyRiskAssessment",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssess=
mentType/high", "high"),
-                    ("https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssess=
mentType/low", "low"),
-                    ("https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssess=
mentType/medium", "medium"),
-                    ("https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssess=
mentType/serious", "serious"),
+                    ("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssess=
mentType/high", "high"),
+                    ("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssess=
mentType/low", "low"),
+                    ("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssess=
mentType/medium", "medium"),
+                    ("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssess=
mentType/serious", "serious"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/safetyRiskAssessmen=
t",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/safetyRiskAssessmen=
t",
             compact=3D"ai_safetyRiskAssessment",
         )
         # Captures a standard that is being complied with.
         cls._add_property(
             "ai_standardCompliance",
             ListProp(StringProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/standardCompliance",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/standardCompliance",
             compact=3D"ai_standardCompliance",
         )
         # Records the type of the model used in the AI software.
         cls._add_property(
             "ai_typeOfModel",
             ListProp(StringProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/typeOfModel",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/typeOfModel",
             compact=3D"ai_typeOfModel",
         )
         # Records if sensitive personal information is used during model t=
raining or
@@ -5841,19 +5392,19 @@ class ai_AIPackage(software_Package):
         cls._add_property(
             "ai_useSensitivePersonalInformation",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/n=
o", "no"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/n=
oAssertion", "noAssertion"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/y=
es", "yes"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/n=
o", "no"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/n=
oAssertion", "noAssertion"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/y=
es", "yes"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/useSensitivePersona=
lInformation",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/useSensitivePersona=
lInformation",
             compact=3D"ai_useSensitivePersonalInformation",
         )
=20
=20
 # Specifies a data package and its associated information.
-@register("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetPackage", compa=
ct_type=3D"dataset_DatasetPackage", abstract=3DFalse)
+@register("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetPackage", compa=
ct_type=3D"dataset_DatasetPackage", abstract=3DFalse)
 class dataset_DatasetPackage(software_Package):
-    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NODE_KIND =3D NodeKind.IRI
     ID_ALIAS =3D "spdxId"
     NAMED_INDIVIDUALS =3D {
     }
@@ -5865,82 +5416,82 @@ class dataset_DatasetPackage(software_Package):
         cls._add_property(
             "dataset_anonymizationMethodUsed",
             ListProp(StringProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/anonymizationM=
ethodUsed",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/anonymizationM=
ethodUsed",
             compact=3D"dataset_anonymizationMethodUsed",
         )
         # Describes the confidentiality level of the data points contained=
 in the dataset.
         cls._add_property(
             "dataset_confidentialityLevel",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/Confidentia=
lityLevelType/amber", "amber"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/Confidentia=
lityLevelType/clear", "clear"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/Confidentia=
lityLevelType/green", "green"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/Confidentia=
lityLevelType/red", "red"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Confidentia=
lityLevelType/amber", "amber"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Confidentia=
lityLevelType/clear", "clear"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Confidentia=
lityLevelType/green", "green"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Confidentia=
lityLevelType/red", "red"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/confidentialit=
yLevel",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/confidentialit=
yLevel",
             compact=3D"dataset_confidentialityLevel",
         )
         # Describes how the dataset was collected.
         cls._add_property(
             "dataset_dataCollectionProcess",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/dataCollection=
Process",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/dataCollection=
Process",
             compact=3D"dataset_dataCollectionProcess",
         )
         # Describes the preprocessing steps that were applied to the raw d=
ata to create the given dataset.
         cls._add_property(
             "dataset_dataPreprocessing",
             ListProp(StringProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/dataPreprocess=
ing",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/dataPreprocess=
ing",
             compact=3D"dataset_dataPreprocessing",
         )
         # The field describes the availability of a dataset.
         cls._add_property(
             "dataset_datasetAvailability",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvai=
labilityType/clickthrough", "clickthrough"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvai=
labilityType/directDownload", "directDownload"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvai=
labilityType/query", "query"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvai=
labilityType/registration", "registration"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvai=
labilityType/scrapingScript", "scrapingScript"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAvai=
labilityType/clickthrough", "clickthrough"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAvai=
labilityType/directDownload", "directDownload"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAvai=
labilityType/query", "query"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAvai=
labilityType/registration", "registration"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAvai=
labilityType/scrapingScript", "scrapingScript"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/datasetAvailab=
ility",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datasetAvailab=
ility",
             compact=3D"dataset_datasetAvailability",
         )
         # Describes potentially noisy elements of the dataset.
         cls._add_property(
             "dataset_datasetNoise",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/datasetNoise",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datasetNoise",
             compact=3D"dataset_datasetNoise",
         )
         # Captures the size of the dataset.
         cls._add_property(
             "dataset_datasetSize",
             NonNegativeIntegerProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/datasetSize",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datasetSize",
             compact=3D"dataset_datasetSize",
         )
         # Describes the type of the given dataset.
         cls._add_property(
             "dataset_datasetType",
             ListProp(EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/audio", "audio"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/categorical", "categorical"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/graph", "graph"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/image", "image"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/noAssertion", "noAssertion"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/numeric", "numeric"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/other", "other"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/sensor", "sensor"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/structured", "structured"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/syntactic", "syntactic"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/text", "text"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/timeseries", "timeseries"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/timestamp", "timestamp"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/video", "video"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/audio", "audio"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/categorical", "categorical"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/graph", "graph"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/image", "image"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/noAssertion", "noAssertion"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/numeric", "numeric"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/other", "other"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/sensor", "sensor"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/structured", "structured"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/syntactic", "syntactic"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/text", "text"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/timeseries", "timeseries"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/timestamp", "timestamp"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/video", "video"),
                 ])),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/datasetType",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datasetType",
             min_count=3D1,
             compact=3D"dataset_datasetType",
         )
@@ -5948,39 +5499,39 @@ class dataset_DatasetPackage(software_Package):
         cls._add_property(
             "dataset_datasetUpdateMechanism",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/datasetUpdateM=
echanism",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datasetUpdateM=
echanism",
             compact=3D"dataset_datasetUpdateMechanism",
         )
         # Describes if any sensitive personal information is present in th=
e dataset.
         cls._add_property(
             "dataset_hasSensitivePersonalInformation",
             EnumProp([
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/n=
o", "no"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/n=
oAssertion", "noAssertion"),
-                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/y=
es", "yes"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/n=
o", "no"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/n=
oAssertion", "noAssertion"),
+                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/y=
es", "yes"),
                 ]),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/hasSensitivePe=
rsonalInformation",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/hasSensitivePe=
rsonalInformation",
             compact=3D"dataset_hasSensitivePersonalInformation",
         )
         # Describes what the given dataset should be used for.
         cls._add_property(
             "dataset_intendedUse",
             StringProp(),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/intendedUse",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/intendedUse",
             compact=3D"dataset_intendedUse",
         )
         # Records the biases that the dataset is known to encompass.
         cls._add_property(
             "dataset_knownBias",
             ListProp(StringProp()),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/knownBias",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/knownBias",
             compact=3D"dataset_knownBias",
         )
         # Describes a sensor used for collecting the data.
         cls._add_property(
             "dataset_sensor",
             ListProp(ObjectProp(DictionaryEntry, False)),
-            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/sensor",
+            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/sensor",
             compact=3D"dataset_sensor",
         )
=20
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 1ae13b4af82..d0dd40877e2 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -323,7 +323,7 @@ def collect_dep_sources(dep_objsets, dest):
             if dep_build is not e.from_:
                 continue
=20
-            if e.relationshipType !=3D oe.spdx30.RelationshipType.hasInput=
s:
+            if e.relationshipType !=3D oe.spdx30.RelationshipType.hasInput:
                 continue
=20
             index_sources_by_hash(e.to, dest)
@@ -485,18 +485,22 @@ def create_spdx(d):
=20
             # If this CVE is fixed upstream, skip it unless all CVEs are
             # specified.
-            if include_vex !=3D "all" and 'detail' in decoded_status and \
-                decoded_status['detail'] in (
-                "fixed-version",
-                "cpe-stable-backport",
+            if (
+                include_vex !=3D "all"
+                and "detail" in decoded_status
+                and decoded_status["detail"]
+                in (
+                    "fixed-version",
+                    "cpe-stable-backport",
+                )
             ):
                 bb.debug(1, "Skipping %s since it is already fixed upstrea=
m" % cve)
                 continue
=20
-            cve_by_status.setdefault(decoded_status['mapping'], {})[cve] =
=3D (
+            cve_by_status.setdefault(decoded_status["mapping"], {})[cve] =
=3D (
                 build_objset.new_cve_vuln(cve),
-                decoded_status['detail'],
-                decoded_status['description'],
+                decoded_status["detail"],
+                decoded_status["description"],
             )
=20
     cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getVar=
("CVE_VERSION"))
@@ -600,7 +604,7 @@ def create_spdx(d):
=20
             pkg_objset.new_scoped_relationship(
                 [build._id],
-                oe.spdx30.RelationshipType.hasOutputs,
+                oe.spdx30.RelationshipType.hasOutput,
                 oe.spdx30.LifecycleScopeType.build,
                 [spdx_package],
             )
@@ -749,7 +753,7 @@ def create_spdx(d):
         if sysroot_files:
             build_objset.new_scoped_relationship(
                 [build],
-                oe.spdx30.RelationshipType.hasOutputs,
+                oe.spdx30.RelationshipType.hasOutput,
                 oe.spdx30.LifecycleScopeType.build,
                 sorted(list(sysroot_files)),
             )
@@ -757,7 +761,7 @@ def create_spdx(d):
     if build_inputs or debug_source_ids:
         build_objset.new_scoped_relationship(
             [build],
-            oe.spdx30.RelationshipType.hasInputs,
+            oe.spdx30.RelationshipType.hasInput,
             oe.spdx30.LifecycleScopeType.build,
             sorted(list(build_inputs)) + sorted(list(debug_source_ids)),
         )
@@ -978,7 +982,7 @@ def collect_build_package_inputs(d, objset, build, pack=
ages):
     if build_deps:
         objset.new_scoped_relationship(
             [build],
-            oe.spdx30.RelationshipType.hasInputs,
+            oe.spdx30.RelationshipType.hasInput,
             oe.spdx30.LifecycleScopeType.build,
             sorted(list(build_deps)),
         )
@@ -1011,7 +1015,7 @@ def create_rootfs_spdx(d):
=20
     objset.new_scoped_relationship(
         [rootfs_build],
-        oe.spdx30.RelationshipType.hasOutputs,
+        oe.spdx30.RelationshipType.hasOutput,
         oe.spdx30.LifecycleScopeType.build,
         [rootfs],
     )
@@ -1073,7 +1077,7 @@ def create_image_spdx(d):
         if artifacts:
             objset.new_scoped_relationship(
                 [image_build],
-                oe.spdx30.RelationshipType.hasOutputs,
+                oe.spdx30.RelationshipType.hasOutput,
                 oe.spdx30.LifecycleScopeType.build,
                 artifacts,
             )
@@ -1088,7 +1092,7 @@ def create_image_spdx(d):
         )
         objset.new_scoped_relationship(
             builds,
-            oe.spdx30.RelationshipType.hasInputs,
+            oe.spdx30.RelationshipType.hasInput,
             oe.spdx30.LifecycleScopeType.build,
             [rootfs_image._id],
         )
@@ -1159,7 +1163,7 @@ def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolc=
hain_outputname):
=20
     objset.new_scoped_relationship(
         [sdk_build],
-        oe.spdx30.RelationshipType.hasOutputs,
+        oe.spdx30.RelationshipType.hasOutput,
         oe.spdx30.LifecycleScopeType.build,
         [sdk_rootfs],
     )
@@ -1186,7 +1190,7 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, =
toolchain_outputname):
=20
     rootfs_objset.new_scoped_relationship(
         [sdk_build],
-        oe.spdx30.RelationshipType.hasInputs,
+        oe.spdx30.RelationshipType.hasInput,
         oe.spdx30.LifecycleScopeType.build,
         [rootfs],
     )
@@ -1225,7 +1229,7 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, =
toolchain_outputname):
     if files:
         rootfs_objset.new_scoped_relationship(
             [sdk_build],
-            oe.spdx30.RelationshipType.hasOutputs,
+            oe.spdx30.RelationshipType.hasOutput,
             oe.spdx30.LifecycleScopeType.build,
             files,
         )
--=20
2.46.0


