Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tgwsx-0005Iz-NI
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 13:18:31 +0100
Received: from mail-wg0-f69.google.com ([74.125.82.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 07 Dec 2012 04:04:02 -0800
Received: by mail-wg0-f69.google.com with SMTP id es5so296271wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2012 04:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=6nokwsMxMFu0ts3UHJsXeLufqG0eLG1G388Iow19hXA=;
	b=HqsAYUBQtNd0Q34FngLe7h9dJoXdTlPISqn4z/nzjr34TpiOzw1liK9EXTLFN0YGBu
	YMSBgri7i57q58C17lfpNk6+SK5piXAcb4mZauV0+9RvDuQM8aWQo9Di3DD6zD+UfOir
	G7s0sTddK+nUci37oO5GY1w/tBEMTJzAcwQ4xVyfkhZ2uRo3cHLTcpjSunsjlBIURzPl
	V7IVTgqHVkcaNwLIYgFBO9mUYowFi3ECPb/LniGdNIvbuC3thFlUNj2IJKX5x86+vHmP
	R57A172wOgpwcfUkUlG9QqDRQG6bXlyFyqU9brYal0dFCIF9axOXaC2rrSBBHpSLTsGE
	S+jg==
Received: by 10.216.88.12 with SMTP id z12mr2011518wee.136.1354881841021;
	Fri, 07 Dec 2012 04:04:01 -0800 (PST)
Received: by 10.216.88.12 with SMTP id z12mr2011514wee.136.1354881840787;
	Fri, 07 Dec 2012 04:04:00 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dw4sm15341218wib.1.2012.12.07.04.03.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Dec 2012 04:03:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Dec 2012 12:02:24 +0000
Message-Id: <1354881744-1827-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmTKxTsAE36I12dRnVCw4Gjt34l7IWV5io9CEP8VwbOi9M+jy1oL/YFrI0cosHHVauAHbyCa6FqiMK7gUlo4Ys0srJXF7Tc1VbrcXqzH29oSRbNIO5ly9Dds/XwrxjK5iATpXexaIo4iZGrubAwdmGyKF3DsqYSqgFV7vN5Fc8rg4Te8ByRWetyMXi2KZTVKRbDeM3J
Subject: [PATCH] rt-tests: add missing build dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2012 12:18:32 -0000

hackbench links to but doesn't depend on librttest.a, so parallel builds can
randomly fail.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...d-missing-build-dependencies-to-hackbench.patch |   32 ++++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests.inc              |    5 +--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-rt/rt-tests/files/0001-Add-missing-build-dependencies-to-hackbench.patch

diff --git a/meta/recipes-rt/rt-tests/files/0001-Add-missing-build-dependencies-to-hackbench.patch b/meta/recipes-rt/rt-tests/files/0001-Add-missing-build-dependencies-to-hackbench.patch
new file mode 100644
index 0000000..c4d221d
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/0001-Add-missing-build-dependencies-to-hackbench.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Submitted [email]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 640aea5bd51ea380d299df16cb90b290a0b54ac9 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Fri, 7 Dec 2012 11:58:12 +0000
+Subject: [PATCH] Add missing build dependencies to hackbench
+
+hackbench links to librttest.a but doesn't depend on it, so building it
+explicitly or in parallel builds this can fail.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index fd3cdb3..95030d9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -96,7 +96,7 @@ sendme: sendme.o librttest.a
+ pip_stress: pip_stress.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+-hackbench: hackbench.o
++hackbench: hackbench.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ librttest.a: rt-utils.o error.o rt-get_cpu.o
+-- 
+1.7.10
+
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 6a699fc..9cc1638 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -5,9 +5,10 @@ PR = "r0"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git \
            file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
-           file://0002-rt-tests-Break-out-install_hwlatdetect.patch"
+           file://0002-rt-tests-Break-out-install_hwlatdetect.patch \
+           file://0001-Add-missing-build-dependencies-to-hackbench.patch"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10



