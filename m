Return-Path: <olof.johansson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 88EF36FFEA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 13:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 10BF72E140
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 14:45:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id BGkvdobnMErS
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 14:45:33 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 3DD792E120
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 14:45:33 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 1E8D71505
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 14:45:33 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 12B2EAB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 14:45:33 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 102DD34213
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 14:45:33 +0100 (CET)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0; Tue, 19 Jan 2016
	14:45:32 +0100
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 940D49C724; 
	Tue, 19 Jan 2016 14:45:32 +0100 (CET)
From: Olof Johansson <olof.johansson@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jan 2016 14:45:32 +0100
Message-ID: <1453211132-10600-1-git-send-email-olofjn@axis.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] rpm: remove bashisms: [ x == x ] -> [ x = x ]
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
X-List-Received-Date: Tue, 19 Jan 2016 13:45:38 -0000
Content-Type: text/plain

The postinst and postrm of rpm contained a bashism, that could in some
situations potentially cause ldconfig not be triggered when it should
be. If you use dash on host, test would fail because of syntax errors.
But on host, it should fail because of the comparison. On target, you
often use busybox ash, and it supports == as an alias for =. So in
practice, only if you use a shell like dash on target, you'll run into
issues with this.

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/recipes-devtools/rpm/rpm_4.11.2.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.11.2.bb b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
index a48852f..3683971 100644
--- a/meta/recipes-devtools/rpm/rpm_4.11.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
@@ -101,8 +101,7 @@ do_install_append() {
 }
 
 pkg_postinst_${PN}() {
-
-    [ "x\$D" == "x" ] && ldconfig
+    [ "x\$D" = "x" ] && ldconfig
     test -f ${localstatedir}/lib/rpm/Packages || rpm --initdb
     rm -f ${localstatedir}/lib/rpm/Filemd5s \
           ${localstatedir}/lib/rpm/Filedigests \
@@ -112,7 +111,7 @@ pkg_postinst_${PN}() {
 }
 
 pkg_postrm_${PN}() {
-    [ "x\$D" == "x" ] && ldconfig
+    [ "x\$D" = "x" ] && ldconfig
 
 }
 
-- 
2.1.4


