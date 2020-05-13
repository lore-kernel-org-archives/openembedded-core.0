Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.7087.1589379884142289657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 07:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r6sc4Zgq;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id 190so11912431qki.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ReQkynPCrsBgnWXHJ8+F2NGa9lOoj8t3GTTZYxP0vJc=;
        b=r6sc4ZgqsFs62hJPIh59bdNqLnlAYiroQWByVGPHdOTe4yO5R6/vqTViJTnb4lmjmc
         03BVAaI2lqFFyEEco84HFNsCf5V/TzLx9a6f023F7u8jTnAFNvy5OuZFXESwyX1NNiEp
         DewNFVVzHNxJoza4Ysx4+i1uRnvg3/pJjhxKwoG3iAblyAnllblPvIMqoOqwR3jzW/Ho
         p1FaqmM1KlwCByGX439oiXFk4BtYVkwIIjPMcpl16gO2N2HpqI1sxzFC0TApsWUUAtup
         uKedpac441Z7HRw0RMAdR0zgV9aDRGx6v9QwWM9QRdXzDuPtjn4iOrWm9Zzs/WHlj2F3
         MELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ReQkynPCrsBgnWXHJ8+F2NGa9lOoj8t3GTTZYxP0vJc=;
        b=XAmK64VBFMm8dg/JrTFkivxEHJHDfzW/nPxNjHRjMo+uVp88vdIvtHDssNFYizeIEQ
         M2imZOXLezgPqKyCk+KGjfkVuoWztbdnI4FIOyzpkI9AwEiv4Znvm4r3k52YTO/bnCXw
         p9YRE8vgUazGE7nw3HlnVJ3Y574+DDwmUq4Ddyua5SK+exgLLXd5mTjXJ7CFGkhU+1C5
         NbHsZhx5Ju7p2Ido/fgIGxoGrAKXgEV32wGkQbyMwIbPqxiw0u/G+tmGvkzDhrlBuSOe
         0wenzj7gsPE4AOIM+nnBVDBqehIOPoXCHLGhuiPwQMVdglno6SSgPcMb/Bao+Y6kNdVU
         ngyA==
X-Gm-Message-State: AGi0PuZcePTePUFfJAwJs7xVFO1RQff1oNXxtdQUYbA9HVNmJAEuuW7n
	Yjb1O3bMbC+sFa21LCGDISI=
X-Google-Smtp-Source: APiQypLR1pcogMrHD2sWQJhfjLjXPhGyHb24nDVLAPGaPjILeEqzJzUXSVVq3HnMTwysMSaNnaiRyg==
X-Received: by 2002:a37:af47:: with SMTP id y68mr26517634qke.4.1589379883291;
        Wed, 13 May 2020 07:24:43 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 5sm10138445qkl.101.2020.05.13.07.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 07:24:42 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Subject: [PATCH 4/4] kernel/reproducibility: factor kernel source epoch for common use
Date: Wed, 13 May 2020 10:24:36 -0400
Message-Id: <d09f4c9abf8c9e0ff342c4b5d6323eb371391c63.1589378829.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1589378829.git.bruce.ashfield@gmail.com>
References: <cover.1589378829.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Rather than duplicating the code to generate the kbuild environment
variable: KBUILD_BUILD_TIMESTAMP, we can factor the checks into a
python function and call it from the main image and kernel module
do_compile routines.

All paths have been checked and the timestamp is identical to the
previous shell variant.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel.bbclass | 43 ++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a3990aaf59..de63e1c0f6 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -153,6 +153,21 @@ python do_symlink_kernsrc () {
 }
 addtask symlink_kernsrc before do_configure after do_unpack
 
+def get_kernel_source_date_epoch(d):
+    import subprocess
+
+    s_d_e = d.getVar("SOURCE_DATE_EPOCH")
+    if not s_d_e:
+        s_d_e = subprocess.check_output(['git', '--git-dir=%s/.git' % d.getVar('S'), 'log', '-1', '--pretty=%ct']).decode('utf-8')
+        if not s_d_e:
+            s_d_e = d.getVar("REPRODUCIBLE_TIMESTAMP_ROOTFS")
+
+    env = os.environ.copy()
+    env['LC_ALL'] = 'C'
+    ts = subprocess.check_output(['date', '-d @%s' % s_d_e]).decode('utf-8')
+
+    return ts
+
 inherit kernel-arch deploy
 
 PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
@@ -291,19 +306,9 @@ get_cc_option () {
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
-		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
-		# be set....
-		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
-			# The source directory is not necessarily a git repository, so we
-			# specify the git-dir to ensure that git does not query a
-			# repository in any parent directory.
-			SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
-		fi
-
-		ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
-		export KBUILD_BUILD_TIMESTAMP="$ts"
+		export KBUILD_BUILD_TIMESTAMP="${@ get_kernel_source_date_epoch(d)}"
 		export KCONFIG_NOTIMESTAMP=1
-		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $KBUILD_BUILD_TIMESTAMP"
 	fi
 	# The $use_alternate_initrd is only set from
 	# do_bundle_initramfs() This variable is specifically for the
@@ -332,19 +337,9 @@ kernel_do_compile() {
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
-		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
-		# be set....
-		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
-			# The source directory is not necessarily a git repository, so we
-			# specify the git-dir to ensure that git does not query a
-			# repository in any parent directory.
-			SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
-		fi
-
-		ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
-		export KBUILD_BUILD_TIMESTAMP="$ts"
+		export KBUILD_BUILD_TIMESTAMP="${@ get_kernel_source_date_epoch(d)}"
 		export KCONFIG_NOTIMESTAMP=1
-		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $KBUILD_BUILD_TIMESTAMP"
 	fi
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		cc_extra=$(get_cc_option)
-- 
2.19.1

