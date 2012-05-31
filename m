Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1Sa3Gy-0001KO-Gz
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 13:10:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4V7kE2s027420
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 May 2012 00:46:14 -0700 (PDT)
Received: from Xouyang-Ubuntu.corp.ad.wrs.com (128.224.162.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 31 May 2012 00:46:13 -0700
From: <xin.ouyang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2012 15:46:12 +0800
Message-ID: <1338450372-6802-1-git-send-email-xin.ouyang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] cpan.bbclass: Fix config error while patches to Makefile.PL
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
X-List-Received-Date: Thu, 31 May 2012 11:10:32 -0000
Content-Type: text/plain

From: Xin Ouyang <Xin.Ouyang@windriver.com>

If there is a patch to Makefile.PL, a Makefile.PL but no Makefile
will be placed in ${B}/.pc/xxx.patch/ after do_patch. 
And no Makefile will be generated for *this* Makefile.PL.
While do_configure, the original code tries to sed Makefiles
matching with each Makefile.PL in {B}, so this would fail.

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
---
 meta/classes/cpan.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index 587e688..2e9432c 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -23,6 +23,7 @@ cpan_do_configure () {
 		# Use find since there can be a Makefile generated for each Makefile.PL
 		for f in `find -name Makefile.PL`; do
 			f2=`echo $f | sed -e 's/.PL//'`
+			test -f $f2 || continue
 			sed -i -e "s:\(PERL_ARCHLIB = \).*:\1${PERL_ARCHLIB}:" \
 				-e 's/perl.real/perl/' \
 				$f2
-- 
1.7.9.5



