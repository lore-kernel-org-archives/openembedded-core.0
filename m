Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9384471979
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 03:21:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x3so5504163wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 20:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qO+CFhHMq6sp3F7t7PN0bMuO1XktTeCNN39RDmpbcEc=;
	b=BIpXoGn7VavuYyBVGYEyQHRIUx7ambkMcaPNnLvHmszOzWzwvsuy/ro6E08KjDxdLF
	ie7JfL9/OuMNWCBlzi/nsQVMckjNS9zcT7pRcbaRja43pZSJ93GRbD1w8mZN29FChawF
	oddC38KNWwgvBVN3bJFl/0H3cLsWCGtcPgE8Nhb1ccQ+/ptrvFwx3p+3CaNYsWII5qwX
	YNTu7NdREZf7CdiVt8hN39esQrHMhz4QFHsHC5/G/+hmC6i6z3O0mQcayYbCcM2hK7Yf
	LTWQKR9rWOkHzlCQHVs6lp4UMe1XlcRrjo+uY/VHg81VnaihkUWasNa+vS1zA5Tlc+r4
	5BAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qO+CFhHMq6sp3F7t7PN0bMuO1XktTeCNN39RDmpbcEc=;
	b=lmnkU2n/NTrqU4ywrk2JDOzfnFXnlvh6qspWP8hvnCLbsFpBUpeJ0wg7IgaGugDIjx
	mAtfTzv9H/3oECtSK+o6o0ImPNIK7Gh8FkUgZiUumou2OMS5Yq1JcDDjxetqHUmBfWb0
	fomk9JczFdHkbPXXH2bkCuJvMRgpymTS1kyEDYqY5jh8WGDHZ1V2ir4uGp8T9lISaYTW
	1f6ACzYui3CBKMMGfHIWRAaj8gubMfjBnNKDoJZAFFlcZ31N8dN02Lr/UT12hUWQI5gX
	Smt5LoK6/FxEHIafe75yhnDB9f1r+jxngju8zBFxFJxDH7ookfHX45dHESn6Fnj7dBQo
	+Blg==
X-Gm-Message-State: AODbwcCDZtAQYZ9075gbeQzlYHr5jCPABHdVJvfeCPGuQYOdniiKD3lD
	oMKRpHca9cVJ19hN
X-Received: by 10.80.205.93 with SMTP id d29mr18159248edj.74.1496719286060;
	Mon, 05 Jun 2017 20:21:26 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.199.183]) by smtp.gmail.com with ESMTPSA id
	j29sm1940405eda.26.2017.06.05.20.21.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jun 2017 20:21:25 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jun 2017 05:21:18 +0200
Message-Id: <1496719278-3443-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] busybox: fix a linking issue
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
X-List-Received-Date: Tue, 06 Jun 2017 03:21:25 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

A following linking error was observed:
| ==========
| archival/lib.a(tar.o): In function `tar_main':
| archival/tar.c:1168: undefined reference to `unpack_Z_stream'
| archival/tar.c:1168: undefined reference to `unpack_Z_stream'
| ld: busybox_unstripped: hidden symbol `unpack_Z_stream' isn't defined
| ld: final link failed: Bad value

this happened with clang compiler, with the following configs:
| CONFIG_TAR=y
| # CONFIG_FEATURE_SEAMLESS_Z is not set

which can be fixed by adding IF_FEATURE_* checks in.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../busybox-tar-add-IF_FEATURE_-checks.patch       | 70 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-tar-add-IF_FEATURE_-checks.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-tar-add-IF_FEATURE_-checks.patch b/meta/recipes-core/busybox/busybox/busybox-tar-add-IF_FEATURE_-checks.patch
new file mode 100644
index 0000000..0c3c9c0
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/busybox-tar-add-IF_FEATURE_-checks.patch
@@ -0,0 +1,70 @@
+From f94412f6bb49136694c5478d0aecb19118d1b08d Mon Sep 17 00:00:00 2001
+From: Ming Liu <peter.x.liu@external.atlascopco.com>
+Date: Wed, 31 May 2017 11:48:09 +0200
+Subject: [PATCH] tar: add IF_FEATURE_* checks
+
+A following linking error was observed:
+| ==========
+| archival/lib.a(tar.o): In function `tar_main':
+| archival/tar.c:1168: undefined reference to `unpack_Z_stream'
+| archival/tar.c:1168: undefined reference to `unpack_Z_stream'
+| ld: busybox_unstripped: hidden symbol `unpack_Z_stream' isn't defined
+| ld: final link failed: Bad value
+
+this happened with clang compiler, with the following configs:
+| CONFIG_TAR=y
+| # CONFIG_FEATURE_SEAMLESS_Z is not set
+
+which can be fixed by adding IF_FEATURE_* checks in.
+
+Upstream-Status: Pending [ Sent to busybox upstream on 2017-06-02 ]
+
+Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
+---
+ archival/tar.c | 25 +++++++++++++++----------
+ 1 file changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/archival/tar.c b/archival/tar.c
+index b70e00a..7598b71 100644
+--- a/archival/tar.c
++++ b/archival/tar.c
+@@ -1216,21 +1216,26 @@ int tar_main(int argc UNUSED_PARAM, char **argv)
+ 		USE_FOR_MMU(IF_DESKTOP(long long) int FAST_FUNC (*xformer)(transformer_state_t *xstate);)
+ 		USE_FOR_NOMMU(const char *xformer_prog;)
+ 
+-		if (opt & OPT_COMPRESS)
+-			USE_FOR_MMU(xformer = unpack_Z_stream;)
++		if (opt & OPT_COMPRESS) {
++			USE_FOR_MMU(IF_FEATURE_SEAMLESS_Z(xformer = unpack_Z_stream;))
+ 			USE_FOR_NOMMU(xformer_prog = "uncompress";)
+-		if (opt & OPT_GZIP)
+-			USE_FOR_MMU(xformer = unpack_gz_stream;)
++		}
++		if (opt & OPT_GZIP) {
++			USE_FOR_MMU(IF_FEATURE_SEAMLESS_GZ(xformer = unpack_gz_stream;))
+ 			USE_FOR_NOMMU(xformer_prog = "gunzip";)
+-		if (opt & OPT_BZIP2)
+-			USE_FOR_MMU(xformer = unpack_bz2_stream;)
++		}
++		if (opt & OPT_BZIP2) {
++			USE_FOR_MMU(IF_FEATURE_SEAMLESS_BZ2(xformer = unpack_bz2_stream;))
+ 			USE_FOR_NOMMU(xformer_prog = "bunzip2";)
+-		if (opt & OPT_LZMA)
+-			USE_FOR_MMU(xformer = unpack_lzma_stream;)
++		}
++		if (opt & OPT_LZMA) {
++			USE_FOR_MMU(IF_FEATURE_SEAMLESS_LZMA(xformer = unpack_lzma_stream;))
+ 			USE_FOR_NOMMU(xformer_prog = "unlzma";)
+-		if (opt & OPT_XZ)
+-			USE_FOR_MMU(xformer = unpack_xz_stream;)
++		}
++		if (opt & OPT_XZ) {
++			USE_FOR_MMU(IF_FEATURE_SEAMLESS_XZ(xformer = unpack_xz_stream;))
+ 			USE_FOR_NOMMU(xformer_prog = "unxz";)
++		}
+ 
+ 		fork_transformer_with_sig(tar_handle->src_fd, xformer, xformer_prog);
+ 		/* Can't lseek over pipes */
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 1baadeac..d3df448 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -58,6 +58,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-libiproute-handle-table-ids-larger-than-255.patch \
            file://ifupdown-pass-interface-device-name-for-ipv6-route-c.patch \
            file://BUG9071_buffer_overflow_arp.patch \
+           file://busybox-tar-add-IF_FEATURE_-checks.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.7.4


