Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBor4-00066k-JK for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 16:23:22 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96EOHLC011918 for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 15:24:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LmuAzcApGeNn
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2011 15:24:17 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96EOBiv011913
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 15:24:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 06 Oct 2011 15:17:34 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317910664.6398.83.camel@ted>
Mime-Version: 1.0
Subject: base.bbclass: Minor cleanup
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
X-List-Received-Date: Thu, 06 Oct 2011 14:23:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 57f1c3f..7cd6efa 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -202,7 +202,6 @@ def preferred_ml_updates(d):
 
 addhandler base_eventhandler
 python base_eventhandler() {
-	from bb import note, error, data
 	from bb.event import getName
 
 	name = getName(e)
@@ -212,7 +211,7 @@ python base_eventhandler() {
 		statusvars = ['BB_VERSION', 'TARGET_ARCH', 'TARGET_OS', 'MACHINE', 'DISTRO', 'DISTRO_VERSION','TUNE_FEATURES', 'TARGET_FPU']
 		statuslines = ["%-17s = \"%s\"" % (i, bb.data.getVar(i, e.data, 1) or '') for i in statusvars]
 
-		layers = (data.getVar("BBLAYERS", e.data, 1) or "").split()
+		layers = (bb.data.getVar("BBLAYERS", e.data, 1) or "").split()
 		layers_branch_rev = ["%-17s = \"%s:%s\"" % (os.path.basename(i), \
 			base_get_metadata_git_branch(i, None).strip(), \
 			base_get_metadata_git_revision(i, None)) \
@@ -248,9 +247,6 @@ python base_eventhandler() {
                 generate_git_config(e)
                 pkgarch_mapping(e.data)
                 preferred_ml_updates(e.data)
-
-	if not data in e.__dict__:
-		return
 }
 
 addtask configure after do_patch




