Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3E8FD4F26
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:13 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2661.1773168066491886374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WlIpjzjt;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-46702742c7dso667549b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168065; x=1773772865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bs/2ESNOjlKv5F2a1L5fY1cfh3Mb2GOypfpxUG+ELw=;
        b=WlIpjzjtnuGlPpwbu5W8VZ+0EMZ9r9veKKQi+dIP4lsXG1J0rCeKlEyKDesmVOSeYk
         b8iPEU/DDKJ2We/SngWijgp1zyJq2Ar9fw3dfp6pJfvGiJvJ0dtE3eRf2dlSrZMnKbGM
         IjYJssvkX00BH/WGgzvjZJGr4CfogVUD4ujy3wl3UeSIkhz+yAsVbJWqvPnQybQdUhDe
         yEJTajRHHDUEw5m3gDck7mDX7p9damf/dJERoN75vUP2jZsWRdf4bYUAH9M1GOFgZ+ur
         0E9X347gF6/wmMBjvvhuAZ+dZzeBUZmycHhKPFeKTltp1U2j6+mORco1HykThZX2qrTy
         97oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168065; x=1773772865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7bs/2ESNOjlKv5F2a1L5fY1cfh3Mb2GOypfpxUG+ELw=;
        b=eHDgG8rCmcDEbwAo7EFyauC/TSJj6H26zJbwWgE2C2eWLzBa1R+/GQEbH0vh3U7pxe
         40pSSXS+9clHbXgxeRHXUSWjmWzjYXfGoDVAPnBqEoTQ1PxtwvDoSnm/kuSj4p2zoyw4
         z8riyo5YZbAPkw2OQLZWH7RqQmbtaNxEK/km9g8PVA7EQGKkwkoBauFNLhfxkBo8Om7g
         lsiMP87TYMLB9Al/Nb1DedVUEsldaa/kmt1LKu30ITd4kPkfX4+CP3MOTe/l/2dqYdJz
         aU53dEhiywt0CTYepV6aOuK3sbtb0fz6opHlOeA1fcrujcBeWwchfArpXWdcGCccYCXe
         eVGA==
X-Gm-Message-State: AOJu0YzHzqbVw9M9D9Tt0z2SlYBX2nepoUrCJIf/VT4nKLlKUAcxEcl9
	Yh0LOKFjidSiM+SOWk66wXjQUOYlZ9Jx4ESG1FNCDBt3IiO7aaJDRCatyugnDw==
X-Gm-Gg: ATEYQzztwJJL0esCWvbB2qMRFDHY31jCsbFe1FDc4Oi4m36OOWy3j4gPjTjCDUVl04h
	MYRJ8o73nkO5Z72PpAotnTlARwW1puTFR592k2qUKmUDNMDXPUGnFHpnDtkuKSJD8T1rj6tynAT
	ExJPiMARKlpeZc2B/GtZu6ctqjZM5NMba9V0KW1p+uFKOlUHveV//ak+IBXkAX6vNmqI+r3rZz7
	LwQpZkawWayppbFKf83+kEoyqbvRPX2Aeie12VxgNJj838wid+6xQ0HD15JYfpjeYqXMKIJSEtr
	vLAQB9stIwSa9TL+9HHDnR56Mx1ONy3qMLC0CNOrt/Jc4Lq5yOxwYzP60Yj1qtSnHtzV5PO4bTH
	uQzwpU95QOlnxPbTkmwugLdeyW6L1jbfCrYqjI90yOHfvqg5+2KDuyZDcH8Dv7MQR+Sb0dHsSba
	j2qSzoCpnEaowepAo167xJoK61+d2/AqE=
X-Received: by 2002:a05:6808:2e44:b0:467:2509:c20a with SMTP id 5614622812f47-4672509c5d6mr1365442b6e.47.1773168065445;
        Tue, 10 Mar 2026 11:41:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::9891])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671d2a7ebfsm2444524b6e.20.2026.03.10.11.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:41:05 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 02/15] gcc-source: Use allarch.bbclass
Date: Tue, 10 Mar 2026 12:38:22 -0600
Message-ID: <20260310184058.533343-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232813

Converts the recipe to use allarch.bbclass. This is necessary because
SSTATE_PKGARCH is set to "allarch" based on if allarch is inherited or
not. If it is not, SSTATE_PKGARCH has the value "all", which means any
data written out based on it cannot be found (because "all" is not in
SSTATE_ARCHS)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 265bcf4bef..3ac679b1a6 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -1,11 +1,11 @@
-deltask do_configure 
-deltask do_compile 
-deltask do_install 
+deltask do_configure
+deltask do_compile
+deltask do_install
 deltask do_populate_sysroot
-deltask do_populate_lic 
+deltask do_populate_lic
 RM_WORK_EXCLUDE += "${PN}"
 
-inherit nopackages
+inherit nopackages allarch
 
 PN = "gcc-source-${PV}"
 WORKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
@@ -14,14 +14,8 @@ SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
 STAMP = "${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}"
 STAMPCLEAN = "${STAMPS_DIR}/work-shared/gcc-${PV}-*"
 
-INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
-TARGET_ARCH = "allarch"
-TARGET_AS_ARCH = "none"
-TARGET_CC_ARCH = "none"
-TARGET_LD_ARCH = "none"
-TARGET_OS = "linux"
 baselib = "lib"
 PACKAGE_ARCH = "all"
 
-- 
2.53.0


