Return-Path: <mcrowe@brightsign.biz>
Received: from elite.brightsigndigital.co.uk
	(cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net [86.30.57.232])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB7E6D001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 17:38:09 +0000 (UTC)
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1VipFa-0000fW-W1; Tue, 19 Nov 2013 17:38:11 +0000
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1VipFa-0006zc-Ui; Tue, 19 Nov 2013 17:38:10 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2013 17:37:45 +0000
Message-Id: <1384882665-26840-2-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384882665-26840-1-git-send-email-mac@mcrowe.com>
References: <20131119173725.GA13018@mcrowe.com>
	<1384882665-26840-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 2/2] kernel.bbclass: Call make with correct variables in kernelscripts_sstate_postinst
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
X-List-Received-Date: Tue, 19 Nov 2013 17:38:09 -0000

Ensure that the environment variable and command line arguments that are
used when calling make in kernel_do_compile are used in
kernelscripts_sstate_postinst.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/kernel.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 2fad6e0..9d922d6 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -304,10 +304,11 @@ do_install[prefuncs] += "package_get_auto_pr"
 
 SSTATEPOSTINSTFUNCS += "kernelscripts_sstate_postinst"
 kernelscripts_sstate_postinst () {
+	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
 		( 
 		  cd ${STAGING_KERNEL_DIR}
-		  oe_runmake scripts
+		  oe_runmake scripts CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 		)
 	fi
 }
-- 
1.7.10.4


