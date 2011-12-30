Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1RgTe6-0004Pp-3i
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 05:00:42 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Dec 2011 19:52:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="91435394"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga001.jf.intel.com with ESMTP; 29 Dec 2011 19:52:23 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 11:50:52 +0800
Message-Id: <50cb9121e9ded46657e7466d192029eb88a1d6d9.1325215668.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <6ad22f9852cfd011244b3e511f5e563007f7ac5c.1325215668.git.lianhao.lu@intel.com>
References: <6ad22f9852cfd011244b3e511f5e563007f7ac5c.1325215668.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1325215668.git.lianhao.lu@intel.com>
References: <cover.1325215668.git.lianhao.lu@intel.com>
Subject: [PRService/meta 2/3] package.bbclass: per recipe PRSERV_HOST support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Dec 2011 04:00:42 -0000

[YOCTO #1126]
Added per recipe PRSERV_HOST PRSERV_PORT support.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/package.bbclass |   10 +++++++++-
 meta/conf/bitbake.conf       |    2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 07d6f9a..4fb7cc1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -350,6 +350,14 @@ def runtime_mapping_rename (varname, d):
 #
 
 python package_get_auto_pr() {
+	# per recipe PRSERV_HOST PRSERV_PORT
+	pn = d.getVar('PN', True)
+	host = d.getVar("PRSERV_HOST_" + pn, True)
+	port = d.getVar("PRSERV_PORT_" + pn, True)
+	if not (host is None):
+		d.setVar("PRSERV_HOST", host)
+	if not (port is None):
+		d.setVar("PRSERV_PORT", port)
 	if d.getVar('USE_PR_SERV', True) != "0":
 		try:
 			auto_pr=prserv_get_pr_auto(d)
@@ -362,7 +370,7 @@ python package_get_auto_pr() {
 				bb.error("Can NOT get auto PRAUTO from lockdown exported file")
 			else:
 				bb.error("Can NOT get auto PRAUTO from remote PR service")
-			raise bb.build.FuncFailed(e)
+			raise bb.build.FuncFailed()
 			return 
 		d.setVar('PRAUTO',str(auto_pr))
 }
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 31a722e..6b1744f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -190,7 +190,7 @@ BP = "${BPN}-${PV}"
 #
 # network based PR service
 #
-USE_PR_SERV = "${@[1,0][((d.getVar('PRSERV_HOST',1) is None) or (d.getVar('PRSERV_PORT',1) is None)) and (d.getVar('PRSERV_LOCKDOWN',1) is None)]}"
+USE_PR_SERV = "${@[1,0][((d.getVar('PRSERV_HOST',1) is None) or (d.getVar('PRSERV_HOST',1) == "") or (d.getVar('PRSERV_PORT',1) is None) or (d.getVar('PRSERV_PORT',1) == "")) and (d.getVar('PRSERV_LOCKDOWN',1) is None)]}"
 
 # Package info.
 
-- 
1.7.0.4



