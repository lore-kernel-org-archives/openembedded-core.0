Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D18B36C01E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 17:28:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 10 Sep 2013 10:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,879,1371106800"; d="scan'208";a="393703679"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.204])
	by fmsmga001.fm.intel.com with ESMTP; 10 Sep 2013 10:28:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Sep 2013 10:28:14 -0700
Message-Id: <1378834095-8523-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1378834095-8523-1-git-send-email-sgw@linux.intel.com>
References: <1378834095-8523-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/3] systemd.bbclass: get the correct /lib directory
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
X-List-Received-Date: Tue, 10 Sep 2013 17:28:15 -0000

By using os.path.dirname(systemd_unitdir) we get the correct /lib directory instead of
dealing with possibly multilib directories.  This address a QA Error for shipped/not
installed /lib with multilib and x32.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/systemd.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 8ec4992..eab8735 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -168,9 +168,9 @@ python rm_systemd_unitdir (){
         systemd_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_unitdir', True))
         if os.path.exists(systemd_unitdir):
             shutil.rmtree(systemd_unitdir)
-        base_libdir = oe.path.join(d.getVar("D", True), d.getVar('base_libdir', True))
-        if (os.path.exists(base_libdir) and not os.listdir(base_libdir)):
-            os.rmdir(base_libdir)
+        systemd_libdir = os.path.dirname(systemd_unitdir)
+        if (os.path.exists(systemd_libdir) and not os.listdir(systemd_libdir)):
+            os.rmdir(systemd_libdir)
 }
 do_install[postfuncs] += "rm_systemd_unitdir "
 
-- 
1.8.3.1


