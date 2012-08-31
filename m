Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1T7S8e-0001Wu-J9
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 16:24:00 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.298.4;
	Fri, 31 Aug 2012 16:10:33 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id DD9782867D0;
	Fri, 31 Aug 2012 16:10:35 +0200 (CEST)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Aug 2012 16:10:29 +0200
Message-ID: <1346422229-61628-4-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1346422229-61628-1-git-send-email-bjst@enea.com>
References: <1346422229-61628-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 3/3] New recipe: ptest-runner
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
X-List-Received-Date: Fri, 31 Aug 2012 14:24:00 -0000
Content-Type: text/plain

This package contains the top-level script that seeks out and starts all
package tests.
---
 .../ptest-runner/files/ptest-runner                |   16 ++++++++++++++++
 .../ptest-runner/ptest-runner_1.0.bb               |   17 +++++++++++++++++
 2 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/ptest-runner/files/ptest-runner
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner_1.0.bb

diff --git a/meta/recipes-support/ptest-runner/files/ptest-runner b/meta/recipes-support/ptest-runner/files/ptest-runner
new file mode 100644
index 0000000..7c5475e
--- /dev/null
+++ b/meta/recipes-support/ptest-runner/files/ptest-runner
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+echo "START: $0"
+cd /usr/lib
+for x in *
+do
+    if [ -d "/usr/lib/$x/ptest" ]; then
+       date "+%Y-%m-%dT%H:%M"
+        echo "BEGIN: $x"
+        cd /usr/lib/$x/ptest
+        ./run-ptest
+        echo "END: $x"
+       date "+%Y-%m-%dT%H:%M"
+    fi
+done
+echo "STOP: $0"
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_1.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_1.0.bb
new file mode 100644
index 0000000..6b866d4
--- /dev/null
+++ b/meta/recipes-support/ptest-runner/ptest-runner_1.0.bb
@@ -0,0 +1,17 @@
+SRC_URI += "file://ptest-runner"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+do_install () {
+    mkdir -p ${D}${bindir}
+    install -m 0755 ${WORKDIR}/ptest-runner ${D}${bindir}
+}
+
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_build[noexec] = "1"
-- 
1.7.5.4



