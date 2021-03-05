Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7836.1614918119443975246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: DQTgnyS7FKiITYEgN4ZJ2diKy+agGku9C4rOYpmIKIsH7pfwZlOfVYUks2tHv/QmtQzzgLqUgD
 TGlzXJJ5h8KQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670823"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670823"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:01 -0800
IronPort-SDR: Eui+ctzFCJG4hHhuB0PTdYPMvGomGA4Vri08cKsqJBx0mFncETk/AI4E/ZPjnB7a8iGdUF50nY
 3NTUtzz2nRlw==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128752"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:21:59 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 02/52] rootfs_deb: handle aarch64 SDK_ARCH
Date: Fri,  5 Mar 2021 12:20:38 +0800
Message-Id: <81f23701521ca32b67049a14f41079889b102ad5.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

This class maps from OE architectures to dpkg architectures, but wasn't
handling aarch64 correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 315fe8ab3b5bb8a709be98cd8998d4525fbe8725)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/rootfs_deb.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index ef616da229..0469ba7059 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -32,4 +32,8 @@ python () {
          d.setVar('DEB_SDK_ARCH', 'amd64')
     elif darch == "arm":
          d.setVar('DEB_SDK_ARCH', 'armel')
+    elif darch == "aarch64":
+         d.setVar('DEB_SDK_ARCH', 'arm64')
+    else:
+         bb.fatal("Unhandled SDK_ARCH %s" % darch)
 }
-- 
2.29.2

