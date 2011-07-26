Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QlpHF-0007IJ-Te
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:34:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QLUhi5028078
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 14:30:43 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 26 Jul 2011 14:30:43 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jul 2011 16:31:09 -0500
Message-ID: <84d5793eb7e14beb3c2c1396a58cc3a475510a27.1311715727.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311715727.git.mark.hatle@windriver.com>
References: <cover.1311715727.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [v2 PATCH 8/8] package.bbclass: fixup_perms - change symlink processing
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
X-List-Received-Date: Tue, 26 Jul 2011 21:34:58 -0000
Content-Type: text/plain

We switch to using os.lchown in order to avoid following a symlink.

We also now check if an item is a symlink, if so we avoid the
os.chmod as a symlink inherits the mode of it's target.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f2950e2..076a532 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -472,7 +472,7 @@ python fixup_perms () {
 			else:
 				return int(mode,8)
 
-		# Note uid/gid -1 has special significance in os.chown
+		# Note uid/gid -1 has special significance in os.lchown
 		def _procuid(self, uid):
 			if uid is None or uid == "-":
 				return -1
@@ -514,14 +514,14 @@ python fixup_perms () {
 
 	# Fix the permission, owner and group of path
 	def fix_perms(path, mode, uid, gid, dir):
-		if mode:
+		if mode and not os.path.islink(path):
 			#bb.note("Fixup Perms: chmod 0%o %s" % (mode, dir))
 			os.chmod(path, mode)
 		# -1 is a special value that means don't change the uid/gid
-		# if they are BOTH -1, don't bother to chown
+		# if they are BOTH -1, don't bother to lchown
 		if not (uid == -1 and gid == -1):
-			#bb.note("Fixup Perms: chown %d:%d %s" % (uid, gid, dir))
-			os.chown(path, uid, gid)
+			#bb.note("Fixup Perms: lchown %d:%d %s" % (uid, gid, dir))
+			os.lchown(path, uid, gid)
 
 	# Return a list of configuration files based on either the default
 	# files/fs-perms.txt or the contents of FILESYSTEM_PERMS_TABLES
-- 
1.7.3.4



