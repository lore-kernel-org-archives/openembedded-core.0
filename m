Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 97380754CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 08:10:14 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id w194-v6so1336227wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 01:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wmBWiViom1Ty2dHp2mjzrZ4wjZ1NDqACSAgOhD9odQU=;
	b=E0CUd8UXrzfcnIW3pre7XmJKc3gmfW2LrUm68P5mtLA1FurD9/TPvLFhMR8Buh5uue
	CLWpykXj5A0SF6HQGUZ4iwKYa+PDeVvlJY5fyictYxm51XP3TDWQ4xvB4YX8YDFMI0Pe
	vXbbmg/K3G2QtRFMH+r1DZBFJzjeLNJtFgFQr8hhPwM6BzMGCHKCcs4ZGY6B+hodRnWf
	rOjSfDGken/tQz2G3Nm7fmfGtIaUszjLyRkDEwae0GwjdaHKdCkbdPMSaLVcdIgtR/94
	Bs98LfD+xFf6fsLx1WRyK/LzNkY7gz75FItVhKVg5dNDhIEmk/zfgUlV08qrQ9u5S1rm
	Gztw==
X-Gm-Message-State: ALKqPwcE8zh4114Ji+k5aGQfsN21SA7YjRkHeGk1FcVlkQaFlWHHc66p
	KnRDNwJGEFL5+HLRA71s8pSX75D6
X-Google-Smtp-Source: AB8JxZp2eEcXR+qrUrpf4ntey/ORPFxyZD/JljGW6Mm6eHNumlfynzydXqtz5aBEmMDVPv4P+iWHzg==
X-Received: by 2002:a50:860f:: with SMTP id
	o15-v6mr6267489edo.243.1526026214596; 
	Fri, 11 May 2018 01:10:14 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g15-v6sm1559064edb.69.2018.05.11.01.10.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 01:10:13 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 09:10:11 +0100
Message-Id: <20180511081012.12843-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [pyro][PATCH 1/2] Revert "gcc: Remove patch causing ICE on x86_64 valgrind compile"
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
X-List-Received-Date: Fri, 11 May 2018 08:10:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

This reverts commit f76ee525a75dd6e443743bf723ad4511707c7f49.

With the patch removed we otherwise get QEMU (mipsel) segfaults:
--- SIGSEGV {si_signo=SIGSEGV, si_code=1, si_addr = 0x000d4e40} ---
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-devtools/gcc/gcc-6.4.inc              |  1 +
 ...-relax-the-restriction-on-subreg-reload-f.patch | 51 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.4.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
index daa9e42af8..1803917f01 100644
--- a/meta/recipes-devtools/gcc/gcc-6.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
@@ -81,6 +81,7 @@ SRC_URI = "\
            file://0048-sync-gcc-stddef.h-with-musl.patch \
            file://0054_all_nopie-all-flags.patch \
            file://0055-unwind_h-glibc26.patch \
+           file://0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch b/meta/recipes-devtools/gcc/gcc-6.4/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch
new file mode 100644
index 0000000000..231f147619
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch
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
2.16.2


