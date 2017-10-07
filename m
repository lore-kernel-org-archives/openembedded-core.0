Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 589C66079F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Oct 2017 17:29:33 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id u144so8658666pgb.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Oct 2017 10:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZZdFVyX9iGILx0Q6E7kefX78JMFCPfOv2FN8nDyibYA=;
	b=GPOFJQdYbhEcwgFSrLEEOMLN5XX3pBnfXqEYFcSl76HhFqMOiTfv+VLr1dsWzdRS2A
	2K5u/mMWtyFpfQvD63qSGgvwGxd0qynl7W9j8JRewtxvWJ2e1W7NiMCwRZIRFRpY4qYs
	9Hs+wweDghLEZ961yqud3NXsWVus1byKFkm8uUmj1aeV9zSQTyURuOjqhhzhHmL9Aa1B
	3aMFFtFgoCscjjvQtW+l44S3UYXuJJNLGTAbDaHgY3m7gJdi+sPMOvSTC5FaeUm3FGhO
	cObhsgrNoVr3hpHHCodqdM+L6o+KfdImBCPX5GvuBtnPo529xyAPkskys91uC9tGF44p
	qGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZZdFVyX9iGILx0Q6E7kefX78JMFCPfOv2FN8nDyibYA=;
	b=mKc5b9oZALVYXYq2GckVrt75tOtX5RxB6ua7fPm1xSf9zYvqf6Te6H0Dg8uQmpULNy
	wel3QDHmCLAel4c0ubjK2y9lFoPGCwkXInXkW/wZL5yQYxd8wUJ9k1f17H0jNA0UoSKP
	qlpXuzTSYPI6NdTm3ajnYmMzaKfvpmehmUPgU9d9zFi4WwWTANaWzlF/M9olYbLtl2Xm
	TDbQb3EceJw5FcNrcbGdXygPLa5AVusXvm/Dg8ErfGBKbbjE+NDeRO41NdKpC3hYbFtU
	YEW/NL3gmCQgSXZxqol+B3i/8sVGCzG3IV3h2/JgA0RuKDgLjr/UXLRJ+rcQojX6wqwv
	RSIw==
X-Gm-Message-State: AMCzsaXWO95bsWc3dfyUdy7H9ITIgaWxVlFuKwsq4a6rpZq3Dncdq91Z
	ObMIduVVftsio//EkkkXot8RWw==
X-Google-Smtp-Source: AOwi7QC8Z59O5ub/KrQQbkVjJgrpvI2up8Un2GPLLJUpXgOSKBC/+UYNd6USMRT8jmFQUdrvlr6Btg==
X-Received: by 10.84.235.76 with SMTP id g12mr5147352plt.338.1507397375172;
	Sat, 07 Oct 2017 10:29:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3e99])
	by smtp.gmail.com with ESMTPSA id
	c16sm9546329pfj.123.2017.10.07.10.29.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Oct 2017 10:29:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Oct 2017 10:29:23 -0700
Message-Id: <20171007172923.36429-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH] gcc-6.3: Backport patch to fix ICE on ARM
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
X-List-Received-Date: Sat, 07 Oct 2017 17:29:34 -0000

Fixes
internal compiler error: Max. number of generated reload insns per insn is achieved (90)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.3.inc              |  1 +
 ...-relax-the-restriction-on-subreg-reload-f.patch | 51 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
index ec6d8cdac1..e569e0220b 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
@@ -75,6 +75,7 @@ SRC_URI = "\
            file://0048-sync-gcc-stddef.h-with-musl.patch \
            file://0054_all_nopie-all-flags.patch \
            file://0055-unwind_h-glibc26.patch \
+           file://0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch b/meta/recipes-devtools/gcc/gcc-6.3/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch
new file mode 100644
index 0000000000..231f147619
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.3/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch
@@ -0,0 +1,51 @@
+From a582b0a53d1dc8604a201348b99ca8de48784e7e Mon Sep 17 00:00:00 2001
+From: jiwang <jiwang@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 12 May 2016 17:00:52 +0000
+Subject: [PATCH] [LRA] PR70904, relax the restriction on subreg reload for
+ wide mode
+
+2016-05-12  Jiong Wang  <jiong.wang@arm.com>
+
+gcc/
+  PR rtl-optimization/70904
+  * lra-constraint.c (process_addr_reg): Relax the restriction on
+  subreg reload for wide mode.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@236181 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ gcc/lra-constraints.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
+index f96fd458e23..73fb72a2ea5 100644
+--- a/gcc/lra-constraints.c
++++ b/gcc/lra-constraints.c
+@@ -1326,7 +1326,21 @@ process_addr_reg (rtx *loc, bool check_only_p, rtx_insn **before, rtx_insn **aft
+ 
+   subreg_p = GET_CODE (*loc) == SUBREG;
+   if (subreg_p)
+-    loc = &SUBREG_REG (*loc);
++    {
++      reg = SUBREG_REG (*loc);
++      mode = GET_MODE (reg);
++
++      /* For mode with size bigger than ptr_mode, there unlikely to be "mov"
++	 between two registers with different classes, but there normally will
++	 be "mov" which transfers element of vector register into the general
++	 register, and this normally will be a subreg which should be reloaded
++	 as a whole.  This is particularly likely to be triggered when
++	 -fno-split-wide-types specified.  */
++      if (in_class_p (reg, cl, &new_class)
++	  || GET_MODE_SIZE (mode) <= GET_MODE_SIZE (ptr_mode))
++       loc = &SUBREG_REG (*loc);
++    }
++
+   reg = *loc;
+   mode = GET_MODE (reg);
+   if (! REG_P (reg))
+-- 
+2.14.2
+
-- 
2.14.2


