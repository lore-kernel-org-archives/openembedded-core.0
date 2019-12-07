Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9357FAA5
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2019 05:38:20 +0000 (UTC)
IronPort-SDR: Kg+NVbf4zmLzZ2HWu3hP5U0M6MD7BrG3MZMKPZXGV8aqHQDvxtmNl36b3On9/FIDxhhyrcf13W
	T45V/B6VY88sl/bABR6UwfbZunodLdl8vHEXJKhqANLSv2MER/gepuulw13AAtobV9RS0TrZvy
	rjVveoJznTfv0vc5q5wglfeI5sF1YZNPXIUkmRTAnRyTyriV3a8/1O8uZvco59Ai4IGHt/uN1l
	/78qUSAral5g2w7cAaWqOnnsG89EDOIMVCu7n4cHo+Kvi2RkSjkvdRMirvF3jjAhq5XWd3rAVj
	32I=
X-IronPort-AV: E=Sophos;i="5.69,286,1571695200"; 
   d="scan'208";a="3252007"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Dec 2019 06:38:14 +0100
Message-Id: <20191207053815.1757-6-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191207053815.1757-1-pkj@axis.com>
References: <20191207053815.1757-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 6/7] package.bbclass: Report only the licenses that are incompatible
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Dec 2019 05:38:20 -0000
Content-Transfer-Encoding: 8bit

When excluding a package from being packaged due to incompatible
licenses, report the license(s) that are actually incompatible.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/package.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e0d6ff6701..6f5939e12f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1263,8 +1263,9 @@ python populate_packages () {
     # Handle LICENSE_EXCLUSION
     package_list = []
     for pkg in packages:
-        if d.getVar('LICENSE_EXCLUSION-' + pkg):
-            msg = "%s has an incompatible license. Excluding from packaging." % pkg
+        licenses = d.getVar('LICENSE_EXCLUSION-' + pkg)
+        if licenses:
+            msg = "Excluding %s from packaging as it has incompatible license(s): %s" % (pkg, ' '.join(licenses))
             package_qa_handle_error("incompatible-license", msg, d)
         else:
             package_list.append(pkg)
-- 
2.21.0


