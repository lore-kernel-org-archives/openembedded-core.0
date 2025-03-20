Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05033C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 16:21:20 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.12047.1742487675960635744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 09:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FeKFEvGg;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso172976466b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 09:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742487674; x=1743092474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fVj5iWxR4t/KuutbvLoYg0xQ8URsf6bImx9mjFPEQUw=;
        b=FeKFEvGgloQVGOIuczQcw6XzkjfGl8zeIbF+7xYwb97Y+3pkHh2lyQ+m0Nkwo4Ihoi
         V0ZqOVwaxcXSwq+dUHtSDDaRSfUhJVe6khIgBqBetpaEobw/iAIGVxxZhTVnGsssTuaV
         ue9EevSmcuYrpEPqpA4LIPyxxKNkkhRJkXODK78veM8YJPP+ujKuQui4IoDifOCPTMsg
         jUqh4OewoA3qQXs9yxwqZw/LriY5S6dzRvHIaiPOx6sIUNxljcw5Ju4bpCfDCVoIIAcB
         OpFqYD+LFE+iCcgDPbJ4uZHzU42uLfmp1/Auje4Jl2e65F4gIsJDxUR5hMLb2eM6hllj
         EYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742487674; x=1743092474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVj5iWxR4t/KuutbvLoYg0xQ8URsf6bImx9mjFPEQUw=;
        b=gHHkvYiBUbVDp1g8ySg8qDU0evsNoGZxLyUqI1dmErrpBT9CxBjbdUCb6G6Zt5AkVl
         4pes+rMe4TPWLeQQ5F/oaXuWDR3f8WmFUbhrifT7dI6W8T966/lnAvc4q+HtLd9bMWNv
         a2YduLvFvBSeN3j+2IZSkuy+p4/YnjrsyEzgx0GrjJlokKeq3+3aDZDRt6qVy/n8u4RF
         BfLwbnk6j0o9jvj6qUluNbZZ19eDucojbglBrpJrrtcoCexDiHSrJFTAxriCrbMrZ56q
         kj9yQWBAWEqG0B+LhU12W19H2XeSSMhcmCgkpPjCyxzNCtch9JQSThnopwTD4KDeQSVi
         kUmw==
X-Gm-Message-State: AOJu0YyohyWIgJxfj6EA+hq8i87/hkMxPixf8anAa4FNU02JFojIRxWc
	9JAzG8IbSBbm+2ZQKTcrUC3n/EU8GlCra0MyOaDZ9gsjdPdST+1JL0Xw5A==
X-Gm-Gg: ASbGnctOFEjiApiiA6/lI5xdpthRvrxQMauTeBYt4DQfFcPqlpHaOxy1DB82ZpNrBaa
	uqZpuIctB/rBqh5XtnwcMg+V/fUxYaK7H3G7NCHvBUpnImhPw8nXdFjT3R824S3oxpX9GYcXVjd
	aC5rzHLD3agd5LkPVVv3LvA2IDYyh4PRR13FthxgxWy7zXJmjv4fRt+Z1LU4Nq+5GV0djekE2OG
	+IVaCUZudGS5nTSxG7TZgLGH9CgE/DNXCR5We/ZKjkw/VjzI6vMtKdU3W2Jzd53k27iWwPWrjvf
	uf0WZyhdb0rnLvNAyspOoztuhaOfSVUZUEDvuH2dLwLudza9NZlYmeo8a5LMNPucZpCc1cmAKnU
	Qew==
X-Google-Smtp-Source: AGHT+IFu2lb+vzm2lWM1dYN7nTROYyYAT0BQ/IB+kHXvEArqQihePnw9HxE9lBmNbZAXN5koHMxNlw==
X-Received: by 2002:a17:907:6e8c:b0:ac3:8537:904e with SMTP id a640c23a62f3a-ac3ce1c9e00mr434300766b.49.1742487673881;
        Thu, 20 Mar 2025 09:21:13 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac3efd48021sm5390766b.168.2025.03.20.09.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 09:21:13 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Denys Dmytriyenko <denys@konsulko.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] gcc: unify cleanup of include-fixed, apply to cross-canadian
Date: Thu, 20 Mar 2025 17:21:07 +0100
Message-ID: <20250320162107.3852707-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 16:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213412

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

