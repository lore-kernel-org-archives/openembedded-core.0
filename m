Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id E415765DF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 16:40:33 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so3009505eek.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 09:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=1ygtsMjaCBOibv9C0eY/1EfAXWNJZGLkomXTIPw/90E=;
	b=YPmlDuNdj5l6frEvAS4/q3+s9HCsv5DFwUDPxzZCbKN5c4xh8eol6rwsFkpA2zPH5L
	K+PUzygaf4WkmprTj3OmdFjrWFs4tJbRc/gTeUK15o03fsnsbk+phVbiIMI3Z1N4ibS9
	05uKDI01uIv77eKGhfZMQYaZVHxtIlPuaTy2IJMSjQ6cWvqUbfX7Maswb/wOlhmsUNY/
	45ujpfMBxBbrYAZwTkepG94K9jdR6QvFoiGtNpvWKT5VfEaVwznMmZ+nTgghk8+e8q8B
	K60ph8TuRsxBKayVyvYR3W/KdjsB4beq0Antk5TaemG/GDzOUUl9PNn9Qotn5Bzb4u/v
	zVxA==
X-Received: by 10.15.61.133 with SMTP id i5mr3440703eex.80.1398444034681;
	Fri, 25 Apr 2014 09:40:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm26109795eeg.8.2014.04.25.09.40.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 09:40:33 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2014 18:40:30 +0200
Message-Id: <394b5e1da57b3bf0d90c1c5185f394d865a394bf.1398443925.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398443925.git.Martin.Jansa@gmail.com>
References: <cover.1398443925.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1398443925.git.Martin.Jansa@gmail.com>
References: <cover.1398443925.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/5] WIP: feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb suffix
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
X-List-Received-Date: Fri, 25 Apr 2014 16:40:34 -0000

* this means that recipes with ARM_INSTRUCTION_SET explicitly changed
  to arm will be built in feed without thumb suffix
* It looks like the rest of system doesn't correctly support different
  TUNE_PKGARCHs for different recipes (e.g. eglibc-initial fails)
  so this needs a bit more work

  config.log:
  configure:2768: arm-oe-linux-gnueabi-gcc  -march=armv5e -marm -mthumb-interwork --sysroot=/OE/build/oe-core/tmp-eglibc/sysroots/qemuarm -c  -O2 -pipe -g -feliminate-unused-debug-types  conftest.c >&5
  /OE/build/oe-core/tmp-eglibc/work/armv5e-oe-linux-gnueabi/eglibc-initial/2.18-r0/eglibc-2.18/libc/configure: line 2770: arm-oe-linux-gnueabi-gcc: command not found
  configure:2772: $? = 127

  and the problem is basically that STAGING_BINDIR_TOOLCHAIN points to
  different directory when building recipe with thumb enabled and
  disabled, in this case gcc was built with thumb enabled and is installed
  in:

  sysroots/x86_64-linux/usr/bin/armv5te-oe-linux-gnueabi

  OE qemuarm@ ~/build/oe-core $ ls /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/armv5te-oe-linux-gnueabi
  arm-oe-linux-gnueabi-addr2line  arm-oe-linux-gnueabi-elfedit
  arm-oe-linux-gnueabi-nm       arm-oe-linux-gnueabi-readelf
  arm-oe-linux-gnueabi-ar         arm-oe-linux-gnueabi-gprof
  arm-oe-linux-gnueabi-objcopy  arm-oe-linux-gnueabi-size
  arm-oe-linux-gnueabi-as         arm-oe-linux-gnueabi-ld
  arm-oe-linux-gnueabi-objdump  arm-oe-linux-gnueabi-strings
  arm-oe-linux-gnueabi-c++filt    arm-oe-linux-gnueabi-ld.bfd
  arm-oe-linux-gnueabi-ranlib   arm-oe-linux-gnueabi-strip

  but when building eglibc-initial with thumb disalbed, TUNE_PKGARCH
  becames armv5e and STAGING_BINDIR_TOOLCHAIN in PATH points to wrong dir:

  $STAGING_BINDIR_TOOLCHAIN
    set conf/bitbake.conf:354
     "${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
  STAGING_BINDIR_TOOLCHAIN="/OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/armv5e-oe-linux-gnueabi"

  OE qemuarm@ ~/build/oe-core $ ls /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/armv5e-oe-linux-gnueabi
  ls: cannot access /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/armv5e-oe-linux-gnueabi: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 8a38665..6c5d1d6 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -28,7 +28,8 @@ python () {
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
 OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb', '', d)}"
 
-ARMPKGSFX_THUMB .= "${ARM_THUMB_SUFFIX}"
+# Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
+ARMPKGSFX_THUMB .= "${@ d.getVar('ARM_THUMB_SUFFIX', True) if d.getVar('ARM_M_OPT', True) == 'thumb' else ''}"
 
 # Whether to compile with code to allow interworking between the two
 # instruction sets. This allows thumb code to be executed on a primarily
-- 
1.9.1


