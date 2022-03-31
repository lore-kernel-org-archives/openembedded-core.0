Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54F7C43217
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.654.1648751360410980869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CD7D139F
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0ECDF3F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/23] testimage: inline updateTestData()
Date: Thu, 31 Mar 2022 19:29:04 +0100
Message-Id: <20220331182915.22128-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163853

updateTestData() is just a simple loop that is only used here, so just
inline it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/testimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbcl=
ass
index 898248992c8..8ffaeab2844 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -205,7 +205,6 @@ def testimage_main(d):
     import shutil
=20
     from bb.utils import export_proxies
-    from oeqa.core.utils.misc import updateTestData
     from oeqa.runtime.context import OERuntimeTestContext
     from oeqa.runtime.context import OERuntimeTestContextExecutor
     from oeqa.core.target.qemu import supported_fstypes
@@ -245,7 +244,8 @@ def testimage_main(d):
=20
     # Some variables need to be updates (mostly paths) with the
     # ones of the current environment because some tests require them.
-    updateTestData(d, td, d.getVar('TESTIMAGE_UPDATE_VARS').split())
+    for var in d.getVar('TESTIMAGE_UPDATE_VARS').split():
+        td[var] =3D d.getVar(var)
=20
     image_manifest =3D "%s.manifest" % image_name
     image_packages =3D OERuntimeTestContextExecutor.readPackagesManifest=
(image_manifest)
--=20
2.25.1


