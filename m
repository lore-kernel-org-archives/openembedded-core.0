Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.36802.1614009670915969052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: kPxeWZt6KhApXthllWC70pfH44lkmTU7819+rVfdiui6rT5/ej2tiRUcv7pk/p+yUxV757boPZ
 XL9H54EtYrMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706103"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706103"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:15 -0800
IronPort-SDR: f6Q2JWgJqp9B2nRaJNu468gnvBWAz5LZKEw9TF5hWWMh7d/8wSh1rJSR8D6fdU3KE9GwvoBisR
 V/UMjT4x/Qog==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430302074"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:13 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 24/30] watchdog: Fix determinism issue from sendmail host path
Date: Tue, 23 Feb 2021 00:00:27 +0800
Message-Id: <023e7e667334f5c8a5647eab278262713bfd6555.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The build was injecting the path of the host's sendmail binary. Set
this deterministically to match OE's path for it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 476328b91ea4417160580d28df4fcc1147d85ae2)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/watchdog/watchdog_5.16.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index 1988952603..24a05dcda7 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -28,6 +28,7 @@ CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LDFLAGS += "-ltirpc"
 
 EXTRA_OECONF += " --disable-nfs "
+CACHED_CONFIGUREVARS += "ac_cv_path_PATH_SENDMAIL=${sbindir}/sendmail"
 
 INITSCRIPT_PACKAGES = "${PN} ${PN}-keepalive"
 
-- 
2.29.2

