Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16F9B731F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 07:29:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3B7TQos022937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 00:29:27 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Apr 2016 00:29:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Apr 2016 00:29:13 -0700
Message-ID: <1cb3733027a1cd4389af740593909cf7b8e1070e.1460359568.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1460359568.git.liezhi.yang@windriver.com>
References: <cover.1460359568.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/14] boost: ensure boost to remain an empty metapackage
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
X-List-Received-Date: Mon, 11 Apr 2016 07:29:26 -0000
Content-Type: text/plain

From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>

To ensure that boost remains an empty metapackage after version
updates, we explicitly require boost files to be empty. If new
libraries exist after a version update of the boost recipe,
bitbake will emit a warning at the do_package task. For example,
at the version update from 1.58.0 to 1.59.0, the new timer
library is indicated with:

WARNING: QA Issue: boost: Files/directories were installed but not shipped in any package:
  /usr/lib/libboost_timer.so.1.59.0
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
boost: 1 installed and not shipped files. [installed-vs-shipped]

Ross Burton suggested this improvement on the openembedded-core
mailing list during review of the boost recipe version update [1].

[1] http://lists.openembedded.org/pipermail/openembedded-core/2015-December/114314.html

(From OE-Core master rev: c4e33232db2da3594cc4ba38eea56ee1acb54d3a)

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/boost/boost.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 3288e84..bb49d60 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -59,6 +59,7 @@ FILES_boost-test = "${libdir}/libboost_prg_exec_monitor*.so.* \
 
 # -dev last to pick up the remaining stuff
 PACKAGES += "${PN}-dev ${PN}-staticdev"
+FILES_${PN} = ""
 FILES_${PN}-dev = "${includedir} ${libdir}/libboost_*.so"
 FILES_${PN}-staticdev = "${libdir}/libboost_*.a"
 
-- 
2.7.4


