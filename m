Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 162B360621
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 02:05:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAP25oDW026050
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 18:05:50 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 24 Nov 2015 18:04:49 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Nov 2015 09:53:54 +0800
Message-ID: <1448416434-15672-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] openssh: redesign ssh-agent.sh regression test case
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
X-List-Received-Date: Wed, 25 Nov 2015 02:05:51 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

ssh-agent regression test case should be run by non-root user,
but non-root user will has issue to run other testcase, so
rewrite it on run-ptest

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../recipes-connectivity/openssh/openssh/run-ptest | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/recipes-connectivity/openssh/openssh/run-ptest
index 564c0c8..769162e 100755
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
@@ -3,5 +3,42 @@
 export TEST_SHELL=sh
 
 cd regress
+sed -i "/\t\tagent-ptrace /d" Makefile
 make -k .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
         | sed -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e 's/^failed/FAIL: /g'
+
+
+SSHAGENT=`which ssh-agent`
+GDB=`which gdb`
+
+if [ -z "${SSHAGENT}" -o -z "${GDB}" ]; then
+       echo "SKIP: agent-ptrace"
+fi
+
+useradd openssh-test
+
+eval `su -c "${SSHAGENT} -s" openssh-test` > /dev/null
+r=$?
+if [ $r -ne 0 ]; then
+	echo "FAIL: could not start ssh-agent: exit code $r"
+else
+	su -c "gdb -p ${SSH_AGENT_PID}" openssh-test > /tmp/gdb.out 2>&1 << EOF
+		quit
+EOF
+	r=$?
+	if [ $r -ne 0 ]; then
+		echo "gdb failed: exit code $r"
+	fi
+	egrep 'ptrace: Operation not permitted.|procfs:.*Permission denied.|ttrace.*Permission denied.|procfs:.*: Invalid argument.|Unable to access task ' >/dev/null /tmp/gdb.out
+	r=$?
+	rm -f /tmp/gdb.out
+	if [ $r -ne 0 ]; then
+		echo "FAIL: ptrace agant"
+	else
+		echo "PASS: ptrace agant"
+	fi
+
+	${SSHAGENT} -k > /dev/null
+fi
+userdel openssh-test
+
-- 
1.9.1


