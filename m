Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2CA6E746DD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:03:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:03:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="47864838"
Received: from danayien-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.66.143])
	by orsmga002.jf.intel.com with ESMTP; 04 Apr 2018 04:03:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 23:02:36 +1200
Message-Id: <b7c956a8e21f3de178b35c9a70ce60c7900e9bf7.1522839599.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1522839599.git.paul.eggleton@linux.intel.com>
References: <cover.1522839599.git.paul.eggleton@linux.intel.com>
Cc: Enrico Jorns <ejo@pengutronix.de>
Subject: [PATCH 2/2] classes/externalsrc: ensure cleandirs code handles non-absolute paths
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
X-List-Received-Date: Wed, 04 Apr 2018 11:03:22 -0000

It's possible that a trailing or extra slash somewhere in the external
source path could result in the directory not being removed from
cleandirs; it's also possible that a cleandirs entry is somewhere
underneath the source tree and that tree should never have parts of it
deleted by the build system. Use oe.path.is_path_parent() (which makes
paths absolute before checking them) to find out if any path in
cleandirs is anywhere underneath the external source path, and drop it
if it is.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index ce8517c58b7..c9f5cf767d0 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -54,6 +54,7 @@ python () {
 
     if externalsrc:
         import oe.recipeutils
+        import oe.path
 
         d.setVar('S', externalsrc)
         if externalsrcbuild:
@@ -90,7 +91,7 @@ python () {
             cleandirs = oe.recipeutils.split_var_value(d.getVarFlag(task, 'cleandirs', False) or '')
             setvalue = False
             for cleandir in cleandirs[:]:
-                if d.expand(cleandir) == externalsrc:
+                if oe.path.is_path_parent(externalsrc, d.expand(cleandir)):
                     cleandirs.remove(cleandir)
                     setvalue = True
             if setvalue:
-- 
2.14.3


