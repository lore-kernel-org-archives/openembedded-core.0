Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPUMC-0000tY-Ds
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 10:56:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Apr 2013 01:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,437,1363158000"; d="scan'208";a="224942880"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.195])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Apr 2013 01:39:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 09:39:24 +0100
Message-Id: <1365496764-6301-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] classes/buildhistory: fix interaction with rm_work
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
X-List-Received-Date: Tue, 09 Apr 2013 08:56:49 -0000

Change do_write_srcrevs to a postfunc of do_fetch, avoiding a dependency
being created that causes large numbers of setscene tasks being executed
on every build with both buildhistory and rm_work being enabled.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8c9f794..1ac1a8b 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -553,7 +553,8 @@ def _get_srcrev_values(d):
                 dict_tag_srcrevs[key] = rev
     return (dict_srcrevs, dict_tag_srcrevs)
 
-python do_write_srcrev() {
+do_fetch[postfuncs] += "write_srcrev"
+python write_srcrev() {
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
     srcrevfile = os.path.join(pkghistdir, 'latest_srcrev')
 
@@ -593,5 +594,3 @@ python do_write_srcrev() {
         if os.path.exists(srcrevfile):
             os.remove(srcrevfile)
 }
-
-addtask write_srcrev after do_fetch before do_build
-- 
1.7.10.4



