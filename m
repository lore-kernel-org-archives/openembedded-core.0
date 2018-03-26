Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
	by mail.openembedded.org (Postfix) with ESMTP id 0346A78226
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 05:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3681; q=dns/txt; s=iport;
	t=1522042941; x=1523252541;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=DjPou3zojY6MrIk6CduBDIdnBS+MxorGSYPw5Re6FVE=;
	b=KvPk2LtJvw5ycQKPsfyFb59CIoESN1JbnLWH3r+Q2+Soj0WG21Irtd48
	FpzVdKM5dheo/kPgjzLVq7zPFpxl3OQW0X4BPg5G0xc8xKzg1Wxbgrqgd
	Ew4p8zff1QlH4v21ouXCM6VQIHBTosdgi8R6JdUo8qnAKs8LsBsZzH0JF k=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DtAAD3hrha/5tdJa1eGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNBgVEog1yIAI0Ngmkcjj6EExSBcguFBQKDdiE0GAECAQE?=
	=?us-ascii?q?BAQEBAmsohSUBKQQLAUYsAwECAwImAkgJGAmFDqtXgWs1hFiDZ4IagQiGUII?=
	=?us-ascii?q?UgQyCU4R0ARIBgyCCVAOMV4poCI4xAow2ASuPJAIREwGBJRw4YXFNIxWCfRO?=
	=?us-ascii?q?CDhiOFiEfMI1tgjcBAQ?=
X-IronPort-AV: E=Sophos;i="5.48,363,1517875200"; d="scan'208";a="361949754"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
	by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Mar 2018 05:42:20 +0000
Received: from kamensky-w541.cisco.com ([10.24.23.119]) (authenticated bits=0)
	by rcdn-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id w2Q5g7Sq025286
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Mon, 26 Mar 2018 05:42:20 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Mar 2018 22:42:07 -0700
Message-Id: <1522042927-29046-1-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Authenticated-User: kamensky@cisco.com
Subject: [PATCH] qemu: fix qemuarm64 intermediate kernel hang in raid6_select_algo func
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
X-List-Received-Date: Mon, 26 Mar 2018 05:42:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport fix from qemu mainline for intermediate qemuarm64 hang
issue. Root caused in OE environment, issue with aarch64 qemu
logic of executing instructions that reenabe interrupts. See patch
commit message for more details.

Upstream-Status: Backport
Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 ...te-a64-treat-DISAS_UPDATE-as-variant-of-D.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch b/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
new file mode 100644
index 0000000..f90cae6
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
@@ -0,0 +1,67 @@
+From a75a52d62418dafe462be4fe30485501d1010bb9 Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Fri, 23 Mar 2018 18:26:45 +0000
+Subject: [PATCH] arm/translate-a64: treat DISAS_UPDATE as variant of
+ DISAS_EXIT
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In OE project 4.15 linux kernel boot hang was observed under
+single cpu aarch64 qemu. Kernel code was in a loop waiting for
+vtimer arrival, spinning in TC generated blocks, while interrupt
+was pending unprocessed. This happened because when qemu tried to
+handle vtimer interrupt target had interrupts disabled, as
+result flag indicating TCG exit, cpu->icount_decr.u16.high,
+was cleared but arm_cpu_exec_interrupt function did not call
+arm_cpu_do_interrupt to process interrupt. Later when target
+reenabled interrupts, it happened without exit into main loop, so
+following code that waited for result of interrupt execution
+run in infinite loop.
+
+To solve the problem instructions that operate on CPU sys state
+(i.e enable/disable interrupt), and marked as DISAS_UPDATE,
+should be considered as DISAS_EXIT variant, and should be
+forced to exit back to main loop so qemu will have a chance
+processing pending CPU state updates, including pending
+interrupts.
+
+This change brings consistency with how DISAS_UPDATE is treated
+in aarch32 case.
+
+CC: Peter Maydell <peter.maydell@linaro.org>
+CC: Alex Bennée <alex.bennee@linaro.org>
+CC: qemu-stable@nongnu.org
+Suggested-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Message-id: 1521526368-1996-1-git-send-email-kamensky@cisco.com
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Upstream-Status: Backport
+---
+ target/arm/translate-a64.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
+index 31ff047..327513e 100644
+--- a/target/arm/translate-a64.c
++++ b/target/arm/translate-a64.c
+@@ -13378,12 +13378,12 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
+         case DISAS_UPDATE:
+             gen_a64_set_pc_im(dc->pc);
+             /* fall through */
+-        case DISAS_JUMP:
+-            tcg_gen_lookup_and_goto_ptr();
+-            break;
+         case DISAS_EXIT:
+             tcg_gen_exit_tb(0);
+             break;
++        case DISAS_JUMP:
++            tcg_gen_lookup_and_goto_ptr();
++            break;
+         case DISAS_NORETURN:
+         case DISAS_SWI:
+             break;
+-- 
+2.7.4
+
-- 
2.7.4


