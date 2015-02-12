Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B9E27339E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 09:07:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1C97gIY007559
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 01:07:42 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Feb 2015 01:07:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Feb 2015 01:07:36 -0800
Message-ID: <6be363be05a3431ce09edc288ce7ee424bc51d3f.1423732000.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423732000.git.liezhi.yang@windriver.com>
References: <cover.1423732000.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] rt-tests: fix gzip command
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
X-List-Received-Date: Thu, 12 Feb 2015 09:07:43 -0000
Content-Type: text/plain

The "-c" doesn't work in command "gzip file -c", need use "gzip -c file"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../rt-tests/files/Makefile-fix-gzip-command.patch |   30 ++++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests.inc              |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-rt/rt-tests/files/Makefile-fix-gzip-command.patch

diff --git a/meta/recipes-rt/rt-tests/files/Makefile-fix-gzip-command.patch b/meta/recipes-rt/rt-tests/files/Makefile-fix-gzip-command.patch
new file mode 100644
index 0000000..0a35ddc
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/Makefile-fix-gzip-command.patch
@@ -0,0 +1,30 @@
+From 07b5ed42d7041ccc084889eaa96817aa097bf461 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 3 Feb 2015 03:10:25 +0000
+Subject: [PATCH] Makefile: fix gzip command
+
+The "-c" doesn't work in command "gzip file -c", need use "gzip -c file"
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 219a591..c7d147a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -144,7 +144,7 @@ install_hwlatdetect: hwlatdetect
+ 		install -D -m 755 src/hwlatdetect/hwlatdetect.py $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
+ 		rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
+ 		ln -s $(PYLIB)/hwlatdetect.py "$(DESTDIR)$(bindir)/hwlatdetect" ; \
+-		gzip src/hwlatdetect/hwlatdetect.8 -c >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz" ; \
++		gzip -c src/hwlatdetect/hwlatdetect.8 >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz" ; \
+ 	fi
+ 
+ .PHONY: release
+-- 
+2.0.1
+
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 7fbe6d4..4942701 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -7,6 +7,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git
            file://0002-rt-tests-Break-out-install_hwlatdetect.patch \
            file://added-missing-dependencies.patch \
            file://hackbench-fix-error-check.patch \
+           file://Makefile-fix-gzip-command.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


