Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 832F160745
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 09:33:27 +0000 (UTC)
Received: from hsp.bmw-carit.intra (hsp.bmw-carit.intra [192.168.101.108])
	by linuxmail.bmw-carit.de (Postfix) with ESMTP id 7BEE05335C;
	Tue,  5 Jan 2016 10:19:11 +0100 (CET)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jan 2016 10:32:40 +0100
Message-Id: <1451986361-10021-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450352712-31476-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1450352712-31476-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Subject: [PATCH v2 1/2] boost: ensure boost to remain an empty metapackage
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
X-List-Received-Date: Tue, 05 Jan 2016 09:33:27 -0000

To ensure that boost remains an empty metapackage after version
updates, we explicitly require boost files to be empty. If new
libraries exist after a version update of the boost recipe,
bitbake will emit a warning at the do_package task. For example,
at the version update from 1.58.0 to 1.59.0, the new timer
library is indicated with:

WARNING: QA Issue: boost: Files/directories were installed but not shipped in any package:
  /usr/lib/libboost_timer.so.1.59.0
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
boost: 1 installed and not shipped files. [installed-vs-shipped]

Ross Burton suggested this improvement on the openembedded-core
mailing list during review of the boost recipe version update [1].

[1] http://lists.openembedded.org/pipermail/openembedded-core/2015-December/114314.html

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta/recipes-support/boost/boost.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 9d7fb89..7167ac3 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -59,6 +59,7 @@ FILES_boost-test = "${libdir}/libboost_prg_exec_monitor*.so.* \
 
 # -dev last to pick up the remaining stuff
 PACKAGES += "${PN}-dev ${PN}-staticdev"
+FILES_${PN} = ""
 FILES_${PN}-dev = "${includedir} ${libdir}/libboost_*.so"
 FILES_${PN}-staticdev = "${libdir}/libboost_*.a"
 
-- 
1.9.1


