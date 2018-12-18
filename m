Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 739267BF92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 12:03:44 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z5so15611085wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 04:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jZVsCinp0W5JvHHvTMS5JETWbhBHtqexCyDSZigVRrM=;
	b=UJJVR/rmQe2e9xk6caf6mc/LFdbq5qoyHBjfQuA5jKNlXjrITrcryveUEQUsbWIQsL
	43FkeNTyto60BXQyydM+b57zRZXX/PKFs3e98SqbjA78sKKk39vadtF/4psPEju4PPwY
	dLSHXCJJXkpUQQLZ0IRcJj+ewyaG9SYZodVnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jZVsCinp0W5JvHHvTMS5JETWbhBHtqexCyDSZigVRrM=;
	b=Zkw5ZBYYpbhJp//xDGqeTYdNO8dsNmgxQuYzWOunAWKG3db5usEx6u75MTwKLktt2c
	8G2VxOk2JKKpUCIPxEE2nrd8EXWHUDLAICrTSnSrePp8rLVRBAFFdn8pl5Uf5k9c/gLs
	lDTKeRXxPI5y8kGGk2LctGmcFP5Uxp3RRsyCTPzJ+o2yh5AiJb2JPyTo90B0S4P3HWvI
	2RP+VuNvxYlGmVEOdPIFwbl6is9tAl240vcp9Mxv7JRLZZ3tY5yjWeF8rfDQbh0wS2pJ
	sNyGGxrrxjupWjcQopxLhhX7Bi/PBVUg0hXKop4tuKBkJrRbf5vo4DYqaOPY9GWa4mqd
	3vQQ==
X-Gm-Message-State: AA+aEWYnAgs1wud8iKtyQcLWn0nqpEYJ2kv7NxbOYAL8czQHcPMNN6av
	NwJNaYgZR6gjoEt6HfbxFuJSmpCV+hYZ3w==
X-Google-Smtp-Source: AFSGD/WyFCoKXm1gkv3fHhWXXr45Ji+Y6CRdSx+wum9PT12f+OId7b44EfOPioeL620HhCumO8XAUw==
X-Received: by 2002:adf:b783:: with SMTP id s3mr15087052wre.274.1545134624815; 
	Tue, 18 Dec 2018 04:03:44 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	10sm1684156wmy.40.2018.12.18.04.03.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 04:03:44 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 12:03:37 +0000
Message-Id: <20181218120337.25019-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181218120337.25019-1-richard.purdie@linuxfoundation.org>
References: <20181218120337.25019-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 6/6] gcc-runtime: Add missing libc dependency
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
X-List-Received-Date: Tue, 18 Dec 2018 12:03:44 -0000
Content-Transfer-Encoding: 8bit

For reasons lost in the depths of time, perhaps performane related,
we only have a dependency on libc at packaging time. This is too late,
as demonstrated by a recent build failure on non-IA builds where
the glibc 2.29 upgrade had been removed from the build:

ld: recipe-sysroot/usr/lib/../lib/libstdc++.so: undefined reference to `log@GLIBC_2.29'

libstdc++ should have been rebuilt but had not as the dependency
wasn't present.

Add the missing dependency to avoid this problem (and drop the other
form of dependency which is no longer needed).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 9e7e7c5b3d6..95153da20cd 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -128,7 +128,7 @@ do_install_append_class-target () {
 }
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++ libgcc"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++ libgcc virtual/${MLPREFIX}libc"
 PROVIDES = "virtual/${TARGET_PREFIX}compilerlibs"
 
 BBCLASSEXTEND = "nativesdk"
@@ -288,7 +288,3 @@ FILES_libmpx-dev = "\
 SUMMARY_libmpx-dev = "Intel Memory Protection Extension library - development files"
 FILES_libmpx-staticdev = "${libdir}/libmpx.a ${libdir}/libmpxwrappers.a"
 SUMMARY_libmpx-staticdev = "Intel Memory Protection Extension library - static development files"
-
-do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-- 
2.19.1


