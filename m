Return-Path: <dbaryshkov@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id C419265CBF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 14:02:45 +0000 (UTC)
Received: by laar3 with SMTP id r3so41518111laa.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 07:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r3hfvXfOYqwFdtFiAZvUH6IqR8LjL7ZZeZs9hddGYg0=;
	b=C1tXYA1iBgcaIeHCQGCj2THVAjB/JzfREBP1o9Cn/qvCmUY8wV7HTATAvW4SMLCBLu
	rFKCNyNpdwN70uENO12+sVs0xVksU0RfAmji6cCbcLVCEMDPuWbqRddc0laJxnG8y7mx
	wT4lhru0OXQt9gdsOzaQf7Dus8W+PECX0xQmq7UyM2VpUYzYIFr+vXgr5fdjw9xVLpwo
	fvrPq1rDExnQ65hRSOZP9yUMK3Q4YumD3HQ4OFzMW/LMWPUQLXLBiWh74pygdhRB4sRq
	f+BOeFGIDgOgvs7zOXx/zCVqKoMjH0JKZFLBl4gWM4d5v56YRZZoOY+0oBthL1ZbXOE8
	GE+A==
X-Received: by 10.112.13.97 with SMTP id g1mr25485790lbc.52.1435759365404;
	Wed, 01 Jul 2015 07:02:45 -0700 (PDT)
Received: from anuminas.office.auriga.msk ([37.153.55.32])
	by mx.google.com with ESMTPSA id du2sm533722lbc.44.2015.07.01.07.02.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 07:02:44 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 17:02:22 +0300
Message-Id: <1435759342-5312-5-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 4/4] glibc: don't override TUNE_CCARGS for MIPS
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
X-List-Received-Date: Wed, 01 Jul 2015 14:02:46 -0000

Overriding TUNE_CCARGS this way breaks MULTILIB setup for MIPS. This
override disables multilib handling of tunes for TUNE_CCARGS, thus
enforcing glibc's TUNE_CCARGS to the TUNE_CCARGS of main DEFAULTTUNE.

Glibc perfectly build without this override for both simple and multilib
cases.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.21.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index 8197c29..52252b3 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -95,16 +95,6 @@ do_patch_append() {
     bb.build.exec_func('do_fix_readlib_c', d)
 }
 
-# for mips glibc now builds syscall tables for all abi's
-# so we make sure that we choose right march option which is
-# compatible with o32,n32 and n64 abi's
-# e.g. -march=mips32 is not compatible with n32 and n64 therefore
-# we filter it out in such case -march=from-abi which will be
-# mips1 when using o32 and mips3 when using n32/n64
-
-TUNE_CCARGS_mips := "${@oe_filter_out('-march=mips32', '${TUNE_CCARGS}', d)}"
-TUNE_CCARGS_mipsel := "${@oe_filter_out('-march=mips32', '${TUNE_CCARGS}', d)}"
-
 do_fix_readlib_c () {
 	sed -i -e 's#OECORE_KNOWN_INTERPRETER_NAMES#${EGLIBC_KNOWN_INTERPRETER_NAMES}#' ${S}/elf/readlib.c
 }
-- 
1.9.1


