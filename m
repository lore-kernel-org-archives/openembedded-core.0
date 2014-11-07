Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 622416AC6B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 07:57:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA77vBgP006895
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 23:57:11 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 6 Nov 2014 23:57:11 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 15:57:02 +0800
Message-ID: <c9e08dddf533f34459fc1fbe15904a2293c98f81.1415346812.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415346812.git.hongxu.jia@windriver.com>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] oprofileui: use oprofileui-viewer as oprofileui's provider
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
X-List-Received-Date: Fri, 07 Nov 2014 07:57:13 -0000
Content-Type: text/plain

The package oprofileui does not exist, so we use oprofileui-viewer as
the provider. It avoids the do_rootfs failure while IMAGE_INSTALL +=
"oprofileui"

Use ${PN} to instead of the hardcoded oprofileui.

[YOCTO #6937]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/oprofile/oprofileui_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofileui_git.bb b/meta/recipes-kernel/oprofile/oprofileui_git.bb
index bb69d54..ed6ab93 100644
--- a/meta/recipes-kernel/oprofile/oprofileui_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui_git.bb
@@ -11,7 +11,8 @@ SRC_URI = "git://git.yoctoproject.org/oprofileui"
 
 EXTRA_OECONF += "--enable-client --disable-server"
 
-PACKAGES =+ "oprofileui-viewer"
+PACKAGES =+ "${PN}-viewer"
+RPROVIDES_${PN}-viewer = "${PN}"
 
-FILES_oprofileui-viewer = "${bindir}/oparchconv ${bindir}/oprofile-viewer ${datadir}/applications/ ${datadir}/oprofileui/ ${datadir}/icons"
-RDEPENDS_oprofileui-viewer = "oprofile"
+FILES_${PN}-viewer = "${bindir}/oparchconv ${bindir}/oprofile-viewer ${datadir}/applications/ ${datadir}/oprofileui/ ${datadir}/icons"
+RDEPENDS_${PN}-viewer = "oprofile"
-- 
1.9.1


