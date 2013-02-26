Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <emilia.maria.silvia.ciobanu@intel.com>)
	id 1UAKrx-0008FG-EG for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 14:47:00 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Feb 2013 05:30:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,740,1355126400"; d="scan'208";a="290664265"
Received: from ema-vostro-460 (HELO localhost.localdomain) ([10.237.105.140])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2013 05:30:35 -0800
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2013 15:35:14 +0200
Message-Id: <1361885714-24362-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] distrodata: added some corner cases for svn and git repos
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 13:47:04 -0000

distrodata.bbclass: git tags can include only one digit, therefore
the regex that matches the latest version should also include this
case. For some svn repos, using the http protocol than using the
svn protocol to get infomation about revisions works better.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 meta/classes/distrodata.bbclass |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 276ca03..bd3a6a9 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -674,7 +674,7 @@ python do_checkpkg() {
                                 if len(line)==0:
                                         break;
                                 puptag = line.split("/")[-1]
-                                puptag = re.search("[0-9][0-9|\.|_]+[0-9]", puptag)
+                                puptag = re.search("([0-9][\.|_]?)+", puptag)
                                 if puptag == None:
                                         continue;
                                 puptag = puptag.group()
@@ -714,6 +714,10 @@ python do_checkpkg() {
                 svncmd = "svn info %s %s://%s%s/%s/ 2>&1" % (" ".join(options), svnproto, host, path, parm["module"])
                 print svncmd
                 svninfo = os.popen(svncmd).read()
+                if "Can't connect to host " in svninfo or "Connection timed out" in svninfo:
+                        svncmd = "svn info %s %s://%s%s/%s/ 2>&1" % (" ".join(options), "http",
+                                       host, path, parm["module"])
+                        svninfo = os.popen(svncmd).read()
                 for line in svninfo.split("\n"):
                         if re.search("^Last Changed Rev:", line):
                                 pupver = line.split(" ")[-1]
-- 
1.7.9.5



