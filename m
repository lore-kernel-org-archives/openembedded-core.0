Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6944C79CB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 10:13:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3NACW5R029328
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Apr 2019 03:12:42 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 23 Apr 2019 03:12:21 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 23 Apr 2019 06:12:16 -0400
Message-ID: <20190423101216.188441-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] webkitgtk: fix compile error for arm64
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
X-List-Received-Date: Tue, 23 Apr 2019 10:13:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It removes function JSC::AssemblerBuffer::data() for ARM64 in commit
https://trac.webkit.org/changeset/236589/webkit. But it is required by
Cortex A53 from https://trac.webkit.org/changeset/175514/webkit and
fails to compile for arm64:

| .../tmp/work/aarch64-poky-linux/webkitgtk/2.24.0-r0/webkitgtk-2.24.0/Source/JavaScriptCore/assembler/ARM64Assembler.h:3769:100: error: 'class JSC::AssemblerBuffer' has no member named 'data'
|     if (UNLIKELY((*reinterpret_cast_ptr<int32_t*>(reinterpret_cast_ptr<char*>(m_buffer.data()) + m_buffer.codeSize() - sizeof(int32_t)) & 0x0a000000) == 0x08000000))

Not set WTF_CPU_ARM64_CORTEXA53 for arm64 to fix the failure.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.24.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
index 4a82dae9ef..54daa217bb 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
@@ -92,8 +92,6 @@ EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
 
-EXTRA_OECMAKE_append_aarch64 = " -DWTF_CPU_ARM64_CORTEXA53=ON"
-
 # JIT not supported on MIPS either
 EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF "
 
-- 
2.20.0


