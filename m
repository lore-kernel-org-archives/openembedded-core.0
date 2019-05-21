Return-Path: <okaya@kernel.org>
X-Greylist: delayed 339 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 21 May 2019 02:47:20 UTC
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id DAF127E07F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 02:47:20 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [104.45.139.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id ECE2E2173C;
	Tue, 21 May 2019 02:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558406503;
	bh=czmpvpDsjDrANBFWNZ1M8A8jh69bVDHAF/uEDRRAwIY=;
	h=From:To:Cc:Subject:Date:From;
	b=QN1osNZKN44mJJ0k9XXaf/n8A0+bnTAqgKHd3I+OuLYPkjHGJiPP5E8NqN9UDx+dS
	hQrPceqzDMyocax2csPp924MTPIf0VoURPg+pv+ZlNNDrwFsEEYx7znGelH5Lpo7x8
	L0oGJK4rzo7Ud/SI4q8JoZpjk1lZd4jpJyPid4qA=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 02:41:36 +0000
Message-Id: <20190521024136.51351-1-okaya@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [sumo] [PATCH v1] systemd: Assertion 'fd' failed at ../systemd/src/basic/socket-util.c
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
X-List-Received-Date: Tue, 21 May 2019 02:47:21 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 ...ket-util-fix-getpeergroups-assert-fd.patch | 30 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb      |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0036-socket-util-fix-getpeergroups-assert-fd.patch

diff --git a/meta/recipes-core/systemd/systemd/0036-socket-util-fix-getpeergroups-assert-fd.patch b/meta/recipes-core/systemd/systemd/0036-socket-util-fix-getpeergroups-assert-fd.patch
new file mode 100644
index 00000000000..af26c2cd44e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0036-socket-util-fix-getpeergroups-assert-fd.patch
@@ -0,0 +1,30 @@
+From 7f5128ee70ea66281edc1d3188b1b305662f4fd5 Mon Sep 17 00:00:00 2001
+From: Vito Caputo <vcaputo@pengaru.com>
+Date: Fri, 2 Feb 2018 20:28:21 -0800
+Subject: [PATCH] socket-util: fix getpeergroups() assert(fd)
+
+Don't assert on zero-value fds.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/8080/commits/e8dbdb02ed8483a359c1e4c2f28fff526f950a82]
+
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ src/basic/socket-util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c
+index 67aedadd45..39eb2fdea1 100644
+--- a/src/basic/socket-util.c
++++ b/src/basic/socket-util.c
+@@ -1018,7 +1018,7 @@ int getpeergroups(int fd, gid_t **ret) {
+         socklen_t n = sizeof(gid_t) * 64;
+         _cleanup_free_ gid_t *d = NULL;
+ 
+-        assert(fd);
++        assert(fd >= 0);
+         assert(ret);
+ 
+         for (;;) {
+-- 
+2.21.0
+
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index a409b182979..d84c50c713a 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -54,6 +54,7 @@ SRC_URI += "file://touchscreen.rules \
            file://libmount.patch \
            file://0034-Fix-format-truncation-compile-failure-by-typecasting.patch \
            file://0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
+           file://0036-socket-util-fix-getpeergroups-assert-fd.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.21.0


