Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C921F79F33
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 04:37:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA24b5bn025976
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2018 21:37:05 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 1 Nov 2018 21:36:47 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 12:42:43 +0800
Message-ID: <debbff7d47d9370c45be7ebdbc9f6f336ac51dcb.1541133621.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1541133621.git.Qi.Chen@windriver.com>
References: <cover.1541133621.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] systemd: fix CVE-2018-15688
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
X-List-Received-Date: Fri, 02 Nov 2018 04:37:04 -0000
Content-Type: text/plain

Backport patch to fix the following CVE.

CVE: CVE-2018-15688

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch | 39 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch b/meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
new file mode 100644
index 0000000..0c912f2
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
@@ -0,0 +1,39 @@
+From a2622b8398ba026faf481f5eddeb53231d9de4a7 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Fri, 19 Oct 2018 12:12:33 +0200
+Subject: [PATCH] dhcp6: make sure we have enough space for the DHCP6 option
+ header
+
+Fixes a vulnerability originally discovered by Felix Wilhelm from
+Google.
+
+CVE-2018-15688
+LP: #1795921
+https://bugzilla.redhat.com/show_bug.cgi?id=1639067
+
+(cherry picked from commit 4dac5eaba4e419b29c97da38a8b1f82336c2c892)
+
+CVE: CVE-2018-15688
+Upstream-Status: Backport
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/libsystemd-network/dhcp6-option.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libsystemd-network/dhcp6-option.c b/src/libsystemd-network/dhcp6-option.c
+index c4b402b..dcbaad0 100644
+--- a/src/libsystemd-network/dhcp6-option.c
++++ b/src/libsystemd-network/dhcp6-option.c
+@@ -103,7 +103,7 @@ int dhcp6_option_append_ia(uint8_t **buf, size_t *buflen, DHCP6IA *ia) {
+                 return -EINVAL;
+         }
+ 
+-        if (*buflen < len)
++        if (*buflen < offsetof(DHCP6Option, data) + len)
+                 return -ENOBUFS;
+ 
+         ia_hdr = *buf;
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 47fff40..3dbeaac 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -32,6 +32,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0023-resolvconf-fixes-for-the-compatibility-interface.patch \
            file://0001-core-when-deserializing-state-always-use-read_line-L.patch \
            file://0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch \
+           file://0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
1.9.1


