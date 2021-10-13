Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F06BC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 15:10:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9402.1634137830434636000
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 381D6147A
	for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:10:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7E5D3F694
	for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:10:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oe/license: implement ast.NodeVisitor.visit_Constant
Date: Wed, 13 Oct 2021 16:10:23 +0100
Message-Id: <20211013151024.293796-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 15:10:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156917

Since Python 3.8 visit_Num(), visit_Str() and so on are all deprecated
and replaced with visit_Constant.  We can't yet remove the deprecated
functions until we require 3.8, but we can implement visit_Constant to
silence the deprecation warnings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/license.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 665d32ecbb..b5d378a549 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -74,6 +74,9 @@ class FlattenVisitor(LicenseVisitor):
     def visit_Str(self, node):
         self.licenses.append(node.s)
=20
+    def visit_Constant(self, node):
+        self.licenses.append(node.value)
+
     def visit_BinOp(self, node):
         if isinstance(node.op, ast.BitOr):
             left =3D FlattenVisitor(self.choose_licenses)
@@ -227,6 +230,9 @@ class ListVisitor(LicenseVisitor):
     def visit_Str(self, node):
         self.licenses.add(node.s)
=20
+    def visit_Constant(self, node):
+        self.licenses.add(node.value)
+
 def list_licenses(licensestr):
     """Simply get a list of all licenses mentioned in a license string.
        Binary operators are not applied or taken into account in any way=
"""
--=20
2.25.1


