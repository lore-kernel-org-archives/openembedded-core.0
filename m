Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Rgpp9-0000nF-8q
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Dec 2011 04:41:35 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Dec 2011 19:33:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="51989739"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Dec 2011 19:33:16 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Dec 2011 11:31:43 +0800
Message-Id: <93c736cc566ed205d532bea9390d64bec86f8dae.1325302234.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <03140960a07a85cb0549d0cb8fab4ee09281ba6a.1325302234.git.lianhao.lu@intel.com>
References: <03140960a07a85cb0549d0cb8fab4ee09281ba6a.1325302234.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1325302234.git.lianhao.lu@intel.com>
References: <cover.1325302234.git.lianhao.lu@intel.com>
Subject: [PRService/meta V2 2/3] package.bbclass: per recipe PRSERV_HOST support
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
X-List-Received-Date: Sat, 31 Dec 2011 03:41:35 -0000

[YOCTO #1126]
Added per recipe PRSERV_HOST PRSERV_PORT support.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/package.bbclass |    8 ++++++++
 meta/conf/bitbake.conf       |    2 +-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 65e6571..f8f0a12 100644
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



