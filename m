Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183D3C41535
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:48:15 +0000 (UTC)
Received: from 8.mo581.mail-out.ovh.net (8.mo581.mail-out.ovh.net [46.105.77.114])
 by mx.groups.io with SMTP id smtpd.web11.9574.1698792485037645808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 46.105.77.114, mailfrom: louis.rannou@syslinbit.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.146.19])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id F122B28121
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:02 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nzml2 (unknown [10.110.208.94])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 299881FDBB;
	Tue, 31 Oct 2023 22:48:02 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-nzml2 with ESMTPSA
	id MA2UBiKEQWUYnR8APQBgzw
	(envelope-from <louis.rannou@syslinbit.com>); Tue, 31 Oct 2023 22:48:02 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S0025e26a880-1bc3-4c51-96b9-8887a5d6166b,
                    E382B8EC8DEDBA5F41C2577A0B4F295D8A9180D4) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	jpewhacker@gmail.com,
	Louis Rannou <louis.rannou@syslinbit.com>,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [OE-core][RFC v2 03/12] oe/sbom: change the write_doc to prepare for spdx3
Date: Tue, 31 Oct 2023 23:47:24 +0100
Message-ID: <20231031224733.367227-4-louis.rannou@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031224733.367227-1-louis.rannou@syslinbit.com>
References: <20231031224733.367227-1-louis.rannou@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9521172564629773577
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtfedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqeenucggtffrrghtthgvrhhnpeegjefgfeeiveeifeekveefueelkeegueeitdettdevgfehheevlefhveevhedvudenucfkphepuddvjedrtddrtddruddpgeehrdekuddriedvrdelpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189880

This changes the prototype of write_doc as the SPDX3 documentation does n=
ot
specify yet which is the root element.

Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 meta/classes/create-spdx.bbclass | 2 +-
 meta/lib/oe/sbom.py              | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.=
bbclass
index 19c6c0ff0b..b604973ae0 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -5,4 +5,4 @@
 #
 # Include this class when you don't care what version of SPDX you get; i=
t will
 # be updated to the latest stable version that is supported
-inherit create-spdx-2.2
+inherit create-spdx-3.0
diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index 824839378a..ec543fa43d 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -68,7 +68,9 @@ def doc_path(spdx_deploy, doc_name, arch, subdir):
     return spdx_deploy / arch / subdir / (doc_name + ".spdx.json")
=20
=20
-def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=3DNone, indent=3DNo=
ne):
+# WARNING: This is for SPDX3. As long as we don't know which is the root
+# element, this suggest a virtual graph as top of the tree
+def write_doc(d, spdx_graph, spdx_doc, arch, subdir, spdx_deploy=3DNone,=
 indent=3DNone):
     from pathlib import Path
=20
     if spdx_deploy is None:
@@ -77,7 +79,7 @@ def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=3D=
None, indent=3DNone):
     dest =3D doc_path(spdx_deploy, spdx_doc.name, arch, subdir)
     dest.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
     with dest.open("wb") as f:
-        doc_sha1 =3D spdx_doc.to_json(f, sort_keys=3DFalse, indent=3Dind=
ent)
+        doc_sha1 =3D spdx_graph.to_json(f, sort_keys=3DFalse, indent=3Di=
ndent)
=20
     l =3D _doc_path_by_namespace(spdx_deploy, arch, spdx_doc.documentNam=
espace)
     l.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
--=20
2.42.0


