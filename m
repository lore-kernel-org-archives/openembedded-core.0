Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B0509746B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:03:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="47864803"
Received: from danayien-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.66.143])
	by orsmga002.jf.intel.com with ESMTP; 04 Apr 2018 04:03:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 23:02:35 +1200
Message-Id: <2a8dd808adeef0efed679f04f2310cb9bf36827e.1522839599.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1522839599.git.paul.eggleton@linux.intel.com>
References: <cover.1522839599.git.paul.eggleton@linux.intel.com>
Cc: Enrico Jorns <ejo@pengutronix.de>
Subject: [PATCH 1/2] classes/externalsrc: handle if cleandirs contains python expressions
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
X-List-Received-Date: Wed, 04 Apr 2018 11:03:18 -0000

Use the existing oe.recipeutils.split_var_value() function to split the
unexpanded value of the cleandirs varflag, in case it contains python
expressions - we don't want to split the expression itself as the chunks
will not expand properly individually and we can miss something that
expands to the source tree (and thus it can get deleted, the avoidance
of which is the whole point of this code).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 3f1d39689b8..ce8517c58b7 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -53,6 +53,8 @@ python () {
             d.setVar('BB_DONT_CACHE', '1')
 
     if externalsrc:
+        import oe.recipeutils
+
         d.setVar('S', externalsrc)
         if externalsrcbuild:
             d.setVar('B', externalsrcbuild)
@@ -85,7 +87,7 @@ python () {
                 d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")
 
             # We do not want our source to be wiped out, ever (kernel.bbclass does this for do_clean)
-            cleandirs = (d.getVarFlag(task, 'cleandirs', False) or '').split()
+            cleandirs = oe.recipeutils.split_var_value(d.getVarFlag(task, 'cleandirs', False) or '')
             setvalue = False
             for cleandir in cleandirs[:]:
                 if d.expand(cleandir) == externalsrc:
-- 
2.14.3


