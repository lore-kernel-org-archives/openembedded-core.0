Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 079ED7FC9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 13:30:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00KDThfl021222
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 05:30:10 -0800
Received: from yow-tgamblin-fedora1.wrs.com (128.224.56.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Mon, 20 Jan 2020 05:29:54 -0800
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2020 08:29:54 -0500
Message-ID: <20200120132954.2178532-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH v2] bitbakery: automate build testing across all MACHINEs/LIBCs
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
X-List-Received-Date: Mon, 20 Jan 2020 13:30:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

bitbakery simplifies the process of build testing an upgraded or
patched recipe. It cycles through all qemu targets for glibc and musl,
and then generates a log file in the format "<recipe>-bitbakery.log",
containing the results of each build along with some basic system info
(time, hostname, OS, kernel version). Additionally, it retains the
previous run's log for comparison, renamed to <recipe>-bitbakery.log.old
when a new set of builds is triggered.

Sample log output:

BITBAKERY LOG FOR aspell
START TIME: 2020-01-17_08:39:05
HOSTNAME: yow-tgamblin-fedora1
OS: Fedora 31 (Server Edition)
KERNEL: 5.4.7-200.fc31.x86_64
===============
BUILD RESULTS:
[glibc]
FAIL: qemuarm64
PASS: qemuarm
PASS: qemuarmv5
PASS: qemumips64
PASS: qemumips
PASS: qemuppc
PASS: qemuriscv64
FAIL: qemux86-64
FAIL: qemux86
[musl]
PASS: qemuarm64
PASS: qemuarm
PASS: qemuarmv5
PASS: qemumips64
PASS: qemumips
PASS: qemuppc
PASS: qemuriscv64
PASS: qemux86-64
PASS: qemux86
===============
PASSED: 15
FAILED: 3

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 scripts/bitbakery | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100755 scripts/bitbakery

diff --git a/scripts/bitbakery b/scripts/bitbakery
new file mode 100755
index 0000000000..cb2957a7bd
--- /dev/null
+++ b/scripts/bitbakery
@@ -0,0 +1,47 @@
+#!/bin/sh
+#  Copyright (c) 2020 Wind River Systems, Inc.
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+# Get path to oe-core directory
+OE_CORE_PATH=$( cd - || exit )
+
+# Get target list and host machine information
+TARGET_LIST=$(ls "$OE_CORE_PATH"/meta/conf/machine | grep qemu | sed -e 's/\.conf//')
+LIBC_LIST="glibc musl"
+START_TIME=$(date "+%Y-%m-%d_%H:%M:%S")
+LOG_FILE="$1-bitbakery.log"
+OS_INFO=$(cat /etc/os-release | grep "PRETTY_NAME=" | awk -F "=" '{print $2}' | sed -e 's/^"//' -e 's/"$//')
+
+# Append an existing log file for this build with .old if one exists
+if [ -f "${LOG_FILE}" ]; then
+   mv "${LOG_FILE}" "${LOG_FILE}.old"
+else
+       touch "${LOG_FILE}"
+fi
+
+# Fill the log file with build and host info
+echo "BITBAKERY LOG FOR $1" >> "${LOG_FILE}"
+echo "START TIME: ${START_TIME}" >> "${LOG_FILE}"
+echo "HOSTNAME: $(uname -n)" >> "${LOG_FILE}"
+echo "OS: ${OS_INFO}" >> "${LOG_FILE}"
+echo "KERNEL: $(uname -r)" >> "${LOG_FILE}"
+echo "===============" >> "${LOG_FILE}"
+echo "BUILD RESULTS:" >> "${LOG_FILE}"
+
+for j in ${LIBC_LIST}; do
+    echo "[$j]" >> "${LOG_FILE}"
+    for i in ${TARGET_LIST}; do
+    echo "$i" "$j"; \
+        TCLIBC=$j MACHINE=$i bitbake "$1" && echo "PASS: $i" >> "${LOG_FILE}" || echo "FAIL: $i" >> "${LOG_FILE}";
+    done;
+done
+
+# Get pass/fail totals and add them to the end of the log
+PASSED=$(grep "PASS:" "${LOG_FILE}" | wc -l)
+FAILED=$(grep "FAIL:" "${LOG_FILE}" | wc -l)
+
+echo "===============" >> "${LOG_FILE}"
+echo "PASSED: ${PASSED}" >> "${LOG_FILE}"
+echo "FAILED: ${FAILED}" >> "${LOG_FILE}"
-- 
2.24.1


