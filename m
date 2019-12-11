Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id BBB7F7FC75
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 03:11:31 +0000 (UTC)
IronPort-SDR: 0wsWshaVigq/i9sk3bL6Mxp+PYc9JT7bGQJtYbHINggE5D9NHrUe5Zx5AWp1oPpG8y7wtAa0b0
	RGg7oqv+WinXFCuiRAhoOu3gKPUQDaByGtVVUOffmusnSnFjWI+LG/nFtCAZDgV9ZGVREOBV9f
	+3OrunCbArZeYk5jZnQPt4DvwcvrY5oWtWbkWRTiN//oTU7jtZ6k2H4IWzdaETaj5R2CRf02b8
	UncNE9OYSgf9+jS6c8uPQMqs5oa5LGrjiRrwphdf5e48Zf3AoynjT4Y8/g3dAZ+7HQk3ofrsMX
	nJY=
X-IronPort-AV: E=Sophos;i="5.69,301,1571695200"; 
   d="scan'208";a="3360217"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2019 04:11:24 +0100
Message-Id: <20191211031126.22782-6-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191211031126.22782-1-pkj@axis.com>
References: <20191211031126.22782-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2 6/8] package.bbclass: Report only the licenses that are incompatible
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
X-List-Received-Date: Wed, 11 Dec 2019 03:11:32 -0000
Content-Transfer-Encoding: 8bit

When excluding a package from being packaged due to incompatible
licenses, report the license(s) that are actually incompatible.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Show the names of the incompatible licenses correctly.

 meta/classes/package.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e0d6ff6701..ef3de35961 100644
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
+            msg = "Excluding %s from packaging as it has incompatible license(s): %s" % (pkg, licenses)
             package_qa_handle_error("incompatible-license", msg, d)
         else:
             package_list.append(pkg)
-- 
2.21.0


