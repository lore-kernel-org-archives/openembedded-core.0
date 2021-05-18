Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5256.1621321743083135075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 00:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14I792nn025615
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 00:09:02 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 18 May 2021 00:09:02 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Tue, 18 May 2021 00:09:02 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [poky][meta-poky][PATCH] poky.conf: do not use '+' in DISTRO_VERSION
Date: Tue, 18 May 2021 00:09:02 -0700
Message-ID: <20210518070902.89234-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

If '+' is is DISTRO_VERSION and thus in SDKPATH, some sed command
could fail unexpectedly.

e.g.
bitbake nativesdk-xxhash
And we get the following error.
Makefile:422: *** configured libdir (/opt/poky/3.3+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib) is outside of exec_prefix (/opt/poky/3.3+snapshot/sysroots/x86_6\
4-pokysdk-linux/usr), can't generate pkg-config file.  Stop.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-poky/conf/distro/poky.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 522cc92f74..380f50fea5 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -1,6 +1,6 @@
 DISTRO = "poky"
 DISTRO_NAME = "Poky (Yocto Project Reference Distro)"
-DISTRO_VERSION = "3.3+snapshot-${METADATA_REVISION}"
+DISTRO_VERSION = "3.3-snapshot-${METADATA_REVISION}"
 DISTRO_CODENAME = "master"
 SDK_VENDOR = "-pokysdk"
 SDK_VERSION = "${@d.getVar('DISTRO_VERSION').replace('snapshot-${METADATA_REVISION}', 'snapshot')}"
-- 
2.30.2

