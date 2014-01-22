Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 77BFE6002A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 08:57:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0M8vL5l006581
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:57:21 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 22 Jan 2014 00:57:20 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jan 2014 16:57:38 +0800
Message-ID: <1390381058-5640-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] initscripts: define failure/success/warning/pass functions
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
X-List-Received-Date: Wed, 22 Jan 2014 08:57:21 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

define failure/success/warning/pass functions, some packages' initscript
need them, and /etc/core-lsb/lsb_log_message from lsb needs them too.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../initscripts/initscripts-1.0/functions          |   31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)
 mode change 100644 => 100755 meta/recipes-core/initscripts/initscripts-1.0/functions

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/functions b/meta/recipes-core/initscripts/initscripts-1.0/functions
old mode 100644
new mode 100755
index 8e15762..01ad1ed
--- a/meta/recipes-core/initscripts/initscripts-1.0/functions
+++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
@@ -3,6 +3,14 @@
 # functions     This file contains functions to be used by most or all
 #               shell scripts in the /etc/init.d directory.
 #
+
+NORMAL="\\033[0;39m"         # Standard console grey
+SUCCESS="\\033[1;32m"        # Success is green
+WARNING="\\033[1;33m"        # Warnings are yellow
+FAILURE="\\033[1;31m"        # Failures are red
+INFO="\\033[1;36m"           # Information is light cyan
+BRACKET="\\033[1;34m"        # Brackets are blue
+
 # NOTE: The pidofproc () doesn't support the process which is a script unless
 #       the pidof supports "-x" option. If you want to use it for such a
 #       process:
@@ -58,3 +66,26 @@ status() {
     fi
     return 3
 }
+
+success() {
+    echo -n -e "${BRACKET}[${SUCCESS}  OK  ${BRACKET}]${NORMAL}"
+    return 0
+}
+
+failure() {
+    local rc=$*
+    echo -n -e "${BRACKET}[${FAILURE} FAIL ${BRACKET}]${NORMAL}"
+    return $rc
+}
+
+warning() {
+    local rc=$*
+    echo -n -e "${BRACKET}[${WARNING} WARN ${BRACKET}]${NORMAL}"
+    return $rc
+}
+
+passed() {
+    local rc=$*
+    echo -n -e "${BRACKET}[${SUCCESS} PASS ${BRACKET}]${NORMAL}"
+    return $rc
+}
-- 
1.7.10.4


