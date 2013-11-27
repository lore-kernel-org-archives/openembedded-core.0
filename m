Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id EEE6B6D128
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 13:45:16 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rARDj8ah030247; Wed, 27 Nov 2013 13:45:09 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HOlmb288vFVx; Wed, 27 Nov 2013 13:45:08 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rARDj1vS030243
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 27 Nov 2013 13:45:03 GMT
Message-ID: <1385559899.11222.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Nov 2013 13:44:59 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] Revert "kernel: restore scripts in the sysroot"
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
X-List-Received-Date: Wed, 27 Nov 2013 13:45:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This reverts commit 6a6735cb98d529c8c5376aedb5c951339f54fe96.

The module class already ensures the scripts are rebuilt correctly. Running
this at sstate installation time is problematic since it can require the
cross compiler. Adding such a dependency would cause issues of its own.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4974507..24ac778 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -290,17 +290,6 @@ kernel_do_install() {
 }
 do_install[prefuncs] += "package_get_auto_pr"
 
-
-SSTATEPOSTINSTFUNCS += "kernelscripts_sstate_postinst"
-kernelscripts_sstate_postinst () {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
-		( 
-		  cd ${STAGING_KERNEL_DIR}
-		  oe_runmake scripts
-		)
-	fi
-}
-
 python sysroot_stage_all () {
     oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"), d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
 }



