Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PzRTs-00061j-AT
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 11:28:00 +0100
Received: by wyb40 with SMTP id 40so349592wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 03:26:18 -0700 (PDT)
Received: by 10.216.144.134 with SMTP id n6mr12081605wej.27.1300184778228;
	Tue, 15 Mar 2011 03:26:18 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n4sm4363752wee.4.2011.03.15.03.26.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 03:26:17 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2011 11:25:01 +0100
Message-Id: <1300184701-23833-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen@openembedded.org>
Subject: [PATCH] kernel bbclass: split do_compile into do_compile and do_compile_modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Mar 2011 10:28:00 -0000

This allows recipes to insert a custom task in between building *Image and modules

From OE .dev revision 615876fe218dc3feb4a3df9e6546a7b1a6376800

Signed-off-by: Koen Kooi <koen@openembedded.org>
Acked-by: Graeme Gregory <dp@xora.org.uk>
---
 meta/classes/kernel.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a1b1354..a9a8f4f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -77,12 +77,17 @@ kernel_do_compile() {
 		oe_runmake dep CC="${KERNEL_CC}" LD="${KERNEL_LD}"
 	fi
 	oe_runmake ${KERNEL_IMAGETYPE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+}
+
+do_compile_kernelmodules() {
+	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		oe_runmake modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
 	else
 		oenote "no modules to compile"
 	fi
 }
+addtask compile_kernelmodules after do_compile before do_install
 
 kernel_do_install() {
 	#
-- 
1.6.6.1



