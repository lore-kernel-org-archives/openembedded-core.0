Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U0Aar-0006LL-6q
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 13:47:17 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 71A8ED22B4;
	Tue, 29 Jan 2013 13:31:38 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 13:31:26 +0100
Message-Id: <1359462686-13304-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] Flex: use proper m4 binary on target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 12:47:23 -0000

flex tries to execute:

/data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/m4

As workaround you can:

mkdir -p /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/
ln -s /usr/bin/m4 /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/

So this is a bug how OE builds flex.

flex tries to execute:

/data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/m4

As workaround you can:

mkdir -p /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/
ln -s /usr/bin/m4 /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/

So this is a bug how OE builds flex.

https://bugs.launchpad.net/linaro-aarch64/+bug/1106865

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-devtools/flex/flex.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index 472813b..517db16 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -10,6 +10,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 "
 
 inherit autotools gettext
 
-do_install_append_class-native() {
-	create_wrapper ${D}/${bindir}/flex M4=${STAGING_BINDIR_NATIVE}/m4
+M4 = "${bindir}/m4"
+M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
+
+do_install_append() {
+	create_wrapper ${D}/${bindir}/flex M4=${M4}
 }
-- 
1.8.0



