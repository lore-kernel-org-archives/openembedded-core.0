Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 49C8171AFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:47:41 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 87E8CCC190318
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:47:39 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Wed, 23 Nov 2016 13:47:42 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2016 13:47:29 +0000
Message-ID: <20161123134733.38276-4-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123134733.38276-1-Zubair.Kakakhel@imgtec.com>
References: <20161123134733.38276-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch 3/7] valgrind: Use MIPS MACHINE_OVERRIDES
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
X-List-Received-Date: Wed, 23 Nov 2016 13:47:42 -0000
Content-Type: text/plain

The mipsarch* MACHINE_OVERRIDES can be used to pass the same
parameters to MIPS pre-R2 and R6 ISA variants.

Use them to reduce duplication in supporting MIPS R6 ISA.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index 2474bbc..637b723 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -36,8 +36,11 @@ COMPATIBLE_HOST_armv4 = 'null'
 COMPATIBLE_HOST_armv5 = 'null'
 COMPATIBLE_HOST_armv6 = 'null'
 
-# valgrind doesn't like mips soft float
-COMPATIBLE_HOST_mipsarch = "${@bb.utils.contains("TARGET_FPU", "soft", "null", ".*-linux", d)}"
+# Disable for some MIPS variants
+COMPATIBLE_HOST_mipsarcho32 = "${@bb.utils.contains("TARGET_FPU", "soft", "null", ".*-linux", d)}"
+COMPATIBLE_HOST_mipsarchn32 = 'null'
+COMPATIBLE_HOST_mipsarchn64 = "${@bb.utils.contains("TARGET_FPU", "soft", "null", ".*-linux", d)}"
+COMPATIBLE_HOST_mipsarchr6 = 'null'
 
 inherit autotools ptest
 
-- 
2.10.2


