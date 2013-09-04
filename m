Return-Path: <olof.johansson@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id BB60E6BDAA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 06:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 517AD349626
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 08:30:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eJ+zgbL8lirh
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 08:30:30 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 037CF349603
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 08:30:29 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id D8197844
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 08:30:29 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id CD19674F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 08:30:29 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id CB8EF3404E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 08:30:29 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.2.255.0;
	Wed, 4 Sep 2013 08:30:29 +0200
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 9371B9C078; 
	Wed,  4 Sep 2013 08:30:29 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Sep 2013 08:30:29 +0200
Message-ID: <1378276229-19687-1-git-send-email-olofjn@axis.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] flex: Only use create_wrapper for native and nativesdk
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
X-List-Received-Date: Wed, 04 Sep 2013 06:30:32 -0000
Content-Type: text/plain

The create_wrapper functions of utils.bbclass cause implicit
dependencies on bash, which may not be suitable for deployment on
target. Besides, the wrapper doesn't seem to be necessary on target.

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/recipes-devtools/flex/flex.inc |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index 517db16..43f1dda 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -13,6 +13,10 @@ inherit autotools gettext
 M4 = "${bindir}/m4"
 M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
 
-do_install_append() {
+do_install_append_class-native() {
+	create_wrapper ${D}/${bindir}/flex M4=${M4}
+}
+
+do_install_append_class-nativesdk() {
 	create_wrapper ${D}/${bindir}/flex M4=${M4}
 }
-- 
1.7.10.4


