Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 008DD6012C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 14:37:22 +0000 (UTC)
Received: by wmec201 with SMTP id c201so163662784wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 06:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0cU63xlmpQ1Md2AYEhaowsBaz2sKkAcUwe0WdWYpV3w=;
	b=E5vHzIfvOv2nrEqGgDfjFRjIcl5f2yoMop0JfRrerxhlTHN2bngvAWSA6CL5l+F984
	2TV9kW1dOeLooR2FeQqpNF45FtXLrSGZjEu0xraBEOwPFTyDZ/EFGkhYVF8x2fqISKil
	iO1d05fmtkVC0plUYgoVu5jNSKFzplstdk4SDIYUP0wyPO6yDnevbDqjUgP0NkoUByQM
	jk0ELZLmQ1gTSk5inWweRESeNq5Ve6ZsS9g5ShLbwAf/5ZgQ3qmPmG0cwwD17CTW18qz
	jg8rU8yejws4HlhbGKDAJVbupsxZx6jKRoZn5wYFFPSqhRjR3D3b3kb/4PpnCHHxSiI7
	ZBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0cU63xlmpQ1Md2AYEhaowsBaz2sKkAcUwe0WdWYpV3w=;
	b=dhR4J+chaUVEx0gYCkYB97g7wQoUwOmo42x5pK37gjdWBnGPuTarieUjnWlwbKnrpC
	3hLZnSbIwqOeuvVcx9TjNZWWo5TsEmLyIPIavAtiv1kWwpqY7v2gyNXs2gO5R0TFuw8J
	kdbKr9b63eZvORUoA78+6X0ukRRnpTmBubbPuSqEkHORrfOfSUIV7quL0YtntP2LkwNi
	YZtHSAp4MkBkF0E6bszVyolKW+YkAWMw33z7Lq1FvfA+UR6Nk0mxdFE/f37+YQEuBira
	RtErYsMGNXOpE2z3l1nLbD6S+UyvM1oZDbhlHsEtqf6w4IK/cty3TU+sF449NuW9aO+Q
	Q2FQ==
X-Gm-Message-State: ALoCoQkCkUlHrgsU47mOPHdYd2ZHmnljyFVKyJFrzRLkkcHheuzKol9lmVUABXP9Wmo2ABiNGmzx
X-Received: by 10.28.176.200 with SMTP id z191mr17735281wme.102.1448289442912; 
	Mon, 23 Nov 2015 06:37:22 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id bh6sm2575137wjb.0.2015.11.23.06.37.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Nov 2015 06:37:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 14:28:39 +0000
Message-Id: <1448288921-23123-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][jethro 1/3] binutils: Fix octeon3 disassembly patch
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
X-List-Received-Date: Mon, 23 Nov 2015 14:37:23 -0000

From: Mark Hatle <mark.hatle@windriver.com>

The structure has apparently changed, and there was a missing
setting.  This corrects a segfault when disassembling code.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch b/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
index 6108c0d..4e8c69f 100644
--- a/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
+++ b/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
@@ -229,7 +229,7 @@ Index: git/opcodes/mips-dis.c
 +  { "octeon3",   1, bfd_mach_mips_octeon3, CPU_OCTEON3,
 +    ISA_MIPS64R2 | INSN_OCTEON3, ASE_VIRT | ASE_VIRT64,
 +    mips_cp0_names_numeric,
-+    NULL, 0, mips_hwr_names_numeric },
++    NULL, 0, mips_cp1_names_mips3264, mips_hwr_names_numeric },
 +
    { "xlr", 1, bfd_mach_mips_xlr, CPU_XLR,
      ISA_MIPS64 | INSN_XLR, 0,
-- 
2.1.4


