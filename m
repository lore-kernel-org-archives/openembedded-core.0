Return-Path: <bruno.bottazzini@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AE39C73C7E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 21:43:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 04 May 2015 14:43:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,368,1427785200"; d="scan'208";a="566176083"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by orsmga003.jf.intel.com with ESMTP; 04 May 2015 14:43:38 -0700
Received: from orsmsx154.amr.corp.intel.com (10.22.226.12) by
	ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 4 May 2015 14:43:38 -0700
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX154.amr.corp.intel.com (10.22.226.12) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 4 May 2015 14:43:38 -0700
Received: from localhost.localdomain (10.218.98.31) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 4 May 2015 14:43:36 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 May 2015 18:43:23 -0300
Message-ID: <1430775804-30845-3-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.3.7
In-Reply-To: <1430775804-30845-1-git-send-email-bruno.bottazzini@intel.com>
References: <1430775804-30845-1-git-send-email-bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.98.31]
Subject: [PATCH V2 2/3] systemd: Verify if journal-flush.service exists.
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
X-List-Received-Date: Mon, 04 May 2015 21:43:48 -0000
Content-Type: text/plain

If the users wants to enable networkd this file will not be generate and the
installation will fail.

Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
---
 meta/recipes-core/systemd/systemd_219.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index c196017..b4bff18 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -177,8 +177,11 @@ do_install() {
 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
 	# its needed in 216 upstream has fixed it with 919699ec301ea507edce4a619141ed22e789ac0d
 	# don't order journal flushing afte remote-fs.target
-	sed -i -e 's/ remote-fs.target$//' ${D}${systemd_unitdir}/system/systemd-journal-flush.service
-	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
+	if [ -s ${D}${systemd_unitdir}/system/systemd-journal-flush.service ]; then
+                # this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
+                sed -i -e 's/ remote-fs.target$//' ${D}${systemd_unitdir}/system/systemd-journal-flush.service
+        fi
+
 	# for existence else it fails
 	if [ -s ${D}${libdir}/tmpfiles.d/systemd.conf ]; then
 		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${libdir}/tmpfiles.d/systemd.conf', d)}
-- 
2.3.7


