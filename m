Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 439 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 23 Mar 2015 15:36:51 UTC
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 05CB86AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 15:36:51 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 16:36:50 +0100
Message-Id: <1427125010-32601-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ca-certificates: clean up before do_compile()
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
X-List-Received-Date: Mon, 23 Mar 2015 15:36:52 -0000

Otherwise the script which converts mozilla certificates extracts
each certificate twice.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-support/ca-certificates/ca-certificates_20141019.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20141019.bb b/meta/recipes-support/ca-certificates/ca-certificates_20141019.bb
index e5a4821..421b87e 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20141019.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20141019.bb
@@ -29,6 +29,10 @@ EXTRA_OEMAKE = "\
     'SBINDIR=${sbindir}' \
 "
 
+do_compile_prepend() {
+    oe_runmake clean
+}
+
 do_install () {
     install -d ${D}${datadir}/ca-certificates \
                ${D}${sysconfdir}/ssl/certs \
-- 
1.9.1


