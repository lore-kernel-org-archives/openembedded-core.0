Return-Path: <okaya@kernel.org>
X-Greylist: delayed 557 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 21 Sep 2018 22:25:13 UTC
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id D8AD27981D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 22:25:13 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [137.117.33.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7C4C421522;
	Fri, 21 Sep 2018 22:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1537568157;
	bh=c7U1fByF1fprC78st7T85mlkRbE0c8FRhEtaH8qY0o8=;
	h=From:To:Cc:Subject:Date:From;
	b=iAoJK9s5MjK8qBPbUnQ0EFXeixTOBGVPfzblhY4oTAzc2tqhzp9f6Qi/KbHhkNobZ
	huhotrBhisAwP+oj49KDIQPeZLGPW9Pl2jyUEiNYa4ILq3Vybv12uYqnVpwJc6zdRf
	A15o8uTlVqPZ+dqRkLWm+EZIkVvbhvBYDnpXjUjo=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 22:15:51 +0000
Message-Id: <20180921221553.23399-1-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [PATCH v1 1/3] busybox: CVE-2017-15874
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
X-List-Received-Date: Fri, 21 Sep 2018 22:25:14 -0000
Content-Transfer-Encoding: 8bit

* CVE-2017-15874
busybox: Integer underflow in archival/libarchive/decompress_unlzma.c

(cherry picked from 9ac42c500586fa5f10a1f6d22c3f797df11b1f6b)

Affects busybox <= 1.27.2

Upstream-Status: Backport [ https://git.busybox.net/busybox/commit/?id=9ac42c500586fa5f10a1f6d22c3f797df11b1f6b]
CVE: CVE-2017-15874
Ref: https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2017-15874
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../busybox/busybox/CVE-2017-15874.patch      | 28 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.27.2.bb   |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2017-15874.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2017-15874.patch b/meta/recipes-core/busybox/busybox/CVE-2017-15874.patch
new file mode 100644
index 0000000000..dece92c160
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2017-15874.patch
@@ -0,0 +1,28 @@
+From e75c01bb3249df16201b482b79bb24bec3b58188 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Fri, 27 Oct 2017 15:37:03 +0200
+Subject: [PATCH] unlzma: fix SEGV, closes 10436
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ archival/libarchive/decompress_unlzma.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/archival/libarchive/decompress_unlzma.c b/archival/libarchive/decompress_unlzma.c
+index 29eee2a..41e492f 100644
+--- a/archival/libarchive/decompress_unlzma.c
++++ b/archival/libarchive/decompress_unlzma.c
+@@ -353,6 +353,10 @@ unpack_lzma_stream(transformer_state_t *xstate)
+ 						pos = buffer_pos - rep0;
+ 						if ((int32_t)pos < 0) {
+ 							pos += header.dict_size;
++							/* bug 10436 has an example file where this triggers: */
++							if ((int32_t)pos < 0)
++								goto bad;
++
+ 							/* see unzip_bad_lzma_2.zip: */
+ 							if (pos >= buffer_size)
+ 								goto bad;
+-- 
+2.19.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
index 1ce4823d47..bab29728ee 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-CVE-2017-16544.patch \
            file://busybox-fix-lzma-segfaults.patch \
            file://umount-ignore-c.patch \
+           file://CVE-2017-15874.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.19.0


