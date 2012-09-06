Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1T9he1-0003rf-8T
	for Openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 21:21:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q86IoD7U019883
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2012 11:50:13 -0700 (PDT)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 6 Sep 2012 11:50:13 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 6 Sep 2012 13:53:54 -0500
Message-ID: <1346957634-22312-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] packageinfo.bbclass: Fix crash in hob
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
X-List-Received-Date: Thu, 06 Sep 2012 19:21:41 -0000
Content-Type: text/plain

The hob internally fails after executing a build and invoking
the hob a second time when it tries to use the values found in
BUILDDIR/tmp/pkgdata/*/runtime/*

The internal failure of the hob will manifest itself as
stating "Populated recipes 99%" forever after selecting
a machine just after starting the hob interface.

The internal trace looks like:

Traceback (most recent call last):
  File "packageinfo_handler(e)", line 24, in packageinfo_handler
KeyError: 'PKGV'

It is a result of using an override for a package version for
pieces of the toolchain, in the bb file e.g.
    PKGV_gdb-dbg = "1234.5678"

The work around for now is to populate the sdata PKGV value
and to assign the pkgv variable with the correct value
from the values found in the pkgdata store.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/packageinfo.bbclass |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/classes/packageinfo.bbclass b/meta/classes/packageinfo.bbclass
index 26cce60..53965e4 100644
--- a/meta/classes/packageinfo.bbclass
+++ b/meta/classes/packageinfo.bbclass
@@ -18,7 +18,12 @@ python packageinfo_handler () {
                         sdata = oe.packagedata.read_pkgdatafile(root + pkgname)
                         sdata['PKG'] = pkgname
                         pkgrename = sdata['PKG_%s' % pkgname]
-                        pkgv = sdata['PKGV'].replace('-', '+')
+                        try:
+                            pkgv = sdata['PKGV']
+                        except:
+			    sdata['PKGV'] = sdata['PKGV_%s' % pkgname]
+                        pkgv = sdata['PKGV']
+                        pkgv = pkgv.replace('-', '+')
                         pkgr = sdata['PKGR']
                         # We found there are some renaming issue with certain architecture.
                         # For example, armv7a-vfp-neon, it will use armv7a in the rpm file. This is the workaround for it.
-- 
1.7.1



