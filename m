Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3664D7320F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 18:16:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7GIGK3b029650
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 11:16:21 -0700
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 16 Aug 2016 11:16:20 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Aug 2016 11:16:20 -0700
Message-ID: <1471371380-21952-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] useradd: do not delete users and groups during configure
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
X-List-Received-Date: Tue, 16 Aug 2016 18:16:26 -0000
Content-Type: text/plain

If two recipes both create the same users and groups, the
second recipe can delete items created by the first causing
things like "chown" to fail for the first recipe.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/useradd.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 8d51fb5..6df9822 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -129,7 +129,7 @@ useradd_sysroot_sstate () {
 
 userdel_sysroot_sstate () {
 if test "x${STAGING_DIR_TARGET}" != "x"; then
-    if [ "${BB_CURRENTTASK}" = "configure" -o "${BB_CURRENTTASK}" = "clean" ]; then
+    if [ "${BB_CURRENTTASK}" = "clean" ]; then
         export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${STAGING_DIR_NATIVE}${bindir_native}/pseudo"
         OPT="--root ${STAGING_DIR_TARGET}"
 
-- 
1.7.9.5


