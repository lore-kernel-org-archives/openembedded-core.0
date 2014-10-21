Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF407601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 08:19:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9L8JH7T007490
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 01:19:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 21 Oct 2014 01:19:16 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Oct 2014 16:16:40 +0800
Message-ID: <6fe7bbee542ba42ae03304919b3c7abbe63bc8b4.1413879309.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413879309.git.Chong.Lu@windriver.com>
References: <cover.1413879309.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] kmod: fix debuginfo is missing in shared library
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
X-List-Received-Date: Tue, 21 Oct 2014 08:19:17 -0000
Content-Type: text/plain

The INHIBIT_PACKAGE_STRIP should be only for ptest package, else debuginfo will
be missing in shared library.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index d4c21a4..ff58153 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -44,7 +44,7 @@ do_compile_ptest () {
         oe_runmake buildtest-TESTS rootfs
 }
 
-INHIBIT_PACKAGE_STRIP = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", "1", "0", d)}"
+INHIBIT_PACKAGE_STRIP_${PN}-ptest = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", "1", "0", d)}"
 INSANE_SKIP_${PN}-ptest = "arch"
 
 inherit update-alternatives
-- 
1.9.1


