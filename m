Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE6F771A3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 06:28:45 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id 6so82540472qgy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 22:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PmvAh2wYpVsbbio+OqO6n2xhgRkD/RkghPGMSgALd4w=;
	b=049j33B2HtvBdVHS+9iE7M9nR7KdzYGUUoFydRERTJhx4b2Hf17fT+NQ8+KpOVvdmp
	p9C/O/I5wPK7QWksZzeayEtIJ2USJyOhlI7sPvnv3OnwOHmf5h9bfzKNEXIy8To/wfYK
	Tgi5FChCXI4eBnO1K6vWMUHezcqgHdQh8KotoPH+rxtVldgdVXCR20OVAQxB8s7mhs3y
	iFOy2WBuamhSyQYheUfNWaqUvpYRkSff526F5sKYs7oIfk4V58NIZbWnZ96zHj7AwQEp
	Tr3D+68ytCP6CTRCxdFfes79lEuDnj80WHmSVSSBSeDoahlDRRmLgzNknKskazXVIpB0
	7/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PmvAh2wYpVsbbio+OqO6n2xhgRkD/RkghPGMSgALd4w=;
	b=OyoW3t0r2NBmewDZpFrzMTut5dg++cIZ2HLp8hIRTp4LVOIlJJbaJ01GSY6DO0Kk5c
	5KJOBHruFdMBtAvJYE3mIApiZwG5XmbPIsqrMo2MY0RK9aAsdPPrhPkYlABnHC3uslEt
	60KO/kANxHWDbF7udoXEgl8/ca7sGkYspAxQ2XPg8OQUgkxYFI9vgplPQGYVXOg4buq9
	+LamvNnwRIkEKjkBhqcyPnlGKw43PL3kSVLUBbB04rfwdxsBaIUsUkx8E/u7I/kVwLq3
	wEk8QAzEua09MeLzyUJ0zEFRDy/MRDKTdcF1uz5ijJvaQkUNXV9G/FOesZfKHZB8cwAf
	vXZA==
X-Gm-Message-State: AG10YOTtdUk+sK/BtHgvHYRHSGS2qjvh3wbucXPrkaW/l/cWUKEDDUyAbXdVl9Vt38s5Ow==
X-Received: by 10.140.156.212 with SMTP id c203mr7367548qhc.96.1454135326358; 
	Fri, 29 Jan 2016 22:28:46 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	n83sm8289755qhn.20.2016.01.29.22.28.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 22:28:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jan 2016 06:28:37 +0000
Message-Id: <b92356866c603c832e859c26ea6d4f01a70aba3c.1454135035.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1454135035.git.raj.khem@gmail.com>
References: <cover.1454135035.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] gcc, qemuppc: Explicitly disable forcing SPE flags
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
X-List-Received-Date: Sat, 30 Jan 2016 06:28:48 -0000

G4 does not have SPE, so we make that explicit in the tune files and
since we emulate G4 when building Qemu, we ensure it for qemuppc as
well.

GCC config for powerpc-linux is made to include SPE by default which is
equivalent if the tripet was powerpc-linux*spe, this forces gcc to
configure assembler to enable -mspe by default, when we do that then the
kernel fails to compile with binutils 2.26, since newer assembler is
smart to detect the tlbia instructions are not compatible with SPE and
hence the kernel build breaks rightly. We configure the kernel for G4 as
well where it enables tlbia instrucitons rightly so because it thinks
its being configured for power4. So we keep the options but do not force
-mspe down to assembler as default.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-ppc7400.inc         |  2 +-
 meta/conf/machine/qemuppc.conf                     |  2 ++
 ...AltiVec-generation-on-powepc-linux-target.patch | 24 ++++++++++++++--------
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta/conf/machine/include/tune-ppc7400.inc b/meta/conf/machine/include/tune-ppc7400.inc
index 8bfda56..425e8bd 100644
--- a/meta/conf/machine/include/tune-ppc7400.inc
+++ b/meta/conf/machine/include/tune-ppc7400.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppc7400"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc7400] = "Enable ppc7400 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppc7400', ' -mcpu=7400', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppc7400', ' -mcpu=7400 -mno-spe', '', d)}"
 
 AVAILTUNES += "ppc7400"
 TUNE_FEATURES_tune-ppc7400 = "m32 fpu-hard ppc7400 altivec"
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index 85cbbf7..bf0038d 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -5,6 +5,8 @@
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-ppc7400.inc
 
+TARGET_CC_KERNEL_ARCH = "-mno-spe"
+
 KERNEL_IMAGETYPE = "vmlinux"
 
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-5.3/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
index e7ca360..5705187 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
@@ -19,11 +19,11 @@ Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
  gcc/config.gcc | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)
 
-diff --git a/gcc/config.gcc b/gcc/config.gcc
-index dd0739d..3825bd5 100644
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
-@@ -2343,7 +2343,14 @@ powerpc-*-rtems*)
+Index: gcc-5.3.0/gcc/config.gcc
+===================================================================
+--- gcc-5.3.0.orig/gcc/config.gcc
++++ gcc-5.3.0/gcc/config.gcc
+@@ -2346,7 +2346,14 @@ powerpc-*-rtems*)
  	tmake_file="${tmake_file} rs6000/t-fprules rs6000/t-rtems rs6000/t-ppccomm"
  	;;
  powerpc*-*-linux*)
@@ -39,6 +39,14 @@ index dd0739d..3825bd5 100644
  	extra_options="${extra_options} rs6000/sysv4.opt"
  	tmake_file="${tmake_file} rs6000/t-fprules rs6000/t-ppccomm"
  	extra_objs="$extra_objs rs6000-linux.o"
--- 
-2.6.3
-
+Index: gcc-5.3.0/gcc/config/rs6000/linuxspe.h
+===================================================================
+--- gcc-5.3.0.orig/gcc/config/rs6000/linuxspe.h
++++ gcc-5.3.0/gcc/config/rs6000/linuxspe.h
+@@ -27,6 +27,3 @@
+ #undef	TARGET_DEFAULT
+ #define TARGET_DEFAULT MASK_STRICT_ALIGN
+ #endif
+-
+-#undef  ASM_DEFAULT_SPEC
+-#define	ASM_DEFAULT_SPEC "-mppc -mspe -me500"
-- 
2.7.0


