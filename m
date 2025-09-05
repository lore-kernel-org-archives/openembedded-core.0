Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0443CA101F
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 17:12:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.604.1757092324477065222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 10:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KfdicUpK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 541E444282;
	Fri,  5 Sep 2025 17:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1757092322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5SBmfKGU1n5PB86Sj5nmeO3J4V9MT+7yeiji5jLfyY=;
	b=KfdicUpKP5jPGZYz6oLonRUBwkdML5/pY5YbHNcANm3Lpmy3vT37YOaW87IPZYsr7JZ25r
	6dVu/66kmDBQkmFtmobJN+MxUhGXUx1c+wyY3b5NQL2rMQQkTjM8fIEslRIDvnjLZ0uM3s
	3J/R0OPr5IMSAG1K/Ja6cluIcc4jKghqxNNNdTbDVZu2WBvQOt8J6D7jwArtaioToJ2n2H
	5obm3lAMtn5kRGXHBKnpPqe9YBQ1nhQbBH8aAsGrRc/pF3iPEHB7pTO0uE3fN+pRjpow57
	F3Zuekf++djNpg0h3YsuL4YftFIuK+jV3Fa3TZfqXFPVfbWpNIC8io1is07jCg==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [PATCH 4/6] lib/license: Move package license skip to library
Date: Fri,  5 Sep 2025 19:11:52 +0200
Message-ID: <20250905171154.182825-5-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
References: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmrghmvghluceuohhuhhgrrhgruceokhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddukeekfeetgfeltdfgieeugeeggeejieejheekueevhffgffegkefgffeukedvnecukfhppeekkedrudeitddrvddvvddrvddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekkedrudeitddrvddvvddrvddvledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeflrffghghhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhto
 hepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehprghstggrlhdrvggsvghrhhgrrhgusehsvgdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 17:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223029

From: Joshua Watt <JPEWhacker@gmail.com>

Moves the code that skips packages with incompatible licenses to the
library code so that it can be called in other locations

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 86eb409e3c1b30110869ec5a0027ae2d48bbfe7f)
Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.com>
---
 meta/classes-global/base.bbclass | 35 ++++------------------------
 meta/lib/oe/license.py           | 39 ++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 31 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index f764f3ee2f..ecf0fd711f 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -565,37 +565,10 @@ python () {
 
         bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
 
-        check_license = False if pn.startswith("nativesdk-") else True
-        for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARGET_ARCH}",
-              "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
-              "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
-            if pn.endswith(d.expand(t)):
-                check_license = False
-        if pn.startswith("gcc-source-"):
-            check_license = False
-
-        if check_license and bad_licenses:
-            bad_licenses = oe.license.expand_wildcard_licenses(d, bad_licenses)
-
-            exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
-
-            for lic_exception in exceptions:
-                if ":" in lic_exception:
-                    lic_exception = lic_exception.split(":")[1]
-                if lic_exception in oe.license.obsolete_license_list():
-                    bb.fatal("Obsolete license %s used in INCOMPATIBLE_LICENSE_EXCEPTIONS" % lic_exception)
-
-            pkgs = d.getVar('PACKAGES').split()
-            skipped_pkgs = {}
-            unskipped_pkgs = []
-            for pkg in pkgs:
-                remaining_bad_licenses = oe.license.apply_pkg_license_exception(pkg, bad_licenses, exceptions)
-
-                incompatible_lic = oe.license.incompatible_license(d, remaining_bad_licenses, pkg)
-                if incompatible_lic:
-                    skipped_pkgs[pkg] = incompatible_lic
-                else:
-                    unskipped_pkgs.append(pkg)
+        pkgs = d.getVar('PACKAGES').split()
+        if pkgs:
+            skipped_pkgs = oe.license.skip_incompatible_package_licenses(d, pkgs)
+            unskipped_pkgs = [p for p in pkgs if p not in skipped_pkgs]
 
             if unskipped_pkgs:
                 for pkg in skipped_pkgs:
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 7739697c40..32c77fa204 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -422,3 +422,42 @@ def check_license_format(d):
                     '%s: LICENSE value "%s" has an invalid separator "%s" that is not ' \
                     'in the valid list of separators (%s)' %
                     (pn, licenses, element, license_operator_chars), d)
+
+def skip_incompatible_package_licenses(d, pkgs):
+    if not pkgs:
+        return {}
+
+    pn = d.getVar("PN")
+
+    check_license = False if pn.startswith("nativesdk-") else True
+    for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARGET_ARCH}",
+            "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
+            "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
+        if pn.endswith(d.expand(t)):
+            check_license = False
+    if pn.startswith("gcc-source-"):
+        check_license = False
+
+    bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
+    if not check_license or not bad_licenses:
+        return {}
+
+    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
+
+    exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
+
+    for lic_exception in exceptions:
+        if ":" in lic_exception:
+            lic_exception = lic_exception.split(":")[1]
+        if lic_exception in obsolete_license_list():
+            bb.fatal("Obsolete license %s used in INCOMPATIBLE_LICENSE_EXCEPTIONS" % lic_exception)
+
+    skipped_pkgs = {}
+    for pkg in pkgs:
+        remaining_bad_licenses = apply_pkg_license_exception(pkg, bad_licenses, exceptions)
+
+        incompatible_lic = incompatible_license(d, remaining_bad_licenses, pkg)
+        if incompatible_lic:
+            skipped_pkgs[pkg] = incompatible_lic
+
+    return skipped_pkgs
-- 
2.43.0


