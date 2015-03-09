Return-Path: <bruno.bottazzini@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 42AD9739AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 21:11:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 09 Mar 2015 14:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,370,1422950400"; d="scan'208";a="464820979"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2015 14:04:32 -0700
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 9 Mar 2015 14:11:11 -0700
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX159.amr.corp.intel.com (10.22.240.24) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 9 Mar 2015 14:11:12 -0700
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.99.143) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 9 Mar 2015 14:11:10 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Mar 2015 18:10:51 -0300
Message-ID: <1425935453-15437-3-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1425935453-15437-1-git-send-email-bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
	<1425935453-15437-1-git-send-email-bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.99.143]
Subject: [PATCH v2 2/4] systemd: verify if files test-udev and systemd-journal-flush exists
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
X-List-Received-Date: Mon, 09 Mar 2015 21:11:13 -0000
Content-Type: text/plain

If we compile using EXTRA_OECONF with '--disable-tests' option, the files
test-udev and systemd-journal-flush will not be created and the systemd
install phase will fail.
---
 meta/recipes-core/systemd/systemd_219.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 24486f1..6a8b5b8 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -166,7 +166,9 @@ do_install() {
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
@@ -177,7 +179,9 @@ do_install() {
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


