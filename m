Return-Path: <nathan@nathanrossi.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id B338D7FC86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 06:58:04 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id s8so6154325pji.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 22:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=mGBHr3hjohKDFra8SgcuZFBzaIPoTGeZTe21qq0y5mY=;
	b=YjRNrzTTU4JgcnYR0OSxWCLsAgqTDPpxYiXPRrbrn0yDbwlg4+bIXA5iGWuPEaccz5
	T4GEIdMZlFBt5tMqPyTlHF6COVmfjEK3n7zvfH9mqpZPSPKjMGhtr1+J6sgfHL+BgIuG
	U1e73PbLFdOfYiCwHhh3z+JHq8BQfCbulTU7hmOgACQGbEUHIrbjYI6pvsDMV1OZQ4k6
	s2c/ZA4mefZ9MuiS//PzIgRZI7TynENGCE62NXqNBgVrpAxJYWkiGj1Ou+8RpMqUuO8x
	yMYBt7VMC91Ru9fsdyHW/Z6DyZDIDQjhkH9tjMz5SUWcrg6o3x4RyVbERkI+73dkKeZL
	sLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=mGBHr3hjohKDFra8SgcuZFBzaIPoTGeZTe21qq0y5mY=;
	b=KNnu2fbG7X6TrqiPX0Vhw+cIggPvE952Ua0krUFUn4nL2a1xOfa4AOrPRkF/HTcQKB
	Qoc+iGcUp+Xt5tqufksSjXdhqf97Wxm6F7KsqV+AKlPkogLC+7V11kUzO+yWXM/65ZiL
	eU8W+HoHk4nzo9n7TQsuZXrig7XD2Y/tEdAgAJQ3hUmq0m4ffLB9htNhv0OA7aWar+U2
	0Gd7ugEGVZMXKMRnMZadk/qRVi0mRf5UeCPD0cZBrAA1LYuXLClAzxcfzdrODUfRi8QX
	SzmSD7olhvSuBkR9xtwARGxon0geHgM48C5uzG5zFS3umSoDjmsYJt9omOClNSwcngIL
	VmNg==
X-Gm-Message-State: APjAAAWYXW/wadsp89brELs+e0RK96cMWpnKVR6+aT5cKmpXy1LZYtHE
	C0l0GkbZjScIeNYEhfILwnX7bA==
X-Google-Smtp-Source: APXvYqyg5oDOPB1jDC6D6VyXHHS+nuMp1Qpukzk0is4Ql5R6d+5BouwX0/lzKEAaIsbtANuaBWkFhw==
X-Received: by 2002:a17:90a:19dc:: with SMTP id
	28mr37755123pjj.32.1574665085647; 
	Sun, 24 Nov 2019 22:58:05 -0800 (PST)
Received: from [127.0.1.1] ([101.184.7.224])
	by smtp.gmail.com with UTF8SMTPSA id
	l18sm6686204pff.79.2019.11.24.22.58.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 24 Nov 2019 22:58:05 -0800 (PST)
Date: Mon, 25 Nov 2019 06:58:00 +0000
Message-Id: <20191125065800.332481-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] gcc-cross.inc: Prevent native sysroot from leaking into configargs.h
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
X-List-Received-Date: Mon, 25 Nov 2019 06:58:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Prevent the native(sdk) sysroot path from leaking into configargs.h. The
configargs.h header is intended to be static and unchanged as the
content is used as a means of determining that a gcc plugin is built for
the same gcc. This also effects the output of 'gcc --version'. Due to
per recipe sysroots and staging, the sysroot path would be replaced with
the sysroot local to the recipe thus changing the content of
configargs.h.

The sysroot path is replaced with a generic "/host" prefix which
represents the host sysroot (e.g. native or nativesdk).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc   | 7 +++++++
 meta/recipes-devtools/gcc/gcc-runtime.inc | 4 ----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 8855bb1f34..06ba3ccd15 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -61,6 +61,13 @@ do_compile () {
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
 	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
 
+	# Prevent native/host sysroot path from being used in configargs.h header,
+	# as it will be rewritten when used by other sysroots preventing support
+	# for gcc plugins
+	oe_runmake configure-gcc
+	sed -i 's@${STAGING_DIR_TARGET}@/host@g' ${B}/gcc/configargs.h
+	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/configargs.h
+
 	oe_runmake all-host configure-target-libgcc
 	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
 	# now generate script to drive testing
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 2da3c02ef0..536b18d97f 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -302,10 +302,6 @@ do_check() {
 
     # HACK: this works around the configure setting CXX with -nostd* args
     sed -i 's/-nostdinc++ -nostdlib++//g' $(find ${B} -name testsuite_flags | head -1)
-    # HACK: this works around the de-stashing changes to configargs.h, as well as recipe-sysroot changing the content
-    sed -i '/static const char configuration_arguments/d' ${B}/gcc/configargs.h
-    ${CC} -v 2>&1 | grep "^Configured with:" | \
-        sed 's/Configured with: \(.*\)/static const char configuration_arguments[] = "\1";/g' >> ${B}/gcc/configargs.h
 
     if [ "${TOOLCHAIN_TEST_TARGET}" = "user" ]; then
         # qemu user has issues allocating large amounts of memory
---
2.24.0

