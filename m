Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8FE713A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 10:52:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sABAqDB6020884
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Nov 2014 02:52:13 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 11 Nov 2014 02:52:12 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 11 Nov 2014 18:52:04 +0800
Message-ID: <9b3a697b3a8f4d15a022fd84901437522b6f1a5d.1415699201.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415699201.git.hongxu.jia@windriver.com>
References: <cover.1415699201.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] oprofileui: rename package to use oprofileui to instead of oprofileui-viewer
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
X-List-Received-Date: Tue, 11 Nov 2014 10:52:15 -0000
Content-Type: text/plain

The package oprofileui does not exist, so we use oprofileui-viewer
to instead. It avoids the do_rootfs failure while IMAGE_INSTALL +=
"oprofileui"

For compatibility, let oprofileui to provide oprofileui-viewer and
use ${PN} to instead of the hardcode oprofileui.

[YOCTO #6937]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/oprofile/oprofileui_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofileui_git.bb b/meta/recipes-kernel/oprofile/oprofileui_git.bb
index bb69d54..8448ba3 100644
--- a/meta/recipes-kernel/oprofile/oprofileui_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.yoctoproject.org/oprofileui"
 
 EXTRA_OECONF += "--enable-client --disable-server"
 
-PACKAGES =+ "oprofileui-viewer"
-
-FILES_oprofileui-viewer = "${bindir}/oparchconv ${bindir}/oprofile-viewer ${datadir}/applications/ ${datadir}/oprofileui/ ${datadir}/icons"
-RDEPENDS_oprofileui-viewer = "oprofile"
+# For compatibility, let oprofileui to provide oprofileui-viewer
+RPROVIDES_${PN} = "${PN}-viewer"
+FILES_${PN} += "${datadir}/icons"
+RDEPENDS_${PN} = "oprofile"
-- 
1.9.1


