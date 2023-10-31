Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108BCC4167D
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:48:05 +0000 (UTC)
Received: from 13.mo583.mail-out.ovh.net (13.mo583.mail-out.ovh.net [87.98.182.191])
 by mx.groups.io with SMTP id smtpd.web11.9572.1698792483609546564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 87.98.182.191, mailfrom: louis.rannou@syslinbit.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.20.107])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 085712879C
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:02 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nzml2 (unknown [10.110.208.94])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 953E51FDB1;
	Tue, 31 Oct 2023 22:48:01 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-nzml2 with ESMTPSA
	id KHXZHyGEQWUYnR8APQBgzw
	(envelope-from <louis.rannou@syslinbit.com>); Tue, 31 Oct 2023 22:48:01 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S0022c6a708f-e472-4b88-af17-5b35ef997f0d,
                    E382B8EC8DEDBA5F41C2577A0B4F295D8A9180D4) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	jpewhacker@gmail.com,
	Louis Rannou <louis.rannou@syslinbit.com>
Subject: [OE-core][RFC v2 02/12] oe/spdx: extend spdx.py objects
Date: Tue, 31 Oct 2023 23:47:23 +0100
Message-ID: <20231031224733.367227-3-louis.rannou@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031224733.367227-1-louis.rannou@syslinbit.com>
References: <20231031224733.367227-1-louis.rannou@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9521172564738366941
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtfedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefnohhuihhsucftrghnnhhouhcuoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqnecuggftrfgrthhtvghrnhepkeetueeugefhheeihfekveekleeugfeigedvudfgieeuuddvffejkeelieeiudeunecuffhomhgrihhnpegppggtlhgrshhspggprdgppghnrghmvgenucfkphepuddvjedrtddrtddruddpgeehrdekuddriedvrdelpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189878

Extend objects used to build the spdx scheme:

- add support for inheritance
- hide all attributes starting by _spdx
- add methods to list properties and item pairs
- improve the serializer to match the spdx3 scheme

Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
---
 meta/lib/oe/sbom.py |  2 +-
 meta/lib/oe/spdx.py | 30 +++++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index fd4b6895d8..824839378a 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -77,7 +77,7 @@ def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=3D=
None, indent=3DNone):
     dest =3D doc_path(spdx_deploy, spdx_doc.name, arch, subdir)
     dest.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
     with dest.open("wb") as f:
-        doc_sha1 =3D spdx_doc.to_json(f, sort_keys=3DTrue, indent=3Dinde=
nt)
+        doc_sha1 =3D spdx_doc.to_json(f, sort_keys=3DFalse, indent=3Dind=
ent)
=20
     l =3D _doc_path_by_namespace(spdx_deploy, arch, spdx_doc.documentNam=
espace)
     l.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
index 7aaf2af5ed..97b9e011ad 100644
--- a/meta/lib/oe/spdx.py
+++ b/meta/lib/oe/spdx.py
@@ -145,9 +145,13 @@ class MetaSPDXObject(type):
     def __new__(mcls, name, bases, attrs):
         attrs["_properties"] =3D {}
=20
-        for key in attrs.keys():
-            if isinstance(attrs[key], _Property):
-                prop =3D attrs[key]
+        at =3D {}
+        for basecls in bases:
+            at.update(basecls._properties)
+        at.update(attrs)
+        for key in at.keys():
+            if isinstance(at[key], _Property):
+                prop =3D at[key]
                 attrs["_properties"][key] =3D prop
                 prop.set_property(attrs, key)
=20
@@ -166,15 +170,27 @@ class SPDXObject(metaclass=3DMetaSPDXObject):
             if name in d:
                 self._spdx[name] =3D prop.init(d[name])
=20
-    def serializer(self):
-        return self._spdx
-
     def __setattr__(self, name, value):
-        if name in self._properties or name =3D=3D "_spdx":
+        # All attributes must be in _properties or are hidden variables =
which
+        # must be prefixed with _spdx
+        if name in self._properties or name[:len("_spdx")] =3D=3D "_spdx=
":
             super().__setattr__(name, value)
             return
         raise KeyError("%r is not a valid SPDX property" % name)
=20
+    def properties(self):
+        return self._properties.keys()
+
+    def items(self):
+        return self._properties.items()
+
+    def serializer(self, rootElement):
+        main =3D {"type": self.__class__.__name__[len("SPDX3"):]}
+        for (key, value) in self._spdx.items():
+            if key[0] =3D=3D '_':
+                key =3D key[1:]
+            main.update({key: value})
+        return main
 #
 # These are the SPDX objects implemented from the spec. The *only* prope=
rties
 # that can be added to these objects are ones directly specified in the =
SPDX
--=20
2.42.0


