Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B50C27C51
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:16 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.36112.1717244711683719390
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gVdS0KE4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6c7df306e86so334691a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244711; x=1717849511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62QOrcVHx8CZeLylUqOWA4GxFzaKRdDsXx1M5Xnt3bc=;
        b=gVdS0KE4fce/I9IC3Z8KGNV4pNvLjFHSHfnYsA2cC2fyCWI0BBJyeyt78tVuB9vLV5
         7nbSHsqViS3YoHf3AkHADn1c3JtdpN+VJWBwt0n7Nbq+50yAxxlsYFVI1jZ2CtuWhEDZ
         IO74HBgsqroQ6UwaD9i1/4cixYUvcsCb3Lr6NZR6m+S7RhibGUE7LcgaQd5WAkYlY1uo
         h2DvW35YbiOpvOqAyLS6tHN9SMacXGeR+yWcZCB7J49GELTxPFL6jXRWNPNTUgdfmPo0
         dXN6hOlZgvL2PhPWFVC+/7oExnOLBKtti1a8q1CSA44JUUK14td/KOvLkXi9oXTYd3DP
         o91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244711; x=1717849511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62QOrcVHx8CZeLylUqOWA4GxFzaKRdDsXx1M5Xnt3bc=;
        b=SFZHoyTAagx2sw2nyUmcUm9UdOd7W2B6Z0Rn8/g/ZA7dkQRl0MreJjqmasYUuBhmpq
         CH6WyXRLjkmS0NA76jqP/muOGu05Q1HenyDaiKHuIxSMI5mEw3sH96xBEuK/Yi00Hrto
         vujoAbA/7/LdLr8tZrJV82j4hNkOZkbdNUhmM51hr5WZnl31q1vKC65VjsJ00PKlzIRj
         th9L1ohGNY637GPBJWUtxcTTjSNCzE9c9J/e/mSxfLAuzK46oyQXhm3r7SWnTR8tnVzu
         77l/3iT77gY+eeWScfFSrUsysIxNGvzPkXVnA6gcAqdT/anRMpe9O2z3GI53Ic+cR0OG
         z6pw==
X-Gm-Message-State: AOJu0Yzzy8UlmgoAjAdloX7MqmimtjDNDjj0ZrVrYQSUy+z/rrVGrJZy
	PQA/ZCEdeRFifpIdVGTqHp/hSoHaqhg11QW2gDO0ZLBwKpE970liI+74f6deQoeM+f3lpi1xX7A
	X
X-Google-Smtp-Source: AGHT+IG1aDSmStZRTE2evVY13hdg4k1TfH+iy9sgk3NUv0AOo90Y5M6ugG2HrSSx1PzZ696m5d1RRA==
X-Received: by 2002:a17:902:7846:b0:1f6:62c:96df with SMTP id d9443c01a7336-1f6370c3b66mr35244685ad.69.1717244710898;
        Sat, 01 Jun 2024 05:25:10 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/21] llvm: Switch to using release tarballs
Date: Sat,  1 Jun 2024 05:24:38 -0700
Message-Id: <251d626a7d3cf6dfb3c0d8617f6cace666c7ea74.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200108

From: Khem Raj <raj.khem@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

git checkouts are in excess of 3G, which is not
ideal for everyone to download/clone, instead switch to
fetching release tarball which is ~126M as of 18.1.5 release

(From OE-Core rev: 800e6576e4f3af10846af13c2f217f986c1afdb4)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../llvm/{llvm_git.bb => llvm_18.1.5.bb}            | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_git.bb => llvm_18.1.5.bb} (93%)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_18.1.5.bb
similarity index 93%
rename from meta/recipes-devtools/llvm/llvm_git.bb
rename to meta/recipes-devtools/llvm/llvm_18.1.5.bb
index dfaa031012..4b6763e580 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.5.bb
@@ -13,27 +13,26 @@ DEPENDS = "libffi libxml2 zlib zstd libedit ninja-native llvm-native"
 RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
-
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
-PV = "18.1.5${VER_SUFFIX}"
+PV .= "${VER_SUFFIX}"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
-BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "617a15a9eac96088ae5e9134248d8236e34b91b1"
-SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
+SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
+SRC_URI[sha256sum] = "3591a52761a7d390ede51af01ea73abfecc4b1d16445f9d019b67a57edd7de56"
 
-UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
+UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/git/llvm"
+S = "${WORKDIR}/llvm-project-${PV}.src/llvm"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 
-- 
2.34.1


