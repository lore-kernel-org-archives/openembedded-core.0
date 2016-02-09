Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A0072731C2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 15:22:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Feb 2016 07:22:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,421,1449561600"; d="scan'208";a="880455543"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 09 Feb 2016 07:22:29 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	rongqing.li@windriver.com
Date: Tue,  9 Feb 2016 17:27:29 +0200
Message-Id: <d4042df474fbeac812259a223d1ae5ef165adffe.1455031114.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3a3e85c9b61e21014b680607f722ba2a884349e8.1455031114.git.jussi.kukkonen@intel.com>
References: <3a3e85c9b61e21014b680607f722ba2a884349e8.1455031114.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1455031114.git.jussi.kukkonen@intel.com>
References: <cover.1455031114.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] openssh: Properly skip ptrace test if tools are missing
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
X-List-Received-Date: Tue, 09 Feb 2016 15:22:29 -0000

Without the exit there will be a SKIP and a FAIL for the same test.
Also fix typo in a message.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-connectivity/openssh/openssh/run-ptest | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/recipes-connectivity/openssh/openssh/run-ptest
index 769162e..36a3d2a 100755
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
@@ -7,12 +7,12 @@ sed -i "/\t\tagent-ptrace /d" Makefile
 make -k .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
         | sed -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e 's/^failed/FAIL: /g'
 
-
 SSHAGENT=`which ssh-agent`
 GDB=`which gdb`
 
 if [ -z "${SSHAGENT}" -o -z "${GDB}" ]; then
        echo "SKIP: agent-ptrace"
+       exit
 fi
 
 useradd openssh-test
@@ -33,9 +33,9 @@ EOF
 	r=$?
 	rm -f /tmp/gdb.out
 	if [ $r -ne 0 ]; then
-		echo "FAIL: ptrace agant"
+		echo "FAIL: ptrace agent"
 	else
-		echo "PASS: ptrace agant"
+		echo "PASS: ptrace agent"
 	fi
 
 	${SSHAGENT} -k > /dev/null
-- 
2.1.4


