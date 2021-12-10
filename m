Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FABC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 11:08:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5775.1639134500754736655
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34DF013D5
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:08:20 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB0B03F73B
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:08:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 4/4] license.bbclass: implement
 ast.NodeVisitor.visit_Constant
Date: Fri, 10 Dec 2021 11:08:14 +0000
Message-Id: <20211210110814.112954-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210110814.112954-1-ross.burton@arm.com>
References: <20211210110814.112954-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 11:08:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159497

From: Ross Burton <ross@burtonini.com>

Since Python 3.8 visit_Num(), visit_Str() and so on are all deprecated
and replaced with visit_Constant.  We can't yet remove the deprecated
functions until we require 3.8, but we can implement visit_Constant to
silence the deprecation warnings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/license.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 45d912741d2..7a34e185c74 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -145,6 +145,10 @@ def find_license_files(d):
             find_license(node.s.replace("+", "").replace("*", ""))
             self.generic_visit(node)
=20
+        def visit_Constant(self, node):
+            find_license(node.value.replace("+", "").replace("*", ""))
+            self.generic_visit(node)
+
     def find_license(license_type):
         try:
             bb.utils.mkdirhier(gen_lic_dest)
--=20
2.25.1


