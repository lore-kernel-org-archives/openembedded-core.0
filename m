Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.8600.1628082518332848248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 06:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 174D8boc024550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Aug 2021 06:08:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 4 Aug 2021 06:08:36 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 4 Aug 2021 06:08:36 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] createrepo-c: fix createrepo-c failed in nativesdk
Date: Wed, 4 Aug 2021 21:08:35 +0800
Message-ID: <20210804130835.3316864-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In sdk, call createrepo-c failed with:
...
$ createrepo_c --update ./test_repo/rpm
Directory walk started Critical: Failed to detect compression for file
./test_repo/rpm/cortexa72/hello-2.10-r0.cortexa72.rpm: magic_load() failed: could not find any valid magic files!
...

Since commit [ea666fbc74 createrepo-c: set path to magic database for
native and nativesdk] applied, the MAGIC is incorrectly assigned.

The variable datadir will be expanded automatically for nativesdk,
do not need to add prefix ${SDKPATHNATIVE} to MAGIC

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb
index 206c27c04f..464beaaff4 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb
@@ -33,8 +33,8 @@ do_install_append_class-native() {
 do_install_append_class-nativesdk() {
         create_wrapper ${D}/${bindir}/createrepo_c \
                 RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
-                MAGIC=${SDKPATHNATIVE}${datadir}/misc/magic.mgc
+                MAGIC=${datadir}/misc/magic.mgc
         create_wrapper ${D}/${bindir}/modifyrepo_c \
-                MAGIC=${SDKPATHNATIVE}${datadir}/misc/magic.mgc
+                MAGIC=${datadir}/misc/magic.mgc
         rm -rf ${D}/etc
 }
-- 
2.27.0

