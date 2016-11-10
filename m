Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E92E160103
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 07:08:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAA78W1l028588
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2016 23:08:32 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 9 Nov 2016 23:08:31 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2016 15:01:26 +0800
Message-ID: <c85f8f70589035d33b7a7ff6e0709d22578059a9.1478760924.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478760924.git.kai.kang@windriver.com>
References: <cover.1478760924.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] qemu: update run-ptest script
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
X-List-Received-Date: Thu, 10 Nov 2016 07:08:31 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The Makefile in directory tests has been renamed, then update script
run-ptest to follow the change.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu/run-ptest | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/run-ptest b/meta/recipes-devtools/qemu/qemu/run-ptest
index f4b8e97..2206b31 100644
--- a/meta/recipes-devtools/qemu/qemu/run-ptest
+++ b/meta/recipes-devtools/qemu/qemu/run-ptest
@@ -1,8 +1,10 @@
 #!/bin/sh
 #
 #This script is used to run qemu test suites
-ptestdir=$(pwd)
-cd tests
+#
 
+ptestdir=$(dirname "$(readlink -f "$0")")
 export SRC_PATH=$ptestdir
-make -k runtest-TESTS | sed '/: OK/ s/^/PASS: /g'
+
+cd $ptestdir/tests
+make -f Makefile.include -k runtest-TESTS | sed '/: OK/ s/^/PASS: /g'
-- 
2.10.1


