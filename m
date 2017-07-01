Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id E2A8C78292
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:23:52 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id e7so80224413pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tG4bJD4h2vkzUkRHQptbCqLK/n+3DxBBzMBIflJOOP0=;
	b=jzsg7ZpuUNAqV0LsLkVbnOZNo1vowZs+Z41/pwIrT3q3SM1zjXazd+ekxQvE3/wx9K
	5qpvOKfZ5iiDebuMskxRhbE9uKbnlQBtAUhIuSP5NPNmbh1046fL1KMmTTTF9fyu7PmV
	j0qap2oKflrqjyo16K2v2OrSOMkWiRiGrecRHpvJNVyrzL+H5bnnNKlv8QMtISCvyskj
	W7zLw9BSNntHseLPUC1mzu78MZvxnC/J3JjpgC8hchX3gHsiwKqXJ3r8DmZ7G+cdraM/
	1yHo4AmtgaFY6sctCIoipOhhY8fjAAkjiQFAuCJavqWW7sofsfTvIthlZRLDS/Q918LQ
	tj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tG4bJD4h2vkzUkRHQptbCqLK/n+3DxBBzMBIflJOOP0=;
	b=PnJL8H7/PXDaSOGjI0/ZJef2FMBCej9qWFkWN62FOSAkTp/Yst43I0kZek85sWIqPT
	cRAOkY0GsccdT4cadB23+vBAOMURlwrkJ+3celSsDf/R1p+LJjcrALl2X9ykAJHHLmAm
	U9U8cPS0q4k37KYUGw/SNMYYfng4yEMTfQVeYHjPfWSUBiTwhs4ZlNDnGck5UsThEp6V
	dR1VyuXLeBkBMTzU0QBsB1lnVKuKxq1wFPWGbxC/auhAGliO6+zdFkSSGfJs8KzevKm5
	vdmy/UQgX1C5tBZSrcIlGda6ihRe73rCo3JwKGp7qrG5pqBhOY9JNkmJdsuTCguJnYLw
	BeoQ==
X-Gm-Message-State: AIVw1100cYoT1Yuza5EYbnYg5IoIv8IGXhyC5Rt1JkNj7m/VmV9njOIh
	noJrvWR2uydPx62Z
X-Received: by 10.84.225.5 with SMTP id t5mr977694plj.108.1498919033586;
	Sat, 01 Jul 2017 07:23:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	17sm25026909pfn.84.2017.07.01.07.23.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:23:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:13 -0700
Message-Id: <6fb62a7b3030d5cc0264d6a41a9a2d4e49f2a8dc.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498893436.git.raj.khem@gmail.com>
References: <cover.1498893436.git.raj.khem@gmail.com>
Subject: [PATCH 10/19] libunwind: We set -fPIE in security flags now if gcc is not configured for default PIE
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
X-List-Received-Date: Sat, 01 Jul 2017 14:23:53 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind_1.2.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind_1.2.bb b/meta/recipes-support/libunwind/libunwind_1.2.bb
index e598e40c6f..c6312f24fd 100644
--- a/meta/recipes-support/libunwind/libunwind_1.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.2.bb
@@ -21,8 +21,4 @@ EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests "
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-# see https://sourceware.org/bugzilla/show_bug.cgi?id=19987
-SECURITY_CFLAGS_remove_aarch64 = "-fpie"
-SECURITY_CFLAGS_append_aarch64 = " -fPIE"
-
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-- 
2.13.2


