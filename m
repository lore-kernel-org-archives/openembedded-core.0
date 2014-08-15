Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4EF65E03
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 12:11:56 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so2236154wgh.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 05:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=TZYL5s4eC9esTM0EIgSNR6Im3GL5PeZTNNTmbepSGJ8=;
	b=B9uAnlv4u4t5MGpqePf+gmcjlOS/pV1izx4P8I2FiRy6kAHHnHhdQrTrFQ+2E+SM6F
	f7Q/EKEedluJ3EKVvC9K9Gt4872FhkGzitERtRGzhkM5i3bDRLO/KQxVJNWi5SZkLH7S
	UnqqT2lDMm3Z4fvjCfrr/4s7Jq3nhSf/DlAnCWziz7IgAb47AuIG/4JxPYKhNaTB17g3
	Ms8cjPswGWVt0kP/8WI1UnR0w/cN70sBbAdsFqjogsFxPfUsFK7UbbVrBkraXSF4xoTR
	uYSjvSflZD6wezIBIUn6sQQ/xn9kXc9W3XtT+J0UmgzS+I7PDjEERLi/KRCMBIi1bI1g
	hh8w==
X-Gm-Message-State: ALoCoQk+cSKJJHhG+xnApR+V1GIQ7mOmx+SMMTRM+h/aE1Q3vZ0XVUxDFWL2qod3x00rLX/BUWDh
X-Received: by 10.194.71.11 with SMTP id q11mr19547263wju.33.1408104717081;
	Fri, 15 Aug 2014 05:11:57 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id t6sm6300578wib.4.2014.08.15.05.11.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Aug 2014 05:11:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Aug 2014 13:11:47 +0100
Message-Id: <1408104707-17250-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408104707-17250-1-git-send-email-ross.burton@intel.com>
References: <1408104707-17250-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] lttng-tools: update to version 2.5.0
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
X-List-Received-Date: Fri, 15 Aug 2014 12:11:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update to latest stable-2.5 revision.

* Drop Fix-alignment-problems-on-targets-not-supporting-una.patch, merged
  upstream.
* New build-dependency on libxml2, so inherit pkgconfig so the test works and
  delete the copy of libxml.m4 that overrides our sysroot.

Based on a patch from Yasir-Khan <yasir_khan@mentor.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...nt-problems-on-targets-not-supporting-una.patch |   47 --------------------
 .../{lttng-tools_2.4.0.bb => lttng-tools_2.5.0.bb} |   17 ++++---
 2 files changed, 10 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/Fix-alignment-problems-on-targets-not-supporting-una.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.4.0.bb => lttng-tools_2.5.0.bb} (83%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/Fix-alignment-problems-on-targets-not-supporting-una.patch b/meta/recipes-kernel/lttng/lttng-tools/Fix-alignment-problems-on-targets-not-supporting-una.patch
deleted file mode 100644
index 2c1756e..0000000
--- a/meta/recipes-kernel/lttng/lttng-tools/Fix-alignment-problems-on-targets-not-supporting-una.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 9dc4d3a8dcc7cfb6991e760e78f614afd593bf66 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Fredrik=20Markstr=C3=B6m?= <fredrik.markstrom@gmail.com>
-Date: Tue, 1 Apr 2014 17:46:23 +0200
-Subject: [PATCH v2] Fix: alignment problems on targets not supporting unaligned
- access.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Submitted (https://www.mail-archive.com/lttng-dev@lists.lttng.org/msg06012.html) 
-
-Accessing floats, doubles and 64 bit int at unaligned addresses is not
-supported on all configurations of arm processors and if it is it's
-emulated and slow. This patch replaces direct assignments with memcpy.
-
-Signed-off-by: Fredrik Markström <fredrik.markstrom@gmail.com>
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-Acked-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c b/src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c
-index 762d604..8c6dc96 100644
---- a/src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c
-+++ b/src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c
-@@ -222,7 +222,7 @@ int visit_node_load(struct filter_parser_ctx *ctx, struct ir_op *node)
- 		if (!insn)
- 			return -ENOMEM;
- 		insn->op = FILTER_OP_LOAD_S64;
--		*(int64_t *) insn->data = node->u.load.u.num;
-+		memcpy(insn->data, &node->u.load.u.num, sizeof(int64_t));
- 		ret = bytecode_push(&ctx->bytecode, insn, 1, insn_len);
- 		free(insn);
- 		return ret;
-@@ -237,7 +237,7 @@ int visit_node_load(struct filter_parser_ctx *ctx, struct ir_op *node)
- 		if (!insn)
- 			return -ENOMEM;
- 		insn->op = FILTER_OP_LOAD_DOUBLE;
--		*(double *) insn->data = node->u.load.u.flt;
-+		memcpy(insn->data, &node->u.load.u.flt, sizeof(double));
- 		ret = bytecode_push(&ctx->bytecode, insn, 1, insn_len);
- 		free(insn);
- 		return ret;
--- 
-1.7.10.4
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
similarity index 83%
rename from meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
index aab9bf6..14e5f9e 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
@@ -9,25 +9,24 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
-DEPENDS = "liburcu popt lttng-ust"
+DEPENDS = "liburcu popt lttng-ust libxml2"
 RDEPENDS_${PN}-ptest += "make"
 
-SRCREV = "8e3234eea2d81f8a962214c570532f8e096a9a8d"
-PV = "v2.4.0"
+SRCREV = "8b27cacb277c2cdab791139b08da8eb87ab14a88"
+PV = "v2.5.0"
 
-SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.4 \
+SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.5 \
            file://runtest-2.4.0.patch \
            file://run-ptest \
-           file://Fix-alignment-problems-on-targets-not-supporting-una.patch \
 	  "
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep ptest
+inherit autotools-brokensep ptest pkgconfig
 
 export KERNELDIR="${STAGING_KERNEL_DIR}"
 
-FILES_${PN} += "${libdir}/lttng/libexec/*"
+FILES_${PN} += "${libdir}/lttng/libexec/* ${datadir}/xml/lttng"
 FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
 
 # Since files are installed into ${libdir}/lttng/libexec we match 
@@ -35,6 +34,10 @@ FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
 INSANE_SKIP_${PN} = "libexec"
 INSANE_SKIP_${PN}-dbg = "libexec"
 
+do_configure_prepend () {
+	# Delete a shipped m4 file that overrides our patched one
+	rm -f ${S}/config/libxml.m4
+}
 
 do_install_ptest () {
 	chmod +x ${D}/${libdir}/${PN}/ptest/tests/utils/utils.sh
-- 
1.7.10.4


