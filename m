Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 57E666FFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 23:17:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 10 Feb 2016 15:17:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,427,1449561600"; d="scan'208";a="743942598"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.155])
	by orsmga003.jf.intel.com with ESMTP; 10 Feb 2016 15:17:47 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 17:19:53 -0600
Message-Id: <1455146393-4580-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, randy.e.witt@intel.com
Subject: [PATCH] classes/sanity: check_perl_modules provide output when fail
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
X-List-Received-Date: Wed, 10 Feb 2016 23:17:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When check_perl_modules fail is a good idea to print perl
interpeter output for debug purposes.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/sanity.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 9f35558..466eb49 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -452,12 +452,14 @@ def check_git_version(sanity_data):
 def check_perl_modules(sanity_data):
     ret = ""
     modules = ( "Text::ParseWords", "Thread::Queue", "Data::Dumper" )
+    errresult = ''
     for m in modules:
-        status, result = oe.utils.getstatusoutput("perl -e 'use %s' 2> /dev/null" % m)
+        status, result = oe.utils.getstatusoutput("perl -e 'use %s'" % m)
         if status != 0:
+            errresult += result
             ret += "%s " % m
     if ret:
-        return "Required perl module(s) not found: %s\n" % ret
+        return "Required perl module(s) not found: %s\n\n%s\n" % (ret, errresult)
     return None
 
 def sanity_check_conffiles(status, d):
-- 
2.1.4


