Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id D661074553
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 07:55:33 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id l7-v6so9115465ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 00:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RJno7+Sm51D3HsVB2oYJ0k4yhWzZ6/bckOoPYqr8r9g=;
	b=avP/lU+R16E+p1wQceHsqKb/bYFteFt6bzDZlgQWjA6Ms86t9j/Syj7TEsdOm/ugLh
	SbUzV2pAdxp9bnXEXieWINGB+eu4RqLOYI1nRYgC4lrnALxJJEYfuzUp4xFgjWMI1QwH
	e9fh2ucCxlYoy7HIkHHdVr1edVButf8sjyhOIP7lctilVpLogccQ3ZWS9FsZWyMc/JvD
	BV95kL/nCWn31Zb6CA+b4zvclKnTGu89RWqecqggR5dIfN3/3RznjfqhIz3bv+R7ABqB
	a2WF4DqjLQY+f46rOhjd6NpEpBmZgCfbct+nPOpvtJC21HcKYLTQfJuKVhXTQqHx8WrV
	ptdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RJno7+Sm51D3HsVB2oYJ0k4yhWzZ6/bckOoPYqr8r9g=;
	b=V/OBMUZtyf5v8Jytcbvfy7RD956G06LA979dATDWj01VPdwQTTaXUE+mjyR3TkgEC8
	1O/OIpZR2oyuQXoxnE6eipoXeXtA4M7EhXTo2uVobw2aitqq/5WGW8q3AZLeaAL+ArYA
	YjJQHeCdVYIWqUhBi6seUzVlA9kZ7LS89YjOkSK12JXDkPpAdFClTMVMHhUvQ2FbyM1c
	Bg51ijnFgcvl+3Zdnc8Dg/DsVRYBVNKLVt/tw0dq3TuvGwui1WY6pwG1WEZx5xPUoBTx
	6QX/YYu/uoKBKFczWOsMzMXXdv8SvQT5NvMEDtvkMGRQslgFaHxpyZBX4nhoEfSIfiFE
	r/Tg==
X-Gm-Message-State: AOUpUlFtDUiYRKZFovahYDi2cyYKRyubvkL/lZ9n4lf4+9TxMB4JFRw5
	tdz7+y2TfAfUxqeJJ8hzzEBTTXpod2c=
X-Google-Smtp-Source: AAOMgpcSE1eZsx7oXmIcoF2johV2Ae4zJM1EjS8GFwji4RQcAYUmAMBYnD19JXn0zNePJmBlzRksCw==
X-Received: by 2002:a6b:19c4:: with SMTP id
	187-v6mr12931811ioz.244.1532937334545; 
	Mon, 30 Jul 2018 00:55:34 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	a79-v6sm6512117itc.33.2018.07.30.00.55.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jul 2018 00:55:33 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 00:55:21 -0700
Message-Id: <1532937321-4077-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v6] binutils : enable x86_64-pep for producing EFI binaries on x86-64
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
X-List-Received-Date: Mon, 30 Jul 2018 07:55:34 -0000

Add x86_64-pep emulation support to the set enabled for x86_64 targets
to enable the linker to produce Portable Executables for EFI binaries.

Enables building the x86-64 EFI variant of the Xen hypervisor for
the OpenXT Project.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
Changes in v6: added required "Upstream-Status" field to patch header.

Changes in v5: Apply a patch to extend the set of emulations for x86-64,
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
 .../0016-add-i386pep-emulation-for-x86_64.patch    | 41 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
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
index 0000000..9f20784
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-x86_64.patch
@@ -0,0 +1,41 @@
+binutils : enable x86_64-pep for producing EFI binaries on x86-64
+
+Add x86_64-pep emulation support to the set enabled for x86_64 targets
+to enable the linker to produce Portable Executables for EFI binaries.
+
+Enables building the x86-64 EFI variant of the Xen hypervisor for
+the OpenXT Project.
+
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+
+Upstream-Status: Inappropriate [OE configuration specific]
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


