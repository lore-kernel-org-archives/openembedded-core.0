Return-Path: <mcrowe@brightsign.biz>
Received: from elite.brightsigndigital.co.uk
	(cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net [86.30.57.232])
	by mail.openembedded.org (Postfix) with ESMTP id BB2716BD8A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 14:29:04 +0000 (UTC)
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1Vz5kG-0007NV-1f; Fri, 03 Jan 2014 14:29:04 +0000
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1Vz5kF-0002gF-Vr; Fri, 03 Jan 2014 14:29:03 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 14:28:39 +0000
Message-Id: <1388759319-9913-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] valgrind: rrecommend libc6-dbg on all architectures
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
X-List-Received-Date: Fri, 03 Jan 2014 14:29:05 -0000

It seems that valgrind requires debug symbols to be available on all
architectures so there's no reason to treat arm and powerpc specially.

Ensuring that libc6-dbg is installed avoids errors like this on x86:

  valgrind:  Fatal error at startup: a function redirection
  valgrind:  which is mandatory for this platform-tool combination
  valgrind:  cannot be set up.  Details of the redirection are:
  valgrind:
  valgrind:  A must-be-redirected function
  valgrind:  whose name matches the pattern:      strlen
  valgrind:  in an object with soname matching:   ld-linux.so.2
  valgrind:  was not found whilst processing
  valgrind:  symbols from the object with soname: ld-linux.so.2
  valgrind:
  valgrind:  Possible fixes: (1, short term): install glibc's debuginfo
  valgrind:  package on this machine.  (2, longer term): ask the packagers
  valgrind:  for your Linux distribution to please in future ship a non-
  valgrind:  stripped ld.so (or whatever the dynamic linker .so is called)
  valgrind:  that exports the above-named function using the standard
  valgrind:  calling conventions for this platform.  The package you need
  valgrind:  to install for fix (1) is called
  valgrind:
  valgrind:    On Debian, Ubuntu:                 libc6-dbg
  valgrind:    On SuSE, openSuSE, Fedora, RHEL:   glibc-debuginfo
  valgrind:
  valgrind:  Cannot continue -- exiting now.  Sorry.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
index 216fdab..e1fb568 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
@@ -37,6 +37,7 @@ do_install_append () {
 RDEPENDS_${PN} += "perl"
 
 FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
-RRECOMMENDS_${PN}_powerpc += "${TCLIBC}-dbg"
-RRECOMMENDS_${PN}_powerpc64 += "${TCLIBC}-dbg"
-RRECOMMENDS_${PN}_armv7a += "${TCLIBC}-dbg"
+
+# valgrind needs debug information for ld.so at runtime in order to
+# redirect functions like strlen.
+RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
-- 
1.7.10.4


