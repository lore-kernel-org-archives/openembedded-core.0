Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 895A670EF1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 15:23:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Oct 2014 08:22:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,796,1406617200"; d="scan'208";a="596967993"
Received: from tlankage-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.isw.intel.com) ([10.252.121.248])
	by orsmga001.jf.intel.com with ESMTP; 27 Oct 2014 08:23:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Oct 2014 15:23:24 +0000
Message-Id: <9474deeb8949dc8edc7cd9a06a7c2f84c97a028a.1414423342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1414423342.git.paul.eggleton@linux.intel.com>
References: <cover.1414423342.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1414423342.git.paul.eggleton@linux.intel.com>
References: <cover.1414423342.git.paul.eggleton@linux.intel.com>
Subject: [daisy][PATCH 2/2] openssh: avoid screen sessions being killed on disconnect with systemd
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
X-List-Received-Date: Mon, 27 Oct 2014 15:23:37 -0000

Tell systemd just to kill the sshd process when the ssh connection drops
instead of the entire cgroup for sshd, so that any screen sessions (and
more to the point, processes within them) do not get killed.

(This is what the Fedora sshd service file does, and what we're already
doing in the dropbear service file).

(From OE-Core master rev: 3c238dff41fbd3687457989c7b17d22b2cc844be)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh/sshd@.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd@.service b/meta/recipes-connectivity/openssh/openssh/sshd@.service
index 4eda659..bb2d68e 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd@.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshd@.service
@@ -8,3 +8,4 @@ ExecStart=-@SBINDIR@/sshd -i
 ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
 StandardInput=socket
 StandardError=syslog
+KillMode=process
-- 
1.9.3


