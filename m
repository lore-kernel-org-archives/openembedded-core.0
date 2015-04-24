Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8B66773D37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 03:35:47 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so36514603pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=e+GXhYDWsm0JFoUxv/EL+rmT5Umwurrqp/K7ANJof8g=;
	b=aLjrvr23Y6ocHecgdn5fBDaaS4Nz3lI82aA3fy7bYJS1NWLMZe87v+TQ8pZT4CL4m8
	3yG9sXRYRpat5MKuEFlF33iUYhEJQMoEtDJj7L665Rv1a1sQmGdGjWg+wsHmRfrRNx31
	EhkmAvHoWEGhbp3+7NFCbtRbOWI7tjZSDJt7vk5apFV8j5d4/8OcJgplXqHS8I8ItKRT
	I0lrl9xPsg0s8/2SGfG6Ko4/E2k0d9ep9Z3zMM2vpEJPfAZzRwDTen4W4iGThbbBVU/z
	Vg8Kl2xWy+ubaRCw5sZCHKW6fJBXISucfKJGmErRdcCRSmNkQCcYg8AQE386RlWCH9I5
	uj6A==
X-Received: by 10.70.88.203 with SMTP id bi11mr2166091pdb.121.1429846549468;
	Thu, 23 Apr 2015 20:35:49 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id qv9sm9575507pab.27.2015.04.23.20.35.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 20:35:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 20:35:29 -0700
Message-Id: <427885fec9f15fb49f4280e3d734a3552957046f.1429846256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
References: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
Subject: [PATCH 11/14] gummiboot: upgrade 43 -> 48+git
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
X-List-Received-Date: Fri, 24 Apr 2015 03:35:48 -0000

43 does not compile with gcc-5
Refresh objcopy patch to incorporate latest changes

Change-Id: Ied41ed1335bb1db3438b98121e05c22242a8a13e
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gummiboot/gummiboot/fix-objcopy.patch          | 28 +++++++++++++---------
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |  4 ++--
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch b/meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch
index 2683f83..49f5593 100644
--- a/meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch
+++ b/meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch
@@ -12,10 +12,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  Makefile.am | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/Makefile.am b/Makefile.am
-index d224418..dcd95b0 100644
---- a/Makefile.am
-+++ b/Makefile.am
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
 @@ -19,6 +19,8 @@
  ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
  AM_MAKEFLAGS = --no-print-directory
@@ -25,15 +25,21 @@ index d224418..dcd95b0 100644
  gummibootlibdir = $(prefix)/lib/gummiboot
  
  AM_CPPFLAGS = -include config.h
-@@ -143,7 +145,7 @@ $(efi_solib): $(efi_objects)
- .DELETE_ON_ERROR: $(efi_solib)
+@@ -148,7 +150,7 @@ $(gummiboot_solib): $(gummiboot_objects)
+ .DELETE_ON_ERROR: $(gummboot_solib)
  
- $(efi_loadername): $(efi_solib)
+ $(gummiboot): $(gummiboot_solib)
 -	$(AM_V_GEN) objcopy -j .text -j .sdata -j .data -j .dynamic \
 +	$(AM_V_GEN) $(OBJCOPY) -j .text -j .sdata -j .data -j .dynamic \
- 	  -j .dynsym -j .rel -j .rela -j .reloc -j .eh_frame \
+ 	  -j .dynsym -j .rel -j .rela -j .reloc \
+ 	  --target=efi-app-$(ARCH) $< $@
+ 
+@@ -183,7 +185,7 @@ $(stub_solib): $(stub_objects)
+ .DELETE_ON_ERROR: $(gummboot_solib)
+ 
+ $(stub): $(stub_solib)
+-	$(AM_V_GEN) objcopy -j .text -j .sdata -j .data -j .dynamic \
++	$(AM_V_GEN) $(OBJCOPY) -j .text -j .sdata -j .data -j .dynamic \
+ 	  -j .dynsym -j .rel -j .rela -j .reloc \
  	  --target=efi-app-$(ARCH) $< $@
  
--- 
-1.8.3.4
-
diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
index 7fc908e..91c3db9 100644
--- a/meta/recipes-bsp/gummiboot/gummiboot_git.bb
+++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
@@ -9,8 +9,8 @@ DEPENDS = "gnu-efi util-linux"
 inherit autotools pkgconfig
 inherit deploy
 
-PV = "43+git${SRCPV}"
-SRCREV = "4062c51075ba054d4949c714fe06123f9ad3097d"
+PV = "48+git${SRCPV}"
+SRCREV = "2bcd919c681c952eb867ef1bdb458f1bc49c2d55"
 SRC_URI = "git://anongit.freedesktop.org/gummiboot \
            file://fix-objcopy.patch \
           "
-- 
2.1.4


