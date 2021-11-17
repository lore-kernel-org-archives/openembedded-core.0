Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77932C4332F
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:53 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.8709.1637163352053526271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PTRyVIK5;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so2452526wmd.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n4rLxJUxtTdfVhTYEcLW4W2okYK8EmBuimohH98VhXg=;
        b=PTRyVIK5os3UNYphXvtjAzbl4R7QQ9ku78+qeA/QcRjyx7UQOupK31kei9H6A6uUuV
         UbvDQvJQ6YUY4UNcb0CHZz6iAtFeYdAFsnALlTmAiKWWvW86ibs/8vGTRTIH40Rt4FVA
         1XL1KSY84jKO8/r3uNea68PwH8i0oBehXOe35tGiwMqnauwM2yDaaOjlCJS9Is3TVZ9I
         5iA38Du/KKsRFsvY//QNb8vChl7W0hHVZ6xOucNYoAMqTgkweHLBHqFNcQewgZTTB23w
         wSqMuVcIICIQeBO+ch4ugyb1QEQ+GWigRAuG/1d01ojNhwCLKSODyBBdSsUUkYMcijWL
         ye9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n4rLxJUxtTdfVhTYEcLW4W2okYK8EmBuimohH98VhXg=;
        b=JVmqbj67uDzJEahRQmEZb+ELQZBTJkjdUARpeCSnxS9jRd8qDhfCMZukyH4qeKg5MF
         v/axBm8yTE9yKEIyLqyCyDQ2pHPq3FB2Tl0YZ1zZZ9RhdnwcnMElsJGUsMGufLBjlEAa
         bbp0gJjR0QnM6wCXSHHLdZyt1xaggZduGqaeCeQDPMeVLwipe4E9YpEwMVM/Kb6dBDzw
         /ZIOBN6KG5U8Olw8/qU5uEO9uIpA6aw4wg72VHGl9ICs+7kytJ6+4P3s0yaZncEEpXpS
         HyziLd3czkDgfmnUrppqjUW8WzCSE32axhLepBOzTKA5jdj6b1dgCvL68dvIORXR48hG
         KL7w==
X-Gm-Message-State: AOAM530Fc+tW4rBM8eEL31DuJvJJpsCmMMe3ca1+15d0HTNoeWOTR/wu
	7ZDKZBIir56HzSSt4s9NkaRhtoVo+P4=
X-Google-Smtp-Source: 
 ABdhPJxUWAXsqdTDlqygHwAxBY622fRx6uI8eg5Or/x+j+U8EhMY8bHzkeL6FP+Iuy7lKaaYtOLYbw==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr565723wmh.193.1637163350624;
        Wed, 17 Nov 2021 07:35:50 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
Subject: [PATCH 34/36] busybox: drop
 0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
Date: Wed, 17 Nov 2021 16:35:23 +0100
Message-Id: <20211117153525.257146-34-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158429

This was added 10 years ago, is almost certainly non-upstreamable
and it isn't clear what the issues it aims to fix are:
the AB revealed no problems when the patch is removed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ing-instead-of-LD-and-use-CFLAGS-and.patch | 114 ------------------
 meta/recipes-core/busybox/busybox_1.34.1.bb   |   1 -
 2 files changed, 115 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch b/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
deleted file mode 100644
index 2bf2b91c7e..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From a9333eb6a7b8dbda735947cd5bc981ff9352a2c9 Mon Sep 17 00:00:00 2001
-From: Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
-Date: Thu, 10 Mar 2011 00:27:08 -0500
-Subject: [PATCH 1/2] Use $(CC) when linking instead of $(LD) and use $(CFLAGS)
- and $(EXTRA_CFLAGS) when linking.
-
-This fixes the issue where LDFLAGS escaped with -Wl are ignored during
-compilation. It also simplifies using CFLAGS or EXTRA_CFLAGS (such as
--m32 on x86_64 or -flto) which apply to both compilation and linking
-situations.
-
-Signed-off-by: Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
----
-Upstream-Status: Pending
-
- Makefile               |  7 ++++---
- scripts/Makefile.build |  8 ++++----
- scripts/Makefile.lib   | 13 +++----------
- 3 files changed, 11 insertions(+), 17 deletions(-)
-
-Index: busybox-1.23.2/Makefile
-===================================================================
---- busybox-1.23.2.orig/Makefile
-+++ busybox-1.23.2/Makefile
-@@ -309,7 +309,8 @@ CHECKFLAGS     := -D__linux__ -Dlinux -D
- MODFLAGS	= -DMODULE
- CFLAGS_MODULE   = $(MODFLAGS)
- AFLAGS_MODULE   = $(MODFLAGS)
--LDFLAGS_MODULE  = -r
-+LDFLAGS_RELOCATABLE = -r -nostdlib
-+LDFLAGS_MODULE  = $(LDFLAGS_RELOCATABLE)
- CFLAGS_KERNEL	=
- AFLAGS_KERNEL	=
- 
-@@ -331,7 +332,7 @@ KERNELVERSION = $(VERSION).$(PATCHLEVEL)
- export	VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION \
- 	ARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC \
- 	CPP AR NM STRIP OBJCOPY OBJDUMP MAKE AWK GENKSYMS PERL UTS_MACHINE \
--	HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
-+	HOSTCXX HOSTCXXFLAGS LDFLAGS_RELOCATABLE LDFLAGS_MODULE CHECK CHECKFLAGS
- 
- export CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAGS
- export CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
-@@ -610,7 +611,7 @@ quiet_cmd_busybox__ ?= LINK    $@
-       cmd_busybox__ ?= $(srctree)/scripts/trylink \
-       "$@" \
-       "$(CC)" \
--      "$(CFLAGS) $(CFLAGS_busybox)" \
-+      "$(CFLAGS) $(CFLAGS_busybox) $(EXTRA_CFLAGS)" \
-       "$(LDFLAGS) $(EXTRA_LDFLAGS)" \
-       "$(core-y)" \
-       "$(libs-y)" \
-Index: busybox-1.23.2/scripts/Makefile.build
-===================================================================
---- busybox-1.23.2.orig/scripts/Makefile.build
-+++ busybox-1.23.2/scripts/Makefile.build
-@@ -174,7 +174,7 @@ cmd_modversions =							\
- 		| $(GENKSYMS) -a $(ARCH)				\
- 		> $(@D)/.tmp_$(@F:.o=.ver);				\
- 									\
--		$(LD) $(LDFLAGS) -r -o $@ $(@D)/.tmp_$(@F) 		\
-+               $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $@ $(@D)/.tmp_$(@F)        \
- 			-T $(@D)/.tmp_$(@F:.o=.ver);			\
- 		rm -f $(@D)/.tmp_$(@F) $(@D)/.tmp_$(@F:.o=.ver);	\
- 	else								\
-@@ -257,7 +257,7 @@ quiet_cmd_link_o_target = LD      $@
- # If the list of objects to link is empty, just create an empty built-in.o
- # -nostdlib is added to make "make LD=gcc ..." work (some people use that)
- cmd_link_o_target = $(if $(strip $(obj-y)),\
--		$(LD) -nostdlib $(ld_flags) -r -o $@ $(filter $(obj-y), $^),\
-+		$(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $@ $(filter $(obj-y), $^),\
- 		rm -f $@; $(AR) rcs $@)
- 
- $(builtin-target): $(obj-y) FORCE
-@@ -292,10 +292,10 @@ $($(subst $(obj)/,,$(@:.o=-objs)))    \
- $($(subst $(obj)/,,$(@:.o=-y)))), $^)
- 
- quiet_cmd_link_multi-y = LD      $@
--cmd_link_multi-y = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps)
-+cmd_link_multi-y = $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $@ $(link_multi_deps)
- 
- quiet_cmd_link_multi-m = LD [M]  $@
--cmd_link_multi-m = $(LD) $(ld_flags) $(LDFLAGS_MODULE) -o $@ $(link_multi_deps)
-+cmd_link_multi-m = $(CC) $(ld_flags) $(LDFLAGS_MODULE) -o $@ $(link_multi_deps)
- 
- # We would rather have a list of rules like
- # 	foo.o: $(foo-objs)
-Index: busybox-1.23.2/scripts/Makefile.lib
-===================================================================
---- busybox-1.23.2.orig/scripts/Makefile.lib
-+++ busybox-1.23.2/scripts/Makefile.lib
-@@ -121,7 +121,8 @@ cpp_flags      = -Wp,-MD,$(depfile) $(NO
- # yet ld_flags is fed to ld.
- #ld_flags       = $(LDFLAGS) $(EXTRA_LDFLAGS)
- # Remove the -Wl, prefix from linker options normally passed through gcc
--ld_flags       = $(filter-out -Wl$(comma)%,$(LDFLAGS) $(EXTRA_LDFLAGS))
-+ld_flags       = $(filter-out -Wl$(comma)%,$(LDFLAGS) $(EXTRA_LDFLAGS) $(CFLAGS) $(EXTRA_CFLAGS))
-+ld_flags_partial = $($(filter-out -shared%, $(filter-out -pie%,$(ld_flags))))
- 
- 
- # Finds the multi-part object the current object will be linked into
-@@ -151,10 +152,8 @@ $(obj)/%:: $(src)/%_shipped
- # Linking
- # ---------------------------------------------------------------------------
- 
--# TODO: LDFLAGS usually is supposed to contain gcc's flags, not ld's.
--# but here we feed them to ld!
--quiet_cmd_ld = LD      $@
--cmd_ld = $(LD) $(LDFLAGS) $(EXTRA_LDFLAGS) $(LDFLAGS_$(@F)) \
-+quiet_cmd_ld = CC    $@
-+cmd_ld = $(CC) $(ld_flags) $(LDFLAGS_$(@F)) \
- 	       $(filter-out FORCE,$^) -o $@
- 
- # Objcopy
diff --git a/meta/recipes-core/busybox/busybox_1.34.1.bb b/meta/recipes-core/busybox/busybox_1.34.1.bb
index 6aed0f0476..3651c06126 100644
--- a/meta/recipes-core/busybox/busybox_1.34.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.34.1.bb
@@ -26,7 +26,6 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://login-utilities.cfg \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
-           file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
-- 
2.20.1


