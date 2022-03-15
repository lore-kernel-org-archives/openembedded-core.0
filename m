Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03701C433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 16:23:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13277.1647361427538485815
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 09:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 177181474
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 09:23:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9B653F766
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 09:23:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] devupstream: fix handling of SRC_URI
Date: Tue, 15 Mar 2022 16:23:43 +0000
Message-Id: <20220315162345.613041-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 16:23:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163305

As the class handler runs before overrides are actually applied we need
to check both SRC_URI:class-devupstream and SRC_URI, otherwise the
automatic assignment of S=3D"${WORKDIR}/git" for git repositories does
not work if the base recipe uses http: but :class-devupstream has a git:/=
/
entry instead.

Also, there's no need to set S:class-devupstream, we can just assign to
S here.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/devupstream.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/devupstream.bbclass b/meta/classes/devupstream.=
bbclass
index facc46f3af..ba6dc4136c 100644
--- a/meta/classes/devupstream.bbclass
+++ b/meta/classes/devupstream.bbclass
@@ -30,10 +30,11 @@ python devupstream_virtclass_handler () {
     # Develpment releases are never preferred by default
     d.setVar("DEFAULT_PREFERENCE", "-1")
=20
-    uri =3D bb.fetch2.URI(d.getVar("SRC_URI").split()[0])
+    src_uri =3D d.getVar("SRC_URI:class-devupstream") or d.getVar("SRC_U=
RI")
+    uri =3D bb.fetch2.URI(src_uri.split()[0])
=20
     if uri.scheme =3D=3D "git" and not d.getVar("S:class-devupstream"):
-        d.setVar("S:class-devupstream", "${WORKDIR}/git")
+        d.setVar("S", "${WORKDIR}/git")
=20
     # Modify the PV if the recipe hasn't already overridden it
     pv =3D d.getVar("PV")
--=20
2.25.1


