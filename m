Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id DA3F36072C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:47:43 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 8CD35F1E285FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:47:41 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Wed, 23 Nov 2016 13:47:44 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2016 13:47:32 +0000
Message-ID: <20161123134733.38276-7-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123134733.38276-1-Zubair.Kakakhel@imgtec.com>
References: <20161123134733.38276-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch 6/7] perf: Add EXTRA_LDFLAGS for MIPS N32
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
X-List-Received-Date: Wed, 23 Nov 2016 13:47:44 -0000
Content-Type: text/plain

MIPS N32 requires EXTRA_LDFLAGS to link correctly.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-kernel/perf/perf.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 25ae83c..6cdaa68 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -80,6 +80,7 @@ EXTRA_OEMAKE = '\
     AR="${AR}" \
     LD="${LD}" \
     EXTRA_CFLAGS="-ldw" \
+    EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
     perfexecdir=${libexecdir} \
     NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${LIBUNWIND_DEFINES} \
     ${SCRIPTING_DEFINES} ${LIBNUMA_DEFINES} \
@@ -98,6 +99,12 @@ EXTRA_OEMAKE += "\
     'infodir=${@os.path.relpath(infodir, prefix)}' \
 "
 
+PERF_EXTRA_LDFLAGS = ""
+
+# MIPS N32
+PERF_EXTRA_LDFLAGS_mipsarchn32eb = "-m elf32btsmipn32"
+PERF_EXTRA_LDFLAGS_mipsarchn32el = "-m elf32ltsmipn32"
+
 do_compile() {
 	# Linux kernel build system is expected to do the right thing
 	unset CFLAGS
-- 
2.10.2


