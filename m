Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16DF16C466
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 02:07:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4G27peK022004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 May 2019 19:07:51 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 15 May 2019 19:07:50 -0700
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <ross.burton@intel.com>, <martin@geanix.com>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 16 May 2019 09:50:12 +0800
Message-ID: <20190516015013.60547-1-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 2.18.1
MIME-Version: 1.0
Subject: [V4][PATCH] sysstat: Add PACKAGECONFIG[cron] for '--enable-install-cron' option
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
X-List-Received-Date: Thu, 16 May 2019 02:07:57 -0000
Content-Type: text/plain

If 'cron' is added into PACKAGECONFIG, for sysvinit, the related
cron scripts will be installed; for systemd, the services of
data collect and summary will be installed.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 0bc7e14d36..79555e6cf3 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -19,6 +19,7 @@ inherit autotools-brokensep gettext systemd
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
+PACKAGECONFIG[cron] = "--enable-install-cron --enable-copy-only,--disable-install-cron --disable-copy-only"
 
 EXTRA_OECONF += "--disable-stripping"
 
@@ -59,7 +60,6 @@ pkg_postinst_${PN} () {
         fi
 }
 
-
-FILES_${PN} += "${libdir}/sa"
+FILES_${PN} += "${libdir}/sa ${systemd_system_unitdir}"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.18.1


