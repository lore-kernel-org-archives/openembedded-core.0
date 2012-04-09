Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SHE16-0006Y3-80
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 14:48:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q39Cd2XK010346
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Apr 2012 05:39:02 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 9 Apr 2012 05:39:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Apr 2012 20:38:51 +0800
Message-ID: <ed9fadef0aa71a1e9cd32330ec503ffb6e0a9be8.1333974508.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1333974508.git.liezhi.yang@windriver.com>
References: <cover.1333974508.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] git 1.7.7: remove perl.mak before compile
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
X-List-Received-Date: Mon, 09 Apr 2012 12:48:20 -0000
Content-Type: text/plain

The git may fail to rebuild when perl's Config.pm or config.h changes,
this is because Makefile detects that perl/perl.mak is out of date.
Remove perl.mak to let Makefile regenerate it would fix the error.
Both git and git-native have this problem.

To reproduce the error: (On x86_64 host)

$ bitbake git-native
$ touch tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/Config.pm
$ bitbake git-native -ccompile -f

[YOCTO #2156]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index be3831b..ce2f574 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -12,6 +12,12 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl --without-
 
 inherit autotools perlnative
 
+do_compile_prepend () {
+	# Remove perl/perl.mak to fix the out-of-date perl.mak error
+	# during rebuild
+	rm -f perl/perl.mak
+}
+
 do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
 		template_dir=${datadir}/git-core/templates \
-- 
1.7.1



