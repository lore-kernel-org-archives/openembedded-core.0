Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.web10.1248.1594402883057506886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 10:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=gTrcV6Hy;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1145; q=dns/txt; s=iport;
  t=1594402882; x=1595612482;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6BBfLzZQjSqISxB1Bgxo10MOI4aTNDbLY8+V9raQK84=;
  b=gTrcV6HyLsNq3xSChY4XuAAqn+zvh45pnLfZISjFLSRfNRv4EQq1c4re
   Q3Mm5rodY7vC1e6CJ8O3LGJN9ti9U9nyGrbLZbnlAgVb39Gth9n610RMl
   OoYuuAML/ghMh+vKi/g7ISfKmizT2cmIiLdOdUj1IGdSSPqNXWNQQZ235
   Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BeAABTpwhf/5tdJa1gHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQGBeAUBAQsBgilvVAEyLJ9cj3qBfQsBAQEMAQEfEAQBAYRNghg?=
 =?us-ascii?q?CJDYHDgIDAQELAQEFAQEBAgEGBG2FZ4YoARgBLSmBFRODJgGCVyWpLIIohA0?=
 =?us-ascii?q?BgUODVoFAFIEkAYgBhG8agUE/hF+KMwSbDJoLgmeHVXqQdw8ggnOJNJJ+AS2?=
 =?us-ascii?q?wJgIECwIVgVoKKYFXcBWDJAlHGQ2dBSEDMAI1AgYIAQEDCZAUAQE?=
X-IronPort-AV: E=Sophos;i="5.75,336,1589241600"; 
   d="scan'208";a="787209254"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 10 Jul 2020 17:41:21 +0000
Received: from localhost.localdomain ([10.24.63.201])
	(authenticated bits=0)
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPSA id 06AHfGaT031570
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 10 Jul 2020 17:41:21 GMT
From: "Taras Kondratiuk" <takondra@cisco.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: xe-linux-external@cisco.com,
        OE-core <openembedded-core@lists.openembedded.org>
Subject: [PATCH] nfs-utils: use rpcgen tool from HOSTTOOLS_DIR
Date: Fri, 10 Jul 2020 10:41:16 -0700
Message-Id: <20200710174116.1963251-1-takondra@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: takondra@cisco.com
X-Outbound-SMTP-Client: 10.24.63.201, [10.24.63.201]
X-Outbound-Node: rcdn-core-4.cisco.com
Content-Transfer-Encoding: 8bit

nfs-utils configure searches for rpcgen tool only in default locations:
"/usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen".
On some of our build machines the rpcgen is not present there and
configure fails:
| configure: error: Please install rpcgen or use --with-rpcgen

HOSTTOOLS_DIR already contains a correct pointer to host rpcgen tool, so
use it from there.

Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
index 188a8893b46f..b8ad23a0d814 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
@@ -56,6 +56,7 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                 --disable-gss \
                 --disable-nfsdcltrack \
                 --with-statdpath=/var/lib/nfs/statd \
+                --with-rpcgen=${HOSTTOOLS_DIR}/rpcgen \
                "
 
 PACKAGECONFIG ??= "tcp-wrappers \
-- 
2.25.1

