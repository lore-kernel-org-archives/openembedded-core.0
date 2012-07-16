Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhQ-0006tH-Pb
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443343"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:22 -0700
Message-Id: <855211ae7a224f96663862d4a0e58a90d945dd48.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/30] cpan.bbclass: Fix CCFLAGS.
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:06 -0000

From: Xin Ouyang <Xin.Ouyang@windriver.com>

We should not just replace CCFLAGS with CFLAGS while compiling, because
this may cause run-time errors with perl's DynaLoader.pm.

Tested on qemux86 with new libnet-libidn-perl bb recipe:

root@qemux86:~# perl -e "use Net::LibIDN"
Not a CODE reference at /usr/lib/perl/5.14.2//DynaLoader.pm line 213.
END failed--call queue aborted at /usr/lib/perl/vendor_perl/5.14.2//Net/LibIDN.pm line 213.
Compilation failed in require at -e line 1.
BEGIN failed--compilation aborted at -e line 1.

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/cpan.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index 2e9432c..957a6e2 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -26,13 +26,14 @@ cpan_do_configure () {
 			test -f $f2 || continue
 			sed -i -e "s:\(PERL_ARCHLIB = \).*:\1${PERL_ARCHLIB}:" \
 				-e 's/perl.real/perl/' \
+				-e "s/^\(CCFLAGS =.*\)/\1 ${CFLAGS}/" \
 				$f2
 		done
 	fi
 }
 
 cpan_do_compile () {
-	oe_runmake PASTHRU_INC="${CFLAGS}" CCFLAGS="${CFLAGS}" LD="${CCLD}"
+	oe_runmake PASTHRU_INC="${CFLAGS}" LD="${CCLD}"
 }
 
 cpan_do_install () {
-- 
1.7.7.6



