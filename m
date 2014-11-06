Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7291F72030
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 05:08:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Nov 2014 21:08:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,324,1413270000"; d="scan'208";a="627443313"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.89])
	by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2014 21:08:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Nov 2014 21:08:51 -0800
Message-Id: <1415250534-16350-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1415250534-16350-1-git-send-email-sgw@linux.intel.com>
References: <1415250534-16350-1-git-send-email-sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] openssh: avoid screen sessions being killed on disconnect with systemd
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
X-List-Received-Date: Thu, 06 Nov 2014 05:08:55 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

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
1.8.3.1


