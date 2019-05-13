Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A350E7DFF4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 09:53:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4D9rRq5010076
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 02:53:27 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 13 May 2019 02:53:26 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 May 2019 05:52:55 -0400
Message-ID: <20190513095255.157287-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190513095255.157287-1-kai.kang@windriver.com>
References: <20190513095255.157287-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] webkitgtk: fix compile error for arm64
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
X-List-Received-Date: Mon, 13 May 2019 09:53:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It removes function JSC::AssemblerBuffer::data() for ARM64 in commit
https://trac.webkit.org/changeset/236589/webkit. But the function is
still required by Cortex A53 and fails to compile for arm64:

| .../tmp/work/aarch64-poky-linux/webkitgtk/2.24.1-r0/webkitgtk-2.24.1/Source/JavaScriptCore/assembler/ARM64Assembler.h:3769:100: error: 'class JSC::AssemblerBuffer' has no member named 'data'
|     if (UNLIKELY((*reinterpret_cast_ptr<int32_t*>(reinterpret_cast_ptr<char*>(m_buffer.data()) + m_buffer.codeSize() - sizeof(int32_t)) & 0x0a000000) == 0x08000000))

Not set WTF_CPU_ARM64_CORTEXA53 for arm64 to fix the failure.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.24.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
index 771a893a6b..a57a3c058c 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
@@ -98,8 +98,6 @@ EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
 
-EXTRA_OECMAKE_append_aarch64 = " -DWTF_CPU_ARM64_CORTEXA53=ON"
-
 # JIT not supported on MIPS either
 EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF "
 
-- 
2.20.0


