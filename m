Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D9E0770FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:04:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4I940p3027362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 02:04:00 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 May 2016 02:03:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 02:03:59 -0700
Message-ID: <4d1dd04acc6195e8e498741a36b67b208c62b32b.1463562174.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1463562174.git.liezhi.yang@windriver.com>
References: <cover.1463562174.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] webkitgtk: turn off JIT on armv4 and armv7a
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
X-List-Received-Date: Wed, 18 May 2016 09:04:01 -0000
Content-Type: text/plain

* It doesn't build on armv4:
{standard input}: Assembler messages:
{standard input}:52: Error: selected processor does not support `blx llint_throw_stack_overflow_error' in ARM mode
{standard input}:126: Error: selected processor does not support `bkpt #0' in ARM mode
{standard input}:128: Error: selected processor does not support `blx r0' in ARM mode
{standard input}:134: Error: selected processor does not support `bkpt #0' in ARM mode
{standard input}:185: Error: selected processor does not support `blx llint_throw_stack_overflow_error' in ARM mode
{standard input}:256: Error: selected processor does not support `blx r4' in ARM mode
{standard input}:310: Error: selected processor does not support `movw r2,#:lower16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
{standard input}:311: Error: selected processor does not support `movt r2,#:upper16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
{standard input}:315: Error: selected processor does not support `movw r2,#:lower16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
{standard input}:316: Error: selected processor does not support `movt r2,#:upper16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
[snip]

* It can build on armv7a, but doesn't work on runtime, cause
  displaying problems or ephiphany hang.

[YOCTO #9474]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.12.1.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
index bdbcbea..23ead72 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
@@ -62,9 +62,14 @@ EXTRA_OECMAKE = " \
 EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_powerpc64 = " -DENABLE_JIT=OFF "
 
-# ARM JIT code does not build on ARMv5/6 anymore, apparently they test only on v7 onwards
+# ARM JIT code does not build on ARMv4/5/6 anymore
 EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=OFF "
+EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
+
+# ARM JIT can build on armv7a, but doesnt' work on runtime, cause
+# displaying problems or ephiphany hang.
+EXTRA_OECMAKE_append_armv7a = " -DENABLE_JIT=OFF "
 
 # binutils 2.25.1 has a bug on aarch64:
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
-- 
2.7.4


