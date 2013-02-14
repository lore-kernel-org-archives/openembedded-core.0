Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <emilia.maria.silvia.ciobanu@intel.com>)
	id 1U61JT-0003mI-LP for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 17:05:37 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Feb 2013 07:48:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,665,1355126400"; d="scan'208";a="287250875"
Received: from ema-vostro-460 (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2013 07:48:14 -0800
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2013 17:52:40 +0200
Message-Id: <1360857160-17509-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] Solved package namespace errors in PRS
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
X-List-Received-Date: Thu, 14 Feb 2013 16:05:38 -0000

For some packages PRS reported incorrect upstream version
as it was either the raw string or it mismatched some
alternative groups.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 meta/classes/distrodata.bbclass |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index e25eeab..276ca03 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -291,8 +291,8 @@ python do_checkpkg() {
         suffix = "(tar\.gz|tgz|tar\.bz2|zip|xz|rpm|bz2|orig\.tar\.gz|tar\.xz|src\.tar\.gz|src\.tgz|svnr\d+\.tar\.bz2|stable\.tar\.gz|src\.rpm)"
 
         suffixtuple = ("tar.gz", "tgz", "zip", "tar.bz2", "tar.xz", "bz2", "orig.tar.gz", "src.tar.gz", "src.rpm", "src.tgz", "svnr\d+.tar.bz2", "stable.tar.gz", "src.rpm")
-        sinterstr = "(?P<name>%s?)v?(?P<ver>%s)(source)?" % (prefix, ver_regex)
-        sdirstr = "(?P<name>%s)\.?v?(?P<ver>%s)(source)?[\.\-](?P<type>%s$)" % (prefix, ver_regex, suffix)
+        sinterstr = "(?P<name>%s?)v?(?P<ver>%s)(\-source)?" % (prefix, ver_regex)
+        sdirstr = "(?P<name>%s)\.?v?(?P<ver>%s)(\-source)?[\.\-](?P<type>%s$)" % (prefix, ver_regex, suffix)
 
         def parse_inter(s):
                 m = re.search(sinterstr, s)
@@ -504,7 +504,7 @@ python do_checkpkg() {
                                 status = "ErrParseDir"
                         else:
                                 """newver still contains a full package name string"""
-                                status = newver[1]
+                                status = re.sub('_', '.', newver[1])
                 elif not len(fhtml):
                         status = "ErrHostNoDir"
 
-- 
1.7.9.5



