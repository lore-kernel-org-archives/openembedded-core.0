Return-Path: <sujith.h@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1277D60616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:17:48 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id q92so2502021ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 22:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PEpeY5ffm0OacWjIOgJKXYI6SPFIq63UqNfGFxEis10=;
	b=WABy1YFj0iB97vzH+derhBDmZqx6nRowbwlaTS1c/gXf/OYG6OF/AmgtjzdHiCwOJq
	AtAvArKg8izxZm0wpFSQzonuu0MxGQQ4IqL8vlCDi/YaZXUxGg+FiDCxcSu2YtQrOdEM
	burbLG34sh8HWhjnVAYlJmy3tEFQ+i2dibEKpFF6PFxz/zHr9RXOg13BQXlpi2nyhqBv
	aLMVSDMa+u/LYMCT2PSz2C5/CTrjcVQSXrK88Kurz0/MzOxEC9fYpKnOUdnKctL6JpeD
	yACUzIUyyyGLpPwj8mv4AUvUaVAMLgpAH4JudcR/FTXRnD29MiLMKVzRhPnarmyyxz5B
	yvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PEpeY5ffm0OacWjIOgJKXYI6SPFIq63UqNfGFxEis10=;
	b=eDgEC91FNMynXbAuXqiBYASZ+FNhxMnfxbuHhtfZddjlasbd0OdsBX1KLYCARynJtM
	4Nyip6vIC8NIwFH3w+gERjPKGE7rr4lLT2ix7mHGQs5alUEKCm/TndxLF1H5X13w4MdM
	UCIYecfyqvT2efnKy9VeoGhdzm6cx/letYsZhCoo7NMPedcGjIoBs72Mt6SmujMn/6sY
	qhHoEW6Wiuye8I1V4GAPQdU18X0FndHOMOuU+vdtSxANfgXlu+nKTmiKy7DDhuatnNYr
	KZJOks2wJkfgxhO3GCTMSqS1AUjAvMIYPAKvnNTahDefZt3BdjnHEaQo6cC0z2OnXGMU
	R7NQ==
X-Gm-Message-State: AE9vXwN2frAYgEg4Sb1T8hYetEhaiEnJPhDwbXQksJVMxk9XBVdNCbz5rXElDfuaC669mQ==
X-Received: by 10.107.132.231 with SMTP id o100mr16882969ioi.109.1474435069219;
	Tue, 20 Sep 2016 22:17:49 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id
	g78sm11558357itb.12.2016.09.20.22.17.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Sep 2016 22:17:48 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 10:47:42 +0530
Message-Id: <1474435062-3183-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] perf: Fix to obey LD failure on qemux86-64
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
X-List-Received-Date: Wed, 21 Sep 2016 05:17:49 -0000

From: Christopher Larson <chris_larson@mentor.com>

When built on an i686 host for qemux86-64 without the
fix to obey LD and it fails:

/scratch/dogwood/toolchains/x86_64/bin/i686-pc-linux-gnu-ld:
Relocatable linking with relocations from format elf64-x86-64
(/scratch/dogwood/perf-ld-test/build/tmp/work/qemux86_64-mel-linux/perf/1.0-r9/perf-1.0/fs/fs.o)
to format elf32-i386 (/scratch/dogwood/perf-ld-test/build/tmp/work/qemux86_64-mel-linux/perf/1.0-r9/perf-1.0/fs/libapi-in.o)
is not supported

This is because LD includes HOST_LD_ARCH, which contains TUNE_LDARGS,
which is -m elf32_x86_64 for x86_64. Without that, direct use of ld will fail.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
---
 meta/recipes-kernel/perf/perf.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 88e3a0a..0d104d3 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -79,6 +79,7 @@ EXTRA_OEMAKE = '\
     ARCH=${ARCH} \
     CC="${CC}" \
     AR="${AR}" \
+    LD="${LD}" \
     EXTRA_CFLAGS="-ldw" \
     perfexecdir=${libexecdir} \
     NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${LIBUNWIND_DEFINES} \
@@ -98,7 +99,6 @@ EXTRA_OEMAKE += "\
     'infodir=${@os.path.relpath(infodir, prefix)}' \
 "
 
-
 do_compile() {
 	# Linux kernel build system is expected to do the right thing
 	unset CFLAGS
@@ -174,6 +174,7 @@ do_configure_prepend () {
     if [ -e "${S}/tools/lib/api/Makefile" ]; then
         sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/lib/api/Makefile
         sed -i 's,AR = $(CROSS_COMPILE)ar,#AR,' ${S}/tools/lib/api/Makefile
+        sed -i 's,LD = $(CROSS_COMPILE)ld,#LD,' ${S}/tools/lib/api/Makefile
     fi
     if [ -e "${S}/tools/lib/subcmd/Makefile" ]; then
         sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/lib/subcmd/Makefile
-- 
1.9.1


