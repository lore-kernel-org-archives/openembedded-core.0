Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10EBD6C1C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 14:02:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8OE1NS2010092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 07:02:00 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 24 Sep 2019 07:01:19 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Sep 2019 10:01:18 -0400
Message-ID: <20190924140118.6651-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] nativesdk-dnf: ensure installed systemd files are shipped
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
X-List-Received-Date: Tue, 24 Sep 2019 14:02:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

"bitbake nativesdk-dnf" throws a QA warning if the contents of
${base_libdir}/systemd/system/ are not shipped, so add them.

Warning log:

    WARNING: nativesdk-dnf-4.2.2-r0 do_package: QA Issue: nativesdk-dnf: Files/directories were installed but not shipped in any package:
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic.timer
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-makecache.timer
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic.service
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-makecache.service
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic-notifyonly.timer
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic-download.service
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic-download.timer
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic-notifyonly.service
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic-install.timer
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic-install.service
    Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
    nativesdk-dnf: 13 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-devtools/dnf/dnf_4.2.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index c77773332c..7ea454a8f6 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -74,6 +74,9 @@ do_install_append_class-nativesdk() {
                 RPM_NO_CHROOT_FOR_SCRIPTS=1 
 }
 
+# Ensure installed systemd files are shipped when building nativesdk-dnf
+FILES_${PN} += "${base_libdir}/systemd/system/*"
+
 SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
                          dnf-automatic.service dnf-automatic.timer \
                          dnf-automatic-download.service dnf-automatic-download.timer \
-- 
2.21.0


