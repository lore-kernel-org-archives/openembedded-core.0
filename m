Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.5526.1594364688261923598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 00:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 06A74kc6000905
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 00:04:46 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Fri, 10 Jul 2020 00:04:46 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3] netbase: use git fetcher
Date: Fri, 10 Jul 2020 15:01:47 +0800
Message-ID: <20200710070147.2910367-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <161F1A6116A44000.17108@lists.openembedded.org>
References: <161F1A6116A44000.17108@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Use git repo as the the previous URL only stores the latest
source file and fails to locate the source tar file if we
don't upgrade timely.
---
 meta/recipes-core/netbase/netbase_6.1.bb | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/netbase/netbase_6.1.bb b/meta/recipes-core/netbase/netbase_6.1.bb
index bc0049c0201..491e6bf4cbf 100644
--- a/meta/recipes-core/netbase/netbase_6.1.bb
+++ b/meta/recipes-core/netbase/netbase_6.1.bb
@@ -6,10 +6,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PE = "1"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "git://salsa.debian.org/md/netbase.git;protocol=https"
+SRCREV = "0fc1e4ce39328f7388badace0aaf7b7294d5ed61"
 
-SRC_URI[md5sum] = "e5871a3a5c8390557b8033cf19316a55"
-SRC_URI[sha256sum] = "084d743bd84d4d9380bac4c71c51e57406dce44f5a69289bb823c903e9b035d8"
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 do_install () {
@@ -18,3 +18,16 @@ do_install () {
 	install -m 0644 ${S}/etc/protocols ${D}${sysconfdir}/protocols
 	install -m 0644 ${S}/etc/services ${D}${sysconfdir}/services
 }
+
+# The reproducible test failed in autobuilder env as
+# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200630-_jn1koza/packages/diff-html/
+# But I didn't reproduce it locally when run "oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds"
+# Per the logic in meta/classes/reproducible_build.bbclass, it should use
+# get_source_date_epoch_from_git to get the SOURCE_DATE_EPOCH after we
+# switch to use git fetcher, don't understand why the SOURCE_DATE_EPOCH
+# is different between reproducibleA and reproducibleB during reproducible
+# test in autobuilder env. The only difference is reproducibleA use sstate
+# but reproducibleB not. Maybe the sstate in autobuilder env has some problem?
+# Anyway, use the default value for SOURCE_DATE_EPOCH from meta/classes/reproducible_build_simple.bbclass
+# to fix the gap as a workaround.
+export SOURCE_DATE_EPOCH = "1520598896"
-- 
2.26.2

