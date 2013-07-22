Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B71DF6B1D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 05:45:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6M5jcT3019884
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2013 22:45:38 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 21 Jul 2013 22:45:36 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Jul 2013 13:45:33 +0800
Message-ID: <ddc5bcdf8e55f13d76e2b0b256a4599912074496.1374470729.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1374470729.git.hongxu.jia@windriver.com>
References: <cover.1374470729.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] nss:fix postinst failed at rootfs time
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
X-List-Received-Date: Mon, 22 Jul 2013 05:45:36 -0000
Content-Type: text/plain

Create checksum file at rootfs time to support read-only rootfs.

[YOCTO #4879]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/nss/nss.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index e2f3891..11f1b7f 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -163,7 +163,13 @@ do_install_append_class-target() {
 
 pkg_postinst_${PN} () {
     if [ -n "$D" ]; then
-        exit 1
+        for I in $D/${libdir}/lib*.chk; do
+            DN=`dirname $I`
+            BN=`basename $I .chk`
+            FN=$DN/$BN.so
+            shlibsign -i $FN
+        done
+        exit 0
     fi
     signlibs.sh
 }
-- 
1.8.1.2


