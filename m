Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20C197F29D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 11:09:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8RB9OZd003605
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 04:09:47 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Fri, 27 Sep 2019 04:09:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Sep 2019 19:09:17 +0800
Message-ID: <11bd4264e2d1372d86ed1f95dbebb81ad9876a2a.1569582526.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569582526.git.liezhi.yang@windriver.com>
References: <cover.1569582526.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] lttng-ust: Fix for --enable-python-agent
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
X-List-Received-Date: Fri, 27 Sep 2019 11:09:56 -0000
Content-Type: text/plain

Fixed:
PACKAGECONFIG_append_pn-lttng-ust = ' python3-agent'

require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake lttng-ust
ERROR: lttng-ust-2_2.10.4-r0 do_package: QA Issue: lttng-ust: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/python3.7
  /usr/lib/python3.7/site-packages
  /usr/lib/python3.7/site-packages/lttngust-2.10.4-py3.7.egg-info

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...gust-Makefile.am-Add-install-lib-to-setup.patch | 31 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
new file mode 100644
index 0000000..55679f1
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
@@ -0,0 +1,31 @@
+From f79dac30af9adda12996da7f6aa6667d3b580537 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 26 Sep 2019 17:54:00 +0800
+Subject: [PATCH] python-lttngust/Makefile.am: Add --install-lib to setup.py
+
+Otherwise it may install to /usr/lib, but should be /usr/lib64 when cross
+building.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ python-lttngust/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/python-lttngust/Makefile.am b/python-lttngust/Makefile.am
+index 6c0d20d..38b51b8 100644
+--- a/python-lttngust/Makefile.am
++++ b/python-lttngust/Makefile.am
+@@ -9,7 +9,7 @@ install-exec-local:
+ 	if [ "$(DESTDIR)" != "" ]; then \
+ 		opts="$$opts --root=$(DESTDIR)"; \
+ 	fi; \
+-	$(PYTHON) setup.py install $$opts;
++	$(PYTHON) setup.py install $$opts --install-lib=$(pythondir);
+ 
+ clean-local:
+ 	rm -rf $(builddir)/build
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb
index e8312af..cfaad30 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb
@@ -27,6 +27,7 @@ PE = "2"
 
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://lttng-ust-doc-examples-disable.patch \
+           file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
           "
 
 SRC_URI[md5sum] = "f0c86a9fa7dcfd0205fb42584a310b1c"
-- 
2.7.4


