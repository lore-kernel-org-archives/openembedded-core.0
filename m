Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.6656.1624355461602327474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 02:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Efpaeb6Rlo20lKbqZWc47WXRFAZZ0wX/TGLka+TLunjiHAJSNGg00K2rugEL7bi81gTujc6+nI
 TEKAUGRL/F8w==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="204014065"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="204014065"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:50:56 -0700
IronPort-SDR: QznPOWCeoYv9bsCUrB3fBcuQWsX980xWXwmSb2qgQCKazS0gbJA9lyhLxtGEIOacrWQw0alyxh
 rwjzfM2V9SWQ==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="423260016"
Received: from leexiaoy-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.150.96])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:50:55 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/13] util-linux.inc: Do not modify BPN
Date: Tue, 22 Jun 2021 17:50:22 +0800
Message-Id: <28a0e2cd75619ecc76293da145a81ae44f3f496f.1624352878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624352878.git.anuj.mittal@intel.com>
References: <cover.1624352878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Changing BPN to be "util-linux" regardless if it is the util-linux
recipe or the util-linux-libuuid recipe that is being built was an
easy way to allow ${BPN} and ${BP} to be used in the SRC_URI for both
recipes. However, it causes problems for native.bbclass where there
are expectations that ${BPN} and ${PN} match each other.

Use "util-linux" directly in the SRC_URI instead to avoid the problem.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 701ef7ff0e1b17150424a64acfafbb83f518f9c9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index cbf6102ee0..6b47f417aa 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -27,8 +27,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/util-linux:"
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
-BPN = "util-linux"
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
            file://configure-sbindir.patch \
            file://runuser.pamd \
            file://runuser-l.pamd \
-- 
2.31.1

