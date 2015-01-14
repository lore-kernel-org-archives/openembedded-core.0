Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 716CB65D19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 11:15:26 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 14 Jan 2015 12:15:20 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id EE14A2800CB;
	Wed, 14 Jan 2015 12:15:20 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 12:15:19 +0100
Message-ID: <1421234119-43620-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] ltp: do not remove scripts which use expect
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
X-List-Received-Date: Wed, 14 Jan 2015 11:15:33 -0000
Content-Type: text/plain

Since we have "expect" available in oe-core, install the test scripts
which uses it.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-extended/ltp/ltp_20140828.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20140828.bb b/meta/recipes-extended/ltp/ltp_20140828.bb
index 0be18a7..3de8b60 100644
--- a/meta/recipes-extended/ltp/ltp_20140828.bb
+++ b/meta/recipes-extended/ltp/ltp_20140828.bb
@@ -67,13 +67,9 @@ do_install(){
 
     # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
     cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
-
-    # We need to remove all scripts which depend on /usr/bin/expect, since expect is not supported in oe-core
-    # We will add expect for enhancement in future
-    find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" | awk -F":" '{print $1}' | xargs rm -f
 }
 
-RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk"
+RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect"
 
 FILES_${PN}-dbg += "\
     /opt/ltp/runtest/.debug \
-- 
1.9.1


