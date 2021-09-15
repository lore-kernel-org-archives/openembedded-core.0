Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.3194.1631679603236256612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 21:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: liezhi.yang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18F4Jsmv016085
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 21:19:55 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 21:19:53 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 14 Sep 2021 21:19:53 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 14 Sep 2021 21:19:53 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <qi.chen@windriver.com>
Subject: [meta-iot-cloud][PATCH 1/1] python3-awscrt: Fix build with usrmerge
Date: Tue, 14 Sep 2021 21:19:52 -0700
Message-ID: <20210915041952.123945-2-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915041952.123945-1-liezhi.yang@windriver.com>
References: <20210915041952.123945-1-liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Issue: LIN1021-1466

Fixed:
DISTRO_FEATURES_append = ' usrmerge'
$ bitbake python3-awscrt

CMake Error at CMakeLists.txt:191 (add_library):
  Target "s2n" links to target "LibCrypto::Crypto" but the target was not
  found.  Perhaps a find_package() call is missing for an IMPORTED target, or
  an ALIAS target is missing?

(LOCAL REV: NOT UPSTREAM) - Send to upstream on 20210914

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 recipes-aws/python/python3-awscrt_0.10.8.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-aws/python/python3-awscrt_0.10.8.bb b/recipes-aws/python/python3-awscrt_0.10.8.bb
index 6f44e4c..829f4ac 100644
--- a/recipes-aws/python/python3-awscrt_0.10.8.bb
+++ b/recipes-aws/python/python3-awscrt_0.10.8.bb
@@ -28,8 +28,7 @@ SRC_URI[sha256sum] = "c6859e35c57922f175b587e02bfb662ce30a06c9aa688a7303112c91e2
 do_configure_prepend() {
     sed -i \
         -e 's:AWS_LIBCRYPTO_INSTALL = None:AWS_LIBCRYPTO_INSTALL = "${RECIPE_SYSROOT}/usr":' \
+        -e 's:/lib/:/${baselib}/:' \
         ${S}/setup.py
-    if !${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
-        sed -i -e 's:/lib/:${libdir}/:' ${S}/setup.py
     fi
 }
-- 
2.31.1

