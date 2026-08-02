Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFCBC55189
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:07 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21181.1785666546724390410
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aynpD/PZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f71156e1aso1233587f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666545; x=1786271345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+AXtq9qbrXHA6SU3ELObusD7sVbpL57MgE2B0H/ni/M=;
        b=aynpD/PZKl6EMJM1vk0H4BOlt0pT2BTZ1/LuNHjBQFy4cPRhj0ncsZ0zvGWCRgUbKt
         7RC1I5ZIGxzFPR0Q/67IAmTWNEcHlkE8dXemigextAgAYz3U3N8XuxLOSbrh27C5xbBx
         5G1+jKOBQyw1lyS6luEt4eMcey7Z9TlFoBebM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666545; x=1786271345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+AXtq9qbrXHA6SU3ELObusD7sVbpL57MgE2B0H/ni/M=;
        b=ABxYsbpedO8DQmVldtn8PrPjIzPmv+7mTr6npYa37RMDPkj++gUrldxrWS5L4kmvCg
         90+DYMJ79M9I5VZqFsmCitRxcWZ7BMQIHw8Ufgsgmh4SOZJNJm3NzCP3ca9FnTj7J+Ag
         6DwAyJyy/zHbQEDozJ2BACpEONbIAigW1z7ldTTBSUAUR2U8V/zv/rmQl77mUKLiAq65
         pfrzDPDDtFcyMhFf63QRrS1vuMw+LkMt2bDphkiKuSOfoBFcJYV42xQRt7+J+IIkqazQ
         2w+L0H3N4F50UxAGSQXxnSe8z+S+uIzLo5BZIPLl9pQoMpKlpPP2YSCciM4qFIMGyT3k
         D9vA==
X-Gm-Message-State: AOJu0YwzwAE6VEVYEsLHnAGgbc/EH0lePDfNk859hVHblRwEEZEU1fyG
	uAzA5L64/O0qkRCWjHGJ8gO6KJtPHIfgi2lE3j0shN3aiHm4QXbsIYf2mmCaS6SwKipIIULa5AD
	bWZxvgsg=
X-Gm-Gg: AR+sD13HjmowI5fr35giu6ttX26pevDy7a1Y+YcEUjYsbwI0XcBogew5xUA8BTv+JWY
	5TWYq+1iHxkijAxIeAnKzY5VazKbfeySUxsziS5fbCu1BIH6dT5GvfaVVv4j8zPpRNWE8cDw8K8
	Th62G1irkLtiowCx+6sHULRR+cs7OP08KSS/21TfufphYHlwnO4YJZtwX9li+cQUhCh11QnxxR0
	uE5yo9f+3N4kjHG02bTJsDsAfP/V3bFzzENkLDOH7eWf4WRMXcTb0ASkchofWnEBcWSJX98i3L3
	POlCsloZeyH+9e6lfC6UR7S+rNj5+uIVGMmGB5cUTGj9OL3T0vIF2ne7n/3kw+1U1EJjScFRssD
	oSIFcfUbjVzn7ZMNCX3veb+E8A7OsN4l97s/WDyQpSYqH62iC85AZR9550Whm18QM6MVzmlHnaq
	XvgmLPX7mlorPU7BRwXcuaeP3WB+9JnCvoI/j/NK6dhceuGYD5Tip0PelVDIn5slbEA+brdirkq
	tBMldOOmFlKNXXGIw==
X-Received: by 2002:a05:600c:3f0d:b0:495:4cb6:71cc with SMTP id 5b1f17b1804b1-4980c66b530mr126330925e9.5.1785666544840;
        Sun, 02 Aug 2026 03:29:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/25] u-boot: Separate out from kernel-arch.bbclass
Date: Sun,  2 Aug 2026 11:28:37 +0100
Message-ID: <20260802102854.3952760-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242533

Move the UBOOT_ARCH usage into u-boot.inc and stop using kernel-arch.bbclass
since there are things in there which u-boot might not want.

This does mean the ARCH and UBOOT_ARCH variables are no longer in the environment
but I hopefully covered the main uboot usages of the variables.

Also document where these values are from and what they're supposed to mean
explictly, including the difference between UBOOT_ARCH and UBOOT_ARCH_DIR.
UBOOT_ARCH_DIR has issues which will need discussion with newer platforms
which use dts/upstream.

You might think we need to set ARCH in EXTRA_OEMAKE for u-boot but it turns
out it was ignoring the value and setting it breaks builds. This patch
therefore doesn't do that after confirmation from the u-boot devs:

https://lists.u-boot-project.org/pipermail/u-boot/2026-July/627045.html

This is confirmed by the UBOOT_DTB patch which added the kernel-arch inherit
which is much later than when u-boot was established.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/kernel.py              | 2 ++
 meta/recipes-bsp/u-boot/u-boot.inc | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/kernel.py b/meta/lib/oe/kernel.py
index bab375c37ae..6c57ef402e8 100644
--- a/meta/lib/oe/kernel.py
+++ b/meta/lib/oe/kernel.py
@@ -38,6 +38,8 @@ def map_kernel_arch(d):
             return a
         bb.error("cannot map '%s' to a linux kernel architecture" % a)
 
+# Return a value for the -A parameter to u-boot's mkimage
+# This would be the value from the table in boot/image.c:uimage_arch
 def map_uboot_arch(d):
     a = map_kernel_arch(d)
 
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index a75948dfc34..3e2f5aa1a5f 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -6,7 +6,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS += "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mkimage-native', '', d)}"
 DEPENDS += "${@ 'u-boot-mkenvimage-native' if bb.utils.to_boolean(d.getVar('UBOOT_INITIAL_ENV_BINARY')) else ''}"
 
-inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kernel-arch
+inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native
 
 DEPENDS += "swig-native"
 
@@ -34,6 +34,11 @@ UBOOT_INITIAL_ENV ?= "${PN}-initial-env"
 
 require u-boot-configure.inc
 
+UBOOT_ARCH = "${@oe.kernel.map_uboot_arch(d)}"
+# UBOOT_ARCH_DIR is the directory which contains the UBOOT_ARCH, i.e. the options are
+# the directories listed by "ls arch/" in the u-boot source. It is broken for platforms which
+# use dts/upstream.
+# arm contains arm and arm64.
 UBOOT_ARCH_DIR = "${@'arm' if d.getVar('UBOOT_ARCH').startswith('arm') else d.getVar('UBOOT_ARCH')}"
 do_compile () {
     unset LDFLAGS

