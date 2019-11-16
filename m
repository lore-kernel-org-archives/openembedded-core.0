Return-Path: <zhengjunling@huawei.com>
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9607F369
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 14:12:23 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id E0C4F8B8725BCB51B02B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 22:12:22 +0800 (CST)
Received: from HULK-Android.huawei.com (10.113.189.218) by
	DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server
	id 14.3.439.0; Sat, 16 Nov 2019 22:12:14 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 16 Nov 2019 22:12:13 +0800
Message-ID: <20191116141213.21526-1-zhengjunling@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.113.189.218]
X-CFilter-Loop: Reflected
Cc: wangnan0@huawei.com
Subject: [PATCH v2] staging.bbclass: Fix wrong library paths in sysroot_strip
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
X-List-Received-Date: Sat, 16 Nov 2019 14:12:25 -0000
Content-Type: text/plain

Do not reset libdir and base_libdir in sysroot_strip, and just pass crude
paths as they will be reset later in strip_execs.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
v2:
 - Fix undefined variable error.

 meta/classes/staging.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index cca0b7e0d6..7e108950f5 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -75,8 +75,8 @@ python sysroot_strip () {
 
     dstdir = d.getVar('SYSROOT_DESTDIR')
     pn = d.getVar('PN')
-    libdir = os.path.abspath(dstdir + os.sep + d.getVar("libdir"))
-    base_libdir = os.path.abspath(dstdir + os.sep + d.getVar("base_libdir"))
+    libdir = d.getVar("libdir")
+    base_libdir = d.getVar("base_libdir")
     qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split()
     strip_cmd = d.getVar("STRIP")
 
-- 
2.17.1


