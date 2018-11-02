Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6367279F0E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 01:48:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA21m2I3019396
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2018 18:48:12 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 1 Nov 2018 18:47:51 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 09:53:51 +0800
Message-ID: <0e85ae8ed1082e9594a09656c11e7e8c6ada0d4d.1541123540.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1541123540.git.Qi.Chen@windriver.com>
References: <cover.1541123540.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Fri, 02 Nov 2018 01:48:21 -0000
Content-Type: text/plain

Backport patch to fix the following CVE.

CVE: CVE-2018-15688

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch | 36 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch b/meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
new file mode 100644
index 0000000..86dfe6c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
@@ -0,0 +1,36 @@
+From a6af1af8b8fa887533b048f74a6c932d99d204ed Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/libsystemd-network/dhcp6-option.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libsystemd-network/dhcp6-option.c b/src/libsystemd-network/dhcp6-option.c
+index 18196b1..0979497 100644
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


