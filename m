Return-Path: <bruno.bottazzini@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CBDA473820
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 19:03:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Mar 2015 11:03:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,676,1418112000"; d="scan'208";a="659359865"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga001.jf.intel.com with ESMTP; 02 Mar 2015 11:03:57 -0800
Received: from orsmsx160.amr.corp.intel.com (10.22.226.43) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 2 Mar 2015 11:03:55 -0800
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX160.amr.corp.intel.com (10.22.226.43) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 2 Mar 2015 11:03:56 -0800
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.99.51) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 2 Mar 2015 11:03:55 -0800
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Mar 2015 16:03:41 -0300
Message-ID: <1425323021-11091-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.99.51]
Subject: [PATCH] systemd: verify if file test-udev and systemd-journal-flush exists
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
X-List-Received-Date: Mon, 02 Mar 2015 19:03:57 -0000
Content-Type: text/plain

If we compile using EXTRA_OECONF with '--disable-tests' option, the files
test-udev and systemd-journal-flush will not be created and the systemd
install phase will fail.
---
 meta/recipes-core/systemd/systemd_219.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index f245239..b30f14d 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -165,7 +165,9 @@ do_install() {
 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
 	# its needed in 216 upstream has fixed it with 919699ec301ea507edce4a619141ed22e789ac0d
 	# don't order journal flushing afte remote-fs.target
-	sed -i -e 's/ remote-fs.target$//' ${D}${systemd_unitdir}/system/systemd-journal-flush.service
+       if [ -s ${D}${systemd_unitdir}/system/systemd-journal-flush.service ]; then
+            sed -i -e 's/ remote-fs.target$//' ${D}${systemd_unitdir}/system/systemd-journal-flush.service
+       fi
 	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
 	# for existence else it fails
 	if [ -s ${D}${libdir}/tmpfiles.d/systemd.conf ]; then
@@ -176,7 +178,9 @@ do_install() {
 do_install_ptest () {
        install -d ${D}${PTEST_PATH}/test
        cp -rf ${S}/test/* ${D}${PTEST_PATH}/test
-       install -m 0755  ${B}/test-udev ${D}${PTEST_PATH}/
+       if [ -s ${B}/test-udev ]; then
+         install -m 0755  ${B}/test-udev ${D}${PTEST_PATH}/
+       fi
        install -d ${D}${PTEST_PATH}/build-aux
        cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
        cp -rf ${B}/rules ${D}${PTEST_PATH}/
-- 
1.9.1


