Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9E8F7117D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:57:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7RFvIfu005036
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 08:57:18 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 27 Aug 2014 08:57:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Aug 2014 08:57:09 -0700
Message-ID: <02939f370701aa5247d7a00b59043641820a04a4.1409154816.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409154816.git.liezhi.yang@windriver.com>
References: <cover.1409154816.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] valgrind/oprofile/systemd: no bashism in run-ptest
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
X-List-Received-Date: Wed, 27 Aug 2014 15:57:23 -0000
Content-Type: text/plain

There is no bashism in the scripts, so use /bin/sh, and add /bin/sh
interpreter for systemd's run-ptest.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/systemd/systemd/run-ptest       |    2 ++
 meta/recipes-devtools/valgrind/valgrind/run-ptest |    3 ++-
 meta/recipes-kernel/oprofile/oprofile/run-ptest   |    3 ++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/run-ptest b/meta/recipes-core/systemd/systemd/run-ptest
index 2f6bd93..a2d61c2 100644
--- a/meta/recipes-core/systemd/systemd/run-ptest
+++ b/meta/recipes-core/systemd/systemd/run-ptest
@@ -1,3 +1,5 @@
+#!/bin/sh
+
 tar -C test -xJf test/sys.tar.xz
 make test/rules-test.sh.log
 make test/udev-test.pl.log
diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index 7d0584a..f9a72ec 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -1,4 +1,5 @@
-#!/bin/bash
+#!/bin/sh
+
 # run-ptest - 'ptest' test infrastructure shell script that
 #   wraps the valgrind regression script vg_regtest. 
 #   Must be run in the /usr/lib/valgrind/ptest directory. 
diff --git a/meta/recipes-kernel/oprofile/oprofile/run-ptest b/meta/recipes-kernel/oprofile/oprofile/run-ptest
index 583ee1b..4814be6 100644
--- a/meta/recipes-kernel/oprofile/oprofile/run-ptest
+++ b/meta/recipes-kernel/oprofile/oprofile/run-ptest
@@ -1,4 +1,5 @@
-#!/bin/bash
+#!/bin/sh
+
 saved_dir=$PWD
 for dir in */tests ; do
 	cd $dir
-- 
1.7.9.5


