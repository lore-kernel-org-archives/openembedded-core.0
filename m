Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE5DC001B2
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:48:15 +0000 (UTC)
Received: from 14.mo583.mail-out.ovh.net (14.mo583.mail-out.ovh.net [188.165.51.82])
 by mx.groups.io with SMTP id smtpd.web10.9386.1698792485674864189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 188.165.51.82, mailfrom: louis.rannou@syslinbit.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.4.44])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 05C29287A9
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:04 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nzml2 (unknown [10.110.208.94])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8C01D1FD81;
	Tue, 31 Oct 2023 22:48:03 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-nzml2 with ESMTPSA
	id aJteGyOEQWUYnR8APQBgzw
	(envelope-from <louis.rannou@syslinbit.com>); Tue, 31 Oct 2023 22:48:03 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S0025eb8ba14-c28e-412c-95fc-458d709250ef,
                    E382B8EC8DEDBA5F41C2577A0B4F295D8A9180D4) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	jpewhacker@gmail.com,
	Louis Rannou <louis.rannou@syslinbit.com>
Subject: [OE-core][RFC v2 05/12] oe/sbom: search into json
Date: Tue, 31 Oct 2023 23:47:26 +0100
Message-ID: <20231031224733.367227-6-louis.rannou@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031224733.367227-1-louis.rannou@syslinbit.com>
References: <20231031224733.367227-1-louis.rannou@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9521735513535995357
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtfedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefnohhuihhsucftrghnnhhouhcuoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqnecuggftrfgrthhtvghrnhepgeejgfefieevieefkeevfeeuleekgeeuiedttedtvefgheehveelhfevveehvddunecukfhppeduvdejrddtrddtrddupdeghedrkedurdeivddrledpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189881

Create a function that search into a json-ld instead of completely loadin=
g it.

Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
---
 meta/lib/oe/sbom.py  | 32 ++++++++++++++++++++++++++++++++
 meta/lib/oe/spdx3.py | 13 +++++++------
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index ec543fa43d..c99ae1a228 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -120,3 +120,35 @@ def read_doc(fn):
         doc =3D oe.spdx.SPDXDocument.from_json(f)
=20
     return (doc, sha1.hexdigest())
+
+
+def search_doc(fn, attr_types=3DNone):
+    """
+    Look for all attributes in the given dictionary. Return the document
+    element, a dictionary of the required attributes and the sha1 of the=
 file.
+    """
+    import hashlib
+    import oe.spdx3
+    import io
+    import contextlib
+
+    @contextlib.contextmanager
+    def get_file():
+        if isinstance(fn, io.IOBase):
+            yield fn
+        else:
+            with fn.open("rb") as f:
+                yield f
+
+    with get_file() as f:
+        sha1 =3D hashlib.sha1()
+        while True:
+            chunk =3D f.read(4096)
+            if not chunk:
+                break
+            sha1.update(chunk)
+
+        f.seek(0)
+        doc, attributes =3D oe.spdx3.SPDX3SpdxDocument.from_json(f, attr=
_types or [])
+
+    return (doc, attributes, sha1.hexdigest())
diff --git a/meta/lib/oe/spdx3.py b/meta/lib/oe/spdx3.py
index a027c0ee5b..36ba7aa1c3 100644
--- a/meta/lib/oe/spdx3.py
+++ b/meta/lib/oe/spdx3.py
@@ -286,17 +286,16 @@ class SPDX3SpdxDocument(SPDX3Bundle):
     @classmethod
     def from_json(cls, f, attributes=3D[]):
         """
-        Look into a json file for all objects of given type. Return the =
document
-        element and a dictionary of required objects.
+        Look into a json file. This will return a dictionnary that repre=
sents
+        the SpdxDocument, and is attributes is specified, a list of
+        representation of thos attributes.
         """
+
         class Decoder(json.JSONDecoder):
             def __init__(self, *args, **kwargs):
                 super().__init__(object_hook=3Dself.object_hook, *args, =
**kwargs)
=20
             def object_hook(self, d):
-                if 'type' in d.keys():
-                    if d['type'] in attributes or d['type'] =3D=3D 'Spdx=
Document':
-                        return d
                 if '@graph' in d.keys():
                     spdxDocument =3D None
                     attr =3D {a: [] for a in attributes}
@@ -304,9 +303,11 @@ class SPDX3SpdxDocument(SPDX3Bundle):
                         if p is not None:
                             if p['type'] =3D=3D 'SpdxDocument':
                                 spdxDocument =3D p
-                            else:
+                            elif p['type'] in attributes:
                                 attr[p['type']].append(p)
                     return (spdxDocument, attr)
+                else:
+                    return d
=20
         return json.load(f, cls=3DDecoder)
=20
--=20
2.42.0


