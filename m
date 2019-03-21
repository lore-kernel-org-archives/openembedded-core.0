Return-Path: <Liwei.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C81E17CF4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 03:21:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2L3LXjj013068
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 20:21:49 -0700
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 20 Mar 2019 20:21:42 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2019 23:19:16 -0400
Message-ID: <1553138356-85237-9-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
References: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] oe-core: add ledmon to support Intel VROC
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
X-List-Received-Date: Thu, 21 Mar 2019 03:21:58 -0000
Content-Type: text/plain

This add ledmon demon to control Intel VROC's SSD disk led.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-extended/ledmon/ledmon_git.bb | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/ledmon/ledmon_git.bb

diff --git a/meta/recipes-extended/ledmon/ledmon_git.bb b/meta/recipes-extended/ledmon/ledmon_git.bb
new file mode 100644
index 000000000000..77a620860cab
--- /dev/null
+++ b/meta/recipes-extended/ledmon/ledmon_git.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Intel(R) Enclosure LED Utilities"
+
+DESCRIPTION = "The utilities are designed primarily to be used on storage servers \
+ utilizing MD devices (aka Linux Software RAID) for RAID arrays.\
+"
+HOMEPAGE = "https://github.com/intel/ledmon"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+"
+
+DEPENDS = " udev sg3-utils"
+
+PARALLEL_MAKE = ""
+
+SRC_URI = "git://github.com/intel/ledmon;branch=master"
+SRCREV = "8a5d9526e5666e75625427b85a2586436651e89c"
+
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+
+S = "${WORKDIR}/git"
+EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
+
+do_compile() {
+        oe_runmake SYSROOT="${STAGING_DIR_TARGET}"
+}
+
+do_install() {
+	oe_runmake install DESTDIR=${D}
+	cd ${S}/systemd
+	oe_runmake install DESTDIR=${D}
+}
-- 
2.7.4


