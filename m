Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0E21A71A1C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 17:47:57 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c4so7630231pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 09:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+5wWXGKZUHLYurZYLsACpfRG4WMv4wOvXbe+pQvATHE=;
	b=NEYEpcUOQ4hRid6GboOU+o5KnG5qKWovnvZXS3SUdLq/fDCxIHs6+0tHTWEhYa7PJr
	tbbgax+36RuF0G9WCMs8C0pTMtwBh9EJ9syX8ysQqM+hAFKpjTsFn6Q3450lZBirrG/P
	dILW/0fVcTQxcVLA8k55soRiZXSqMmqt9HhhdAqF+V0aHmJwuUsG7dPkcwN1ocFfnrMw
	g3bcMvelRhRhJEcI6lNnsPF/rQ+EGU6MnkSJ2BKKlUIa0cXwFi9o5/mdrYBktwO6Rfwh
	pC8wril+3qwnVSFJdsN8+pSevmwToAYJoWjJ0IXZqtHAZ52F1agkkK0Prq8jr6bVdNaQ
	bXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+5wWXGKZUHLYurZYLsACpfRG4WMv4wOvXbe+pQvATHE=;
	b=fkcqUPCX7sgLqSK6b+MfDFfoJwf/bNzBxRERoTD4ZtvM+n6CpNacJO7ZL5liU83z47
	PRL7bzwqnLNfO4+HPzLkulybnUokBa41Q/tQCWP/TNACQyqAcZsYsfbm5k/sTpgtwlL/
	weLRdMH1qbiIyCFSppEHy6yw9uc+HkvolCuQkoY0hWaWYtehkGRcoYqs07Hreo5SEDJ4
	Dn/6bvANoqdIQhMZdAwvZJkASa1137/A29Xwo83gk8oTeswzBkJMkhaVtBhOTR6qf1KO
	c+vcyajk1OdwzXCiJERnay63hNc64Bf6eanNmJISx03UW8vK+KwdAHg/jZk0clsfchdo
	tFjg==
X-Gm-Message-State: ABUngveX4R9pcRAuZIMb2XlyUE59BbQYZexqPC112pO3nsSCchyHHNDfrV4grvfoWw7erA==
X-Received: by 10.99.62.13 with SMTP id l13mr10841471pga.112.1479318479047;
	Wed, 16 Nov 2016 09:47:59 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s2sm55946617pfi.10.2016.11.16.09.47.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 09:47:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 09:47:48 -0800
Message-Id: <20161116174748.26994-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161116174748.26994-1-raj.khem@gmail.com>
References: <20161116174748.26994-1-raj.khem@gmail.com>
Subject: [PATCH 5/5] binutils: Fix parsing of ppc apuinfo for spe
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
X-List-Received-Date: Wed, 16 Nov 2016 17:47:58 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.27.inc   |  1 +
 ...17-ppc-apuinfo-for-spe-parsed-incorrectly.patch | 33 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-ppc-apuinfo-for-spe-parsed-incorrectly.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.27.inc
index fc81721..e1be176 100644
--- a/meta/recipes-devtools/binutils/binutils-2.27.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
@@ -37,6 +37,7 @@ SRC_URI = "\
      file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
      file://0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch \
      file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch \
+     file://0017-ppc-apuinfo-for-spe-parsed-incorrectly.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0017-ppc-apuinfo-for-spe-parsed-incorrectly.patch b/meta/recipes-devtools/binutils/binutils/0017-ppc-apuinfo-for-spe-parsed-incorrectly.patch
new file mode 100644
index 0000000..02f5efb
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-ppc-apuinfo-for-spe-parsed-incorrectly.patch
@@ -0,0 +1,33 @@
+From 2a0b8eb7a7974ff7605cb3ba5dffa5abef286ffa Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 30 Aug 2016 20:57:32 +0930
+Subject: [PATCH] ppc apuinfo for spe parsed incorrectly
+
+apuinfo saying SPE resulted in mach = bfd_mach_ppc_vle due to a
+missing break.
+
+	PR 20531
+	* elf32-ppc.c (_bfd_elf_ppc_set_arch): Add missing "break".
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ bfd/ChangeLog   | 5 +++++
+ bfd/elf32-ppc.c | 1 +
+ 2 files changed, 6 insertions(+)
+
+diff --git a/bfd/elf32-ppc.c b/bfd/elf32-ppc.c
+index 95ce1dc..e42ef1c 100644
+--- a/bfd/elf32-ppc.c
++++ b/bfd/elf32-ppc.c
+@@ -2246,6 +2246,7 @@ _bfd_elf_ppc_set_arch (bfd *abfd)
+ 		case PPC_APUINFO_BRLOCK:
+ 		  if (mach != bfd_mach_ppc_vle)
+ 		    mach = bfd_mach_ppc_e500;
++		  break;
+ 
+ 		case PPC_APUINFO_VLE:
+ 		  mach = bfd_mach_ppc_vle;
+-- 
+2.10.2
+
-- 
2.10.2


