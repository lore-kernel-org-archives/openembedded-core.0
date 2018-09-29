Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59FA77997A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 06:25:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8T6PJJI015421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 23:25:29 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 23:25:08 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 13:43:52 +0800
Message-ID: <2a442ec9c52896065e9d87e1cf1b58eb22534176.1538199671.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538199671.git.kai.kang@windriver.com>
References: <cover.1538199671.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] libcheck: avoid multilib install file conflict
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
X-List-Received-Date: Sat, 29 Sep 2018 06:25:54 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It has one line different which is a comment in check_stdint.h between
libcheck multilib packages. And then causes install file conflict when
install libcheck and lib32-libcheck at same time.

Remove the comment line from check_stdint.h to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-support/libcheck/libcheck_0.12.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/libcheck/libcheck_0.12.0.bb b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
index e646d43968..9969e27054 100644
--- a/meta/recipes-support/libcheck/libcheck_0.12.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
@@ -16,6 +16,11 @@ inherit autotools pkgconfig texinfo
 
 CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
 
+do_install_append_class-target () {
+    # remove the only one line comment which causes multilib install file conflict
+    sed -i '/^\/\*/ d' ${D}${includedir}/check_stdint.h
+}
+
 RREPLACES_${PN} = "check (<= 0.9.5)"
 RDEPENDS_${PN} += "gawk"
 RDEPENDS_${PN}_class-native = ""
-- 
2.18.0


