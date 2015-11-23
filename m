Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C720C60617
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 13:42:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tANDgXI1019128
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 05:42:33 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 Nov 2015 05:41:32 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Nov 2015 05:41:31 -0800
Message-ID: <991915823dfa6b4cabe990272b246cf4bad05038.1448285591.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448285591.git.liezhi.yang@windriver.com>
References: <cover.1448285591.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package_manager.py: fix RPM_PREFER_ELF_ARCH for mips
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
X-List-Received-Date: Mon, 23 Nov 2015 13:42:32 -0000
Content-Type: text/plain

We can install 64 bit pkg to 32 bit pkg, so the previous checking is
incorrect, it should not only check mips64 or mips64el, the "mips"
should work, and 64bit ELF can also use mips as TUNE_ARCH, and there
are other mips varieties, so only check whether TUNE_ARCH starts with
mips or not.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/package_manager.py |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 964fddc..5e7bb66 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -954,12 +954,11 @@ class RpmPM(PackageManager):
                 bb.fatal("Invalid RPM_PREFER_ELF_ARCH: %s, it should be one of:\n"
                         "\t1: ELF32 wins\n"
                         "\t2: ELF64 wins\n"
-                        "\t4: ELF64 N32 wins (mips64 or mips64el only)" %
+                        "\t4: ELF64 N32 wins (mips only)" %
                         prefer_color)
-            if prefer_color == "4" and self.d.getVar("TUNE_ARCH", True) not in \
-                                    ['mips64', 'mips64el']:
-                bb.fatal("RPM_PREFER_ELF_ARCH = \"4\" is for mips64 or mips64el "
-                         "only.")
+            if prefer_color == "4" and not \
+                    self.d.getVar("TUNE_ARCH", True).startswith('mips'):
+                bb.fatal("RPM_PREFER_ELF_ARCH = \"4\" is for mips only.")
             self._invoke_smart('config --set rpm-extra-macros._prefer_color=%s'
                         % prefer_color)
 
-- 
1.7.9.5


