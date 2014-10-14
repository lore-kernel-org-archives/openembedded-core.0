Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5426AD05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 13:39:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Oct 2014 06:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,717,1406617200"; d="scan'208";a="618395752"
Received: from gtotamun-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.192])
	by orsmga002.jf.intel.com with ESMTP; 14 Oct 2014 06:39:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Oct 2014 14:39:10 +0100
Message-Id: <5b73083d0b7d72c919ed69e195236ad1c4e5ee04.1413293907.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1413293907.git.paul.eggleton@linux.intel.com>
References: <cover.1413293907.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1413293907.git.paul.eggleton@linux.intel.com>
References: <cover.1413293907.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] openssh: avoid screen sessions being killed on disconnect with systemd
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
X-List-Received-Date: Tue, 14 Oct 2014 13:39:35 -0000

Tell systemd just to kill the sshd process when the ssh connection drops
instead of the entire cgroup for sshd, so that any screen sessions (and
more to the point, processes within them) do not get killed.

(This is what the Fedora sshd service file does, and what we're already
doing in the dropbear service file).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
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


