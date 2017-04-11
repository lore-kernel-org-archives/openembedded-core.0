Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id DA99577BF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:57:14 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id t68so6262043iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 07:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SFGp8gDo3X79x1l//vT+gtix0emQNeYMIDdfZ/yHgSE=;
	b=PycCRvkR2FTSLmMyd70qbR4obF8wNXIO4gRw4chMmmWEGyJ8cLW0ysj3i2Y/7vc66o
	2N5yev9KmINZ5U6xgzZ0HckJHfnlC8FWgU6nNvXvMzKR5UaCQ6PHB2ib/L0XjXmzCZxm
	9XXvEGVJNFyfMyt21uoVADDCwwTWUpNAFIfkPc0oEImJZQ9OPI4L/VvjChnxHgcvN3xe
	UGQcSMdfbhTFk8f9rqOS1ZqRMskWTfraz9K0e8OaEV3CAH9TNJxqJh14YUSBmyK7rG94
	XmORTcPwBOMIPLVrb+pkMxktQ3Tn3WeOsoU+UUQfNlOYYqXmlTtspW/WKhnHa6gZEqn/
	XORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SFGp8gDo3X79x1l//vT+gtix0emQNeYMIDdfZ/yHgSE=;
	b=lsp6wNKeqLI9Hv9mcafbAejbpa6E9zEAhvllkBh5VSrn359RhaXeV3Bi7Ju37lNP2l
	B5C3a7i2xog4F/xKgu03vFpa2MubZsGfzPS6z8JgTqJOvB39yAFGb0CFfv4rbCnhYHyp
	TIPFpM7nVsITi7kxgJ3K6h1EABsdDVLRbDkxf5ctHDDLQpGsCONt7xZ0jmqT0qTQqIa4
	thkIxA0bjnjAtMBs+JI+kX2mBh3yhjilAXTG+T2X6ERaUSX2MPfBByNVo/ukoLoTUbgA
	JpAk112+tpdeD+Sv+VrH1pwMqe62h0u/nSAq5u/n6G3mLFQyBS46j2tIYE9Vzsa9ovk3
	kLUQ==
X-Gm-Message-State: AN3rC/72Ri33NUajw1ZSdrFvxDgjRZh0uXSFhZnCUMWbPhQbUuzoSUpD
	ix355p9s5doDG18e
X-Received: by 10.36.115.146 with SMTP id y140mr17377203itb.21.1491922636308; 
	Tue, 11 Apr 2017 07:57:16 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162])
	by smtp.gmail.com with ESMTPSA id 71sm8025298iof.29.2017.04.11.07.57.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 07:57:15 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 16:56:56 +0200
Message-Id: <c647b8b4229e8862b8066f52aaefee133a65e6ee.1491922350.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
References: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 3/8] -cross recipes: ignore TARGET_ARCH sstate hash
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
X-List-Received-Date: Tue, 11 Apr 2017 14:57:16 -0000

"yocto-compat-layer.py --machines" showed that shared packages like
gcc-cross-powerpc64 have a sstate signature that depends on
TUNEFLAGS. As a result, there are unnecessary rebuilds and potential
conflicts in a multiconfig.

That's due to the way how TARGET_ARCH is set. Richard Purdie suggested
setting TARGET_ARCH[vardepvalue] as fix, which works. It would be
shorter to do that in cross.inc instead of repeating the relevant line
in different recipes, but Richard was concerned about potential
side-effects in other usages of cross.inc.

TARGET_GOARM as used in go.inc is still causing signature differences
for go-cross-powerpc64 and machines b4420qds-64b and p5020ds-64b. This
needs further investigation.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/binutils/binutils-cross.inc | 3 +++
 meta/recipes-devtools/gcc/gcc-cross.inc           | 3 +++
 meta/recipes-devtools/gdb/gdb-cross.inc           | 3 +++
 meta/recipes-devtools/go/go-cross.inc             | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 5e6f468..02ec891 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -4,6 +4,9 @@ PROVIDES = "virtual/${TARGET_PREFIX}binutils"
 PN = "binutils-cross-${TARGET_ARCH}"
 BPN = "binutils"
 
+# Ignore how TARGET_ARCH is computed.
+TARGET_ARCH[vardepvalue] = "${TARGET_ARCH}"
+
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index bb5f7a0..c5c1645 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -11,6 +11,9 @@ python () {
 
 PN = "gcc-cross-${TARGET_ARCH}"
 
+# Ignore how TARGET_ARCH is computed.
+TARGET_ARCH[vardepvalue] = "${TARGET_ARCH}"
+
 require gcc-configure-common.inc
 
 # While we want the 'gnu' hash style, we explicitly set it to sysv here to
diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index d92f31f..ebe329f 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -21,6 +21,9 @@ GDBPROPREFIX = ""
 PN = "gdb-cross-${TARGET_ARCH}"
 BPN = "gdb"
 
+# Ignore how TARGET_ARCH is computed.
+TARGET_ARCH[vardepvalue] = "${TARGET_ARCH}"
+
 inherit cross
 inherit gettext
 
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 9b49738..8fa09b7 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -4,6 +4,9 @@ DEPENDS += "gcc-cross-${TARGET_ARCH}"
 
 PN = "go-cross-${TARGET_ARCH}"
 
+# Ignore how TARGET_ARCH is computed.
+TARGET_ARCH[vardepvalue] = "${TARGET_ARCH}"
+
 # go-cross is built once per target architecture, and thus must not
 # depend on the tune-specific libgcc.
 DEPENDS_remove = "libgcc"
-- 
git-series 0.9.1

