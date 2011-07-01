Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QcfXC-0007rQ-Gn
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 17:21:35 +0200
Received: by rex (Postfix, from userid 1000)
	id 8B1792FE93; Fri,  1 Jul 2011 16:17:29 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2011 16:17:20 +0100
Message-Id: <21f4435304f00464e7b3499ea4305588e7d9760d.1309533254.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <c201845df210143f3170eca54c9870f7e20be47a.1309533254.git.richard.purdie@linuxfoundation.org>
References: <c201845df210143f3170eca54c9870f7e20be47a.1309533254.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309533254.git.richard.purdie@linuxfoundation.org>
References: <cover.1309533254.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/6] kernel.bbclass: Ensure kernel/* internal sysroot working directory don't get packaged
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
X-List-Received-Date: Fri, 01 Jul 2011 15:21:35 -0000

From: Richard  Purdie <richard.purdie@linuxfoundation.org>

This removes a couple of megabytes of QA warnings!

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f282a57..6700d0e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -168,6 +168,12 @@ kernel_do_install() {
 	done
 }
 
+PACKAGE_PREPROCESS_FUNCS += "kernel_package_preprocess"
+
+kernel_package_preprocess () {
+	rm -rf ${PKGD}/kernel
+}
+
 sysroot_stage_all_append() {
 	sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}/kernel
 }
-- 
1.7.4.1



