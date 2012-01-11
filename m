Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rksqt-00005n-AX
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 08:44:07 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Jan 2012 23:36:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="96880547"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.168])
	by orsmga002.jf.intel.com with ESMTP; 10 Jan 2012 23:36:34 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 23:36:30 -0800
Message-Id: <cf1594bdb3a688577ad77bad0d70a0a7f4c629d1.1326267271.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326267271.git.sgw@linux.intel.com>
References: <cover.1326267271.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326267271.git.sgw@linux.intel.com>
References: <cover.1326267271.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 5/5] package.bbclass: per recipe PRSERV_HOST support
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
X-List-Received-Date: Wed, 11 Jan 2012 07:44:07 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

[YOCTO #1126]
Added per recipe PRSERV_HOST PRSERV_PORT support.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/package.bbclass |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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
-- 
1.7.6.5



