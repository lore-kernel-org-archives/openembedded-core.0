Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8041960589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 21:07:19 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id f126so105608975wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=4FmK+4JCqIlodBsDlOzDU7jk5S1ZJW93MZCT81THylw=;
	b=Rc4U60w5bdSLrGzcDX2jqUQAn/OT7tHlQG6bpTa7U8ye2nVw2bQGVdmvLFDsM3QNSy
	waISbfcoZ8biMefVAmoDDFW5QFQmhPHUm4fh1hcFONJFTeMZlYFKPJiFHO6oK01wP8kJ
	LAzDaF2tjcrgY14QbaqGNRuQYqUwVlAacweCsZybjHMagbKfSYTiFhZelB/Gufd+keNU
	lU416ztNFgFHtrTR0Pqlvr5yNgNERMaMYYg3SQbPSzt+DcvP6aHhUaYt2XQoHAedwc9m
	kTOr2LOpYsbJwwwHjrMA6mmONghR+QvjdHJvx1PlnQJQK/lDz1W0RqE1MuvF0qOIR5+L
	Q7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4FmK+4JCqIlodBsDlOzDU7jk5S1ZJW93MZCT81THylw=;
	b=JGCJ2Zv4YIsOxzSALsCD8ycW+oK/lM+QEr8vwVMgeF6Crp8lywoF6D7p1vfgLu+S8w
	p5DdyW5VLluQe4Y7xBHS5CRZTUmg1GJDfR4pGK1BLQrmRqXAekaqr6jwEIHdwgSDbdOp
	4VFpUfCbp6n3WqiVWFPmx5Eq2FJYslGPU9gpTnz49QRD2ouumIfLA5nHBXXG/f//jSHq
	8phP9GrjZyC+kFdKxs+lfwBnNR0M+pLuyEZWoYaPeGGjookmK2iSNF1tJU6DLDcxfeog
	YAkqqRdcYF4+rJ9w6w6gbPVh/AQuOAGwW2tKe4qnY2BPMYk6QCG87TQWe40s/lrqdPEz
	kalQ==
X-Gm-Message-State: ALyK8tJqePx+CYC3RsOx353PW+jpeyYpPplrtWt4fks1OU36Cr3XCRNWppnuH4OCjDQuqjHx
X-Received: by 10.195.12.105 with SMTP id ep9mr1491403wjd.163.1468271238884;
	Mon, 11 Jul 2016 14:07:18 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id jy5sm1625031wjb.9.2016.07.11.14.07.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jul 2016 14:07:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 22:07:16 +0100
Message-Id: <1468271236-6781-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] glibc: add more Imagination Meta relocation to elf.h
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
X-List-Received-Date: Mon, 11 Jul 2016 21:07:19 -0000

glibc master added the EM_METAG tag but didn't add the relocation defines.
However the kernel tooling only checks for EM_METAG when defining its own values
so scripts/recordmcount ends up using R_META_* symbols without their definition.

Whilst the kernel can and should be fixed, this breaks all users of recordmcount
so patch elf.h to add the values.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glibc/glibc/elf-meta.patch | 32 ++++++++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb        |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/elf-meta.patch

diff --git a/meta/recipes-core/glibc/glibc/elf-meta.patch b/meta/recipes-core/glibc/glibc/elf-meta.patch
new file mode 100644
index 0000000..fab66d7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/elf-meta.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From a495656665cd4a4f97744741a4741eafa621d65b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 11 Jul 2016 16:57:38 +0100
+Subject: [PATCH] elf.h: add relocations for Imagination META
+
+Adding EM_METAG but not the relocations means the kernel doesn't compile as it
+guards its own declarations on the presence of EM_METAG.
+---
+ elf/elf.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/elf/elf.h b/elf/elf.h
+index b6112d9..69e85a7 100644
+--- a/elf/elf.h
++++ b/elf/elf.h
+@@ -3677,6 +3677,10 @@ enum
+ 
+ #define R_TILEGX_NUM		130
+ 
++/* Imagination META relocs */
++#define R_METAG_ADDR32		2
++#define R_METAG_NONE		3
++
+ /* BPF specific declarations.  */
+ 
+ #define R_BPF_NONE		0	/* No reloc */
+-- 
+2.8.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index f0c6a03..456f206 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -37,6 +37,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-eglibc-Install-PIC-archives.patch \
            file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
+           file://elf-meta.patch \
 "
 
 SRC_URI += "\
-- 
2.8.1


