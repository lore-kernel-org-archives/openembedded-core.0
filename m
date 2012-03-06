Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4xvq-0003cn-Sv
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:12:17 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2012 09:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125714864"
Received: from unknown (HELO swold-mobl.verilan.com) ([10.255.15.180])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2012 09:03:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 09:03:19 -0800
Message-Id: <c0c7f89fcc58d34ed7c9d1da230508f06ebae64b.1331053126.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/20] mime.bbclass: Fix bracket error.
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
X-List-Received-Date: Tue, 06 Mar 2012 17:12:18 -0000

From: Samuel Stirtzel <s.stirtzel@googlemail.com>

This fixes the following error:

ERROR: Error executing a python function in ...:
AttributeError: 'str' object has no attribute 'append'

ERROR: The stack trace of python calls that resulted in this exception/failure was:
ERROR:   File "populate_packages", line 193, in <module>
ERROR:
ERROR:   File "populate_packages", line 189, in populate_packages
ERROR:
ERROR: The code that was being executed was:
ERROR:      0189:                       rdepends.append("shared-mime-info-data")
ERROR:      0190:                       d.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends))
ERROR:      0191:
ERROR:      0192:
ERROR:  *** 0193:populate_packages(d)
ERROR:      0194:
ERROR: (file: 'populate_packages', lineno: 193, function: <module>)
ERROR:      0185:                       postrm += d.getVar('mime_postrm', True)
ERROR:      0186:                       d.setVar('pkg_postrm_%s' % pkg, postrm)
ERROR:      0187:                       bb.note("adding shared-mime-info-data dependency to %s" % pkg)
ERROR:      0188:                       rdepends = explode_deps(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False)) or ""
ERROR:  *** 0189:                       rdepends.append("shared-mime-info-data")
ERROR:      0190:                       d.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends))
ERROR:      0191:
ERROR:      0192:
ERROR:      0193:populate_packages(d)

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta/classes/mime.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index dcdc27a..6302747 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -54,7 +54,7 @@ python populate_packages_append () {
 			postrm += d.getVar('mime_postrm', True)
 			d.setVar('pkg_postrm_%s' % pkg, postrm)
 			bb.note("adding shared-mime-info-data dependency to %s" % pkg)
-			rdepends = explode_deps(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False)) or ""
+			rdepends = explode_deps(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False) or "" ) 
 			rdepends.append("shared-mime-info-data")
 			d.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends))
 }
-- 
1.7.7.6



