Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26C97731AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 03:13:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u383DBKa019425
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Apr 2016 20:13:11 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 7 Apr 2016 20:13:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Apr 2016 20:13:09 -0700
Message-ID: <a9ea8a660f37bbcf917c71360512ab155241114e.1460085139.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1460085139.git.liezhi.yang@windriver.com>
References: <cover.1460085139.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pbzip2: fix for rebuild
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
X-List-Received-Date: Fri, 08 Apr 2016 03:13:11 -0000
Content-Type: text/plain

Fixed when rebuild pbzip2:
make: Nothing to be done for `all'

This may cause unexpected errors, for example, when depends libs
changed:
| pbzip2: error while loading shared libraries: libbz2.so.0: cannot open shared object file: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index b3c5975..67fb2ef 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -22,6 +22,18 @@ do_configure[noexec] = "1"
 
 EXTRA_OEMAKE = "CXX='${CXX} ${CXXFLAGS}' LDFLAGS='${LDFLAGS}'"
 
+do_compile_prepend() {
+    # Update timestamp to fix rebuild
+    src_files="pbzip2.cpp BZ2StreamScanner.cpp ErrorContext.cpp"
+    for f in $src_files; do
+        if [ -f $f ]; then
+            touch $f
+        else
+            bbwarn "Regular file $f not found"
+        fi
+    done
+}
+
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 pbzip2 ${D}${bindir}/
-- 
2.7.4


