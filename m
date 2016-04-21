Return-Path: <Tudor.Florea@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.39])
	by mail.openembedded.org (Postfix) with ESMTP id AA92D605FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 08:36:18 +0000 (UTC)
Received: from 1atA5y-0008Qw-U6 by out11a.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Tudor.Florea@enea.com>) id 1atA5y-0008RL-V4
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2016 01:36:18 -0700
Received: by emcmailer; Thu, 21 Apr 2016 01:36:18 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11a.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <Tudor.Florea@enea.com>) id 1atA5y-0008Qw-U6
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2016 01:36:18 -0700
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 21 Apr 2016 10:36:17 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4200)	id 8AB742413C1;
	Thu, 21 Apr 2016 10:36:17 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2016 10:36:16 +0200
Message-ID: <1461227776-57543-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Tudor.Florea@enea.com
X-PolicySMART: 6030817
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH 1/1] valgrind: turn off the file level dependency
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
X-List-Received-Date: Thu, 21 Apr 2016 08:36:20 -0000
Content-Type: text/plain

Attempting to install ptest for valgrind fails with this error:

error: Can't install valgrind-ptest-3.11.0-r0.1@ppce500mc: no package
provides /this/is/a/bogus/interpreter/name

This is because one of the tests contains a bogus interpreter path on purpose
It is not enough to skip the QA warning about the missing dependency
but the dependency have to be completely removed.
Since this package contains oly tests it is safe to disable per file
dependencies and rely on the ones per package.

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 51c88bf..8240500 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -68,9 +68,9 @@ RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
 RDEPENDS_${PN}-ptest += " sed perl perl-module-file-glob"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 
-# One of the tests contains a bogus interpreter path on purpose, and QA
-# check complains about it
-INSANE_SKIP_${PN}-ptest += "file-rdeps"
+# One of the tests contains a bogus interpreter path on purpose.
+# Skip file dependency check
+SKIP_FILEDEPS_${PN}-ptest = '1'
 
 do_compile_ptest() {
     oe_runmake check
-- 
1.9.1


