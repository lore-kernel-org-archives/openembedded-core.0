Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1SHwCF-0008PJ-TX
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 13:58:48 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1SHw3E-0003V1-Gk from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 04:49:28 -0700
Received: from pkl-noor-ubuntu.mgc.mentorg.com ([137.202.157.70]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 11 Apr 2012 13:49:27 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 16:48:06 +0500
Message-Id: <1334144886-2587-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9
X-OriginalArrivalTime: 11 Apr 2012 11:49:27.0205 (UTC)
	FILETIME=[25BC4550:01CD17D9]
Subject: [PATCH] utility-taska.bbclass: Add distclean task for removing sources
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
X-List-Received-Date: Wed, 11 Apr 2012 11:58:48 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Bring distclean task from openembedded classic.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/classes/utility-tasks.bbclass |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index cbb000a..8379de6 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -28,6 +28,36 @@ python do_clean() {
 		bb.build.exec_func(f, d)
 }
 
+addtask distclean
+do_distclean[nostamp] = "1"
+python do_distclean() {
+	"""clear downloaded sources, build and temp directories"""
+
+	bb.build.exec_func('do_clean', d)
+
+	src_uri = bb.data.getVar('SRC_URI', d, 1)
+	if not src_uri:
+		return
+
+	for uri in src_uri.split():
+		if bb.decodeurl(uri)[0] == "file":
+			continue
+
+		try:
+			local = bb.data.expand(bb.fetch.localpath(uri, d), d)
+		except bb.MalformedUrl, e:
+			bb.debug(1, 'Unable to generate local path for malformed uri: %s' % e)
+		else:
+			bb.note("removing %s" % base_path_out(local, d))
+			try:
+				if os.path.exists(local + ".done"):
+					os.remove(local + ".done")
+				if os.path.exists(local):
+					os.remove(local)
+			except OSError, e:
+				bb.note("Error in removal: %s" % e)
+}
+
 addtask checkuri
 do_checkuri[nostamp] = "1"
 python do_checkuri() {
-- 
1.7.9



