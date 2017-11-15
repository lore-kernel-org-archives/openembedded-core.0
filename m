Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 52B027868C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 18:54:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAFIs9i6014896
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 10:54:09 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 15 Nov 2017 10:54:09 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Nov 2017 10:54:09 -0800
Message-ID: <20171115185409.12050-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] nss: pay attention to CFLAGS
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
X-List-Received-Date: Wed, 15 Nov 2017 18:54:09 -0000
Content-Type: text/plain

nss ignores CFLAGS so we suggest them via CC.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-support/nss/nss_3.33.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/nss/nss_3.33.bb b/meta/recipes-support/nss/nss_3.33.bb
index e3d4f96..06d81ce 100644
--- a/meta/recipes-support/nss/nss_3.33.bb
+++ b/meta/recipes-support/nss/nss_3.33.bb
@@ -104,7 +104,12 @@ do_compile() {
     # We can modify CC in the environment, but if we set it via an
     # argument to make, nsinstall, a host program, will also build with it!
     #
-    export CC="${CC} -g"
+    # nss pretty much does its own thing with CFLAGS, so we put them into CC.
+    # Optimization will get clobbered, but most of the stuff will survive.
+    # The motivation for this is to point to the correct place for debug
+    # source files and CFLAGS does that.  Nothing uses CCC.
+    #
+    export CC="${CC} ${CFLAGS}"
     make -C ./nss CCC="${CXX} -g" \
         OS_TEST=${OS_TEST} \
         RPATH="${RPATH}"
-- 
2.7.4


