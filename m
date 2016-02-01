Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 412547725C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 16:03:41 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 682177682; Mon, 01 Feb 2016 10:48:34 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aQGiK-000C0K-90; Mon, 01 Feb 2016 15:48:28 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aQGiK-0002dP-8P; Mon, 01 Feb 2016 15:48:28 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 15:48:25 +0000
Message-Id: <1454341706-10089-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [RESEND PATCH 1/2] shadow: use ALTERNATIVE to manage 'nologin'
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
X-List-Received-Date: Mon, 01 Feb 2016 16:03:41 -0000

Both util-linux and shadow provide 'nologin', so use the ALTERNATIVE
mechanism in OE to manage it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-extended/shadow/shadow.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

Originally submitted by Chen Qi in
<9c7d48d4e2c931c5cd5873f6fa1dcb0fedfeb790.1416554582.git.Qi.Chen@windriver.com>
back in 2014. I've just rebased it on master and fixed the conflicts.

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 4313ffe..a5f1048 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -151,6 +151,9 @@ do_install_append() {
 	# Handle link properly after rename, otherwise missing files would
 	# lead rpm failed dependencies.
 	ln -sf newgrp.${BPN} ${D}${bindir}/sg
+
+	# mv nologin to nologin.${BPN}
+	mv ${D}${base_sbindir}/nologin ${D}${base_sbindir}/nologin.${BPN}
 }
 
 PACKAGES =+ "${PN}-base"
@@ -170,10 +173,12 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "200"
 
-ALTERNATIVE_${PN} = "passwd chfn chsh chpasswd vipw vigr"
+ALTERNATIVE_${PN} = "passwd chfn chsh chpasswd vipw vigr nologin"
 ALTERNATIVE_LINK_NAME[chpasswd] = "${sbindir}/chpasswd"
 ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
+ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
+ALTERNATIVE_TARGET[nologin] = "${base_sbindir}/nologin.${BPN}"
 
 ALTERNATIVE_${PN}-base = "newgrp groups login su"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
-- 
2.1.4


