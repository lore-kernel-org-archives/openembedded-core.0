Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6D46C748EE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2018 06:07:00 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id m1-v6so4056462plt.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 23:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AZnqvz+5Jf+3ASH1pqxoZCMnZsx9sjSiSN2Ju5Hu+Ns=;
	b=ZNuXF6f7tGjjlBm+45/ofayFoGggK7Rwwep7VDn2Vpy5myIGl8nSkicyBprx0pYu3K
	KdBzm3B8wKKuuAM/5sz+XPgeNILjzmnFUoNpmV9+KTI/vsxU5UdkM5ApnX/T8mMI3bD/
	wFkeh3ZrYD2hesU3a/DV0yeUZ+inKySLXodcG3gKeUVQy4CvgwMk68Y14hgPnJudI94i
	tiW2E8pHeNS5GabOPmI4Q11bVRGvw6DXtNz5ZUQn6BKTnQsszbAN4tp24EvT30Mri0qH
	iFSRJrEnhpnJ2La2vfz74583C6MxYFNAzBJAht4mG5SYNM7ZutanfHakLR9ZbCp/5W84
	7H7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AZnqvz+5Jf+3ASH1pqxoZCMnZsx9sjSiSN2Ju5Hu+Ns=;
	b=cLeAKr9zeYmwZfiHqiKeM2dkRYxDKR2j0C1WnkUNw59RAFVYD7fKm4OLydR8AM06JF
	Xs3x7bkEAdMZAjBqLaCiwDdT5U3OrgNhhwoSbWTrsbTROyLObP5bYMLL6tkxrVEeZrMf
	+vy0s7154GUtJeRirDCI8udBg4aMuSboyvnZwgHlBUyxKnNrPXCVfnpnDuB0MJuiifk5
	VZaAQ1/ZyKVhYkmQDqEfd7CHgvKMCbvfavX07lXo1gr4KGxjlYGhHr5cP4Rbu4p7QZkv
	+ylglkRdhBjgPvi4GmCglQ4SrMRL5+7xVSUOBGnd7US3JPJr1L71ZhJyMc4lPCjy0ekI
	hwnA==
X-Gm-Message-State: AOUpUlF5KLjP0IZLT8iHb6Bekcilg/2MffIWyZZCF42NmRPNeTcOwhB2
	dTLv90Ns+Hk+QECf93FrFH98eb+J
X-Google-Smtp-Source: AAOMgpd8Kl0HKpMDh4DhkAEhCw6uoIDm/4wWk7a2fkql83d5IqwHu2zJE1ScGPYAI0cvEWIKuuv45g==
X-Received: by 2002:a17:902:4503:: with SMTP id
	m3-v6mr12000087pld.168.1532844420863; 
	Sat, 28 Jul 2018 23:07:00 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	f19-v6sm13846462pfd.147.2018.07.28.23.06.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Jul 2018 23:06:59 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Jul 2018 23:06:48 -0700
Message-Id: <1532844408-25210-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v5] binutils : enable x86_64-pep for producing EFI binaries on x86-64
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
X-List-Received-Date: Sun, 29 Jul 2018 06:07:00 -0000

Add x86_64-pep emulation support to those enabled for x86_64 targets
to enable the linker to produce Portable Executables for EFI binaries.

Enables building the x86-64 EFI variant of the Xen hypervisor for
the OpenXT Project.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
Changes since v4: Apply a patch to extend the set of emulations for x86-64,
instead of supplying the "enable-targets" flag via the recipe.

Reasoning: this looks like the least invasive way to add the needed emulation
only when required. It will add the extra support to any builds that have
x86-64 target enabled and not modify others.

binutils uses autoconf and the AC_ARG_ENABLE macro for handling the
"--enable-targets" option to the generated configure script. It doesn't allow
for repeating the parameter with additional arguments to extend the list:
it's a one-shot flag. That seems to be standard practice for autoconf.

binutils source contains config files that map from the target identifiers
to lists of emulations to enable. This patch extends some of those lists.

Tested with x86-64 build to produce Xen EFI.

 meta/recipes-devtools/binutils/binutils-2.31.inc   |  1 +
 .../0016-add-i386pep-emulation-for-x86_64.patch    | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-x86_64.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
index ec9e9c3..02d5bca 100644
--- a/meta/recipes-devtools/binutils/binutils-2.31.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
@@ -35,6 +35,7 @@ SRC_URI = "\
      file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
      file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
+     file://0016-add-i386pep-emulation-for-x86_64.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-x86_64.patch b/meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-x86_64.patch
new file mode 100644
index 0000000..159f6b4
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-x86_64.patch
@@ -0,0 +1,39 @@
+binutils : enable x86_64-pep for producing EFI binaries on x86-64
+
+Add x86_64-pep emulation support to the set enabled for x86_64 targets
+to enable the linker to produce Portable Executables for EFI binaries.
+
+Enables building the x86-64 EFI variant of the Xen hypervisor for
+the OpenXT Project.
+
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+---
+diff --git a/bfd/config.bfd b/bfd/config.bfd
+index c882421..dc705b6 100644
+--- a/bfd/config.bfd
++++ b/bfd/config.bfd
+@@ -688,7 +688,7 @@ case "${targ}" in
+     ;;
+   x86_64-*-linux-*)
+     targ_defvec=x86_64_elf64_vec
+-    targ_selvecs="i386_elf32_vec iamcu_elf32_vec x86_64_elf32_vec i386_pei_vec x86_64_pei_vec l1om_elf64_vec k1om_elf64_vec"
++    targ_selvecs="i386_elf32_vec iamcu_elf32_vec x86_64_elf32_vec i386_pei_vec x86_64_pei_vec l1om_elf64_vec k1om_elf64_vec x86_64_pe_vec x86_64_pe_be_vec i386_pe_vec"
+     want64=true
+     ;;
+   x86_64-*-nacl*)
+diff --git a/ld/configure.tgt b/ld/configure.tgt
+index a1db7ad..65a984a 100644
+--- a/ld/configure.tgt
++++ b/ld/configure.tgt
+@@ -253,8 +253,9 @@ x86_64-*-linux-gnux32)	targ_emul=elf32_x86_64
+ 			tdir_elf_iamcu=`echo ${targ_alias} | sed -e 's/x86_64/i386/' -e 's/-linux-gnux32/-linux-gnu/'`
+ 			tdir_elf_i386=`echo ${targ_alias} | sed -e 's/x86_64/i386/' -e 's/-linux-gnux32/-linux-gnu/'` ;;
+ x86_64-*-linux-*)	targ_emul=elf_x86_64
+-			targ_extra_emuls="elf32_x86_64 elf_i386 elf_iamcu elf_l1om elf_k1om"
+-			targ_extra_libpath="elf_i386 elf32_x86_64 elf_l1om elf_k1om"
++			targ_extra_emuls="elf32_x86_64 elf_i386 elf_iamcu elf_l1om elf_k1om i386pe i386pep"
++			targ_extra_libpath="elf_i386 elf32_x86_64 elf_l1om elf_k1om i386pep"
++			targ_extra_ofiles="deffilep.o pep-dll.o pe-dll.o"
+ 			tdir_elf_i386=`echo ${targ_alias} | sed -e 's/x86_64/i386/'` ;;
+ i[3-7]86-*-redox*)	targ_emul=elf_i386
+ 			targ_extra_emuls=elf_x86_64 ;;
-- 
2.7.4


