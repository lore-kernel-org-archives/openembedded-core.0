Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4945C36007
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 15:04:40 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.2138.1742569478487199305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 08:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=F+5IkOux;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22359001f1aso16578915ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 08:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742569475; x=1743174275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TuiNfXaJiivsq2KY/iwOYui49i+AD4pEo5IqHko1s9Q=;
        b=F+5IkOux/PcuKdMRxJEZNZlqLMeyKjA8V82fotkdgFCCfAzF9dVan2xwMENJ3UPUdW
         jJoNle+jBt+Kf2y/9YJ9VS3EOajP6VUP97WaotoGFAaM7mV+dhrOm9XFI5WOXQNQjRL2
         DAmx7IRd+MT/wvuxc4XH/ibsnFHVDxlnSBvIA+OlkPozYQo7TWaWkgLIfiAmC1H9Sbyc
         pOxZPUeqi51gMltL6YYSpygCGOWYH0LX2695oBNi5cQPe/li8QytbILLzT3XYgRsqdN7
         5XHVKfUy2Tez0+TTWBb91BMAOREVESiiVEDQwv6VGO0erLkDgHbH/Exy4hB1eY7MhEuL
         iAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742569475; x=1743174275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuiNfXaJiivsq2KY/iwOYui49i+AD4pEo5IqHko1s9Q=;
        b=vn/neCpR0JhAwxtlnfXfgl3c0tSc/bByYXnQez0Hfh54f3MXC20koooH9ZwmaGMCp4
         678sWVMRKhNysFuJcaay4W7p3OfMg6VzWSlPphOyrcAqfTYj2FSeUtCLmM2qqzJgPP3h
         //RM4Wk8t82dlymeWUs9GG6Lu7Ns8+2gGecieqJcj/4UvvNVG4tyxwieGU/3UqKeihP+
         QFJLmnQtrhOb2TYlghxX0uZqPit/N1lOysWKKnSgPrGECWAD1NyrI9dS1GS3Ja1p3tuN
         VpNazxZG/var0FvOD1YwYR3YoQgdkmxLORfkRXW/pw7Nl/BNwbedSKL5Q7YCMIGBeyd4
         ZoeA==
X-Gm-Message-State: AOJu0Yy9OlOXOuCWzFCLl/bBrDG1e5hCcVItRopukBFrxiX/uGEAAjBA
	rl3RiS404roK35BQYSFYXd1bsaayH42AaDhcyVhcEXRaotsmZVMqRvo9JKHYC4ye9e/bAnjV+Yu
	9
X-Gm-Gg: ASbGncsb1X3eaChi6HTdmxbs98I7JHL2xAFv288ibCx9NjxEZI8UeEJh4Et2KI0FQ2V
	jWm8x+rKZfy/UcrIdMQ4CNoXrI89rpfONhbdPEtBgcaZkTROiGZKahJieb/FI/ntt/698kaXg+F
	+cUpKWHk8FcHYhTLYGCqgCqJeS2OvpkMPvhDuN3AdcC86CUtePEPz9slbUYp5S7aQFqpgQtmINZ
	8M86p5Q+hjODea7EpDenYNOjZzE4lEddDKZUZMbaN1rzuLYeihsFtNoP8rUiKqBmto8h2aDD3Nx
	AF/mEtc2XRN61paroI46sjLnFB0mG3Qqmo95
X-Google-Smtp-Source: AGHT+IH2/ZAz4x56NGdy3NKenoGEldxbwRgQoEDazs9KfvGGC8SjEON7XkztqKJ7SpxZfP6D0P0mLg==
X-Received: by 2002:a17:902:e543:b0:224:1935:d9a3 with SMTP id d9443c01a7336-22780d78745mr51369995ad.21.1742569475245;
        Fri, 21 Mar 2025 08:04:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2534:4cdb:e422:e636])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd5788sm2076620b3a.50.2025.03.21.08.04.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:04:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/5] gcc: unify cleanup of include-fixed, apply to cross-canadian
Date: Fri, 21 Mar 2025 08:04:23 -0700
Message-ID: <621e0ac9308cc163fb767a27d63fff6570896b92.1742569342.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742569342.git.steve@sakoman.com>
References: <cover.1742569342.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 15:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213477

From: Denys Dmytriyenko <denys@konsulko.com>

Since target and cross variants were already doing similar cleanup
of include-fixed headers, as those aren't used, unify the code and
also apply the same to cross-canadian variant.

Some of those header files get processed with a tool that leaves
absolute buildpaths inside the file's commented section, causing
QA errors. Since those aren't used, let's remove them.

This may be a temporary solution until the tool itself gets fixed
to not embed absolute buildpaths in the header files:
https://lists.openembedded.org/g/openembedded-core/topic/107268307

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc      |  4 +++
 .../gcc/gcc-cross-canadian.inc                |  2 ++
 meta/recipes-devtools/gcc/gcc-cross.inc       |  2 +-
 meta/recipes-devtools/gcc/gcc-target.inc      | 31 +------------------
 4 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 7f5cc109e6..01de93cc3c 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -138,3 +138,7 @@ remove_sysroot_paths_from_checksum_options () {
 	sed -i "s@${DEBUG_PREFIX_MAP}@@g" ${B}/gcc/checksum-options
 	sed -i "s@$stagingdir@$replacement@g" ${B}/gcc/checksum-options
 }
+
+cleanup_installed_include_fixed () {
+	find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type f -not -name "README" -not -name limits.h -not -name syslimits.h | xargs rm -f
+}
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index adcaef2b0f..69ca18bf6e 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -174,6 +174,8 @@ do_install () {
 			done
 		done
 	done
+
+	cleanup_installed_include_fixed
 }
 
 ELFUTILS = "nativesdk-elfutils"
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 1dbb6dc42b..9c8cc94c3a 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -108,7 +108,7 @@ do_install () {
 	cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
 	cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
 
-	find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type f -not -name "README" -not -name limits.h -not -name syslimits.h | xargs rm -f
+	cleanup_installed_include_fixed
 
 	# install LTO linker plugins where binutils tools can find it
 	install -d ${D}${libdir}/bfd-plugins
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index f51d94cd65..08141f32e6 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -206,37 +206,8 @@ do_install () {
 	install -d ${D}${libdir}/bfd-plugins
 	ln -sf ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/liblto_plugin.so ${D}${libdir}/bfd-plugins/liblto_plugin.so
 	chown -R root:root ${D}
-}
 
-do_install:append () {
-        #
-        # Thefixinc.sh script, run on the gcc's compile phase, looks into sysroot header
-        # files and places the modified files into
-        # {D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed folder. This makes the
-        # build not deterministic. The following code prunes all those headers
-        # except those under include-fixed/linux, *limits.h and README, yielding
-        # the same include-fixed folders no matter what sysroot
-
-        include_fixed="${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed"
-        for f in $(find ${include_fixed} -type f); do
-                case $f in
-                */include-fixed/linux/*)
-                    continue
-                    ;;
-                */include-fixed/*limits.h)
-                    continue
-                    ;;
-                */include-fixed/README)
-                    continue
-                    ;;
-                *)
-                    # remove file and directory if empty
-                    bbdebug 2 "Pruning $f"
-                    rm $f
-                    find $(dirname $f) -maxdepth 0 -empty -exec rmdir {} \;
-                    ;;
-                esac
-        done
+	cleanup_installed_include_fixed
 }
 
 # Installing /usr/lib/gcc/* means we'd have two copies, one from gcc-cross
-- 
2.43.0


