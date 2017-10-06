Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id D1FCC780F9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:11 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y44so6120925wry.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=I8h71zHZch+XP0yis6mKl9PFqBFXZsI8rJD9BkSFxMQ=;
	b=O8SGGiRaQO6h3UzjlCV28zjUsVOW2hJlDhUAXCk4p734qPEpnXTzcaiYGRySCgUdVN
	LOocfnsvfp2z9+jAJ20W7uVGp6Hyx+/rVlzF7IflsD8tfW2b0f3s062J4ke2Nc4Su/gM
	uqiZlHEBa4OdsBRkHLqflpaZXtdoi2WlhlciVNpsY2dstWsmk0G5j+qAWoNW9649Zx4H
	bMmoe4UtX6NanibcvtD5RCklKd84GTWMaNYW0UF5Ys/RH75tnsW8AM3U8E5IbbNJAD+5
	ZgmiLKBPYvACw6FOhoasQE5VKoHw0t8dKQXc04bItSL3aT9mQPPVFaj6PSzN0UE9LLjc
	hZpA==
X-Gm-Message-State: AMCzsaU9yACpA4HaCVWfpiWG0/kqqm1H6ouSgSxEoyKZ2FCuNnTr51YJ
	GQilYRUZxuYrgOg7Erl5vD21nnVg
X-Google-Smtp-Source: AOwi7QCUe+V3pZOVD1AtrD2LdUeND9xzOkqQgafgyIIZhQMDDmG628uM45pn5vhfg9wZraS7/TNf4w==
X-Received: by 10.223.199.69 with SMTP id b5mr1901827wrh.270.1507291992460;
	Fri, 06 Oct 2017 05:13:12 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:11 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:44 +0100
Message-Id: <20171006121259.5817-3-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 02/17] busybox: fix a linking issue
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
Signed-off-by: Ross Burton <ross.burton@intel.com>

(cherry picked from commit 789254b5ae983a94346f53de18286713b80eb5f2)
Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 .../busybox-tar-add-IF_FEATURE_-checks.patch       | 70 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-tar-add-IF_FEATURE_-checks.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-tar-add-IF_FEATURE_-checks.patch b/meta/recipes-core/busybox/busybox/busybox-tar-add-IF_FEATURE_-checks.patch
new file mode 100644
index 0000000000..0c3c9c0f42
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
index e26dfff776..a97847d7c6 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -57,6 +57,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-libiproute-handle-table-ids-larger-than-255.patch \
            file://ifupdown-pass-interface-device-name-for-ipv6-route-c.patch \
            file://BUG9071_buffer_overflow_arp.patch \
+           file://busybox-tar-add-IF_FEATURE_-checks.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.14.2


