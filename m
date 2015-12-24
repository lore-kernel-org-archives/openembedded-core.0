Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 25C2270030
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 10:00:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBOA0wDI018907
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 02:00:59 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 02:00:58 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Dec 2015 17:47:54 +0800
Message-ID: <1cc4c701228bffaf1e86f71973cbfc8f20d1793d.1450950403.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1450950403.git.kai.kang@windriver.com>
References: <cover.1450950403.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gccmakedep: fix buildpaths qa check
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
X-List-Received-Date: Thu, 24 Dec 2015 10:00:59 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When enable "buildpaths" QA check, it fails to build gccmakedep:

| ERROR: QA Issue: File
| work/mips64-poky-linux/gccmakedep/1_1.0.3-r3/packages-split/gccmakedep/usr/bin/gccmakedep
| in package contained reference to tmpdir [buildpaths]

Remove build related path to fix this issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/xorg-util/gccmakedep_1.0.3.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-util/gccmakedep_1.0.3.bb b/meta/recipes-graphics/xorg-util/gccmakedep_1.0.3.bb
index ccf2f4b..be3a667 100644
--- a/meta/recipes-graphics/xorg-util/gccmakedep_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-util/gccmakedep_1.0.3.bb
@@ -14,4 +14,8 @@ PR = "r3"
 PE = "1"
 
 SRC_URI[md5sum] = "127ddb6131eb4a56fdf6644a63ade788"
-SRC_URI[sha256sum] = "f9e2e7a590e27f84b6708ab7a81e546399b949bf652fb9b95193e0e543e6a548"
\ No newline at end of file
+SRC_URI[sha256sum] = "f9e2e7a590e27f84b6708ab7a81e546399b949bf652fb9b95193e0e543e6a548"
+
+do_install_append() {
+	sed -i "s,--sysroot=${STAGING_DIR_TARGET},," ${D}${bindir}/gccmakedep
+}
-- 
2.6.1


