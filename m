Return-Path: <sujith.h@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4C85177204
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 06:51:34 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id x125so1734929oia.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Sep 2016 23:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3Hxnnx8XWA7oBBJAvxR5SS5Y21JiJrouNUf8C3PcLUE=;
	b=ZT2EayUfUilBqguBDPZ2ZisTiOJMk6iGm1wsqip/7ZZicOA/SSIecRtk+BBiRNWG2K
	nxnyochkdyW+3Xr/YAjFTvZulH4YGRCwTg5U2bfucDic17fuQxEWe7QFJ6zY7Ab9ckTf
	Ia9Ijx3BfZJSFJJ5yxMHlIabXTN21GWsTkISjXaP1gHrRMFilpduJZ9CU/1bJf2z6v85
	g81aYn4jaSr0corkXc+aOrPnefmfW04szLabyS3s4ZFSyTnunBW/yBVcQ2EUZFOp4kAi
	C9aNIO+zUQ+nNKk4dxEXkLyhuLUE/KexqbJ7QE8vUSb9wcQ/FlgdAw+Zvvf493Zb0djq
	ZcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3Hxnnx8XWA7oBBJAvxR5SS5Y21JiJrouNUf8C3PcLUE=;
	b=Cn2lxYvLX9CA16IPRfQZ6T4p2z4CW3GS3lGa2POGXRgpXzeokfFhHRkt+MC1zvIh0Z
	HhPtBnVGUCIEMffR1y+DRTHUwEljj09MgQnzHCz6Yrhx2dG1/syCFIhTh0o1IQXnwR99
	birkwqxyr/7toBae6bywV/p8fsIDD36AoeB/Im5kOx6jQpmFu0RUtNBtg38IuqLSweyH
	TqCXePjBgQq+8eFpfsA0Q0peZbZ57GrTT00K3L0tn3qO6w5r5HKakA12QS8YrOqcbXAy
	0wB+cs5npjKQAYl6E+zJ7VHylHmNi7dnzbKtn0zLDJ6yWgzK0XL8w3TPZ4XHUZ6eQYmm
	pbiw==
X-Gm-Message-State: AE9vXwNdSMhMon81lyEyGpKk2gqoqAXSEmt4dIz27t3T68cvBhgYv8E66iWsiUcPTFT1jw==
X-Received: by 10.157.27.132 with SMTP id z4mr23821788otd.82.1473317494879;
	Wed, 07 Sep 2016 23:51:34 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id 65sm6420373otq.39.2016.09.07.23.51.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 23:51:34 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 12:21:26 +0530
Message-Id: <1473317486-13435-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] perf: Fix to obey LD failure on host i686
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
X-List-Received-Date: Thu, 08 Sep 2016 06:51:35 -0000

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
 meta/recipes-kernel/perf/perf.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 88e3a0a..85fe0ea 100644
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
@@ -98,6 +99,14 @@ EXTRA_OEMAKE += "\
     'infodir=${@os.path.relpath(infodir, prefix)}' \
 "
 
+do_configure_prepend () {
+    for makefile in "${S}/tools/perf/Makefile.perf" \
+                    "${S}/tools/lib/api/Makefile"; do
+        if [ -e "$makefile" ]; then
+            sed -i 's,LD = $(CROSS_COMPILE)ld,#LD,' "$makefile"
+        fi
+    done
+}
 
 do_compile() {
 	# Linux kernel build system is expected to do the right thing
-- 
1.9.1


