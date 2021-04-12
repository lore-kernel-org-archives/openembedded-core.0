Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: G+w5Ys3szKBn7giU8N6ma1coUUeAD7/e0PNKaiUfyhhLw78BZfdg67Y3kTwHlSjAwUnsBAcSYn
 EVJ5o4fj3ecQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467969"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467969"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:09:01 -0700
IronPort-SDR: RjtzGHZ6WigmMvTX3GcDancbnrdf05bRFgTYtR5M5n9xqzr5Ybt6AflWCsN9DCfLWtEIGN16jP
 H1JHp5+AjHAg==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809182"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:59 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 18/18] image-live.bbclass: optional depends when ROOTFS empty
Date: Mon, 12 Apr 2021 17:08:26 +0800
Message-Id: <d1283b74cc29d1cbcab56bf1075a244ea5082025.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guillaume Champagne <champagne.guillaume.c@gmail.com>

`ROOTFS` is optional. It can be empty if the live image doesn't require
a rootfs.  In such cases, the build doesn't depend on
`do_image_{LIVE_ROOTFS_TYPE}`.

Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 96f47c39f1d17f073243913d524bde84add41d8f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 9ea5ddc312..47c44b4aad 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -30,7 +30,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         virtual/kernel:do_deploy \
                         ${MLPREFIX}syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot \
-                        ${PN}:do_image_${@d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_')} \
+                        ${@'%s:do_image_%s' % (d.getVar('PN'), d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_')) if d.getVar('ROOTFS') else ''} \
                         "
 
 
-- 
2.30.2

