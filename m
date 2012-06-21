Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1Shbky-0000z3-7v
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 09:24:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5L7Dsc7025358
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 00:13:54 -0700 (PDT)
Received: from Xouyang-Ubuntu.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 21 Jun 2012 00:13:54 -0700
From: <xin.ouyang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 15:13:54 +0800
Message-ID: <1340262834-27560-1-git-send-email-xin.ouyang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] cpan.bbclass: Fix CCFLAGS.
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
X-List-Received-Date: Thu, 21 Jun 2012 07:24:46 -0000
Content-Type: text/plain

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
1.7.5.4



